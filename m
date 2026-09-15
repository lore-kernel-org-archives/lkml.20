Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 161894078CE
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 19:48:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789501715; cv=none; b=tINtBOyLizxRX7lXuAT9tX9iterMg60ovW3mqiwNbXENmHpSZV6WvTr5ODNoIPQFgULk4U8jhoKE+exzqZpXJjFZ/Bc+LqJTPtICztmdsfQ5sGAB3/Np0wIXHTQft/FJjo92Tm3Ni2det1XrML3idtn6rbK1zxzw6ZGaitYUIgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789501715; c=relaxed/simple;
	bh=Kz59GHhkcamBTvO5OZA+8aUrnfhaG4JmoWSr9Dzi4Xw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=cHg8CpFiJVp6WLKkFFtt1CYHM2203E4d4BrBnC4SjFR3FDqGzgmqTI+H+NjvlC40sb2kVmoq+9psyGdKjcimCMyvAAcXTej8dfB9Wu4OYRuGnaUqkmWKPPNMhT6cUtQO133ra4YXeYcww4NAVJIvc9ywplbP3sbkkNIzGktbmzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bA84eQ8k; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bA84eQ8k"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 245E51F000FF;
	Tue, 15 Sep 2026 19:48:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789501713;
	bh=TZZHSnTPH2xbRY+C/0wr5szLzimCe4mAHjjDiV7zCkU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=bA84eQ8kNm2xFEDJHaAu4/0FsNfa2dIGw688NVxMv5ztnZWcMONlCDyXVd5iS0GQ3
	 YPU3JQfOebHH47I9SKmiJYpbxRe0e/+MT3rUKvTb79N1+JXX4/0kR5lSXxcNOeXPoa
	 mFZcx9vpcSnzoQ4m/ZkR96b1BYdf2P4eLvJe8W6A9yweadHnRQEyfI6jv82NXEaVXh
	 jR7u68ZVgELGIIt2dSp/Jfd3oppLD4kQWCQERpWYS+xt/kknGaS/HK/O4ceiKoIwr7
	 66mxhSF4j+qp5p/kEtuCjvX1sYIaZhwkoq6CmUfiTbwzjyNnz2LmLiKkIWquz9SsQv
	 wtobLZFeiH+wA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] mtd: spi-nor: reduce stack usage in
 spi_nor_parse_sfdp()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Michael Walle" <mwalle@kernel.org>, "Arnd Bergmann" <arnd@kernel.org>, "Vignesh
 Raghavendra" <vigneshr@ti.com>, "Richard Weinberger" <richard@nod.at>, "Pratyush
 Yadav" <pratyush@kernel.org>, "Miquel Raynal" <miquel.raynal@bootlin.com>
Cc: "HyeongJun An" <sammiee5311@gmail.com>, "Arnd Bergmann" <arnd@arndb.de>, "Tudor
 Ambarus" <tudor.ambarus@linaro.org>, linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, "Takahiro
 Kuwano" <takahiro.kuwano@infineon.com>
In-Reply-To: <20260915194203.3511147-1-arnd@kernel.org>
References: <20260915194203.3511147-1-arnd@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 15 Sep 2026 19:48:32 +0000
Message-Id: <20260915194833.245E51F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] mtd: spi-nor: mixing goto and scope-based cleanup in spi_nor_par=
se_sfdp()
- [Low] mtd: spi-nor: split definition and initialization of __free() varia=
ble
--

commit 1f040dc109ef8aa4b9fc1c81bcaa8f6e6a5a27c0
Author: Arnd Bergmann <arnd@arndb.de>

mtd: spi-nor: reduce stack usage in spi_nor_parse_sfdp()

This commit reduces stack usage in spi_nor_parse_sfdp() by replacing an
on-stack struct spi_nor_flash_parameter variable with a dynamically allocat=
ed
one. It utilizes the __free(kfree) scope-based cleanup helper to manage the
allocated memory.

> diff --git a/drivers/mtd/spi-nor/sfdp.c b/drivers/mtd/spi-nor/sfdp.c
> index 641f17ad51a09..466558ea528d8 100644
> --- a/drivers/mtd/spi-nor/sfdp.c
> +++ b/drivers/mtd/spi-nor/sfdp.c
> @@ -1521,7 +1521,7 @@ int spi_nor_parse_sfdp(struct spi_nor *nor)
>  {
>  	const struct sfdp_parameter_header *param_header, *bfpt_header;
>  	struct sfdp_parameter_header *param_headers =3D NULL;
> -	struct spi_nor_flash_parameter params, params2;
> +	struct spi_nor_flash_parameter __free(kfree) *params =3D NULL;

[Severity: Low]
Does this split definition and initialization of the params pointer violate
the cleanup subsystem guidelines?

The guidelines recommend defining and initializing scope-based cleanup
variables in a single statement (such as at the kmemdup call below) rather
than initializing to NULL at the top with assignment later. While this
specific case might not trigger a LIFO ordering bug since there are no
guard() locks present, it does bypass the subsystem recommendation designed
to prevent those ordering mistakes.

>  	struct sfdp_header header;
>  	struct device *dev =3D nor->dev;
>  	struct sfdp *sfdp;
> @@ -1533,7 +1533,9 @@ int spi_nor_parse_sfdp(struct spi_nor *nor)
>  	 * Get a backup of all the parameter to roll back to in case of an
>  	 * error.
>  	 */
> -	memcpy(&params, nor->params, sizeof(params));
> +	params =3D kmemdup(nor->params, sizeof(*params), GFP_KERNEL);
> +	if (!params)
> +		return -ENOMEM;
> =20
>  	/* Get the SFDP header. */

[ ... ]

> @@ -1712,7 +1716,7 @@ int spi_nor_parse_sfdp(struct spi_nor *nor)
>  free_param_headers:
>  	kfree(param_headers);
>  	if (err)
> -		memcpy(nor->params, &params, sizeof(*nor->params));
> +		memcpy(nor->params, params, sizeof(*nor->params));
> =20
>  	return err;
>  }

[Severity: Medium]
Is it safe to mix goto-based error handling with scope-based cleanup in
this function?

The kernel cleanup subsystem guidelines dictate that goto-based error
handling and scope-based cleanups should never be mixed in the same
function. Retaining the free_param_headers goto label and other manual
cleanups in spi_nor_parse_sfdp() while introducing __free(kfree) for params
violates the 'all-or-nothing' conversion rule and can create confusing
ownership semantics.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260915194203.3511=
147-1-arnd@kernel.org?part=3D1
