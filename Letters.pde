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
  private float[] m_TSpeeds = {1, 1.5, 2, 2.5, 3, 3.5, 4, 4.5 };
  private int m_ILevel;
  private int m_ISize;
  
  //constructeurs
  Letters(int level){
    m_PVPos.y = randomY();
    m_PVPos.x = randomX();
    m_CLetter = randomLetter();   
    m_couleur = color(randomColor());
    m_font = createFont("Arial", 20, true);
    m_FSpeed = randomSpeed();
    m_ISize = randomSize();
    m_ILevel = level; 
  }
  
  //constructeur final
  Letters(char lettre){
    m_PVPos.y = 50;
    m_CLetter = lettre;   
    m_couleur = color(randomColor());
    m_font = createFont("Arial", 20, true);
    m_FSpeed = 4;
    m_ISize = randomSize();
  }
  
  //.................méthodes..............................
  
  //mouvement de la lettre
  public void fall(){
    m_PVPos.y +=m_FSpeed;
  }
  
  public void endFall(int index){
    int x = 0;
    m_PVPos.x = x + ( index*10);
    while(m_PVPos.y != 200){
      m_PVPos.y +=m_FSpeed;
    }
  }
  
  //dessin de la lettre dans la fenêtre
  public void drawMe(){
    textFont(m_font, m_ISize);
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
  
  //choix d'une taille aléatoire
  private int randomSize(){
    int size = int(random(20,50));
    return size;
  }
  
  
}
