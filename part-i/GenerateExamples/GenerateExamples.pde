
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


void treeA()
{  
  LSystem lSystem = new LSystem("F");
  lSystem.addRule('F',"F[+F]F[-F]F");
  
  // Example with 2 iterations
  resetMatrix();
  background(0);  
   
  lSystem.produce(5); 
  describeSystem("Tree A",5,lSystem);
  
  translate(width/2,height-150);
  lSystem.draw(2,25.7);
  
  save("tree_a.png");
}


void treeB()
{  
  LSystem lSystem = new LSystem("F");
  lSystem.addRule('F',"F[+F]F[-F][F]");
  
  // Example with 2 iterations
  resetMatrix();
  background(0);  
   
  lSystem.produce(5); 
  describeSystem("Tree B",5,lSystem);
  
  translate(width/2,height-150);
  lSystem.draw(10,20);
  
  save("tree_b.png");
}


void treeC()
{  
  LSystem lSystem = new LSystem("F");
  lSystem.addRule('F',"FF-[-F+F+F]+[+F-F-F]");
  
  // Example with 2 iterations
  resetMatrix();
  background(0);  
   
  lSystem.produce(4); 
  describeSystem("Tree C",4,lSystem);
  
  translate(width/2,height-150);
  lSystem.draw(10,22.5);
  
  save("tree_c.png");
}

void treeD()
{  
  LSystem lSystem = new LSystem("X");
  lSystem.addRule('X',"F[+X]F[-X]+X");
  lSystem.addRule('F',"FF");
  
  // Example with 2 iterations
  resetMatrix();
  background(0);  
   
  lSystem.produce(7); 
  describeSystem("Tree D",7,lSystem);
  
  translate(width/2,height-150);
  lSystem.draw(2,20);
  
  save("tree_d.png");
}


void treeE()
{  
  LSystem lSystem = new LSystem("X");
  lSystem.addRule('X',"F[+X][-X]FX");
  lSystem.addRule('F',"FF");
  
  // Example with 2 iterations
  resetMatrix();
  background(0);  
   
  lSystem.produce(7); 
  describeSystem("Tree E",7,lSystem);
  
  translate(width/2,height-150);
  lSystem.draw(2,25.7);
  
  save("tree_e.png");
}

void treeF()
{  
  LSystem lSystem = new LSystem("X");
  lSystem.addRule('X',"F-[[X]+X]+F[+FX]-X");
  lSystem.addRule('F',"FF");
  
  // Example with 2 iterations
  resetMatrix();
  background(0);  
   
  lSystem.produce(5); 
  describeSystem("Tree F",5,lSystem);
  
  translate(width/2,height-150);
  lSystem.draw(7,22.7);
  
  save("tree_f.png");
}



void animatedTree()
{  
  LSystem lSystem = new LSystem("X");
  lSystem.addRule('X',"F[+X]F[-X]+X");
  lSystem.addRule('F',"FF");
  
  
  int frameCount=0;
  
  
  for (int loop=0;loop< 7;loop ++)
  {
    lSystem.produce(loop);
    
    resetMatrix();
    background(0);  
     
     
    describeSystem("Tree D - Length: 3 Angle: 20",loop,lSystem);
    
    translate(width/2,height-150);
    lSystem.draw(3,20);
    
    save("anim/atree_" + nf(frameCount++,4) + ".png");
  }
  
  
  lSystem.produce(7);
  
  for (int loop=20;loop< 50;loop+=2)
  {
    
    
    resetMatrix();
    background(0);  
     
     
    describeSystem("Tree D - Length: 3 Angle: " + loop,7,lSystem);
    
    translate(width/2,height-150);
    lSystem.draw(3,loop);
    
    save("anim/atree_" + nf(frameCount++,4) + ".png");
  }
  
  for (int loop=50;loop> 5;loop-=2)
  {
    
    
    resetMatrix();
    background(0);  
     
     
    describeSystem("Tree D - Length: 3 Angle: " + loop,7,lSystem);
    
    translate(width/2,height-150);
    lSystem.draw(3,loop);
    
    save("anim/atree_" + nf(frameCount++,4) + ".png");
  }
}

 
void setup()
{
  size(1024,1024);
  smooth();
  stroke(255);
  fill(96);
  f = createFont("Arial",16,true);
  textFont(f,20);
  
  
 sierpinskiTriangleExamples();
 treeA();
 treeB();
 treeC();
 treeD();
 treeE();
 treeF();
 
 animatedTree();
}
