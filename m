Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.194.8.81
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794555103;
	b=0SVAa2y9mI5kvo7ts1aTCdX07nN3B+HrpdGxrtRFqcJW8K4zOiYZA6I97lfRGNLEOSY7
	 kuRSDzg/3XBK79BGzF9sGVduhTkDWgwqKA75DHCZOHNL4sLQfGJ2vWJsMea5hr/aCQlh+
	 PH4MMsz7WEUt3ljBHL4BK/hrrQTm10iodkC4BZs4YwbdppthPxgrlA63tRVb8kOcBmjJy
	 ZHiBLaOLb0rzYoy4r4XoFwM87IOiIIXzUypCtgbq26710kWJgaux5qT2HB1g/zyzVgRpw
	 YjTMyRS1rU84dkeZfxuvg9b1SXdPq1BkB2TWIgcmaMBJiY3a6V16cMN4aIIwAoB1jOg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794555103;
	h=DMARC-Filter:Received:DKIM-Signature:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=a8dwXPHMPfCbtdhYZUDcAPyhoTp0Li9Sm++J9+wQ2hg=;
	b=X/lx6ZDt5sEhpHPK+OKGGUnSAZkpsf4gSjVUp6DZKCs/ctg9+S3x1TYqhU99TFXRNbu9
	 E2GVrw0UwJJUckjznXwutHMhgXpOG09Cyl2EB2bEu3Hcx4T955xQeuS9mk9sePxS5Cemh
	 QGhJg6wTwPSq6yPQsBYp+yRKeBk/fql4NMucGiQ1iNyOmV+KMb6yrwHPAhkl4io0qNbZ+
	 ynxniXHdBKehy+w5oNvBvNEDtA18qJYpag9wfZtS4xQpW5j0ysoDgafksuocfQB7DVnRh
	 nRKF6A0pnHKOttaPTRdD5ZIqRp/bJg8I4Igim4YRsgNzO7nA/XklnKf/88tRfc6Ot7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=dolcini.it;
	spf=pass smtp.mailfrom=dolcini.it;
	dkim=pass header.d=dolcini.it header.i=@dolcini.it header.a=rsa-sha256 header.s=default header.b=DY9VXQ9g;
	arc=none smtp.remote-ip=217.194.8.81
Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F9CF606A31C;
	Fri, 13 Nov 2026 07:31:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0F9CF606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=dolcini.it header.i=@dolcini.it header.a=rsa-sha256 header.s=default header.b=DY9VXQ9g
Received: from francesco-nb (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 26417227AD;
	Fri, 13 Nov 2026 08:31:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1794555099;
	bh=a8dwXPHMPfCbtdhYZUDcAPyhoTp0Li9Sm++J9+wQ2hg=; h=From:To:Subject;
	b=DY9VXQ9goHKAVqWr8PfX1MtVIeeN2mOlbRRYpfI3rFmaWdvnuPGoEQb0j71qf65fQ
	 SipdsSUlhQjaWUUYT8TVtx7rWSK6EMCaZYOjR2ELbcueb/lhIcNfrwTpyJnHnizRnn
	 2HA+cxrkSuX9qVZkiVuq8MKRfAFY60DEvE9XIQJn5LFtd1/eniXZ3xQTmda6u1t/yg
	 Aai5Cl8uCZ+qrWufRJY6pQV0vDtETVgQHTTgwX8C/0NirWv8Gadb7khoXz9kEw1gJP
	 tvVb3QZK5Em9ZSCkXcd0mHQAhD6WSuEEtSef+BEZme2DxxX8T9h6mDDk6556WOgz1R
	 QWBPZJehhQRlw==
Date: Fri, 13 Nov 2026 08:31:35 +0100
From: Francesco Dolcini <francesco@dolcini.it>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Francesco Dolcini <francesco@dolcini.it>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-bsp@toradex.com,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 01/11] arm64: dts: freescale: imx8mm-verdin: Add SPI
 alias
Message-ID: <20261113073135.GA8515@francesco-nb>
References: <20261112150236.164850-1-francesco@dolcini.it>
 <20261112150236.164850-2-francesco@dolcini.it>
 <avXeK-IRXbKqI-pc@SMW015318>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <avXeK-IRXbKqI-pc@SMW015318>

Hello Frank,

On Thu, Nov 12, 2026 at 09:41:31AM -0600, Frank Li wrote:
> On Thu, Nov 12, 2026 at 04:02:23PM +0100, Francesco Dolcini wrote:
> > From: Francesco Dolcini <francesco.dolcini@toradex.com>
> >
> > The Verdin family pinout defines the SoM interfaces and their
> > numbering, SPI_1 being the SPI bus available to the carrier board,
> > implemented by ecspi2 on Verdin iMX8MM.
> >
> > imx8mm.dtsi numbers ecspi2 as spi1, so the Linux bus number in sysfs
> > and the spidev name do not match the Verdin interface. Add a spi0
> > alias in the SoM dtsi and delete the inherited spi1, so ecspi2 is
> > bus 0, zero-based with SPI_1 being spi0, and carries a single alias.
> > ecspi3, internal to the SoM with the CAN controller and the TPM, keeps
> > the spi2 alias inherited from the SoC.
> >
> > Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
> > ---
> >  arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi
> > index 1ac9d000d415..0369803a4d46 100644
> > --- a/arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi
> > +++ b/arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi
> > @@ -16,6 +16,8 @@ chosen {
> >  	aliases {
> >  		rtc0 = &rtc_i2c;
> >  		rtc1 = &snvs_rtc;
> > +		spi0 = &ecspi2;
> > +		/delete-property/ spi1;
> 
> Can you avoid delete property for new platform?

Unfortunately this is needed. 

The included imx8mm.dtsi has

  spi1 = &ecspi2;

so, without the /delete-property/ we will have both

  spi0 = &ecspi2;
  spi1 = &ecspi2;

and what is happening with that is implementation dependent, and this
would not be ok.

The original issue is that imx8mm.dtsi should not define the aliases in
the first place, unfortunately removing it now is no longer possible,
it will introduce regressions everywhere [0][1].

This issue, and the reason I have the delete-property, is already
explained in the commit message.

Francesco

[0] https://lore.kernel.org/all/20250425-dts-imx-aliases-ethernet-v1-0-15b9d5cca611@linaro.org/
[1] https://lore.kernel.org/all/aca3addbe510c58524af8d3fd069fe2ae4b1cd24.camel@pengutronix.de/
