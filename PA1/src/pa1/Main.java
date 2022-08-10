package pa1;
import java.io.*;
import java.util.*;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonElement;
import com.google.gson.JsonIOException;
import com.google.gson.JsonParseException;
import com.google.gson.reflect.TypeToken;
import java.util.ArrayList;
import java.util.Scanner;

public class Main {

/*
 * Issues: 
 * altering json file in save()
 * 
 */
	private static Scanner scan = new Scanner(System.in);
	
	
	/**
	 * Uses GSON to read the file inputed by the user
	 */
	private static String readFile(String fileName) {
		File file = new File(fileName); 
		while(!file.exists())
		{
			System.out.print("Invalid file! Please provide timefall shelter data source: ");
			fileName = scan.nextLine();
			file = new File(fileName);
		}
		Scanner sc = null;
		try {
			sc = new Scanner(file);
		} catch (FileNotFoundException e) {
			System.err.print(e.getMessage());
			System.out.print("Invalid file. Please provide timefall shelter data source: ");
			fileName = scan.nextLine();
			file = new File(fileName);
		}
		String temp = "";
		while(sc.hasNextLine())
		{
			temp += sc.nextLine();
		}
		sc.close();
		return temp;
		
	}
	
	private static ArrayList<TimefallShelter> parseString(String par) throws JsonIOException, IOException
	{		
		Gson gson = new Gson();
		TimefallShelter[] shelters = null;
		try {
			shelters = gson.fromJson(par, TimefallShelter[].class);
		}
		catch (JsonIOException e)
		{
			System.err.print(e.getMessage());
			System.out.print("Invalid file! Please provide timefall shelter data source: ");
			return parseString(readFile(scan.nextLine()));
		}
		catch(JsonParseException er)
		{
			System.err.print(er.getMessage());
			System.out.print("Invalid file! Please provide timefall shelter data source: ");
			return parseString(readFile(scan.nextLine()));
		}
		
		ArrayList<TimefallShelter> result = new ArrayList<TimefallShelter>();
		
		for (TimefallShelter shelter : shelters)
		{
			if (shelter.getTimefall() == null || shelter.getGuid() == null
					|| shelter.getName() == null || shelter.getPhone() == null || shelter.getAddress() == null)
			{
				System.out.print("Invalid file format! Please provide timefall shelter data source: ");
				return parseString(readFile(scan.nextLine()));
			}
			result.add(shelter);
		}
		return result;
	}

	/**
	 * Gets the supported chiral frequencies from the user
	 */
	private static ArrayList<Integer> setSupportedFrequencies() {
		System.out.print("Please provide supported Chiral frequencies: ");
		ArrayList<Integer> freqList = new ArrayList<Integer>();
		
		String[] nums = scan.nextLine().split(",");
		
		for (String num : nums)
		{
			
			try 
			{
				if (Integer.parseInt(num) < 0)
				{
					System.out.print("Invalid frequency. ");
					return setSupportedFrequencies();
				}
				freqList.add(Integer.parseInt(num));
			}
			catch (NumberFormatException e)
			{
				System.err.println(e.getMessage());
				return setSupportedFrequencies();
			}
		}
		
		return freqList;
	}


	/**
	 * Prints the option menu
	 */
	private static Integer displayOptions() {
		System.out.print(
				"\n\t1) List all available shelters within the min and max of supported Chiral frequencies\n"
				+ "\t2) Search for a shelter by Chiral frequency\n"
				+ "\t3) Search for a shelter by name\n"
				+ "\t4) Sort shelters by Chiral frequency\n"
				+ "\t5) Jump to a shelter with the lowest supported Chiral frequency" 
				+ "\n Choose an option: "
		);

		if (scan.hasNextLine())
		{
			String choice = scan.nextLine();
			try {
				return Integer.parseInt(choice);
			}
			catch (NumberFormatException e)
			{
				return 0;
			}
		}
		return 0;
		
	}


	public static void main(String[] args) throws JsonIOException, IOException {
		Scanner scan = new Scanner(System.in);
		System.out.println("Welcome to Bridges Link.");
		System.out.print("Please provide timefall shelter data source: ");
		String file = scan.nextLine();
		
		WristCuff wc = new WristCuff(parseString(readFile(file)), file);
		ArrayList<Integer> freqList = setSupportedFrequencies();
		Collections.sort(freqList);
		
		int request = displayOptions();
		while (request != 5)
		{
			if (request == 1)
			{
				wc.listAllShelters(freqList);
			}
			else if (request == 2)
			{
				TimefallShelter shelter = null;
				while (shelter == null) 
				{
					System.out.print("What Chiral frequency are you looking for? ");
					shelter = wc.findShelterFreq(Integer.parseInt(scan.nextLine()));
				}
			}
			else if (request == 3)
			{
				TimefallShelter shelter = null;
				while(shelter == null)
				{
					System.out.print("What shelter’s name are you looking for? ");
					shelter = wc.findShelterName(scan.nextLine());
				}
				
			}
			else if (request == 4)
			{
				wc.sortShelters();
			}
			else
			{
				System.out.println("Invalid choice!");
			}
			request = displayOptions();
			
		}
		
		System.out.println("=== Commencing timefall shelter search ===");
		
		
		if (wc.findShelter(freqList) == null)
		{
			System.out.println("=== No shelter available. You are DOOMED. ===");
		}
		else
		{
			System.out.println("=== Commencing Chiral jump, see you in safety. ===");
		}
		scan.close();
		
	}
}
