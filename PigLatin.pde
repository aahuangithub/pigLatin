public final static Character[] VOWELS = {'a', 'e', 'i', 'o', 'u'};
ArrayList<String> linesWords = new ArrayList<String>();
ArrayList<String> linesPunc = new ArrayList<String>();

public void setup() {
	String[] allLines = loadStrings("hamlet.txt");

	for (String s:allLines){
		splitString(s);
		if(linesPunc.size()>0)
			linesPunc.set(linesPunc.size()-1,linesPunc.get(linesPunc.size()-1)+"\n");
	}
	for (int i = 0 ; i < linesWords.size(); i++) 
	  System.out.print(pigLatin(linesWords.get(i))+linesPunc.get(i));
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
	if(sWord.length()==0) return "";
	if(findFirstVowel(sWord) == -1)
		return sWord + "ay";
	else if (containsQu && findFirstVowel(sWord)>sWord.toLowerCase().indexOf("qu"))
		return (sWord.length()>2?(sWord.substring(2)+"quay"):("quay"));
	else
		return sWord.substring(findFirstVowel(sWord), sWord.length())+sWord.substring(0,findFirstVowel(sWord))+"ay";
}

public void splitString(String s){
	String tempS=s+" ";
	String temp="";
	for(int i=0; i<tempS.length();i++){
		if(Character.isLetter(tempS.charAt(i))||tempS.charAt(i)=='\'')
			temp+=tempS.charAt(i);
		else{
			linesWords.add(temp);
			linesPunc.add(Character.toString(tempS.charAt(i)));
			temp="";
		}
	}
}