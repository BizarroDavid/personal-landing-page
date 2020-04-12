# What is this?

I use this project to manage my personal landing page, https://www.davidtorres.dev. This project uses 
a containerized [Hugo](https://gohugo.io/) image to manage my static content. 

# Prereqs
Make sure you are in a *nix environment and make sure you have installed Docker.

# First time setup

Build your docker image  by running

```
make docker-image 
```

# How to develop 

For convienence you can run `source ./scripts/alias-setup.sh hugo new`. This sets up some aliases that allow you to run Hugo as if it's installed natively onto your machine. 

* `hugo` calls the hugo command. You can add any additional arguments.
* `hugo-server` is a convienence command to run the hugo-server locally (on port 1919.) Use this   
        to see updates to your site as you develop.

To start developing run `hugo-server` and start editing the config.toml file. 

Note: The container dynamically binds the ./src directory into the container. Anything outside of this directory isn't visible to hugo.




# How to publish 

Run `make publish`. Your content will be put in `./src/public`

Note: In config.toml you can set your deployment target, just 
look for a section titles `[[deployment.targets]]`

I use AWS so my makefile requires that you have your AWS credentials 
in memory. See the makefile for more info. 


# How it works / Architecture

This project uses a containerized Hugo image to build and publish static content for my landing page. All hugo source should be in the `src` directory (anything outside of this directory will not be visible to the container.)

`config.toml` is the high-level file to edit (this paramaterizes much of the content on the front page.)

# My Publish Process 

* Add the unix epoc timestamp to the `footercontent` variable in the config file. (This is my manual "build number")
    * run `date +%s` to get the epoc time.
* Run `make publish`
* Tag your repo


# Other Stuff 

How to configure CloundFront and S3 : [video](https://www.youtube.com/watch?v=DiIaoIcoKNY).



# Themes that I like 

https://themes.gohugo.io/hugo-coder/ - https://github.com/luizdepra/hugo-coder/



# Todo 

* automate the "build number" step in my publish process.




