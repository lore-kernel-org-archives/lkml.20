Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.194.8.81
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794829517;
	b=n/3In4iros9R9CjBYctKTu6ua300XTv5wE2DmwS7xI0hW6NBHKHZiPk7WTkY1ED0yZVL
	 VtQz+1Cue1Wfsu6HZT6jScFqoLzfldg5YCn2jhJ3pF2+8xWJLKYfAOxB2P3Bf2iySLdEM
	 /AEuteUj7/Rj3A80hDRpHqG0ohDfFIr9t905lUHXTX8/o5FU98sJdZ3KZOXKJH1PnINNx
	 IBn/1XzMAtwHNOvLFd+792Jgn5tSQSPx+ZPiuMlNJrgmrEnP8/fyo4g3J7rC7s+SuUI0Y
	 7L+VGd060JbmWYrDHea1GxhSFrvd32wgqdqRGj5ewqUwJr3TL8f85pekfpi4WPZJwTQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794829517;
	h=DMARC-Filter:Received:DKIM-Signature:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=FGTx4VY/SL5BPbWdA4BlE3iQgAacAgZlBWd1emO5adI=;
	b=ZYgfb0oa+/kVoNqr+SqbfqQkDmKq8tiy0KJBeTmk8TWnLm2x8V9G7vYhCnxgdGeW59pk
	 Cv8J0WtATjRSoQ/m8ujU5kquk9mE//cUAC8I7W7ADIkXZGCw/csiR7a8VXb8rZsr0jWbu
	 sdkH7igBTjOwam3nmrVkfsVw7oZJGLj5+qgUApHSoAvc9ElpyVMTjkrF34ZEXOtlyH7TV
	 ZytyIlV/wUECS3qkMVOW0U6uGH1OiRzK8B0c83vBgzUUsf0G2cPziYhQg6/9/hksOfETc
	 prGXdoNku2YtX8hA+JwTnb6Te6Fvm8e73yy7enaSuzdfF7HqYOO7S4noUEvb+bsnmXg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=dolcini.it;
	spf=pass smtp.mailfrom=dolcini.it;
	dkim=pass header.d=dolcini.it header.i=@dolcini.it header.a=rsa-sha256 header.s=default header.b=VYNVj83v;
	arc=none smtp.remote-ip=217.194.8.81
Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E62FF606A32C;
	Mon, 16 Nov 2026 11:45:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E62FF606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=dolcini.it header.i=@dolcini.it header.a=rsa-sha256 header.s=default header.b=VYNVj83v
Received: from francesco-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch [83.173.201.248])
	by mail11.truemail.it (Postfix) with ESMTPA id 2B59B1F901;
	Mon, 16 Nov 2026 12:45:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1794829513;
	bh=FGTx4VY/SL5BPbWdA4BlE3iQgAacAgZlBWd1emO5adI=; h=From:To:Subject;
	b=VYNVj83v4dL2FQUMVnOsJ1z1WEOIiBqsywF1kNt2PnHYe+TDOVilBKC+fiVqTEiBA
	 y8Nbx007C/J6aR5klH7FPYMfU7paIcSsBuOgvw0+UEKOuapQhGpE3TTDElFm+amFD1
	 DLKTKlOJT4Hsg0D3J34XILqb+NzxPpQIR2tUmQT+POfeOORyN366S2qbuBirDVUcna
	 92ewQk+iE8xkMiJ6QEc9yor/K5PWT6EpTWErRV7DlcBeR1pgFLa3Z1gI+mbmGtKfeV
	 2K05aBx12VhhrUB+yN4P3P+8bovpQKXPmJTxaAuFrYjcHyhP39xJIoKFVy0gDkPlA+
	 RB+zYX8iC2yiw==
Date: Mon, 16 Nov 2026 12:45:09 +0100
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
Message-ID: <20261116114509.GA101185@francesco-nb>
References: <20261112150236.164850-1-francesco@dolcini.it>
 <20261112150236.164850-2-francesco@dolcini.it>
 <avXeK-IRXbKqI-pc@SMW015318>
 <20261113073135.GA8515@francesco-nb>
 <avc2nzql-JV7a-JH@SMW015318>
 <20261113171927.GA762258@francesco-nb>
 <aveChu8WqYM2JZcN@SMW015318>
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
In-Reply-To: <aveChu8WqYM2JZcN@SMW015318>

