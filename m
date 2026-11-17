Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=156.67.10.101
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794880493;
	b=DJ6b6Z+heDpu174Te+6SfOItmvY4GLof7UI1Q3nsb75RvcLfXnqn446b818nOrFBYT+c
	 U33ry8s+tuj02cmlY3najZ8hUM068SoYRM5O2MQLganqXVLn3aZCT06D1nRYHczBOlJpw
	 tjv+KrPP9SQBxb7GIgRWpuMGgH/DhtxlUfP2UACsuwe/5u50NHxfnjsbU4lJuNR7OQsBo
	 7MpIqBG1/G1nRKgBE7ce1oxhtqj+bqTNMArwGJO+TwIIXm2kSO4uJ14NOsc7dxCXj25bG
	 sAx2UWvASgcJZjB8ZTETDgGmda6usbj5+tGrSMQBGEb/wAIcLO4XG0DDfh4VK1KY4SQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794880493;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=iYlGy8xJMA8eTuOosKWlUZ6Zle2XpV3qNNFWD604oY0=;
	b=43KVAKpMfiTDdeOt7MHS+2jMLl3XEDFafM5q5LTS6a276b2rr6zUm1h6/MscLeY0tgSv
	 Ic4f3n6iv4LXHeMimS7GAUZgzSygJGU2iwipw/I1WOeJIrqbf76LrXt7t4NKf+bKqBsHU
	 qUBuSe4XZ+XZOn0rYvYHkb5mM0OEJUqyKnx8ySxaqew6PujpGinKeiVIsqh2tO20xqbeT
	 SNbRHQSL4KZyp3ghF9Oude+rZs9MjVb8PQ1xZURC4NnLNusHNfIUJeq2NDe9QOdgGL3LR
	 H+P8uLN++mzycrsIkpGAup6B5GOHkBFXzX2jvqKCa1+4N4WfGbgavTZqgfoUUnbWLQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lunn.ch;
	spf=pass smtp.mailfrom=lunn.ch;
	dkim=pass header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=rfBsjlWw;
	arc=none smtp.remote-ip=156.67.10.101
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E523606A323;
	Tue, 17 Nov 2026 01:54:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8E523606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=rfBsjlWw
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=iYlGy8xJMA8eTuOosKWlUZ6Zle2XpV3qNNFWD604oY0=; b=rfBsjlWwjbHsByJs5F0uH7M2Un
	gqsruHedF5sr3mZ+ZOXj0jiEFe2B7ULs+juIpmUtxr9d1OjTsYaIwAPNkjEFZeQiH+rGJDzdKqsU9
	lxUXqoii9ZzqQ8fAjqvDv/h2PTmAjCKan6Dd2L7BEU5grlc/KZqiqHmmPksFN1XddchQ=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xT8PF-00H359-Hg; Tue, 17 Nov 2026 02:54:45 +0100
Date: Tue, 17 Nov 2026 02:54:45 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Yibo Dong <dong100@mucse.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
	kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
	yaojun@mucse.com
Subject: Re: [PATCH net-next v2 2/5] net: rnpgbe: Report link settings
 through ethtool
Message-ID: <2ddca58c-608f-4a0f-a26d-df92c2c34c69@lunn.ch>
References: <BD205A7832D36E7D+20261116030917.1329989-1-dong100@mucse.com>
 <66AFF2810AB647C8+20261116031020.1330219-1-dong100@mucse.com>
 <d7351f56-d4fa-4ba0-a0c6-c7bdf7aac460@lunn.ch>
 <2207C8DCDD49F5EE+20261116044737.GA1342898@nic-Precision-5820-Tower>
 <cf674063-6c6f-43f6-a18a-d7ed5bef8a5c@lunn.ch>
 <236B4E2337BC768E+20261117014902.GA205295@nic-Precision-5820-Tower>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <236B4E2337BC768E+20261117014902.GA205295@nic-Precision-5820-Tower>

On Tue, Nov 17, 2026 at 09:49:02AM +0800, Yibo Dong wrote:
> On Mon, Nov 16, 2026 at 02:18:28PM +0100, Andrew Lunn wrote:
> > > link, speed, duplex and mdix are updated asynchronously by
> > > the mailbox event handler, outside RTNL. link_lock protects these updates
> > > and provides a consistent snapshot in the getter.
> > 
> > O.K, thanks for the explanation.
> > 
> > I removed too much context, so i cannot see here. What about
> > lp_advertising? That also comes from the firmware, reported on link up
> > when autoneg completes.
> > 
> The firmware manages autonegotiation and reports the negotiated speed
> and duplex through mailbox link events. However, the current mailbox
> interface does not expose the link partner's advertisement bitmap.
> 
> Therefore, lp_advertising is currently left zero to indicate that this
> information is unknown to the driver.
> 
> If reporting lp_advertising is must, we would need to add a new
> firmware mailbox command to retrieve the link partner's advertisement,
> or add lp_advertising to link-event mbx alongwith link, speed and
> duplex.

It is not a must, but it is useful.

Or you can just throw away your firmware, expose the MDIO bus, and let
phylink drive the hardware. Less code, less bugs, more functionality
for free.

	Andrew
