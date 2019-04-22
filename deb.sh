## repack deb package with gzip
dpkg-deb -R package.deb tmp
rm package.deb
fakeroot dpkg-deb -Zgzip -b tmp package.deb
rm -rf tmp
