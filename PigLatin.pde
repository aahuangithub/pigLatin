import java.util.*;
public final static String[] VOWELS = {"a", "e", "i", "o", "u", "A", "E", "I", "O", "U"};
ArrayList<String> linesWords = new ArrayList<String>();
ArrayList<String> linesPunc = new ArrayList<String>();
ArrayList<Character> LETTERS = new ArrayList<Character>();

public void setup() {
	String lettersString = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";
	for(int i = 0; i<lettersString.length();i++) 
		LETTERS.add(lettersString.charAt(i));

	String[] allLines = loadStrings("LowellHymn.txt");
	for (String s:allLines){
		splitString(s);
		linesPunc.set(linesPunc.size()-1,linesPunc.get(linesPunc.size()-1)+"\n");
	}
	for (int i = 0 ; i < linesWords.size(); i++) {
	  System.out.print(pigLatin(linesWords.get(i))+linesPunc.get(i)+" ");
	}
	println("");
}
public void draw(){}

public int findFirstVowel(String sWord){
	for(int i = 1; i<=sWord.length(); i++)
		for(String v:VOWELS)	
			if(sWord.substring(i-1, i).equals(v))
				return i-1;
	return -1;
}

public String pigLatin(String sWord){
	if(findFirstVowel(sWord) == -1)
		return sWord + "ay";
	else
		return sWord.substring(findFirstVowel(sWord), sWord.length())+sWord.substring(0,findFirstVowel(sWord))+"ay";
}
public boolean isLetter(char ch){
	for(char c:LETTERS){
		if(ch==c){
			return true;
		}
	}
	return false;
}

public void splitString(String s){
	String temp="";
	String tempPunc="";
	for(int i=0; i<s.length();i++){
		if(s.charAt(i)==' '){
			linesWords.add(temp);
			linesPunc.add(tempPunc);
			tempPunc="";
			temp="";
		}	
		else if(isLetter(s.charAt(i))){
			temp+=s.charAt(i);
		}
		else{
			tempPunc+=s.charAt(i);
		}
	}

}