public class Letters{
  
  //fenêtre principale
  public main sketch;
  
  //position de la lettre
  protected PVector m_PVPos = new PVector();
  
  private char[] m_TLetters ={'A', 'B', 'C', 'D','E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z'};
  private char m_CLetter;
  private color m_couleur;
  private PFont m_font;
  private float m_FSpeed;
  private float[] m_TSpeeds = {0.9, 2, 2.8, 3.4, 4};
  private int m_ILevel;
  
  //constructeur
  Letters(int level){
    m_PVPos.y = randomY();
    m_PVPos.x = randomX();
    m_CLetter = randomLetter();   
    m_couleur = color(randomColor());
    m_font = createFont("Arial", 16, true);
    m_FSpeed = randomSpeed();
    
    m_ILevel = level; 
  }
  
  //.................méthodes..............................
  
  //mouvement de la lettre
  public void fall(){
    m_PVPos.y +=m_FSpeed;
  }
  
  //dessin de la lettre dans la fenêtre
  public void drawMe(){
    textFont(m_font, 36);
    fill(m_couleur);
    text(m_CLetter, m_PVPos.x, m_PVPos.y);
  }
  
  //choix aléatoire du x
  private int randomX(){
    int randomX = int(random(50,width-50));
    return randomX;
  }
  
  //choix aléatoire du y
  private int randomY(){
    int randomY = int(random(20,60));
    return randomY;
  }
  
  //choix aléatoire de la lettre
  private char randomLetter(){
    char randomChar;
    int indexRandom = int(random(0,25));
    randomChar = m_TLetters[indexRandom];
    return randomChar;
  }
  
  //choix aléatoire de la couleur
  private color randomColor(){
    color randomC;
    int a,b,c;
    
    a = int(random(0,255));
    b = int(random(0,255));
    c = int(random(0,255));
    
    if(color(a,b,c)==color(34, 66, 124)) randomColor();
    
    randomC = color(a,b,c);
    
    return randomC;
  }
  
  //choix aléatoire de la vitesse des lettres en fonction du niveau
  private float randomSpeed(){
    float randomS = random(m_TSpeeds[0], m_TSpeeds[m_ILevel]); 
    return randomS;
  }
  
  
}
