Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7834636729D
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 12:29:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790944165; cv=none; b=FfzcY7Ckt7Fpg2vnKG7Gmj+sYB5vKV1gm4b/Ps9q/oOoKpiaaWQ/yHyJQ+WjB4HXPSyhe8AG9bZkSQOtdZpIalVNWsx3Jg4fsWEO8vHXbcoM+OqqZbI4OCOJz1N8mMrG5yjuT2oRAlUIhJG29qDiJk8/zDv4BFISYmfyG5CVXDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790944165; c=relaxed/simple;
	bh=/SmbkDQpZHuJT90gfdRgTTwptHj6UtLs+VE6WKjkUZU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=OGJJkEOVxJYspYrp77cIN86irBtHrCc5rcoSr6wsXiAIUNk/u0e4fuXHgNlnakrfQKLEu+a86/ukocy0LO+Bci02WEBE7jEWVjOWP1vMgkgCu7Y5+eJi0HS1JPjjchsBCyCl+zHSAHlEEYEXwHdkVjHiw6MSuM1ftxjiSXxn2lM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AvF3DKOr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AvF3DKOr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7735C1F000FF;
	Fri,  2 Oct 2026 12:29:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790944164;
	bh=brwoog3BfsxnFj5jfLmGicwdCrEeJjaJKW1IPoCrBMI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=AvF3DKOrinV6x/duYGjajWGIMVpKWo2zS4B7aQUTg4xHHvNdZ44pu5OkIPMphrJlA
	 xQqJcEabf/psPRZ6umqNupARzgY4w+y07P6iWxOif+efIbrEyY/iw7+FhrskR8vEHK
	 Xr+a5ykPbTjahiN848KYcYcpUlpgVDPCLqlHgQqajPiwTXvkHHupNX4W0AxB47BVCt
	 gZiPP8w1t87pppUJFc1uD5VoGiQb8WqpV9XqaI1HMI5S+f0WtZaZR/7v9gsm0mNNYd
	 f3s4klF9x/bsymPN7kDVSYR+mfz7lgVblu/dgTpWmaAiq542YQSQ9GuMrFH1lszbTg
	 UAbNf7QTaEy9A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 08/15] mtd: spi-nor: Fix SWP for octal DTR chips
Reply-To: sashiko-reviews@lists.linux.dev
To: "Takahiro Kuwano" <takahiro.kuwano@infineon.com>, "Miquel Raynal" <miquel.raynal@bootlin.com>, "Richard
 Weinberger" <richard@nod.at>, "Vignesh Raghavendra" <vigneshr@ti.com>, "Michael
 Walle" <mwalle@kernel.org>, "Pratyush Yadav" <pratyush@kernel.org>
Cc: "Steam Lin" <STLin2@winbond.com>, linux-mtd@lists.infradead.org, "Thomas
 Petazzoni" <thomas.petazzoni@bootlin.com>, linux-kernel@vger.kernel.org
In-Reply-To: <20261002-winbond-master-spi-nor-w35t-v1-8-a22a2f95c26e@bootlin.com>
References: <20261002-winbond-master-spi-nor-w35t-v1-0-a22a2f95c26e@bootlin.com>
 <20261002-winbond-master-spi-nor-w35t-v1-8-a22a2f95c26e@bootlin.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 02 Oct 2026 12:29:23 +0000
Message-Id: <20261002122923.7735C1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] mtd: spi-nor: uninitialized stack memory read causes spurious -EIO=
 in SR2 check
--

commit 7f40280ba9ff306f160cda218a293f8e370be331
Author: Miquel Raynal <miquel.raynal@bootlin.com>

mtd: spi-nor: Fix SWP for octal DTR chips

During the recent rework of status registers handling, we mostly focused
on quad capable devices, partially skipping ODTR devices in our mental
model. It seems that many (if not all?) ODTR devices have no SR2 read
opcode and have other control mechanisms. Because of that, the current
support in swp.c is broken, because reading back the written value may
or may not lead to the expected result.

Let's extend the _careful() suffix to the helper reading back the values
and comparing them. Maybe this "carfulness" will have to be moved back
to the core, it is a bit early to state it. For now, let's just make
sure that we read back 0s without errors when virtually accessing SR2 on
those chips.

[ ... ]

> diff --git a/drivers/mtd/spi-nor/swp.c b/drivers/mtd/spi-nor/swp.c
> index 7e667e4ca84d5..e9cf2ca232341 100644
> --- a/drivers/mtd/spi-nor/swp.c
> +++ b/drivers/mtd/spi-nor/swp.c
> @@ -240,6 +240,25 @@ static int spi_nor_read_sr1_and_sr2_careful(struct s=
pi_nor *nor, u8 *sr)
>  	return spi_nor_read_sr2_careful(nor, &sr[1]);
>  }
> =20
> +static int spi_nor_write_sr1_and_sr2_and_check_careful(struct spi_nor *n=
or, const u8 *sr)
> +{
> +	u8 tmp[2];

[Severity: High]
Does this allocate uninitialized memory on the stack?

> +	int ret;
> +
> +	ret =3D spi_nor_write_sr1_and_sr2(nor, sr);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D spi_nor_read_sr1_and_sr2_careful(nor, tmp);
> +	if (ret)
> +		return ret;
> +
> +	if (sr[0] !=3D tmp[0] || sr[1] !=3D tmp[1])

[Severity: High]
Does this unconditionally compare tmp[1] against sr[1] even when it contains
uninitialized stack data?

In the call chain spi_nor_read_sr1_and_sr2_careful() ->
spi_nor_read_sr2_careful(), if the device lacks a read_sr2 opcode and is not
quad-enabled, the function falls back to returning 0 without populating the
sr2 value.

If tmp[1] remains uninitialized, this check might fail and return -EIO
sporadically for devices lacking a read_sr2 opcode, such as the ODTR devices
targeted by this patch. Could this lead to unpredictable failures during
lock and unlock operations?

Would zero-initializing tmp avoid this issue?

> +		return -EIO;
> +
> +	return 0;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261002-winbond-ma=
ster-spi-nor-w35t-v1-0-a22a2f95c26e@bootlin.com?part=3D8
