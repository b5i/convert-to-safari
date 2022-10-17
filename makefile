all: macos

clean:
	rm -rf safari-extension
	rm -rf safari-extension-build

ios: clean
	xcrun safari-web-extension-converter "$(PWD)" --project-location safari-extension --force 

create-without-open: clean
	xcrun safari-web-extension-converter "$(PWD)" --project-location safari-extension --force --no-open

macos: create-without-open
	xcodebuild -workspace "safari-extension/NAME-OF-YOUR-APP/NAME-OF-YOUR-APP.xcworkspace" -scheme "NAME-OF-YOUR-APP (macOS)" -configuration Debug clean build CONFIGURATION_BUILD_DIR="$(PWD)/safari-extension-build"
	echo "App available at $(PWD)/safari-extension-build"
