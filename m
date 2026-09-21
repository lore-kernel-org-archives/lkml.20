Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7583546A601
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 09:24:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789982679; cv=none; b=TBBMGSskKm4sylLVoG9hdpjwemVlT5NeM0aZyPlkWS8937lepXv5CKTIALNXP7HL89UrWrdWfqE23KNCkDCrUjByJHDhg9MZJNSoiispcaSGyiRcn/tUP77koOpxRptpueWpUSoqP6aVC9kCudnkZCE+lj7IDqmTxg12rqpngAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789982679; c=relaxed/simple;
	bh=4dXyocM9jPjXB0FgLpKkz59i0CfWf99px4I878JZOvw=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Subject:Cc:From:
	 References:In-Reply-To; b=UinAndYFEmxgghzCa1lCfa3eQ91AE44oK0+VB1HQtntMuG0KOAzg82SRucy8NOKdCj609/2utoyyAXyjqWlIWomSEIfGNcAMHiS3ikqOg+lzQJr6mwXJB80FU884mP6zRPbKqmFxzmHxQZHYHv19S/C5oyfYpucvN4CKg/qFcS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KKIdwxCC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KKIdwxCC"
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 5B0E31F000FF;
	Mon, 21 Sep 2026 09:24:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789982677;
	bh=5MbD/mb2k5cZZYD/imnkofeHdbIdhHQWD75O5hW319E=;
	h=Date:To:Subject:Cc:From:References:In-Reply-To;
	b=KKIdwxCCsM1xE5UchyNeydDAF9tr1Tj3nHonTNI77ZA+KX6Gu5yDqp6iqResHub09
	 /65h7cRKs9CWB4Q9CtFq3DJaEpBwRjzRWk1OJZz2bD0pKe1At9liY8jBy8HaeQAwf+
	 vFtvwTigBWQGjS0FaJFOQ2Qtixl4j1dlYQr0oxXEPPQs9NbzpDtp+VfJiU6ZDUAhka
	 Zm66/o2eTvxsqKNSW5GAgzivRPEOrjwc3XZboWRPjkKEqd1lyQ1Nm7TqJJ8nk4qGyk
	 uDEzF/eN4p9Fdclxdg+bEJxPklRsK/sN6nlYMxUZyuLsKsLVBvmUoAQsRgIEf+mjzE
	 aizzWqvC/HbUw==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=81ddfdbab27d5c10a9c7c6d3785b90fcc3965ba71c3967c3081e3d33d28e;
 micalg=pgp-sha384; protocol="application/pgp-signature"
Date: Mon, 21 Sep 2026 11:24:33 +0200
Message-Id: <DLKVWGBO3B13.JQ0A04TWA66E@kernel.org>
To: "David Laight" <david.laight.linux@gmail.com>
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
X-Mailer: aerc 0.20.0
References: <20260915194203.3511147-1-arnd@kernel.org>
 <DLKU0CTP0OES.30VZXJXDXRLNW@kernel.org> <20260921095924.2f845215@pumpkin>
In-Reply-To: <20260921095924.2f845215@pumpkin>

--81ddfdbab27d5c10a9c7c6d3785b90fcc3965ba71c3967c3081e3d33d28e
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Mon Sep 21, 2026 at 10:59 AM CEST, David Laight wrote:
> On Mon, 21 Sep 2026 09:55:37 +0200
> "Michael Walle" <mwalle@kernel.org> wrote:
>
>> Hi Arnd,
>>=20
>> On Tue Sep 15, 2026 at 9:40 PM CEST, Arnd Bergmann wrote:
>> > From: Arnd Bergmann <arnd@arndb.de>
>> >
>> > Two large spi_nor_flash_parameter structures on a function stack
>> > is really too much, and this can exceed an otherwise reasonable
>> > frame limit:
>> >
>> > drivers/mtd/spi-nor/sfdp.c: In function 'spi_nor_parse_sfdp':
>> > drivers/mtd/spi-nor/sfdp.c:1717:1: error: the frame size of 1600 bytes=
 is larger than 1536 bytes [-Werror=3Dframe-larger-than=3D]
>> >
>> > Change one of them to a dynamic allocation to make this more reasonabl=
e. =20
>>=20
>> Thanks for taking care of that. Will you respin the patch with what
>> David suggested?
>
> This compiles...
> David
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
> +       struct spi_nor_flash_parameter sv_params __free(kfree) =3D kmallo=
c_objs(*sv_params, 2);

What does sv_ stands for?

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
> +       if (!sv_params)
> +               return -ENOMEM
> +       sv_params[0] =3D nor->params;
>
>         /* Get the SFDP header. */
>         err =3D spi_nor_read_sfdp_dma_unsafe(nor, 0, sizeof(header), &hea=
der);
> @@ -1653,7 +1655,7 @@ int spi_nor_parse_sfdp(struct spi_nor *nor)
>
>         /* Parse optional parameter tables. */
>         for (i =3D 0; i < header.nph; i++) {
> -               memcpy(&params2, nor->params, sizeof(params2));
> +               sv_params[1] nor->params;

sv_params[1] =3D nor->params;

-michael

>                 param_header =3D &param_headers[i];
>
>                 switch (SFDP_PARAM_HEADER_ID(param_header)) {
> @@ -1691,7 +1693,7 @@ int spi_nor_parse_sfdp(struct spi_nor *nor)
>                          * spi_nor_flash_parameter data.
>                          */
>                         err =3D 0;
> -                       memcpy(nor->params, &params2, sizeof(*nor->params=
));
> +                       nor->params =3D sv_params[1];
>                 }
>         }
>
> @@ -1712,7 +1714,7 @@ int spi_nor_parse_sfdp(struct spi_nor *nor)
>  free_param_headers:
>         kfree(param_headers);
>         if (err)
> -               memcpy(nor->params, &params, sizeof(*nor->params));
> +               nor->params =3D sv_params[0];
>
>         return err;
>  }
> --
>
>>=20
>> -michael
>>=20
>> > Fixes: d20029474a76 ("mtd: spi-nor: push the rollback mechanism into t=
he sfdp module")
>> > Signed-off-by: Arnd Bergmann <arnd@arndb.de>
>> > ---
>> >  drivers/mtd/spi-nor/sfdp.c | 10 +++++++---
>> >  1 file changed, 7 insertions(+), 3 deletions(-) =20


--81ddfdbab27d5c10a9c7c6d3785b90fcc3965ba71c3967c3081e3d33d28e
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCarD30hIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/hSbgF+OlwlmYBW5BJ479b1HeQQJYlpv3Eh3O9L
GdP4f/bCdkveoO0B3/zWZmpZ59TY8ugLAYDztcQSZ373+Hvqzs2Ny6awAGjxBCbx
CdzClYJca94KPS6XQjSI8AEZ3dN/oG77WQc=
=MfCb
-----END PGP SIGNATURE-----

--81ddfdbab27d5c10a9c7c6d3785b90fcc3965ba71c3967c3081e3d33d28e--
