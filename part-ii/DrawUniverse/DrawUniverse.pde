int MAP_CENTER_X = 1920/2;
int MAP_CENTER_Y = 1080/2;
int GAL_CENTER_RADIUS = (512+256)/2;
int GAL_RADIUS = 256/2;
int NUM_GALAXIES = 8;
int SX = 0;
int SY = 1;

float[][] galaxyCenters = new float[NUM_GALAXIES][2];


Table universe;
Table universeCopy;

void calcGalaxyCenters()
{
 float radius=GAL_CENTER_RADIUS;
 float angle=-TWO_PI/(float)NUM_GALAXIES;

 for(int loop=0;loop<NUM_GALAXIES;loop++)
 {
   galaxyCenters[loop][SX] = radius*sin(angle*loop+radians(180)) +  MAP_CENTER_X;
   galaxyCenters[loop][SY] = radius*cos(angle*loop+radians(180)) +  MAP_CENTER_Y;   
 }
  
}

void drawSectors()
{
  noFill();
  stroke(18,18,18);
  ellipse(MAP_CENTER_X,MAP_CENTER_Y,GAL_CENTER_RADIUS*2,GAL_CENTER_RADIUS*2);
   
    
  for(int loop=0;loop<NUM_GALAXIES;loop++)
  {
    rect(galaxyCenters[loop][SX]-GAL_RADIUS, galaxyCenters[loop][SY]-GAL_RADIUS,GAL_RADIUS*2,GAL_RADIUS*2);   
  }
  
  
}


void drawStars()
{
  fill(255,255,255);
  noStroke();
  
  for (TableRow row : universe.rows()) 
  {
    
    int galaxyNum = row.getInt("galaxy_num")-1;
    int systemNum = row.getInt("system_num");
    String name = row.getString("name");
    int x = row.getInt("x");
    int y = row.getInt("y");
    int productivity = row.getInt("productivity");
    int economy_id = row.getInt("economy_id");
    int govtype_id = row.getInt("govtype_id");
    int techlev = row.getInt("techlev");
    int radius = row.getInt("radius");
    
    
    // use productivity as size
    float scale = (float)productivity / 9000;
    if (scale <1)
    {
      scale =1;
    }
    
    // tweak color based on gov type
    float c = (float)192+ 64.0/8*govtype_id;
    
    fill(c,c,c);
    
    // highlight LAVE
    if (galaxyNum == 0 && systemNum == 7)
    {
      fill(0,255,0);
      scale = 3;
    }
    
    ellipse(galaxyCenters[galaxyNum][SX]-GAL_RADIUS+x,galaxyCenters[galaxyNum][SY]-GAL_RADIUS+y,scale,scale);
  }  
}

void drawInfo()
{
  stroke(255,255,255);
  PFont font  = loadFont("AgencyFB-Bold-48.vlw");
  textFont(font, 48);


  textAlign(CENTER);
  text("Map of Elite's universe", MAP_CENTER_X, MAP_CENTER_Y);
  
  textFont(font, 12);
  text("https://github.com/rabidgremlin/Procedural-Generation-Examples", MAP_CENTER_X, MAP_CENTER_Y+30);
  
  textFont(font, 20);
  
  for(int loop=0; loop < 8; loop++)
  {
    text("Galaxy " + (loop+1) ,galaxyCenters[loop][SX],galaxyCenters[loop][SY]-GAL_RADIUS-5);  
  }
  //text("Galaxy 2",galaxyCenters[1][SX],galaxyCenters[1][SY]-GAL_RADIUS-5);
}

void drawJumpLanes()
{
  
  
  for (TableRow fromRow : universeCopy.rows()) 
  {    
    int fromGalaxyNum = fromRow.getInt("galaxy_num")-1;
    int fromSystemNum = fromRow.getInt("system_num");
    int fromX = fromRow.getInt("x");
    int fromY = fromRow.getInt("y");
    String fromName = fromRow.getString("name");
    
    print("------------------" + fromName);
    
     
    for (TableRow row : universe.rows()) 
    {      
      int galaxyNum = row.getInt("galaxy_num")-1;
      int systemNum = row.getInt("system_num");
      
      if ( galaxyNum == fromGalaxyNum && systemNum != fromSystemNum)
      {
        int x = row.getInt("x");
        int y = row.getInt("y");
        String name = fromRow.getString("name");
        
        // formula from txtelite code        
        float distance = 4 * sqrt(((fromX - x)*(fromX - x) + (fromY -y)*(fromY - y) / 4));
        
        if (distance <= 70)
        {
          println("Dist from " + fromName + " to " + name + " is " + distance);
          
          stroke(8,0,64,4);
          strokeWeight(40);
          line(galaxyCenters[galaxyNum][SX]-GAL_RADIUS+fromX,galaxyCenters[galaxyNum][SY]-GAL_RADIUS+fromY,galaxyCenters[galaxyNum][SX]-GAL_RADIUS+x,galaxyCenters[galaxyNum][SY]-GAL_RADIUS+y);
          
          stroke(0,0,128,64);
          strokeWeight(1);
          line(galaxyCenters[galaxyNum][SX]-GAL_RADIUS+fromX,galaxyCenters[galaxyNum][SY]-GAL_RADIUS+fromY,galaxyCenters[galaxyNum][SX]-GAL_RADIUS+x,galaxyCenters[galaxyNum][SY]-GAL_RADIUS+y);
        }
         
      }
    }
  }
  
}

void setup() {
    
  size(1920, 1080);
  background(0);
  noLoop();
  smooth(4);
  
  universe = loadTable("universe.csv", "header");
  universeCopy = loadTable("universe.csv", "header");
  
  calcGalaxyCenters();
  drawSectors();
  
  drawJumpLanes();

  drawStars();
  
  drawInfo();
 
  
  save("EliteUniverse.png"); 
}
