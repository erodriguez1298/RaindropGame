PVector mouse;   //declare a P
Raindrop r;      //declare a new Raindrop called r
Bucket b;

// On your own, create an array of Raindrop objects instead of just one
// Use the array instead of the single object
// You can start out by just using the single Raindrop as you test


void setup() {
  size(800, 600);
  mouse = new PVector();                //initialize mouse PVector. value is irrelevant since it will be set at the start of void draw(){}
  r = new Raindrop(random(width), 0);   //Initialize r. The parameters used are the initial x and y positions
  b = new Bucket(mouseX, height-375);
}

void draw() {
  mouse.set(mouseX, mouseY);             //set value of mouse as mouseX,mouseY
  background(0);
  b.display();
  r.fall();         //make the raindrop fall. It should accelerate as if pulled towards the ground by earth's gravity
  r.display();      //display the raindrop
  if (r.isInContactWith(mouse)) {      //check to see if the raindrop is in contact with the point represented by the PVector called mouse
    r.reset();                         //if it is, reset the raindrop
  }
  if (r.loc.y > height + 45) {     //check to see if the raindrop goes below the bottom of the screen
    r.reset();                           //if it does, reset the raindrop
  }
}