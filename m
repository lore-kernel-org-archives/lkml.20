Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD3B339E9BD;
	Tue, 15 Sep 2026 19:58:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789502288; cv=none; b=UzLpq+ZtJtn3prcBzFPEqAPa+Jg4kgn8I24hBzEPNe3pfZd6flENK120NgtUX9rBPv3ZOnyefyqqXI6CUoqesFm/2WglmWP4b1/G5W5RQzciJaqGxdMRqFxPp2Nr9xh2RNOPhcRosgENAzK3Oke1TZHa9P7RdjfBZJ7zxOd5g7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789502288; c=relaxed/simple;
	bh=tuEsb7t+iPkmurfk4TspyYYvhwvZorPB3oh02pjpuGI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Xr11UjULaJAWjrxFmq+b0TEVkgtat5PWHfve8rPpY0LbsbwTu+R8NG4wwiJ/wbWonx1bJLRC/iObL9pCyHTayln7pfDedyS36SKvoVM9+Xt07l+hGPUn3BWNQl/lLz54CmkOlbllp/XaFp0uPJNWx17lCVtItj8UbU/B2Y33zmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=bsCxyAg7; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="bsCxyAg7"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=3hXn1baUNhRBy6ZdAycWNIKKqnZoz6mdI1Ok9vpRhU4=; b=bsCxyAg7Vr88tUywNVj/X/NAlB
	F1JWOCIYcR6qiIsC8AWkNSB8NA/itPjfBE1/4jB4GvKFB3rAWKBy2xVvPWncbnN7nMmVrtBtgVTNL
	CA/a9Nv5jaK4B7zfk+WJ+GIw0jl2CnP3uWHYog6NGsE7EPcy1LVsRk/2SvVeEQoRNaE4=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1x6ZHw-005LFQ-Mk; Tue, 15 Sep 2026 21:57:56 +0200
Date: Tue, 15 Sep 2026 21:57:56 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Francesco Dolcini <francesco.dolcini@toradex.com>
Cc: Francesco Dolcini <francesco@dolcini.it>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Emanuele Ghidoli <emanuele.ghidoli@toradex.com>,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>,
	Franz Schnyder <franz.schnyder@toradex.com>
Subject: Re: [PATCH v2 3/7] arm64: dts: freescale: Add Lino iMX93
Message-ID: <95dcbf3e-193d-460b-b6b9-cd412394e4c6@lunn.ch>
References: <20260911091952.96233-1-francesco@dolcini.it>
 <20260911091952.96233-4-francesco@dolcini.it>
 <42ed88a6-d208-482b-94aa-2e45b69c173e@lunn.ch>
 <20260915132806.GA226756@francesco-nb>
 <100eef7b-e1d6-411b-bac5-98790e8f9ea7@lunn.ch>
 <aqmG91HwmKe-enfy@francesco-nb>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aqmG91HwmKe-enfy@francesco-nb>

> Would you mind to articulate in which situation such race condition can
> happen?

Most PHYs have a number of interrupt sources. Taking a random example:

/* DM9161 Interrupt Register */
#define MII_DM9161_INTR_DPLX_CHANGE     0x0010
#define MII_DM9161_INTR_SPD_CHANGE      0x0008
#define MII_DM9161_INTR_LINK_CHANGE     0x0004

#define MII_DM9161_INTR_CHANGE  \
        (MII_DM9161_INTR_DPLX_CHANGE | \
         MII_DM9161_INTR_SPD_CHANGE | \
         MII_DM9161_INTR_LINK_CHANGE)

and a completely made up example which results in problems...

Three interrupts are enabled. Say the PHY reports a duplex change
first. That causes the interrupt line to go low, giving a downward
edge. The interrupt handler fires, and reads the interrupt status
register. In order the clear the interrupt you need to access another
register about duplex. Before you do that, the link interrupt fires,
setting the link bit in the status register. However, there is not
another edge, because the duplex interrupt has not been cleared
yet. The PHY driver does clear the duplex interrupt and exits the
interrupt handler.

The interrupt line is still low, indicating a link interrupt, but
without an edge, no interrupt handler is triggered. The interrupt has
been lost, and the link is reported down, despite being up.

If however you are using level interrupts, as soon as the interrupt
handler exits, and reenables the interrupt in the parent interrupt
controller, it fires again, and the link interrupt is handled.

If you have multiple interrupts indicated by a single line, you should
use level handling in the parent interrupt controller.

	Andrew
