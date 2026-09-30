Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2ACF3E0C4C
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 06:35:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790750131; cv=none; b=p8EHNe5VFz/q4x9F09zZO3LywDzdrOVYHyNR014fI4x3b77RG38GW0s9BXMF6jUXiciU+/N6x3YtmXV8SFIPSV/P6nZ20QX4Tie1p9zbCeKqvd70ZirJfeNRNU0nzUDDNj+sazkdywqz0PvAQCQgxAmOx2OXSJbHhRB/RjDGw7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790750131; c=relaxed/simple;
	bh=yn50OV6Wn0IT80wyTb61x3WU5rc8p6JlDLW4leNVHuY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=rlP7lNIYgLPX3JgNgu4EcJuIWm+QwlY60KBvnwekQVvvccNNH8pxII3XET9qM5ZHF9JEkFGxhiY+8X0w2XZ3sl/otVd80H0C3TtJb6DZy7s/igFebmQAxlS9SOc7LAq0KKwyYfb+hrFAE6xpdzRKjnE0BbCCpDav6A/y5fZeZco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=0AC3zil6; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="0AC3zil6"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 21BE64E410D2;
	Wed, 30 Sep 2026 06:35:24 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id EAA6B60749;
	Wed, 30 Sep 2026 06:35:23 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3520A103297F7;
	Wed, 30 Sep 2026 08:35:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790750123; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=vYGXsQAb2CSsGFfXHxA+1+PGfASQDHqZzJGFLVn2lCY=;
	b=0AC3zil6hrxy9fwTlBlblTWbA2nfDWy5d6a03+jUcpqXKHqyvTz30Ep+k6QPSBdLyxGNvD
	iHotmlJQ1jMQLPAkO0CdANJ73jwW/8i5+Atwg7FKvTLCEZ+XdPyfigq4iDL7PWMxkZJMon
	KD3hGyQnGFMZpKCRhQBpC0gQgi1u5OkeWBfPXYOAxB+LGTUIuadFclCL8mw2s87j6eTEvQ
	X6F9kiCpcPSGPY2eLdiRv3AjmnnSFFxrCanVPS8PbsTABgCe7nvPvEM38oKfRLnw5itC95
	/sXbuFVK+1yCinycoeBBc5YxE5C5ghPpjkVxdCLzSTooyZg3vfa/J0dRf3Lgbw==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
To: Rosen Penev <rosenp@gmail.com>, devicetree@vger.kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth
 <sebastian.hesselbarth@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, "moderated list:ARM/Marvell Kirkwood and Armada
 370, 375, 38x,..." <linux-arm-kernel@lists.infradead.org>, open list
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] ARM: dts: helios4: add #phy-cells to USB nop phys
In-Reply-To: <20260831233626.13947-1-rosenp@gmail.com>
References: <20260831233626.13947-1-rosenp@gmail.com>
Date: Wed, 30 Sep 2026 08:35:20 +0200
Message-ID: <87fqyr8cwn.fsf@BLaptop.bootlin.com>
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

> The usb-nop-xceiv binding requires a #phy-cells property; without it
> dtbs_check reports:
>
>   usb2-phy: '#phy-cells' is a required property (usb-nop-xceiv)
>   usb3-phy: '#phy-cells' is a required property (usb-nop-xceiv)
>
> Add #phy-cells =3D <0> to both nodes. No functional change.
>
> Assisted-by: opencode:big-pickle
> Signed-off-by: Rosen Penev <rosenp@gmail.com>

Applied on mvebu/dt

Thanks,

Gregory
> ---
>  arch/arm/boot/dts/marvell/armada-388-helios4.dts | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/arch/arm/boot/dts/marvell/armada-388-helios4.dts b/arch/arm/=
boot/dts/marvell/armada-388-helios4.dts
> index e63b8b5e632d..548fb92ca811 100644
> --- a/arch/arm/boot/dts/marvell/armada-388-helios4.dts
> +++ b/arch/arm/boot/dts/marvell/armada-388-helios4.dts
> @@ -141,10 +141,12 @@ fan2: j17-pwm {
>  	usb2_phy: usb2-phy {
>  		compatible =3D "usb-nop-xceiv";
>  		vbus-supply =3D <&reg_5p0v_usb>;
> +		#phy-cells =3D <0>;
>  	};
>=20=20
>  	usb3_phy: usb3-phy {
>  		compatible =3D "usb-nop-xceiv";
> +		#phy-cells =3D <0>;
>  	};
>=20=20
>  	soc {
> --=20
> 2.55.0
>

--=20
Gr=C3=A9gory CLEMENT, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
