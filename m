Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AD0E330D25
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 14:41:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789137683; cv=none; b=Xf7wg4lhAGMGpl/XYAfPAH1NqvPsm7g3nD26/ZCs/sN9+6Rh3BSWWL+l8+4AMjcqFRPuo1FuqzniItKCzXbpnLUOwJsqAGD9qfegPetJmKfFDmNMCgNzUY0pwFRnF023N4R0EBo+GaJE0t9UzxXlx4IuRyZIro7qx+5nbKqNpSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789137683; c=relaxed/simple;
	bh=QYccRU8H/gzRwstiobodgqhgwv0Yo9ddmWdiqbrLYqM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=KdTDW3SQ4cu5LeL5novA4l03FzfF7HdqSfQzqk/RcXJ1jkKZMMTcvtCWH3hCbGOnDbTwkgvtiZE2Sb9fosG2DviozQ0J+Om8O8X3KtoR29LELFIlDnlRUNLafEqXswWREPfYtS9gqyCz2hshOvWsXnb0DMZoab6Eh9PGFdCnKhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=pOxEdfZT; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="pOxEdfZT"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 0C3951A010A;
	Fri, 11 Sep 2026 14:41:14 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C0CF1601DE;
	Fri, 11 Sep 2026 14:41:13 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1838E11C7AFAC;
	Fri, 11 Sep 2026 16:41:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789137668; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=v3N881ANTbgSYUw2pUytXhs3TJN2uAHfgP2ZynhyqsU=;
	b=pOxEdfZTZ+Rk89EO3XgzuvvZZ9NobasjADmGMXj/DnIHiaSGikgGzjV4lKR4AJwUX3y6WG
	FxYmIjzwpYQl31pSYb9cSFS2KEdGsGLib5ut4rEGDv6Wo4/ogak5sOMoBKF7QmPLf3L11X
	BcyNYQDOvZJnoLLQduFmbdQD4asTBmKuCEwqRjaaQUOl8irNOWrnk1/MmDflDvxvmVkzLO
	r3aQJwqT9hR5aE1xetvX5x6yrRQDiBkyzXimopJ0+GK6MbSOQCBOXzBQoZZwS80RYHmsoB
	WHNIro1Kx5YFrbAaIupES3IZoxVQSAjvEB958Fs9lBWPZG+9A7svTiJcfoS/iw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: sashiko-bot@kernel.org
Cc: "Pratyush Yadav" <pratyush@kernel.org>,  "Takahiro Kuwano"
 <takahiro.kuwano@infineon.com>,  "Michael Walle" <mwalle@kernel.org>,
  "Richard Weinberger" <richard@nod.at>,  "Vignesh Raghavendra"
 <vigneshr@ti.com>,  sashiko-reviews@lists.linux.dev,
  linux-mtd@lists.infradead.org,  "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>,  "Jon Hunter" <jonathanh@nvidia.com>,
  linux-kernel@vger.kernel.org,  "Steam Lin" <STLin2@winbond.com>
Subject: Re: [PATCH v3] mtd: spi-nor: Fix quad-enable for flashes with QER
 bit in SR1
