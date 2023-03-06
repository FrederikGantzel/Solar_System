public class System_Simulation { //<>// //<>//
  
  //I found it more convenient to enter every object manually,
  //since i had to individually look up their masses, semi-major axes, and orbital periods anyway,
  //and thus the number of objects is inputted manually as well
  int objects = 28;
  Space_Object[] space_objects = new Space_Object[objects];
  Space_Object current_mouse_over;

  public System_Simulation() {
    
    //Velocity calculated using (2 * pi * Distance (semi-major axis) / Orbital Period)
    //For moons, the velocity of the body being orbited is added to the velocity of the orbiting body
    //I don't take eccentricity into account when inputting the distance,
    //instead i simply use the semi-major axis of all objects
    //distance for moons is semi-major axis + semi-major axis of the body being orbited
    //Inputs are: Name, mass (Earth Masses), distance (Astronomical Units / 1,000,000) and Velocity (Astronomical Units / 100000 per minute),
    //Image size, Minimum image size, Maximum image size.
    //The image sizes are more or less determined by what would look the nicest.
    //For big enough objects (The sun and the gas giants), the mimimum image size is adjusted to fit their actual size.
    //For the other objects, the minimum image size would be too small if I were to adjust it to fit their actual size.
    
    //Sun
    //Orbital Period = 0 Minutes
    space_objects[0] = new Space_Object("Sun", 332950, 0, 0,
      150, 1860, 4000000);
      
      
    //Mercury
    //Orbital Period = 126675.504 Minutes;
    space_objects[1] = new Space_Object("Mercury", 0.055, 387098, 19.2003,
      50, 50, 100000);
      
    
    //Venus
    //Orbital Period = 323569.44 Minutes;
    space_objects[2] = new Space_Object("Venus", 0.815, 723332, 14.0459,
      100, 100, 200000);
      
    
    //Earth and Moon
    //Orbital Period = 525972 Minutes;
    space_objects[3] = new Space_Object("Earth", 1, 1000000, 11.9459,
      100, 100, 200000);
    //Orbital Period = 39343.162 Minutes;
    space_objects[4] = new Space_Object("Luna", 0.0123, 2569.5 + 1000000, 0.41 + 11.9459,
      50, 50, 20000);
      
    
    //Mars (Phobos and Deimos are so small I didn't bother including them)
    //Orbital Period = 989251.2 Minutes;
    space_objects[5] = new Space_Object("Mars", 0.107, 1523680.55, 9.6776,
      75, 75, 150000);
      
    
    //Ceres
    //Orbital Period = 2419200 Minutes;
    space_objects[6] = new Space_Object("Ceres", 0.000157, 2767419.07, 7.18759,
      50, 50, 100000);
      
      
    //Jovian System (Only the four Galilean moons are included)
    //Orbital Period = 6238929.6 Minutes;
    space_objects[7] = new Space_Object("Jupiter", 317.8, 5203800, 5.2407,
      200, 936, 2000000);
    //Orbital Period = 10302.5563 Minutes;
    space_objects[8] = new Space_Object("Ganymede", 0.02481, 7155.182 + 5203800, 4.3637 + 5.2407,
      50, 50, 10000);
    //Orbital Period = 5113.7 Minutes;
    space_objects[9] = new Space_Object("Europa", 0.00804, 4484.69 + 5203800, 5.5103 + 5.2407,
      40, 40, 8000);
    //Orbital Period = 2547.558 Minutes;
    space_objects[10] = new Space_Object("Io", 0.014956, 2818.89 + 5203800, 6.9524 + 5.2407,
      40, 40, 8000);
    //Orbital Period = 24032.1865 Minutes;
    space_objects[11] = new Space_Object("Callisto", 0.018016, 12585.07 + 5203800, 3.29035 + 5.2407,
      50, 50, 10000);
      
      
    //Saturn and moons (Only moons with a diameter over 1000 km are included)
    //Orbital Period = 15493276.8 Minutes;
    space_objects[12] = new Space_Object("Saturn", 95.159, 9582600, 3.8862,
      300, 1203, 3000000);
    //Orbital Period = 22960.8 Minutes;
    space_objects[13] = new Space_Object("Titan", 0.0225, 8167.7 + 9582600, 2.23508 + 3.8862,
      75, 75, 15000);
    //Orbital Period = 6506.225 Minutes;
    space_objects[14] = new Space_Object("Rhea", 0.000386, 3523.5 + 9582600, 3.4027 + 3.8862,
      50, 50, 10000);
    //Orbital Period = 114222.96 Minutes;
    space_objects[15] = new Space_Object("Iapetus", 0.000302, 23802.61 + 9582600, 1.309336 + 3.8862,
      50, 50, 10000);
    //Orbital Period = 3941.1576 Minutes;
    space_objects[16] = new Space_Object("Dione", 0.0001834, 2522.736 + 9582600, 4.02187 + 3.8862,
      40, 40, 8000);
    //Orbital Period = 2718.4349 Minutes;
    space_objects[17] = new Space_Object("Tethys", 0.0001034, 1969.4 + 9582600, 4.55194 + 3.8862,
      40, 40, 8000);
      
    
    //Uranus and moons (Only moons with a diameter over 1000 km are included)
    //Orbital Period = 44191440 Minutes;
    space_objects[18] = new Space_Object("Uranus", 14.536, 19191260, 2.7286,
      200, 342, 1000000);
    //Orbital Period = 12536.977 Minutes;
    space_objects[19] = new Space_Object("Titania", 0.0005693, 2913.88 + 19191260, 1.460355 + 2.7286,
      50, 50, 10000);
    //Orbital Period = 19387.057 Minutes;
    space_objects[20] = new Space_Object("Oberon", 0.0005151, 3900.59 + 19191260, 1.25415 + 2.7286,
      50, 50, 10000);
    //Orbital Period = 5967.36 Minutes;
    space_objects[21] = new Space_Object("Umbriel", 0.0002135, 1778.1 + 19191260, 1.872207 + 2.7286,
      40, 40, 8000);
    //Orbital Period = 3628.8 Minutes;
    space_objects[22] = new Space_Object("Ariel", 0.0002095, 1276.89 + 19191260, 2.2109 + 2.7286,
      40, 40, 8000);
      
    //Neptune and Triton (Only Triton is included since the rest of the moons are incredibly small in comparison)
    //Orbital Period = 86680800 Minutes;
    space_objects[23] = new Space_Object("Neptune", 17.147, 30078000, 2.1802,
      200, 331, 1000000);
    //Orbital Period = 8462.66976 Minutes;
    space_objects[24] = new Space_Object("Triton", 0.0035816, 2371.42 + 30078000, 1.76068 + 2.1802,
      50, 50, 10000);
      
      
    //Pluto And Charon (The rest of Plutos moons are very small, and thus not included)
    //Orbital Period = 130406400 Minutes;
    space_objects[25] = new Space_Object("Pluto", 0.00218, 39482000, 1.9023,
      120, 120, 500000);
    //Orbital Period = 9197.6118 Minutes;
    space_objects[26] = new Space_Object("Charon", 0.0002656, 130.96 + 39482000, 0.08946 + 1.9023,
      50, 50, 10000);
    
    
    //Eris (Dysnomia is very small and thus not included)
    //Orbital Period = 294046560 Minutes;
    space_objects[27] = new Space_Object("Eris", 0.002757, 67864000, 1.45012,
      150, 150, 500000);
      
    // We need to calculate the Suns starting velocity. Since action = reaction or whatever,
    //all the objects having momentum in one direction will cause the sun to have an equal amound of momemtum in the opposite direction.
    //First, we need the momenta of all objects:
    //Momentum = Mass * Velocity
    
    double total_mass = 0;
    double total_momentum = 0;
    for (int i=0; i<objects; i++) {
      total_mass = total_mass + space_objects[i].mass;
      total_momentum = total_momentum + (space_objects[i].mass * space_objects[i].velocity.y);
    }
    double sun_velocity = total_momentum/total_mass;
    
    //Now we give the Sun it's momentum in the opposite direction. Since the Sun has a very big mass compared to the other objects,
    //the velocity of the Sun resulting from this momentum is quite small (but still noticeable).
    //We also subtract this velocity from all other objects, so their velocity stays the same relative to the Sun
    for (int i=0; i<objects; i++) {
      space_objects[i].velocity.y = space_objects[i].velocity.y - sun_velocity;
    }
    
    //We just initialize the current mouse over as null
    current_mouse_over = null;
    
  }


  public void drawSystem() {
    boolean found_mouse_over = false;
    
    //Due to the objects order in the space_objects array, we draw them from the "top down",
    //so that more important objects will be drawn on top of less important ones
    for (int i=objects-1; i>=0; i--) {
      space_objects[i].drawObject();
      
      //We chech for each object if they're being moused over
      if (space_objects[i].being_moused_over) {
        current_mouse_over = space_objects[i];
        found_mouse_over = true;
      }
    }
    //If no objects were found to be under the mouse, we set the current_mouse_ober object to null
    if (!found_mouse_over) {
      current_mouse_over = null;
    }
  }
  
  //We move the objects using the gravitational force formula
  public void moveObjects() {
    
    //The gravitational constant in SI units (m^3 * kg^-1 * s^-2):
    //6.67408 * 10^-11
    //The gravitational constant in my chosen units ((Astronomical Unit / 1,000,000)^3 * (Earth masses)^-1 * (Minutes)^-2):
    double g = 428.59985;
    
    //Formulas
    //Gravity force: Fg = (G*m1*m2)/r^2
    
    double r;
    DVector force, acceleration_i, acceleration_j;
    
    //Any two objects with mass always pull on each other with an equal force, but in opposite directions.
    //Thus we need to calculate the force applied to an object by every other object in the simulation.
    //The forces between most of the objects will be negligible, but I found it to be simpler to be thorough,
    //and just calculate all the forces at play.
    
    for (int i=0; i<objects; i++) {
      //Since each loop of the outer for loop calculates the force between object i and every other object,
      //We can exclude that object in the next loop. Thus, j in the inner for loop starts on i+1 instead of 0
      for (int j=i+1; j<objects; j++) {
        
        //We first create a vector pointing from body i to body j
        force = space_objects[i].position.copy();
        force.sub(space_objects[j].position);
        
        //We then find the distance from body i to body j with the mag() function
        r = force.mag();
        
        //We compute body i's and body j's gravitational pull towards each other,
        //split between the x and y direction with the normalized vector
        //(The force in the x direction plus the force in the y direction will always be equal to the full force)
        force.normalize();
        force.mult((-space_objects[i].mass * space_objects[j].mass * g)/(r*r));
        
        //We calculate the acceleration of the objects as a result of the force applied on them:
        //Acceleration = Force / Mass
        //The force applied on each object is equal, but their resulting accelerations may be different,
        //since their masses might be different
        acceleration_i = force.copy().div(space_objects[i].mass);
        acceleration_j = force.copy().div(space_objects[j].mass);
        
        //We add the resulting acceleration to object i
        space_objects[i].velocity.add(acceleration_i);
        //The acceleration of object j is also applied, but in the opposite direction.
        space_objects[j].velocity.sub(acceleration_j);
        
      }
      
      //When we have calculated the velocity of object i as a result of every other object applying force on it,
      //we update its location as a result of that velocity
      space_objects[i].position.add(space_objects[i].velocity);
    }
  }
}
