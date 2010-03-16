---
title: Set the correct Startup Disk when migrating to a cloned drive on Mac OS X
created_at: 2009-10-28 17:29
---

I just migrated my MacBook Pro to a Crucial 128GB SSD drive using
[SuperDuper!](http://www.shirt-pocket.com/SuperDuper/SuperDuperDescription.html)

Even with the new speedy gonzales in the system, boot times were a tad slow coming in at a whopping ~60s. It took 40s to just show the Apple logo.

I was expecting ~20s from the legendary Mac OS startup sound to seeing my desktop. 
After poking around a bit I remembered that there is a "Startup Disk" setting in "System Preferences". Once there, click on the new hard drive icon, then "Restart...". The machine will restart with the new default startup disk.

To explain: It was trying to boot from the old drive (which is now no longer connected). Even though it is a perfect "clone", there must be some drive IDs etc that the OS is looking for in order to identify the correct disk.

I just timed the boot now that that's fixed. From power on to login ~ 16s!