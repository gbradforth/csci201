package pa1;
import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.util.*;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonIOException;
import com.google.gson.JsonSyntaxException;

public class WristCuff {
	private ArrayList<TimefallShelter> shelterList;
	String fileName;
   
    public WristCuff(ArrayList<TimefallShelter> shelterList, String fileName) {
    	this.shelterList = shelterList;
    	this.fileName = fileName;
    }


    /**
     * List all available shelters within the min and max of supported Chiral frequencies
     */
    void listAllShelters(ArrayList<Integer> chiralFrequencies) {
    	int max = Collections.max(chiralFrequencies);
    	int min = Collections.min(chiralFrequencies);
    	
    	int count = 0;
    	String result = "";
    	
    	for(TimefallShelter shelter : shelterList)
    	{
    		if(shelter.getChiralFrequency() <= max && shelter.getChiralFrequency() >= min)
    		{
    			result += shelter.toString();
    			count++;
    			result += "\n";
    		}
    	}
    	System.out.println(count + " results");
    	System.out.println(result);
    }


    /**
     * Functions for:
     * Search for a shelter by Chiral frequency
     * Search for a shelter by name
     */
    public TimefallShelter findShelterFreq(int freq)
    {
    	for (TimefallShelter shelter : shelterList) {
    		if (shelter.getChiralFrequency() == freq)
    		{
    			System.out.println(shelter.toString());
    			return shelter;
    		}
    	}
    	System.out.println("That Chiral frequency does not exist.");
    	return null;
    }
    
    public TimefallShelter findShelterName(String name)
    {
    	for (TimefallShelter shelter : shelterList) 
    	{
    		if (shelter.getName().equals(name))
    		{
    			System.out.println(shelter.toString());
    			return shelter;
    		}
    	}
    	System.out.println("No such shelter...");
    	return null;
    }
    

    /**
     * Find an available shelter with the lowest supported Chiral frequency
     * @throws IOException 
     * @throws JsonIOException 
     */
    public TimefallShelter findShelter(ArrayList<Integer> chiralFrequencies) throws JsonIOException, IOException {
    	Collections.sort(shelterList);
    	TimefallShelter s = shelterList.get(0);
    	int temp = shelterList.indexOf(s);
    	while (temp < shelterList.size())
    	{
    		if (chiralFrequencies.contains(s.getChiralFrequency()))
    		{
    			if (s.getTimefall())
    			{
    				System.out.println("=== Chiral frequency " + s.getChiralFrequency() + " unstable, Chiral jump unavailable. ===");
    				System.out.println("=== Removing target shelter from the list of shelters and saving updated list to disk. ===");
    				shelterList.remove(temp);
    				save();
    			}
    			else
    			{
    				System.out.println("=== Matching timefall shelter found! ===");
    				System.out.println(s.toString());
    				return s;
    			}
    		}
    		if (temp + 1 < shelterList.size()) {
    			s = shelterList.get(temp + 1);
    		}
    		temp++;
    		
    	}
    	return null;
    }



    /**
     * Sort shelters by Chiral frequency
     * @throws IOException 
     * @throws JsonIOException 
     */
    public void sortShelters() throws JsonIOException, IOException 
    {
    	Collections.sort(shelterList);
    	save();
    	System.out.println("Shelters successfully sorted by Chiral frequency.");
    }

    /**
     * Saves the updated list of shelters to disk
     */
    public void save() throws JsonIOException, IOException 
    {
    	Gson gson = new GsonBuilder().setPrettyPrinting().create();
        String str = gson.toJson(shelterList);
        FileWriter writer = null;
        try 
        {
        	writer = new FileWriter("result.json");
        	writer.write(str);
        } 
        catch (IOException e) 
        {
            System.err.println(e.getMessage());
        } 
        writer.close();
    }
}

