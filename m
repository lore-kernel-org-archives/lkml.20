Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05CD7171BB
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 10:46:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787913988; cv=none; b=iZV7wpvYEWJvaqMm/MODJu4UoO2L/Pf7rRLKv4p0tE9H5FfxQrTe6Oqw2Z2Uav5uN0yaHL/2+ilZLTyIRybh5lRnE4rMBJmWt/t00OLIQxjk98b96h5qGPu8p8VgX3hQJGY/BrnOPEYKA1+uM8RvFkhhiqX/fT57eKcDAu6XuDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787913988; c=relaxed/simple;
	bh=LJT8XOxERzWNc+HVH34bJi34i3zOxgk+Ug3jdu967WM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=kHKV6a5QxD/b6Yph1nuHulf3B1gZRqVvwaJe9KoQQV+z/VdCQwUittd3fYH9lwUDbWldzQLqJOFjlysaTtipLLbBgXmzuQqIFcarY2aIVAVE+W1+QgKTk7Jc3jXZVMy1ETky9I0yH2ywDLefON30dG+ay6tfjQ/PTB2h2j0VvaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=OX30jHom; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="OX30jHom"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 763124E413FF;
	Fri, 28 Aug 2026 10:46:25 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 43F1160537;
	Fri, 28 Aug 2026 10:46:25 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9594311C781D9;
	Fri, 28 Aug 2026 12:46:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1787913980; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=xdvsH9Es0asehE5TRFzGuYdK3EGs9nWZXPtJhEl9x3k=;
	b=OX30jHomJfm6JBDOOcY9uADWhAjE62c/hd1NWu/zaOBNXjM0hvKzIHdHlKsBlueZDaixHI
	It1iP6TubmRLIn0ZDJNvVyLF+iIaith2yI9atPktWEgMyuIXRBVqdYtY5xDwBo8DyjI0CE
	EMdXCwFQWQZXGB9CTGeCZTjjjvJMw5upsYHPphlCwFnmRKczxY8QOfDPEwd8xu+CLQqPTy
	WKuzm/Cr/eUVegKs+3y01bGXwhRIJ9+5LMtfBFK/sX8oHtguEHjivqMmuopZCfz0BrcxVu
	j3IQ7qYtF3AQ8CgUvV4u8NWPjflwtBs/2mXpfnN5TJ3qiYVNIKPpHZLipY7tUQ==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
To: Rosen Penev <rosenp@gmail.com>, devicetree@vger.kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth
 <sebastian.hesselbarth@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Thomas Petazzoni
 <thomas.petazzoni@free-electrons.com>, "moderated list:ARM/Marvell
 Kirkwood and Armada 370, 375, 38x,..."
 <linux-arm-kernel@lists.infradead.org>, open list
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] ARM: dts: marvell: add SDHCI clock-names to Armada 39x
In-Reply-To: <20260823235613.77505-1-rosenp@gmail.com>
References: <20260823235613.77505-1-rosenp@gmail.com>
Date: Fri, 28 Aug 2026 12:46:18 +0200
Message-ID: <87v78uplol.fsf@BLaptop.bootlin.com>
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

> The marvell,armada-380-sdhci binding requires clock-names, but the
> Armada 39x SDHCI node only carries an unnamed clock reference.
> Add the missing clock name so the node passes schema validation.
>
> Fixes: 538da83ddbea ("ARM: mvebu: add Device Tree files for Armada 39x So=
C and board")
> Assisted-by: opencode:big-pickle
> Signed-off-by: Rosen Penev <rosenp@gmail.com>

Fix already applied with ARM: dts: marvell: add missing SDHCI clock-names

> ---
>  arch/arm/boot/dts/marvell/armada-39x.dtsi | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/arm/boot/dts/marvell/armada-39x.dtsi b/arch/arm/boot/dt=
s/marvell/armada-39x.dtsi
> index 218fcf99ae07..81dd4ca5fbc9 100644
> --- a/arch/arm/boot/dts/marvell/armada-39x.dtsi
> +++ b/arch/arm/boot/dts/marvell/armada-39x.dtsi
> @@ -381,6 +381,7 @@ mmc@d8000 {
>  					<0x18454 0x4>;
>  				interrupts =3D <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH>;
>  				clocks =3D <&gateclk 17>;
> +				clock-names =3D "io";
>  				mrvl,clk-delay-cycles =3D <0x1F>;
>  				status =3D "disabled";
>  			};
> --=20
> 2.55.0
>

--=20
Gr=C3=A9gory CLEMENT, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
