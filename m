Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D48D137F8AF
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 13:30:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787923829; cv=none; b=BahC5Zx06yXEfoSz/Phww0c+Lip5POImfeVtbl9TZQyjGaY5gB0gkJAhejmBeoOV9nnfhW7DmeIG89ok1pDcb/fAxdEypjUBMCTsuhhoyEBHp2ELWrgHgg2oCTJaNJmEwruwNmaDl97aHQa3+2lMySOnFXsoB2mAT3dyksxneHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787923829; c=relaxed/simple;
	bh=NKvw/j/knwCVQoC4tWErsidaxGtLfFIo86OsbEZWMtI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=kwl5kvyt0lDgcgeoM2LkM+IUiGiGL9G3eJKYaTD0ugf/4hv13eOSLV8ofWR+AVRVd4o2dsl9PNA5mpQUCCe9GiEVQ/5NRpM8QTkVtwFMwVghHsinH/i2f4kGOw/E/diNPCOY5l17D+7CjCYITd4TVXBQksx1pbKYa/SrbvNEImg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=f7fzXX77; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="f7fzXX77"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 45D171A189F;
	Fri, 28 Aug 2026 13:30:26 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 19F6E60537;
	Fri, 28 Aug 2026 13:30:26 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9B49D11C7815E;
	Fri, 28 Aug 2026 15:30:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1787923821; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=9DmhBzyPBem9bpHPsGsJOXYnQ8sxc5roWwk4g4y8cvk=;
	b=f7fzXX77YZ9eApF8kP4Lo54SQw2aEk3QibiwCTClNeqZrTbjL9ttqSk0bc+6KSS/aGTYWH
	Ncb7GxBUrDnajmr9U2ErFRloH5c29tT6iz+3qlIh0iq34M/cf4ir0uHZ9XVJmQLcHSkBl6
	cKTacAOkY0TMP7qSKKcdeOKRWFq1N8Q6dBu6xUMn6tZEmlRLSHtk12p1SpMXgMzc6mcaCI
	DXr3sHH1905CT4I8fy5iir3DueWrUh0dl/hvmcnD8tKdCj9wr3i0fcl/1/elDrFTn1bRiI
	/HDZUBJuhFILUgRDzOSWqgazrWNM5T/7VYvpM+OLJukfOaEQ3+lgub9bmy2Txg==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
To: Rosen Penev <rosenp@gmail.com>, devicetree@vger.kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth
 <sebastian.hesselbarth@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Dennis Gilmore <dennis@ausil.us>, "moderated
 list:ARM/Marvell Kirkwood and Armada 370, 375, 38x,..."
 <linux-arm-kernel@lists.infradead.org>, open list
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] ARM: dts: armada-388-helios4: fix vmmc property name
In-Reply-To: <20260824000521.80492-1-rosenp@gmail.com>
References: <20260824000521.80492-1-rosenp@gmail.com>
Date: Fri, 28 Aug 2026 15:30:19 +0200
Message-ID: <87mru6pe38.fsf@BLaptop.bootlin.com>
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

> The sdhci@d8000 node references the 3.3V regulator through a bare
> "vmmc" property, which is not part of the mmc controller DT
> binding. The binding requires supply properties in the form
> "vmmc-supply", so the current entry is ignored by the driver.
>
> Rename the property to "vmmc-supply" so the fixed regulator is
> correctly wired up as the card power supply.
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
> index 0b23d4da8276..092290da1f4a 100644
> --- a/arch/arm/boot/dts/marvell/armada-388-helios4.dts
> +++ b/arch/arm/boot/dts/marvell/armada-388-helios4.dts
> @@ -304,7 +304,7 @@ mmc@d8000 {
>  					     &helios_sdhci_cd_pins>;
>  				pinctrl-names =3D "default";
>  				status =3D "okay";
> -				vmmc =3D <&reg_3p3v>;
> +				vmmc-supply =3D <&reg_3p3v>;
>  				wp-inverted;
>  			};
>=20=20
> --=20
> 2.55.0
>

--=20
Gr=C3=A9gory CLEMENT, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
