

#set up instance
sudo gcloud compute instances create rstudio --image-family ubuntu-1804-lts --image-project ubuntu-os-cloud  --machine-type f1-micro --zone us-west1-a

#setup fire-wall
sudo gcloud compute firewall-rules create allow-rstudio --allow=tcp:8787

#login to instance
sudo gcloud compute ssh rstudio --zone us-west1-a

#setup r
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E298A3A825C0D65DFD57CBB651716619E084DAB9
sudo add-apt-repository 'deb https://cloud.r-project.org/bin/linux/ubuntu bionic-cran40/'
apt update
apt install r-base


#setup rstudio
apt install gdebi-core
wget https://download2.rstudio.org/server/xenial/amd64/rstudio-server-1.3.1093-amd64.deb
sudo gdebi rstudio-server-1.3.1093-amd64.deb

#install certain libraries
apt install libcurl4-openssl-dev libssl-dev libxml2-dev
add-apt-repository -y ppa:ubuntugis/ubuntugis-unstable
apt update && apt upgrade
apt install libgeos-dev libproj-dev libgdal-dev



#setup username
adduser johnm


#log in with external_ip:8787

#remove bucket from project


#setup gcfuse ---------------------------------------

cd /home/johnm
export GCSFUSE_REPO=gcsfuse-`lsb_release -c -s`
echo "deb http://packages.cloud.google.com/apt $GCSFUSE_REPO main" | sudo tee /etc/apt/sources.list.d/gcsfuse.list
curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
sudo apt-get update
sudo apt-get install gcsfuse


#mount bucket to project-----------------------------
mkdir /home/johnm/test_folder
gcsfuse johnm-testbucket  test_folder
fusermount -u /bucket

gcfuse -o allow_other
