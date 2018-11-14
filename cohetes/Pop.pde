class Pop{
 Dna [] pop;
 int aux;
 int pas;
 int tama;
 ArrayList<Dna> matingPool; 
  
 Pop(int p, int tam, float xm, float yn){   
  pop= new Dna[tam];
  pas=p;
  matingPool = new ArrayList<Dna>();
  tama=tam;
  for(int i=0;i<pop.length;i++){
    pop[i]=new Dna(pas, xm, yn);  
  }
 }
 
 
 void mover(){
    for(int i=0;i<pop.length;i++){
      pop[i].limites();
      pop[i].mov();
      pop[i].update();
    }
 }
 
 void calcfitness(){
   aux=0;
   for(int z=0;z<tama;z++){
     if(pop[z].vivo==false){
         aux++;
     }  
   }
   
   if(aux==tama){
     for(int u=0;u<tama;u++){
        pop[u].fitness();
     }
    naturalSelection();
    generate();
    for(int u=0;u<tama;u++){
        pop[u].a=0;
     }
    
   }  
  }
  
    void naturalSelection() {
    // Clear the ArrayList
    matingPool.clear();

    float maxFitness = width;
    for (int i = 0; i < pop.length; i++) {
      if (pop[i].fitness > maxFitness) {
        maxFitness = pop[i].fitness;
      }
    }

    // Based on fitness, each member will get added to the mating pool a certain number of times
    // a higher fitness = more entries to mating pool = more likely to be picked as a parent
    // a lower fitness = fewer entries to mating pool = less likely to be picked as a parent
    for (int i = 0; i < pop.length; i++) {
      
      float fitness = map(pop[i].fitness,maxFitness,width,1,0);
      int n = int(fitness * 100);  // Arbitrary multiplier, we can also use monte carlo method
      for (int j = 0; j < n; j++) {              // and pick two random numbers
        matingPool.add(pop[i]);
      }
    }
  }
  
  void generate() {
    // Refill the population with children from the mating pool
    for (int i = 0; i < pop.length; i++) {
      int a = int(random(matingPool.size()));
      int b = int(random(matingPool.size()));
      Dna partnerA = matingPool.get(a);
      Dna partnerB = matingPool.get(b);
      Dna child = partnerA.crossover(partnerB);
      child.mutate();
      pop[i] = child;
    }
  }
  
 
}
