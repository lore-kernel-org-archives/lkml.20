Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=156.67.10.101
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794838235;
	b=a7EzM7wdunxXaqSyvTRwtBDwQFbaYLS1TQrAvWM/EoKx/5Vzy/0KYzTcFAWVHdECzp1o
	 GuGKuW71bSUg0+AphBxkZIrdcoaVfOdivjqwCiuePucowXeptxhxHxYgnTEA3O8bdq9EE
	 lyhNKEZD0+vz6CaX4Sk/vBJnyesLzneM85sx/Mczdqv89IQyOcaWFhirSzjSa9ZHJMOk7
	 8bxL40ZcEMrfUhdN36EpgS6ljS34yEXIIB+nggMMFazCtnWx6FZ7zHHf7HJYybaOOdMdi
	 JCdutrhOzx00CdXpYIZcMH71B07XIrcUppq/AZYw4lvKuLWmdUbRNQHnLqZEIfFzaBg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794838235;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=9Ww2B866Qzj75gaqNgDn9gH66Ny8eO7Uks5H+nxKStc=;
	b=nC5iJP5zUTajI+rgWzk5C4ZZYLjFiOifIAkLzY8LvP5LDd4iltYVUVpx3hG5dRx+gb3+
	 P3Ms8dZCd1Xr3mwHolIrSmxCi4HXR6OKa2Bj5HN1pYxE+9DEntvUyZVGprSHYdSXl6UjX
	 PjGBi7nCF1eocjVxNij6DWEizIJ+xCvX6dCQDIgb2osi/jpyN03nQq9JKEJWBACvjWRFE
	 IaEN/SRb8jObtYV3nwHdzMo+L779XPj4qpElo6luKpo1anvnfZzjxk6yAsLUh+N5v0png
	 1R/YftA30XiplSCerQn7ky/US/skTJIU1KaZSv8T/vj2OVtZ4bCrEDmOUwDbcXGNtBw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lunn.ch;
	spf=pass smtp.mailfrom=lunn.ch;
	dkim=pass header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b="o/pEEvs8";
	arc=none smtp.remote-ip=156.67.10.101
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A7EA606A329;
	Mon, 16 Nov 2026 14:10:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6A7EA606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=o/pEEvs8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=9Ww2B866Qzj75gaqNgDn9gH66Ny8eO7Uks5H+nxKStc=; b=o/pEEvs86dEc+pMCHsYRxbJ5Ye
	9fJHYQOKPsZNt1ibHSs+Q94g06Uw6dYYoBAvBm9/YOqpg6lmDQgUQkigm+br3yKhjTHoO7fnSLXmA
	o+aIFKR6NBd96a/hc3dKBUxFRgcAZxOQqWgEZ2LgAzx7HPlCDc+H2QqCE9eD8gqzi7dg=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xSxPZ-00Gw0P-Tz; Mon, 16 Nov 2026 15:10:21 +0100
Date: Mon, 16 Nov 2026 15:10:21 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: netdev-bot+sashiko@kernel.org
Cc: jacky_chou@aspeedtech.com, andrew+netdev@lunn.ch, davem@davemloft.net,
	kuba@kernel.org, pabeni@redhat.com, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, ratbert@faraday-tech.com,
	edumazet@kernel.org, hkallweit1@gmail.com, linux@armlinux.org.uk,
	netdev@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v6 2/7] dt-bindings: net: ftgmac100: Add AST2700
 compatible
Message-ID: <51667f1f-4f2b-44ea-b725-87cf63c2c9dc@lunn.ch>
References: <20261112-support_ast2700-v6-2-238020bf46cf@aspeedtech.com>
 <179483725554.3136.8359940788845125105@kernel.org>
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
In-Reply-To: <179483725554.3136.8359940788845125105@kernel.org>

> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            const: aspeed,ast2700-mac
> > +    then:
> > +      required:
> > +        - phy-mode
> 
> [Severity: Medium]
> Is phy-mode really mandatory for every AST2700 MAC node? The binding
> also documents the use-ncsi boolean. That mode runs the NC-SI stack
> over RMII instead of talking to an MDIO PHY. The first example in this
> file sets use-ncsi and has no phy-mode property, and that is a valid
> setup on the earlier Aspeed parts.

This seems like a valid point. Maybe make it conditional like the
code, either phy-mode, or use-ncsi. Both or neither is invalid.

	Andrew
