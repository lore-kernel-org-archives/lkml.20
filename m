Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=156.67.10.101
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794934938;
	b=TbV3e6pu1rVBISd9LWkLLDy1DKouTCHOkxXDAJ70STSW1Vtz49ZaaSwAWoP3NtRm5z/6
	 yw1mRmihFsbMCy92JMrAJ0VPa8C1Kyi5meHvm6m8gBf3mLzdR4JMRoON4N6kKb0guWjJY
	 mxMVukVmk7A73Ol4ZiihS3nDEXEkNjYIH7eQhzib/ZABFoX5oApWzptzVddHPnwE+Acnd
	 bRqkfyH0y8lJlu4+Frb0/gNpgPezmkmgj0aBOLKbMlE0MIrS5m93jXwbLfunrql257/qI
	 VmT2JTjg30Sg/ST9WAXW5J04f4mxN1OYy3y61ZYYjQpLAAycAgEtfQAiNHrppWsPTiQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794934938;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=FcrHbezu7ZWjOBBzfj/zQMKcAeBb+uf9T04gRQhuzOk=;
	b=WG/2S9Uj7sCcJB2ddAT318IEk8YzvDnbx22ZDNSsQNpCCW0JqKu7QwSvoQ7wphUNTAi7
	 Bio8dTvdoEnUgD/ZZa/hgayyhF4FaWyyCoOLUshB3+S0B8eHYs4fSPDMWGMCdaSPe3u49
	 WY0w4wHboxQhpsseyqy/OHn/PBgbEWsjXO6k7kFtjzjwbKgboYSsInTwMGybarstkIjH9
	 nU0yL/PZU7eUvpK6r+yu7UKpF/iksrtVl+RN1WJa+xsjmdlMvYMwb8mdmjZRhN3F5a7UF
	 L51DiTqKKeg+ytaHxVIJsmwnNi9TVTdTkE15WM6r4c3xOVG/f5VKsvKZGMSi6oAxhDg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lunn.ch;
	spf=pass smtp.mailfrom=lunn.ch;
	dkim=pass header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b="f/DRJ1Jl";
	arc=none smtp.remote-ip=156.67.10.101
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EEB7606A31C;
	Tue, 17 Nov 2026 17:02:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1EEB7606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=f/DRJ1Jl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=FcrHbezu7ZWjOBBzfj/zQMKcAeBb+uf9T04gRQhuzOk=; b=f/DRJ1JlxkjQKKgiumVsBQLZiM
	eDTDyC59fnlSke8btoyFTBTwVRFcx+9cVDiI9CG/Pz2v9BYmdwQ+QQbltpSrGKAtu9khXAdMhvLaa
	XUlhedOVcJCmg6GCDC8DLRu+rRMS0WFHhTYyecmdffAiAPgJi315dQDd8J2q8Y3rVGrk=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xTMZJ-00HDCG-CW; Tue, 17 Nov 2026 18:02:05 +0100
Date: Tue, 17 Nov 2026 18:02:05 +0100
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
Message-ID: <ae24af14-8168-44f0-a150-f18057cc3c95@lunn.ch>
References: <20261116135442.4827-1-jszhang@kernel.org>
 <20261116135442.4827-2-jszhang@kernel.org>
 <16ecb3ac-7876-4db5-9168-5ac9bf31d4b7@lunn.ch>
 <avvgy_bmRSVApCHA@xhacker>
 <bd19b55b-00b1-406d-a16b-d04c35efb7d3@lunn.ch>
 <avxhJs-51vs2Icje@xhacker>
 <6eb16cd9-27bd-4934-9621-b8928dce6902@lunn.ch>
 <avx43Nv-DJCX5_Rr@xhacker>
 <4d4dc86c-c947-40e2-bdaf-ed00a39f3771@lunn.ch>
 <avx-RO_K5h12HWx2@xhacker>
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
In-Reply-To: <avx-RO_K5h12HWx2@xhacker>

On Wed, Nov 18, 2026 at 12:18:12AM +0800, Jisheng Zhang wrote:
> On Tue, Nov 17, 2026 at 05:20:39PM +0100, Andrew Lunn wrote:
> > > > Each transaction?
> > > > 
> > > > Are you proposing to use both MDIO bus master? Why? To the outside
> > > > world, it is one MDIO bus, so you only need one active MDIO bus
> > > 
> > > Yep, both MDIO bus masters. I wanted to let each MAC uses its own
> > > MDIO rather than disturbe another MAC for dual MACs case.
> > 
> > How does this actually work? Each bus master sees each PHY. So one
> 
> This could work since the demux serializes two masters' access + only
> point to one phy phandle in one mac's DT node.

And it all blows up when you don't use DT, or the MDIO node is missing
and of_mdiobus_register() falls back to mdiobus_register() which scans
all the devices on the bus.

> Yep, I will switch to one MDIO bus solution by coping with the selector
> in the sl2610 stmmac glue driver.

Good.

	  Andrew
