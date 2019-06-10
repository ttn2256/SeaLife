 class Fish extends FishMove{
  PShape body, torso, tail, fin, eye;
  // constructors 
  Fish(){
  super();
  }
 
  void display(){
    body = createShape(GROUP); 
    torso = createShape (ELLIPSE, 0, 0, 60, 40); 
    torso.setFill(color(250, 157, 8)); 
    torso.setStroke(false);
    tail = createShape(); 
    tail.beginShape(TRIANGLE); 
    tail.vertex(5, 0);
    tail.vertex(50, -20);
    tail.vertex(50, 20); 
    tail.endShape(); 
    tail.setFill(color(250, 157, 8)); 
    tail.setStroke(false);
    eye = createShape (ELLIPSE, -10, -5, 5, 5); 
    eye.setFill(color(0));
    eye.setStroke (false); 
    fin = createShape();  
    fin.beginShape(TRIANGLE);
    fin.vertex (-9,10);
    fin.vertex (7,10);
    fin.vertex (9,27); 
    fin.endShape(); 
    fin.setFill(color(250, 157, 34)); 
    fin.setStroke(false); 
    body.addChild(torso);
    body.addChild(tail); 
    body.addChild(eye);
    body.addChild(fin); 
    
    // move the indices randomly to make the tail move
    for (int i = 0; i < tail.getVertexCount(); i++){
      PVector v = tail.getVertex(i);
      v.x += random(-2,2);
      v.y +=  random(-2,2);
      tail.setVertex(i,v);
    }
    //make the fin move 
    for (int i = 0; i < fin.getVertexCount(); i++){
      PVector v = fin.getVertex(i);
      v.x += random(-1,1);
      v.y +=  random(-1,1);
      fin.setVertex(i,v);
    }
    // direction the fish swims
    x = x + speed * direction;
    
    //check if the fish is within bounds 
    if (x+ 400 < 0){
     //float newx = x + 400;
     x = width + 50; 
     y = (int) random(0,500);  
    }
    //bobing effect
    y = sin(x) + y; 
    //display the fish 
    shape(body,x,y);
  }
}