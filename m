Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8876837998B;
	Mon, 14 Sep 2026 05:42:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789364542; cv=none; b=f2c/U8Gb4OXO6tRAHAZcT8uzg8UYCegHaXc70+JMHjp7KdP2ivLW8FUkRZYntmVUfQOY+sVLSTyiAJlP0lCsxPD+TnIiakIcuuuOCf0pf2BGgt+j8kII2/3Kzh1CE0lqI556eOR/a8iUzTW0s4LlU2873Ln//XErLmNhjIohg2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789364542; c=relaxed/simple;
	bh=c7mg0DP44IvEh3HQum8uG66Q7stlHdzJePAOAC2ZNRQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oQsaLOeR/1zlkwJ1mmn1veHQiXmZ/C/9X+RV21ZvT9wxOh3ye9Yd2WvtTb/OnTwEUrqXgaA8c9F74t9xPYh7zB3k32Vf99G6hFNp1iF5jnWurwl6szTmFdXy7eh6Bt/528eDQkC6O2ed0S6gsmb0pZseZygeWlj7VdNBAyuDSBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=q0xFFMEi; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="q0xFFMEi"
Received: from francesco-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch [83.173.201.248])
	by mail11.truemail.it (Postfix) with ESMTPA id 03C511F81F;
	Mon, 14 Sep 2026 07:42:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1789364538;
	bh=V/NEV/kLTCX8bokAeRTT4qUddiLyH+CfDie4m5wqp+I=; h=From:To:Subject;
	b=q0xFFMEim0YvPgdD5421gOP88vBaDzCd+dwfcNZdbCweRETd8O2SMCeuhBdTwhyw6
	 TqOf6nhpt6hjjx31sK8RlMamI4jbPbC52Go+aIVe6cY5uTyNeq1jv59WFbnPV94Zv0
	 wXDk9AdqnkHT/hFHAAQrTMupQh/DVxvnXVsJ0/lhBL7ASTnKNmjQoVHFdKvLqxUN4s
	 PNe/ORkLvCg1coydLgIp2FgjTHyqDW5VQatp1JBtxW9BUPX/2St7MxHx16fkVgTZ7T
	 SiYmirpuCuLgOCP4FQ27PHsQKaPlLsWPAEPOJXybsEh3nNodPdlSpajDJin2f8gioU
	 wETC3bs56V8+Q==
Date: Mon, 14 Sep 2026 07:42:14 +0200
From: Francesco Dolcini <francesco@dolcini.it>
To: Frank Li <Frank.li@oss.nxp.com>
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
Message-ID: <20260914054214.GA19835@francesco-nb>
References: <20260911091952.96233-1-francesco@dolcini.it>
 <20260911091952.96233-4-francesco@dolcini.it>
 <aqQQjCW1xaGfPdss@SMW015318>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aqQQjCW1xaGfPdss@SMW015318>

Hello Frank,

On Fri, Sep 11, 2026 at 09:30:36AM -0500, Frank Li wrote:
> On Fri, Sep 11, 2026 at 11:19:46AM +0200, Francesco Dolcini wrote:
> > From: Francesco Dolcini <francesco.dolcini@toradex.com>
> >
> > Add support for the Lino iMX93 SoM, its Verdin adapter and development
> > carrier board.
> >
> > The SoM is available in two variants, with i.MX91 or i.MX93 SoC, using
> > the same PCB (the two chips are pin to pin compatible), to avoid
> > duplication create a common dtsi to share commonalities.
> >
> > Link: https://www.toradex.com/computer-on-modules/lino-arm-family/nxp-imx93
> > Link: https://www.toradex.com/accessories/lino-verdin-adapter
> > Link: https://www.toradex.com/products/carrier-board/verdin-development-board-kit
> > Co-developed-by: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>
> > Signed-off-by: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>
> > Co-developed-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
> > Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
> > Co-developed-by: Franz Schnyder <franz.schnyder@toradex.com>
> > Signed-off-by: Franz Schnyder <franz.schnyder@toradex.com>
> > Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>

...

> > +&gpio1 {
> > +	gpio-line-names =
> > +		"LINO_P18",
> > +		"LINO_P16",
> > +		"PMIC_I2C_SCL",
> > +		"PMIC_I2C_SDA",
> > +		"",
> > +		"",
> > +		"",
> > +		"",
> > +		"",
> > +		"",
> > +		"LINO_P65", /* 10 */
> > +		"LINO_S18",
> > +		"LINO_S24",
> > +		"LINO_S20",
> > +		"LINO_S22",
> > +		"";
> 
> Can you wrap to 4 names pre line
> 
> 	gpio-line-names = "LINO_P18", "LINO_P16", "PMIC_I2C_SCL", "PMIC_I2C_SDA",
> 			  "", "", "", "",
> 
> Reduce LOC, and easy to locate number, such gpio 13,  second of 3rd line

I already replied on the v1 that I disagree on your request. To me it is
just more readable the way it is now and I do not see minimizing the
lines of code something that is bringing any kind of benefit on its own.

Is this blocking this from being picked up? 
Is there any other concern on this series?

Francesco

