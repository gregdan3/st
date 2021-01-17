build:
	makepkg -si

clean:
	rm -rf pkg src st *.diff

purge:
	rm -rf pkg src st *.diff *.zst
