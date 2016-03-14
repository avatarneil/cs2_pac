class Walls {
  // vertical walls.
  // This array is true for a given square if there is a wall to the right of that square
  private boolean[][] vertical;
  // horizontal - true if there is a wall below that square.
  private boolean[][] horizontal;
  int i=0;
  int j=0;
  // A new set of walls, for testing purposes
  // eventually, we'll want some particular levels
  Walls() {
    this.vertical = new boolean[boardHeight][boardWidth];
    this.horizontal = new boolean[boardHeight][boardWidth];
    for (int i=0; i<boardHeight; i++) {
      for (int j=0; j<boardWidth; j++) {
        if (i == j) {
          vertical[i][j] = true;
          horizontal[i][j] = true;
        } else {
          vertical[i][j] = false;
          horizontal[i][j] = false;
        }
      }
    }
  }


  // Make a new Walls object from two arrays:
  // Horizontal & Vertical walls.
  // WISH check that dimensions are correct.
  Walls(boolean[][] h, boolean[][] v) {
    this.horizontal = h;
    this.vertical = v;
  }

  // If there is a wall between the two given positions, return the point of collision.
  // Otherwise, return some value that can never be a collision.
  // Input & Output are in pixel coordinates
  boolean collision(PVector fromPosition, PVector toPosition) {
    while (i <30) {
      j=0;
      while (j<30) {
        if (fromPosition.y==toPosition.y) {
//          println(pixelToDot(fromPosition.x));
  //        println(i >= pixelToDot(fromPosition.x) && i<= pixelToDot(toPosition.x));
          if (((i >= pixelToDot(fromPosition.x) && i<= pixelToDot(toPosition.x)) || (i <= pixelToDot(fromPosition.x) && i >= pixelToDot(toPosition.x))) && j == pixelToDot(fromPosition.y)) {
            println(4);
            if (vertical[i][j]) {
              println(5);
              return true;
            } else {
              return false;
            }
          } else {
           return false;
          }
        }
        if (fromPosition.x == toPosition.x) {
          if ((j>= pixelToDot(toPosition.y) && j <= pixelToDot(fromPosition.y) ||j <= pixelToDot(toPosition.y) && j >= pixelToDot(fromPosition.y)) && i==pixelToDot (fromPosition.x)) {
            if (horizontal[i][j]) {
              return true;
            }else{
              return false;
            }
          }
        }else{
              return false;
            }
        j++;
      }
      j=0;
      i++;
    }
    i=0;
    return false;
  }

  void render() {
    for (int i=0; i<boardHeight; i++) {
      for (int j=0; j<boardHeight; j++) {
        if (vertical[i][j]==true) { 
          rect(dotToPixel(i)+15, dotToPixel(j)+15, 3, dotSpacing);
        }
        if (horizontal[i][j]==true) {
          rect(dotToPixel(i)+15, dotToPixel(j)+15, dotSpacing, 3);
        }
      }
    }
  }
}