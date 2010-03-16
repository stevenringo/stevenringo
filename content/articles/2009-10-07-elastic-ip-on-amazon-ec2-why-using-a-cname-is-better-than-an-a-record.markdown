---
title: Elastic IP on Amazon EC2 — Why using a CNAME is better than an A record
created_at: 2009-10-07 12:00
---

I am busy experimenting with some servers on [Amazon EC2](http://aws.amazon.com/ec2/). A necessary feature of EC2 is the [Elastic IP](http://developer.amazonwebservices.com/connect/entry.jspa?externalID=1346) - essentially you "rent" an IP address that is then associated with you, or your account and not a machine instance.

When you request an Elastic IP you get given both an IP address, and a name in the DNS that points to that IP, for example[^1].

[^1]: Real IPs and domain names have been changed to protect the innocent. IPs and domain names quoted are fictitious. Any resemblance to an IP or domain name, either living or dead is purely co-incidental

`186.210.34.68` and `ec2-186-210-34-68.compute-1.amazonaws.com`

That's all very well and good. However, I want [www.myfictitiousdomain.com](http://www.myfictitiousdomain.com) to point to that IP.
I have two options for creating this in my DNS Zone file:

1. Create an A record pointing to `186.210.34.68`, or
2. Create a CNAME record pointing to <br>`ec2-186-210-34-68.compute-1.amazonaws.com`

On immediate inspection, these seem to essentially give the same end result. And for most purposes this will work fine. However there's another [tidbit of valuable information](http://aws.amazon.com/vpc/faqs/#5) which plays a big part in making this decision: Amazon EC2 instances are assigned by Amazon both an internal and external IP address. External IP addresses provide connectivity to the Internet, whereas internal IP addresses allow instances to communicate with one another. If you create an A record, the name [www.myfictitiousdomain.com](http://www.myfictitiousdomain.com) will always resolve to `186.210.34.68`. If you create the CNAME record, and run a ping from outside the EC2 cloud, you get the external IP.However, pinging the same domain name from a machine inside the cloud (or, on the machine itself), returns the internal IP:

~~~~~
external-machine~ $ ping www.myfictitiousdomain.com
PING ec2-186-210-34-68.compute-1.amazonaws.com (186.210.34.68): 56 data bytes

internal-machine~ $ ping www.myfictitiousdomain.com
PING ec2-186-210-34-68.compute-1.amazonaws.com (10.0.0.10): 56 data bytes
~~~~~
{: .bash}

Now that can be useful for many reasons, particularly if you are using the custom host name inside the cloud and don't want it routed externally, or if the machine is not exposed to the outside world at all.
For more details, read the article on [Using Elastic IP to Identify Internal Instances on Amazon EC2](http://alestic.com/2009/06/ec2-elastic-ip-internal) - it also seems to confirm my findings.

