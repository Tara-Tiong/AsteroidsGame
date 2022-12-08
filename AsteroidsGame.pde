public boolean wPress, aPress, dPress, sPress, hPress;
Spaceship ship = new Spaceship();
Star[] koen = new Star[200];
ArrayList <Asteroid> soniA = new ArrayList<Asteroid>();
ArrayList <ufo> saw = new ArrayList<ufo>();
ArrayList <Bullet> joanne = new ArrayList<Bullet>();
public void setup(){
  size(700,700);
  for(int i =0; i < koen.length; i++)
    koen[i] = new Star();
  for(int i =0; i < 35; i++)
    soniA.add(i, new Asteroid());
  for(int i =0; i < 3; i++)
    saw.add(i, new ufo());
  wPress = aPress = sPress = dPress = hPress = false;
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
    for(int i =0; i<joanne.size(); i++){
      joanne.get(i).show();
      joanne.get(i).move();
      for(int j =0; j < soniA.size(); j++){
        for(int p = 0; p < saw.size(); p++){
          if(dist(joanne.get(i).getX(), joanne.get(i).getY(), soniA.get(j).getX(), soniA.get(j).getY()) < soniA.get(i).getRadius())
             soniA.remove(j);
          if(dist(joanne.get(i).getX(), joanne.get(i).getY(), saw.get(p).getX(), saw.get(p).getY()) < 50)
            saw.remove(p);
        }
      }
    }
    ship.show();
    ship.move();
    ship.decelerate();
    if(wPress)
      ship.accelerate(.2);
    if(aPress)
    ship.turn(-5);
    if(dPress)
    ship.turn(5);
    if(hPress)
    ship.hyperspace();
    if(sPress)
    ship.accelerate(-.2);
}

public void keyPressed(){
  if(key == 'w' || key == 'W')
   wPress = true;
  if(key == 'a' || key == 'A')
   aPress = true;
  if(key == 'd' || key == 'D')
   dPress = true;
   if(key == 's' || key == 'S')
   sPress = true;
   if(key == 'h' || key == 'H')
   hPress = true;
   if(key == ' ')
     joanne.add(new Bullet(ship));
}

public void keyReleased(){
    if(key == 'w' || key == 'W')
   wPress = false;
  if(key == 'a' || key == 'A')
   aPress = false;
  if(key == 'd' || key == 'D')
   dPress = false;
   if(key == 's' || key == 'S')
   sPress = false;
   if(key == 'h' || key == 'H')
   hPress = false;
  if(key == ' ')
    joanne.remove(new Bullet(ship));
}
