Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3B9C1C84CB
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 10:03:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791713001; cv=none; b=S7PY/UmWG1uIM52byvjdpLXbHmo5ApWSZW0p7C2kZbI1Etn7r/ASAyDtorfBhw7UTbBET5otVhwJNM/Jg0vljKlEWqFOgLkq7EZHamX0gM2jzq1KD29FRqWLIV23EisJlJ3xxk7H33/cH44PIA96o4DUeGc6rOWKjDA37IXNhdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791713001; c=relaxed/simple;
	bh=k/XQh/MJlqPWCVt5FLiN1T6hCj4rmGW0HaI5AuWXLeg=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=dO7VvYWYFkX1r/Hg4g6FyiogchNdCcsBQvOygVUL7FfGH2nzbaHYsaJ3SYEe9UoZ8ne2JPGYeSdZx/I/OskQbutMbW1+kKxCSTFkdyUOMUGxCajeFcml8QFY8vhqQYFM+iP+GwTBIZqhykU0TU4kpWWwtDBWgQ+yGW5ttf1Ah78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=JceIeC8Q; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="JceIeC8Q"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 73DD61A1156;
	Sun, 11 Oct 2026 10:03:10 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 369F0605CC;
	Sun, 11 Oct 2026 10:03:10 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1532A11D70920;
	Sun, 11 Oct 2026 12:03:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1791712988; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=glsBEN8UdkpCjmn6qnLJewyzVA6lDTi/CcC0os/V9hc=;
	b=JceIeC8Qx38nNsdR6enEhOxzo5ALR6/kUHAMC4+46kjfxP/bphaPSg6iturKNycI8nml3a
	Mwj4bVZOs2/QWyyRML9RrAzIiovfc7eWbkKp+8DQ3i1cGeJt8n/OoTB2kz0mxakWO3UEQ+
	sync5mLjHdgfcrHP2tNc7s+9xs6JVOBL81q8ZkEy0EndZNPhB/QvKoPCfwxIXl6p1Mkhik
	r2zmcrOKbkCx6vqc+WyarGlifmnC+YzGsiUJxgBZtcIrFR1oBojNXPtsp1wUxe7gstxzG+
	Iqr2IDuAbnW8k4sPTOTTNHcLc+Aa+4QgFD7UxQ5/Vy9d9lv1L7sbkaESHKuFnA==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 11 Oct 2026 12:02:59 +0200
Message-Id: <DM1X8RPY7556.2VHDX3Z5VKKM1@bootlin.com>
Subject: Re: [PATCH net-next 4/5] net: macb: implement timestamped MDIO
 writes
Cc: "Russell King" <linux@armlinux.org.uk>, "Conor Dooley"
 <conor.dooley@microchip.com>, "Broadcom internal kernel review list"
 <bcm-kernel-feedback-list@broadcom.com>, "Thomas Gleixner"
 <tglx@kernel.org>, "Miroslav Lichvar" <mlichvar@redhat.com>,
 <netdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Maxime
 Chevallier" <maxime.chevallier@bootlin.com>
To: "James Clark" <jjc@jclark.com>, "David S. Miller" <davem@davemloft.net>,
 "Eric Dumazet" <edumazet@kernel.org>, "Jakub Kicinski" <kuba@kernel.org>,
 "Paolo Abeni" <pabeni@redhat.com>, "Andrew Lunn" <andrew+netdev@lunn.ch>,
 "Heiner Kallweit" <hkallweit1@gmail.com>, "Richard Cochran"
 <richardcochran@gmail.com>, "Florian Fainelli"
 <florian.fainelli@broadcom.com>, "Doug Berger" <opendmb@gmail.com>,
 "Nicolai Buchwitz" <nb@tipi-net.de>
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3
References: <20261009143506.2507607-1-jjc@jclark.com>
 <20261009143506.2507607-5-jjc@jclark.com>
 <DM1WEUIF8V8V.2OZWRB5G232T4@bootlin.com>
In-Reply-To: <DM1WEUIF8V8V.2OZWRB5G232T4@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3

On Sun Oct 11, 2026 at 11:23 AM CEST, Th=C3=A9o Lebrun wrote:
>> -static int macb_mdio_write_c22(struct mii_bus *bus, int mii_id, int reg=
num,
>> -			       u16 value)
>> +static u64 macb_mdio_sts_delay(struct macb *bp)
>> +{
>> +	static const u16 gem_divisors[] =3D {
>> +		[GEM_CLK_DIV8] =3D 8,
>> +		[GEM_CLK_DIV16] =3D 16,
>> +		[GEM_CLK_DIV32] =3D 32,
>> +		[GEM_CLK_DIV48] =3D 48,
>> +		[GEM_CLK_DIV64] =3D 64,
>> +		[GEM_CLK_DIV96] =3D 96,
>> +		[GEM_CLK_DIV128] =3D 128,
>> +		[GEM_CLK_DIV224] =3D 224,
>> +	};
>> +	static const u16 macb_divisors[] =3D {
>> +		[MACB_CLK_DIV8] =3D 8,
>> +		[MACB_CLK_DIV16] =3D 16,
>> +		[MACB_CLK_DIV32] =3D 32,
>> +		[MACB_CLK_DIV64] =3D 64,
>> +	};
>
> Do I sound crazy if I say we could use a single array for both?
> Both GEM_CLK_DIV* and MACB_CLK_DIV* are enums and are ordered in the
> same way. First four GEM_* are the same ones as MACB_* and it will
> never change.

Ignore this comment because gem_divisors[3] !=3D macb_divisors[3].

Thanks,

--
Th=C3=A9o Lebrun, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

