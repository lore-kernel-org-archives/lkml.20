Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CBD83C5525;
	Tue, 15 Sep 2026 13:28:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789478897; cv=none; b=kqJzYaN/qegkG5DpPwAIAB1V+1/uNIp0we73I8BNnkpdjSCD3JTuFsl915mt3zE2qY99Z4nxWruEWDV4v3U6D+uDnnOQQaJ4rv6RpW5Adks9NTlnRChP8O826CDUr7qwfSEFBf6DT8Rqmi8sZGt7r3kKTuZlpBbzS8FR283dLFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789478897; c=relaxed/simple;
	bh=1UzHk92WHrAWNlT/U0zIHs43oIVyfSxja4G1UGygWlY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=trdcklngSHj22kJ1ySrWXHGxWgKSgYMS6QcDNvpD48tsNuZ75FR6Qzpgu+kb6DRhHWae+VP/kPKjotOQwxRYxL5BH269+64ojAIcG8sABpu4XqlaJ2VdTfPb8JZQ5Os2lODTvmv7lpPAKswwwADzsB/A50Pj1VL5vSG+aR5Yy88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=Y4Wrh/yM; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="Y4Wrh/yM"
Received: from francesco-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch [83.173.201.248])
	by mail11.truemail.it (Postfix) with ESMTPA id 8E3BE22A45;
	Tue, 15 Sep 2026 15:28:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1789478891;
	bh=de8dK4GS7VwXyA73g76QueaQ8BqePWsZI4huThE49ws=; h=From:To:Subject;
	b=Y4Wrh/yMbgyClId/aHdNNhAhlmAvvACMB1nx37CLU72/PqBGhxahOV+VwBeb9VJgW
	 +Nhx/zORle9RUPYZ5ns1R+rV5zWofZmPcI9/akLauYpqoqOoUL5e3FC+4apQZVUEhX
	 BeJ5WDLTQmlMDuDYWCv0DWrO55VFdM+OquEc+GX33XeUtjFTWf9OCstYvkuYg1wgMm
	 IdvkKsNiOKvuptw95mgRkM+IMm8mL+//xyx80gnjt+NoSFSQ7ASYLXsEk6fboEV9ah
	 9SO19w9whSUGkUd3JS7BGQPbDPj9PcWsyrKdbZ8UYfSiOeBnCoCnCHGX4EkBn3xyfw
	 lDXOKhBUzfvlg==
Date: Tue, 15 Sep 2026 15:28:06 +0200
From: Francesco Dolcini <francesco@dolcini.it>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Francesco Dolcini <francesco@dolcini.it>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
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
Message-ID: <20260915132806.GA226756@francesco-nb>
References: <20260911091952.96233-1-francesco@dolcini.it>
 <20260911091952.96233-4-francesco@dolcini.it>
 <42ed88a6-d208-482b-94aa-2e45b69c173e@lunn.ch>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <42ed88a6-d208-482b-94aa-2e45b69c173e@lunn.ch>

Hello Andrew,
thanks for the review.

On Tue, Sep 15, 2026 at 03:19:45PM +0200, Andrew Lunn wrote:
> > +	ethphy1: ethernet-phy@1 {
> > +		reg = <1>;
> > +		interrupt-parent = <&adapter_gpio_expander>;
> > +		interrupts = <3 IRQ_TYPE_EDGE_FALLING>;
> 
> Falling interrupts is probably wrong. They are normally level, active
> low.


It is wanted. The I2C ioexpander component used for the interrupt
supports only edge interrupts. We tested it and it works fine like that.

The linux driver is now able to emulate the level interrupt in software,
however ...
 - the DT is shared with other project, it is a HW description and it is
   not supposed to pair with the specific linux driver
 - when we tested it, the SW emulation was not really reliable, and we
   prefer to play on the safe side

Francesco

