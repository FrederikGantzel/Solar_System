# Solar_System
A physics based model of the Solar System that I created as a hobby project.

## Installation
Download the "Solar_System" folder and put it on your desktop or wherever else feels best for you. The program is written with Processing, and thus it is easily run using this application. Processing can be downloaded here: https://processing.org/download

When you have Processing installed, simply open the Solar_System folder in Processing and press the "Play" button. The simulation is set to fullscreen by default, but if you'd rather it be windowed, open the Solar_System.pde file, comment out the fullScreen(); command on line 21, and un-comment the size() command on line 20 (and potentially edit the dimentions of the window set in the size() command).

## Usage
The program is a big physics based model of the Solar System. The program simply sets up the mass, position, and velocity of all the objects, and then let the laws of physics take it from there. The user can interact with the simulation using the mouse; They can zoom in or our using the mouse scrolling wheel, they can drag the camera around by clicking and dragging their cursor, and they can click on an object to set in in focus view. The right and left arrow keys can also be used to speed up or slow down time, and the spacebar can be pressed to pause the simulation.

Most of the important objects in the Solar System are included, including the Sun, planets, some of the dwarf planets, and some of the planet's most important moons (since the moons' orbits around their parent planet are very small compared to the planet's orbit around the Sun, the user will need to zoom in pretty far in order to see the moons)

## Screenshots
![image](https://user-images.githubusercontent.com/91853323/223276683-966266a0-1105-46f7-b4d3-5db98926d805.png)
![image](https://user-images.githubusercontent.com/91853323/223276873-e2bb3b68-3a71-466f-97fd-b1db22400f54.png)
![image](https://user-images.githubusercontent.com/91853323/223277085-10f26e0d-b34e-4759-9595-e74713ca6a5e.png)
![image](https://user-images.githubusercontent.com/91853323/223277243-3443a63c-cda1-4bbc-9ba1-447b216611d0.png)


## Simplifications & Limitations
In order to simplify the simulation, the Solar System is modelled in 2d, even though the real Solar System obviously works in 3d space.

When simulating the objects' orbits, i do not take into account their real-life eccentricity (that is, their orbits are more or less perfectly circular in this simulation, even though many objects real-life orbits are elliptical to a certain extent). When inputting the objects' starting distance from the Sun, i simply input their semi-major axis.

The objects' starting position is a perfect line along the x-axis, and thus their starting velocities are in exactly the y direction. The objects can never line up this way in real life, due to their respective orbital periods, but setting their starting positions and velocities this way significantly simplified the setup process.

When the time is sped up fast enough, the framerate of the simulation starts to drop dramatically, since the amound of calculations needed to be done each frame doubles with each speed up of time. The framerate will thus depend a lot on the device you are running the simulation on. Stronger devices might be able to handle the simulation on max speed just fine, but if you are running on a weaker device, you should probably stick to the lower time speeds.


