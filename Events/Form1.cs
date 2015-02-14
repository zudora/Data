using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Diagnostics;
using System.IO;

namespace Events
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();

            string[] lines = File.ReadAllLines(@"C:\Users\Betsy\Desktop\Events.csv");

            var traces = new Dictionary<string, Trace>();
            var pairDict = new Dictionary<string, Pair>();
            List<string> allActs = new List<string>();

            for (int i = 0; i < lines.Length; i++)
            {
                //update string breaking
                int comma = lines[i].IndexOf(",");
                string id = lines[i].Substring(0, comma);                
                int comma2 = lines[i].IndexOf(",", comma + 1);
                string readTime = lines[i].Substring(comma + 1, comma2 - comma - 1);
                DateTime timeStamp = Convert.ToDateTime(readTime);
                string activity = lines[i].Substring(comma2 + 1, lines[i].Length - comma2 - 1);
                if (!allActs.Contains(activity))
                {
                    allActs.Add(activity);
                }
                Event eventLine = new Event(id, timeStamp, activity);
                
                //test to see if trace is in dictionary
                if (traces.ContainsKey(id))
                {
                    Trace t = traces[id];
                    t.addEvent(eventLine);
                    //Debug.WriteLine("Updated trace: " + eventLine.id);
                }

                else
                {
                    Trace t = new Trace(eventLine);
                    traces.Add(eventLine.id, t);
                    //Debug.WriteLine("New trace: " + eventLine.id);
                }
            }
            string[,] footprint = new string[allActs.Count, allActs.Count];
            List<string> startList = new List<string>();
            List<string> endList = new List<string>();

            for (int i = 0; i < allActs.Count; i++)
            {
                for (int j = 0; j < allActs.Count; j++)
                {
                    footprint[i, j] = "#";
                }
            }

            foreach (var key in traces.Keys)
            {
                Trace t = traces[key];
                for (int i = 0; i < t.actList.Count; i++)
                {
                    string firstAct = t.actList[i];

                    //note that this only works when there is more than one value in a trace
                    if (i == t.actList.Count - 1)
                    {
                        //found an ending value. Doesn't need to be added to footprint since it doesn't have a follower
                        //follower adds cover both directions
                        if(!endList.Contains(firstAct))
                        {
                            endList.Add(firstAct);
                        }                            
                    }

                    else
                    {
                        if (i == 0 & !startList.Contains(firstAct))
                        {
                            //found a starting value
                            startList.Add(firstAct);
                        }
                        //mark activity and follower in array

                        string secondAct = t.actList[i + 1];

                        int firstInd = allActs.IndexOf(firstAct);
                        int secondInd = allActs.IndexOf(secondAct);

                        if (footprint[firstInd, secondInd] == "<")
                        {
                            footprint.SetValue("||", firstInd, secondInd);
                            footprint.SetValue("||", secondInd, firstInd);
                        }
                        else
                        {
                            footprint.SetValue(">", firstInd, secondInd);
                            footprint.SetValue("<", secondInd, firstInd);
                        }
                    }
                }
            }

            //print out footprint to check it            
            for (int j = 0; j < footprint.GetLength(0); j++)
            {
                string row = "";
                string header = "\t\t";
                for (int k = 0; k < footprint.GetLength(1); k++)
                {
                    //Debug.WriteLine(allActs[j] + "-" + allActs[k] + footprint[j, k]);
                    row += footprint[j, k] + "\t\t";
                    header += allActs[k] + "\t";
                }
                if (j == 0)
                {
                    Debug.WriteLine(header);
                }
                Debug.WriteLine(allActs[j] + ": " + row);
            }


            //Ordered Pairs
            //go through matrix
            //add each event as first element of pair
            //second element is list of 0 or more following elements
            //ignore back relations

            List<Pair> ordered = new List<Pair>();

            //check starting values
            //if there is only one one start/end value, use it
            //else create false node
            string startNode = extreme(startList, pairDict, ordered, 0);
            string endNode = extreme(endList, pairDict, ordered, 1);
            
            for (int x = 0; x < footprint.GetLength(0); x++)
            {
                for (int y = 0; y < footprint.GetLength(1); y++)
                {
                    if (footprint[x,y] == ">" || footprint[x,y] == "||")
                    {
                        string firActName = allActs[x];
                        string secActName = allActs[y];
                        string testpair = (firActName + ", " + secActName);                        
                        pairCheck(firActName, secActName, pairDict, ordered);
                    }

                    if (footprint[x, y] == "||")
                    {
                        //for parallel activities, add reverse pair
                        string firActName = allActs[y];
                        string secActName = allActs[x];
                        string testpair = (firActName + ", " + secActName);
                        pairCheck(firActName, secActName, pairDict, ordered);
                    }
                }
            }

            //print pairs
            Debug.WriteLine("");
            foreach (var pair in pairDict)
            {
                string nodeList = "";
                foreach (string node in pair.Value.nodeList)
                {
                    if (nodeList == "")
                    {
                        nodeList += node;
                    }
                    else
                    {
                        nodeList = (nodeList + ", " + node);
                    }
                }
                Debug.WriteLine("{" + pair.Value.firstNode + ", [" + nodeList + "]}");
            }            
    
            
        }

    public static string extreme(List<String>extremeList, Dictionary<string, Pair> pairDict, List<Pair> ordered, int end)
    {
        string extreme = "";

        if (extremeList.Count == 0)
        {
            //something went wrong
        }
        else if (extremeList.Count == 1)
        {
            extreme = extremeList[0];
        }
        else
        {
            if (end == 1)
            {
                extreme = "dummy end";
            }
            else
            {                
                extreme = "dummy start";
            }
            
            foreach (string node in extremeList)
            {
                string firstNode;
                string secondNode;
                if (end == 1) 
                { 
                    firstNode = node;
                    secondNode = extreme;
                }
                else 
                { 
                    firstNode = extreme;
                    secondNode = node;
                }
                Debug.WriteLine(node);
                pairCheck(firstNode, secondNode, pairDict, ordered);
            }
        }

        return extreme;
    }

    public static void pairCheck(string firActName, string secActName, Dictionary<string, Pair> pairDict, List<Pair>ordered)
    {
        if (pairDict.ContainsKey(firActName))
        {
            //pair exists. Add to it
            //Debug.WriteLine("Pair starting with " + firActName + " exists");
            if (!pairDict[firActName].nodeList.Contains(secActName))
            {                
                pairDict[firActName].nodeList.Add(secActName);          
                foreach (string val in pairDict[firActName].nodeList)
                {
                    Debug.Write(val + " ");
                }                
            }
        }
        else
        {
            //create new pair
            Pair newPair = new Pair(firActName, secActName);
            ordered.Add(newPair);
            pairDict.Add(newPair.firstNode, newPair);
        }
    }
}
    public class Event
    { 
        //Each line in the event log is an Event. It has at least a timestamp, an ID, and an activity.
        public string id;
        public DateTime timeStamp;
        public string activity;

        public Event(string inId, DateTime inTimeStamp, string inActivity)
        {
            id = inId;
            timeStamp = inTimeStamp;
            activity = inActivity;
        }
    }

    public class Trace
    {
        //Events with the same ID go in a Trace.

        public string id;
        public List<DateTime> tsList = new List<DateTime>();
        public List<string> actList = new List<string>();
        public List<Event> eventList = new List<Event>();

        public Trace(Event inEvent)
        {
            id = inEvent.id;
            tsList.Add(inEvent.timeStamp);
            actList.Add(inEvent.activity);
            eventList.Add(inEvent);
        }

        public void addEvent(Event inEvent)
        {
            int addIndex = tsList.Count;

            for (int i = 0; i < tsList.Count; i++)
            {             
                if (inEvent.timeStamp < tsList[i])
                {
                    addIndex = i;
                    break;
                }
            }
           
            tsList.Insert(addIndex, inEvent.timeStamp);
            actList.Insert(addIndex, inEvent.activity);
            eventList.Insert(addIndex, inEvent);

            //Debug.WriteLine("actList after: ");
            //Debug.WriteLine(string.Join(", ", actList.ToArray()));
        }
    }

    public class Pair
    {
        public string firstNode;
        public List<string> nodeList;

        public Pair(string fNode, string secondNode)
        {
            nodeList = new List<string>();
            firstNode = fNode;
            nodeList.Add(secondNode);
        }
    }

    public class Trans
    {
        public string name;
        public List<Place> inputs;
        public List<Place> outputs;
       
        public Trans(string inName, List<Place> inInputs, List<Place>inOuputs)
        {
            name = inName;
            inputs = inInputs;
            outputs = inOuputs;
        }
    }

    public class Place
    {
        public string name;

        public Place(string inName)
        {
            name = inName;
        }
    }

}
