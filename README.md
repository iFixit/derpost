A simple interface for reading through postfix's queue.

# Motivation

When postfix can't deliver messages, they get stuck in a queue; the commands
provided for managing this queue are primitive, showing their limitations when
dealing with thousands of queued messages.

Surprisingly, no one seems to have done much with putting a better frontend on
this queue; there's [a Perl module] that creates a data structure, but that's
about it.  So, derpost is a really simple frontend designed to fill this gap.

[a Perl module]: http://search.cpan.org/~rjbs/Postfix-Parse-Mailq-1.001/lib/Postfix/Parse/Mailq.pm

# Status

Functional, no major known bugs.  No stability guarantees.  Not regularly used,
but actively maintained.

# Installation

Ideally, clone the repo somewhere:

    [$]> git clone https://github.com/iFixit/derpost.git

Alternatively, download the single code file:

    [$]> wget https://raw.github.com/iFixit/derpost/master/derpost.rb -O /usr/bin/derpost

## Dependencies

* Ruby 1.8-2.0
* postfix
* [lineify] with the `mailq` parser

[lineify]: https://github.com/xiongchiamiov/lineify

# Usage

Execute `derpost.rb` to start an interactive shell.  derpost includes a help
command:

    [$]> h
    Available commands:
        l      List messages in the current page.
        n      View the next page of messages.
        p      View the previous page of messages.
        r <N>  Read message N.
        h, ?   Display help (this page).
        q      Quit.

# License

derpost is available under [the zlib license] ([summary]).

[the zlib license]: http://opensource.org/licenses/Zlib
[summary]: http://www.tldrlegal.com/license/zlib-libpng-license-(zlib)

