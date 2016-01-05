PVector mouth;   //declare a P
Bucket b;
float game; 
String[] responses = {"YUM", "MMM", "OH YEAH", "SO GOOD"};
int timer;
ArrayList<Raindrop> particles = new ArrayList<Raindrop>();
int interval;

// On your own, create an array of Raindrop objects instead of just one
// Use the array instead of the single object
// You can start out by just using the single Raindrop as you test


void setup() {
  size(800, 600);
  mouth = new PVector();                //initialize mouse PVector. value is irrelevant since it will be set at the start of void draw(){}
 //Initialize r. The parameters used are the initial x and y positions
  b = new Bucket(mouseX, height-375);
  game = 0;
  for(int i = 0; i < 1; i++){
    particles.add(new Raindrop(random(width), -random(height)));
  }
}

void draw() {
  background(0);

  if(game == 0){
    textSize(75);
    textAlign(CENTER, CENTER);
    fill(205,92,92);
    text("Hangry Emily", width/2, height/4);
    fill(188,143,143);
    textSize(50);
    String s = "Emily is hangry. Feed her sushi to make her happy!";
    text(s, width/7, height/6, 3*width/4, 3*height/4);
  }
  
  if(game == 1){
    mouth.set(mouseX, height-130);             //set value of mouse as mouseX,mouseY
    b.display();

    for (int i = particles.size()-1; i >= 0; i--) {  //go through the ArrayList backwards to prevent flickering
      //particles.get(0)   will get the particle at index 0 from the ArrayList
      //to use this Particle, we have to store it in another Particle object
      Raindrop r = particles.get(i);    //get the Particle in location i and store it in Particle p
     
      r.fall();         //make the raindrop fall. It should accelerate as if pulled towards the ground by earth's gravity
      r.display();      //display the raindrop
      
      if (r.isInContactWith(mouth)) {      //check to see if the raindrop is in contact with the point represented by the PVector called mouse
        r.reset();         //if it is, reset the raindrop
        timer = frameCount;
    }
    
      if (r.loc.y > height + 45) {     //check to see if the raindrop goes below the bottom of the screen
        r.reset();                           //if it does, reset the raindrop
    }
  }

    if(frameCount < timer +50)
    reaction();
  }
}


void mousePressed(){
  if(game == 0){
    game = 1;
  }
}

void reaction(){
  fill(255,160,122);
  textAlign(CENTER, CENTER);
  textSize(50);
  text(responses[int(random(4))], width/2, 200);
}