Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECE423451C8
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 14:22:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789136577; cv=none; b=iN+Xptc/rGFLKRcp/j6DDOKSEinkixC+o5I2fcj+ig1aSXlLupZ80iqr5EAkycs1gkGRI7Lk/cPkkZyZtvUpQWW6JmuCfHarkopHqFR+yPG9onWmqAmGtfiR+kgW5jYv+dt6dVBn60D2lXLLDiBTvo0Vcw6lOJ3mHhuQc/pSa/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789136577; c=relaxed/simple;
	bh=QOudFdO3YKl8hOGZVWP6/ngPtXE9WmKX1yfNbZ8cizo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=EcU8DHrPK1DyAQ9XOgonfqapra5Vm2Znr9AuKRoY4MmGpKyY+N5HV/LqtYL4yfwUBjMZXPnLgVvvUvY7ygMxcWW0TTa5NfTySx23xk5U5GCmLYUTA9zUgumlemscJEV8C0vb2fFTJih6vQVV+AWSgxUY2j9F/z7231VOXXmaXfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F/wg20jJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F/wg20jJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF8021F000FF;
	Fri, 11 Sep 2026 14:22:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789136575;
	bh=0VmbmJtI47Wz1vz2OJjXjhLSnpo7E61Rpd6tNIPeOLs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=F/wg20jJfMC9PIBkYVjCkjc1rPH5BPSp9ZiP11n3ZljXYx1UoPZTBr9LVDpgmkN2u
	 FDjokAPQPumBvrI1WE3UUlQolYBBHn6cgyF1morFscxUs7tfl+Rk2j8MZro5tWJP98
	 j07HBPmZubF6FHwyk3QiG4IP2+XL5nIXOcdt0rdrJcer3dAFXakfdaGL4wzbE/73fG
	 4faHNCZ6RZ7SDZoF/zqH3kg1gBWyQCKgPkwSu4GHRoKTkFszndbg9K51JtzSonc/fL
	 IzQfGk1u+nT5HhHkhk2+VUj251ftZKRrlpTkEpwXANJBqa9KYk1uNsAuGPuCINGOym
	 3MbvI7Ay9HVQw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3] mtd: spi-nor: Fix quad-enable for flashes with QER
 bit in SR1
Reply-To: sashiko-reviews@lists.linux.dev
To: "Pratyush Yadav" <pratyush@kernel.org>, "Takahiro Kuwano" <takahiro.kuwano@infineon.com>, "Miquel
 Raynal" <miquel.raynal@bootlin.com>, "Michael Walle" <mwalle@kernel.org>, "Richard
 Weinberger" <richard@nod.at>, "Vignesh Raghavendra" <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>, "Jon
 Hunter" <jonathanh@nvidia.com>, linux-kernel@vger.kernel.org, "Steam Lin" <STLin2@winbond.com>
In-Reply-To: <20260911-perso-fix-spi-nor-qe-mxic-v3-1-2ecaefb2ef2c@bootlin.com>
References: <20260911-perso-fix-spi-nor-qe-mxic-v3-1-2ecaefb2ef2c@bootlin.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 11 Sep 2026 14:22:54 +0000
Message-Id: <20260911142254.EF8021F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Spurious -EIO failure during write verification in spi_nor_write_s=
r1_and_sr2_and_check() for flashes with QER=3D4 or 5 (e.g., BFPT_DWORD15_QE=
R_SR2_BIT1_NO_RD).
--

commit 65f885da367814b98529830d97438f96b6f29aa0
Author: Miquel Raynal <miquel.raynal@bootlin.com>

mtd: spi-nor: Fix quad-enable for flashes with QER bit in SR1

This commit attempts to fix quad-enable for flashes lacking an SR2 register
by having the generic helper return 0 when SR2 reads are unsupported. It al=
so
updates the SFDP parsing step to assert that no chip has an SR2 write path
without an SR2 read path.

Reported-by: Jon Hunter <jonathanh@nvidia.com>
Closes: https://lore.kernel.org/linux-mtd/178876719232.3543902.144516250376=
76421254.b4-ty@b4/T/#m5bc4ba6776436f2870ced0eb5789d229037ad840
Fixes: 63489002d397 ("mtd: spi-nor: Refactor Read Status/Write Status suppo=
rt")

> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index e2b6efafdd8d0..62b53933927f2 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -864,7 +865,12 @@ int spi_nor_read_sr1_and_sr2(struct spi_nor *nor, u8=
 *sr)
>  	if (ret)
>  		return ret;
> =20
> -	return spi_nor_read_sr2(nor, &sr[1]);
> +	if (nor->params->opcodes.read_sr2)
> +		ret =3D spi_nor_read_sr2(nor, &sr[1]);
> +	else
> +		sr[1] =3D 0;

[Severity: High]
This is a pre-existing issue, but does forcing sr[1] to 0 here cause a
spurious -EIO failure downstream during write verification?

For flashes with QER=3D4 or 5 (e.g., BFPT_DWORD15_QER_SR2_BIT1_NO_RD), SFDP
parsing disables reading SR2 (read_sr2 =3D 0) but retains a 16-bit write pa=
th
via write_sr1_and_sr2 and sets qe_mask[1] =3D BIT(1).

During quad enable, sr[1] gets populated with BIT(1) and is written using t=
he
16-bit command. However, spi_nor_write_sr1_and_sr2_and_check() verifies the
write by calling this function, which forcefully sets tmp[1] =3D 0.

The check if (sr[0] !=3D tmp[0] || sr[1] !=3D tmp[1]) then compares sr[1]=
=3D0x02
against tmp[1]=3D0x00, fails, and returns -EIO. This leaves probing complet=
ely
broken for these flashes.

> +
> +	return ret;
>  }
> =20
> diff --git a/drivers/mtd/spi-nor/sfdp.c b/drivers/mtd/spi-nor/sfdp.c
> index c21a6953db960..641f17ad51a09 100644
> --- a/drivers/mtd/spi-nor/sfdp.c
> +++ b/drivers/mtd/spi-nor/sfdp.c
> @@ -656,7 +656,8 @@ static int spi_nor_parse_bfpt(struct spi_nor *nor,
> =20
>  	/* opcodes sanity check */
>  	WARN_ON(!params->opcodes.read_sr1 ||
> -		(!params->opcodes.write_sr1 && !params->opcodes.write_sr1_and_sr2));
> +		(!params->opcodes.write_sr1 && !params->opcodes.write_sr1_and_sr2) ||
> +		(!params->opcodes.read_sr2 && params->opcodes.write_sr2));

[Severity: High]
This isn't a bug introduced by this patch, but does this sanity check fail =
to
account for write_sr1_and_sr2?

A chip can lack read_sr2 (read_sr2 =3D 0) and write_sr2 (write_sr2 =3D 0), =
passing
this WARN_ON, but still possess a valid SR2 write path via write_sr1_and_sr=
2.

For QER=3D4 or 5, this means we can write to SR2 without being able to read=
 it,
which the WARN_ON fails to catch, giving a false sense of safety.

> =20
>  	dword =3D bfpt.dwords[SFDP_DWORD(16)] & BFPT_DWORD16_4B_ADDR_MODE_MASK;
>  	if (SFDP_MASK_CHECK(dword, BFPT_DWORD16_4B_ADDR_MODE_BRWR))

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260911-perso-fix-=
spi-nor-qe-mxic-v3-1-2ecaefb2ef2c@bootlin.com?part=3D1
