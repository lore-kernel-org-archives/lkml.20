Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCDDC38DC72;
	Wed, 16 Sep 2026 13:03:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789563805; cv=none; b=jxDqjZ01nu8N76HE/u1Ghp4IaIwc/R5uomCjqLTjOzMk4rDbQkhVuEeNV/FA+rXanF2US3CbOQfysxeK4PWTCwH4zaz9uWr4RxkwNqL85k8r5fhS2hTUMrF5XhDbc3P6fmlo3SRG87gDW3qUqU/scerk3BQa2BQmA8T4Z9REQKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789563805; c=relaxed/simple;
	bh=wwBz8itUmqppSzdhAKrv0IX+biYMVm0EQvyDVo+Ixx8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K9TQkL1z1S2Mg7z4a4XW7UKDppd+V2RlU7pD6GRYJ4W3udeNh9vI7pWmy+vpJ1QpNywoNOhhH/rypHbaJVIW60WTlwU67f2N17ztaUkhkEpcu6LUAwDDLB43ckBTcbR4AX4PFasV3FTKveRoqmB/IE47yXOXOd2abqSe9DoYfwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=19SayIr5; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="19SayIr5"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=oiSfvUAUcmVPBixTSv8CyI5eKdTp2eCY9vSp754uHAQ=; b=19SayIr58yyGer4JWwyFocFp2I
	ik1oe5Zw2vZVSCVtzpKMKIr2x9lQkofOMQA14UCvsgyDLFQ8DULUWR+3BuAgp/NSNqnsSLDaqBxJs
	SH9BnF9X0kf0unsGtM+d97uiWSFrQKOzpZlPBO1DEZSHcWopLJV0RVXH1xLKB1p/wFFw=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1x6pIC-005TtK-Lm; Wed, 16 Sep 2026 15:03:16 +0200
Date: Wed, 16 Sep 2026 15:03:16 +0200
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
Message-ID: <27cceddf-8797-4e9e-ab7b-4cddb03d6448@lunn.ch>
References: <20260911091952.96233-1-francesco@dolcini.it>
 <20260911091952.96233-4-francesco@dolcini.it>
 <42ed88a6-d208-482b-94aa-2e45b69c173e@lunn.ch>
 <20260915132806.GA226756@francesco-nb>
 <100eef7b-e1d6-411b-bac5-98790e8f9ea7@lunn.ch>
 <aqmG91HwmKe-enfy@francesco-nb>
 <95dcbf3e-193d-460b-b6b9-cd412394e4c6@lunn.ch>
 <20260916055706.GA20310@francesco-nb>
 <8bb9b763-4553-4263-b0ea-0129f5db0229@lunn.ch>
 <aqqPBffOWirFXJSw@francesco-nb>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aqqPBffOWirFXJSw@francesco-nb>

> And again, thanks for the review, I appreciate it. The goal is to have
> working ethernet with the interrupt, and, **IF** not possible, working
> ethernet is more important than the interrupt :-)

Your decision.

The datasheet says it is active low. Polling will always work.

Generally, users who want fast notification of link down use something
like Bidirectional Forwarding Detection, which can tell you much
faster that the link is dead then the PHY itself, which tends to wait
for 1 second before declaring the link down and changing BMSR.

    Andrew
