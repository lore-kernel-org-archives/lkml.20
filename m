Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57A92440641
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 13:29:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787923783; cv=none; b=JI2mz94EEcFGuncEoa4JZt3H2DTcI5Pe/vDMzsTp4HyUDR+1ER/XtOkfJdzESN6lb0XsF+6GOmYi1t/6hkMPk9VqgSShRUSGzhXxr6tAMSbfcH81mP+EtS4M60bSS2dszGHyrn0C3P2Z2k6QprWsP2ofR8uosQimrcT2U+gZeZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787923783; c=relaxed/simple;
	bh=LS7jRZhUcgWEwfOVqiPE3UEq1qbtqgYpMdp+FQz4tG4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=behXaH3FsFcyiVXj8UIt65Wwb0on/qKF17Uq3LyWO8/5jOZipGkiNGrERy+z0qzQ/VkgnwonoCd3VNi2T1ozTK3ogxONyZFSPPjByaplQFaj51de6ph9UZIwTjdnRPJyXbvQwpnIMX3Zf71SpJOQEE1zsCGLj4jx3XkrFj/SUiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=iUn2+/nU; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="iUn2+/nU"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 61A724E413FF;
	Fri, 28 Aug 2026 13:29:39 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3562A60537;
	Fri, 28 Aug 2026 13:29:39 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B338511C7815E;
	Fri, 28 Aug 2026 15:29:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1787923774; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=AJP+7s3TYS3fSnF/ipyLW6m0of0pPBM8FR64yTjJBGk=;
	b=iUn2+/nU8wGnG0Y6DQH9r0UTUumsjQEeVCFOslnGK7quLEbhyKKPKiz9VK4V3plMoxYwTN
	sWuycXZrkz7wG8Vw5sxUg4Sy1VxJdfrqCrRhY0tsqGbjHnKYXtv5hlVPcdl3LnkK6qURMl
	/SY5PDhY+6YI3aNLtN/sQ2PUTLpZJMZ0CSkVSeSlzN4HXg0gBySCucZaYMAr759eyspLGs
	SfSbjinimTjkXxslNzfbVU+P/PrHUQPwNajRXhaBS7gxlVin1j+jp85jS+3nszzBoXzkGl
	B1PoPcCInTXs/bz2xoEyrUxzmcqpYGUeDPiA+HN1AiUzBIRJwOaWNW+fuyHr7w==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
To: Rosen Penev <rosenp@gmail.com>, devicetree@vger.kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth
 <sebastian.hesselbarth@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Grzegorz Jaszczyk <jaz@semihalf.com>, "moderated
 list:ARM/Marvell Kirkwood and Armada 370, 375, 38x,..."
 <linux-arm-kernel@lists.infradead.org>, open list
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] ARM: dts: armada-395-gp: drop unsupported SDHCI
 clock-frequency
In-Reply-To: <20260824000356.79844-1-rosenp@gmail.com>
References: <20260824000356.79844-1-rosenp@gmail.com>
Date: Fri, 28 Aug 2026 15:29:32 +0200
Message-ID: <87pkz2pe4j.fsf@BLaptop.bootlin.com>
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

> The SDHCI node carries a "clock-frequency" property, but the
> marvell,armada-380-sdhci binding does not define it and dtbs_check
> rejects the node as a result. No driver consumes it either: only a
> few other sdhci-pltfm based drivers (imx, mcf, iproc, arasan,
> dwcmshc, xenon) read that property, while sdhci-pxav3 derives the
> maximum clock from the io clock rate.
>
> Remove the property.
>
> Fixes: 356645123581 ("ARM: dts: mvebu: armada-395-gp: add support for the=
 Armada 395 GP Board")
> Assisted-by: opencode:big-pickle
> Signed-off-by: Rosen Penev <rosenp@gmail.com>

Applied on mvebu/dt

Thanks,

Gregory
> ---
>  arch/arm/boot/dts/marvell/armada-395-gp.dts | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/arch/arm/boot/dts/marvell/armada-395-gp.dts b/arch/arm/boot/=
dts/marvell/armada-395-gp.dts
> index b854b73a64b4..fafa204387fd 100644
> --- a/arch/arm/boot/dts/marvell/armada-395-gp.dts
> +++ b/arch/arm/boot/dts/marvell/armada-395-gp.dts
> @@ -59,7 +59,6 @@ sata@a8000 {
>=20=20
>  			/* CON18 */
>  			mmc@d8000 {
> -				clock-frequency =3D <200000000>;
>  				broken-cd;
>  				wp-inverted;
>  				bus-width =3D <8>;
> --=20
> 2.55.0
>

--=20
Gr=C3=A9gory CLEMENT, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
