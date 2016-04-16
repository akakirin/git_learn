
#最开始的设置
git config --global user.name "akakirin"
git config --global user.email "wjy19910207@126.com"

#创建版本库/仓库（repository）
mkdir yiwei_library
cd yiwei_library
pwd
#以上应在想保存的文件夹进行，用cd去打开

git init
ls -ah    #在yiwei_library下会产生.git的文件夹，但是是隐藏的，用此命令即可见

#把文件添加到版本库
git add yiweivol1.php              #可以一次一个地提交多个文件
git commit -m "add vol1 file "      #用commit可以一次性上传多个，冒号部分作说明

#用git status查看修改情况，用git diff查看修改了哪些东西
git status
git diff查看修改了哪些东西

#再次重复add和commit
git add yiweivol1.php
git status      #可以在这里看到yiweivol1.php正在提交修改
git commit -m "delate some notes" 

git status     #最后使用status可以看见nothing to commit，即目前没有需要提交的修改

#git的版本回退
#首先再作一次修改，这次改烂了
git status
git diff
q        #用q推出历史记录列表

git add yiweivol1.php
git status
git commit -m "delate some codes"

git status

#现在进行回退
#首先，看看版本修改log
git log --pretty=oneline

#每个版本记录是一个commit，有一个commit id，就是之前的那个16位数字
git reset --hard HEAD^   #这里面HEAD^表示倒数第二个版本，HEAD为当前版本，HEAD^^则表示倒数第三个版本，用参数hard指定回滚的版本
git reset --hard b5c0378dd197394    #或者用这句，hard后面接想回滚版本的commit id（只需要一部分）

git log --pretty=oneline   #这样就只存在两个版本了

#后悔了咋办？用reflog查看操作记录
git reflog
#找到最新一条的commit id，用reset回来
git reset --hard 514343d 


#好勒，我们现在再回到delate notes的版本
git reset --hard b5c0378dd197394

#git管理的是修改，而不是文件，因此迅速
#对撤销的修改

git checkout -- yiweivol1.php    #把工作区的修改全撤销，或者把add到暂存区后的修改去掉

#对于已经到了暂存区的修改,先用reset把该修改从暂存区撤回到工作区，再用checkout撤销修改

git reset HEAD yiweivol1.php
git checkout -- yiweivol1.php



#删除操作
git add 11.txt
git commit -m "add 11 txt"   #用这两步上传11.txt到版本库

rm 11.txt                    #删除该txt文件，但只是在工作区删除，版本库中还有

#想倒回时
git checkout -- 11.txt

#想彻底删除时

git rm 11.txt
git commit -m "remove 11 from git"


#杀手级功能：远程仓库！
  #连接github
  ssh-keygen -t rsa -C "wjy19910207@126.com"    #创建SSHkey，在默认的目录下生成两个文件，id_rsa为公钥，id_rsa.pub为公钥
  #在github上点ssh key，将id_rsa.pub中内容复制，确认即可，可以提交多台设备的ssh key


#在本地建立后，推送到远程github上
#首先在github上创立repository，名字选的和本地库一样，然后用一下两个命令：
git remote add origin https://github.com/akakirin/git_learn.git   #关联远程库
git push -u origin master                                         #进行master分支的推送和远程、本地master分支的关联

git push origin master           #之后，改动的文件用这个推送就好啦，不需要-u了就

#从github上克隆
git clone git@github.com:akakirin/git_learn.git  #这是另一种方式

#push时出现报错，其实是因为本地没有readme，使用以下代码：
git pull --rebase origin master
#之后再push就好了

#之后出现RPCfailed，这是因为文件大小受限，打开文件夹中隐藏的.git文件夹，在config文件后加上：
[http]  
    postBuffer = 524288000 
  





