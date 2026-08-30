Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 468BA2C0294;
	Sun, 30 Aug 2026 20:23:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788121438; cv=none; b=uZB6P34shOgVv1Yc+2EM3mz09QCpFBac2dayPRehP6+jlDQk8XZy/2SVENn3yYijJWpuPPMu1cishfrXq/i5l3olM0p3HkM1eTdobff/9eRnhhvYwfUfyQYQHimK08It3HKcWJx1ajcBBUBSuiN9aRgNCagy2MTROSjWB031EFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788121438; c=relaxed/simple;
	bh=I6Qy7c1SCo3kXYxfli+0PRMCzLl4TBog0mFhMqPaqUs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cNv1zHu3ICNM533oqomVncfw46XwL2o7uR2zKwYLB3pyaWvcrU7OsZzTVrxc3xLirvJY43fn8kaBKUd+Y/aBbc8cXXuX9oMOWORlmoPRaqeW96qGR6Sgxyfrj42GFhMrxSQksdDsn24Ii6hSyEhAKjBXmiNyQgqyCIl4jIOTa3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=Vjh/aTjJ; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="Vjh/aTjJ"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=fvp1pXNe5TqeRLtSD0qiAJjH/t/R2XXpNq+2z1rCEXU=; b=Vjh/aTjJEGC3nFUNrV6JDgufiv
	vaTbt6Pkv5qks/+2yHr3qWO9ssIQ9iRuffyV90OaMvgiW0ifnYe2Pg7a4F03VTx/uWY9qVZHKixg0
	NV7N/++3Qslszxy654Zlsr/GEnlZhbA2RDY2mHOUyIYOH0Om434kTC0LeTFiMNnsdvrA=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1x0m3l-00254S-3T; Sun, 30 Aug 2026 22:23:21 +0200
Date: Sun, 30 Aug 2026 22:23:21 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
Cc: Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ryan Chen <ryan_chen@aspeedtech.com>,
	Billy Tsai <billy_tsai@aspeedtech.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 0/2] ARM: dts: aspeed: Add ASRock Rack B650D4U BMC
Message-ID: <d60f234e-1b9e-44cc-9bad-da79e794fe44@lunn.ch>
References: <20260830182036.284736-1-prasanth.padarthi10@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260830182036.284736-1-prasanth.padarthi10@gmail.com>

On Sun, Aug 30, 2026 at 11:50:34PM +0530, Prasanth Kumar Padarthi wrote:
> Add device tree support for the ASRock Rack B650D4U BMC, which is
> based on the ASPEED AST2600 SoC.
> 
> The series adds the board compatible and describes the BMC memory,
> SPI NOR flash layout, UART console, and MAC0 connected to an
> RTL8211F Ethernet PHY.
> 
> The MAC0 RGMII timing configuration was validated on B650D4U
> hardware. With plain "rgmii", the PHY negotiated 1000baseT/Full but
> received no valid packets and accumulated RX CRC errors. With
> "rgmii-rxid", a 5000-packet test completed with 0% packet loss and
> no RX CRC errors. "rgmii-id" was also tested successfully, but the
> additional TX delay is not required, so "rgmii-rxid" is retained.

Please take a read of:

https://elixir.bootlin.com/linux/v6.15/source/Documentation/devicetree/bindings/net/ethernet-controller.yaml#L287

Does the PCB have 2ns of delay for TX, but notR RX?

     Andrew
