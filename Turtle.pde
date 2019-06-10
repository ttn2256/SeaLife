class Turtle extends TurtleMove{

PShape turtle, head, body, flipper, flipper2, eye, mouth, small, rec, tail;
float amplitude = 18;
float period = 4;



Turtle(){
   super();
 }

//create motion for the flippers 
float motion()
{
  float time = norm(millis(),0,300);
  float fraction = norm(time,0,period);
  float shm = sin(fraction*TWO_PI);
  float angle = amplitude*shm;
  return radians(angle);
}


void tut(){

  float angle = motion();

  noStroke();
  turtle = createShape(GROUP);
  
  head= createShape (ELLIPSE, 100, 170, 57, 57);
  head.setFill(#00FF4C);
  //stroke(10);
  eye = createShape (ELLIPSE, 80, 150, 30, 50);
  //noStroke();
  small = createShape (RECT, 70, 145, 10, 10);
  mouth = createShape (RECT, 80, 188, 10, 4);
  
  eye.setFill(#FFFFFF);
  small.setFill(#000000);
  mouth.setFill(#FF0000);
  
  body = createShape (ARC, 185, 200, -130, -130, 0, PI);
  body.setFill(#AFFF00);
  tail = createShape();
  tail.beginShape(TRIANGLE); 
  tail.vertex(190, 150);
  tail.vertex(270, 200);
  tail.vertex(250, 200); 
  tail.endShape(); 
  tail.setFill(#594606);
  flipper = createShape (ELLIPSE, 0, 0, 30, 50);
  flipper.translate (137,205);
  flipper.rotate(-angle);
  flipper2 = createShape (ELLIPSE, 0, 0, 30, 50);
  flipper2.translate(232, 205);
  flipper2.rotate(angle);
  flipper.setFill(#594606);
  flipper2.setFill(#594606);
  
  turtle.addChild(tail);
  turtle.addChild(flipper);
  turtle.addChild(flipper2);
  turtle.addChild(body);
  turtle.addChild(head);
  turtle.addChild(eye);
  turtle.addChild(small);
  turtle.addChild(mouth);
  
  //the direction of turtle move
  theta -= 2 ;
  //reset the x,y when the turtle moves pass the window 
  if( theta + 500 < 0 ){
    theta = width + 70;
    t = random (0, 300);
  }
  
  //display the turtle
  shape(turtle, theta, amp*cos(frequency*(-t+1)) + height/3);
  t +=dt;
}

}