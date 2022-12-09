public boolean wPress, aPress, dPress, sPress, hPress;
public boolean firstScreen, gameStart, gameEnd, gameWin;
Spaceship ship = new Spaceship();
Star[] koen = new Star[200];
ArrayList <Asteroid> soniA = new ArrayList<Asteroid>();
ArrayList <ufo> saw = new ArrayList<ufo>();
ArrayList <Bullet> joanne = new ArrayList<Bullet>();
public int health = 0;
public int count = 0;
public int bonusTime = 0;
public int interval = 1000;
public void setup(){
  frameRate(100);
  size(700,700);
  for(int i =0; i < koen.length; i++)
    koen[i] = new Star();
  for(int i =0; i < 35; i++)
    soniA.add(i, new Asteroid());
  for(int i =0; i < 3; i++)
    saw.add(i, new ufo());
  wPress = aPress = sPress = dPress = hPress = false;
  gameStart = false;
  gameEnd = false;
  firstScreen = true;
  gameWin = false;
}

public void draw(){
  if(firstScreen == true){
    background(0);
    textAlign(CENTER);
    textSize(40);
    fill(255, 155, 255);
    text("Click Here to Start!", width/2, height/2);
    if(mouseX >= 20 && mouseX <= 650 && mouseY >= 320 && mouseY <= 370)
      fill(0);
  }
  if(gameStart == true){
    background(0);
    //show stars
    for(int i =0; i<koen.length; i++)
       koen[i].show();
       
    //show asteroids + remove them when collides with ships
    for(int i =0; i<soniA.size(); i++){
       soniA.get(i).show();
       soniA.get(i).move();
       if(dist(ship.getX(), ship.getY(), soniA.get(i).getX(), soniA.get(i).getY()) <= 30){
         soniA.remove(i);
         health++;
      }
    }
    
    //show ufos + remove them when it collides with ships
    for(int i =0; i<saw.size(); i++){
     saw.get(i).show();
     saw.get(i).move();
       if(dist(ship.getX(), ship.getY(), saw.get(i).getX(), saw.get(i).getY()) <= 30){
         saw.remove(i);
         health++;
      }
    }
    
    // remove asteroids
    for(int i = 0; i < joanne.size(); i++){
       joanne.get(i).show();
       joanne.get(i).move();
      for(int j = 0; j < soniA.size(); j++){
        if(dist(joanne.get(i).getX(), joanne.get(i).getY(), soniA.get(j).getX(), soniA.get(j).getY()) < soniA.get(j).getRadius()){
          joanne.remove(i);
          soniA.remove(j);
          count++;
          break;
        }
      }
    }
    
    // remove ufos
    for(int i = 0; i < joanne.size(); i++){
      for(int p = 0; p < saw.size(); p++){
        if(dist(joanne.get(i).getX(), joanne.get(i).getY(), saw.get(p).getX(), saw.get(p).getY()) < 50){
          joanne.remove(i);
          saw.remove(p);
          count+=2;
          bonusTime = millis();
          
          break;
        }
      }
    }
      if(millis() - bonusTime < interval){
        textAlign(CENTER);
        text("Kill the aliens! +2", width/2, height/2);
      }  
    //Points text
    textSize(30);
    fill(255, 150, 255);
    text("Points: " + count, 60, 50); //Points
    text("Health: " + (3-health), 60, 90);
  
    //ship
    ship.show();
    ship.move();
    ship.decelerate();
    
    //keys
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
          
   //health 
    if(health >= 3){
      gameEnd = true;
    }
    
    if(soniA.size() + saw.size() == 0)
      gameWin = true;
  }
  //end of gameStart
    
  if(gameEnd == true){
    noLoop();
    background(0);
    textSize(40);
    fill((int)(Math.random()*255), (int)(Math.random()*155), (int)(Math.random()*255));
    text("GAME OVER", 260, height/2);
    textSize(30);
    text("You scored " + count, 280, height/2 + 40);
    text("Try again", 300, height/2 + 80);
    if(mouseX >= 20 && mouseX <= 650 && mouseY >= 320 && mouseY <= 370)
      fill(0);
  }
  
  //win
  if(gameWin == true){
    textSize(40);
    text("YOU WIN", 280, height/2);
  }
}

//restart
public void mousePressed(){
  if(firstScreen == true){
    if(mouseX >= 20 && mouseX <= 650 && mouseY >= 320 && mouseY <= 370){
      firstScreen = false;
      gameStart = true;
      gameEnd = false;
    }
  }
  if(gameEnd == true){
    if(mouseX >= 20 && mouseX <= 650 && mouseY >= 320 && mouseY <= 500){
      background(0);
      loop();
      
      firstScreen = true;
      health = 0;
      gameEnd =false;
      soniA = new ArrayList<Asteroid>();
      saw = new ArrayList<ufo>();
      joanne = new ArrayList<Bullet>();
      count = 0;
      ship.setXspeed(0);
      ship.setYspeed(0);
      ship.accelerate(0);
      ship.setPosition(width/2, height/2);
      ship.setPointDirection(0);
      setup();
    }
   }
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
