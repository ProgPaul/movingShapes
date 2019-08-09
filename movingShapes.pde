Snake s;

void setup(){
  size(900,720);
  //frameRate(5);
  background(125); // R,G,B => 0 bis 255
  noStroke();
  s = new Snake();
}

void draw(){  
  background(125); // R,G,B => 0 bis 255
  s.drawSnake();
}

void keyPressed() {
  s.move(key);
}
