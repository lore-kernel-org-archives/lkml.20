Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF5FF495036
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 12:57:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791377850; cv=none; b=aruH7Js3FEiEGGKX6E9xDDsjbrpDxo7fGBz/kgMBrx7gFWM085Lr97L/0PL1oFonWRM7YI4irpZxZa2zFhCwc/WMA8UwWFHxNpvO31hraZDjJMYtmpn61ehTSjePmqiAiewJRGAW6opf63lCvH4HjmjMTxW1lk0zEDw6uGIJoa8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791377850; c=relaxed/simple;
	bh=cfxCv5Np1593E5nxYi0DP+yVIHa94hHqFDKqYvo2860=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:From:To:
	 References:In-Reply-To; b=QUh1NyJxA/43hWyxf3gH9SeJfo1bYtQxKuxE4oJfKgfBXeHUOzkZMawosxfLBSrE6zvsminjUcN6RIAm/Pr4inem2wEYxef9PmZKbVXjT+X3LWrgwCNkNpFUv3OA/+HkygLBDHSYeRSlTORkrhdl7OuNHYDwsucrc3K5m9eFXNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fWHwObOW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fWHwObOW"
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id B07A51F0089B;
	Wed,  7 Oct 2026 12:57:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791377840;
	bh=Kx3edEac2KhM6Wf3jhztHRI5P975VrjqrGGMsTYHC0w=;
	h=Date:Subject:Cc:From:To:References:In-Reply-To;
	b=fWHwObOWF6JA5zrFzkTxlqMrRjf2LFO2sn7uG0kisTsnM4nb99a5fLiMAB86BU/Hl
	 GWgAwvqqilkvoOPt6s5XxIMxYcw7mmhp7FZRvKK9pfAWk5A0iNYDpF8ybwfbB76MHl
	 YFzSGJRCJrKaDhcmGZEBosAC8nt/REu8IAiLOnA27/wl4RfRTtFwDWq54wkd2ecx2T
	 STc1O97Xm0Y4qo+CKK1oJ77NktM+UkvMWKtuLZWdOLcrYKwEGGWKT6iD/Yzmzh9CGb
	 x/dnQTgxQh6kj6F59LW5JPSnU6GQrBsL7mp7IJv7QdTEkGl5/uZNBlATE7emSydrRL
	 zPSQewVDDj3PA==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=73be48b148e7b17077f1c56dfb7fdf66a9b981e49f0285ce01772ff65752;
 micalg=pgp-sha384; protocol="application/pgp-signature"
Date: Wed, 07 Oct 2026 14:57:16 +0200
Message-Id: <DLYMG0XY8T4Q.2B4KXOQ9QRM2F@kernel.org>
Subject: Re: [PATCH] mtd: spi-nor: reduce stack usage in
 spi_nor_parse_sfdp()
Cc: "Arnd Bergmann" <arnd@kernel.org>, "Pratyush Yadav"
 <pratyush@kernel.org>, "Miquel Raynal" <miquel.raynal@bootlin.com>,
 "Richard Weinberger" <richard@nod.at>, "Vignesh Raghavendra"
 <vigneshr@ti.com>, "Arnd Bergmann" <arnd@arndb.de>, "Takahiro Kuwano"
 <takahiro.kuwano@infineon.com>, "Tudor Ambarus" <tudor.ambarus@linaro.org>,
 "HyeongJun An" <sammiee5311@gmail.com>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
From: "Michael Walle" <mwalle@kernel.org>
To: "David Laight" <david.laight.linux@gmail.com>
X-Mailer: aerc 0.20.0
References: <20260915194203.3511147-1-arnd@kernel.org>
 <DLKU0CTP0OES.30VZXJXDXRLNW@kernel.org> <20260921095924.2f845215@pumpkin>
 <20260921114111.525a2257@pumpkin>
In-Reply-To: <20260921114111.525a2257@pumpkin>

--73be48b148e7b17077f1c56dfb7fdf66a9b981e49f0285ce01772ff65752
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi Arnd,

