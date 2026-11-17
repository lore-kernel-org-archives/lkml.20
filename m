Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794923185;
	b=FdrCHYvGn2AaDN9KjqCI9w6brLf8Vr8Dz0KTFHL2jIkSq8kL8w9/NPlevuVmEsDdwdzz
	 hNYNBkAXERr4ZrdmJfIQalp6Dy4psWUF2EtyucruGG0L9joybLPcQBsis5k6ZXLMM4zv+
	 0HhrkTE4b0yfYuMYAcHVVXFYiR/B9y1QOKAN1SMBiKCKJbviyRneyTYJO8g6JKA1+Z4B/
	 mQjdgu/rR/AyyurDUeWuUFgZ/U5f82RS+VB3CVPn/j+zGYExjUDzxOC8dRS8kANjMeWsJ
	 KkFCt9hHvb3b7webmbZMWzn76Y9LM3Zhs/LPzoSOGkdVd/9PDq0vyLh13aU19PCr70Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794923185;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Mime-Version:
	 Content-Transfer-Encoding:Content-Type:Date:Message-Id:Subject:From:
	 To:Cc:X-Mailer:References:In-Reply-To:X-Last-TLS-Session-Version;
	bh=8f6rccMSyPsIrN1Q18fCGix5pfk1/BssylUZ+J+Wx/M=;
	b=uxLMMiYfE7hZ97XzawKgAFZzZcdjiSghTi0HKtGXHLJR1sQPLl8J3RjKUXXhFuadgkVs
	 oCLLIc/pvktSAxBjt/IMGhK+uBtI/iOPGee8kggw4nHP+HcZYil9WGcTw0/AzrZcM9f+D
	 8D2DFDwCxYl0f2a7E+2NzkKp04UV5aP1zqHwC8HuvYAQZ555rka1x08X6RCAdz+LWVTTu
	 74fzp0eK9YNjDswAvhCSIxrNSuSosbP2VEeu/OwEq8+gnEFTbAJhADCynJJoJ9xg+GN4u
	 2iHFaTpuq/FC1MDsGWaA+rRuMwS1YxHLQ1qfiqL7/1trXudU7lxa6MLSXe9kFTNMybw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=QrlVUiB7;
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AAAD606A32C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 13:46:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3AAAD606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=QrlVUiB7
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id B34001A0645;
	Tue, 17 Nov 2026 13:46:23 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7095D5FC81;
	Tue, 17 Nov 2026 13:46:23 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2DAE411BC0036;
	Tue, 17 Nov 2026 14:46:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794923182; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=8f6rccMSyPsIrN1Q18fCGix5pfk1/BssylUZ+J+Wx/M=;
	b=QrlVUiB7S4f1Ljw6XDjLtzE2yG37yYuxWaCy7J6yDQCfIRxyIDLwGdJ06Yv14L2f350FY+
	ePr3GM2ejnyWcN1TAjLk25JfSOxnUtJ/sCFT1dIusRNynHfbkaPtIIRD4IEN0cVw5j/LBm
	fv6RuaZTTAHIisqx2FJvLJU3zgoCrIjCd/zz/VAhADqNsV8dLYarDjqYvJskwJ3RKr7WhT
	87RcHIbVIXbKakCoCygkmlQ5UCyz7Hn2I8YsaI572ctUTW1uDcdvvs4YGS8oU402LU97yL
	2DSc45NejMlZq5YK0fHmiqIEpYGQoH4Tu/Fau9mLw71kT0EiOlQovgsTx66IAA==
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 17 Nov 2026 14:46:15 +0100
Message-Id: <DMXJ5VMIPGL9.1917ON486UJRD@bootlin.com>
Subject: Re: [PATCH v7 3/3] ARM: dts: renesas: r9a06g032: add EDAC node
From: "Paul Louvel" <paul.louvel@bootlin.com>
To: "Wolfram Sang" <wsa+renesas@sang-engineering.com>, "Paul Louvel"
 <paul.louvel@bootlin.com>
Cc: "Borislav Petkov" <bp@alien8.de>, "Tony Luck" <tony.luck@intel.com>,
 "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Geert
 Uytterhoeven" <geert+renesas@glider.be>, "Magnus Damm"
 <magnus.damm@gmail.com>, <linux-kernel@vger.kernel.org>,
 <linux-renesas-soc@vger.kernel.org>, <linux-edac@vger.kernel.org>,
 <devicetree@vger.kernel.org>, "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>, "Miquel Raynal"
 <miquel.raynal@bootlin.com>, "Herve Codina" <herve.codina@bootlin.com>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3
References: <20261019-paul-v7-3-rc1-edac-v7-0-84c76c6d7595@bootlin.com>
 <20261019-paul-v7-3-rc1-edac-v7-3-84c76c6d7595@bootlin.com>
 <avxR5VZESPLklIuG@ninjato>
In-Reply-To: <avxR5VZESPLklIuG@ninjato>
X-Last-TLS-Session-Version: TLSv1.3

Hi Wolfram,

On Tue Nov 17, 2026 at 2:08 PM CET, Wolfram Sang wrote:
>
>> +		edac: memory-controller@4000d000 {
>> +			compatible =3D "renesas,r9a06g032-ddr-edac", "cdns,ddr-edac";
>> +			reg =3D <0x4000d000 0x1000>;
>> +			interrupts =3D <GIC_SPI 76 IRQ_TYPE_LEVEL_HIGH>;
>> +			clocks =3D <&sysctrl R9A06G032_CLK_DDRC>, <&sysctrl R9A06G032_HCLK_D=
DRC>;
>> +			clock-names =3D "ddrc", "pclk";
>> +			status =3D "disabled";
>> +		};
>
> On second thought, any reason we don't want this enabled by default?

Please see my answer to Geert [1].
After reconsideration, maybe it is advisable to enable it by default. Enabl=
ing
ECC is done by the bootloader, and it might be better if no further actions=
 are
required to enable it kernel side.
If ECC is disabled, no errors will be generated, and the capabilties will j=
ust be
set to EDAC_CAP_NONE.

[1]: https://lore.kernel.org/all/DM3OXV8IQQKR.36V79A742H52F@bootlin.com/

Thanks.
Best regards,
--=20
Paul Louvel, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

