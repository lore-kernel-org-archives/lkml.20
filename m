Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BE564349B9
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 10:52:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789123967; cv=none; b=Uvh/DG5dBrKnI0ijSDiA7QrjU0TnrblNdzvAyfLQMludKB9vsXxON9NKkudPK2ufMKZwC05Zsfi5SJVPTWuHAGAZK1MADDAkCMbY6WVOwHYA86Pma4NmZcJkIPzcxv7SWJT0ppySVW8O4ab+vkYPBMdIZD4fUg+t+yok+xqgNhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789123967; c=relaxed/simple;
	bh=JWoIoc8tLXrJ3xuz+3+ViM9nOMpwaViwTZKv28U6Sb8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=gO9LmGb2Jrc3uIUzy1+nS43LMyGHkuc67qInUMBw//MsTCTBolQb4N9/SihDzMwJc5c2K5uE+V8d1Yx2o9mHycEUYkO2OuUe16NDI8O203nfODo1xutnLG1Jb9WjIIDDvYrTy+xoSEloDFIFnN28l0YXuZfW2Fb0NRaDrAp3ZA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oYsWDOMJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oYsWDOMJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 408171F00893;
	Fri, 11 Sep 2026 10:52:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789123965;
	bh=c6Cwwnk73gp5XSyU0doZGD+8vzCu7Q6LPoYV28cPnXw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=oYsWDOMJ0l53BeGZelTynmCuUtj16bIGAuqh5RhUpbj7bzpwvUzL3Fbn+8EZVr/aW
	 pShpSifEYG0g8AHLHMFYQ5E0ecNBcDwOQgnT0+N2T5T0NvhDy22OF3hhUMrTv6Vtaf
	 7CGG8iwgCxZW25csAKC5LxwGkHbl6oaAvTeWwMWW3C2UsfqwqA+572ZDQCMOST8Wz+
	 h1hUeptKMSj1CptgM0QdQUMtmNU5jfglH3QlVxlqPiyL6dnzeXcOVsKxkrRjSrg4Ky
	 6l96I6Mk32XGjCzF6IiuPxyEmqNBuAV/okbkApdKI2OI98oxgKqRwD81iW2ccF6aYY
	 BZ2/AA182S9iw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] mtd: spi-nor: Fix quad-enable for flashes with QER
 bit in SR1
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vignesh Raghavendra" <vigneshr@ti.com>, "Pratyush Yadav" <pratyush@kernel.org>, "Michael
 Walle" <mwalle@kernel.org>, "Miquel Raynal" <miquel.raynal@bootlin.com>, "Takahiro
 Kuwano" <takahiro.kuwano@infineon.com>, "Richard Weinberger" <richard@nod.at>
Cc: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>, linux-kernel@vger.kernel.org, "Steam
 Lin" <STLin2@winbond.com>, linux-mtd@lists.infradead.org, "Jon Hunter" <jonathanh@nvidia.com>
In-Reply-To: <20260911-perso-fix-spi-nor-qe-mxic-v2-1-70c324e9f30e@bootlin.com>
References: <20260911-perso-fix-spi-nor-qe-mxic-v2-1-70c324e9f30e@bootlin.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 11 Sep 2026 10:52:44 +0000
Message-Id: <20260911105245.408171F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] spi_nor_read_sr1_and_sr2() leaves sr[1] uninitialized when read_sr=
2 is unsupported, leading to uninitialized stack memory use in callers and =
spurious -EIO errors.
--

commit d557e6d5e442dbe4ee4d997bc0f3bb6190d5ba2c
Author: Miquel Raynal <miquel.raynal@bootlin.com>

mtd: spi-nor: Fix quad-enable for flashes with QER bit in SR1

Some flashes do set BFPT_DWORD15_QER_SR1_BIT6, which means they do not
have an SR2 to read from/write to. The generic QE helper has forgotten
about the Macronix case, which causes booting to fail. This fix makes
sure SR2 reads just return 0 if unsupported to accommodate this situation.

Link: https://lore.kernel.org/linux-mtd/178876719232.3543902.14451625037676=
421254.b4-ty@b4/T/#m5bc4ba6776436f2870ced0eb5789d229037ad840

> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index e2b6efafdd8d0..7bb197df5585b 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -864,7 +865,10 @@ int spi_nor_read_sr1_and_sr2(struct spi_nor *nor, u8=
 *sr)
>  	if (ret)
>  		return ret;
> =20
> -	return spi_nor_read_sr2(nor, &sr[1]);
> +	if (nor->params->opcodes.read_sr2)
> +		ret =3D spi_nor_read_sr2(nor, &sr[1]);
> +
> +	return ret;
>  }

[Severity: High]
Does this code leave sr[1] uninitialized when read_sr2 is unsupported?

In spi_nor_write_sr1_and_sr2_and_check(), an uninitialized u8 tmp[2] is
passed to spi_nor_read_sr1_and_sr2():

drivers/mtd/spi-nor/core.c:spi_nor_write_sr1_and_sr2_and_check() {
	u8 tmp[2];
	...
	ret =3D spi_nor_read_sr1_and_sr2(nor, tmp);
	if (ret)
		return ret;

	if (sr[0] !=3D tmp[0] || sr[1] !=3D tmp[1])
		return -EIO;
	...
}

For chips without SR2, tmp[1] remains uninitialized stack garbage and the
comparison sr[1] !=3D tmp[1] can evaluate to true, returning a spurious -EIO
error. This causes quad-enable and device probing to fail for the exact
flashes the patch is attempting to fix.

Also, does this affect spi_nor_otp_lock_sr2()?

drivers/mtd/spi-nor/otp.c:spi_nor_otp_lock_sr2() {
	u8 sr[2];
	...
	ret =3D spi_nor_read_sr1_and_sr2(nor, sr);
	if (ret)
		return ret;

	/* no need to write the register if region is already locked */
	if (sr[1] & lock_bit)
		...
}

Here, sr[1] contains garbage, which is evaluated in the lock condition
check and potentially modified and written back to the device.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260911-perso-fix-=
spi-nor-qe-mxic-v2-1-70c324e9f30e@bootlin.com?part=3D1
