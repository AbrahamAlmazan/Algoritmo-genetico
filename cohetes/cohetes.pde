Pop pob;
int steps;
void setup(){
  size(800,600);
  steps=700;
  pob=new Pop(steps,100,750,height/2);
}

void draw(){
      background(0);
      ellipse(750,height/2,50,50);
     pob.mover(); 
     pob.calcfitness();
}


