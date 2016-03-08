class Dots {
  private boolean[][] dots;
  private int count;
  private int i;
  private int j;

  // Create an initial board with every dot present
  Dots() {
    count=0;
    i=0;
    j=0;
    dots = new boolean[boardWidth][boardHeight];
    while (i <30) {
      while (j<30) {
        dots[i][j] = true;
        j++;
        count++;
      }
      j=0;
      i++;
    }
    i=0;
  }

  // remove any dots between the two positions
  // return the number of dots removed
  // Normally the input vectors will either be in the same row
  // or the same column.  It's fine to only handle these cases.
  // Write a comment explaining what your version does
  // if the inputs are not in the same row or column.
  void remove(PVector fromPosition, PVector toPosition) {
    i=0;
    while (i <30) {
      j=0;
      while (j<30) {
        if (fromPosition.y == toPosition.y) {
          if (dotToPixel(i) >= fromPosition.x && dotToPixel(i) <= toPosition.x) {
            dots[i][j] = false;
            count--;
          }
        } else if (fromPosition.x == toPosition.x) {
          if (dotToPixel(j)<= toPosition.y && dotToPixel(j) >= fromPosition.y) {
            dots[i][j] = false;
            count--;
          }
        }
        j++;
      }
      j=0;
      i++;
    }
    i=0;
  }

  // return the number of dots remaining
  int remaining() {
    return count;
  }

  // Draw the dots.  Use `dotToPixel`
  void render() {
    fill(255, 255, 255);
    while (i<30) {
      while (j<30) {
        if (dots[i][j]) {
          noStroke();
          ellipse(dotToPixel(i), dotToPixel(j), dotRadius, dotRadius);
        }
        j++;
      }
      j=0;
      i++;
    }
    i=0;
  }
}