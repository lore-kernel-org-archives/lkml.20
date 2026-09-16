Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7427E3E16B9;
	Wed, 16 Sep 2026 05:57:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789538238; cv=none; b=YQGHh5hs2/d89rgzag02CxaFwZlnVwSSG9iXrRRnV+1P6LGAZHgNwUuuW2rYb9u/x+LkFJlCoEDpgjaXIAqUn6AyTGKOD8VXIBwbZa3FHEQVWKv1/hRnr0i5WKdypN6YwRjXhhvszNuNP25Zjhb+VpDKkmfvtv5VcUjdOV+e8wE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789538238; c=relaxed/simple;
	bh=NKEOLgYM1d/tM4cL9HDDE/AU3aDhCHRPLf/wza+LUkY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eV4qdYpMXwf2/idESy8wfUpyRqX3hr//OBLsy6IMV+WfFZQuaoerUc0B2d0TyhOBYRETsSoBSM7QP4P9kcZb+s7U//DY/t6ZIUq3BSDdJ3FSe8PabldObILP9HI/KW00VHCOMIJ4sCkYTo9/hJkTwy5+lspfde/rvFzoozjMTDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=fx9Qj3JZ; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="fx9Qj3JZ"
Received: from francesco-nb (xcpe-178-82-167-143.dyn.res.sunrise.net [178.82.167.143])
	by mail11.truemail.it (Postfix) with ESMTPA id 0ED471FC29;
	Wed, 16 Sep 2026 07:57:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1789538231;
	bh=I+tkhFfWBsJlP15FZEQQsLoKTghh1QY7GM+Pdd6KOXw=; h=From:To:Subject;
	b=fx9Qj3JZ2EMKzxNkjNReNY44VYRgPYzHAHBCHTH6s1fnwISrik4vk57VVsohipOia
	 dpj8A7BVuE6jSnPeL50iZRrViP+bpLASPYVBs2dceMgORVJJerYBOpgY0J7BfaRCjv
	 2CJqhgSgotHJmdUvRy4zKpWYUdwD51So/ALnBUNcwgZ+zSs4947ApkcuKjkmpk8qtL
	 JJFicrOGLAd8pa0GK3uTfgFIvabqMkt4m6UESgc87jII3t9mEkCgZM/g/8menIiTO8
	 b0hOKS2o4gNRlbTJQYYgUdrhtB+FOdTJ1NE4oXKcyMHbpCsutI07YePPnud51g7oZT
	 6qfMbGg45nwSA==
Date: Wed, 16 Sep 2026 07:57:06 +0200
From: Francesco Dolcini <francesco@dolcini.it>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>,
	Francesco Dolcini <francesco@dolcini.it>,
	Rob Herring <robh@kernel.org>,
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
Message-ID: <20260916055706.GA20310@francesco-nb>
References: <20260911091952.96233-1-francesco@dolcini.it>
 <20260911091952.96233-4-francesco@dolcini.it>
 <42ed88a6-d208-482b-94aa-2e45b69c173e@lunn.ch>
 <20260915132806.GA226756@francesco-nb>
 <100eef7b-e1d6-411b-bac5-98790e8f9ea7@lunn.ch>
 <aqmG91HwmKe-enfy@francesco-nb>
 <95dcbf3e-193d-460b-b6b9-cd412394e4c6@lunn.ch>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <95dcbf3e-193d-460b-b6b9-cd412394e4c6@lunn.ch>

Hello Andrew,
thanks a lot for the detailed explanation.

On Tue, Sep 15, 2026 at 09:57:56PM +0200, Andrew Lunn wrote:
> > Would you mind to articulate in which situation such race condition can
> > happen?
> 
> Most PHYs have a number of interrupt sources. Taking a random example:
> 
> /* DM9161 Interrupt Register */

...

> The interrupt line is still low, indicating a link interrupt, but
> without an edge, no interrupt handler is triggered. The interrupt has
> been lost, and the link is reported down, despite being up.
> 
> If however you are using level interrupts, as soon as the interrupt
> handler exits, and reenables the interrupt in the parent interrupt
> controller, it fires again, and the link interrupt is handled.
> 
> If you have multiple interrupts indicated by a single line, you should
> use level handling in the parent interrupt controller.

I looked into the specific ethernet phy used here, TI DP83867, and
I would say that the falling edge interrupt should be safe on this
specific board/phy.

There is a single ISR register, and it's a single read/clear atomic
operation (MII_DP83867_ISR 0x13, dp83867_ack_interrupt).  This is done
before doing any access to any other register, so the interrupt will
just fires again if anything happen. I do not see the race condition window.

I know it is not conclusive, but we have multiple boards with the
same edge interrupt configuration and the same ethernet phy (the
interrupt is wired directly to a TI SoC, that supports only edge
interrupt, not to a gpio expander) and we never had any failure. Our
test coverage is quite good IMO, commit 91a7cda1f4b8 ("net: phy: Fix
race condition on link status change") is something I did because our
testing had some sporadic failures for a different race condition.

What do you think? *IF* my reasoning is correct I would suggest to keep
the code as it is now.

Francesco

