Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B07AF3E5A1C
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 10:00:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788170404; cv=none; b=arLvh8Lf9HCraH5YuvUmuzBWdQp+4N68chWpkckFzQzD77VFfqBWcRmd0zHPtqEmezR69nnMlZg0rF0kYqAd0bcAm7TYWLZbJY66cXkoQ7dCSobW0HCgy9sQGtwbR7tF2sJUUlUOiOeGEe/ynKUFmG1boWkB9UxUiDeJHwp4sLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788170404; c=relaxed/simple;
	bh=FQ1qqH3C8ELA/wSvZFbz8C1+Mjlf9D7qAmQgtunOEb8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=RiRqntqeKD9CjthVjPaq1nkmKiZZTqpQxOHcoaw0U3FbFVUNNpl2mgMHvgxJkbKZtBD6YJZoE5hmdPlI49Iq5pqzriBIb2vlHwPF+MQqTvE2ZslLR45K8ckxOvJMVvGroU+7nuVzHak513XpBFS4sK0vvs2ydzvNTCRjkmfA2Q4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=jGQPAlde; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="jGQPAlde"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id F037E1A18EF;
	Mon, 31 Aug 2026 10:00:00 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C0ABB60231;
	Mon, 31 Aug 2026 10:00:00 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5A36F11C78ACF;
	Mon, 31 Aug 2026 11:59:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788170395; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=9ow2ViMeEMGTyK3UySqQVG82oOIdDJas1XKKjGfqN5Q=;
	b=jGQPAldeFoEaMiTrr6qe/vl94pp7XVReJhbW0eSfVXlZb0ztjBLdtYzJobMxKETVidDkJT
	fNjlkriHOTCGwtmZu1CTS0/xaJKlU8v9k2+pmGnPpI3kbbbt8c+ZFva7VKd4RcwG2YXTRs
	U1B3XRuHu9s6KqW8KViqQ1BnD1a8k7VhNhRch9rd5ODKt1tKwEhGy3olfR8NNk53CFkwIW
	kxaOqa9LoUUcPjGx793DjaWw2mzHrXa6fgjA91sG9wA965N7RoRVFU0MAjUltL1zujbEVq
	wJL7yjlzX8UHYivLuU3KYakf8bjmnl/pC4UH00uO+ggA9fb3YDo1ghrKkwbRmA==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
To: Rosen Penev <rosenp@gmail.com>, devicetree@vger.kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth
 <sebastian.hesselbarth@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Dennis Gilmore <dennis@ausil.us>, "moderated
 list:ARM/Marvell Kirkwood and Armada 370, 375, 38x,..."
 <linux-arm-kernel@lists.infradead.org>, open list
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] ARM: dts: helios4: fix spi1 location
In-Reply-To: <20260829203720.44633-1-rosenp@gmail.com>
References: <20260829203720.44633-1-rosenp@gmail.com>
Date: Mon, 31 Aug 2026 11:59:53 +0200
Message-ID: <878q5mpq3q.fsf@BLaptop.bootlin.com>
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

> This spi node is specified in armada-38x.dtsi with proper compatible
> strings whereas they are not present here. Instead of copy and pasting
> various lines, just reference the node in the dtsi.
>
> This dts seems to predate the move of spi from internal-regs to the soc
> node so this moves it in line there.
>
> Allows proper probing of SPI at runtime.
>
> Remove the microsom_spi1_cs_pins pinctrl group and its reference in
> &spi1. The group only muxed mpp59 to the "spi1" function, but that
> pin (SPI1 cs0) is already covered by spi1_pins, which selects the
> same function for mpp56-59 in armada-38x.dtsi.
>
> Fixes: ced8025b569e ("ARM: dts: armada388-helios4")
> Signed-off-by: Rosen Penev <rosenp@gmail.com>

Applied on mvebu/dt

Thanks,

Gregory
> ---
>  .../arm/boot/dts/marvell/armada-388-helios4.dts | 17 ++++++-----------
>  1 file changed, 6 insertions(+), 11 deletions(-)
>
> diff --git a/arch/arm/boot/dts/marvell/armada-388-helios4.dts b/arch/arm/=
boot/dts/marvell/armada-388-helios4.dts
> index 9de9a8a4267c..ae03d42f92a0 100644
> --- a/arch/arm/boot/dts/marvell/armada-388-helios4.dts
> +++ b/arch/arm/boot/dts/marvell/armada-388-helios4.dts
> @@ -254,13 +254,6 @@ sata3: sata-port@1 {
>  				};
>  			};
>=20=20
> -			spi@10680 {
> -				pinctrl-0 =3D <&spi1_pins
> -					     &microsom_spi1_cs_pins>;
> -				pinctrl-names =3D "default";
> -				status =3D "okay";
> -			};
> -
>  			sdhci@d8000 {
>  				bus-width =3D <4>;
>  				cd-gpios =3D <&gpio0 20 GPIO_ACTIVE_LOW>;
> @@ -327,11 +320,13 @@ helios_fan2_pins: helios_fan2_pins {
>  					marvell,pins =3D "mpp48", "mpp55";
>  					marvell,function =3D "gpio";
>  				};
> -				microsom_spi1_cs_pins: spi1-cs-pins {
> -					marvell,pins =3D "mpp59";
> -					marvell,function =3D "spi1";
> -				};
>  			};
>  		};
>  	};
>  };
> +
> +&spi1 {
> +	pinctrl-0 =3D <&spi1_pins>;
> +	pinctrl-names =3D "default";
> +	status =3D "okay";
> +};
> --=20
> 2.55.0
>

--=20
Gr=C3=A9gory CLEMENT, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
