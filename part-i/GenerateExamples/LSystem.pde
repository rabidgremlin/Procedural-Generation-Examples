class LSystem
{
  String axiom;
  String currentSystem;
  
  HashMap<Character,String> rules = new HashMap<Character,String>();
  
  LSystem(String axiom)
  {
      this.axiom = axiom;
  }
  
  void addRule(Character id, String rule)
  {
      rules.put(id,rule);
  }
  
  void produce(int iterations)
  {
      println("axiom: " + axiom);
      
      
      println("rules: ");
      
      for (Character id: rules.keySet())
      {
          println("   " + id + "=" + rules.get(id));
      }      
      
      currentSystem = axiom;
      println("it: 0 = " + currentSystem);
      
      for (int loop=1; loop <= iterations; loop++)
      {
          String tempResult = "";
          
          for (int charLoop=0; charLoop < currentSystem.length(); charLoop++)
          {
            Character nextChar = currentSystem.charAt(charLoop);
            if (rules.containsKey(nextChar))
            {
                tempResult += rules.get(nextChar);
            }  
            else
            {
                tempResult+= nextChar;
            }
          }
          
          currentSystem= tempResult;
          println("it: " + loop + " = " + currentSystem);
      }
      
      println("Current System:" + currentSystem);
  }    
  
  void draw(int length, float angleInDegrees)
  {
    float angle = radians(angleInDegrees);
      
    for (int charLoop=0; charLoop < currentSystem.length(); charLoop++)
    {
      Character nextChar = currentSystem.charAt(charLoop);
      
      //println("$" + nextChar );
      switch (nextChar)
      {
          case 'G': // fall thru
          case 'F':                    
                     line(0,0,0,-length);
                     translate(0,-length);
                     //println("FWD");
                     break;  
                   
          case '-':
                     rotate(-angle );
                     //println("turn: " + (-angle));
                     break; 
                            
          case '+':
                     rotate(angle );
                     //println("turn: " + (+angle));
                     break;  
          case '[':
                     pushMatrix();
                     //println("push");
                     break;           
          case ']':
                     popMatrix();
                     //println("pop");
                     break;           
                     
          default:
              //print("?" + nextChar);                              
      }
    } 
  }
}
