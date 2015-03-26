prefix = /usr/local
sbindir = $(prefix)/sbin

etcdir = $(prefix)/etc
cronddir = $(etcdir)/cron.d

setowner = -oroot

binmode = -m500
crondmode = -m600

default all:

install: $(DESTDIR)$(sbindir)/daddy
install: $(DESTDIR)$(cronddir)/daddy.sample

$(DESTDIR)$(sbindir)/daddy: sbin/daddy
	install $(setowner) $(binmode) -D $< $@

$(DESTDIR)$(cronddir)/daddy.sample: cron.d/daddy
	install $(setowner) $(crondmode) -D $< $@
