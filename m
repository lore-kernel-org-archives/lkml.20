Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.194.8.81
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794590382;
	b=bTWpoI4ZRgNtUL61t8y8/7sP4kpobseafveyDTeE11uCxLiCRfGCYVMlAQwr64O6dkkY
	 tENq3qVc+ohsIf1gC0PlSG+loJ4mMnnuJjVMdCe2d22y6bRRleRzYsjV6Hq6bI4Q2wMm3
	 PsZmn2l5/vU3iqAzPlSpTDSWyTDfhZGSHN9Nt+EjpGYnggo/ZWZ8uFAAJveHl8MT4Q80H
	 4qRJBu0/eKit33c0kwr3SL3O1rI8olBooma/9GBDdBXWysQ9XDjEE6XrUxMoB9ATdFTXn
	 utW6Epm5iTN/SabD2rdhlUH1i4zs2jL+WbRUf+QE5dfKR449Sqmt3fVop79l9WOGGiw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794590382;
	h=DMARC-Filter:Received:DKIM-Signature:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=lLRe7OQ+TSz40sIuSGn/k/GXxs4txoePPfp4Cfqlpuo=;
	b=seZj4eIvn/ovGuU7f+SM5j0FaxvM9E1XfW1zMrNLKmyjffKqwyJwOcldYkwGig47irC3
	 2SD7y0A5OhC11m17XN5/KAThXqyB2DcpC9JfUciCy1GPavTeCa2JO5/ZXakgM0gtM8mPr
	 s0iMyBuxJUUzCcJBRTy3b+YG3IMTGLUU1Nn6tnyCO2loXbm+XyD1DQtuIhNziILFShaBi
	 miWw1HdGwXzctLeHujyvuQUwjunjlx43utEluxf2GXKWoL2Q5AOPryyT0zZNEMYCG5x2e
	 Q0uyj8+lLskclLZX6w9FZIMu3/P+zbKLArqf395HsxipU9B2Uk3EUsR+9rxm86UEG7Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=dolcini.it;
	spf=pass smtp.mailfrom=dolcini.it;
	dkim=pass header.d=dolcini.it header.i=@dolcini.it header.a=rsa-sha256 header.s=default header.b=gQDmr+DC;
	arc=none smtp.remote-ip=217.194.8.81
Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95AD6606E651;
	Fri, 13 Nov 2026 17:19:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 95AD6606E651
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=dolcini.it header.i=@dolcini.it header.a=rsa-sha256 header.s=default header.b=gQDmr+DC
Received: from francesco-nb (xcpe-178-82-167-143.dyn.res.sunrise.net [178.82.167.143])
	by mail11.truemail.it (Postfix) with ESMTPA id 65197227A9;
	Fri, 13 Nov 2026 18:19:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1794590371;
	bh=lLRe7OQ+TSz40sIuSGn/k/GXxs4txoePPfp4Cfqlpuo=; h=From:To:Subject;
	b=gQDmr+DC0PzJkqKQHMverOutbN4CiJgTneAPacT/pLTZHq5gsyc/bXjMWCh0cuOdS
	 +97MfdA+S4dGKJsNtaQ2OaGv/vPHQY8/M95adOp6rSVVnV7u0V2ew+v7uEatUltIQi
	 C7CfUEHS/Kfe3kOYY7OJRmSDLxWONNCg2QBXRgXLPmqxBhlLNzC9xyMf6l8eLNfzKe
	 1EFOzKOsQJkAOkqN/y3BGWSButhtaATx2KY0SqTsA6pcmNHvq0ib97TEpRqRs72KiQ
	 EjRoqRINtyScFSLfgHyWYAnNNXZKM7CYnsyBJnvNzcFqAtXj0gGy5i0K1tpO7B8d+9
	 LGLlF3PkarAng==
Date: Fri, 13 Nov 2026 18:19:27 +0100
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
Message-ID: <20261113171927.GA762258@francesco-nb>
References: <20261112150236.164850-1-francesco@dolcini.it>
 <20261112150236.164850-2-francesco@dolcini.it>
 <avXeK-IRXbKqI-pc@SMW015318>
 <20261113073135.GA8515@francesco-nb>
 <avc2nzql-JV7a-JH@SMW015318>
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
In-Reply-To: <avc2nzql-JV7a-JH@SMW015318>

On Fri, Nov 13, 2026 at 10:11:11AM -0600, Frank Li wrote:
> On Fri, Nov 13, 2026 at 08:31:35AM +0100, Francesco Dolcini wrote:
> > Hello Frank,
> >
> > On Thu, Nov 12, 2026 at 09:41:31AM -0600, Frank Li wrote:
> > > On Thu, Nov 12, 2026 at 04:02:23PM +0100, Francesco Dolcini wrote:
> > > > From: Francesco Dolcini <francesco.dolcini@toradex.com>
> > > >
> > > > The Verdin family pinout defines the SoM interfaces and their
> > > > numbering, SPI_1 being the SPI bus available to the carrier board,
> > > > implemented by ecspi2 on Verdin iMX8MM.
> > > >
> > > > imx8mm.dtsi numbers ecspi2 as spi1, so the Linux bus number in sysfs
> > > > and the spidev name do not match the Verdin interface. Add a spi0
> > > > alias in the SoM dtsi and delete the inherited spi1, so ecspi2 is
> > > > bus 0, zero-based with SPI_1 being spi0, and carries a single alias.
> > > > ecspi3, internal to the SoM with the CAN controller and the TPM, keeps
> > > > the spi2 alias inherited from the SoC.
> > > >
> > > > Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
> > > > ---
> > > >  arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi | 2 ++
> > > >  1 file changed, 2 insertions(+)
> > > >
> > > > diff --git a/arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi
> > > > index 1ac9d000d415..0369803a4d46 100644
> > > > --- a/arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi
> > > > +++ b/arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi
> > > > @@ -16,6 +16,8 @@ chosen {
> > > >  	aliases {
> > > >  		rtc0 = &rtc_i2c;
> > > >  		rtc1 = &snvs_rtc;
> > > > +		spi0 = &ecspi2;
> > > > +		/delete-property/ spi1;
> > >
> > > Can you avoid delete property for new platform?
> >
> > Unfortunately this is needed.
> >
> > The included imx8mm.dtsi has
> >
> >   spi1 = &ecspi2;
> 
> Create patch move aliase to each boards' dts from imx8mm.dtsi, which is
> board feature, not soc features.

Please see the linked thread [0][1]. It's not a viable option.

In addition, I can do this for my boards (Toradex), how do I know what I
have to move for boards I do not know? I can't do that. The only way
would be to duplicate the whole aliases on *every* board.

Unfortunately your proposal does not work.

Francesco

