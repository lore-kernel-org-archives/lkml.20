Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=156.67.10.101
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794927583;
	b=DlWEQe0ENC7ZLHKgVdiKM+FShZLTWUq2yZfODxEA8pe9CijB9C1v2SOlYFFTT2kt8Afz
	 em19q/5bCACNJwwF7JgZtnqZHVHKrHVS0PzPnve+12h33YpKZgtym1Xp+0zOGQxzWsVCM
	 WsunqFuhGfnHSLJVZXbENf1oms++YeK+ikNmsqWSnCMgCk5Ux+biJlHrAX3Gm2WuV5GDT
	 3/CGKO25T5dNteiuNoZ5r5wJhTWAgwJI12Sp7bk+yVAuQdTydgNXWkZ2X2stDMvQIUh1n
	 iv5v+OuM2m2ZOzxl47tWlRXo5gWHZL/iDDg8NYEFxjpwQFDRivWHZiAr44Hjl3u69Rg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794927583;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=K0qrakcESvXPxHJXNDKFRvIhNYLPnaxTHMvxLYcW0lc=;
	b=3ImqiFuB+jEkTEVz68Vm1f0x5mUEZZiB8L2A/D5i3ik7xeDAXzk5JBQREPZOcQ+Duc2w
	 BAI1OlIYdBf/c6tv09B6FYpjJlR0g4xDriY2IukfWRX4PTeK1UyLeKwJFWpwZYJzVKye3
	 9dgnn8+ZWJCsIwPCmX3wfu7nX+0UKSbE/2RjxZcHEvdZqZBuvCKM1WmxY+Q110JO3RhuK
	 XQ7DuhN0kgplse1gybvJA2YW/ddgD7L8A/q1tiqJsaPye1xDQKRb4j1PRDp8OZpGP7Xpp
	 Wpkma3qlnoJr+kSy6wgYP8tBsbJWlK7fOtlW9P2nD3pNZ+1h+dzS+exyJQ9cQLJ1WWw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lunn.ch;
	spf=pass smtp.mailfrom=lunn.ch;
	dkim=pass header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=WnYhWHeu;
	arc=none smtp.remote-ip=156.67.10.101
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E950606A32A;
	Tue, 17 Nov 2026 14:59:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1E950606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=WnYhWHeu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=K0qrakcESvXPxHJXNDKFRvIhNYLPnaxTHMvxLYcW0lc=; b=WnYhWHeuSBL1t3K6vWoR7xpAyu
	+vAneGcHuU46VIGAPI/+6D6QFxnjQnLddtcegcub7aHwMx1Zk6rud6/nhb7PazjZVGtpH34UT5UXK
	aoZwWQREqgwNwqD6zbRezPsdROBtUzgOQFMPKjJHmdHxTNahczJ6aMHgce4AmrD12xyg=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xTKeg-00HB4u-5U; Tue, 17 Nov 2026 15:59:30 +0100
Date: Tue, 17 Nov 2026 15:59:30 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	netdev@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/8] dt-bindings: net: Add MDIO demultiplexer
Message-ID: <6eb16cd9-27bd-4934-9621-b8928dce6902@lunn.ch>
References: <20261116135442.4827-1-jszhang@kernel.org>
 <20261116135442.4827-2-jszhang@kernel.org>
 <16ecb3ac-7876-4db5-9168-5ac9bf31d4b7@lunn.ch>
 <avvgy_bmRSVApCHA@xhacker>
 <bd19b55b-00b1-406d-a16b-d04c35efb7d3@lunn.ch>
 <avxhJs-51vs2Icje@xhacker>
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
In-Reply-To: <avxhJs-51vs2Icje@xhacker>

On Tue, Nov 17, 2026 at 10:13:58PM +0800, Jisheng Zhang wrote:
> On Tue, Nov 17, 2026 at 02:24:16PM +0100, Andrew Lunn wrote:
> > On Tue, Nov 17, 2026 at 01:06:19PM +0800, Jisheng Zhang wrote:
> > > On Mon, Nov 16, 2026 at 04:06:25PM +0100, Andrew Lunn wrote:
> > > > On Mon, Nov 16, 2026 at 09:54:35PM +0800, Jisheng Zhang wrote:
> > > > > Assume we have the following implementation:
> > > > >           ----------
> > > > >           |mmio reg|
> > > > > 	  ----------
> > > > >              |
> > > > >  --------    |      -------
> > > > >  | MAC0 |--MDIO-----| PHY |
> > > > >  -------- |     |   -------
> > > > >           |     |
> > > > >  -------- |     |   -------
> > > > >  | MAC1 |--     ----| PHY |
> > > > >  --------           -------
> > > > > 
> > > > > Both MAC0 and MAC1 have MDIO bus masters, and tie together to
> > > > > a single set of clock and data lines, which go to some PHYs. While
> > > > > there's a mmio reg to control which MAC mdio master can operate
> > > > > the single mdio clock and data lines, so only one MAC can operate
> > > > > the mdio clock and data lines.
> > > > 
> > > > How does this differ from pinmux?
> > > > 
> > > 
> > > in my case, the two MAC MDIO bus masters share the same MDC and MDIO
> > > pins.
> > 
> > That does not answer my question. How is this different to pinmux?
> 
> Let me explain the HW in details:
> The pad have their own pinmux configuation, which selects the MDC/MDIO
> fucntion instead of GPIO or another perif function. That pad
> configuration stays MDC/MDIO, I.E unchanged.
> 
> The register discussed here is a separate selector between the two
> MACs' MDIO controllers. With the pads already configured for MDC/MDIO,
> it choose whether MAC0 or MAC1 drives the MDC and MDIO.
> 
> So the proposed demux controls this internal selector and serializes
> selection plus the complete MDIO transaction across both MDIO
> controllers.
> 
> Would you prefer model the selector as pinctrl states, with an MDIO
> demux selecting the appropriate state under a shared lock before each
> transaction?

Each transaction?

Are you proposing to use both MDIO bus master? Why? To the outside
world, it is one MDIO bus, so you only need one active MDIO bus
master. All the PHYs are then on that one bus.

I would let the DT pinctrl node connect one MDIO bus master to the
outside world, and that is all you need.

I've no idea if you can stack pinmux drivers. You might want to reach
out to Linus Walleij. But this is basically a pinmux problem, there is
nothing specific to MDIO here.

    Andrew