Hello Frank,


On Fri, Nov 13, 2026 at 03:35:02PM -0600, Frank Li wrote:
> On Fri, Nov 13, 2026 at 06:19:27PM +0100, Francesco Dolcini wrote:
> > On Fri, Nov 13, 2026 at 10:11:11AM -0600, Frank Li wrote:
> > > On Fri, Nov 13, 2026 at 08:31:35AM +0100, Francesco Dolcini wrote:
> > > > Hello Frank,
> > > >
> > > > On Thu, Nov 12, 2026 at 09:41:31AM -0600, Frank Li wrote:
> > > > > On Thu, Nov 12, 2026 at 04:02:23PM +0100, Francesco Dolcini wrote:
> > > > > > From: Francesco Dolcini <francesco.dolcini@toradex.com>
> > > > > >
> > > > > > The Verdin family pinout defines the SoM interfaces and their
> > > > > > numbering, SPI_1 being the SPI bus available to the carrier board,
> > > > > > implemented by ecspi2 on Verdin iMX8MM.
> > > > > >
> > > > > > imx8mm.dtsi numbers ecspi2 as spi1, so the Linux bus number in sysfs
> > > > > > and the spidev name do not match the Verdin interface. Add a spi0
> > > > > > alias in the SoM dtsi and delete the inherited spi1, so ecspi2 is
> > > > > > bus 0, zero-based with SPI_1 being spi0, and carries a single alias.
> > > > > > ecspi3, internal to the SoM with the CAN controller and the TPM, keeps
> > > > > > the spi2 alias inherited from the SoC.
> > > > > >
> > > > > > Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
> > > > > > ---
> > > > > >  arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi | 2 ++
> > > > > >  1 file changed, 2 insertions(+)
> > > > > >
> > > > > > diff --git a/arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi
> > > > > > index 1ac9d000d415..0369803a4d46 100644
> > > > > > --- a/arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi
> > > > > > +++ b/arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi
> > > > > > @@ -16,6 +16,8 @@ chosen {
> > > > > >  	aliases {
> > > > > >  		rtc0 = &rtc_i2c;
> > > > > >  		rtc1 = &snvs_rtc;
> > > > > > +		spi0 = &ecspi2;
> > > > > > +		/delete-property/ spi1;
> > > > >
> > > > > Can you avoid delete property for new platform?
> > > >
> > > > Unfortunately this is needed.
> > > >
> > > > The included imx8mm.dtsi has
> > > >
> > > >   spi1 = &ecspi2;
> > >
> > > Create patch move aliase to each boards' dts from imx8mm.dtsi, which is
> > > board feature, not soc features.
> >
> > Please see the linked thread [0][1]. It's not a viable option.
> 
> where [0] and [1]

Please see my previous email, 

https://lore.kernel.org/all/20261113073135.GA8515@francesco-nb/

in which I tried to explain the issue.


> > In addition, I can do this for my boards (Toradex), how do I know what I
> > have to move for boards I do not know? I can't do that. The only way
> > would be to duplicate the whole aliases on *every* board.
> 
> at imx9, already move aliase to each boards, dupicate it and just make
> sure build finial results the same.
> 
> i.mx8 is still not too old yet.

Do you want me to duplicate the whole aliases block on every board? I
cannot do anything better then just duplicating everything, given I do
not know what aliases make sense for each board. I can do better for my
boards (Toradex), but for the others I can't.

And this will likely break out-of-tree users (and to be clear, I think
that out-of-tree users of Linux DT files is a fact, see U-Boot, barebox,
... and more), as I discussed in the previously linked discussion.

To me this is not the correct thing to do, it will work for my boards,
but I do not think this is the right decision for the whole i.MX
ecosystem.

And it's not about being old or not, it's about not introducing
regressions and caring about the users.

Francesco

