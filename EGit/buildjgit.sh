set -x
curr_dir=`pwd`
#java_7_home="E:/tools/FUJITSU_JDK7"
java_7_home="F:/JDK7"
maven_home="E:/software/apache-maven-3.2.5"
###############################################

# eg. /cygdrive/e/some/path
filepath_cygwin=$(cd `dirname $(echo $0)`;pwd;)
# eg. e:/some/path
filepath_dos=$(echo $filepath_cygwin | sed 's/\/cygdrive\/\([a-zA-Z]\)/\1:/')

cygwin_java_home=$(echo $java_7_home | sed 's/\(.\):/\/cygdrive\/\1/')
export PATH=/bin:$cygwin_java_home/bin:/cygdrive/c/windows:/cygdrive/c/windows/system32
JAVA_HOME=$cygwin_java_home
export MAVEN_OPTS="-Xmx1200m"
###############################################

echo "[INFO] test java version"
java -version
echo "[INFO] test mvn version"
$maven_home/bin/mvn -version
###############################################
tmp_dir=$filepath_dos/tmp
maven_repos_dir=$filepath_dos/maven_repo-jgit

cd src
cd JGit
$maven_home/bin/mvn clean install -o \
-Dmaven.skip.test=true \
-Dmaven.repo.local=$maven_repos_dir 

$maven_home/bin/mvn clean install -o \
-f org.eclipse.jgit.packaging/pom.xml \
-Djava.io.tmpdir=$tmp_dir \
-Dmaven.skip.test=true \
-Dmaven.repo.local=$maven_repos_dir 
