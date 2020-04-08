int m_IScore;
int m_ILevel;
int m_ISizeBox;
boolean m_BLoose;
PVector m_PVPosFinalText = new PVector();
color buttonHighlight;


Map map;

void setup(){ 
  size(900,1200);
  map = new Map(width*2,height*2,this);
  
  //parameters
  m_IScore = 0;
  m_ILevel = 1;
  m_ISizeBox = 70;
  m_BLoose = false;
  m_PVPosFinalText.x = (width/2)-100;
  m_PVPosFinalText.y = height/2 -100;
  buttonHighlight = color(177, 203, 203);
  //ajout des max premières lettres
  createFirstLetters();
  
}

void draw(){
  background(34, 66, 124);
   
  //nombre de lettre
  map.numberOfLetterCalculate(m_ILevel);
  
  //gestion des lettres
  for(int i=0; i<map.m_ALLetters.size(); i++){
    //mouvement de la lettre
    map.m_ALLetters.get(i).fall();
    map.m_ALLetters.get(i).drawMe();
    
    //suppression de la lettre arrivée en bas / Perte du joueur
    if(map.m_ALLetters.get(i).m_PVPos.y >= height-m_ISizeBox){  
      m_BLoose = true;
    } 
    
    //intéraction avec le joueur
    playerInteraction();
  }
  
  if(m_BLoose == true)end();
  
  //rectangle du haut
  fill(119, 181, 254);
  rect(0,0,width, 70);
  
  //rectangle du bas
  rect(0,height-m_ISizeBox,width, m_ISizeBox);
  
  //score et niveau
  fill(0);
  PFont font = createFont("Arial", 16, true);
  textFont(font, 36);
  text("Score : " + m_IScore, 20,50);
  text("Level : " + m_ILevel, width-200, 50); 
  
  calculateLevel();

  //tant qu'on a pas le nombre maximum de lettre sur la map
  if(map.m_ALLetters.size()<map.m_INbMaxOfLetters){
    Letters letter = new Letters(m_ILevel);
    map.addElement(letter);
  }
   
}
  
  //calcul du niveau
  private void calculateLevel(){

    if(m_IScore >= 5) m_ILevel = 2;
    if(m_IScore >= 10) m_ILevel = 3;
    if(m_IScore >= 20) m_ILevel = 4;
    if(m_IScore >= 40) m_ILevel = 5;
    if(m_IScore >= 60) m_ILevel = 6;
    if(m_IScore >= 80) m_ILevel = 7;
  }
  
  //intéraction avec le joueur
  private void playerInteraction(){     
    for(int i=0; i<map.m_ALLetters.size(); i++){
      if(keyPressed){
        if(key==map.m_ALLetters.get(i).m_CLetter || key== char(map.m_ALLetters.get(i).m_CLetter + 32)){
            map.removeElement(map.m_ALLetters.get(i));
            m_IScore ++;
        }
      }
    }
  }
  
  //ajout des max premières lettres
  private void createFirstLetters(){
    for(int i=0; i<map.m_INbMaxOfLetters; i++){
      Letters letter = new Letters(m_ILevel);
      map.addElement(letter);
    }
  }
  
  private void end(){
    //on supprime tout
    for(int i=0; i<map.m_ALLetters.size(); i++){
      map.removeElement(map.m_ALLetters.get(i));
    }
    
    //texte qui tombe
    fill(randomColor());
    PFont font = createFont("Arial", 16, true);
    textFont(font, 36);
    text("YOU LOOSE", m_PVPosFinalText.x, m_PVPosFinalText.y);
    
     //bouton replay
     if (overRect(width/2-200, height/2, width, height)) {
       fill(buttonHighlight);
     } else { 
       fill(119, 181, 254);
     }
     rect((width/2-200), (height/2), 400,100);
     fill(0);
     text("Replay",(width/2-50), (height/2+60));
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
  
  private boolean overRect(int x, int y, int width, int height)  {
    if (mouseX >= x && mouseX <= x+width && 
        mouseY >= y && mouseY <= y+height) {
      return true;
    } else {
      return false;
    }
  }
  
  void mousePressed() {
    if (overRect(width/2-200, height/2, width, height)) {
      setup();
    }
  }
