
PFont f;


void describeSystem(String name, int iterations, LSystem lSystem)
{
  String desc = name + " - " + iterations + " iterations\n" +
                "Start: " + lSystem.axiom + "\nRules : \n";
                
  for (Character id: lSystem.rules.keySet())
  {
     desc += "   " + id + "=" + lSystem.rules.get(id) +"\n";
  }              
   
  //desc += "Product: " +  lSystem.currentSystem;
  
  text(desc,20,20,980,980);
}



void sierpinskiTriangleExamples()
{  
  LSystem lSystem = new LSystem("F");
  lSystem.addRule('F',"G-F-G");
  lSystem.addRule('G',"F+G+F");
  
  // Example with 2 iterations
  resetMatrix();
  background(0);  
   
  lSystem.produce(2); 
  describeSystem("Sierpinski Triangle",2,lSystem);
  
  translate(width/2,height/2+150);
  lSystem.draw(80,60);
  
  save("st_it2.png");
  
  // Example with 4 iterations
  resetMatrix();
  background(0);  
   
  lSystem.produce(4); 
  describeSystem("Sierpinski Triangle",4,lSystem);
  
  translate(width/2-128,height/2+256);
  lSystem.draw(30,60);
  
  save("st_it4.png");
  
  
  // Example with 6 iterations
  resetMatrix();
  background(0);  
   
  lSystem.produce(6); 
  describeSystem("Sierpinski Triangle",6,lSystem);
  
  translate(width/2-200,height/2+256);
  lSystem.draw(10,60);
  
  save("st_it6.png");
  
  
  // Example with 8 iterations
  resetMatrix();
  background(0);  
   
  lSystem.produce(8); 
  describeSystem("Sierpinski Triangle",8,lSystem);
  
  
  translate(width/2-200,height/2+340);
  lSystem.draw(3,60);
  
  save("st_it8.png");
}



 
void setup()
{
  size(1024,1024);
  smooth();
  stroke(255);
  fill(96);
  f = createFont("Arial",16,true);
  textFont(f,16);
  
  
 sierpinskiTriangleExamples();
 
 
}
