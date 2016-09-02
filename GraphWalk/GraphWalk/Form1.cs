using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace GraphWalk {
    public partial class Form1 : Form {
        public Form1() {
            InitializeComponent();
            createGraph();
        }
        public static void createGraph() {

        }


        // a point has a position and a list of immediately accessible nodes
        public struct graphPoint {
            public float x;
            public float y;
            public List<graphPoint> neighbors;

            public graphPoint(float x, float y, List<graphPoint> neighbors) {
                this.x = x;
                this.y = y;
                this.neighbors = neighbors;
            }
        }
        // edge keeps Euclidean distance between points as well as weight state
        public struct edge {
            public graphPoint start;
            public graphPoint finish;
            public float distance;
            public float weight;

            public edge(graphPoint start, graphPoint finish) {
                this.start = start;
                this.finish = finish;
                this.distance = (float)Math.Sqrt(Math.Pow((start.x - finish.x), 2.0f) + Math.Pow((start.y - finish.y), 2.0f));
                this.weight = 1f;
            }
        }
        public static void getNeighbor(graphPoint currPos, graphPoint lastPos) {
            //choose next node from neighbors, excluding previous node

            //  get random number
            //  get edge corresponding to each neighbor
            //      requires searching both starts and finishes, unless there is reliable sort
            //  compare weights of neighbor edges
        }

        public static void edgeWalk(edge walkEdge, bool neg, bool destReached) {
            //move and update weights

        }
        public static void edgeSort(edge newEdge) {
            // sort edge start and finish by points asc

            if (newEdge.finish.x < newEdge.start.x) {

                //switch
                graphPoint tempPoint = newEdge.finish;
                newEdge.finish = newEdge.start;
                newEdge.start = tempPoint;

                //(2,0) (3,0) keep
                //(3,0) (3,1) keep
                //(4,1) (4,0) switch
                //(3,1) (2,0) switch
                //(3,0) (2,1) switch
                //(2,0)
                //(2,1)
                //(3,1)
                //(3,2)

            }
            else if (newEdge.finish.x == newEdge.start.x) {
                //check y
                if (newEdge.finish.y < newEdge.start.y) {
                    graphPoint tempPoint = newEdge.finish;
                    newEdge.finish = newEdge.start;
                    newEdge.start = tempPoint;
                }

            }
        }
    }
}
