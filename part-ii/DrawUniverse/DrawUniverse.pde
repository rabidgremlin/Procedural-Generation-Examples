int MAP_CENTER_X = 512;
int MAP_CENTER_Y = 512;
int GAL_CENTER_RADIUS = (512+230)/2;
int GAL_RADIUS = 256/2;
int NUM_GALAXIES = 8;
int SX = 0;
int SY = 1;

float[][] galaxyCenters = new float[NUM_GALAXIES][2];


Table universe;

void calcGalaxyCenters()
{
 float radius=GAL_CENTER_RADIUS;
 float angle=TWO_PI/(float)NUM_GALAXIES;

 for(int loop=0;loop<NUM_GALAXIES;loop++)
 {
   galaxyCenters[loop][SX] = radius*sin(angle*loop) +  MAP_CENTER_X;
   galaxyCenters[loop][SY] = radius*cos(angle*loop) +  MAP_CENTER_Y;   
 }
  
}

void drawSectors()
{
  noFill();
  stroke(24,24,24);
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
    float scale = (float)productivity / 10000;
    
    // tweak color based on gov type
    float c = (float)255*0.5*govtype_id;
    
    fill(c,c,c);
    
    ellipse(galaxyCenters[galaxyNum][SX]-GAL_RADIUS+x,galaxyCenters[galaxyNum][SY]-GAL_RADIUS+y,scale,scale);
  }  
}

void drawInfo()
{
  stroke(255,255,255);
  PFont font  = loadFont("AgencyFB-Bold-48.vlw");
  textFont(font, 48);


  textAlign(CENTER);
  text("Map of Elite Universe", MAP_CENTER_X, MAP_CENTER_Y);
  
  textFont(font, 12);
  text("https://github.com/rabidgremlin/Procedural-Generation-Examples", MAP_CENTER_X, MAP_CENTER_Y+30);
}

void setup() {
    
  size(1024, 1024);
  background(0);
  
  universe = loadTable("universe.csv", "header");
  
  calcGalaxyCenters();
  drawSectors();
  

  drawStars();
  
  drawInfo();
 
  
  
  println(universe.getRowCount() + " total rows in table"); 

  for (TableRow row : universe.rows()) {
    
    int galaxyNum = row.getInt("galaxy_num");
    int systemNum = row.getInt("system_num");
    String name = row.getString("name");
    int x = row.getInt("x");
    int y = row.getInt("y");
       
    println(name + " (" + systemNum + ")");
  }
  
}
