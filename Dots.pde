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
    if (dots[pixelToDot(fromPosition.x)][pixelToDot(fromPosition.y)]) {
      dots[pixelToDot(fromPosition.x)][pixelToDot(fromPosition.y)]=false;
      count--;
    } else if (dots[pixelToDot(toPosition.x)][pixelToDot(toPosition.y)]) {
      dots[pixelToDot(toPosition.x)][pixelToDot(toPosition.y)]=false;
      count--;
    }
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