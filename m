Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2955939022A
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 12:34:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790944474; cv=none; b=Zo6Zh2Sn13XyWdoMzjw37MdunTWxVRJI0DUwY57ZCbU7ocl4jU1rrp+SsfltJ2yjWeRS6xzJBXx7cCQgyfEXAYyQVIY0PZVQqDvwco/PlpibuoXfR7PTNy3ZSSFkomZdpxk0Ih75QAMnF07QIowlCcGk9nX9ijcsXwuU4UFr3cc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790944474; c=relaxed/simple;
	bh=ImkuaEAv66C4Q++PvDbRQu9pYqJlPY5OoRykIfZHNu0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=rU2G/WtkPiY9e5iFa4h3cYVFQKQswASoIZLatBGcMiGf2becmsQMQYY4EtD94pzzCBcwLvsoI7JuC0xo8BQKyiYELVB/WQLY1E2DAaBOir/1luNmy0soEiexNb3Kf9tpy13X4s+sGTj374I4JZECxip8SZGpgAFOqTqdmgRQgZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Yj4AVLea; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Yj4AVLea"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42F6E1F00893;
	Fri,  2 Oct 2026 12:34:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790944472;
	bh=e1u+zWn9m4+gmnPgxV8/G3u58jfbnPhH4ksi4NqpCcs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Yj4AVLeaULYkZiUljW4bWcO8K7O6dJnemuPcj6nr9U3KEkg8IvMQ6ZKGl7F3RH2zv
	 /2Xmsx23fNLECqIIwZgY1XxTAll0fbdqMWypNNhG9wjpZdtrHXr/YlGa2E+Lxq6hrT
	 08X+iufbXnn1Hh5p4pMX9pbClcH3IfdpLqW7Rl3ch0qhhCMHPP49NqIv4pQSlmoJx6
	 lQDqn5/XWUh8ZE+U+CV/wqHtgJ57eJ9Js/raWkyJjTqLEg1Rc32Vp3WiEbvIzk5vMr
	 qXcj7yB5rdBWJklOYEAdQfhOZiT+/O/4wIN7ATuPEWyo+acMhRicVytvEFsuCDhZmV
	 HhrcLvZeHNV5g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 06/15] mtd: spi-nor: Fix WRSR with ODTR chips
Reply-To: sashiko-reviews@lists.linux.dev
To: "Richard Weinberger" <richard@nod.at>, "Takahiro Kuwano" <takahiro.kuwano@infineon.com>, "Miquel
 Raynal" <miquel.raynal@bootlin.com>, "Pratyush Yadav" <pratyush@kernel.org>, "Vignesh
 Raghavendra" <vigneshr@ti.com>, "Michael Walle" <mwalle@kernel.org>
Cc: linux-mtd@lists.infradead.org, "Steam Lin" <STLin2@winbond.com>, "Thomas
 Petazzoni" <thomas.petazzoni@bootlin.com>, linux-kernel@vger.kernel.org
In-Reply-To: <20261002-winbond-master-spi-nor-w35t-v1-6-a22a2f95c26e@bootlin.com>
References: <20261002-winbond-master-spi-nor-w35t-v1-0-a22a2f95c26e@bootlin.com>
 <20261002-winbond-master-spi-nor-w35t-v1-6-a22a2f95c26e@bootlin.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 02 Oct 2026 12:34:31 +0000
Message-Id: <20261002123432.42F6E1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] mtd: spi-nor: state leak in spi_nor_write_sr_ll() due to missing W=
EL cleanup
- [High] mtd: spi-nor: 16-bit status register writes erroneously rejected i=
n 8-8-8 DTR mode
--

commit 4a237a858739ae2cb0d065925cac15d3e9009a72
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
Does this early return leak the Write Enable Latch state?

In spi_nor_write_sr_ll(), spi_nor_write_enable() is called before this code
is reached, which transmits the WREN opcode to the flash chip and sets its
internal Write Enable Latch.

If len is not 1, this early return bypasses the execution of the intended W=
RSR
command and does not call spi_nor_write_disable() to manually clear the lat=
ch
bit.

Could this leave the flash globally write-enabled and vulnerable to acciden=
tal
data corruption?

[Severity: High]
Does this condition unintentionally reject 16-bit status register writes
in 8-8-8 DTR mode?

Callers like spi_nor_write_sr1_and_sr2() natively invoke spi_nor_write_sr_l=
l()
with len =3D 2 to write 16-bit status registers:

drivers/mtd/spi-nor/core.c:spi_nor_write_sr1_and_sr2() {
    ...
	if (params->opcodes.write_sr1_and_sr2)
		return spi_nor_write_sr_ll(nor,
					   params->opcodes.write_sr1_and_sr2,
					   sr, 2);
    ...
}

Returning -EOPNOTSUPP here blocks these valid operations without a fallback.

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
>

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261002-winbond-ma=
ster-spi-nor-w35t-v1-0-a22a2f95c26e@bootlin.com?part=3D6
