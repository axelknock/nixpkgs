{ lib, stdenv
, fetchurl
, cairo
, meson
, ninja
, pkg-config
, gstreamer
, gst-plugins-base
, gst-plugins-bad
, gst-rtsp-server
, python3
, gobject-introspection
, hotdoc
, json-glib
}:

stdenv.mkDerivation rec {
  pname = "gst-devtools";
  version = "1.22.2";

  src = fetchurl {
    url = "https://gstreamer.freedesktop.org/src/${pname}/${pname}-${version}.tar.xz";
    hash = "sha256-62JybT4nqHgjaaJP1jZKiIXtJGKzu9qwkd/8gTnuBtg=";
  };

  outputs = [
    "out"
    "dev"
  ];

  depsBuildBuild = [
    pkg-config
  ];

  nativeBuildInputs = [
    meson
    ninja
    pkg-config
    gobject-introspection

    # documentation
    hotdoc
  ];

  buildInputs = [
    cairo
    python3
    json-glib
    gobject-introspection
  ];

  propagatedBuildInputs = [
    gstreamer
    gst-plugins-base
    gst-plugins-bad
    gst-rtsp-server
  ];

  meta = with lib; {
    description = "Integration testing infrastructure for the GStreamer framework";
    homepage = "https://gstreamer.freedesktop.org";
    license = licenses.lgpl2Plus;
    platforms = platforms.unix;
  };
}
