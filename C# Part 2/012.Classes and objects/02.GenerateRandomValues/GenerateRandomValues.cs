﻿using System;

class GenerateRandomValues
{
    //02.Write a program that generates and prints to the console 10 random values in the range [100, 200].
    static void Main()
    {

        Random rnd = new Random();
        for (int i = 0; i < 10; i++)
        {
            Console.WriteLine(rnd.Next(0,201));
        }
    }
}
