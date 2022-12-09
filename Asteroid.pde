class Asteroid extends Floater{
  private double rotSpeed;
  private double vertexRadius;
  public Asteroid(){
    corners = (int)(Math.random()*7)+6;
    xCorners = new double[corners];
    yCorners = new double[corners];
   for (int i = 0; i < corners; i++) {
    vertexRadius = (int)(Math.random()*13)+10;
    xCorners[i] = vertexRadius* Math.cos(i*(2*PI/corners));
    yCorners[i] = vertexRadius* Math.sin(i*(2*PI/corners));
    }
    myColor = color(0); 
    myStroke = color(255);
    myCenterX = (int)(Math.random()*(width+1));
    myCenterY = (int)(Math.random()*(height+1));
    myXspeed = (Math.random()*2)-1;
    myYspeed = (Math.random()*2)-1;
    rotSpeed = (Math.random()*0.05);
    myPointDirection = Math.random()*2;
  }
  public void move(){
    turn(rotSpeed);
    super.move();
  }
  
  public float getX(){
   return (float)myCenterX;
 }
 
 public float getY(){
   return (float)myCenterY;
 }
 
  public float getRadius(){
   return (float)vertexRadius;
 }
 
 public void show(){
   super.show();
   strokeWeight(2);
 }
}

class ufo extends Asteroid{
  public ufo(){
    super();
    myColor = color(255,150,255); 
    corners = 0;
  }
  
  public void show(){
    strokeWeight(3);
    stroke(255);
    fill(255,150,255);
    beginShape();
    arc((float)myCenterX, (float)myCenterY,40,20,0,TWO_PI); // large ellipse
    arc((float)myCenterX, (float)myCenterY,50,4,0,TWO_PI); // long ellipse
    arc((float)myCenterX, (float)myCenterY-10,10,10,PI,TWO_PI); //small circle on the top
    endShape();
  }
}
