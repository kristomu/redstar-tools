Jipsam RE
=========

Using Jipsam on Fedora
----------------------

To investigate the crypto modules separately from the rest of Redstar, it might be a good idea to run it on Fedora rather than on rs. For Jipsam1 and Jipsam2,
it can be done like this:

* Install fc9 (https://archives.fedoraproject.org/pub/archive/fedora/linux/releases/9/Fedora/i386/iso/)
* Copy jipsam\*.ko and the shell scripts in this directory to the root directory.
* Run install.sh
* Run forceload.sh
* cat /proc/crypto or whatnot.
* Do not update kernel, because the Jipsam modules won't run under the newer fc9 kernel.

Preliminary observations
------------------------

Both of the Jipsam modules look like someone reused most of the operations from
AES while rearranging others. For instance, in Jipsam2 function KeySetupEnc, 
the cipher performs an AES initialization round consistent with 
AES\_set\_encrypt\_key from AES-256.

I should at some point construct a Crypto API module to get some test vectors
from both, and then compare these to the test vectors from AES in order to check
whether these are just recompiled versions of AES. However, neither cryptodev 
nor libkcapi will compile under 2.6.25-14, so I'll have to make a custom module
for that purpose.

The difficulty of using Jipsam\* suggests that they weren't really meant to be
used, and may have been experimental. However, if that is so, that doesn't 
explain why they're present in rs2.0.

/proc/crypto reports that Jipsam2 accepts 512-bit keys. That is very strange.
