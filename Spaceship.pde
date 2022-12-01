class Spaceship extends Floater  {
  public Spaceship(){
    corners = 9;
    xCorners = new int[]{-9, 9, 15, 9, -9, -9, -16, -16,-9, -9};
    yCorners = new int[]{6, 6, 0, -6, -6, -1, -6, 6, 1, 6};
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
