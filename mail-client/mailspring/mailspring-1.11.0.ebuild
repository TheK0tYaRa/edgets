# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# File was automatically generated by automatic-ebuild-maker
# https://github.com/BlueManCZ/automatic-ebuild-maker

EAPI=8
inherit unpacker xdg

DESCRIPTION="The best email app for people and teams at work"
HOMEPAGE="https://getmailspring.com"
SRC_URI="https://github.com/Foundry376/Mailspring/releases/download/${PV}/mailspring-${PV}-amd64.deb -> mailspring-${PV}.deb"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="-* ~amd64"
RESTRICT="bindist mirror"
IUSE="doc libnotify"

RDEPEND="app-crypt/libsecret
	dev-libs/libgcrypt
	dev-libs/nss
	gnome-base/gnome-keyring
	sys-libs/db
	virtual/libudev
	x11-libs/gtk+:2
	x11-libs/libXtst
	x11-misc/xdg-utils
	libnotify? ( x11-libs/libnotify )
	|| (
		dev-libs/glib:2
		gnome-base/gvfs
	)"

QA_PREBUILT="*"

S=${WORKDIR}

src_prepare() {
	default

	mv "usr/share/appdata" "usr/share/metainfo" || die "mv failed"
}

src_install() {
	cp -a . "${ED}" || die "cp failed"

	rm -r "${ED}/usr/share/doc/mailspring" || die "rm failed"

	if use doc ; then
		dodoc -r "usr/share/doc/mailspring/"* || die "dodoc failed"
	fi
}
