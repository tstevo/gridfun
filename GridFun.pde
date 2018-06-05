Cell[][] grid;

// Number of columns and rows in the grid

void setup() {

  size(1200,800);
  background(0);
  
  int scalef = width/40;

  int cols = scalef;
  int rows = scalef;
  
  grid = new Cell[cols][rows];
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      // Initialize each object
      grid[i][j] = new Cell(i*40,j*40,40,40,i+j);
    }
  }
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      grid[i][j].display();
      grid[i][j].randtriangle();
    }
  }
  save("ivtri5.png");
}

class Cell {
  float x,y;   // x,y location
  float w,h;   // width and height
  float angle; // angle for oscillating brightness
  
  color her1=color(246,55,0);
  color her2=color(0,72,83);
  color her3=color(0,185,189);
  color her4=color(0,126,128);
  color her5=color(251,105,0);

  Cell(float tempX, float tempY, float tempW, float tempH, float tempAngle) {
    x = tempX;
    y = tempY;
    w = tempW;
    h = tempH;
    angle = tempAngle;
  } 
  
  void oscillate() {
    angle += 0.02; 
  }

  void display() {
    //stroke(255);
    // Color calculated using sine wave
    //fill(127+127*sin(angle));
    
    float rnd1=random(0,5);
    int fcolour;
    
    if (rnd1 < 1) {
          fcolour = her1;
        }
        else if (rnd1 < 2) {
          fcolour = her2;
        }
        else if (rnd1 < 3) {
          fcolour = her3;
        }
        else if (rnd1 < 4) {
          fcolour = her4;
        }
        else {
          fcolour = her5;
        }
    noStroke();
    fill(fcolour);
    
//    String[] words = { "red", "blue", "green" };
//    int index = int(random(words.length));  // Same as int(random(4))
//    fill(words[index]);
    
    rect(x,y,w,h); 
  }
  
  void randtriangle() {
   
  float rnd2=random(0,5); //random colour
  float rnd3=random(0,1); //random orientation of triangle
  float rnd4=random(0,3); //random orientation of arc
  int x1=int(x);
  int y1=int(y);
  int x2=int(x+w);
  int y2=int(y);
  int x3=int(x);
  int y3=int(y+h);
  int tcolour;
  int ax=0;
  int ay=0;
  float ad1=0;
  float ad2=0;
  
  if (rnd2 < 1) {
          tcolour = her1;
        }
        else if (rnd2 < 2) {
          tcolour = her2;
        }
        else if (rnd2 < 3) {
          tcolour = her3;
        }
        else if (rnd2 < 4) {
          tcolour = her4;
        }
        else {
          tcolour = her5;
        }
        
  if (rnd3 < 0.5) {
          x1=int(x);
          y1=int(y);
          x2=int(x+w);
          y2=int(y);
          x3=int(x);
          y3=int(y+h);
        }
        else {
          x1=int(x);
          y1=int(y);
          x2=int(x+w);
          y2=int(y+h);
          x3=int(x);
          y3=int(y+h);
        }
        
  if (rnd4 < 1) {
          ax = x1; //change arc angle!!!
          ay = y1;
          ad1 = 0;
          ad2 = HALF_PI;
        }
        else if (rnd4 < 2) {
          ax = x2;
          ay = y2;
          ad1 = HALF_PI;
          ad2 = PI;
        }
        else {
          ax = x3;
          ay = y3;
          ad1 = PI;
          ad2 = (3*PI)/2;
        }
    
  float tprob=random(0,1); //randomise triangles
  float cprob=random(0,1); //randomise arcs
  
    if (tprob>0.75) {
      fill(tcolour);
      triangle(x1,y1,x2,y2,x3,y3);
    }
    if (cprob>0.75) {
      fill(tcolour);
      arc(ax, ay, 2*w, 2*h, ad1, ad2);
    }
    
  }
}
