class Snake{
  ArrayList<PVector> parts;
  float partSize;
  
  Snake(){
    partSize = 30;
    parts = new ArrayList<PVector>();
    parts.add( new PVector(width/2, height/2));
    parts.add( new PVector(width/2 - partSize, height/2));
    parts.add( new PVector(width/2 - partSize*2, height/2));
  }
 
  void drawSnake(){
    for(int a=0; a < parts.size(); a++){
      PVector tmpPosition = parts.get(a);
      stroke(125);
      rect(tmpPosition.x, tmpPosition.y , partSize, partSize);
    }
    // parts ==> ArrayList<PVector>
    // parts.get() ==> Funktion von ArrayLists
    // parts.get(index) ==> Holt PVector an index raus
  }
  
  void move(char direction){
    PVector head = parts.get(0);
    PVector newHead = head.copy();
    
    if(direction == 'd'){
      newHead.add(new PVector(partSize, 0)); // um this.size nach rechts bewegen
    } else if (direction == 'a'){
      newHead.add(new PVector(-partSize, 0)); // um this.size nach links bewegen
    } else if (direction == 'w'){
      newHead.add(new PVector( 0,-partSize)); // um this.size nach oben bewegen
    } else if (direction == 's'){
      newHead.add(new PVector( 0,partSize)); // um this.size nach unten bewegen
    }
    
    parts.add(0, newHead); // zur liste aller parts hinzufügen
    parts.remove(parts.size()-1); // this.parts.size() == länge von ArrayList > 
    checkBorder();  
  }
  
  void checkBorder(){
    // 0 > head < width &&  0 > head < height
    PVector head = parts.get(0);
    
    // check horizontally
    if(head.x > width){
      head.set(0,head.y);
    }else if(head.x < 0) {
      head.set(width,head.y);  
    }
    // check vertically
    if ( head.y > height){
      head.set(head.x, 0);
    }else if(head.y < 0){
      head.set(head.x, height);
    }
  }
}
