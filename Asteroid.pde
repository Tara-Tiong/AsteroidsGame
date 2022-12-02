class Asteroid extends Floater{
  public Asteroid(){
    corners = 6;
    xCorners = new int[]{(int)(Math.random()*3)-11,(int)(Math.random()*3)-5,(int)(Math.random()*3)-11,(int)(Math.random()*3)+6,(int)(Math.random()*3)+13,(int)(Math.random()*3)+7};
    yCorners = new int[]{(int)(Math.random()*3)-8,(int)(Math.random()*3),(int)(Math.random()*3)+8,(int)(Math.random()*3)+10,(int)(Math.random()*3),(int)(Math.random()*3)-8};
  }
}
