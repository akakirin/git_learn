
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