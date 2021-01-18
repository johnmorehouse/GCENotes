#This script checks for an "output file" in a bucket from a program being executed on GCE instance
	#if the file exists, it stops the instance. 
	#I usually run this with "cron" -- which executes this program every X minutes

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