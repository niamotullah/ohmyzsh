## JAVA_HOME
if command -v java &> /dev/null
then
	export JAVA_HOME="$(readlink -f /usr/bin/java | sed "s:/bin/java::")" 
fi
