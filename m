Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 516823E4C6B;
	Mon, 31 Aug 2026 09:59:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788170360; cv=none; b=J+VVrowAGlqlrmL9RT/2JY4dV0a4fr7M9ldcMHPoEbNhJ0IKsXUN7gVWqVkBcb5NdteokzdyfZdH4bS5Hq1APoJLqa7qzinxnoHdz5Gf6pFh+cger7q3BNNoAPW56DGT5aPOA0zlBJhDUmrgaQ4MOGYEeccD4cHCZbqTUYLx3Ng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788170360; c=relaxed/simple;
	bh=XYkGGrdTKDQPL1UYLC6WFxA8Qxe8sS/GKMrch3FeJUA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=tWSw9gC4x939hNScHcAJ8/rO1s/2t6+iAZwaT7BjPwh0bVXm8TT7jEQFt0DOi1ou/Jw8AUqc2+4vFCbh7tfUdgVDKRqmbtqlPoZXQzPBJ2uxw/aNDHd59hve8dRCS7Mo6AP7jG78Uw+bWm2wGooQRXc9/zJAkQuW6jvNYEWUt7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=jOUGKThJ; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="jOUGKThJ"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 52FAF1A18EF;
	Mon, 31 Aug 2026 09:59:14 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 24BAE60231;
	Mon, 31 Aug 2026 09:59:14 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 72D3B11C78ACF;
	Mon, 31 Aug 2026 11:59:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788170353; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=lSAVklH3/DZC+dEEajSN7smRFSqHoX6/7i0eooVPPZ0=;
	b=jOUGKThJq/zryo31e7uyzVfE+Olxc7XCn+ReLMQZYc/gfXZQR2ifcEGH+p0DuyKoZ6ipVs
	mkcV/gZPWCZ22nBBj3USFou+i0mddLS/efvyFjyFMuwpq3xAQ6BghHJR3oHAQu1daSiTXS
	RPEsGEp7M0U1xAZ2ZVfa6rnMlwrhsJVvxVWY5NKkiPN4BylixeZPNtMLxKhAXijXMb7UO7
	hlJ27mS/YbNX1Uvkda2UndZnW117miGI3OqhhCS4aJ3pdZI8wRktz26cmP7jlG8uj8+xIT
	kBEEIC5uig0iVfoPBeL6pa13TuL1kqrwyPxXmFjo2whARdDOPsJV8nMO2r81Wg==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
To: Rosen Penev <rosenp@gmail.com>, devicetree@vger.kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth
 <sebastian.hesselbarth@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Dennis Gilmore <dennis@ausil.us>, "moderated
 list:ARM/Marvell Kirkwood and Armada 370, 375, 38x,..."
 <linux-arm-kernel@lists.infradead.org>, open list
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] ARM: dts: helios4: fix vbus-supply for USB2 PHY
In-Reply-To: <20260829021103.332384-1-rosenp@gmail.com>
References: <20260829021103.332384-1-rosenp@gmail.com>
Date: Mon, 31 Aug 2026 11:59:10 +0200
Message-ID: <87bjaipq4x.fsf@BLaptop.bootlin.com>
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

> The usb-nop-xceiv binding and driver use "vbus-supply"; the driver
> acquires the VBUS regulator via devm_regulator_get_exclusive("vbus")
> (phy-generic.c). The stale "vbus-regulator" name is never read by
> the driver and dtbs_check rejects it as an unknown property. Rename
> the property so reg_5p0v_usb is honored.
>
> Fixes: ced8025b569e ("ARM: dts: armada388-helios4")
> Assisted-by: opencode:big-pickle
> Signed-off-by: Rosen Penev <rosenp@gmail.com>

Applied on mvebu/dt

Thanks,

Gregory
> ---
>  arch/arm/boot/dts/marvell/armada-388-helios4.dts | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm/boot/dts/marvell/armada-388-helios4.dts b/arch/arm/=
boot/dts/marvell/armada-388-helios4.dts
> index b8576ca0de1c..9de9a8a4267c 100644
> --- a/arch/arm/boot/dts/marvell/armada-388-helios4.dts
> +++ b/arch/arm/boot/dts/marvell/armada-388-helios4.dts
> @@ -140,7 +140,7 @@ fan2: j17-pwm {
>=20=20
>  	usb2_phy: usb2-phy {
>  		compatible =3D "usb-nop-xceiv";
> -		vbus-regulator =3D <&reg_5p0v_usb>;
> +		vbus-supply =3D <&reg_5p0v_usb>;
>  	};
>=20=20
>  	usb3_phy: usb3-phy {
> --=20
> 2.55.0
>

--=20
Gr=C3=A9gory CLEMENT, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
