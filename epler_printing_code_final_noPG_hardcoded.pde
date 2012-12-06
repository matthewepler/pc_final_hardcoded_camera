ArrayList<Cube> cubes = new ArrayList();
float boxSize, halfBox, barWidth;
int tDimension, spacer, sides;

float oldCamX = 159.29515;
float oldCamY = -159.9395;
float oldCamZ = 160.70677;
float oldRotX = -0.085402645;
float oldRotY = -0.7822204;
float oldRotZ = -0.4102253;

void setup()
{
 size( 3300, 3300, P3D  );
 ortho( -width/2, width/2, height/2, -height/2, -1000, 1000 );
 
 boxSize = width / 40;
 halfBox = boxSize / 2;
 barWidth = 0.5;
 tDimension = 5;
 spacer = 4;
 sides = 3;
 
 background( 15 );
 fill( 255 );
 noStroke();
 smooth();

 generateCubes();
 
 for( int i = 0; i < cubes.size(); i++ )
  {
    Cube thisCube = cubes.get( i );
    thisCube.render();
  }
 
 // -------------------------------- CAMERA --------------- //
 
 int half = (int) cubes.size()/2; // get the center cube
 Cube center = cubes.get( half );
 
 float newCamPosX = (3300 * oldCamX) / 800;
 float newCamPosY = (3300 * oldCamY) / 800;
 float newCamPosZ = (3300 * oldCamZ)/ 800;
 
 //camera(eyeX, eyeY, eyeZ, centerX, centerY, centerZ, upX, upY, upZ)
 camera( newCamPosX, newCamPosY, newCamPosZ, 
         center.posX, center.posY, center.posZ,
         1, -1, 1 );
         
 rotateX( oldRotX );
 rotateY( oldRotY );
 rotateZ( oldRotZ );
 
 
}


void generateCubes()
{
  for( int y = 0; y < tDimension; y++ )      // generate cubes one vertical level at a time
   {
     for( int x = 0; x < tDimension; x++ )
     {
       for( int z = 0; z < tDimension; z++ )
       {
         Cube newCube = new Cube( sides, x * boxSize * spacer, 
                         y * boxSize * spacer * -1, 
                         z * boxSize * spacer );
         cubes.add( newCube );
       }
     }
   }
}


