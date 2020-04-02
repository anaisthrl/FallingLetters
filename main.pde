int m_IScore;
int m_ILevel;
int m_ISizeBox;

Map map;

void setup(){ 
  size(900,1200);
  map = new Map(width*2,height*2,this);
  
  //parameters
  m_IScore = 0;
  m_ILevel = 1;
  m_ISizeBox = 70;
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
    
    //suppression de la lettre arrivée en bas
    if(map.m_ALLetters.get(i).m_PVPos.y >= height-m_ISizeBox){ 
      map.removeElement(map.m_ALLetters.get(i));
      setup();
    } 
    
    //intéraction avec le joueur
    playerInteraction();
  }
  
  //rectangle du haut
  fill(119, 181, 254);
  rect(0,0,width, 70);
  
  //rectangle du bas
  rect(0,height-m_ISizeBox,width, m_ISizeBox);
  
  //score et niveau
  fill(0);
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
  }
  
  //intéraction avec le joueur
  private void playerInteraction(){
    for(int i=0; i<map.m_ALLetters.size(); i++){
      if(keyPressed){
        if(key==map.m_ALLetters.get(i).m_CLetter || key== char(map.m_ALLetters.get(i).m_CLetter + 32)){
          m_IScore ++;
          map.removeElement(map.m_ALLetters.get(i));
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
  
