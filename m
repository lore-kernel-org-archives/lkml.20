Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4D5E3BE623
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 21:43:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791150205; cv=none; b=ihA3Sf2aJPtmYLdHEilmXHt3weo2Fa9JfF3EnM48YoWB/7bD8DSNtGsI8vNrY89EjawqFqmV9XSp9erAYH1DZtDo7g6C3UyhtgJ1D6o88OkCHcpNyY4s8kaRmp+zOJiS1MsxnWpHHBUrok/oxyuX50tZiJqlTFI76XxRDLQpyhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791150205; c=relaxed/simple;
	bh=IKanhv3Qv6hW4BQlBfT3w6D5rxp3vA4ed5T8VrAYKxo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=XDR/Zfm4m9dQe/Z9LHdgD9YWsGLmj0kuetst1vI/koyyEUDkDEK+eh6aK9HNA2fWjvb/j3gp2r7okepE4wek5+McUUkAnloVGQ5C9ZBtu9GcWlTqnCGJeH9t072BsXvT+K/o+M0fW+n+xeJmr+Ai8fFRNlEU/qQ+i0o4vc+bmPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JEF5oJqg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JEF5oJqg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D71CB1F000FF;
	Sun,  4 Oct 2026 21:43:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791150204;
	bh=gQlzCEAK3U7bGfWnrsR2Mb47o8Np3LZvTSaHLXOZ7gg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=JEF5oJqgQtmsqzCAnsZ8CCcS1rZZF++4sgYWu0JgxLPsDyP5tbD9fuzCLXAMO/vT2
	 49F2h7c/HeYlRX+fJTOZpAt06qf1Jj+pwRhd83du6xRG+XT8T0JZcVYN6j9MEbDeb1
	 LlZTewjHWOprXz925iJHLMcVkipaChTAGVlpvV5F9B4RQ4Q8LJFP/+zmw/Etfh8dJY
	 okxsKOVNzqTiBoGtApIrISM6pt9boVmgYEflvOE9MjkrH6iDgrAKFBR2hsT8qIXmC9
	 o+2JYnZhRVsFQ1QdA7RfnJB5xzJCGCqUMjtLCyM6+vmyjkAq/a/+ajF1Y5Fz6yPiT1
	 MPV8wj2Gs2CEQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 07/17] mtd: spi-nor: Fix WRSR with ODTR chips
Reply-To: sashiko-reviews@lists.linux.dev
To: "Pratyush Yadav" <pratyush@kernel.org>, "Miquel Raynal" <miquel.raynal@bootlin.com>, "Takahiro
 Kuwano" <takahiro.kuwano@infineon.com>, "Richard Weinberger" <richard@nod.at>, "Vignesh
 Raghavendra" <vigneshr@ti.com>, "Michael Walle" <mwalle@kernel.org>
Cc: "Steam Lin" <STLin2@winbond.com>, linux-kernel@vger.kernel.org, "Thomas
 Petazzoni" <thomas.petazzoni@bootlin.com>, linux-mtd@lists.infradead.org
In-Reply-To: <20261004-winbond-master-spi-nor-w35t-v2-7-592f3300a70f@bootlin.com>
References: <20261004-winbond-master-spi-nor-w35t-v2-0-592f3300a70f@bootlin.com>
 <20261004-winbond-master-spi-nor-w35t-v2-7-592f3300a70f@bootlin.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 04 Oct 2026 21:43:23 +0000
Message-Id: <20261004214323.D71CB1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] mtd: spi-nor: rejecting len !=3D 1 in Octal DTR mode breaks 2-byte=
 SR writes
- [High] mtd: spi-nor: hardware WEL state leak on early return in spi_nor_w=
rite_sr_ll()
--

commit 101ce767bdad155741f87e7d7cf56f7779db6402
Author: Miquel Raynal <miquel.raynal@bootlin.com>

mtd: spi-nor: Fix WRSR with ODTR chips

The ODTR interface requires an even number of bytes in each section of
the operation. spi_nor_spimem_setup_op() takes care of the opcode phase,
but we have to adapt the rest of the operation ourself.

> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index cf23094021daa..381bbc13f82ff 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -791,6 +791,17 @@ static int spi_nor_write_sr_ll(struct spi_nor *nor, =
u8 opcode, const u8 *sr,
>  	if (nor->spimem) {
>  		struct spi_mem_op op =3D SPI_NOR_WRSR_OP(opcode,
>  						       nor->bouncebuf, len);
> +		if (nor->reg_proto =3D=3D SNOR_PROTO_8_8_8_DTR) {
> +			if (len !=3D 1)
> +				return -EOPNOTSUPP;

[Severity: High]
Does this erroneously reject legitimate 2-byte register writes required for
DTR-enabled chips?

Looking at spi_nor_write_sr1_and_sr2(), it passes len =3D 2 to
spi_nor_write_sr_ll(), which is now broken by this check.

This propagates -EOPNOTSUPP out to userspace via spi_nor_sr_unlock(), resul=
ting
in a visible regression where Software Write Protection unlocking and flash
configuration fails for 8-8-8 DTR chips.

[Severity: High]
Does returning early here leave the Write Enable Latch (WEL) persistently a=
ctive
on the flash device?

Since spi_nor_write_sr_ll() calls spi_nor_write_enable(nor) earlier in the
function, this early return happens without executing the SPI command that =
would
naturally clear it. Leaving the hardware write-enabled risks accidental data
corruption from stray writes.

> +
> +			/*
> +			 * We don't want to write only one byte in DTR mode. So,
> +			 * duplicate the buffer and write 2.
> +			 */
> +			op.data.nbytes =3D 2;
> +			nor->bouncebuf[1] =3D nor->bouncebuf[0];
> +		}
> =20
>  		spi_nor_spimem_setup_op(nor, &op, nor->reg_proto);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261004-winbond-ma=
ster-spi-nor-w35t-v2-0-592f3300a70f@bootlin.com?part=3D7
