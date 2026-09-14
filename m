Received: from 0001.3ffe.de (0001.3ffe.de [159.69.201.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 144E2286425
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 06:37:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.201.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789367881; cv=none; b=Z70vA9Jp84zjj9hdbe2Smw5NwJ7ypCpa2WgEtmltJ3dcMvj2sPfcdoy8EgPYTyzBnRSNJ9RgNbaS0xskt7+d2BouPm0Qb7x2ZnMe3Pro+cgQd1Hhr77aSVfUPF+VGHGfZ2Uz5EGK0vqIXaBvVGvvn1j8sJqtSfpa5h7jo8XXNxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789367881; c=relaxed/simple;
	bh=f15CJ0lpch7tr+fnVjgUVqH4oioJoeC9s340iNA0Pcw=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:From:To:
	 References:In-Reply-To; b=fM8N9ZcJuBZfDAFdnmyQ9YMFQ1ej4CjqmQDDt6NbHjAHbyp9vqTwa0ToQjD/LPbpxnrRavTQJA2qHSiwm03133w7bH1s+NfCZzZDEU3OYK8CqNmogp7bLQaAJ1uaIyL9BShUgaNiScq/QymvaIcIMT2wuxkac5GLV2DaFVf0MkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=walle.cc; arc=none smtp.client-ip=159.69.201.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=walle.cc
Received: from localhost (unknown [IPv6:2a02:810b:4320:1000:4685:ff:fe12:5967])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id 9B2FF19F;
	Mon, 14 Sep 2026 08:28:25 +0200 (CEST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 14 Sep 2026 08:28:25 +0200
Message-Id: <DLETRRVRUWEP.1VU1EHARD3MSH@kernel.org>
Subject: Re: [PATCH 2/2] mtd: spi-nor: issi: Add support for is25wx01g
Cc: "Pratyush Yadav" <pratyush@kernel.org>, "Takahiro Kuwano"
 <takahiro.kuwano@infineon.com>, "Miquel Raynal"
 <miquel.raynal@bootlin.com>, "Richard Weinberger" <richard@nod.at>,
 "Vignesh Raghavendra" <vigneshr@ti.com>
From: "Michael Walle" <mwalle@kernel.org>
To: =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.20.0
References: <20260911-mtd-spi-nor-new-issi-chip-v1-0-c54615f8c30f@analog.com> <20260911-mtd-spi-nor-new-issi-chip-v1-2-c54615f8c30f@analog.com>
In-Reply-To: <20260911-mtd-spi-nor-new-issi-chip-v1-2-c54615f8c30f@analog.com>

Hi,

On Fri Sep 11, 2026 at 5:36 PM CEST, Nuno S=C3=A1 wrote:
> Add support for the ISSI IS25WX01G, a 1 Gbit octal NOR flash. The part
> is fully described by SFDP, so only the flash ID and two BFPT fixups are
> needed.

Adding a new flash involves minimum testing and an SFDP dump, see
[1].

Also please keep the following Link: tag in your next version:

Link: https://www.issi.com/WW/pdf/25LX-WX01GB.pdf

> The flash has no Status Register 2 and does not implement the 35h Read
> Configuration Register command, so the default assumption of a 16-bit
> Write Status command does not hold. Additionally, its BFPT Quad Enable
> Requirement field carries a reserved value, which makes
> spi_nor_parse_bfpt() keep the manufacturer default quad enable method;
> clear it, since this is an octal-only part with no quad mode at all.
>
> Signed-off-by: Nuno S=C3=A1 <nuno.sa@analog.com>
> ---
>  drivers/mtd/spi-nor/issi.c | 27 +++++++++++++++++++++++++++
>  1 file changed, 27 insertions(+)
>
> diff --git a/drivers/mtd/spi-nor/issi.c b/drivers/mtd/spi-nor/issi.c
> index 2f057d731df2..aac9d19b90fc 100644
> --- a/drivers/mtd/spi-nor/issi.c
> +++ b/drivers/mtd/spi-nor/issi.c
> @@ -29,6 +29,29 @@ static const struct spi_nor_fixups is25lp256_fixups =
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
> +	nor->flags &=3D ~SNOR_F_HAS_16BIT_SR;
> +
> +	/*
> +	 * The BFPT Quad Enable Requirement field is set to a reserved value, s=
o
> +	 * spi_nor_parse_bfpt() leaves the quad enable method at its default.
> +	 * Make sure we disable it as there is no quad mode anyway.
> +	 */
> +	nor->params->quad_enable =3D NULL;
> +	return 0;
> +}
> +
> +static const struct spi_nor_fixups is25wx01g_fixups =3D {
> +	.post_bfpt =3D is25wx01g_post_bfpt_fixups,
> +};
> +
>  static int pm25lv_nor_late_init(struct spi_nor *nor)
>  {
>  	struct spi_nor_erase_map *map =3D &nor->params->erase_map;
> @@ -120,6 +143,10 @@ static const struct flash_info issi_nor_parts[] =3D =
{
>  		.id =3D SNOR_ID(0x9d, 0x70, 0x19),
>  		.name =3D "is25wp256",
>  		.flags =3D SPI_NOR_QUAD_PP,
> +	}, {
> +		.id =3D SNOR_ID(0x9d, 0x5b, 0x1b),
> +		.name =3D "is25wx01g",
No .name please.

-michael

[1] https://docs.kernel.org/driver-api/mtd/spi-nor.html

> +		.fixups =3D &is25wx01g_fixups,
>  	}
>  };
> =20

