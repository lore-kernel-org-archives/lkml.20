Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64CF53CD8CC
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 07:58:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788163111; cv=none; b=dd8jl0CYVtXdfgFZJJGTfAYQz5JXGexFrfHfSzWAnFSRhsY0qhlU1TwMLv7SdHMZVC/Ach6fJ9arsVTjZ0Bx0Iv4kQqlIbYRfJmRlC8X2T1n7o4f+A1PN6UYST0QVNyWTsoh+KwvwQtislDlgLRX/EpICfuzFffU3CC1XOTI2BU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788163111; c=relaxed/simple;
	bh=EGPjDI0+XNQD9BomGrlHbDCiBprSADR2F3Eq5Cr7F+Q=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=jpU1Ocjlvx4R4af5Zyd4zLlII+zD7Vbsyck7+sM8VSHoxO6E+EfWSIVzXQ9k35BkZzTZMqsZRcV0wUcDDPQPuCRZ5ks/gE68OR65y29Qftx5AY6jZeImxhBSI7iTjrQw1YOc24inGZ/8oKoERIMCdv2Gnbo6fWti8ZeUroHXJLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=v00XwBUu; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="v00XwBUu"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id E1B004E4145B;
	Mon, 31 Aug 2026 07:58:27 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B0402601E1;
	Mon, 31 Aug 2026 07:58:27 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 105B611C78A49;
	Mon, 31 Aug 2026 09:58:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788163103; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=6VS9OukhDHvRVzwm93zgb5rouKPCZo0HPtpOPRmhdLk=;
	b=v00XwBUuYsXjS0hTypk0UzN1sZBpQmBAva1i/EA6PSYqSbN2/057iAcEIqkGug25ImYD6Q
	taa8ADbooE41B94CWGlf6kONQWrSN7al1SXG2ec2TeVwH95O+xDJoIAao+rY7YhcnOCxuw
	4Qfq/SqWloqgPq2tNoOgYSEUnmTcw7KtseRaZm1dwSt7ERzxpk5HDg55jbD8xlO7pvptjB
	x2eiMKuVPq8l3QINNrI6mOd8Z856HnW9/2VqhMl0T8SzzcLvCrWkwCgLA6IyL+Y3kSfthp
	0G6t5t6yot2q0ly2o6LasCX7Pop/TcLTGlbRcyKIy493Vq7tGLT0cNyB4+f/Aw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Mehmet Fide <mehmet.fide@gmail.com>
Cc: Stefan Agner <stefan@agner.ch>,  Richard Weinberger <richard@nod.at>,
  Vignesh Raghavendra <vigneshr@ti.com>,  Boris Brezillon
 <bbrezillon@kernel.org>,  Frieder Schrempf <frieder.schrempf@kontron.de>,
  linux-mtd@lists.infradead.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] mtd: rawnand: vf610_nfc: fix false bitflips on
 reads of erased pages
In-Reply-To: <20260828085337.3916199-3-mehmet.fide@gmail.com> (Mehmet Fide's
	message of "Fri, 28 Aug 2026 10:53:37 +0200")
References: <20260828085337.3916199-1-mehmet.fide@gmail.com>
	<20260828085337.3916199-3-mehmet.fide@gmail.com>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Mon, 31 Aug 2026 09:58:19 +0200
Message-ID: <871pbed8mc.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3

Hi Mehmet,

On 28/08/2026 at 10:53:37 +02, Mehmet Fide <mehmet.fide@gmail.com> wrote:

