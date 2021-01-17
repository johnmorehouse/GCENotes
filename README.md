# gcs-rstudio-guide

This folder contains a short guide on how to integrate Google Cloud Storage with an Rstudio GCE instance (intended for people with very little background in cloud computing, like myself). This is a direct extension of what I learned in [Grant McDermott's](http://grantmcdermott.com/) class, and I strongly suggest you head over to [his notes](https://raw.githack.com/uo-ec607/lectures/master/14-gce/14-gce.html#requirements) for a more in depth look at the basics of cloud computing. 

The notes are in html format and can be found [here](https://rawcdn.githack.com/johnmorehouse/gcs-rstudio-guide/16f2a3ea03349fa2e62ef61f7353c78e9408c271/gce_notes/gce_notes.html). The shell script I run to set everything up can be found [here](https://github.com/johnmorehouse/gcs-rstudio-guide/blob/main/setup_r.sh).

I also have included a shell script ([here](https://github.com/johnmorehouse/gcs-rstudio-guide/blob/main/setup_jupyter.sh)) that deploys Jupyter with a [Julia](https://julialang.org/) kernel installed on a GCE VM (and the storage works very similarly).

Suggestions are always welcome.
