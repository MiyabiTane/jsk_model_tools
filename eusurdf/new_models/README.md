## eusで作ったモデルをgazebo内に出現させる<br>
### eusモデルからurdf<br>
/opt/ros/以下は書き込み権限がないのでgit cloneしてきて使う。<br>
```
mkdir -p jsk_model_tools/src
cd ..
catkin init
cd src
wstool init
git clone https://github.com/jsk-ros-pkg/jsk_model_tools
cd ..
rosdep update
rosdep install --from-paths src --ignore-src -y -r
catkin build
```
例えばタコさんウインナーを作るとしたら
~/jsk_model_tools/src/jsk_model_tools/eusurdf/new_modelsフォルダを作成してtakosan-wiener-object.lを置き、<br>
```
source ~/jsk_model_tools/devel/setup.bash 
roseus  convert-eus-to-urdf.l
(load "package://eusurdf/new_models/takosan-wiener-object.l")
(irteus2urdf-for-gazebo (takosan-wiener) :name "takosan-wiener")
```
とすればもmodelsにtakosan-wienerが生成される。<br>

