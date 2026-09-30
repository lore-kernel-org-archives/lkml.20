Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F9FA420480
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 19:57:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790798262; cv=none; b=HYJbDZnC/6OJe+GPHbyBPjsC+/+tKE/smAruFFFQ6HP3rjRrvJNTu39hrmq4XuyBPIvAV+vdSDCAzcyYKwaWDHh3oFZuyuNGrj0YkzRL2QJR0UucTDhdQ+Z2wy4jck6y5tPxtBZsEQChNrwd6Gbd9vq5spFZDQLFn/7Vs76O4CA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790798262; c=relaxed/simple;
	bh=54ADsi1peMGN+ZsrNHRATDKpWH2hTugBF0P+8IpbUNY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=dXrTseKZ8aIflZ17UOjrDTK0MqVBQghI/X4WklPA6ssgdH3/3gITSLBQBpOW1yezfhaAPUCpqRdI/m5REkvd51gZCFGgm403eej4hxJPtRSAMX9NncyKBCn5py8UT36xdXVUmEBr+JjfkZJAMBtbQCpdc6f+HhK6CqgAKW9MGzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=F48e8l/i; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="F48e8l/i"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id DB1351A1080;
	Wed, 30 Sep 2026 19:57:38 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 9F7EA60749;
	Wed, 30 Sep 2026 19:57:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 345F01032A657;
	Wed, 30 Sep 2026 21:57:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790798253; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=uqQYTKm2Wdd7b1tVU8c2yXO4zrRthLuiQutkjRT8Vuk=;
	b=F48e8l/i+EUn005g7ZmACDDnUwircTAMsIs7ExYiV1VMgZDoVPm/NDfiMOqM3RoBDhAbt4
	UHEGekREDTi6XilPbdHtrNlnLMBaX3dz4EA1ktbESOT8ojwEEvS3JWC/IKKLJfKikGE/t0
	dFQPwRi0VRPIY72S42yYn5JNMI+CO/cv+Xjuvu1FnfCsPX12LMrWkU/alP0hEvLdSrjiSW
	U7bfR/2Kkz73m0TrSJKwcFSDe3TQjnfbq+UdL8lRQr+ebax2Z8edfV9L/OX7rKmlGQeG05
	kSt957cM+cFLyB5RrMJH5Cap+qKKP1IWmbNQEcX/OFbYL8i+pnC9Lwz6Shzfsw==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>, Andrew Lunn <andrew@lunn.ch>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Russell King
 <linux@armlinux.org.uk>
Cc: linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] ARM: orion/gpio: use __assign_bit() where applicable
In-Reply-To: <20260920022551.3145595-1-peng.fan@oss.nxp.com>
References: <20260920022551.3145595-1-peng.fan@oss.nxp.com>
Date: Wed, 30 Sep 2026 21:57:31 +0200
Message-ID: <871paa8qc4.fsf@BLaptop.bootlin.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3

Hello Peng Fan,

> From: Peng Fan <peng.fan@nxp.com>
>
> Convert open-coded if/else with __set_bit/__clear_bit to the
> __assign_bit API.
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

this file is now removed by the series "soc: deprecated platform
removal"
https://lore.kernel.org/all/20260701212353.2196041-1-arnd@kernel.org/

Gregory

> ---
>  arch/arm/plat-orion/gpio.c | 10 ++--------
>  1 file changed, 2 insertions(+), 8 deletions(-)
>
> diff --git a/arch/arm/plat-orion/gpio.c b/arch/arm/plat-orion/gpio.c
> index 49e29b7894a3..a8412dba97f0 100644
> --- a/arch/arm/plat-orion/gpio.c
> +++ b/arch/arm/plat-orion/gpio.c
> @@ -275,15 +275,9 @@ void __init orion_gpio_set_valid(unsigned pin, int m=
ode)
>  	if (mode =3D=3D 1)
>  		mode =3D GPIO_INPUT_OK | GPIO_OUTPUT_OK;
>=20=20
> -	if (mode & GPIO_INPUT_OK)
> -		__set_bit(pin, &ochip->valid_input);
> -	else
> -		__clear_bit(pin, &ochip->valid_input);
> +	__assign_bit(pin, &ochip->valid_input, mode & GPIO_INPUT_OK);
>=20=20
> -	if (mode & GPIO_OUTPUT_OK)
> -		__set_bit(pin, &ochip->valid_output);
> -	else
> -		__clear_bit(pin, &ochip->valid_output);
> +	__assign_bit(pin, &ochip->valid_output, mode & GPIO_OUTPUT_OK);
>  }
>=20=20
>  void orion_gpio_set_blink(unsigned pin, int blink)
> --=20
> 2.51.0
>

--=20
Gr=C3=A9gory CLEMENT, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
