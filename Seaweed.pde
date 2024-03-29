class SeaWeed
{
  final static float DIST_MAX = 4;//length of each segment
  final static float maxNbSeg = 100;//max number of segments
  final static float minNbSeg = 20;//min number of segments
  final static float maxWidth = 20;//max width of the base line
  final static float minWidth = 11;//min width of the base line
  final static float FLOTATION = 5;//flotation constant
  
  int nbSegments = (int)random(minNbSeg, maxNbSeg);//number of segments
  PVector[] pos;//position of each segment
  color[] cols;//colors array, one per segment
  MyColor myCol = new MyColor();
  PVector rootNoise = new PVector(random(123456), random(123456));//noise water effect
  float x;//x origin of the weed
   
  SeaWeed(float p_x, float p_y)
  {
    pos = new PVector[nbSegments];
    cols = new color[nbSegments];
    x = p_x;
    for (int i = 0; i < nbSegments; i++)
    {
      pos[i] = new PVector(p_x, p_y - i * DIST_MAX);
      cols[i] = myCol.getColor();
    }
  }
 
  void update()
  {
    rootNoise.add(new PVector(.02, .02));
   
    pos[0] = new PVector(x, height);
    for (int i = 1; i < nbSegments; i++)
    {
      float n = noise(rootNoise.x + .003 * pos[i].x, rootNoise.y + .003 * pos[i].y);
      float noiseForce = (.3 - n) * 4;
      pos[i].x += noiseForce;
      pos[i].y -= FLOTATION;
 

      PVector tmp = PVector.sub(pos[i-1], pos[i]);
      tmp.normalize();
      tmp.mult(DIST_MAX);
      pos[i] = PVector.sub(pos[i-1], tmp);
    }
 
    myCol.update();
    cols[0] = myCol.getColor();
    for (int i = 0; i < nbSegments; i++)
    {
      if (i > 0)
      {        
        float t = atan2(pos[i].y - pos[i-1].y, pos[i].x - pos[i-1].x) + PI/2;
        float l = map(i, 0, nbSegments-1, map(nbSegments, minNbSeg, maxNbSeg, minWidth, maxWidth), 1);
      }
    }
 
    if(mode == 1) beginShape(LINES);
    for (int i = 0; i < nbSegments; i++)
    {
      if(mode == 0)
      {
        stroke(0, 100);
        fill(cols[i]);
        float r = (20 * cos(map(i, 0, nbSegments - 1, 0, HALF_PI)));
        ellipse(pos[i].x, pos[i].y + 2, r, r);
      }else
      {
        noFill();
        stroke(cols[i]);
        strokeWeight(nbSegments-i+int(20 * cos(map(i, 0, nbSegments - 1, 0, HALF_PI))));
        curveVertex(pos[i].x, pos[i].y + 2);
      }
    }
    if(mode == 1) endShape();   
  }
}
 
 
class MyColor
{
  float R, G, B, Rspeed, Gspeed, Bspeed;
  final static float minSpeed = .2;
  final static float maxSpeed = .8;
  final float minG = 120;
  MyColor()
  {
    init();
  }
   
  public void init()
  {
    R = random(0, minG);
    G = random(minG, 255);
    B = random(0, minG);
    Rspeed = (random(1) > .5 ? 1 : -1) * random(minSpeed, maxSpeed);
    Gspeed = (random(1) > .5 ? 1 : -1) * random(minSpeed, maxSpeed);
    Bspeed = (random(1) > .5 ? 1 : -1) * random(minSpeed, maxSpeed);
  }
   
  public void update()
  {
    Rspeed = ((R += Rspeed) > minG || (R < 0)) ? -Rspeed : Rspeed;
    Gspeed = ((G += Gspeed) > 255 || (G < minG)) ? -Gspeed : Gspeed;
    Bspeed = ((B += Bspeed) > minG || (B < 0)) ? -Bspeed : Bspeed;
  }
   
  public color getColor()
  {
    return color(R, G, B);
  }
}