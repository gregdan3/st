# Maintainer: Gregory G Danielson III <gregdan3@protonmail.com>

pkgname=st
pkgver=0.8.4
pkgrel=1
pkgdesc="A simple virtual terminal emulator for X."
arch=("x86_64")
license=('MIT')
depends=()
url=https://st.suckless.org
_patches=("https://st.suckless.org/patches/boxdraw/st-boxdraw_v2-0.8.3.diff"
          "https://st.suckless.org/patches/bold-is-not-bright/st-bold-is-not-bright-20190127-3be4cf1.diff"
          "https://st.suckless.org/patches/font2/st-font2-20190416-ba72400.diff")
          # "https://st.suckless.org/patches/scrollback/st-scrollback-20201205-4ef0cbd.diff"
          # "https://st.suckless.org/patches/scrollback/st-scrollback-mouse-20191024-a2c479c.diff"
          # "https://st.suckless.org/patches/scrollback/st-scrollback-mouse-altscreen-20200416-5703aa0.diff")
source=("git://git.suckless.org/st"
        "config.h"
        "${_patches[@]}")
sha256sums=('SKIP'
            'fb67f0b75f07c3882aeac6ddc757941428ca36031e4c62c86cac9b7a8e136372'
            'a24118148631f6670ea568a3debdd00a7cbcfa525839281888e876e7ea409658'
            '329169acac7ceaf901995d6e0897913089b799d8cd150c7f04c902f4a5b8eab2'
            '7279c787dba23d72a8a0a4613c0917e03d0087f0254f56a530cd9c521857d20b')
_sourcedir=("$pkgname")
_makeopts="--directory=$_sourcedir"

prepare() {
  for patch in "${_patches[@]}"; do
	echo "Applying patch $(basename $patch)..."
    patch -Np1 -d "$srcdir/$pkgname" -i "$srcdir/$(basename $patch)"
  done
  cp "config.h" "$srcdir/$pkgname"
}

build() {
  make $_makeopts
}

package() {
  local installopts='--mode 0644 -D --target-directory'
  local shrdir="$pkgdir/usr/share"
  local licdir="$shrdir/licenses/$pkgname"
  local docdir="$shrdir/doc/$pkgname"
  make $_makeopts PREFIX=/usr DESTDIR="$pkgdir" install
  install $installopts "$licdir" "$_sourcedir/LICENSE"
  install $installopts "$docdir" "$_sourcedir/README"
  install $installopts "$shrdir/$pkgname" "$_sourcedir/st.info"
}
