Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B241848EC93;
	Thu, 15 Oct 2026 07:37:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792049848; cv=none; b=T+eowTFEdvaOINxlj7/hzaJcn/u4JWFD1/kAE1FuOhTV4gthKYMT4VNGeVTwVHSImB/Fxm2kM1y4QwrsD2SMt0aOVFpfIm5RFJBM+BR/BI2ikrqr41Jng8XwnvdUtKUTyZ7iaYwI/7V1nSVvbM0asR16Zwqdke0sFm7eH5AAmAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792049848; c=relaxed/simple;
	bh=jq2wXbNW8kRpJLP7hhJsx7IBC8VicsH+fvwZUP1ZAp4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MLurJ6ynqQPrDM2Xqk8aTVNrVfArOrzeIu/LHlES14mX9CaK5OiiRYTq8SilBRBvK8aNvrMkz11ptiIk4MnAOrvxTOWqfFkiJqY/sVVQPZez0B4vDTGCHIj2wxpDhbqi9aTUcn+oURLMXmlJ8NyTHMmfppYSuPdbWVFURTFwJDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=vDb0hcRN; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="vDb0hcRN"
Received: from francesco-nb (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id BAA741FAE5;
	Thu, 15 Oct 2026 09:37:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1792049843;
	bh=wHbtPw6Fpa3W67Ti492QqigdUKJyYU9HzcZKUgG/dMg=; h=From:To:Subject;
	b=vDb0hcRN771AToJfOrVaFxj3rLlsOVGPKBFGmNtk30XW/pxEFUJrys1rDuyft1sXq
	 NaHw8v5QCRABpLwNtJA0wd9sC5dTjB7rzZmMQLoDG9NAPlWrcTH+ESYdok7G1W2i32
	 jZMxXFn+1+uNP27M1HRhcmE0nB4kmIFE/RT41qTYSvbQB1JrBImyNNV8ds5OLxtOqM
	 K5F48olx2/BrPo3ZkFxLOlg75hFqAdutW3UZ0rytCzl8lBauxlnWWQyGSLSCF7NDUL
	 3FfOdfcsy2677F0iM58cSnNzQKsM8cWuOI9F3qmocdXInxP/ji5MwbKxXQg2CWHosE
	 m+zWaX01X3u+g==
Date: Thu, 15 Oct 2026 09:37:19 +0200
From: Francesco Dolcini <francesco@dolcini.it>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Francesco Dolcini <francesco@dolcini.it>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/2] arm64: dts: freescale: imx95-toradex-osm-dev:
 Remove ETH_A PHY interrupt
Message-ID: <20261015073719.GA58156@francesco-nb>
References: <20261014075812.29154-1-francesco@dolcini.it>
 <20261014075812.29154-2-francesco@dolcini.it>
 <as-Pp99xLXk0nRJd@SMW015318>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <as-Pp99xLXk0nRJd@SMW015318>

Hello Frank,

On Wed, Oct 14, 2026 at 09:20:23AM -0500, Frank Li wrote:
> On Wed, Oct 14, 2026 at 09:58:09AM +0200, Francesco Dolcini wrote:
> > From: Francesco Dolcini <francesco.dolcini@toradex.com>
> >
> > GPIO_A7 is a boot strap on the OSM iMX95 module. The pull-up on the OSM
> > Development Board Ethernet PHY interrupt line causes the module to enter
> > USB loader mode instead of booting normally when the reset button is
> > held for more than 0.5 seconds.
> >
> > The PHY interrupt connection has been removed from the carrier board,
> 
> Look like it is hardware modification, can declear the version number here
> 
> Since V_x.y, the PHY interrupt connection has been removed...

Valid point. It deserves a better explanation.

 1. There is no change in the actual board revision.
 2. Moving from interrupt to polling works always, so it does not
    require any change on the board.
 3. On our board is possible to disconnect the interrupt just removing a
    jumper. The actual board revision stay the same. This is a new
    product, that is going to be generally available in a few days. We
    are going to ship boards with such jumper removed to
    solve the i.MX95 strap option issue on reset.
 4. Future board revisions might completely disconnect the ethernet
    interrupt, removing the actual connection from the schematics. Given
    we work in polling (after this patch is merged), this will be a
    transparent change that will not create any kind of software
    incompatibility.


Should I incorporate this detailed information in the commit message and
send a v2 or the current commit message is fine ?

Francesco

