Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1814648BD2B
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 15:44:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789141457; cv=none; b=XtF02h+ccA+bVEP1ji+bJTCFcmkSDHr1CVYmgiB/2+XCcEq5Sngg28/qsSHfQoyOatkk/+4F4vhQv3mLe+EzRx4hdOjIodItXo1zvsSOC3hP0QP7TdhYFkRDqgBl/v30aJ8f4deshE9c8SUT0OCFkUkgQiuFUZF3HMhpz9drLus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789141457; c=relaxed/simple;
	bh=WCEHigP2JqKbFCMU8ngAFm6bwZZS8JEojfG/4s/+lNU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=IGzh/mSteZKZ9KYv6zYanChiT96j4tY3+HJbKXqFBSGlhaW513PW34N5Z1rOdmwvmF1E4IEFKuSk+oDJYCb8Jd+5hirMlUCGY/UFBV7OOEzfwOYdNeEKNz5FEIfW3yZW7B9jIaUeSyo9/bEqPdCWayBKNJpGq4cD3FGbNg7MZoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Yee1nUHA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Yee1nUHA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B53B01F00893;
	Fri, 11 Sep 2026 15:44:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789141453;
	bh=FPZslvRSCNdZWGFrQfJeVjz0yJFk4tUTY7XoMHgWR0s=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Yee1nUHAplbscR8J3u7mXPWow5ZQa9PJOzhaE+mknXHKXuXnzSjnVzJYD2Vhky+6l
	 8g9pOS7Go6Z5OoDDuYei6f/Ap92KyK5WovIeTxURb70fOExZRceapyENI5leLaKpYN
	 BOQYQ2gQKVaBIQ/xdpXx6uqtC7UYgU70qR6luySR9PFJyVdz/2v1zNLxxLqIssDFEO
	 bSAeDtqY4SwD2XK7aYFHJ/HLmZ9C3DlFHSMOV9Fli1YPSZzzIxHeDN8ofyB0plL+SC
	 AQwI6MwNTOY3N2TeQIFp5M0lxiV2pe7yjY41k6yezAa9CBhNosNDA95Cdb6Fwyep6M
	 bNHDUy1s7p8wQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] mtd: spi-nor: issi: Add support for is25wx01g
Reply-To: sashiko-reviews@lists.linux.dev
To: linux-kernel@vger.kernel.org, =?utf-8?b?TnVubyBTw6E=?= <nuno.sa@analog.com>, linux-mtd@lists.infradead.org
Cc: "Miquel Raynal" <miquel.raynal@bootlin.com>, "Pratyush Yadav" <pratyush@kernel.org>, "Michael
 Walle" <mwalle@kernel.org>, "Vignesh Raghavendra" <vigneshr@ti.com>, "Takahiro
 Kuwano" <takahiro.kuwano@infineon.com>, "Richard Weinberger" <richard@nod.at>
In-Reply-To: <20260911-mtd-spi-nor-new-issi-chip-v1-2-c54615f8c30f@analog.com>
References: <20260911-mtd-spi-nor-new-issi-chip-v1-0-c54615f8c30f@analog.com>
 <20260911-mtd-spi-nor-new-issi-chip-v1-2-c54615f8c30f@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 11 Sep 2026 15:44:12 +0000
Message-Id: <20260911154412.B53B01F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The patch introduces multiple build failures due to an incomplete f=
orward-port from an older kernel version. It references non-existent struct=
 fields, uses an undeclared flag, and attempts an outdated method to disabl=
e 16-bit status register writes.
--

commit 2a2f93cf391e237e4b5b711cef68cc225e2bc2fe
Author: Nuno S=C3=A1 <nuno.sa@analog.com>

mtd: spi-nor: issi: Add support for is25wx01g

This patch adds support for the ISSI IS25WX01G 1 Gbit octal NOR flash. It
relies on SFDP and provides BFPT fixups to handle the lack of a 35h command
and to disable the quad enable method.

> diff --git a/drivers/mtd/spi-nor/issi.c b/drivers/mtd/spi-nor/issi.c
> index 2f057d731df2a..aac9d19b90fcf 100644
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

[Severity: Low]
Does this code compile on the target tree? struct spi_nor does not appear
to have a flags member in the current API, and SNOR_F_HAS_16BIT_SR seems
to be undeclared.

> +
> +	/*
> +	 * The BFPT Quad Enable Requirement field is set to a reserved value, so
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

[ ... ]

> @@ -120,6 +143,10 @@ static const struct flash_info issi_nor_parts[] =3D {
>  		.id =3D SNOR_ID(0x9d, 0x70, 0x19),
>  		.name =3D "is25wp256",
>  		.flags =3D SPI_NOR_QUAD_PP,
> +	}, {
> +		.id =3D SNOR_ID(0x9d, 0x5b, 0x1b),
> +		.name =3D "is25wx01g",
> +		.fixups =3D &is25wx01g_fixups,

[Severity: Low]
Does struct flash_info have a fixups member in the current framework?
It looks like fixups might need to be registered via struct
spi_nor_manufacturer and its fixups array instead.

>  	}
>  };

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260911-mtd-spi-no=
r-new-issi-chip-v1-0-c54615f8c30f@analog.com?part=3D2
