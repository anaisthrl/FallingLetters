public class Map{
  
  //dimensions de la map
  public int m_ISizeX;
  public int m_ISizeY;
  //fenêtre principale
  public main sketch;
  //nombre maximum de lettre dans la map
  public int m_INbMaxOfLetters;
  
  //liste contenant les lettres présentent sur la map
  ArrayList<Letters>m_ALLetters = new ArrayList<Letters>();
  
  //constructeur
  Map(int x, int y, main m_sketch){
    m_ISizeX = x;
    m_ISizeY = y;
    this.sketch = m_sketch;
    m_INbMaxOfLetters = 2;
  }
  
  //...................méthodes........
  
  //dessin de la map
  public void drawMe(){
    sketch.rectMode(CENTER);
    sketch.rect(width, height, m_ISizeX, m_ISizeY);
  }
  
  //ajout d'une lettre à la map
  public void addElement(Letters letter){
    boolean isFind = false;
    for(int k=0; k<m_ALLetters.size(); k++){
      if(m_ALLetters.get(k).m_CLetter == letter.m_CLetter){
        isFind = true;
      }
    }
    if(!isFind)m_ALLetters.add(letter);
  }
  
  //suppression d'une lettre
  public void removeElement(Letters letter){
    m_ALLetters.remove(letter);
  }
  
  
  //calcul nbMax de lettre
  public void numberOfLetterCalculate(int level){
    if(level==1) sketch.m_ISizeBox = 70;
    
    if(level == 2){ 
      m_INbMaxOfLetters = 4;
      sketch.m_ISizeBox = 100;
    }
    
    if(level == 3){ 
      m_INbMaxOfLetters = 8;
      sketch.m_ISizeBox = 130;
    }
    
    if(level == 4){ 
      m_INbMaxOfLetters = 16;
      sketch.m_ISizeBox = 160;
    }
    
    if(level == 5){ 
      m_INbMaxOfLetters = 16;
      sketch.m_ISizeBox = 190;
    }
    
    if(level == 6){ 
      m_INbMaxOfLetters = 22;
      sketch.m_ISizeBox = 190;
    }
    
    if(level == 7){ 
      m_INbMaxOfLetters = 30;
      sketch.m_ISizeBox = 220;
    }
  }

}
