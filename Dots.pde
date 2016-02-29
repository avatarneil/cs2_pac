class Dots {
   private boolean[][] dots;
   private int count;
   private int a;
   private int b;

   // Create an initial board with every dot present
   Dots() {
     count=0;
     a=0;
     b=0;
     dots = new boolean[boardWidth][boardHeight];
     while (count < 30){
       dots[a][] = true;
       dots[][b] = true;
       count++;
       a++;
       b++;
     }
   }

   // remove any dots between the two positions
   // return the number of dots removed
  // Normally the input vectors will either be in the same row
   // or the same column.  It's fine to only handle these cases.
   // Write a comment explaining what your version does
   // if the inputs are not in the same row or column.
   int remove(PVector fromPosition, PVector toPosition) {
     return 5;
   }

      // return the number of dots remaining
   int remaining() {
       return count;
   }

   // Draw the dots.  Use `dotToPixel`
   void render() {
     ellipse(dotToPixel(30),dotToPixel(30),5,5);
   }

}