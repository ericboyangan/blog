bundle exec jekyll build
rm -rf docs/
mkdir docs/
cp -R _site/* docs/
