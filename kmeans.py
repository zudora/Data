import matplotlib.pyplot as plt
import numpy as np
import random

# The centroid of a finite set of {k} points x_1, x_2,...x_k in R^n is

# C = (x_1+ x_2 + ... + x_k) / k

# This point minimizes the sum of squared Euclidean distances between itself and each point in the set.

def showPlot():

	plt.scatter(xlist, ylist, c = "k")
	for centroid in centArr:

		plt.scatter(centroid.X, centroid.Y, s=50, c = "y")
	plt.show()

def firstCent(xmin, xmax, ymin, ymax):

	centX = random.randint(int(xmin), int(xmax))
	centY = random.randint(int(ymin), int(ymax))
	centPoint = point(centX, centY)
	print "Creating first centroid"
	print type(centPoint)
	return centPoint

def classify(centX, centY, xlist, ylist):

	print "nothing"

def getNewCent(centX, centY, xlist, ylist):

	print "nothing"

class point:

	def __init__(self, xcoord, ycoord):

		self.X = xcoord
		self.Y = ycoord
		print "creating point"

k = 1

xlist = [1.9, 2, 2.6, 3.1]
ylist = [2, 2.2, 3.1, 2.6]

pointArr = np.array([xlist, ylist])

centArr = np.array([])

print "centArr size: ", centArr.size

for kval in range(0, k):

	print "k value: ", kval
	centPt = firstCent(min(xlist), max(xlist), min(ylist), max(ylist))
	print type(centPt), centPt.X, centPt.Y
	centArr = np.append(centArr, centPt)

showPlot()

