Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82DC040BCCE;
	Fri, 28 Aug 2026 10:39:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787913563; cv=none; b=I40cnmxZc5B8JWv/8voE3hhvsAQrQWdzuSuwb/wZVMKT9M6RNEvZbhpHpt9AN4IQMCZGem3UWSILf/sctqoGJCUu5SCOwI+yjH0yewfECYf6EXQHHdp2IC0tWwLkI2BI9IsNuY/m4LxFMBDuCtZGQuj/XTYQ66IfA8/PjR8wzRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787913563; c=relaxed/simple;
	bh=NfdhfGvGLm/dGrYNmJ1Mc6eq5h6PrP/QAH8vuM9KfQ4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=CjfqrOFCjbk6X8PxleY7NkOef+Q2dmQzkDH/iOC9uAjL+7s/epwqLj8e2ZiSnz8qksPmV4BSX09uFrjb/g16XE0FuQKMbLfUs+b7GCWdGvTd/NKZzHma7S6AzwxMDw8garz0oVs4Qi9misuVRomUYkaLFyv9SFDi5BJFubQBnNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=DC+qhltk; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="DC+qhltk"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id BAD3A1A1859;
	Fri, 28 Aug 2026 10:39:18 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8DE0C60537;
	Fri, 28 Aug 2026 10:39:18 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id DB34611C780D1;
	Fri, 28 Aug 2026 12:39:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1787913554; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=bUskfXTEiw1h5B2Q/KY6GP2s7WW7diEyJBqLFIH/p34=;
	b=DC+qhltk9aAeKdzX23ilz5nmwsxXUY0ErPvt+YlvHG6YxXv2stvXP0/ap6pakFWQRkGYsW
	AHe50TWugEUMk9DU4jqsTBi7GLBvJQn+F6nwJahk5AZtbfEQe26ZwjDJXbF+UVin6vL4rr
	dq5oQLITVMaTaO7nmimZkECXQyfImmrpXKL4kSW7ZYkTZ8X7spK0r0d17TCiHXAAEaJ7QQ
	TRosgmWq6zoSTb5imLBsmRNAwAuJ03/4vSzrq8+txulkIvoUfb4MwGMIZMenyKIPCKqGEJ
	iLIyJQORT2Ka/dviqDlGCVP2l5srhwKO8drNnbVHmiGvU3xlSbiGMMmDESmCaw==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
To: Rosen Penev <rosenp@gmail.com>, devicetree@vger.kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth
 <sebastian.hesselbarth@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Baruch Siach <baruch@tkos.co.il>, "moderated
 list:ARM/Marvell Kirkwood and Armada 370, 375, 38x,..."
 <linux-arm-kernel@lists.infradead.org>, open list
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] ARM: dts: armada-385-clearfog-gtr: fix vmmc property name
In-Reply-To: <20260823234535.72052-1-rosenp@gmail.com>
References: <20260823234535.72052-1-rosenp@gmail.com>
Date: Fri, 28 Aug 2026 12:39:11 +0200
Message-ID: <871pbir0kw.fsf@BLaptop.bootlin.com>
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

> The SDHCI node references the 3.3V regulator through a bare "vmmc"
> property, which is not part of the mmc controller DT binding; the
> correct property is "vmmc-supply".
>
> Fixes: aecc313490ae ("ARM: dts: mvebu: add support for SolidRun Clearfog =
GTR")
> Assisted-by: opencode:big-pickle
> Signed-off-by: Rosen Penev <rosenp@gmail.com>

Applied on mvebu/dt

Thanks,

Gregory

> ---
>  arch/arm/boot/dts/marvell/armada-385-clearfog-gtr.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm/boot/dts/marvell/armada-385-clearfog-gtr.dtsi b/arc=
h/arm/boot/dts/marvell/armada-385-clearfog-gtr.dtsi
> index 48b09df53c60..3262b726a1c7 100644
> --- a/arch/arm/boot/dts/marvell/armada-385-clearfog-gtr.dtsi
> +++ b/arch/arm/boot/dts/marvell/armada-385-clearfog-gtr.dtsi
> @@ -235,7 +235,7 @@ mmc@d8000 {
>  				pinctrl-0 =3D <&cf_gtr_sdhci_pins>;
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
