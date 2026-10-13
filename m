Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E77BC4EF149;
	Tue, 13 Oct 2026 11:58:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791892692; cv=none; b=nHCFg7QAU/Tlt+Q4Nc4jR/4StEk4PyOIjsL2wI9hwhqOmmSjjtAKiS3ojS5F0fmpaWTFgwevbfJnk4T/8rcFW6Vm9T3qICbdTdlls/e1AKb/7kL2PzEamushuunIpmr6tqc31w4DgkHcOaxtPWwwdnYHlmYRlT98LcJ+iQuY+0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791892692; c=relaxed/simple;
	bh=HSOWWU74lDNxt1d+wQt3X3kc79zz+ssUkjfC7waIdoQ=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=RXOe8x2D9QdGLbhj7Qf8anfSAHqZfHmD8FZ/1uRW1E2kM6bL3VtHYeMtAAPFhirhR6y7Jq4QOu+BloX8kiPFzQ6lwWMDNJoqQvrTJmUbO8omVucFSImoe4nko12+EUbZnUgKtvb4fo0Uqu3i/7pikpcOKbfjprrCmNEX5DInn5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=kZqkjOZk; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="kZqkjOZk"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 447EE1A11FE;
	Tue, 13 Oct 2026 11:58:07 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 170B160362;
	Tue, 13 Oct 2026 11:58:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4E51811D7080C;
	Tue, 13 Oct 2026 13:57:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1791892685; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=jXUFuuOTF8XeXu/Tjy+acP2BZmhd2fr98R0Z92J5Q4g=;
	b=kZqkjOZkVy20xkYa6RsVyitkCikl+xV1v9ZoLLUiibvYRoBpyMJQueIZZeoYQEnZ5H7lhV
	OL49oCCTzGbuv0nqs3SmjbYXgX6mYv3PH2zybHqY45k6u/MP0BC3kKHYkOiZMVCp4D+Owm
	I9CbI4LgxBfP58tDlh6VrxtePh6w1KJQT/ZajajtZr7uj/b+EsmZLXw5Y+AsNn3LUflJiH
	i7IgQvdZH4sZYcEfzqymI87yDotN9U2J6iYxdxqdyuD/uJm5AFr0DNWk8n9drJRBVx5KhK
	ZWLpZ+SSamr2yYEa2RigFWrJlT08dmcLfTu0i7WZX3KnInsDZvvgjbmMcNsGiA==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 13 Oct 2026 13:57:56 +0200
Message-Id: <DM3OXV8IQQKR.36V79A742H52F@bootlin.com>
To: "Geert Uytterhoeven" <geert@linux-m68k.org>, "Paul Louvel"
 <paul.louvel@bootlin.com>
Cc: "Borislav Petkov" <bp@alien8.de>, "Tony Luck" <tony.luck@intel.com>,
 "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Geert
 Uytterhoeven" <geert+renesas@glider.be>, "Magnus Damm"
 <magnus.damm@gmail.com>, <linux-kernel@vger.kernel.org>,
 <linux-renesas-soc@vger.kernel.org>, <linux-edac@vger.kernel.org>,
 <devicetree@vger.kernel.org>, "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>, "Miquel Raynal"
 <miquel.raynal@bootlin.com>, "Herve Codina" <herve.codina@bootlin.com>,
 "Wolfram Sang" <wsa+renesas@sang-engineering.com>
Subject: Re: [PATCH v6 3/3] ARM: dts: renesas: r9a06g032: add EDAC node
From: "Paul Louvel" <paul.louvel@bootlin.com>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3
References: <20261013-paul-v7-3-rc1-edac-v6-0-2f1d6f2f74db@bootlin.com>
 <20261013-paul-v7-3-rc1-edac-v6-3-2f1d6f2f74db@bootlin.com>
 <CAMuHMdV1nuiSAKbCrD0mWJX7rC4T=fxO5LC5ksRD440YSL_3cw@mail.gmail.com>
In-Reply-To: <CAMuHMdV1nuiSAKbCrD0mWJX7rC4T=fxO5LC5ksRD440YSL_3cw@mail.gmail.com>
X-Last-TLS-Session-Version: TLSv1.3

Hi Geert,

On Tue Oct 13, 2026 at 1:41 PM CEST, Geert Uytterhoeven wrote:
> Hi Paul,
>
> On Tue, 13 Oct 2026 at 12:45, Paul Louvel <paul.louvel@bootlin.com> wrote=
:
>> Add EDAC node to the SoC base device tree file.
>>
>> Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
>> Signed-off-by: Paul Louvel (Schneider Electric) <paul.louvel@bootlin.com=
>
>
> Thanks for your patch!
>
>> --- a/arch/arm/boot/dts/renesas/r9a06g032.dtsi
>> +++ b/arch/arm/boot/dts/renesas/r9a06g032.dtsi
>> @@ -164,6 +164,15 @@ dmamux: dma-router@a0 {
>>                         };
>>                 };
>>
>> +               edac: memory-controller@4000d000 {
>> +                       compatible =3D "renesas,r9a06g032-ddr-edac", "cd=
ns,ddr-edac";
>> +                       reg =3D <0x4000d000 0x1000>;
>> +                       interrupts =3D <GIC_SPI 76 IRQ_TYPE_LEVEL_HIGH>;
>> +                       clocks =3D <&sysctrl R9A06G032_CLK_DDRC>, <&sysc=
trl R9A06G032_HCLK_DDRC>;
>> +                       clock-names =3D "ddrc", "pclk";
>> +                       status =3D "disabled";
>
> Should this node be enabled by default, or am I too naive?

The bootloader will be responsible to initialize the DDR controller and ena=
ble
ECC if specified. On this specific platform (r9a06g032), ECC is disabled by
default.
Enabling the ECC require a specific property to be present under the contro=
ller
node in U-Boot. I think it make sense to keep it by default disabled.

>
>> +               };
>> +
>>                 udc: usb@4001e000 {
>>                         compatible =3D "renesas,r9a06g032-usbf", "renesa=
s,rzn1-usbf";
>>                         reg =3D <0x4001e000 0x2000>;
>>
>
> Gr{oetje,eeting}s,
>
>                         Geert
>
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m6=
8k.org
>
> In personal conversations with technical people, I call myself a hacker. =
But
> when I'm talking to journalists I just say "programmer" or something like=
 that.
>                                 -- Linus Torvalds





--=20
Paul Louvel, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

