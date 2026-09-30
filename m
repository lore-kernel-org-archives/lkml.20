Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66A6D3D4127;
	Wed, 30 Sep 2026 06:34:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790750097; cv=none; b=avlp/Lzflt8F7zPm0WVrJ2iR2sNVtYtG6UcM9Vv2PJs7BP2gy9PcPsuZV4tx1POn+NbO+yxNBXoaVimysIWt9rDesfOOarNRGGIgbsymeW7FQICncGNWTp6PkGYoDBYNhk6NlYFnWNj0hAdEXmPut3zDOeRh/o9Pq51obXGBuU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790750097; c=relaxed/simple;
	bh=jcgc1tsOVcBHYxcYpnXt2SObciquRADcGFKCJMT6i5M=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=JixHzXcOVPiNiirx1JfLb8/K4MP+dVmnexe/pL/KefQDSz56l7OjU7NvFGGobji68LDa1RcVE2HREhSDG6G3Uj5akKGSU6oUVHaYZgOpqsr1CvfvpK23+2asMn3L9q0GEeFrzAn6VTIn+Tez8ZsoxFrqgX4To6zSuXZ98b/VkK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=zJbJ7M+X; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="zJbJ7M+X"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id DEBBD1A104B;
	Wed, 30 Sep 2026 06:34:47 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B244760749;
	Wed, 30 Sep 2026 06:34:47 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6E6BD103297F7;
	Wed, 30 Sep 2026 08:34:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790750086; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=FJJ9SrQwpuXWcRwz3yjNOMuLRuftyz1Ef6SkpejQHYo=;
	b=zJbJ7M+XPdz6b7Q7TAOCZC9GbFLS9/imghm00KF1PCVoCubPo+DEBfw3ezU0ca5eOHkciT
	XSDs8z1Zu24yj4uxh9Iw5iCCgKl4k8U6GdsHQKC9o0PaAOVPPERAHKA6wmJ7robeIDayGX
	Rh+Vs6QzyxVFm4fPvoUYbb6lRC0afGzo/qcuay2WkeYqVZ+tt1qArjIgcsiq9N0P3z+nhg
	qKurDL+yiZZrSvVvlDjlPUZsMYxlxwJBrMcVhZR+zbGwyE80eoou8SXKjOT4uhfMIO5zDg
	v//WLqffHFHtx3JEBsm3Tixw1lb3KVsIDw7SZOIawCUJxQqSQ+BOytlkKYx5JA==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
To: Rosen Penev <rosenp@gmail.com>, devicetree@vger.kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth
 <sebastian.hesselbarth@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, "moderated list:ARM/Marvell Kirkwood and Armada
 370, 375, 38x,..." <linux-arm-kernel@lists.infradead.org>, open list
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] ARM: dts: helios4: use national,lm75 compatible
In-Reply-To: <20260831233607.13729-1-rosenp@gmail.com>
References: <20260831233607.13729-1-rosenp@gmail.com>
Date: Wed, 30 Sep 2026 08:34:42 +0200
Message-ID: <87ik3n8cxp.fsf@BLaptop.bootlin.com>
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

> The temp@4c node uses "ti,lm75", which no binding covers and which
> dtbs_check rejects:
>
>   temp@4c: failed to match any schema with compatible: ['ti,lm75']
>
> The LM75 was originally a National Semiconductor part (now owned by
> TI) and the lm75 driver binds it via the matching "national,lm75"
> entry. Use the documented compatible; no functional change. The i2c name
> fallback ends up binding it.
>
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
> index 548fb92ca811..39b2d4fa742c 100644
> --- a/arch/arm/boot/dts/marvell/armada-388-helios4.dts
> +++ b/arch/arm/boot/dts/marvell/armada-388-helios4.dts
> @@ -200,7 +200,7 @@ usb3-ilimit-hog {
>  				};
>=20=20
>  				temp_sensor: temp@4c {
> -					compatible =3D "ti,lm75";
> +					compatible =3D "national,lm75";
>  					reg =3D <0x4c>;
>  					vs-supply =3D <&reg_3p3v>;
>  				};
> --=20
> 2.55.0
>

--=20
Gr=C3=A9gory CLEMENT, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
