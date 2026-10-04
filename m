Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 817DE423EB4
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 21:45:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791150332; cv=none; b=hK6KJjYaLulEfJJqfGgiQ3ba4mssSWqU6jQA62+1gxmPtKHIqkce3p0n/JtdSZ07UnG10WFLVAYcq9aDxptLLrRhk9J9odgPHSAcl7r1nyETdzli9w2gFkoKCuZw9lzX4eE3FCo8FjJ5qzHOPAlB/2Ts4025zETD2MXxqXNj7Pc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791150332; c=relaxed/simple;
	bh=SaxhkKl8AInAHfSqD0oHmEV/tzDEo8cFhQOxvujbxmk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=BTdfduDixq1m6vVRCcUOPM81pj+j4kERWKdnbi2tPPgsX9RnzzjHMjWUCscFD33L6zWAKEX5hf0MK6zZAh3u9iTNfKW2jA3F0XWh8AiMSdyyKF7kHj3PvqikMFX3b0O/VaBwYpFkGdS6ymhpo/02KM5TnAA4QvkQF8uZjMQjy5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hZHqAYVu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hZHqAYVu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 837371F000FF;
	Sun,  4 Oct 2026 21:45:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791150331;
	bh=dYNWrtWYxeTtYnJXxEyF5VshTkgt8kkbZh89AuMatqE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hZHqAYVuzrVNjnonVvp/qZD0CUiSqgQfDnzMeA8wvk+QWknSDCXhVwdejv6e64zGc
	 s7jplRaMDvaaJnqZ+RrdT4LE1cNpcTnkRb6V1WLlQ5hMSEOWr4fgsfYPwoDxuHZlPw
	 wCaNPi0IYt04zm+WIFJEFEXKhn7dBhbWVf38J9iY5LdstAYCEkL2WOuLZlp+rvlSxV
	 CTxmVDcH2q+zoJAIPJ8/CdpAJa5mfCzvsWDVC8nwruVVQUHUzVMJtSDTYgpx5tQqW8
	 rcTZ5wlTZu0GYCOe4G+1TgI6CGOR7k46NQ+UkxxB6vtmrA89mdZchpOShpayuepuVn
	 qbPkyU2rHA+8Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 10/17] mtd: spi-nor: winbond: Prepare the
 introduction of W35TxxNW parts
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vignesh Raghavendra" <vigneshr@ti.com>, "Michael Walle" <mwalle@kernel.org>, "Pratyush
 Yadav" <pratyush@kernel.org>, "Miquel Raynal" <miquel.raynal@bootlin.com>, "Richard
 Weinberger" <richard@nod.at>, "Takahiro Kuwano" <takahiro.kuwano@infineon.com>
Cc: "Steam Lin" <STLin2@winbond.com>, linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, "Thomas
 Petazzoni" <thomas.petazzoni@bootlin.com>
In-Reply-To: <20261004-winbond-master-spi-nor-w35t-v2-10-592f3300a70f@bootlin.com>
References: <20261004-winbond-master-spi-nor-w35t-v2-0-592f3300a70f@bootlin.com>
 <20261004-winbond-master-spi-nor-w35t-v2-10-592f3300a70f@bootlin.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 04 Oct 2026 21:45:30 +0000
Message-Id: <20261004214530.837371F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] mtd: spi-nor: winbond: missing Flag Register polling ignores P/E e=
rrors
--

commit eef1bdae97bf8ec6c5ee8f47f2358cc4351e258b
Author: Miquel Raynal <miquel.raynal@bootlin.com>

mtd: spi-nor: winbond: Prepare the introduction of W35TxxNW parts

This commit prepares for a new octal DTR family by adding callbacks for oct=
al
DTR modes and dummy cycles configuration. It also mentions these chips feat=
ure
SECDEC and lack SR2, but they do have a flag register.

> diff --git a/drivers/mtd/spi-nor/winbond.c b/drivers/mtd/spi-nor/winbond.c
> index 51f6bcd3f8e5b..058a2951c184e 100644
> --- a/drivers/mtd/spi-nor/winbond.c
> +++ b/drivers/mtd/spi-nor/winbond.c
> @@ -11,6 +11,13 @@
>  #define WINBOND_NOR_OP_RDEAR	0xc8	/* Read Extended Address Register */
>  #define WINBOND_NOR_OP_WREAR	0xc5	/* Write Extended Address Register */
>  #define WINBOND_NOR_OP_SELDIE	0xc2	/* Select active die */
> +#define WINBOND_NOR_OP_WR_VCR	0x81	/* Write VCR registers */
> +#define   WINBOND_NOR_VCR_IO_MODE_CFG_REG 0x00 /* IO mode configuration =
address (VCR) */
> +#define     WINBOND_NOR_VCR_IO_MODE_SSDR 0xFF
> +#define     WINBOND_NOR_VCR_IO_MODE_ODDR 0xE7
> +#define   WINBOND_NOR_VCR_DUMMY_CFG_REG 0x01 /* Dummy cycle configuratio=
n address (VCR) */
> +#define WINBOND_NOR_OP_RD_FR	0x70	/* Read Flag registers */
> +#define WINBOND_NOR_OP_CL_FR	0x50	/* Clear Flag registers */

[Severity: High]
Are these flag register opcodes omitted from the driver logic?

The opcodes WINBOND_NOR_OP_RD_FR and WINBOND_NOR_OP_CL_FR are defined here
for interacting with the Flag Register, but they do not appear to be used
anywhere.

[ ... ]

> @@ -252,6 +265,87 @@ static const struct spi_nor_fixups winbond_nor_ecc_c=
onfiguration_fixups =3D {
>  	.post_sfdp =3D winbond_nor_ecc_configuration_post_sfdp_fixups,
>  };
> =20

[ ... ]

> +static int winbond_w35txxnw_nor_late_init(struct spi_nor *nor)
> +{
> +	nor->params->set_octal_dtr =3D winbond_w35txxnw_nor_set_octal_dtr;
> +	nor->params->set_dummy =3D winbond_w35txxnw_nor_set_dummy;
> +	nor->params->opcodes.read_sr2 =3D 0;
> +	nor->params->opcodes.write_sr1_and_sr2 =3D 0;

[Severity: High]
Should a custom ready callback be assigned here to poll the Flag Register?

Since no custom callback is assigned, the driver falls back to the default
spi_nor_sr_ready, which only checks the SR1 WIP bit and does not check the=
=20
Flag Register for errors.

Could this cause a regression where any program or erase operation that fai=
ls
on a W35TxxNW part (e.g., from wear or protection), as well as ECC errors,
are silently ignored? In some cases, uncleared errors leave the flash stuck,
and the OS will incorrectly assume data is persisted, leading to data
corruption.

Could we assign a custom ready callback (such as winbond_w35txxnw_nor_ready)
to correctly utilize the Flag Register?

> +
> +	return 0;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261004-winbond-ma=
ster-spi-nor-w35t-v2-0-592f3300a70f@bootlin.com?part=3D10
