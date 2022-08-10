package pa1;
import java.io.FileNotFoundException;
import java.util.Collections;

public class TimefallShelter implements Comparable<TimefallShelter> {
	/**
	 * Here: all the needed class members and their getters and setters
	 */
	private int chiralFrequency;
	private Boolean timefall;
	private String guid;
	private String name;
	private String phone;
	private String address;
	
	public TimefallShelter(int chiralFrequency, Boolean timefall, String guid, String name, 
			String phone, String address)
	{
		this.chiralFrequency = chiralFrequency;
		this.timefall = timefall;
		this.guid = guid;
		this.name = name;
		this.phone = phone;
		this.address = address;
	}
	
	public int getChiralFrequency() {return chiralFrequency;}
	public Boolean getTimefall() {return timefall;}
	public String getGuid() {return guid;}
	public String getName() {return name;}
	public String getPhone() {return phone;}
	public String getAddress() {return address;}
	

	/**
	 * overriding comparator for sorting
	 */

	@Override
	public int compareTo(TimefallShelter compShelter) {
		/* For Ascending order*/
		if(compShelter.getChiralFrequency() == chiralFrequency)
		{
			return 0;
		}
		else if (compShelter.getChiralFrequency() >= chiralFrequency)
		{
			return -1;
		}
		else 
		{
			return 0;
		}
	}

	/**
	 * String representation of a shelter
	 */
	@Override
	public String toString() {
		String result = "Shelter information: \n";
		result += "- Chiral frequency: " + chiralFrequency + "\n";
		result += "- Timefall: ";
		if (timefall) {result += "Current \n";}
		else {result += "None \n";}
		result += "- GUID: " + guid + "\n";
		result += "- Name: " + name + "\n";
		result += "- Phone: " + phone + "\n";
		result += "- Address: " + address + "\n";
		return result;
	}
}
