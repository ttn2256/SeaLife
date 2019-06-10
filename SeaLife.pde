import ddf.minim.*;

Minim minim;
AudioPlayer sound; //

Fish fish = new Fish();
Turtle turtle = new Turtle();
int numBubbles = 50;
Bubble[] bubbles;

final int nb = 30;
SeaWeed[] weeds;
PVector rootNoise = new PVector(random(123456), random(123456));
int mode = 0;
 
void setup()
{
  minim = new Minim (this);
  sound = minim.loadFile("Under.mp3");
  sound.loop();
  size(800, 600, P2D);
  weeds = new SeaWeed[nb];
  for (int i = 0; i < nb; i++)
  {
    weeds[i] = new SeaWeed(random(0, width), height);
  }
  bubbles = new Bubble[numBubbles];
   for (int i = 0; i < numBubbles; i++) {
       bubbles[i] = new Bubble();
   }

}
 
void draw()
{
  background(26,104,238);
  smooth();
     
    for (int i = 0; i < bubbles.length; i++) {
        bubbles[i].update();
        bubbles[i].render();
        if ( bubbles[i].loc.y < -50) {
            bubbles[i].reset();
        }
    }

  for (int i = 0; i < nb; i++)
  {
    weeds[i].update();
  }
  fish.display();
  turtle.tut();
}
 