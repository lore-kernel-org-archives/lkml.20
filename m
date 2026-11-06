Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.27
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793926658;
	b=CGA+fAqFe8Y9dyOS84HPVz178h3uB9exZPOrnSxiIgSPiPFn489JGJK4ttwYPMtxlccB
	 Xlr9ke+GtMu91WHwWWxNMP+nr2C+Flepx+eexHocS8wuki1PN0P79Y9prQI/F8V+jTrgR
	 Le6n0w7Hszg8JxgWTyMRWyDY5+oqQSAOIA4SE5WginXLGwFTRavmzGZRJgNo0ow2pY2iP
	 Bnqn8QfxWHksOLuiscIbFuN54RA6SzJzW5BrE3uLA46ufeNEF1x+qhbVldxWD0C8yeVOm
	 IecK1qs6SxoaCN09jDORajAXTzK/aY8cmxRRuidpjyIefdxkvQg+Yz7WXGWTk5/V01w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793926658;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=MzO4HkQE4feh9CJIkUPme6koPbQN4aGycua9YwNQmpg=;
	b=GpgTVuPUbgd4SdGUgXbMjNsZSXcAv9t/gehKQm29/VNvO2QIlhEMr6MNdcBgSXiMgz3I
	 psvwkeMPx6TSNg1YbIb7TA6so2Q8rCXYLcmljSweYZc3M6wwxL1Crzc3dU1cvAzEaXC9s
	 Vy6MZlzIq2H0MOFB6XJhbeHoG2Wijh85Ib0tQBNjGqd7yYsj8K0KoWm1Q6OYkEdRGR86R
	 z+R+ECdJY7OcZ9etqMLy4x9oaqY3zdcFFwQf4VzkzFFGo9VX2bxfw74zWiOXKbNJ3Sw5+
	 vmdq0Crw1Jx9+Mir1HLvK+g2vDZEQ2oFrJZrU4QjFAPbQ5a+6gw9yWL9KYkd/IdB6gw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=ni0CSVhT;
	arc=none smtp.remote-ip=91.218.175.27
Received: from mta0.migadu.com (out-27.mta0.migadu.com [91.218.175.27])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A478606A326
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 00:57:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5A478606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=ni0CSVhT
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=lmJNeb3DN5jK+TXwkr+MYTngEf4BBEhnBDhSJ0RrI3Q=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793926654; v=1; x=1794531454;
 b=ni0CSVhTEM3tE9GTWZrtXZrplsF7/97kpcHDUI9+02T5VaxNC0tUoo2nKAoNbiEYtGxU4WHf
 gShAlxhOUn1dhQZM3UX3vMG57oc3FXbAXj3mVes6O3uohJJI2fWmRmls47O1xLdYJIgErTDDAre
 CFvIfy9r7lvyZJXHTdLXi254=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta12.migadu.com with ESMTPS id 9660360d78ffce8a;
	Fri, 06 Nov 2026 00:57:34 +0000
X-Mizu-Trace-ID: 9660360d78ffce8a
X-Migadu-Flow: FLOW_OUT
Date: Fri, 6 Nov 2026 08:57:20 +0800
From: Hangbin Liu <hangbin.liu@linux.dev>
To: Paolo Abeni <pabeni@redhat.com>
Cc: Ramses de Norre <ramses@well-founded.dev>,
	Jay Vosburgh <jv@jvosburgh.net>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>, Jiri Bohac <jbohac@suse.cz>,
	Eric Dumazet <edumazet@kernel.org>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Nikolay Aleksandrov <razor@blackwall.org>
Subject: Re: [PATCH net v5 2/2] bonding: give a slave that starts UP a full
 arp_missed_max window
Message-ID: <au0l8F5t3-ldHcAA@fedora>
References: <20261030-bonding-last-rx-v5-0-0b9b653f2f94@well-founded.dev>
 <20261030-bonding-last-rx-v5-2-0b9b653f2f94@well-founded.dev>
 <5abaf2a2-73b5-4400-a585-0955556a01a5@redhat.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5abaf2a2-73b5-4400-a585-0955556a01a5@redhat.com>

On Thu, Nov 05, 2026 at 10:21:15AM +0100, Paolo Abeni wrote:
> On 10/30/26 15:51, Ramses de Norre wrote:
> > The ARP monitor marks an UP slave DOWN once jiffies passes
> > last_rx + arp_missed_max * arp_interval + arp_interval/2. bond_enslave()
> > seeds last_rx one arp_interval (plus a tick) in the past, which brings
> > the down deadline of a slave that starts UP forward by one interval
> > compared to what arp_missed_max promises.
> > 
> > Active-backup mode hides this with a grace period after enslavement in
> > bond_ab_arp_inspect(). Load-balance mode has no grace period after
> > enslavement. With arp_missed_max=1 the deadline is half an interval
> > after enslavement, and the first monitor run checks the slave before it
> > sends the first probe. If that run lands in the second half of the
> > interval, a healthy slave is reported "interface is now down" and comes
> > back UP on the next run.
> > 
> > Seed a slave that starts UP with last_link_up instead, so it gets a full
> > arp_missed_max window for its first reply. bond_arp_rcv() and
> > bond_na_rcv() only trust ARPs seen on backup slaves once the active
> > slave's last_rx is after its last_link_up. A seed equal to last_link_up
> > keeps that check false until a real reply arrives, as it is today.
> > 
> > This only covers a slave enslaved while the ARP monitor is running.
> > When the monitor starts later, from bond_open() or when arp_interval is
> > set at runtime, the seed is still as old as the time since enslavement,
> > as it was before this patch.
> > 
> > Fixes: 5944b5abd864 ("Bonding: add arp_missed_max option")
> > Signed-off-by: Ramses de Norre <ramses@well-founded.dev>
> > ---
> >   drivers/net/bonding/bond_main.c | 8 ++++++--
> >   1 file changed, 6 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/net/bonding/bond_main.c b/drivers/net/bonding/bond_main.c
> > index 2f5638f4d3a78..84eafb607c370 100644
> > --- a/drivers/net/bonding/bond_main.c
> > +++ b/drivers/net/bonding/bond_main.c
> > @@ -2158,9 +2158,13 @@ int bond_enslave(struct net_device *bond_dev, struct net_device *slave_dev,
> >   		new_slave->last_rx = jiffies -
> >   			(2 * msecs_to_jiffies(bond->params.arp_interval) + 1);
> >   	} else {
> > +		/* Give a slave that starts UP a full arp_missed_max window.
> > +		 * Not seeding it later than last_link_up keeps bond_arp_rcv()
> > +		 * from trusting ARPs on backup slaves before the active one
> > +		 * got a reply.
> > +		 */
> >   		new_slave->last_link_up = jiffies;
> > -		new_slave->last_rx = jiffies -
> > -			(msecs_to_jiffies(bond->params.arp_interval) + 1);
> > +		new_slave->last_rx = new_slave->last_link_up;
> >   	}
> >   	for (i = 0; i < BOND_MAX_ARP_TARGETS; i++)
> >   		new_slave->target_last_arp_rx[i] = new_slave->last_rx;
> > 
> 
> @Jay, @Hangbin: can you please have a look here?

Yes, I’ve read this patchset a few times but haven’t thought through it
carefully, since the ARP inspection logic is a bit complex. I’ll try to
finish the review today.

Thanks
Hangbin
