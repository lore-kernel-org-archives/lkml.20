Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.194.8.81
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792607839;
	b=bsPsbW4ahwhHkzdFNU7OqfRkUfyinypfjzb7eBSFnXKHG/5jTY/PnBhaSWnWhd3X+ffY
	 f1dlflFzzg4bz+zd+hiZv2MnQDRFA41lO0Hn5fQRwBu6qOSPaqeqin3opp2vYOm9NEcpf
	 anpn31C1VbJrccrsyJNY1n1F1eHt8asOg1YGzX8cWzmCinyFLfBG7t0FyALV75H0vBLYY
	 2Vp6jChw7xLtxQiudEKFwvcat4BxOhF0uKW5PfsjOrMe1Q27zpzqPw7Q562ZDcu4/qyYd
	 dQPebOvX6qwj1um84MnhX/7uvzK/jA2c1XFlglSFxTHz03uG3g3CnGWTVbFbcz1rKVg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792607839;
	h=DMARC-Filter:Received:DKIM-Signature:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=vZoLJuTtQKLg7le3DcIFYtP5fGVhQZQLGkovX+brljM=;
	b=NdiOQkLeeOG4nQFC5Vv2YudClD1L4G8ZKkkCyXJiW0HiYW1NrwT4LrwOxFJ29S/SYzYo
	 042hZsolKo4BgQLUTnRaucw4a79l4pElthb2rBt+2ug/y9x24IK4G1Y7yZClaDAwJpobe
	 SFevWXafXiNG2i3+Q0Fg7NIvq+QwaW5xpikD7c5PU/+4/81COepvwZB+7GfluzU3e0ZFJ
	 0bGA0IKwesp+jGn6utLVN6IAeItCWK9DkdrCpRMdMkPEJsxDj/lvaTkXooA4prV10Y0CX
	 qv40Xa0+DIpUsNYm2KPfXSWR2MmQ4LRS5P/qsTvZ6veHKkCOjs0exImujGkPYOW5YAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=dolcini.it;
	spf=pass smtp.mailfrom=dolcini.it;
	arc=none smtp.remote-ip=217.194.8.81
Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C4B6606A31F;
	Wed, 21 Oct 2026 18:37:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2C4B6606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Received: from francesco-nb (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 53DB71F8D1;
	Wed, 21 Oct 2026 20:37:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1792607828;
	bh=vZoLJuTtQKLg7le3DcIFYtP5fGVhQZQLGkovX+brljM=; h=From:To:Subject;
	b=geMMPvYngn0H4t28uKQQEecN1/bxf/dEtIJlow+C9lQm8GCeyim4/IfbzBP+hpQ89
	 noFQLdGDpaJmieI9uLkXIDit3R04DVO0Fm/2vp8hGaOvThka/Quph19vyqJwNc7rvi
	 dTV6h2n5uercGurux+uTywbRlkWjg6utsUQUdewxUtuKHni/7vVaUgQjYfO4o471uI
	 U+ihLq60RIGZk3Uix3woeN5D0kqGdTa5L5A3WofQCbRe90DF2Zfgc8q2LwZJpY5GMF
	 Jri72b7y0wZVJOWqPG6/Q4DtzbklPbMip9+mN+BUYUxXkX3iyVZLcr+OJN3ZYblZDq
	 Eb3doXU8uNgHg==
Date: Wed, 21 Oct 2026 20:37:04 +0200
From: Francesco Dolcini <francesco@dolcini.it>
To: Marek Vasut <marex@nabladev.com>
Cc: Christoph Niedermaier <cniedermaier@dh-electronics.com>,
	linux-arm-kernel@lists.infradead.org, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, kernel@dh-electronics.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] ARM: dts: imx6ull-dhcor-maveo-box: Remove unused SPI
 device
Message-ID: <20261021183704.GA1116319@francesco-nb>
References: <20261021134435.17350-1-cniedermaier@dh-electronics.com>
 <1073daf0-3676-4123-9ca4-c182ea5883a3@nabladev.com>
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
In-Reply-To: <1073daf0-3676-4123-9ca4-c182ea5883a3@nabladev.com>

On Wed, Oct 21, 2026 at 07:19:30PM +0200, Marek Vasut wrote:
> On 10/21/26 3:44 PM, Christoph Niedermaier wrote:
> > On the maveo box, the SPI pins are connected to connector X10,
> > but no device is connected. The device "dhcom-board" was used
> > only to test the hardware, but was not removed afterward. So
> > remove this device to accurately represent the current hardware
> > configuration here.
> > 
> > Fixes: 145e2732a5e9 ("ARM: dts: imx6ull-dhcor: Add Marantec maveo box")
> > Signed-off-by: Christoph Niedermaier <cniedermaier@dh-electronics.com>
> > ---
> > Cc: Rob Herring <robh@kernel.org>
> > Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> > Cc: Conor Dooley <conor+dt@kernel.org>
> > Cc: Frank Li <Frank.Li@nxp.com>
> > Cc: Sascha Hauer <s.hauer@pengutronix.de>
> > Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> > Cc: Fabio Estevam <festevam@gmail.com>
> > Cc: Marek Vasut <marex@nabladev.com>
> > Cc: devicetree@vger.kernel.org
> > Cc: imx@lists.linux.dev
> > Cc: kernel@dh-electronics.com
> > Cc: linux-kernel@vger.kernel.org
> > ---
> >   arch/arm/boot/dts/nxp/imx/imx6ull-dhcor-maveo-box.dts | 8 --------
> >   1 file changed, 8 deletions(-)
> > 
> > diff --git a/arch/arm/boot/dts/nxp/imx/imx6ull-dhcor-maveo-box.dts b/arch/arm/boot/dts/nxp/imx/imx6ull-dhcor-maveo-box.dts
> > index 047f7b2d8526..eb0b91040110 100644
> > --- a/arch/arm/boot/dts/nxp/imx/imx6ull-dhcor-maveo-box.dts
> > +++ b/arch/arm/boot/dts/nxp/imx/imx6ull-dhcor-maveo-box.dts
> > @@ -60,14 +60,6 @@ &ecspi4 {
> >   	pinctrl-0 = <&pinctrl_ecspi4>;
> >   	pinctrl-names = "default";
> >   	status = "okay";
> 
> Drop "status = "okay"" too , since this controller will be unused ?

you can instantiate a new device on the SPI bus from userspace. up to
you, but if I was a user I would appreciate to have it enabled.

Francesco

