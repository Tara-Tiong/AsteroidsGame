class Star //note that this class does NOT extend Floater
{
  private int myX, myY;
  Star() {
    myX = (int)(Math.random()*500);
    myY = (int)(Math.random()*500);
  }
  public void show(){
    fill((int)(Math.random()*255),(int)(Math.random()*100), (int)(Math.random()*255));
    noStroke();
    ellipse(myX, myY, 3, 3);
  }
}
