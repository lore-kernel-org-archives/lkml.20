Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4C0346D543
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 06:59:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790665167; cv=none; b=oREHHuxNrIf7H6XQcNHC8o0dxFef58iYDvWMA6KWiozXHH31B/QsOqa9fkYhpXYWRmezaik1MBjj5oCOXdLHLza95b3g2vWD/M5pImqOT+G+LrQlbqK+Q80MH0vA9ANQsW11tbvSpHdGutyJw899S4WyK6NJMwxWdeZU1SCV8QU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790665167; c=relaxed/simple;
	bh=UWVLWZyXDYDlzaVt7Fg6PV+OksofngpiQusPdVwnItI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=BabJufwvExu/PN3twcVn3R4SB3MDg4xzPi6f571W7IMF60YR200ydpbWC8qQg2CEIiPwzLvCWU/5nW2j73oeijmnEFQArwnXb+O4tLlUwoJFp/c9NEqeHi6FnDndHbE1k9maJzXjWbMYFFf18FlBwX5DrkEbtgbzZUKU/dzmeMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b2ywsVgY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b2ywsVgY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C12141F00898;
	Tue, 29 Sep 2026 06:59:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790665165;
	bh=eKuk0w82YoMCX6pJY2sLtmFN2U7gIqxLXRIr1iEF87U=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=b2ywsVgYRSOJM0BCnkvTWGkcgq0LvLfCOCpSuFCGFS9jIsRRCwQJXj9VB0s3ZbldP
	 6We4z+1kj8HMboNM/kwstBFpqsM7PBzpcYEbQCZ7yjGJjsypIaahg/b74n20u/bWDD
	 dEWG/VfF1Z9ed8uAAKL16Gs//+VUrZ57LoWVC7KclLxjOclUTiMuk4FZobkIP0bvFO
	 ZTaO6scHYQxgi8Om75hgdD3RVoAL/YceKzh0cYd4SfJZNpWvYMYa+/Se2NqhvCm4x/
	 DGyhXtXbsvkGlI5dV7Fdef4jZzY6GrQgMlVyGwuRwEhXMDEGEpe4TdZo7+1TfD/JfO
	 +REaTuljsqIAw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] mtd: spi-nor: clear the default RDCR opcode when
 entering Octal DTR
Reply-To: sashiko-reviews@lists.linux.dev
To: "Michael Walle" <mwalle@kernel.org>, "Takahiro Kuwano" <takahiro.kuwano@infineon.com>, "Pratyush
 Yadav" <pratyush@kernel.org>, "Miquel Raynal" <miquel.raynal@bootlin.com>, "Vignesh
 Raghavendra" <vigneshr@ti.com>, "Richard Weinberger" <richard@nod.at>, haibo.chen@oss.nxp.com
Cc: linux-mtd@lists.infradead.org, michael@walle.cc, linux-kernel@vger.kernel.org, "Haibo
 Chen" <haibo.chen@nxp.com>
In-Reply-To: <20260929-spi-nor-fix-v2-1-75440cfe4e76@nxp.com>
References: <20260929-spi-nor-fix-v2-1-75440cfe4e76@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 29 Sep 2026 06:59:24 +0000
Message-Id: <20260929065924.C12141F00898@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] mtd: spi-nor: compilation error accessing non-existent opcodes.rea=
d_sr2
- [High] mtd: spi-nor: modifying hallucinated opcode does not skip SR2 reads
- [Medium] mtd: spi-nor: permanent breakage of SR2 reads due to missing sta=
te restore
--

commit b3ebcb1264c5eaab828caba13b5a6ee56af80aa5
Author: Haibo Chen <haibo.chen@nxp.com>

mtd: spi-nor: clear the default RDCR opcode when entering Octal DTR

This commit attempts to skip invalid SR2 reads when switching to Octal DTR
mode by clearing a default RDCR opcode. It updates spi_nor_set_octal_dtr()
to clear read_sr2 on success.

> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index 8bc117b46e028..0f47d869cbb48 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -3238,10 +3238,16 @@ static int spi_nor_set_octal_dtr(struct spi_nor *=
nor, bool enable)
>  	if (ret)
>  		return ret;
> =20
> -	if (enable)
> +	if (enable) {
>  		nor->reg_proto =3D SNOR_PROTO_8_8_8_DTR;
> -	else
> +		/*
> +		 * The default RDCR is not a valid SR2 read in Octal DTR mode;
> +		 * clear it so SR2 reads are skipped instead of being issued.
> +		 */
> +		nor->params->opcodes.read_sr2 =3D 0;

[Severity: High]
Can this code compile successfully? struct spi_nor_flash_parameter (which
nor->params points to) does not appear to contain an opcodes field, which
would cause a build failure here.

[Severity: High]
If this dynamic opcode field did exist, would modifying it actually prevent
the SR2 reads?

Looking at spi_nor_read_sr2(), it seems the reads rely entirely on statical=
ly
hardcoded macros rather than dynamic configuration fields:

drivers/mtd/spi-nor/core.c:spi_nor_read_sr2() {
    ...
	if (nor->spimem) {
		struct spi_mem_op op =3D SPI_NOR_RDSR2_OP(sr2);
    ...
	} else {
		ret =3D spi_nor_controller_ops_read_reg(nor, SPINOR_OP_RDSR2, sr2,
						      1);
	}
    ...
}

Since SPI_NOR_RDSR2_OP and SPINOR_OP_RDSR2 are static constants, wouldn't
the reads still be issued regardless of this variable's state?

> +	} else {
>  		nor->reg_proto =3D SNOR_PROTO_1_1_1;
> +	}

[Severity: Medium]
When disabling Octal DTR, does this path also need to restore the cleared
opcode state?

If the opcode was zeroed when enabling the mode, dropping back to
SNOR_PROTO_1_1_1 without restoring it might leave SR2 reads permanently
disabled for the remaining lifetime of the device.

>  	return 0;
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260929-spi-nor-fi=
x-v2-1-75440cfe4e76@nxp.com?part=3D1