In-Reply-To: <20260911142254.EF8021F000FF@smtp.kernel.org>
	(sashiko-bot@kernel.org's message of "Fri, 11 Sep 2026 14:22:54
	+0000")
References: <20260911-perso-fix-spi-nor-qe-mxic-v3-1-2ecaefb2ef2c@bootlin.com>
	<20260911142254.EF8021F000FF@smtp.kernel.org>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Fri, 11 Sep 2026 16:41:02 +0200
Message-ID: <87se3fq29t.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3

On 11/09/2026 at 14:22:54 GMT, sashiko-bot@kernel.org wrote:

> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
>
> Pre-existing issues:
> - [High] Spurious -EIO failure during write verification in
> spi_nor_write_sr1_and_sr2_and_check() for flashes with QER=3D4 or 5 (e.g.,
> BFPT_DWORD15_QER_SR2_BIT1_NO_RD).
> --
>
> commit 65f885da367814b98529830d97438f96b6f29aa0
> Author: Miquel Raynal <miquel.raynal@bootlin.com>
>
> mtd: spi-nor: Fix quad-enable for flashes with QER bit in SR1
>
> This commit attempts to fix quad-enable for flashes lacking an SR2 regist=
er
> by having the generic helper return 0 when SR2 reads are unsupported. It =
also
> updates the SFDP parsing step to assert that no chip has an SR2 write path
> without an SR2 read path.
>
> Reported-by: Jon Hunter <jonathanh@nvidia.com>
> Closes:
> https://lore.kernel.org/linux-mtd/178876719232.3543902.144516250376764212=
54.b4-ty@b4/T/#m5bc4ba6776436f2870ced0eb5789d229037ad840
> Fixes: 63489002d397 ("mtd: spi-nor: Refactor Read Status/Write Status sup=
port")
>
>> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
>> index e2b6efafdd8d0..62b53933927f2 100644
>> --- a/drivers/mtd/spi-nor/core.c
>> +++ b/drivers/mtd/spi-nor/core.c
>> @@ -864,7 +865,12 @@ int spi_nor_read_sr1_and_sr2(struct spi_nor *nor, u=
8 *sr)
>>  	if (ret)
>>  		return ret;
>>=20=20
>> -	return spi_nor_read_sr2(nor, &sr[1]);
>> +	if (nor->params->opcodes.read_sr2)
>> +		ret =3D spi_nor_read_sr2(nor, &sr[1]);
>> +	else
>> +		sr[1] =3D 0;
>
> [Severity: High]
> This is a pre-existing issue, but does forcing sr[1] to 0 here cause a
> spurious -EIO failure downstream during write verification?
>
> For flashes with QER=3D4 or 5 (e.g., BFPT_DWORD15_QER_SR2_BIT1_NO_RD), SF=
DP
> parsing disables reading SR2 (read_sr2 =3D 0) but retains a 16-bit write =
path
> via write_sr1_and_sr2 and sets qe_mask[1] =3D BIT(1).
>
> During quad enable, sr[1] gets populated with BIT(1) and is written using=
 the
> 16-bit command. However, spi_nor_write_sr1_and_sr2_and_check() verifies t=
he
> write by calling this function, which forcefully sets tmp[1] =3D 0.
>
> The check if (sr[0] !=3D tmp[0] || sr[1] !=3D tmp[1]) then compares sr[1]=
=3D0x02
> against tmp[1]=3D0x00, fails, and returns -EIO. This leaves probing compl=
etely
> broken for these flashes.

Michael you thought we had circled back to the previous version, you
were almost right, but with this new feedback, now we have :-)

But I see an easy way forward that can keep the atrocious hack in swp.c
like you want:

--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -966,7 +966,10 @@ int spi_nor_write_sr1_and_sr2_and_check(struct spi_nor=
 *nor, const u8 *sr)
        if (ret)
                return ret;
=20
-       if (sr[0] !=3D tmp[0] || sr[1] !=3D tmp[1])
+       if (sr[0] !=3D tmp[0])
+               return -EIO;
+
+       if (nor->params->opcodes.read_sr2 && sr[1] !=3D tmp[1])
                return -EIO;
=20
        return 0;

Basically we can just state that if we cannot read SR2 there is just no
point in comparing its content. It's probably more accurate anyway to do
it this way.

>> diff --git a/drivers/mtd/spi-nor/sfdp.c b/drivers/mtd/spi-nor/sfdp.c
>> index c21a6953db960..641f17ad51a09 100644
>> --- a/drivers/mtd/spi-nor/sfdp.c
>> +++ b/drivers/mtd/spi-nor/sfdp.c
>> @@ -656,7 +656,8 @@ static int spi_nor_parse_bfpt(struct spi_nor *nor,
>>=20=20
>>  	/* opcodes sanity check */
>>  	WARN_ON(!params->opcodes.read_sr1 ||
>> -		(!params->opcodes.write_sr1 && !params->opcodes.write_sr1_and_sr2));
>> +		(!params->opcodes.write_sr1 && !params->opcodes.write_sr1_and_sr2) ||
>> +		(!params->opcodes.read_sr2 && params->opcodes.write_sr2));
>
> [Severity: High]
> This isn't a bug introduced by this patch, but does this sanity check fai=
l to
> account for write_sr1_and_sr2?
>
> A chip can lack read_sr2 (read_sr2 =3D 0) and write_sr2 (write_sr2 =3D 0)=
, passing
> this WARN_ON, but still possess a valid SR2 write path via
> write_sr1_and_sr2.
>
> For QER=3D4 or 5, this means we can write to SR2 without being able to re=
ad it,
> which the WARN_ON fails to catch, giving a false sense of safety.

This one however is a false positive. We already handle that case
properly.

Miqu=C3=A8l
