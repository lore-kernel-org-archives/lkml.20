Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E784527442;
	Wed, 16 Sep 2026 12:28:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789561687; cv=none; b=ra2UBjZD6HBzm2DzM7lK9oQF6MpkiTG4V+8ugtMsfpS/gaFsC/+LHp11FGO6Qo/QUHY9Lzo4vdOkQSd2Z772XO65NSeiYkyQGheK42qvEUjX+5XQ5EscYfbEZgOU27//BnCXwqOMIerMazkexV6fWyPNQy7gLoOu5aYrs07UY8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789561687; c=relaxed/simple;
	bh=yYQlTjY0blJDFiAH3GupFPYfZSGhxWxXn4SWM5/3xw4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XolnPu+hvMYXEjNNxdiA1khgeD3c4YAyheBVgVr4hkMYKYxcbYvgtFbdN+UWVtTOLOMjbpLygA52WMpvhJBXaNGGUBpLUTQ/f3GPplinMtSuix3PoMWzMlnmhVjPj2X3a0avvXHDmLnayvjiGLGkAxdCjtuRJh6wYyQS1LtlDt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=4Ic8Dgpp; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="4Ic8Dgpp"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=Y7ep0hNPkrPmj6OIlbqC/gwQgMz4kST08uKktVrdoyE=; b=4Ic8Dgppc1tbR5PSDRMXMpQz1T
	r0bsjEDlwR5XYOKBaNiBWoPfrtJ400vi0FqutE7vV+TLnMd0Pzb7xF2Ipi2htBH4T8LFBy7pAeVQm
	U1kiaIBuCgMPz7pZKXhWIwQDoUOTZdVAUkeVneTKyVktxruJYeoA8GZYxOCyMdOiUd9E=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1x6ojy-005TWo-HS; Wed, 16 Sep 2026 14:27:54 +0200
Date: Wed, 16 Sep 2026 14:27:54 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Francesco Dolcini <francesco@dolcini.it>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>,
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
Message-ID: <8bb9b763-4553-4263-b0ea-0129f5db0229@lunn.ch>
References: <20260911091952.96233-1-francesco@dolcini.it>
 <20260911091952.96233-4-francesco@dolcini.it>
 <42ed88a6-d208-482b-94aa-2e45b69c173e@lunn.ch>
 <20260915132806.GA226756@francesco-nb>
 <100eef7b-e1d6-411b-bac5-98790e8f9ea7@lunn.ch>
 <aqmG91HwmKe-enfy@francesco-nb>
 <95dcbf3e-193d-460b-b6b9-cd412394e4c6@lunn.ch>
 <20260916055706.GA20310@francesco-nb>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260916055706.GA20310@francesco-nb>

> I looked into the specific ethernet phy used here, TI DP83867, and
> I would say that the falling edge interrupt should be safe on this
> specific board/phy.

https://www.ti.com/lit/ds/symlink/dp83867ir.pdf

Page 7:

  INTERRUPT: This pin can be programmed as an interrupt output instead
  of a Power down input. In this mode, Interrupts is asserted low
  using this pin.

Also:

  When operating this pin as an interrupt, the pin is an open-drain
  architecture.

This allows you to connect multiple PHYs to one SoC interrupt, shared
interrupts, which again needs level interrupts.

So the datasheet says it is active low.

> What do you think? *IF* my reasoning is correct I would suggest to keep
> the code as it is now.

If you decide to stay with edge, i suggest you put a comment in DT,
something like:

# The PHY data sheet says the interrupt is active low, but the
# interrupt controller does not support level interrupts. Use it as
# falling edge and hope for the best.

	Andrew
