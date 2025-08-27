kubectl create secret generic basicsecret						\
	--from-file=basic.txt=c3-basic-users.txt 					\
	--namespace confluent
