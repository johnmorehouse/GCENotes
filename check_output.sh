#This script checks for an "output file" in a bucket from a program being executed on GCE instance
	#If the file exists, it stops the instance. 
	#I usually run this with "cron" -- which executes this program every X minutes
	#NOTE: you may need to give yourself permission to execute this (not as sudo). can use something like
		#sudo chmod 755 '<PATH_TO>check_output.sh' in your terminal


#get path from running echo $PATH in the terminal
PATH=<PATH HERE>

#specify output file with path (get this using gsutil ls -r gs://BUCKET_NAME/**)
file= <cloud bucket path here>
gsutil -q stat $file_path
status=$?

#kill the instance if there, keep going if not
if [[ $status == 0 ]]; then
	gcloud compute instances stop <INSTANCE_NAME>
else
  echo "Still going"
fi
