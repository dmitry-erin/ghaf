{ lib, writeText, fetchFromGitHub, stdenv, makeWrapper, flutter, dart }:

stdenv.mkDerivation {
  pname = "flutter_calculator";
  name = "flutter_calculator";
  src = fetchFromGitHub {
    owner = "dmitry-erin";
    repo = "FlutterCalculator";
    rev = "development";
    sha256 = "sha256-R6GckyKw3KNtxVZZLxuGGFZVH45E3byZgvUrVn3N0ag=";
  };

  nativeBuildInputs = [
    makeWrapper
  ];
  
  buildInputs = [
    flutter
    dart
  ];

  phases = ["installPhase"];

  installPhase = ''
    #temporary directory for caches and configs
    export HOME=$TMPDIR
    #export PUB_HOSTED_URL=https://pub.flutter-io.cn
    #export FLUTTER_STORAGE_BASE_URL=https://storage.flutter-io.cn
    
    #create directory for build
    mkdir -p $out
    cp -r $src/* $out
    cd $out
    
    #add linux platform
    flutter create --platforms=linux "$pname"
    
    #get dependencies
    flutter pub get
    flutter pub upgrade
    
    #build
    flutter build linux
  '';

  meta = with lib; {
    description = "Flutter Calculator app";
    license = licenses.mit;
    platforms = platforms.all;
  };
}
