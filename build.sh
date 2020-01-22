#!/bin/env sh

echo "Building addon package..."

rm -rf dist
mkdir dist

files=(
	index.html
	manifest.json
	logo.svg
	logo48.png
	logo128.png
)
package="firefox-native-new-tab.zip"

for file in ${files[@]}; do
	echo "Copying $file..."
	cp -f "$file" "dist/$file"
done

echo "Zipping... (requires \"zip\")"

cd dist
zip -r "../$package" .
cd ..

echo "Done!"
