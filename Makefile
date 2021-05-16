build:
	makepkg -si

update:
	updpkgsums

clean:
	rm -rf pkg src st st-bold-is-not-bright-20190127-3be4cf1.diff  st-boxdraw_v2-0.8.3.diff

purge: clean
	rm -rf *.zst
