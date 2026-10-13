Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCDBF23E33D;
	Tue, 13 Oct 2026 14:14:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791900853; cv=none; b=WlNgAmbX/i/bWUR6cZICEopwMfTZY3UWc6d9/dvfbFqzEIGAQsQPMZu2RWQHYXQjGMsk4zRvuAhRXbckZAcQT1LYjgCIhwDpbdsXFVfkm+PTJoZwR+/TB+sGn1cR20zLpd2Znmf6+/UY/9HzjWn/aVTp90LMJzzPZRAl6qbFmGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791900853; c=relaxed/simple;
	bh=er6qEAwzMbZyPYWRjnq94p5k3hkmXXEyv9wll0K0biY=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=ag6uTfYNN/uONXFhtDMgHKUGBvi4w9XAF0HEasCMnrePvcCBISA/Pdc45yZEwhHo8937bBmuczzUG16a6PpfVetvkyIPQj8TdFUN77Cs8tFt4qnV8G0hSBHursQVyP+2+Jd8mFxVop93HJWGptd40YwJ/TLVuZ5mU2DwiBTEj9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Dv5n4T6I; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Dv5n4T6I"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 519C01A11FE;
	Tue, 13 Oct 2026 14:14:10 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 221D260362;
	Tue, 13 Oct 2026 14:14:10 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6BB8011D71685;
	Tue, 13 Oct 2026 16:14:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1791900848; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=OjiJMLDJKi81kjlh54OdCXaD+MygB3PHImytKEytnC0=;
	b=Dv5n4T6IWCKNxWspgLl0uTJNV3xIp2zyxj1rHUOrUbqtP3TGicwAume2juBwk4lBEgertj
	v9HA0pDt4ERO5xBERN8EifTreRhJV4Ef7HLnMiKgYXMQKZJjGab/Dc0IbiK7uB0cFdSv1j
	69/pFUOs6iW8/8grM7vI7K8kb/JFnX8Z0D6d2/RAI5oCWnyRTzyi7F6EscAjf28qp3GQIH
	R+KN3FzvEbsNMIIdbhyiS3skASdTjyW9/5IkANfqTBlyaoXFbvG8iCJBwVLbdGnygiMGBv
	JZv5x5OKWUsWPfG/J8kjxgWb4WSlDnGK0NesTxqEqTMF591HSUYYQfW4fO+vzg==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 13 Oct 2026 16:14:02 +0200
Message-Id: <DM3RU2UQ7SDU.2FKZGSSLSRT7B@bootlin.com>
From: "Paul Louvel" <paul.louvel@bootlin.com>
To: "Miquel Raynal" <miquel.raynal@bootlin.com>, "Paul Louvel"
 <paul.louvel@bootlin.com>
Cc: "Geert Uytterhoeven" <geert@linux-m68k.org>, "Borislav Petkov"
 <bp@alien8.de>, "Tony Luck" <tony.luck@intel.com>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, "Geert Uytterhoeven"
 <geert+renesas@glider.be>, "Magnus Damm" <magnus.damm@gmail.com>,
 <linux-kernel@vger.kernel.org>, <linux-renesas-soc@vger.kernel.org>,
 <linux-edac@vger.kernel.org>, <devicetree@vger.kernel.org>, "Thomas
 Petazzoni" <thomas.petazzoni@bootlin.com>, "Herve Codina"
 <herve.codina@bootlin.com>, "Wolfram Sang"
 <wsa+renesas@sang-engineering.com>
Subject: Re: [PATCH v6 3/3] ARM: dts: renesas: r9a06g032: add EDAC node
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3
References: <20261013-paul-v7-3-rc1-edac-v6-0-2f1d6f2f74db@bootlin.com>
 <20261013-paul-v7-3-rc1-edac-v6-3-2f1d6f2f74db@bootlin.com>
 <CAMuHMdV1nuiSAKbCrD0mWJX7rC4T=fxO5LC5ksRD440YSL_3cw@mail.gmail.com>
 <DM3OXV8IQQKR.36V79A742H52F@bootlin.com> <87se29wvv4.fsf@bootlin.com>
In-Reply-To: <87se29wvv4.fsf@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3

On Tue Oct 13, 2026 at 3:52 PM CEST, Miquel Raynal wrote:
>
>>>> +               edac: memory-controller@4000d000 {
>>>> +                       compatible =3D "renesas,r9a06g032-ddr-edac", "=
cdns,ddr-edac";
>>>> +                       reg =3D <0x4000d000 0x1000>;
>>>> +                       interrupts =3D <GIC_SPI 76 IRQ_TYPE_LEVEL_HIGH=
>;
>>>> +                       clocks =3D <&sysctrl R9A06G032_CLK_DDRC>, <&sy=
sctrl R9A06G032_HCLK_DDRC>;
>>>> +                       clock-names =3D "ddrc", "pclk";
>>>> +                       status =3D "disabled";
>>>
>>> Should this node be enabled by default, or am I too naive?
>>
>> The bootloader will be responsible to initialize the DDR controller and =
enable
>> ECC if specified. On this specific platform (r9a06g032), ECC is disabled=
 by
>> default.
>> Enabling the ECC require a specific property to be present under the con=
troller
>> node in U-Boot. I think it make sense to keep it by default disabled.
>
> Wouldn't enabling it also require some reserved memory regions? There
> should be an impact on the amount of available RAM for the system.

Yes, if the memory controller is configured by the bootloader to enable ECC=
.
U-Boot would fixup the memory node to reflect the correct amount of availab=
le
RAM in this case.

At the Linux level, it would not change anything if the EDAC driver is prob=
ed by
and ECC is disabled. It would just simply inform the EDAC core that SECDEC =
is
not supported and that's it.

>
> Thanks,
> Miqu=C3=A8l

--=20
Paul Louvel, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

