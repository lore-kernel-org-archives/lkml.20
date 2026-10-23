Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792749775;
	b=bLxprD3pprUalQfwoKVSsa36XbKqNKs1hcv0tVC4UwkiStZnqQDgnrgy5zhoQKuGaad/
	 3UewwLZOOeKzxjBgpIw1m10jkxmoysBeQjJo6wju7A2t/aarpB3iJail/qllLtFuMibyP
	 V98YpSNH7X+nYgsY0+jqz+nxQwlsoLrC+pLuteQT5M5jKKG25XTC13UtS+EyOd0Wzs9N/
	 f5kR57ZElPkMlH9BmFS7DHYFBYWpafQqByg/kt2JblntvY8x/5/k4Q2SeeelZTGmkH40H
	 r80OVo0pSlAaIlR4PBIrz1O60Pb/tkSKrshPshzpg9mdF+i+QOTxrU+ieXs4RAhMiTg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792749775;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Mime-Version:
	 Content-Transfer-Encoding:Content-Type:Date:Message-Id:Cc:Subject:
	 From:To:X-Mailer:References:In-Reply-To:X-Last-TLS-Session-Version;
	bh=Y8jCuwd+cBF01LG4mM13wueuop+EtbrKbBADY0cbfdI=;
	b=HidZj+grFSWhFp43QiiGEnsPw9IBPlkxteuj/mgsPQlzzSIzLojmdG5rvrnNeCGbCnvC
	 D1WxBfwr/BPAoTZjkZ5yq07vjhHRT9shm1Ufg5J8y1nAdo5MmwrP960V3BFSuprGusvuD
	 ObSDz2c0YMpv8Tix6lLUEt6cRBP4DkG39+jnXjYqzXB7N8UvLd3q+iw5A6MxbZZpugWAd
	 KnHigN3mluZG4iArmGjUt9pMcKWo+R4JX7X+8chNKdco7kHhsN8ow5AWp3dcV7uFrGhgN
	 Mca1s6veim74X73BFgpGbLWEZCcNzoqkcN0NSKLFI7uJQtKBvD8YRh4OPe9+lo0B+kg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=qDMVlbUT;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB992606A31A;
	Fri, 23 Oct 2026 10:02:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EB992606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=qDMVlbUT
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 4AB124E412D4;
	Fri, 23 Oct 2026 10:02:51 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 152DC60398;
	Fri, 23 Oct 2026 10:02:51 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A9C8110328E83;
	Fri, 23 Oct 2026 12:02:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1792749770; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Y8jCuwd+cBF01LG4mM13wueuop+EtbrKbBADY0cbfdI=;
	b=qDMVlbUTVHv3yzSFPiBisZN81CmmU1pjBsuERRY7mAFov4uEVK3ir0fOsF4dsdx+x9Higc
	i93n/x9R9BX6KPIROFlqivbz8DvA6zKgyPuzOVFKK9ZFYy54aYW/uHGjJf/69n4Bf26GiJ
	GPnLEDlvsfrEzVHIgrPNm3OC+quwf6wTuYunmXI8Xh9p/Wi1OJKpaxs27FkY/NRug1Pqup
	OKXBh5oXJmyOaGojFENNh1eFmD7/2xwN0jitFbvirKYDQzZji+5lyXrqR5udEcU4xd3UDR
	N7JewPNMI2uLbcJsEpoCF3o6jRo2nvtAjTcgHQk2bSjctX8gJNT3WE02W3WoNQ==
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
Date: Fri, 23 Oct 2026 12:02:46 +0200
Message-Id: <DMC4R59FLPFW.2VD3S7QQHIIQA@bootlin.com>
Cc: "Liam Girdwood" <lgirdwood@gmail.com>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley"
 <conor+dt@kernel.org>, <linux-kernel@vger.kernel.org>,
 <devicetree@vger.kernel.org>, "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>, "Herve Codina" <herve.codina@bootlin.com>,
 "Miquel Raynal" <miquel.raynal@bootlin.com>
Subject: Re: [PATCH 4/5] regulator: Support regulators where the voltage
 selector spans two registers
From: "Paul Louvel" <paul.louvel@bootlin.com>
To: "Mark Brown" <broonie@kernel.org>, "Paul Louvel"
 <paul.louvel@bootlin.com>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3
References: <20261021-paul-lm51772-v1-0-25f0ffbffa8d@bootlin.com>
 <20261021-paul-lm51772-v1-4-25f0ffbffa8d@bootlin.com>
 <atpGAeQIzOBnYzZS@sirena.org.uk>
In-Reply-To: <atpGAeQIzOBnYzZS@sirena.org.uk>
X-Last-TLS-Session-Version: TLSv1.3

On Thu Oct 22, 2026 at 7:21 PM CEST, Mark Brown wrote:
> On Wed, Oct 21, 2026 at 12:27:45PM +0200, Paul Louvel wrote:
>> Some devices uses 8-bit registers to store the voltage selector across
>> two registers: one for the least significant bits and one for the most
>> significant bits.
>
>> +static int set_oversize_voltage_sel(struct regulator_dev *rdev, unsigne=
d int sel)
>> +{
>> +	int val_bytes =3D regmap_get_val_bytes(rdev->regmap);
>> +	__le16 val;
>> +
>> +	if (val_bytes !=3D 1)
>> +		return -EINVAL;
>> +
>> +	val =3D cpu_to_le16(sel);
>> +
>> +	return regmap_bulk_write(rdev->regmap, rdev->desc->vsel_reg, &val, 2);
>> +}
>
> This ignores the shift and mask but the get still pays attention to them
> due to code sharing.  Either there should be checks that reject them
> like we have for val_bytes or there should be a read/modify/write here,
> obviously the former is much easier and that'd be totally fine.  IIRC
> there's some existing drivers we could convert but that's a separate
> thing.

set_oversize_voltage_sel() does not apply the shift itself because both cal=
lers
already shift sel into position before calling it [1][2].

Using two separate regmap_update_bits() calls, one per register, would be
equally simple, and it would guarantee that reserved bits outside vsel_mask=
 are
not overwritten on devices that are sensitive (not the case for the LM51772=
).

[1]: https://elixir.bootlin.com/linux/v7.3/source/drivers/regulator/helpers=
.c#L222
[2]: https://elixir.bootlin.com/linux/v7.3/source/drivers/regulator/helpers=
.c#L285

Thanks.
Best regards,
--=20
Paul Louvel, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

