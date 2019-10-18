# Make sure you're on root folder 'docusaurus'

# Remove existing build folder
rm -fr website/build

# Create branch 'master' on submodule 'build' and commit
# If using bin/bash
git submodule add -f -b master git@github.com:ProjSante/ProjSante.github.io.git build # && git commit -m "Build new Docs"

# Build optimised Docs website
npm run build --prefix website

# Copy /website/build/site into /build
cp -r website/build/site/ build/

# Go into /build
cd build/

# Stage and commit build files
git commit -am "New build"

# Pushing
git push origin master

# Go to build directory to push
cd website/build/site

# Stage files
git add .

