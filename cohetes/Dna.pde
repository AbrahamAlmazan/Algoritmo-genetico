class Dna{
  PVector [] pasos;
  PVector pos;
  int a=0;
  int steps;
  boolean vivo;
  float fitness;
  float xt;
  float yt;
  
 
 Dna(int pa,float m, float n){
   steps=pa;
   vivo=true;
   pos=new PVector(100, height/2);
   pasos=new PVector[pa];
   fitness=0;
   xt=m;
   yt=n;
   for(int i=0; i<pasos.length;i++){
      pasos[i]=new PVector(random(-5,5),random(-5,5));
   }
 }

 void mov(){
    ellipse(pos.x,pos.y,10,10); 
 }

 void update(){
   if(a<steps && vivo==true){
    pos.add(pasos[a]);
    a++;
   }else {
      vivo=false;
   }
 }

 void limites(){
   if(pos.x<=10){
       vivo=false; 
   }else if(pos.x>=width-10){
       vivo=false; 
   }
   
   if(pos.y<=10){
       vivo=false; 
   }else if(pos.y>=height-10){
       vivo=false; 
   }
 }

void fitness(){
   fitness=dist(pos.x,pos.y,xt,yt);
} 

  Dna crossover(Dna partner) {
    // A new child
    Dna child = new Dna(steps,xt,yt);
    
    int midpoint = int(random(pasos.length)); // Pick a midpoint
    
    // Half from one, half from the other
    for (int i = 0; i < pasos.length; i++) {
      if (i > midpoint) child.pasos[i] = pasos[i];
      else              child.pasos[i] = partner.pasos[i];
    }
    return child;
  }
  
   void mutate() {
    for (int i = 0; i < pasos.length; i++) {
      if (random(1) < 0.01) {
        pasos[i].x=  random(-5,5);
        pasos[i].y=  random(-5,5);
      }
    }
  }

}
