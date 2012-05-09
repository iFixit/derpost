When postfix can't deliver messages, they get stuck in a queue; the commands
provided for managing this queue are primitive, showing their limitations when
dealing with thousands of queued messages.

Surprisingly, no one seems to have done much with putting a better frontend on
this queue; there's [a Perl module] that creates a data structure, but that's
about it.  So, derpost is a really simple frontend designed to fill this gap.

derpost requires [lineify], which is currently a really hacky script.  derpost
itself is very much alpha software - features will change dramatically, and
corner cases haven't even been thought about.

[a Perl module]: http://search.cpan.org/~rjbs/Postfix-Parse-Mailq-1.001/lib/Postfix/Parse/Mailq.pm
[lineify]: https://github.com/xiongchiamiov/lineify

