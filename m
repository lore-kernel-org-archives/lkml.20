Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FDC63ACA6A
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 09:11:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789722676; cv=none; b=Pw2THH2SJUP5Alz7v5AxU8ZPTWOAB+Enp0iKY/LXArOd6kx0y7jg6Apf5Ck0e3IFxgeKAWdWguC+RVnONMQ9sk2X+XwddsWk9bs5gCPGmzt0t+rTHkAidNq5RXFlKR48rLwp+092J9z2UKlgkCAVeTXBLFdVvOUfm4/4K5zCy7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789722676; c=relaxed/simple;
	bh=t6uvVarY0wjy8REg6s8wu0xQ+fvJYL0Ij6Nf6nylnLM=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Subject:Cc:
	 References:In-Reply-To; b=KyQGcbeDL6RTac9v305D5BWqyYuhS8lOI55RCOZQZgBfngCexRXi5hCnM7SjyGOTT0dgPXq9HwGFEwakkmWb4FCPmAFa3G+2ZLpgeMg0hf7vdKfFWrX6C+ij8fM/kbmUGUr8G293BVfn4LpP1MAfPv/v45Qi8EOWiht1Enrh1oE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z1HBNKwN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z1HBNKwN"
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 3E89E1F00898;
	Fri, 18 Sep 2026 09:11:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789722674;
	bh=//A6nFUT1fgpq48JhsGCVi6sK5GUd9rpMaDF4/M8Wx0=;
	h=Date:From:To:Subject:Cc:References:In-Reply-To;
	b=Z1HBNKwNnL+VznfivuiwGM6M1Xcx0DfMoCACjps4yaIMqU7+cFoYA7IPC0wsSl3Q3
	 edGuJ0slgW2lnGD3+0B9vrjG7igsaf7/YAs/HD8Lvv3r4xzA+HAJ3BVkTf0SzFf+CC
	 VHtWuEaFQEh6l7Xm+kLSbjcLUfK5swVok5GZJF/c/fSqWymaKGB7wBub4qATvxD5nW
	 Zl5NuwQmrb+KX8JBTs+rQv/lEG2KWLjEc9gOXZGxrcokejQ9kUqlwMkZ6K9Rahom6z
	 edZpSL4lV7XQCx3QN8pc5tvJQog1WR3VSuT/9f4MdI1k0LlWDSKtJ7EBvkZDGMpyuZ
	 VyGTyuE3MGcnA==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=d80592fc061c79ef1f409235a484d6b7475357f9ff155bde2579abd6de22;
 micalg=pgp-sha384; protocol="application/pgp-signature"
Date: Fri, 18 Sep 2026 11:11:10 +0200
Message-Id: <DLIBQKG04DIF.1FKAYOEZH6ZU0@kernel.org>
From: "Michael Walle" <mwalle@kernel.org>
To: "Miquel Raynal" <miquel.raynal@bootlin.com>, "Pratyush Yadav"
 <pratyush@kernel.org>, "Takahiro Kuwano" <takahiro.kuwano@infineon.com>,
 "Richard Weinberger" <richard@nod.at>, "Vignesh Raghavendra"
 <vigneshr@ti.com>
Subject: Re: [PATCH 16/25] mtd: spi-nor: winbond: Prepare introduction of
 W25QxxPW-Q/N parts
Cc: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>, "Steam Lin"
 <STLin2@winbond.com>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.20.0
References: <20260909-winbond-master-spi-nor-jw-cleanup-pw-addition-v1-0-c1b20c39dd1f@bootlin.com> <20260909-winbond-master-spi-nor-jw-cleanup-pw-addition-v1-16-c1b20c39dd1f@bootlin.com>
In-Reply-To: <20260909-winbond-master-spi-nor-jw-cleanup-pw-addition-v1-16-c1b20c39dd1f@bootlin.com>

