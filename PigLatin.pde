public final static Character[] VOWELS = {'a', 'e', 'i', 'o', 'u'};
ArrayList<String> linesWords = new ArrayList<String>();
ArrayList<String> linesPunc = new ArrayList<String>();
ArrayList<Character> LETTERS = new ArrayList<Character>();

public void setup() {
	String lettersString = "abcdefghijklmnopqrstuvwxyz";
	String[] allLines = loadStrings("LowellHymn.txt");
	for(int i = 0; i<lettersString.length();i++) 
		LETTERS.add(lettersString.charAt(i));
	for (String s:allLines){
		splitString(s);
		if(linesPunc.size()>0)
			linesPunc.set(linesPunc.size()-1,linesPunc.get(linesPunc.size()-1)+"\n");
	}
	for (int i = 0 ; i < linesWords.size(); i++) 
	  System.out.print(pigLatin(linesWords.get(i))+linesPunc.get(i)+" ");
	println("");
}
public void draw(){}

public int findFirstVowel(String sWord){
	for(int i = 0; i<sWord.length(); i++)
		for(char v:VOWELS)	
			if(Character.toLowerCase(sWord.charAt(i))==v)
				return i;
	return -1;
}

public String pigLatin(String sWord){
	boolean containsQu = (sWord.toLowerCase().contains("qu")?true:false);
	if(findFirstVowel(sWord) == -1)
		return sWord + "ay";
	else if (containsQu && findFirstVowel(sWord)>sWord.toLowerCase().indexOf("qu"))
		return (sWord.length()>2?(sWord.substring(2)+"quay"):("quay"));
	else
		return sWord.substring(findFirstVowel(sWord), sWord.length())+sWord.substring(0,findFirstVowel(sWord))+"ay";
}
public boolean isLetter(char ch){
	for(char c:LETTERS)
		if(Character.toLowerCase(ch)==c)
			return true;
	return false;
}

public void splitString(String s){
	String temp="";
	String tempPunc="";
	for(int i=0; i<s.length();i++){
		if(s.charAt(i)==' '){
			if(temp.length()>0){
				//checks to see if temp is not empty
				linesWords.add(temp);
				linesPunc.add(tempPunc);
			}
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