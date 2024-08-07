# ROS in docker: IA-MPPI for Roboat 

##  Usage
This docker container runs all related dependencies for working with IA-MPPI with the Roboat model. You will need to have [Docker](https://docs.docker.com/engine/install/ubuntu/#install-using-the-repository) (+docker compose) in your machine. 

## Tested host-machines
- Ubuntu 22.04


## How to use the container:
1. Git clone the repo locally and `cd` into it.
1. Install whatever packages you need/want in src/. For now, we add the basic ones we will often need by running: `clone_dependencies.sh`:
``` bash
chmod +x ./clone_dependencies.sh
./clone_dependencies.sh
```
Remember, all the workspace, including src/ is mounted in the docker, so you can install dependencies from the host machine. The dependencies for the packages installed via ./install_dependencies.sh, which are: src/dinova_motion and src/dinova are standardly added to the dockerfile. 

### Run container (with VS code for convenience)

1. Launch 
   ```bash
   code .
   ``` 
   Then hit "reopen the current folder in a container" when notified, this should launch a full dev environemnt with some extensions to develop your ROS application in the dockerize environment
1. If you want to rebuild the image, run the `Rebuild container` command, Ctrl+Shift+p and type "Rebuild...", it should appear, just select and enter.

## Adding dependencies to your docker:
When you want to adapt the dependencies in the docker file [Dockerfile](./Dockerfile)., this requires a re-build of the image:
1. Launch the `Dev containers: Rebuild container`, via Ctrl+shift+p

## Building the workspace
Once you have the container open in VS Code, press Ctrl+Shift+p and type "build...". Then select "Task: Run Build Task".
This should compile all the code in the src folder of the workspace.

## Running an example:
For a quick test, run:
``` bash
   roslaunch mppi_evaluation tight_crossing_head_on.launch
```
If you cannot find the package, make sure you source devel/setup.zsh

<!--
## Working with the real-robot:
If you work with the real robot, inst
