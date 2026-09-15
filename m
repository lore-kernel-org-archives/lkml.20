Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8985C49F108;
	Tue, 15 Sep 2026 16:49:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789490968; cv=none; b=mAIuDnCXsDG+VDfF/sfEX9JLXNbWIjStaIxGajmHMQB7TTeR/+9PZUcbsMSfh0cp9/ozX4cChRduuzvyq/5DNtLaJZsUj+TJQFlCSyUKwfvmG5UXfXowD9+NbKnS9B0NYcTCndc/7pPeWVSI5Wa7BX4ycYIKXGUlvz7gty/6tbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789490968; c=relaxed/simple;
	bh=TILtcVOpFDDqd3GDAT4vH8MKqC+ojPt8jhWo2iRnC6E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uo4rW0WE9MI1FdF777z/Cb0ZhxyW/6bBFBloHIENehIzauHKql8ArBOlDrxIYtGl9BRROKt1zmVMw/NixU1NPHtOljCLWaddPTzebY9MaAgiWBAK2CurfLYMxHH0xIVk+87XYnMIAiruVqeE8py9dHOo8rbwKoF8NtNJNlhFFEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=T1vPOGEe; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="T1vPOGEe"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=xtjhYharta0kivYdIPNAaN7YMmTxSs/zZpGGaIGucV4=; b=T1vPOGEefpHtsFpnGzCF0cC40Z
	DVSD+cr+mnNnE1iXzuntsCtbw+ERlW+tYCLLRbzGOfQycMVcvh3AG2ZcIWgBG6CiqZRRgwz5g3lFe
	MqsGorSinRKDBb0kDk061OeHvRIZzuWlZcL5CPC/39XumXC6WBXwWL9ZfJaoi0REffr8=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1x6WLP-005JkN-6Z; Tue, 15 Sep 2026 18:49:19 +0200
Date: Tue, 15 Sep 2026 18:49:19 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Francesco Dolcini <francesco@dolcini.it>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Emanuele Ghidoli <emanuele.ghidoli@toradex.com>,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>,
	Franz Schnyder <franz.schnyder@toradex.com>
Subject: Re: [PATCH v2 3/7] arm64: dts: freescale: Add Lino iMX93
Message-ID: <100eef7b-e1d6-411b-bac5-98790e8f9ea7@lunn.ch>
References: <20260911091952.96233-1-francesco@dolcini.it>
 <20260911091952.96233-4-francesco@dolcini.it>
 <42ed88a6-d208-482b-94aa-2e45b69c173e@lunn.ch>
 <20260915132806.GA226756@francesco-nb>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260915132806.GA226756@francesco-nb>

On Tue, Sep 15, 2026 at 03:28:06PM +0200, Francesco Dolcini wrote:
> Hello Andrew,
> thanks for the review.
> 
> On Tue, Sep 15, 2026 at 03:19:45PM +0200, Andrew Lunn wrote:
> > > +	ethphy1: ethernet-phy@1 {
> > > +		reg = <1>;
> > > +		interrupt-parent = <&adapter_gpio_expander>;
> > > +		interrupts = <3 IRQ_TYPE_EDGE_FALLING>;
> > 
> > Falling interrupts is probably wrong. They are normally level, active
> > low.
> 
> 
> It is wanted. The I2C ioexpander component used for the interrupt
> supports only edge interrupts. We tested it and it works fine like that.

It works, until it does not work, because you hit a race condition
with the hardware, two interrupts in quick succession. The second one
gets lost, and your link remains down forever.

>  - when we tested it, the SW emulation was not really reliable, and we
>    prefer to play on the safe side

If you want to be safe, delete the interrupt properties and let phylib
poll the PHY. That always works.

     Andrew
