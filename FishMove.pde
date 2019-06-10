class FishMove {
  float x,y,speed,direction;
  FishMove() {
    x = random(100,500);
    y = random(100,500);
    speed = random(2,4); 
    direction = -1; 
  }
}