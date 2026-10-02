Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ED08390CA3
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 12:34:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790944458; cv=none; b=TRmEPpi9xcUsX4H4zH0mmLGBWhFxQqwdGXyGRmyWSS9egJvZHuN6JfdG1lqVvx9gGsmSRIxUlN9dGl6uXu4O4X8zmSsMogI23ke0J1XL9kTtgFpVh8wr0rt2Oor95eDja86akpIHENv2gdWCX3BPW/KKiPY1zxJEAObKrrxu30w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790944458; c=relaxed/simple;
	bh=SvXZMzw6BE1r6vOuXuuASJvC9M1d6NZ6vywaoBOMgj8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=T7/eh2NfsuQhOGSBTNS/0pI+M0kv94IgGUXyTCCgavFodZSL7CCWtIs4NjJtuovwy2IrRG84wHcmhn776AdAcWs7wSaRZMiSAEEKCNJBfKM7wCwzacE7LaFOrV91cWgx7ZLdyh4WHkD6FzrjFjbs0Uh54y/k9WxEUlZin7pOX3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BkjYMDMc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BkjYMDMc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3699B1F000FF;
	Fri,  2 Oct 2026 12:34:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790944456;
	bh=HaRlx89/YCJKq+iiqj3O4qkK79gw+8549i5bxgzW9C8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=BkjYMDMcodUGT2H3p40/slxRe4o7l+h2KKsAEdEl1T4ceTiL06z0gcdRDV8a9hnGI
	 KoA0mVsVmsojY5KP5j5mavRZoGmmGSCc0twB2hWCYQD8NH9sUCVtOajxLcR59IBECq
	 /Zj0dOYDVUcBUSm35Jm0dxROFLYApysZ/CQlSddA+xq866FABP1XrgPgQUySeI4bCo
	 VLNIQkkPVpzXKUcJn66rY0GrQOMiYheM6XGNAlJS5xyL2WR/LaEPvN6P5mq++pALv9
	 rgBXwtM42kHrsB6GZ1zMmTQBCXMigGOrrkmPQ5IHmH4KhESfsUI4FCH9iEW3IGc2lt
	 ScNwWiN8YX5jA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 07/15] mtd: spi-nor: Allow configuring the actual number
 of dummy cycles
Reply-To: sashiko-reviews@lists.linux.dev
To: "Pratyush Yadav" <pratyush@kernel.org>, "Richard Weinberger" <richard@nod.at>, "Vignesh
 Raghavendra" <vigneshr@ti.com>, "Takahiro Kuwano" <takahiro.kuwano@infineon.com>, "Miquel
 Raynal" <miquel.raynal@bootlin.com>, "Michael Walle" <mwalle@kernel.org>
Cc: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>, linux-mtd@lists.infradead.org, "Steam
 Lin" <STLin2@winbond.com>, linux-kernel@vger.kernel.org
In-Reply-To: <20261002-winbond-master-spi-nor-w35t-v1-7-a22a2f95c26e@bootlin.com>
References: <20261002-winbond-master-spi-nor-w35t-v1-0-a22a2f95c26e@bootlin.com>
 <20261002-winbond-master-spi-nor-w35t-v1-7-a22a2f95c26e@bootlin.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 02 Oct 2026 12:34:15 +0000
Message-Id: <20261002123416.3699B1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] mtd: spi-nor: volatile dummy cycle hardware config lost on resume
--

commit 55807f7f87f4c66c05c4d5c678570e0e6e21c0c9
Author: Miquel Raynal <miquel.raynal@bootlin.com>

mtd: spi-nor: Allow configuring the actual number of dummy cycles

This commit introduces a callback to configure the actual number of dummy
cycles expected by the SPI NOR chip. It ensures that the chip is configured
properly when the number of dummy cycles is maximized for the fastest read
variant advertised by the SFDP tables.

> Crete a callback to configure the chip for expecting a specific number
> of dummy cycles.

[Severity: Low]
This isn't a bug, but there's a typo (Crete) in the commit message.

> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index 381bbc13f82ff..f45c2c07d0245 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -2636,7 +2636,17 @@ static int spi_nor_setup(struct spi_nor *nor,
>  		return err;
>  	}
> =20
> -	return spi_nor_set_addr_nbytes(nor);
> +	err =3D spi_nor_set_addr_nbytes(nor);
> +	if (err)
> +		return err;
> +
> +	if (nor->params->set_dummy) {
> +		err =3D nor->params->set_dummy(nor, nor->read_dummy);
> +		if (err)
> +			return err;
> +	}

[Severity: High]
Is the dummy cycle hardware configuration lost during a suspend and resume
cycle?

When a SPI NOR chip loses power during system suspend, its volatile dummy
cycle configuration register is reset to its power-on default.

Upon system resume, spi_nor_resume() calls spi_nor_init() to re-initialize
the volatile state of the chip:

drivers/mtd/spi-nor/core.c:spi_nor_resume() {
	...
	/* re-initialize the nor chip */
	ret =3D spi_nor_init(nor);
	...
}

However, spi_nor_init() does not restore the dummy cycle configuration using
nor->params->set_dummy().

Since the software state (nor->read_dummy) retains the custom dummy cycle
count while the hardware reverts to the default count, will subsequent reads
be misaligned and lead to data corruption?

> +
> +	return 0;
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261002-winbond-ma=
ster-spi-nor-w35t-v1-0-a22a2f95c26e@bootlin.com?part=3D7
