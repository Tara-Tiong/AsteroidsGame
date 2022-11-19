Spaceship ship = new Spaceship();
Star[] koen = new Star[200];
public void setup(){
  size(500,500);
  for(int i =0; i < koen.length; i++){
    koen[i] = new Star();
  }
}

public void draw(){
  background(0);
  for(int i =0; i<200; i++){
     koen[i].show();
  }
  ship.show();
  ship.move();
}

public void keyPressed(){
  if(key == 'w')
  ship.accelerate(.10);
  if(key == 'a')
  ship.turn(-20);
  if(key == 'd')
  ship.turn(20);
  if(key == 'h')
  ship.hyperspace();
  if(key == 's')
  ship.accelerate(-.10);
  if(key == 'e')
  ship.accelerate(-.1000);
}
