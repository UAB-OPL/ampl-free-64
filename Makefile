TARGETS := ampl.linux-intel64 make_check_desktop
  
all: $(TARGETS)

# Descarga de software para /opt
ampl.linux-intel64:
	rm -rf amplide.linux-intel64
	wget --continue -O- https://ampl.com/demo/amplide.linux64.tgz | tar zxlv

# Revisar .desktop 
make_check_desktop: *.desktop
	for d in $+ ; do \
		desktop-file-validate $$d ; \
	done
	touch $@

# Limpiar
clean:
	rm -rf $(TARGETS)


