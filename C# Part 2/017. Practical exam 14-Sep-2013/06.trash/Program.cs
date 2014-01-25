﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

class MovingLetters
{
    static StringBuilder[] SeparateWords(string input)
    {
        string[] strWords = input.Split(new char[] { ' ' }, StringSplitOptions.RemoveEmptyEntries);

        StringBuilder[] words = new StringBuilder[strWords.Length];

        for (int i = 0; i < words.Length; i++)
        {
            words[i] = new StringBuilder();
            words[i].Append(strWords[i]);
        }

        return words;
    }

    static StringBuilder ExtractLetters(string input)
    {
        string[] strWords = input.Split(new char[] { ' ' }, StringSplitOptions.RemoveEmptyEntries);

        StringBuilder[] words = new StringBuilder[strWords.Length];

        int length = 0;
        int[] ind = new int[words.Length];

        for (int i = 0; i < words.Length; i++)
        {
            words[i] = new StringBuilder();
            words[i].Append(strWords[i]);
            length += words[i].Length;
            ind[i] = words[i].Length - 1;
        }


        StringBuilder result = new StringBuilder();
        int tempLength = 0;

        while (tempLength < length)
        {
            for (int i = 0; i < words.Length; i++)
            {
                if (ind[i] >= 0)
                {
                    string w = words[i].ToString();
                    result.Append(w[ind[i]]);
                    ind[i]--;
                    tempLength++;
                }

            }
        }

        return result;
    }

    static StringBuilder Move(StringBuilder input)
    {
        for (int i = 0; i < input.Length; i++)
        {
            StringBuilder newStr = new StringBuilder();
            char currChar = input[i];
            int newPosition;

            if (char.IsLower(currChar))
            {
                newPosition = (int)currChar - 96 + i;
                newPosition = newPosition % input.Length;
            }
            else
            {
                newPosition = (int)currChar - 64 + i;
                newPosition = newPosition % input.Length;
            }

            input.Remove(i, 1);
            input.Insert(newPosition, currChar);
        }

        return input;
    }




    static void Main()
    {
        string input = Console.ReadLine();

        StringBuilder str = ExtractLetters(input);

        StringBuilder moved = Move(str);

        Console.WriteLine(moved);
    }
}
