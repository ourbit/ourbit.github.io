git checkout master &&
mkdir dontdelete  &&
cp -r _site dontdelete/_site &&
cp index.html dontdelete/index.html &&

find . -maxdepth 1 ! -name 'dontdelete' ! -name '.*' | xargs rm -rf &&
cp -r dontdelete/_site/* . &&
cp -r dontdelete/index.html .

rm -rf dontdelete


touch .nojekyll