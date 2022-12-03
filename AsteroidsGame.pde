Spaceship ship = new Spaceship();
Star[] koen = new Star[200];
ArrayList <Asteroid> soniA = new ArrayList<Asteroid>();
ArrayList <ufo> saw = new ArrayList<ufo>();
public void setup(){
  size(700,700);
  for(int i =0; i < koen.length; i++)
    koen[i] = new Star();
  for(int i =0; i < 35; i++)
    soniA.add(i, new Asteroid());
  for(int i =0; i < 3; i++)
    saw.add(i, new ufo());
}

public void draw(){
  background(0);
  for(int i =0; i<koen.length; i++)
     koen[i].show();
  for(int i =0; i<soniA.size(); i++){
     soniA.get(i).show();
     soniA.get(i).move();
     if(dist(ship.getX(), ship.getY(), soniA.get(i).getX(), soniA.get(i).getY()) <= 30)
       soniA.remove(i);
  }
  for(int i =0; i<saw.size(); i++){
   saw.get(i).show();
   saw.get(i).move();
     if(dist(ship.getX(), ship.getY(), saw.get(i).getX(), saw.get(i).getY()) <= 30)
       saw.remove(i);
}
  
  
  ship.show();
  ship.move();
  ship.decelerate();
}

public void keyPressed(){
  if(key == 'w')
  ship.accelerate(.2);
  //ship.move();
  if(key == 'a')
  ship.turn(-15);
  if(key == 'd')
  ship.turn(15);
  if(key == 'h')
  ship.hyperspace();
  if(key == 's')
  ship.accelerate(-.2);
}