>> > On Tue Sep 15, 2026 at 9:40 PM CEST, Arnd Bergmann wrote: =20
>> > > From: Arnd Bergmann <arnd@arndb.de>
>> > >
>> > > Two large spi_nor_flash_parameter structures on a function stack
>> > > is really too much, and this can exceed an otherwise reasonable
>> > > frame limit:
>> > >
>> > > drivers/mtd/spi-nor/sfdp.c: In function 'spi_nor_parse_sfdp':
>> > > drivers/mtd/spi-nor/sfdp.c:1717:1: error: the frame size of 1600 byt=
es is larger than 1536 bytes [-Werror=3Dframe-larger-than=3D]

Will you resend a v2 with Davids proposal? I'd like to get this
fixed in this cycle. I could also take your patch and add Davids
proposal on top.

-michael

>> > >
>> > > Change one of them to a dynamic allocation to make this more reasona=
ble.   =20
>> >=20
>> > Thanks for taking care of that. Will you respin the patch with what
>> > David suggested? =20
>>=20
>> This compiles...
>
> It didn't - I thought I had compiled it :-(
> Try:
>
> diff --git a/drivers/mtd/spi-nor/sfdp.c b/drivers/mtd/spi-nor/sfdp.c
> index 641f17ad51a0..cec699b52f27 100644
> --- a/drivers/mtd/spi-nor/sfdp.c
> +++ b/drivers/mtd/spi-nor/sfdp.c
> @@ -1519,9 +1519,9 @@ int spi_nor_check_sfdp_signature(struct spi_nor *no=
r)
>   */
>  int spi_nor_parse_sfdp(struct spi_nor *nor)
>  {
> +       struct spi_nor_flash_parameter *save_params __free(kfree) =3D kma=
lloc_objs(*save_params, 2);
>         const struct sfdp_parameter_header *param_header, *bfpt_header;
>         struct sfdp_parameter_header *param_headers =3D NULL;
> -       struct spi_nor_flash_parameter params, params2;
>         struct sfdp_header header;
>         struct device *dev =3D nor->dev;
>         struct sfdp *sfdp;
> @@ -1533,7 +1533,9 @@ int spi_nor_parse_sfdp(struct spi_nor *nor)
>          * Get a backup of all the parameter to roll back to in case of a=
n
>          * error.
>          */
> -       memcpy(&params, nor->params, sizeof(params));
> +       if (!save_params)
> +               return -ENOMEM;
> +       save_params[0] =3D *nor->params;
>
>         /* Get the SFDP header. */
>         err =3D spi_nor_read_sfdp_dma_unsafe(nor, 0, sizeof(header), &hea=
der);
> @@ -1653,7 +1655,7 @@ int spi_nor_parse_sfdp(struct spi_nor *nor)
>
>         /* Parse optional parameter tables. */
>         for (i =3D 0; i < header.nph; i++) {
> -               memcpy(&params2, nor->params, sizeof(params2));
> +               save_params[1] =3D *nor->params;
>                 param_header =3D &param_headers[i];
>
>                 switch (SFDP_PARAM_HEADER_ID(param_header)) {
> @@ -1691,7 +1693,7 @@ int spi_nor_parse_sfdp(struct spi_nor *nor)
>                          * spi_nor_flash_parameter data.
>                          */
>                         err =3D 0;
> -                       memcpy(nor->params, &params2, sizeof(*nor->params=
));
> +                       *nor->params =3D save_params[1];
>                 }
>         }
>
> @@ -1712,7 +1714,7 @@ int spi_nor_parse_sfdp(struct spi_nor *nor)
>  free_param_headers:
>         kfree(param_headers);
>         if (err)
> -               memcpy(nor->params, &params, sizeof(*nor->params));
> +               *nor->params =3D save_params[0];
>
>         return err;
>  }
> --
>
> David

--73be48b148e7b17077f1c56dfb7fdf66a9b981e49f0285ce01772ff65752
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCasZBrBIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/jPwQGAzJN9vg6AA+UH8+JKVqFQ6aIhdIkH1XtP
gMAf8hyzbau0/OS4WGQSy8Mdsctu8/y0AX40njhA942j0wZLMJ6+z84eKdQn7y2P
PXzaN2uQ7AfLs+FV/SxjwnqwU2UrLiO+7Wk=
=RlNn
-----END PGP SIGNATURE-----

--73be48b148e7b17077f1c56dfb7fdf66a9b981e49f0285ce01772ff65752--