--d80592fc061c79ef1f409235a484d6b7475357f9ff155bde2579abd6de22
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Wed Sep 9, 2026 at 5:25 PM CEST, Miquel Raynal wrote:
> There is an ID collision between chips of same density from the JW
> family (which it self conflicted with yet another family) with new PW
> parts. Chips are very similar in practice, it is mostly a matter of
> electrical differences (mostly power consumption being lower) as well as
> the addition of inline ECC capability for the higher devices (> 32Mb).
>
> Chips with ECC capability protect 16 bytes chunks are against single
> errors. In case a non-aligned write happens, ECC is locally disabled
> until the next erase.
>
> Another significant difference is that PW chips identify themselves as
> supporting the new SFDP (rev F) QER field which forces an alternate
> write SR2 opcode (0x31).
>
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  drivers/mtd/spi-nor/winbond.c | 55 +++++++++++++++++++++++++++++++++++++=
++++++
>  1 file changed, 55 insertions(+)
>
> diff --git a/drivers/mtd/spi-nor/winbond.c b/drivers/mtd/spi-nor/winbond.=
c
> index fbad9e408d7a..efa9de1f0f66 100644
> --- a/drivers/mtd/spi-nor/winbond.c
> +++ b/drivers/mtd/spi-nor/winbond.c
> @@ -71,6 +71,41 @@ static bool winbond_rv_match(const struct spi_nor *nor=
)
>  	return nor->sfdp && is_w25qxxrv(nor);
>  }
> =20
> +static bool is_w25qxxpw(const struct spi_nor *nor)
> +{
> +	struct sfdp_header *sfdp_h =3D spi_nor_sfdp_get_header(nor);
> +
> +	/*
> +	 * W25QxxPW chips re-use the same ID as the W25QxxJW/NW family.
> +	 *
> +	 * Chips are very similar, W25QxxPW brings mostly performance and power
> +	 * consumption improvements. One key difference in behaviour is the
> +	 * automatic 16-byte based error correction.
> +	 *
> +	 * They can be distinguished based on their SFDP minor revision:
> +	 * W25QxxJW:       JESD216B, minor revision =3D=3D 06h
> +	 * W25Q51/01/02NW: JESD216B, minor revision =3D=3D 06h
> +	 * W25QxxPW:       JESD216F, minor revision >=3D 0Ah
> +	 */
> +	return sfdp_h->minor >=3D SFDP_JESD216F_MINOR;
> +}
> +
> +static bool winbond_pw_match(const struct spi_nor *nor)
> +{
> +	return nor->sfdp && is_w25qxxpw(nor);
> +}
> +
> +static bool winbond_pw_with_ecc_match(const struct spi_nor *nor)
> +{
> +	const struct spi_nor_id *id =3D nor->info->id;
> +
> +	if (!winbond_pw_match(nor))
> +		return false;
> +
> +	/* W25Q33PW chips (id[2] =3D=3D 0x16) do not have built-in ECC support =
*/

The commit message mentions ECC is available for >=3D 32Mbit. Doesn't
align with this comment. Also about the 8MBit and 16Mbit ones?

"W25QxxPW chips smaller than 32MBit doesn't provide built-in ECC support"?

If you like I could rewrite it as I'll apply it. The rest of this
series looks good.

> +	return id->len =3D=3D 3 && id->bytes[2] >=3D 0x17;

Then this makes more sense.

-michael

> +}
> +
>  static int
>  w25q128_post_bfpt_fixups(struct spi_nor *nor,
>  			 const struct sfdp_parameter_header *bfpt_header,
> @@ -201,6 +236,22 @@ static const struct spi_nor_fixups winbond_nor_partn=
ame_fixups =3D {
>  	.post_sfdp =3D winbond_nor_partname_post_sfdp_fixups,
>  };
> =20
> +static int winbond_nor_ecc_configuration_post_sfdp_fixups(struct spi_nor=
 *nor)
> +{
> +	/*
> +	 * PW chips feature automatic error correction. Non 16-byte aligned
> +	 * writes work, but disable error correction on the region until next e=
rase.
> +	 */
> +	nor->params->writesize =3D 16;
> +	nor->params->flags |=3D SNOR_F_ECC;
> +
> +	return 0;
> +}
> +
> +static const struct spi_nor_fixups winbond_nor_ecc_configuration_fixups =
=3D {
> +	.post_sfdp =3D winbond_nor_ecc_configuration_post_sfdp_fixups,
> +};
> +
>  static const struct flash_info winbond_nor_parts[] =3D {
>  	{
>  		.id =3D SNOR_ID(0xef, 0x30, 0x10),
> @@ -622,6 +673,10 @@ static const struct spi_nor_fixup winbond_fixups[] =
=3D {
>  	  .fixups =3D &winbond_nor_multi_die_fixups },
>  	{ .id =3D SNOR_ID(0xef, 0x40, 0x22), .match =3D winbond_jv_match,
>  	  .fixups =3D &winbond_nor_multi_die_fixups },
> +	{ .id =3D SNOR_ID(0xef, 0x60), .match =3D winbond_pw_with_ecc_match,
> +	  .fixups =3D &winbond_nor_ecc_configuration_fixups },
> +	{ .id =3D SNOR_ID(0xef, 0x60), .match =3D winbond_pw_match,
> +	  .fixups =3D &winbond_nor_partname_fixups },
>  	{ .id =3D SNOR_ID(0xef, 0x70), .match =3D winbond_rv_match,
>  	  .fixups =3D &winbond_nor_partname_fixups },
>  	{ .id =3D SNOR_ID(0xef, 0x70, 0x18), .fixups =3D &w25q128_fixups },


--d80592fc061c79ef1f409235a484d6b7475357f9ff155bde2579abd6de22
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCaq0ALhIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/iveQGAuJyWeW0wXUfXFLHPDows5VvT5IWhUubH
H/e7kQt1ufblzGdN6udJUkpRU4G/pvlSAYDp8WCbbI2mwN0iGRXhVZM0XGIvj9fl
5A6hzQuU71gIBz32tfEKn5iIYfyL31ueuVU=
=xsj5
-----END PGP SIGNATURE-----

--d80592fc061c79ef1f409235a484d6b7475357f9ff155bde2579abd6de22--
