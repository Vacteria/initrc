#!/usr/bin/make -f

DESTDIR =
LSBDIR = /lib/init
RCDIR = /etc/rc.d
RCCONF = /etc/rc.conf.d

install :
	for DIR in $(LSBDIR) $(RCDIR) $(RCCONF); do\
		install -d -m 0755 $(DESTDIR)/$$DIR; \
	done

	install -m 0644 init/* $(DESTDIR)/$(LSBDIR)
	install -m 0744 rc.d/* $(DESTDIR)/$(RCDIR)
	install -m 0644 rc.conf.d/* $(DESTDIR)/$(RCCONF)
	
	chmod 744 $(DESTDIR)/$(LSBDIR)/rc
