Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA2CD36A37A;
	Wed, 30 Sep 2026 06:49:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790750964; cv=none; b=kPxI1GsoHDbnU9XFsCP08jJGlyyXeyg30VkfV17Ox/j3hj0wF9RI3KQNWpDHv+k6DTTmi1Ti3MAl3vI1rADZBnijMzovqMJ7AxjxjcymlxuKDfdMIpvuqavfqHFdSchfLjZRk5tB1s+cw3kzGl6TptLuCT77MI4ezip85lO/MHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790750964; c=relaxed/simple;
	bh=zXfLQ8r33JuSAdMR0vQDhPOA+ZxR4meiXYLQthTdErw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=UrSF9q+vKdOcKmfww7stAB7jW4h8rDVH0P2RzJOuOIdPX1obyMU9dROeM1xCFtP2qzuGKd10p1t+KkTn6NAuxqojzsrug612rE0piiMnsNWIYhawuyhzdVfF/POKZ/XDtJBib2eBY411wflHMK2zQK8iKUv7ZylVM/TgEGXXF50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=GURO+yMM; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="GURO+yMM"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id C65AB1A1078;
	Wed, 30 Sep 2026 06:49:14 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 93E6A60749;
	Wed, 30 Sep 2026 06:49:14 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 71176103295D5;
	Wed, 30 Sep 2026 08:49:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790750953; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Jv49F2PUt5yh/jWsy0Oc4tt54+a1s+q3HYskLUQDwiE=;
	b=GURO+yMMIfSa5LwCdzuwM2Fy1yxfvWXa3oihCCLl2WeczkqmQC9VhCpae5duc1fEPxBYYu
	4y21VXIrV3oN5jeHXaOhmFBEnmqtKniaLYyhev2h/dhtIqk0YIQ074eafqxhxTJJjv2BL8
	fCSqROd8H2c3c4sJDsvmPCMe5tGV0Rtv3Bvc0HAGib8OEj5WSvaoDYGsavoQt+QgFcwT7I
	6G+40NTLKOrOpSA+fEV+4u69xoKXogDnu9vksnIQw5VtnYAv6Hvm/58fZY6Uey1zoJR5oi
	GWliNkwL83f4wCLaG21Q1TeanF+ntIROp0zyq5t3cMf8yMZgOw0Iz44sfWIyQQ==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
To: Rosen Penev <rosenp@gmail.com>, devicetree@vger.kernel.org
Cc: Russell King <linux@armlinux.org.uk>, Andrew Lunn <andrew@lunn.ch>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, "moderated list:ARM/Marvell Kirkwood and Armada
 370, 375, 38x,..." <linux-arm-kernel@lists.infradead.org>, open list
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCHv2] ARM: dts: marvell: armada-388: use onnn,pca9655
 compatible
In-Reply-To: <20260908060438.43338-1-rosenp@gmail.com>
References: <20260908060438.43338-1-rosenp@gmail.com>
Date: Wed, 30 Sep 2026 08:49:10 +0200
Message-ID: <87a4oz8c9l.fsf@BLaptop.bootlin.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3

Rosen Penev <rosenp@gmail.com> writes:

> The PCA9655s on the ClearFog and Helios4 boards are
> register-compatible with the pca9555, and the gpio-pca953x driver has
> matched "onnn,pca9655" in its OF match table since
> commit 6d49b3a0f351 ("gpio: pca953x: Add support for the On Semi
> pca9655").  OF matching is tried before the legacy I2C ID-table
> matching that the old comment alluded to, so the restriction no longer
> applies.  List the real part and drop the stale comment.
>
> The I2C client is now named "pca9655" instead of "pca9555", but the
> expander is otherwise identical.
>
> Assisted-by: opencode:big-pickle
> Signed-off-by: Rosen Penev <rosenp@gmail.com>

Applied on mvebu/dt

Thanks,

Gregory
> ---
>  v2: rebase.
>  arch/arm/boot/dts/marvell/armada-388-clearfog.dtsi | 7 +------
>  arch/arm/boot/dts/marvell/armada-388-helios4.dts   | 9 +--------
>  2 files changed, 2 insertions(+), 14 deletions(-)
>
> diff --git a/arch/arm/boot/dts/marvell/armada-388-clearfog.dtsi b/arch/ar=
m/boot/dts/marvell/armada-388-clearfog.dtsi
> index f8a06ae4a3c9..4a61e9d1a2c0 100644
> --- a/arch/arm/boot/dts/marvell/armada-388-clearfog.dtsi
> +++ b/arch/arm/boot/dts/marvell/armada-388-clearfog.dtsi
> @@ -131,12 +131,7 @@ &i2c0 {
>  	 * 15-SFP_MOD_DEF0
>  	 */
>  	expander0: gpio-expander@20 {
> -		/*
> -		 * This is how it should be:
> -		 * compatible =3D "onnn,pca9655", "nxp,pca9555";
> -		 * but you can't do this because of the way I2C works.
> -		 */
> -		compatible =3D "nxp,pca9555";
> +		compatible =3D "onnn,pca9655";
>  		gpio-controller;
>  		#gpio-cells =3D <2>;
>  		reg =3D <0x20>;
> diff --git a/arch/arm/boot/dts/marvell/armada-388-helios4.dts b/arch/arm/=
boot/dts/marvell/armada-388-helios4.dts
> index 39b2d4fa742c..bf6d70e2078b 100644
> --- a/arch/arm/boot/dts/marvell/armada-388-helios4.dts
> +++ b/arch/arm/boot/dts/marvell/armada-388-helios4.dts
> @@ -160,14 +160,7 @@ i2c@11000 {
>  				 *  6-USB3 power
>  				 */
>  				expander0: gpio-expander@20 {
> -					/*
> -					 * This is how it should be:
> -					 * compatible =3D "onnn,pca9655",
> -					 *	 "nxp,pca9555";
> -					 * but you can't do this because of
> -					 * the way I2C works.
> -					 */
> -					compatible =3D "nxp,pca9555";
> +					compatible =3D "onnn,pca9655";
>  					gpio-controller;
>  					#gpio-cells =3D <2>;
>  					reg =3D <0x20>;
> --=20
> 2.55.0
>

--=20
Gr=C3=A9gory CLEMENT, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
