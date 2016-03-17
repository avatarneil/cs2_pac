final int boardWidth = 30; // number of dots across
final int boardHeight = 30; // number of dots down
final int dotSpacing = 30; // pixels between dot centers
final int dotRadius = 3; // pixels
PVector getPos;
Dots dots;
Pac pac;
Walls walls;

// It's convenient to refer to two coordinate systems
// Pixel coordinates are the usual Processing coordinates
// Dot coordinates describe the screen as a grid of boxes.
// Each box has an integer x & y coordinate.  At the start of the game,
// there is a dot in the *center* of each box.

// dotToPixel gives the pixel coordinate in the *center* of the corresponding box
float dotToPixel(int x) {
  return (0.5 + x) * dotSpacing;
}

// pixelToDot finds the box in which the pixel is contained
int pixelToDot(float x) {
  if (x > boardWidth * dotSpacing) {
    println(x);
  }
  return floor(x / dotSpacing);
}

void setup() {
  size(900, 900);
  dots = new Dots();
  pac = new Pac();
  walls = new Walls();
}

void draw() {
  clear();
  dots.render();
  pac.render();
  walls.render();
  if (keyPressed) {
    if (keyCode == UP) {
      pac.setDirection(Dir.NORTH);
    } else if (keyCode == DOWN) {
      pac.setDirection(Dir.SOUTH);
    } else if (keyCode == RIGHT) {
      pac.setDirection(Dir.EAST);
    } else if (keyCode == LEFT) {
      pac.setDirection(Dir.WEST);
    }
  }
  getPos = pac.getPosition();
  pac.updatePosition(walls);
  dots.remove(getPos, pac.getPosition());
  //println(dots.remaining());
  if (walls.collision(getPos, pac.getPosition())) {
    pac.setDirection(Dir.STOP);
  }
  text(dots.remaining(), 20, 15);
}