Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B6302EACEF
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 10:54:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790852084; cv=none; b=BpR42+Kh9yp94fXLIAkQJFldRmEHMz5BkoxSgs0KgV3ycKBi7uMhD7e/0t0ATP77ETQ+VeUT6A1t6vndFxvQr9BqSwtdjnnHRwv76waaSOJquQkvJqkp7yzL0dJAga2mUaYhVkUewkI5nKbbHsQO8x5iUIGUa086egIAS0/D1C0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790852084; c=relaxed/simple;
	bh=DEu9NPbD2I8F0rV/ho3rXu1inyT18/1jBVar9d2aGN4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=NC3K4HQkVXt/GxeYHuo9mFIEfKco0Xqli6o8jpFMnhy33iHvucDE90Z2jwZg/DieYltbBX2x3Fz1oJPDLUMZlhrn/cFyCLtoCb67DZjtJJSENtfXgnhVUkPUVq+WIA+hSdpo9uk4t6q1viax4uqcmiwDOAADnLowYd5nQAOmrhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=1VteOxYt; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="1VteOxYt"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id E70514E410F0;
	Thu,  1 Oct 2026 10:54:38 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id BA02E60341;
	Thu,  1 Oct 2026 10:54:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1D7F2103281EA;
	Thu,  1 Oct 2026 12:54:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790852074; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=e8IYci6+q2vr8BbuoelQ5417mWlfR58G3RY1mNgh/H0=;
	b=1VteOxYtU4wlQMtBhAUTO5ju27XR+/kFHqMWVcN5wQLwGpmpaD7nlX7+q3V6zsIjym9dr6
	+WaeC8OlY9vHLpMLwpMpMiwGMK3bYvdoRV4jRcryXyPTQ95+AomL7d1I9mKWszVSquhx4S
	6FUY+H7sl7a0/pp+xeonwSId0oYjiSjic7/JU7dpn6jFZER1RTulaUffw9Z20ow5RBXhvS
	qobLlQ2rbGi87Hdtndj1qHd3N0Txwjr8nf7dw19LvwNPNcVsKe6IehqSDslFsgLErUPuVt
	vsGbBuO6Ox+hnpvNH7qOHHyxl+hYe2rzsRbgifDgMdx0/ieylCeZoCGeMG3mWQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: wang wei <a929244872@163.com>
Cc: richard@nod.at,  vigneshr@ti.com,  bbrezillon@kernel.org,
  yamada.masahiro@socionext.com,  wenyou.yang@microchip.com,
  linux-mtd@lists.infradead.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drivers/mtd: rawnand: nandsim: Fix stale
 NAND_ROW_ADDR_3 with overridesize
In-Reply-To: <20261001103359.20216-1-a929244872@163.com> (wang wei's message
	of "Thu, 1 Oct 2026 18:33:59 +0800")
References: <20261001103359.20216-1-a929244872@163.com>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Thu, 01 Oct 2026 12:54:28 +0200
Message-ID: <875wzlofmj.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3

Hi Wang,

On 01/10/2026 at 18:33:59 +08, wang wei <a929244872@163.com> wrote:

> The overridesize module parameter changes the size of the simulated
> device after nand_scan() has completed. It updates nsmtd->size,
> memorg->eraseblocks_per_lun, chip->chip_shift and chip->pagemask to
> match the new geometry, but leaves the NAND_ROW_ADDR_3 option
> untouched, even though nand_scan_ident() set it from the geometry
> decoded out of the ID bytes.
>
> When the ID bytes describe a device larger than 128 MiB and
> overridesize shrinks the simulation to 128 MiB or less, the stale
> option makes the core emit one extra row address byte (page >> 16,
> always zero given the reduced page count) in every read, program and
> erase operation, while the simulator state machine expects one byte
> less. All accesses then fail with:
>
>     nandsim: error: write_byte: address (0x0) isn't expected, expected
>     state is STATE_CMD_READSTART, switch to STATE_READY
>
> The opposite direction is equally broken: growing a small device past
> 128 MiB keeps NAND_ROW_ADDR_3 cleared, so the third row address byte
> is dropped and the wrong pages are silently addressed.

Fine until here.

> This used to work before commit 14157f861437 ("mtd: nand: introduce
> NAND_ROW_ADDR_3 flag"). Back then nandsim kept chip->chipsize in sync

                                   ,

> with the override, and nand_command_lp() decided at run time, per
> command, whether the third row address cycle was needed by testing
> chip->chipsize against 128 MiB. The decision thus always saw the

"The decision"?

> overridden size. The above commit moved the decision to
> nand_scan_ident(), which encodes it once into NAND_ROW_ADDR_3 at
> scan time -- before nandsim applies the override -- and the
> overridesize path was never taught to re-evaluate the flag. The
> commit that introduced the regression is:
>
>     https://git.kernel.org/torvalds/c/14157f861437ebe2d624b0a845b91bbdf8c=
a9a2d

This is not needed, you mention it above and below already.

> Re-evaluate NAND_ROW_ADDR_3 right after overriding chip_shift, using
> the same test as nand_scan_ident(), so that the address width emitted
> by the core always matches ns->geom.pgaddrbytes, which ns_init()
> derives from the overridden total size.
>
> Fixes: 14157f861437 ("mtd: nand: introduce NAND_ROW_ADDR_3 flag")

Cc: stable

> Signed-off-by: wang wei <a929244872@163.com>
> ---
>  drivers/mtd/nand/raw/nandsim.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>
> diff --git a/drivers/mtd/nand/raw/nandsim.c b/drivers/mtd/nand/raw/nandsi=
m.c
> index fe96803..176db89 100644
> --- a/drivers/mtd/nand/raw/nandsim.c
> +++ b/drivers/mtd/nand/raw/nandsim.c
> @@ -2359,6 +2359,18 @@ static int __init ns_init_module(void)
>  		targetsize =3D nanddev_target_size(&chip->base);
>  		chip->chip_shift =3D ffs(nsmtd->erasesize) + overridesize - 1;
>  		chip->pagemask =3D (targetsize >> chip->page_shift) - 1;
> +
> +		/*
> +		 * NAND_ROW_ADDR_3 was set by nand_scan_ident() from the
> +		 * geometry decoded out of the ID bytes, which the size
> +		 * override has just made stale. Re-evaluate it against
> +		 * the new geometry, otherwise the core emits one more (or
> +		 * one less) row address byte than the simulator expects.
> +		 */

Everything above this line can just be deleted. Tell your LLM that this
is obvious enough and does not require any particular comment.

> +		if (chip->chip_shift - chip->page_shift > 16)
> +			chip->options |=3D NAND_ROW_ADDR_3;
> +		else
> +			chip->options &=3D ~NAND_ROW_ADDR_3;
>  	}
>=20=20
>  	ret =3D ns_setup_wear_reporting(nsmtd);

Instead of repeating the operation in nandsim, why not calling
nand_scan() after over writing the size? (inverting the two blocks)

Thanks,
Miqu=C3=A8l
