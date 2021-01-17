

#set up instance
sudo gcloud compute instances create atom --image-family ubuntu-1604-lts --image-project ubuntu-os-cloud  --machine-type n1-standard-8 --zone us-west1-a

#setup fire-wall
sudo gcloud compute firewall-rules create allow-atom --allow=tcp:8888

#login to instance
sudo gcloud compute ssh atom --zone us-west1-a

#was running into some certification error down the line. this fixed it
sudo mkdir -p /etc/pki/tls/certs
sudo cp /etc/ssl/certs/ca-certificates.crt /etc/pki/tls/certs/ca-bundle.crt


#install some anaconda dependencies
sudo apt update -y
sudo apt-get install libgl1-mesa-glx libegl1-mesa libxrandr2 libxrandr2 libxss1 libxcursor1 libxcomposite1 libasound2 libxi6 libxtst6

#install julia
sudo JULIA_VERSION=1.3.1 bash -ci "$(curl -fsSL https://raw.githubusercontent.com/abelsiqueira/jill/master/jill.sh)"
ln -s /opt/julias/julia-1.3.1/bin/julias /usr/local/bin


#install anaconda
wget http://repo.continuum.io/archive/Anaconda3-4.0.0-Linux-x86_64.sh
bash Anaconda3-4.0.0-Linux-x86_64.sh
source ~/.bashrc

#create config file
jupyter notebook --generate-config
nano .jupyter/jupyter_notebook_config.py

##ADD THIS TO CONFIG file
c = get_config()
c.NotebookApp.ip = '*'
c.NotebookApp.open_browser = False
c.NotebookApp.port = 8888


#I think this points Julia to anaconda. Or vice versa
export PATH=~/anaconda3/bin:$PATH

#setup and run IJulia

cat <<IJULIA > ijulia.jl
ENV["JUPYTER"] = "anaconda3/bin/jupyter"
using Pkg
Pkg.add("IJulia")
Pkg.build("IJulia")
IJULIA


ENV["JUPYTER"] = "anaconda3/bin/jupyter"


#storage stuff ----------------------------------------------------------------
#setup gcfuse ---------------------------------------


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


#Launch notebook----------------------------------------------------------------
jupyter-notebook --no-browser --port=8888
