class Star //note that this class does NOT extend Floater
{
  private int myX, myY;
  Star() {
    myX = (int)(Math.random()*700);
    myY = (int)(Math.random()*700);
  }
  public void show(){
    fill((int)(Math.random()*255),(int)(Math.random()*100), (int)(Math.random()*255));
    noStroke();
  //  ellipse(myX, myY, 3, 3);
  //}
  
  //public void star(float x, float y, float radius1, float radius2, int npoints) {
  float angle = TWO_PI / 5;
  float halfAngle = angle/2.0;
  beginShape();
  for (float a = 0; a < TWO_PI; a += angle) {
    float sx = myX + cos(a) * 5;
    float sy = myY + sin(a) * 5;
    vertex(sx, sy);
    sx = myX + cos(a+halfAngle) * 1;
    sy = myY + sin(a+halfAngle) * 1;
    vertex(sx, sy);
  }
  endShape(CLOSE);
  }
}
