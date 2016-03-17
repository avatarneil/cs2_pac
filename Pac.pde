class Pac {
  private PVector position;
  final float speed = 0.1 * dotSpacing;
  private Dir travelDirection = Dir.EAST;

  // for testing purposes, don't start in the corner
  Pac() {
    position = new PVector(dotToPixel(5), dotToPixel(0));
  }

  // return a copy of the current position
  PVector getPosition() {
    return position.copy();
  }

  // set a new movement direction
  void setDirection(Dir d) {
    travelDirection = d;
  }

  // Draw the Pac, as a circle
  void render() {
    fill(255, 255, 0);
    ellipse(position.x, position.y, 20, 20);
  }

  // If the given vector is off the screen, wrap it around to the other side
  // Modify the given vector.
  // If this were public, we probably woudn't modify the vector in place like this.
  private void wrapPosition(PVector vec) {
    vec.x = (vec.x + width) % width;
    vec.y = (vec.y + width) % width;
  }

  // reverse the movement direction
  private void reverseDirection() {
    position.rotate(PI);
  }

  // Update the position, using the current speed & travel direction
  // If normal movement would hit a wall, find the position after bouncing off the wall.
  // The total distance travelled (before + after hitting the wall) should be the same.
  void updatePosition(Walls walls) {
    if (travelDirection == Dir.EAST) {
      position.x = position.x + speed;
    } else if (travelDirection == Dir.WEST) {
      position.x = position.x - speed;
    } else if (travelDirection == Dir.NORTH) {
      position.y = position.y - speed;
    } else if (travelDirection == Dir.SOUTH) {
      position.y = position.y + speed;
    } else if (travelDirection == Dir.STOP) {
      position.x = position.x;
      position.y = position.y;
    }
    if (position.x>=900) {
      wrapPosition(position);
    } else if (position.x<=0) {
      wrapPosition(position);
    } else if (position.y >=900) {
      wrapPosition(position);
    } else if (position.y <=0) {
      wrapPosition(position);
    }
  }
}