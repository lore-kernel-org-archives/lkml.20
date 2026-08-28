Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A1894028D9;
	Fri, 28 Aug 2026 10:37:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787913471; cv=none; b=bKXgXLNQ7X0J2VudiLx8X//j50Gf45Y1CP359Ta/60Rt4beKr4AP+D2bQSQQprMBBtjF0QmS19MJw6TzaShYsE+OXW2p3UonAa6DsOTocabsDeg4zrgEgK3+JSl8gow/6bpelj+Pqe6C3ojp3mYET1Np1OjKTYb6BIcAh7tQCVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787913471; c=relaxed/simple;
	bh=ltHu4o9DSVYfGXew/KMlXMSYuPXlOVlGQ14eXPGQjvI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=IkeGOb94Y6qfMzMhz2AB6jP951/gCvvmhPHIpM9y+ffka6C/peS1Rq3oe35cdcKutfVMCJv/lf/SDlx/VTM++k4TcnSB7zVcJv+su5Ep3HUrx4srvPSPimaTMq+udXvp1M3EihIukJDZIgLKZXUBpkkt9qfkDMrc4ajCInn1n6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=oEkOva8L; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="oEkOva8L"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 993B74E413FF;
	Fri, 28 Aug 2026 10:37:45 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 644DC60537;
	Fri, 28 Aug 2026 10:37:45 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6EAA511C780D1;
	Fri, 28 Aug 2026 12:37:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1787913460; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=hDHLfZf5tPMsJrYh28B2Mi+dPjwBy0qVlHBF2yzTOCY=;
	b=oEkOva8LUzRsQh1c7/WvesEuyA2G/MnbQsh4POw8tskYduXCWBjbLn4LzabrvepbnqV7in
	4gNIOMT/4p17vvGlxrG2Qkcahk5yNn5b1ZCPBFPJ5/+2m6itctqP5ugsqoVZ/GLJqdR2sQ
	msGhkql1l8s8KPQ4QuTTbscPjwhCrm6Vg9n3mRixAJXSAO+FwLsa2rRIcKjARiaA/pkSOW
	lNMR/1Qiy5Xhsakxh+YSTYGEPYu0KbqjQtK0T9AmcsAATTt+sgXQyscJBlmACJChqWPq+l
	QMGdlSWB16VU989mMsARUnBT590MTOlB6DO26qrDV6QsQ0kWCdgp5FlchbRAjg==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
To: Rosen Penev <rosenp@gmail.com>, devicetree@vger.kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth
 <sebastian.hesselbarth@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Dennis Gilmore <dennis@ausil.us>, "moderated
 list:ARM/Marvell Kirkwood and Armada 370, 375, 38x,..."
 <linux-arm-kernel@lists.infradead.org>, open list
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] ARM: dts: helios4: fix lm75 supply name
In-Reply-To: <20260823234326.71111-1-rosenp@gmail.com>
References: <20260823234326.71111-1-rosenp@gmail.com>
Date: Fri, 28 Aug 2026 12:37:36 +0200
Message-ID: <874iger0nj.fsf@BLaptop.bootlin.com>
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

> The lm75 driver requests a regulator named "vs" (the +VS power pin
> of the chip).  The Helios4 DTS incorrectly used vcc-supply instead
> of vs-supply, causing the regulator core to emit:
>
>   lm75 0-004c: supply vs not found, using dummy regulator
>
> Fix the property name to match the binding and the driver.


Applied on mvebu/dt

Thanks,

Gregory

>
> Fixes: ced8025b569e ("ARM: dts: armada388-helios4")
> Assisted-by: opencode:big-pickle
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>  arch/arm/boot/dts/marvell/armada-388-helios4.dts | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm/boot/dts/marvell/armada-388-helios4.dts b/arch/arm/=
boot/dts/marvell/armada-388-helios4.dts
> index 626a7339a5d0..af96d27e7159 100644
> --- a/arch/arm/boot/dts/marvell/armada-388-helios4.dts
> +++ b/arch/arm/boot/dts/marvell/armada-388-helios4.dts
> @@ -200,7 +200,7 @@ usb3-ilimit-hog {
>  				temp_sensor: temp@4c {
>  					compatible =3D "ti,lm75";
>  					reg =3D <0x4c>;
> -					vcc-supply =3D <&reg_3p3v>;
> +					vs-supply =3D <&reg_3p3v>;
>  				};
>=20=20
>  				eeprom@53 {
> --=20
> 2.55.0
>

--=20
Gr=C3=A9gory CLEMENT, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
