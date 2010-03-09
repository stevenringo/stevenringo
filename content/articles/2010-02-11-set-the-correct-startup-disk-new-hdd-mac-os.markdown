---
title: Set the correct startup disk when migrating to a cloned drive on Mac OS
created_at: 2009-10-28 17:29
---

## Now using an SSD Drive

I just migrated my MacBook Pro to a Crucial 128GB SSD drive using
[SuperDuper!](http://www.shirt-pocket.com/SuperDuper/SuperDuperDescription.html)

## This would be an H2 heading

Even with the new speedy gonzales in the system, boot times were a tad slow coming in at a whopping ~60s. It
took 40s to just show the Apple logo.

~~~~
describe Tour do
  before do
    ics   = File.join(File.dirname(__FILE__), 'local_copy.ics')
    @tour = Tour.new(ics)
  end

  it "should find upcoming gigs" do
    @tour.upcoming_gigs.all? { |gig| gig.dtstart.should > DateTime.now }
  end
end
~~~~
{: .ruby}

I was expecting ~20s from the legendary Mac OS startup sound to seeing my 'desktop'.

> After poking around a bit I remembered that there is a "Startup Disk" setting in "System Preferences". Once
> there, click on the new hard drive icon, then "Restart...". The machine will restart with the new default
> startup disk.
>
> And here is another para. in the Blockquote...
{: .class1 .class2}


To explain: It was trying to boot from the old drive (which is now no longer connected). Even though it is a
perfect "clone", there must be some drive IDs etc that the OS is looking for in order to identify the correct
disk.

I just timed the boot now that that's fixed. From power on to login ~ 16s!

