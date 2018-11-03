class DNA {
  int [] pasos;
  // The genetic sequence
  PVector pos;
  PVector mov;
  
  float fitness;
  
  // Constructor (makes a random DNA)
  DNA() {
    pasos=new int[600];
    pos=new PVector(50, height/2);
    mov=new PVector(0,0);
  }
  
  void llenar(){
   for(int i =0;i<pasos.length;i++){
     pasos[i]=(int)(random(7));
    } 
  }
  
  // Converts character array to a String
  void display() {
    ellipse(pos.x,pos.y, 10,10);
    background(0);
  }
  
  void update(){
     for(int i =0;i<pasos.length;i++){
       switch(pasos[i]){
        case 0:
            mov.x=-10;
            mov.y=-10;
           break;
       case 1:
           mov.x=-0;
            mov.y=-10;
           break;   
       case 2:
            mov.x=10;
            mov.y=-10;
            break;
       case 3:
            mov.x=10;
            mov.y=0;
            break;
       case 4:
            mov.x=10;
            mov.y=10;
            break;
       case 5:
            mov.x=0;
            mov.y=10;
            break;
       case 6:
            mov.x=-10;
            mov.y=10;
            break;  
       case 7:
            mov.x=-10;
            mov.y=0;
           break; 
       }
       pos.add(mov);
       display();
       mov.x=0;
       mov.y=0;
    } 
  }
  
  // Fitness function (returns floating point % of "correct" characters)
  void fitness (float x1, float y1) {
     float score = 0;
     score=dist(pos.x,pos.y,x1,y1);
     fitness = score / 500;
  }
  
  // Crossover
  DNA crossover(DNA partner) {
    // A new child
    DNA child = new DNA();
    
    int midpoint = int(random(pasos.length)); // Pick a midpoint
    
    // Half from one, half from the other
    for (int i = 0; i < pasos.length; i++) {
      if (i > midpoint) child.pasos[i] = pasos[i];
      else              child.pasos[i] = partner.pasos[i];
    }
    return child;
  }
  
  // Based on a mutation probability, picks a new random character
  void mutate(float mutationRate) {
    for (int i = 0; i < pasos.length; i++) {
      if (random(1) < mutationRate) {
        pasos[i] = (int)random(7);
      }
    }
  }
}
