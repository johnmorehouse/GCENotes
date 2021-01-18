# Some tips for GCE 

I am compiling a small list of tricks for [Google Compute Engine](https://www.google.com/search?q=google+compute+engine&oq=google+com&aqs=chrome.0.69i59l2j69i60l3j69i65l3.1687j0j9&sourceid=chrome&ie=UTF-8) and the software I use frequently: R and Julia. There is a lot of information out there on these things, but I wanted to put together something that was incredibly begginer friendly (as I am one!). 

I have a short guide on how to integrate Google Cloud Storage with Rstudio deployed on a GCE instance. These notes are a direct extension of what I learned in [Grant McDermott's](http://grantmcdermott.com/) class, and I strongly suggest you head over to [his notes](https://raw.githack.com/uo-ec607/lectures/master/14-gce/14-gce.html#requirements) for a more in depth look at the basics of cloud computing. I also have included a shell script that sets up Jupyter with a Julia kernel installed. Lastly, I have included a handy script that checks to see if the desired output from one of your program exists in a storage bucket. If it exists, it shuts the instance down. I am very new to these things, so suggestions are always welcome. 



- __Rstudio + Google Cloud Storage + GCE__: [Notes](https://rawcdn.githack.com/johnmorehouse/gcs-rstudio-guide/40f9cdf8689c11a6f7f1aded8ce87a2e61f5eee7/gce_notes/gce_notes.html). [Script](https://github.com/johnmorehouse/gcs-rstudio-guide/blob/main/setup_r.sh). 

- __Jupyter + Julia on GCE Instance__:  Deploy Jupyter with a [Julia](https://julialang.org/) kernel installed on a GCE VM -- [Script](https://github.com/johnmorehouse/gcs-rstudio-guide/blob/main/setup_jupyter.sh)

- __Automatically shut-down your instance when done:__ Check a Cloud Storage bucket every X minutes (or hours/days) for an output from your program (using [cron](https://ole.michelsen.dk/blog/schedule-jobs-with-crontab-on-mac-osx/), or something similar. When it finds the desired output (_e.g_ your script is done running), shut the instance down. [Script](https://rawcdn.githack.com/johnmorehouse/gcs-rstudio-guide/de919432ccc075010ac08b2285bdb01b7230f913/check_output.sh).

Suggestions are always welcome.
