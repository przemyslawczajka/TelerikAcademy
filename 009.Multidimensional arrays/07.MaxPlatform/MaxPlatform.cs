﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

class MaxPlatform
{
    //* Write a program that finds the largest area of equal neighbor elements in a rectangular matrix and prints its size. Example:
    static int counter = 0;

    static void FindLargestArea(int row, int col, int[,] arr, bool[,] counted, int lastElem)
    {
        //if current element is outside the array
        if (!(row >= 0 && row < arr.GetLength(0) && col >= 0 && col < arr.GetLength(1)))
        {
            return;
        }
        //if current element is visited
        if (counted[row, col] == true)
        {
            return;
        }
        //if current element is equal to last element
        if (arr[row, col] == lastElem)
        {
            counter++;
        }
        else
        {
            //do not go further
            return;
        }
        //mark current element as visited
        counted[row, col] = true;
        //recursively go on with every child element of the current element
        FindLargestArea(row - 1, col, arr, counted, arr[row, col]);
        FindLargestArea(row + 1, col, arr, counted, arr[row, col]);
        FindLargestArea(row, col + 1, arr, counted, arr[row, col]);
        FindLargestArea(row, col - 1, arr, counted, arr[row, col]);
    }

    static void Main()
    {
        //input
        int[,] arr = 
        {
            {1, 3, 2, 2, 2, 4},
            {3, 3, 3, 2, 4, 4},
            {4, 3, 1, 2, 3, 3},
            {4, 3, 1, 3, 3, 1},
            {4, 3, 3, 3, 1, 1},
        };
        bool[,] counted = new bool[arr.GetLength(0), arr.GetLength(1)];
        int maxCounter = int.MinValue;
        int maxElem = int.MinValue;

        //solution DFS
        for (int row = 0; row < arr.GetLength(0); row++)
		{
            for (int col = 0; col < arr.GetLength(1); col++)
            {
                // for every unvisited cell apply the recursive method
                if (counted[row, col] != true)
                {
                    counter = 0;
                    FindLargestArea(row, col, arr, counted, arr[row, col]);

                    //extract current counter if it is the greatest so far
                    if (counter >= maxCounter)
                    {
                        maxCounter = counter;
                        maxElem = arr[row, col];
                    }
                }
            }
        }

        Console.WriteLine("Max element: {0} \nMax counter: {1}", maxElem, maxCounter);
    }
}
