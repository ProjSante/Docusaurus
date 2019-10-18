---
id: git-gitflow
title: GitFlow
sidebar_label: GitFlow
---

> We use [GitFlow](https://nvie.com/posts/a-successful-git-branching-model/). So, if you want to contribute, follow these steps:

### Update your workstation :nerd_face::computer:
```
$ git checkout develop

# Make sure your upstream points to git@github.com:ProjSante/webapp.git
$ git remote -v
# You must see (upstream) git@github.com:ProjSante/webapp.git (fetch/push)

# If you don't
$ git remote add upstream git@github.com:ProjSante/webapp.git
# (upstream) git@github.com:ProjSante/webapp.git (fetch/pull)

# When you do
$ git pull upstream develop
```
### Working on a feature
Now, lets say you want to work on a feature from the [issues](https://github.com/ProjSante/webapp/issues).
```
# Create a branch called feature/feature-12 if you're working on a feature of issue #12
$ git checkout -b feature/feature-<issue-nb>
```
Where `<issue-nb>` is the issue number (from [here](https://github.com/ProjSante/webapp/issues)) you will be working on 

### Working
 Time to work and make logical commit blocks.

1. If along the way you stumble on something wrong, do NOT change it, Instead, submit an issue. Each pull request must contain only the code necessary for that issue
2. Test your code
3. Stage the files
```
$ git add <files-you-changed>
```
4. Commit with a **meaningful** message
```
$ git commit -m 'That message'
```

### Merging
Merge `feature/feature-<issue-nb>` back into `develop` branch
```
# Switch to branch 'develop'
$ git checkout develop

# Merge the modifications onto branch develop
$ git merge --no-ff feature/feature-<issue-nb>

```
> The **no-ff** flag avoids losing information about the historical existence of a feature branch


### Updating locally before Pull Request
Let's say, in the mean time others have contributed to this project. So, you need to update you files, with those updates. So, before you make a pull request
```
$ git pull upstream develop
```
You might have conflicts. It is when you and someone else modified the same file. You need to resolve them before proceeding.

Now, you have your local :nerd_face::computer: working directory updated.
Next step is to `push` the code firstly to your Github repo `github.com/<your_user>/webapp`

### Push to your repo
Push modifications to your Github repo `github.com/<your_user>/webapp`
```
# Resolve the conflicts, then push to your Github branch
$ git push origin develop
```
### Pull Request Time
Then open a Pull Request. Go to your fork of the project `github.com/<your_user>/webapp` and smash that `Pull Request` button (just between the files and the clone/download button).

Checkout guideline> s on how to make a **Pull Request**

### Delete Branch
If your Pull Request is accepted you can go on and delete that feature branch
```
# Delete branch feature/feature-nb
$ git branch -d myfeature
$ git push origin develop
```