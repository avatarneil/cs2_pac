class Dots {
   private boolean[][] dots;
   private int count;

   // Create an initial board with every dot present
   Dots() {
     dots = new boolean[30][30];
     count = 30;
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
     dotToPixel(count);
   }

}