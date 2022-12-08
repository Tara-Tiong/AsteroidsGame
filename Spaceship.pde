class Spaceship extends Floater  {
  public Spaceship(){
    corners = 9;
    xCorners = new double[]{-10, 10, 16, 10, -10, -10, -17, -17,-10, -10};
    yCorners = new double[]{7, 7,1, -7, -7, -2, -7, 7, 2, 7};
    myColor = color(255,255,255);
    myCenterX = 700/2;
    myCenterY = 700/2;
    myPointDirection = 0;
    myXspeed = 0;
    myYspeed = 0;
  }

   public void hyperspace(){
     myCenterX = (int)(Math.random()*600)+1;
     myCenterY = (int)(Math.random()*600)+1;
     myPointDirection = (int)(Math.random()*360)+1;
   }

   public float getX(){
     return (float)myCenterX;
   }
   
   public float getY(){
     return (float)myCenterY;
   }
   
   public void setXspeed(double x){
     myXspeed = x;
   }
   
   public void setYspeed(double y){
     myYspeed = y;
   }
   
   public void restart(){
     myCenterX = 300;
     myCenterY = 300;
     myPointDirection = 0;
   }
   
   public void decelerate(){
     myXspeed *= .98;
     myYspeed *= .98;
   }
}
