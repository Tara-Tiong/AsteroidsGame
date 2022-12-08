class Bullet extends Floater {
  public Bullet(Spaceship theShip) {
    myCenterX = theShip.getX();
    myCenterY = theShip.getY();
    myPointDirection = theShip.getPointDirection();
    myXspeed = theShip.getXspeed() + 3*Math.cos(myPointDirection * PI/180);
    myYspeed = theShip.getYspeed() + 3*Math.sin(myPointDirection * PI/180);
    accelerate(.6);
  }
  public void move() {
    myCenterX += myXspeed;    
    myCenterY += myYspeed;
  }
  public void show() {
    ellipse((float)myCenterX, (float)myCenterY, 5, 5);
  }
  public float getX() {return (float)myCenterX;}
  public float getY() {return (float)myCenterY;}
}
