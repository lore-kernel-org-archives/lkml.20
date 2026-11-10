Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794299174;
	b=gpY6KC99oGqkUPXPRpX1mqGhHsf+gQK0WpSsnMJAYPvMFFS3gJVCdSP4GghQPdrS9kWo
	 ZqRvGo6s0p4hoDRMGCHPSEucofEqME0x2MLqnuwyHnsiqU2y7DzOsjzMdBAwqczm9vgUN
	 Dy59tJ9sRJ0B6KYNt5cS+3ve9qqMQZv6Mf0lwCqPg91TieQscqZmmI4PbETz62xsf7Ptv
	 hZF3gF+IIvAbtEoyhYktoQbZ1mX4uHSpggI8HJFTo6C5bXEnkv3ZPiFnVgeAktEo8QTaM
	 CU+DhgyfI70HRHmAd5WDZ1SmaFSIFoBAFCGsD9il0pBIM/CDg1Ida0WyX2kOClIZlFA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794299174;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Mime-Version:
	 Content-Transfer-Encoding:Content-Type:Date:Message-Id:To:Cc:Subject:
	 From:X-Mailer:References:In-Reply-To:X-Last-TLS-Session-Version;
	bh=hVH2nKdWYge/Mm5lz7TbcB9+sv1fB/L+SrFdf+amB/c=;
	b=PrGJbdKOg3CDR8Grpw9/Hi7nLriRlPCvGtbZQLVJkU1EUrNW+3LEI5pwWTLP8kMtHrzj
	 3pCpTSYiIE7kx7dvnDzl4JUNJfHKOmcZtUImicvHP9i8ifZ9HEorVQ8fAcMGNUk2yrp2c
	 2LiGpI+bxHPN/OZRDpJkMiCWx76dGD50FPy6qHYza6/JTloSMk7muwLwxcGOeuKacHa2e
	 MSSFkTiWcfDPbB5P1NFDbbiKFaxOjxyuIEK6HP7GGqcj+ZQpiDwkEWdvYp4Vtk2Bb1/5m
	 s4VXwY9K4PpkqelnUNEBcmgRBZOIw7/8EUB8fWl1mUVfw879o++oJnWXDwODjhocO2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=kJ+y7w8T;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CE9C60A260F
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 08:26:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3CE9C60A260F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=kJ+y7w8T
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 887BBC69153;
	Tue, 10 Nov 2026 08:26:10 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 4CB2060012;
	Tue, 10 Nov 2026 08:26:09 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8677110328531;
	Tue, 10 Nov 2026 09:26:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794299168; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=hVH2nKdWYge/Mm5lz7TbcB9+sv1fB/L+SrFdf+amB/c=;
	b=kJ+y7w8TJjoEvPS8z7mowz2u0RGqGZ7ISX7fC3zZGfIvOjiNnbpy06HDAtYfbLwIqDGAnm
	O1e3XCFUYTho6C5rZwk48RUlHPhjqota6F/kdqNKNtGahed2xapwbiKgSL/aOWiiQrEqm+
	JzAmfCbuqEOkBXIBXjgFNeC7MO+1XMYtRRaTt9Ozvf0CbmFrR8m0yygnzgvDoMJkXkqFW0
	oaqTq8PhwQtO84vb9y1upEIxIeTeyDiu+1Xrg3ZnztAFDz3pU8XCBy/JDBFkf1LxBRmS3n
	PVKkQjbEsXnbYLogZcYGAnt0gThiHHx7RSzzql2G+vmVmm/Ez/zSXw0kgDcQ+A==
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
Date: Tue, 10 Nov 2026 09:26:04 +0100
Message-Id: <DMRDYWVZ4LY9.13BL0K8BOX2VC@bootlin.com>
To: "Paul Louvel" <paul.louvel@bootlin.com>, "Liam Girdwood"
 <lgirdwood@gmail.com>, "Mark Brown" <broonie@kernel.org>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>
Cc: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>, "Thomas
 Petazzoni" <thomas.petazzoni@bootlin.com>, "Herve Codina"
 <herve.codina@bootlin.com>, "Miquel Raynal" <miquel.raynal@bootlin.com>
Subject: Re: [PATCH v5 3/3] regulator: Add TI LM51772 support
From: "Paul Louvel" <paul.louvel@bootlin.com>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3
References: <20261106-paul-lm51772-v5-0-0e83ac9711d9@bootlin.com>
 <20261106-paul-lm51772-v5-3-0e83ac9711d9@bootlin.com>
 <DMO344BLD9UQ.2X4YL7T3UZOWL@bootlin.com>
In-Reply-To: <DMO344BLD9UQ.2X4YL7T3UZOWL@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3

Hello Mark,

On Fri Nov 6, 2026 at 12:17 PM CET, Paul Louvel wrote:
> On Fri Nov 6, 2026 at 11:12 AM CET, Paul Louvel wrote:
>> +static const struct regulator_desc lm51772_regulator_template[] =3D {
>> +	{ .name =3D "vout",
>> +	  .of_match =3D of_match_ptr("vout"),
>> +	  .of_parse_cb =3D lm51772_vout_of_parse,
>> +	  .regulators_node =3D of_match_ptr("regulators"),
>> +	  .id =3D 0,
>> +	  .type =3D REGULATOR_VOLTAGE,
>> +	  .owner =3D THIS_MODULE,
>> +	  .linear_ranges =3D lm51772_voltage_ranges,
>> +	  .linear_range_selectors_bitfield =3D lm51772_voltage_ranges_sel,
>> +	  .n_linear_ranges =3D ARRAY_SIZE(lm51772_voltage_ranges),
>> +	  .n_voltages =3D 100 + 2301 + 165 + 2236,
>> +	  .vsel_reg =3D LM51772_REG_VOUT_TARGET1_LSB,
>> +	  .vsel_mask =3D LM51772_VOUT_TARGET1_MASK,
>> +	  .vsel_reg_oversize =3D true,
>> +	  .vsel_range_reg =3D LM51772_REG_MFR_SPECIFIC_D8,
>> +	  .vsel_range_mask =3D LM51772_SEL_FB_DIV20,
>> +	  .active_discharge_reg =3D LM51772_REG_MFR_SPECIFIC_D2,
>> +	  .active_discharge_mask =3D LM51772_DISCHARGE_CONFIG1 | LM51772_DISCH=
ARGE_CONFIG0,
>> +	  .active_discharge_on =3D
>> +		  FIELD_PREP_CONST(LM51772_DISCHARGE_CONFIG1, 1) |
>> +		  FIELD_PREP_CONST(LM51772_DISCHARGE_CONFIG0, 1),
>> +	  .active_discharge_off =3D
>> +		  FIELD_PREP_CONST(LM51772_DISCHARGE_CONFIG1, 0) |
>> +		  FIELD_PREP_CONST(LM51772_DISCHARGE_CONFIG0, 0),

Please find the comment I made to my own patch below.

>
> Maybe would it be better if the core could also change the active dischar=
ge
> strength:
>
>   int (*set_active_discharge)(struct regulator_dev *rdev, bool enable,
>             int strength_uA);
>
> That would remove the need for introducing a vendor-specific property:
> 'ti,active-discharge-strength-microamp'.
>

Let me know what you think.

Thanks.
Best regards,
--=20
Paul Louvel, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

