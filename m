Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C52394779A4
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 14:18:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789395484; cv=none; b=ZC4n4RvpMaaYyVH3BZBEdpYTP+KMltJ2FLzR4EAdCYcWHl1fp9vKXQV9daWkEazqxwmF9rUlfV3YxMd9PJiUhSuEpIJ5kLtvOIvMVSveI2Kq917BgqreVPYUyu3ANnl8MwE8+Gy+0R0LV4bynYwKTjPH70jQwUtbnR3wVFIWWmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789395484; c=relaxed/simple;
	bh=R0JXs4K4B17uiKX90Z6XfheFYV7xCpbbVkHcFpWkp9c=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=N/9AHiqjFGhOGoR12HP+yyLYmYzltzlom//ex5sgQr2DEFPbEAbZpuAC9nmTyB7D2O8Kixl46wNW6PplKC6BExc+Lx/KOzpHr4BFVDYJumyN+wV4LF9Rf1dGGAm7kM54g2bIg50gLRc+Y98Wtl2ucJGGdQ1Wz1d+djBHCYo2QIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aZS/QKaS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aZS/QKaS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E44D1F000FF;
	Mon, 14 Sep 2026 14:18:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789395482;
	bh=yjxwIJVTV73FYMBOQAx7yyt+IObU99d1wGVsm7maRqM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=aZS/QKaSVT6eQDgMBxSxxKY0WvUpo1BYhZ7Dr6bdyo/W/B4UFaanpXA1I1BNyCfiJ
	 lClOouf4aqoqQ5Zo4FdDhnrEIV5mOq6qo99rZIlVQPMJXRSenkVdfZ/o9N2P929I9j
	 EFlaGLxGfjI7zX7i3GDs+coAkCxsnt/SaZTctekEZiREFk+TNylJLdLIpG0cQ3oBKK
	 nzjVUP9Nz6zhTRzqkVBZWxPhuSQ4v2kEKyEQe3FCigUV4suziUVL4iiJSJBnmPNsXt
	 1HJV9fPMgLgj+t6uJBq53IQJit0xHoWGAaVAtfdfZdtD8EifkBCedQzG+2bhe56g25
	 wYlv7+/iRxDRg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] mtd: spi-nor: issi: Add support for is25wx01g
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?TnVubyBTw6E=?= <nuno.sa@analog.com>, linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: "Pratyush Yadav" <pratyush@kernel.org>, "Takahiro Kuwano" <takahiro.kuwano@infineon.com>, "Miquel
 Raynal" <miquel.raynal@bootlin.com>, "Vignesh Raghavendra" <vigneshr@ti.com>, "Michael
 Walle" <mwalle@kernel.org>, "Richard Weinberger" <richard@nod.at>
In-Reply-To: <20260914-mtd-spi-nor-new-issi-chip-v2-2-3cd4d7e434b2@analog.com>
References: <20260914-mtd-spi-nor-new-issi-chip-v2-0-3cd4d7e434b2@analog.com>
 <20260914-mtd-spi-nor-new-issi-chip-v2-2-3cd4d7e434b2@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 14 Sep 2026 14:18:01 +0000
Message-Id: <20260914141802.0E44D1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Locking operations (spi_nor_sr_lock/unlock) unconditionally fail w=
ith -EINVAL because read_sr2 is set to 0.
- [High] Missing Flag Status Register (FSR) handling leaves the WEL bit set=
, causing lock operations to fail with spurious -EIO errors.
--

commit e7f55264e73008ad9ab4912b2a3228b2d1b7b7bd
Author: Nuno S=C3=A1 <nuno.sa@analog.com>

mtd: spi-nor: issi: Add support for is25wx01g

Add support for the ISSI IS25WX01G, a 1 Gbit (128 MiB) octal NOR flash.
The part is fully described by SFDP, so only the flash ID and a small
post_bfpt fixup are needed.

> diff --git a/drivers/mtd/spi-nor/issi.c b/drivers/mtd/spi-nor/issi.c
> index 2f057d731df2a..a0b46c298d53c 100644
> --- a/drivers/mtd/spi-nor/issi.c
> +++ b/drivers/mtd/spi-nor/issi.c
> @@ -29,6 +29,24 @@ static const struct spi_nor_fixups is25lp256_fixups =
=3D {
>  	.post_bfpt =3D is25lp256_post_bfpt_fixups,
>  };
> =20
> +static int is25wx01g_post_bfpt_fixups(struct spi_nor *nor,
> +				      const struct sfdp_parameter_header *bfpt_header,
> +				      const struct sfdp_bfpt *bfpt)
> +{
> +	/*
> +	 * There is no Status Register 2 and no 35h command. And WRITE STATUS
> +	 * REGISTER takes a single data byte.
> +	 */
> +	nor->params->opcodes.write_sr1_and_sr2 =3D 0;
> +	nor->params->opcodes.read_sr2 =3D 0;

[Severity: High]
Does explicitly zeroing read_sr2 break the generic locking support?

When locking or unlocking the flash, the core calls
spi_nor_write_sr1_and_sr2_and_check(), which delegates to
spi_nor_read_sr1_and_sr2() to verify the lock bits. This helper
unconditionally calls spi_nor_read_sr2().

If read_sr2 is 0, spi_nor_read_sr2() immediately returns -EINVAL, causing
any attempt to lock or unlock the flash to unconditionally fail.

> +
> +	return 0;
> +}
> +
> +static const struct spi_nor_fixups is25wx01g_fixups =3D {
> +	.post_bfpt =3D is25wx01g_post_bfpt_fixups,
> +};
> +
[ ... ]
> @@ -120,6 +138,12 @@ static const struct flash_info issi_nor_parts[] =3D {
>  		.id =3D SNOR_ID(0x9d, 0x70, 0x19),
>  		.name =3D "is25wp256",
>  		.flags =3D SPI_NOR_QUAD_PP,
> +	}, {
> +		/* is25wx01g */
> +		.id =3D SNOR_ID(0x9d, 0x5b, 0x1b),
> +		.sector_size =3D SZ_128K,
> +		.flags =3D SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB |
> +			 SPI_NOR_4BIT_BP | SPI_NOR_BP3_SR_BIT6,

[Severity: High]
Does enabling locking support without a Flag Status Register (FSR) clearing
mechanism cause spurious -EIO errors?

Because the driver enables SPI_NOR_HAS_LOCK without adding a custom late_in=
it
or ready hook to clear the FSR (unlike the Micron implementations), the Wri=
te
Enable Latch (WEL) bit can remain stuck at 1 in the hardware register.

When spi_nor_write_sr1_and_sr2_and_check() reads back the status register to
verify the lock bits, it reads WEL=3D1 while the intended buffer has WEL=3D=
0. This
strict verification fails and returns -EIO, masking actual hardware status
errors.

For reference, the strict check in spi_nor_write_sr1_and_sr2_and_check()
looks like this:

    if (sr[0] !=3D tmp[0] || sr[1] !=3D tmp[1])
        return -EIO;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260914-mtd-spi-no=
r-new-issi-chip-v2-0-3cd4d7e434b2@analog.com?part=3D2
