Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FC94585961;
	Thu, 17 Sep 2026 14:08:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789654130; cv=none; b=o72aK99yrYVDUqxh97Ayr7yz1lpO+9sdMHnu0V2fBxjm9LNYyCgLiy/mo5KqurIrDE32HdVHkNOGX0+NgJeBmXPDEEvNVXFbOZ++YDwTvJ2xLJHfdVkhN6KUTKcIBQQrAERS55s1BRVKwyWAQZd3FLdCgq5+VbTZO0dRJgQPiEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789654130; c=relaxed/simple;
	bh=t6XrF1X5QM2mzrSJfZxp0KiKTO5w2G6nGOk7OrNjfuc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IY6M9RR76G+RLFHKd618eP3OIkfSvc1C6EPUcMrPBf6HNvQIIjvYsgg4rHUGfBgf/qcoakniEkiUh6wwEwv/Cl3ck05SAIVSFElZVJgNy/ClK9Rfq1KXSMNXUmnN5tj3U6PidJe3jQNc0yz/ISuqr5vZH47OuW2Do/0p/TLik9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=WC3Jbluy; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="WC3Jbluy"
Received: from francesco-nb (xcpe-178-82-167-143.dyn.res.sunrise.net [178.82.167.143])
	by mail11.truemail.it (Postfix) with ESMTPA id DADEA227EA;
	Thu, 17 Sep 2026 16:08:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1789654120;
	bh=04sGXrdIwPyZcUs1Jy4idOXaBQa8m7ARyP/sXMKY+Ns=; h=From:To:Subject;
	b=WC3Jbluydah594rbdqN0S7h5hmk27BYCVaKXWLXc4MwHJbWaqWuZ99DmAd6TcDQEv
	 Qi6K9EaajyTsBzNtbAFBWeJjEGQwsqgy3jjkRN7IoazC/WzjS9yoFDUBBPHcQiTbAN
	 24bGCyieBr7tmrjAT6FJqo+i3WJE5ZiLgKZB+1bhbzy6vjmL3mWruLcf1jL+iukI8c
	 uAlwYAV07d7A9iuxUD4+onViwCVUm03Yt/SYhUqOpXD7lYQnuxwhjYXwo+IrmkqbwW
	 8zU8JXtamiiPZrtTe03/p1AE4p+CNnF6NBLB+cIRK4bQ8Uom1+s+Qb6h8yJfUvjGtI
	 IcCwwbNwWStVg==
Date: Thu, 17 Sep 2026 16:08:36 +0200
From: Francesco Dolcini <francesco@dolcini.it>
To: Frank Li <Frank.li@oss.nxp.com>, Frank Li <Frank.Li@nxp.com>
Cc: Francesco Dolcini <francesco@dolcini.it>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Emanuele Ghidoli <emanuele.ghidoli@toradex.com>,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>,
	Franz Schnyder <franz.schnyder@toradex.com>
Subject: Re: [PATCH v2 3/7] arm64: dts: freescale: Add Lino iMX93
Message-ID: <20260917140836.GA119572@francesco-nb>
References: <20260911091952.96233-1-francesco@dolcini.it>
 <20260911091952.96233-4-francesco@dolcini.it>
 <aqQQjCW1xaGfPdss@SMW015318>
 <20260914054214.GA19835@francesco-nb>
 <aqgEfRl9INLZ-DWM@SMW015318>
 <aqgGgxzqiIbF66DX@francesco-nb>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aqgGgxzqiIbF66DX@francesco-nb>

Hello Frank,

On Mon, Sep 14, 2026 at 04:36:51PM +0200, Francesco Dolcini wrote:
> On Mon, Sep 14, 2026 at 09:28:13AM -0500, Frank Li wrote:
> > On Mon, Sep 14, 2026 at 07:42:14AM +0200, Francesco Dolcini wrote:
> > > Hello Frank,
> > >
> > > On Fri, Sep 11, 2026 at 09:30:36AM -0500, Frank Li wrote:
> > > > On Fri, Sep 11, 2026 at 11:19:46AM +0200, Francesco Dolcini wrote:
> > > > > From: Francesco Dolcini <francesco.dolcini@toradex.com>
> > > > >
> > > > > Add support for the Lino iMX93 SoM, its Verdin adapter and development
> > > > > carrier board.
> > > > >
> > > > > The SoM is available in two variants, with i.MX91 or i.MX93 SoC, using
> > > > > the same PCB (the two chips are pin to pin compatible), to avoid
> > > > > duplication create a common dtsi to share commonalities.
> > > > >
> > > > > Link: https://www.toradex.com/computer-on-modules/lino-arm-family/nxp-imx93
> > > > > Link: https://www.toradex.com/accessories/lino-verdin-adapter
> > > > > Link: https://www.toradex.com/products/carrier-board/verdin-development-board-kit
> > > > > Co-developed-by: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>
> > > > > Signed-off-by: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>
> > > > > Co-developed-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
> > > > > Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
> > > > > Co-developed-by: Franz Schnyder <franz.schnyder@toradex.com>
> > > > > Signed-off-by: Franz Schnyder <franz.schnyder@toradex.com>
> > > > > Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
> > >
> > > ...
> > >
> > > > > +&gpio1 {
> > > > > +	gpio-line-names =
> > > > > +		"LINO_P18",
> > > > > +		"LINO_P16",
> > > > > +		"PMIC_I2C_SCL",
> > > > > +		"PMIC_I2C_SDA",
> > > > > +		"",
> > > > > +		"",
> > > > > +		"",
> > > > > +		"",
> > > > > +		"",
> > > > > +		"",
> > > > > +		"LINO_P65", /* 10 */
> > > > > +		"LINO_S18",
> > > > > +		"LINO_S24",
> > > > > +		"LINO_S20",
> > > > > +		"LINO_S22",
> > > > > +		"";
> > > >
> > > > Can you wrap to 4 names pre line
> > > >
> > > > 	gpio-line-names = "LINO_P18", "LINO_P16", "PMIC_I2C_SCL", "PMIC_I2C_SDA",
> > > > 			  "", "", "", "",
> > > >
> > > > Reduce LOC, and easy to locate number, such gpio 13,  second of 3rd line
> > >
> > > I already replied on the v1 that I disagree on your request.
> > 
> > Your v2 sent too quick before I read v1.
> > 
> > > To me it is
> > > just more readable the way it is now and I do not see minimizing the
> > > lines of code something that is bringing any kind of benefit on its own.
> > 
> > The major concern is that it makes code read harder and lost focus by long
> > lines.
> 
> Understood, we do disagree on this.
> 
> > > Is this blocking this from being picked up?
> > > Is there any other concern on this series?
> 
> Can you answer these two questions?

Please let me know if it is a requirement to have the gpio line names
wrapped with 4 elements per row or not. I am waiting on your answer on
this.

Thanks,
Francesco

