build:
	makepkg -si

update:
	updpkgsums

clean:
	rm -rf pkg src st *.diff

purge:
	rm -rf pkg src st *.diff *.zst
