Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8402E3F6C42
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 13:52:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791899578; cv=none; b=PlJq3nizWsWrIh//GsFKdafxPiKQ4MDJlxvYcHZkc6lF7s1yoOdtaLrhTrL6ZINwcK/3rSyTQAfygqvMpnvogqS2el6T2l6XfhYSEmtIBPT1WqJJuuc/A9cWZJJRzE2vQxiL6NzoxAwIDS1gsqDehY7G/GNy7rskoHUBVZq2sw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791899578; c=relaxed/simple;
	bh=saLD1mV0ic++PwAbLNYu01ddzsXMm90zjgupVeJiaIw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=YdCSt0wGPol8q7oZjDrj6n1vHHngrj7la/lj3rY10LCBu07OkuF+0zYv81tHOt1dpWCa8h7rKDibLkkY7R/TfXKD4k3IphNS5W38wOD+PwKjCSce0MHOI8+GEto+3hYUBLFOwWqlQDazbHgDJGw/8mBssvlQxv3mvmU0yfOrE2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=QvDQ7l1R; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="QvDQ7l1R"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 353EDC653EF;
	Tue, 13 Oct 2026 13:53:49 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 98EED60362;
	Tue, 13 Oct 2026 13:52:53 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1788311D71615;
	Tue, 13 Oct 2026 15:52:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1791899572; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=CtXqRswKbx5dTP1pjP03sqibyt/3E5DuejRQw9zPWYI=;
	b=QvDQ7l1R7gpA9iQt5x97bXgtASuMhTjV4SK6ygVYVkv0C71u/RdEkWriCYEvJoxILd3y4Y
	/dNFjk9SZcVk8Ex8O1RZkwX/j1tTka+q83nMT0JEcTFSBfZcbxIefluOiLHq/1qpUoTrWX
	6W7zBl1uleL9U+UBf1XKp68fU3UhGSjn/iLX7Z3wQRNm26H0vt3Lk3LGb6WkuRV0gShf4i
	gnUZmig5OO2PR8jRxjINRa/Tr2hjnMWFw0z4z6sZvB5vvtLwtQ2n9GuEwwuFyEBUEghufQ
	QdU3eT9r84+rbP0JOvziOHcvYlK6imcXEsN8gy3YEIYXHUbt6uo7zSNGqVg+5w==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: "Paul Louvel" <paul.louvel@bootlin.com>
Cc: "Geert Uytterhoeven" <geert@linux-m68k.org>,  "Borislav Petkov"
 <bp@alien8.de>,  "Tony Luck" <tony.luck@intel.com>,  "Rob Herring"
 <robh@kernel.org>,  "Krzysztof Kozlowski" <krzk+dt@kernel.org>,  "Conor
 Dooley" <conor+dt@kernel.org>,  "Geert Uytterhoeven"
 <geert+renesas@glider.be>,  "Magnus Damm" <magnus.damm@gmail.com>,
  <linux-kernel@vger.kernel.org>,  <linux-renesas-soc@vger.kernel.org>,
  <linux-edac@vger.kernel.org>,  <devicetree@vger.kernel.org>,  "Thomas
 Petazzoni" <thomas.petazzoni@bootlin.com>,  "Herve Codina"
 <herve.codina@bootlin.com>,  "Wolfram Sang"
 <wsa+renesas@sang-engineering.com>
Subject: Re: [PATCH v6 3/3] ARM: dts: renesas: r9a06g032: add EDAC node
In-Reply-To: <DM3OXV8IQQKR.36V79A742H52F@bootlin.com> (Paul Louvel's message
	of "Tue, 13 Oct 2026 13:57:56 +0200")
References: <20261013-paul-v7-3-rc1-edac-v6-0-2f1d6f2f74db@bootlin.com>
	<20261013-paul-v7-3-rc1-edac-v6-3-2f1d6f2f74db@bootlin.com>
	<CAMuHMdV1nuiSAKbCrD0mWJX7rC4T=fxO5LC5ksRD440YSL_3cw@mail.gmail.com>
	<DM3OXV8IQQKR.36V79A742H52F@bootlin.com>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Tue, 13 Oct 2026 15:52:47 +0200
Message-ID: <87se29wvv4.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3


>>> +               edac: memory-controller@4000d000 {
>>> +                       compatible =3D "renesas,r9a06g032-ddr-edac", "c=
dns,ddr-edac";
>>> +                       reg =3D <0x4000d000 0x1000>;
>>> +                       interrupts =3D <GIC_SPI 76 IRQ_TYPE_LEVEL_HIGH>;
>>> +                       clocks =3D <&sysctrl R9A06G032_CLK_DDRC>, <&sys=
ctrl R9A06G032_HCLK_DDRC>;
>>> +                       clock-names =3D "ddrc", "pclk";
>>> +                       status =3D "disabled";
>>
>> Should this node be enabled by default, or am I too naive?
>
> The bootloader will be responsible to initialize the DDR controller and e=
nable
> ECC if specified. On this specific platform (r9a06g032), ECC is disabled =
by
> default.
> Enabling the ECC require a specific property to be present under the cont=
roller
> node in U-Boot. I think it make sense to keep it by default disabled.

Wouldn't enabling it also require some reserved memory regions? There
should be an impact on the amount of available RAM for the system.

Thanks,
Miqu=C3=A8l