> From: Mehmet Fide <mehmet.fide@screeningeagle.com>
>
> When the ECC engine fails to decode a page, the driver re-reads the OOB
> area with the engine bypassed, but runs the erased-page check for the
> data area on the buffer left in the controller SRAM by the failed
> transfer.
>
> That buffer does not hold what is on the flash: the failing engine
> writes a bogus single-bit "correction" into it. In the 60-byte ECC mode
> the all-0xff content of an erased page always decodes to the same error
> location, so every erased page shows one stale zero bit at data offset
> 0x5FD, which the erased-page check then reports as a corrected bitflip.
>
> Edward Karpicz discovered this behaviour and identified the offset on a
> Colibri VF61; the analysis and the fix build on his finding. Measured
> with an instrumented driver on a Colibri VF50 (MX30LF1G18AC, 32-bit
> ECC): reading a 126 MiB partition with nanddump increased the corrected
> counter by 18035, exactly one per erased page, while raw reads of the
> same pages return clean 0xff. A v4.4 kernel on the VF61 (MX30LF4G28AC)
> accumulates the same false counts, so the behaviour follows the
> controller rather than the chip or the driver generation. Neither the
> Vybrid reference manual nor the published mask set errata (VFXXX_2N02G)
> document it. The 45-byte ECC mode is not affected.
>
> Restoring the known byte is not enough: on pages that fail to decode
> with content other than all-0xff the engine writes its correction
> wherever the syndrome points (measured at a different offset on such a
> page), so the check has to run on what the flash holds. Re-read the data
> area with the ECC engine bypassed, exactly as already done for the OOB
> area. The corrected counter then stays at zero on both boards.
>
> Reported-by: Edward Karpicz <webmaster@toradex.com>
> Link: https://community.toradex.com/t/colibri-vf50-vf61-on-the-current-bs=
p-mainline-u-boot-v2026-07-and-linux-6-18-lts/30735
> Signed-off-by: Mehmet Fide <mehmet.fide@screeningeagle.com>
> ---
> v2:
>  - the no-ECC re-read and the erased-page check use the clamped spare
>    size instead of mtd->oobsize
>  - condense the re-read comment to one line
>  - Reported-by/Link trailer order fixed (checkpatch)
>
>  drivers/mtd/nand/raw/vf610_nfc.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/mtd/nand/raw/vf610_nfc.c b/drivers/mtd/nand/raw/vf61=
0_nfc.c
> index 9104db19dd29..ffcf66f96c7f 100644
> --- a/drivers/mtd/nand/raw/vf610_nfc.c
> +++ b/drivers/mtd/nand/raw/vf610_nfc.c
> @@ -520,6 +520,7 @@ static inline int vf610_nfc_correct_data(struct nand_=
chip *chip, uint8_t *dat,
>  	u8 ecc_status;
>  	u8 ecc_count;
>  	int flips_threshold =3D nfc->chip.ecc.strength / 2;
> +	int ret;
>=20=20
>  	ecc_status =3D vf610_nfc_read(nfc, ecc_status_off) & 0xff;
>  	ecc_count =3D ecc_status & ECC_STATUS_ERR_COUNT;
> @@ -527,9 +528,15 @@ static inline int vf610_nfc_correct_data(struct nand=
_chip *chip, uint8_t *dat,
>  	if (!(ecc_status & ECC_STATUS_MASK))
>  		return ecc_count;
>=20=20
> +	/* The failed decode leaves a bogus correction in SRAM; re-read without=
 ECC */
>  	nfc->data_access =3D true;
> -	nand_read_oob_op(&nfc->chip, page, 0, oob, vf610_nfc_spare_size(mtd));
> +	ret =3D nand_read_page_op(&nfc->chip, page, 0, dat,
> nfc->chip.ecc.size);

chip.ecc.size is not covering the whole data buffer. You should be
reading mtd->writesize + mtd->oobsize, no? Otherwise you only overwrite
the first ECC step (out of 2/4/8 depending on the configuration of
the ECC engine).

> +	if (!ret)
> +		ret =3D nand_read_oob_op(&nfc->chip, page, 0, oob,
> +				       vf610_nfc_spare_size(mtd));
>  	nfc->data_access =3D false;
> +	if (ret)
> +		return ret;
>=20=20
>  	/*
>  	 * On an erased page, bit count (including OOB) should be zero
>  	or

Unrelated, but this comment is wrong, we accept up to <strength>
bitflips. Not a big deal though, the impact is very limited.

Thanks,
Miqu=C3=A8l
