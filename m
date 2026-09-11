Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ABD5346E5E
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 09:12:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789117971; cv=none; b=p7ZM7XjKy8WRxEwIAaLwkkofW6SWm4CyEUPOcSSCp4vCFj5EY0EKtiAzDQ0Rg9W0s1hXcxrMPIqcikou7GyOmIXxTNtdtApAZxs30WSuZ1tB2RqdznSuioLfuJDFNFrJY84pBWj1x4A22Az3yC54KQTiqDmUjMvm0WvhTKfrNBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789117971; c=relaxed/simple;
	bh=Hu78kufvk6uHF+MLulgqwbhqfipM64wRR8t1FV1Cs9s=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=CXlHSe6GbenMch+GbEp9736WnA+jmccTh9jLxhYGki/CqQH7Jkymi7dNsEM41INRht6rGGmC9jjKecsboJDD3HIoVmnxyX3mSY7gLMFhwIfKY6J0blZzoREO6I45RNaZUDbwq0PMhG6lJ7AjZlTD6bk6uCwWGS8sd6t7Sae6lHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZkXmTXpY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZkXmTXpY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 383221F000FF;
	Fri, 11 Sep 2026 09:12:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789117969;
	bh=HirL8e1DCCh13QCT80B26M8DkyqTvQzzFoROzZnoOrw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZkXmTXpYaewG1OVQ7Q58YgJloq0+LssD8KDAz2TNrrX9JGjxIDZ9OFkdThtMQ/X/A
	 oezwYxP0OhrSNw0Ln534bUt9AdvGdNNiqaG1fTQ6kMsblzqMEqnq31wQlLYK4kIGPz
	 flO4x9kI14t5ypBwh0APDA17P7lGi9H0hPztCyL9IJ0phB1MSIYdi9ZMJ5LuJn/F1H
	 IFIbBObILoBBeeLvixUByuJ3Fpb6sGZmN2r/Eu1Zg/0Bq3F028zxi+T8HLsJCt2gEx
	 2GGgiIczm5QOQftzAlXFPpk2UfHR7LSoflCWiwiBnn1OHky59Utwzz3Ec6Ax+EFPS6
	 uJjsXYdfZ5wxQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] mtd: spi-nor: Fix quad-enable for flashes with QER bit
 in SR1
Reply-To: sashiko-reviews@lists.linux.dev
To: "Miquel Raynal" <miquel.raynal@bootlin.com>, "Michael Walle" <mwalle@kernel.org>, "Pratyush
 Yadav" <pratyush@kernel.org>, "Takahiro Kuwano" <takahiro.kuwano@infineon.com>, "Richard
 Weinberger" <richard@nod.at>, "Vignesh Raghavendra" <vigneshr@ti.com>
Cc: "Jon Hunter" <jonathanh@nvidia.com>, linux-kernel@vger.kernel.org, "Steam
 Lin" <STLin2@winbond.com>, "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>, linux-mtd@lists.infradead.org
In-Reply-To: <20260911-perso-fix-spi-nor-qe-mxic-v1-1-fd6d91416a2a@bootlin.com>
References: <20260911-perso-fix-spi-nor-qe-mxic-v1-1-fd6d91416a2a@bootlin.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 11 Sep 2026 09:12:48 +0000
Message-Id: <20260911091249.383221F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [High] Unintended Register Corruption for Flashes with `qe_mask[0]` and a=
n Active SR2.

Pre-existing issues:
- [High] spi_nor_write_sr1_and_sr2_and_check() still fails unconditionally =
for flashes without SR2 if the QE bit needs to be set.
--

commit f2fd5923d5c3121a4c7513816b2b4ce3fb7e3a48
Author: Miquel Raynal <miquel.raynal@bootlin.com>

mtd: spi-nor: Fix quad-enable for flashes with QER bit in SR1

The patch modifies spi_nor_generic_quad_enable to only read SR1 when
qe_mask[0] is set. This aims to fix probe failures on flashes lacking
an SR2.

Closes: https://lore.kernel.org/linux-mtd/178876719232.3543902.144516250376=
76421254.b4-ty@b4/T/#m5bc4ba6776436f2870ced0eb5789d229037ad840

> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index e2b6efafdd8d0..ac909dfb9657c 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -985,7 +985,10 @@ static int spi_nor_generic_quad_enable(struct spi_no=
r *nor)
>  	if (!qe_mask[0] && !qe_mask[1])
>  		return 0;
> =20
> -	ret =3D spi_nor_read_sr1_and_sr2(nor, sr);
> +	if (qe_mask[0])
> +		ret =3D spi_nor_read_sr1(nor, sr);

[Severity: High]
If qe_mask[0] is set and the flash has an active SR2, does this leave sr[1]
unpopulated as 0x00 without ensuring the flash actually lacks a two-byte
write opcode?

Later in this function, if the QE bit is not already set, it calls:

    return spi_nor_write_sr1_and_sr2_and_check(nor, sr);

This will invoke the helper which executes the two-byte write_sr1_and_sr2
opcode if set, writing the unpopulated sr[1] (0x00) to the flash's SR2/CR.
Can this corrupt the flash state and fail the validation check if the second
byte reads back as non-zero?

> +	else
> +		ret =3D spi_nor_read_sr1_and_sr2(nor, sr);
>  	if (ret)
>  		return ret;
> =20

[Severity: High]
This is a pre-existing issue, but does this still fail unconditionally for
flashes without SR2 if the QE bit needs to be set?

If the QE bit is not already set, spi_nor_generic_quad_enable() proceeds to
call spi_nor_write_sr1_and_sr2_and_check(), which reads both registers for
verification:

drivers/mtd/spi-nor/core.c:spi_nor_write_sr1_and_sr2_and_check() {
	...
	ret =3D spi_nor_read_sr1_and_sr2(nor, tmp);
	if (ret)
		return ret;
	...
}

Because read_sr2 is 0 for flashes lacking SR2, spi_nor_read_sr2() returns
-EINVAL. Doesn't this mean the generic helper still fails with -EINVAL duri=
ng
verification?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260911-perso-fix-=
spi-nor-qe-mxic-v1-1-fd6d91416a2a@bootlin.com?part=3D1
