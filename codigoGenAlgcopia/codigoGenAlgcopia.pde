
float xa;
float ya;
int popmax;
float mutationRate;
Population population;

void setup() {
  size(640, 360);
  xa = width-50;
  ya=height/2;
  popmax = 150;
  mutationRate = 0.01;

  // Create a populationation with a target phrase, mutation rate, and populationation max
  population = new Population(xa,ya, mutationRate, popmax);
}

void draw() {
  population.mov();
  // Generate mating pool
  population.naturalSelection();
  //Create next generation
  population.generate();
  // Calculate fitness
  population.calcFitness();

  // If we found the target phrase, stop
  if (population.finished()) {
    println(millis()/1000.0);
    noLoop();
  }
}

