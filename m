Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F8BE480350
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 10:12:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788430352; cv=none; b=Wzg0xHTlXU0pvi+W7re9fRHBXwkXi+HvBmAIdy+e9UWFXK8FfhqglKeEUP8JO8OWdv7hzywodWV/zN1Nf3IInYnxqqEcFfnUHSN8sNl3D19YH0QQL99i7xO+sEEg+lZag/F9cPhR3cho3z7XY8955OFp5mDig/6Y3AB8caejf7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788430352; c=relaxed/simple;
	bh=fEGKCqSobthtdkGMbtm396REFMMLWywnBL2CXfGFGdA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=ap1+aBnVLRbxJXSoRgi+s/Lq8GjAkiQsVdggZh+XOg9D8Ykvb5VShEt3fXeZveJafVgRXDJDsvrw5GANz3tfQVJNuKlQZ6RfxkxOB4QEGmlThvqdFghyiWb347zVTLdQvSJacbNh9gDnUCj+mLIN6HV+p/KEeSUdJKRdvZLVslI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=EDiSyxYI; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="EDiSyxYI"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 6779E1A1976;
	Thu,  3 Sep 2026 10:12:22 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3A191602B8;
	Thu,  3 Sep 2026 10:12:22 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 71A6311C792CB;
	Thu,  3 Sep 2026 12:12:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788430337; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=mmDiW4nL2EI7VVEvJaPt9BPba+nRmMBr4HdkzV+ci7U=;
	b=EDiSyxYIouHPQ3lMN0v8lPtyL0q1L+GgxjtQH5BYknT9kNKz8TX8n3ktWCa2aACcznksDP
	UYWGCXJpIp9sR2OCIFBelhFXERdWIDEskqeHQS+wbum/otRs2BkoyJWDg+4VzWiKxtvqhp
	2nbrJy6QbYJpvNQEEVnecAIrPA8KRwy7GJwloC+7DqPhCWARqgnfxV7JaPgke6lYoGJny6
	Wl8tnatAXSdyt4RTnUQT2XDcNviUlcztSi/gVhhZrqqPf/KTVXM1005gd2wRiSKirYA+g0
	dTZuSWlrQNajuiqWadqu+kApgiGvzBo8XHh2AhA3Myyplcxg94qbefJBMrTFAQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Nuno =?utf-8?Q?S=C3=A1?= <nuno.sa@analog.com>
Cc: linux-mtd@lists.infradead.org,  linux-kernel@vger.kernel.org,  Richard
 Weinberger <richard@nod.at>,  Vignesh Raghavendra <vigneshr@ti.com>
Subject: Re: [PATCH] mtd: spinand: winbond: Add support for W25N08LW
In-Reply-To: <20260831-mtd-nand-new-chip-support-v1-1-dca9f63ac0f9@analog.com>
	("Nuno =?utf-8?Q?S=C3=A1=22's?= message of "Mon, 31 Aug 2026 16:38:10
 +0100")
References: <20260831-mtd-nand-new-chip-support-v1-1-dca9f63ac0f9@analog.com>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Thu, 03 Sep 2026 12:12:15 +0200
Message-ID: <87h5k64pa8.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3

On 31/08/2026 at 16:38:10 +01, Nuno S=C3=A1 <nuno.sa@analog.com> wrote:

> Add support for the W25N08LW, a 1.8V 8Gbit SPI-NAND made of two
> 4Gbit LUNs, with 4096-byte pages and 256 bytes of spare area.
>
> The chip reuses the KV ECC status helper, but needs its own OOB
> layout because the geometry of its spare area differs from the
> existing Winbond parts. Only half of it is visible while the
> internal ECC is enabled, so the ECC region is reported as
> inaccessible and just the free bytes are exposed.
>
> Assisted-by: Claude:Opus-5
> Signed-off-by: Nuno S=C3=A1 <nuno.sa@analog.com>
> ---
>  drivers/mtd/nand/spi/winbond.c | 45 ++++++++++++++++++++++++++++++++++++=
++++++
>  1 file changed, 45 insertions(+)
>
> diff --git a/drivers/mtd/nand/spi/winbond.c b/drivers/mtd/nand/spi/winbon=
d.c
> index 9b78c1e6cbc9..c2c4cc306f05 100644
> --- a/drivers/mtd/nand/spi/winbond.c
> +++ b/drivers/mtd/nand/spi/winbond.c
> @@ -345,6 +345,41 @@ static const struct mtd_ooblayout_ops w25n02kv_oobla=
yout =3D {
>  	.free =3D w25n02kv_ooblayout_free,
>  };
>=20=20
> +static int w25n08lw_ooblayout_ecc(struct mtd_info *mtd, int section,
> +				  struct mtd_oob_region *region)
> +{
> +	/*
> +	 * With ecc enabled the parity bits are not accessible. So we can
> +	 * only see page + 128. Without ecc the full page + 256 is accessible.
> +	 * To make it simple just return the area as not accessible.
> +	 */
> +	return -ERANGE;
> +}
> +
> +static int w25n08lw_ooblayout_free(struct mtd_info *mtd, int section,
> +				   struct mtd_oob_region *region)
> +{
> +	if (section > 7)
> +		return -ERANGE;
> +
> +	region->offset =3D (16 * section);
> +	/* Note that we include User Data 2 which is not protected by ECC */

The more I think about these free bytes, the more I get convinced that
we should only expose ECC protected bytes. I honestly do not remember
any guarantee regarding these officially stated, the common case
(eg. UBI) there is no impact, but maybe it is best to only expose the
bytes that are actually protected, since the thresholds are getting
lower and lower (and chances to get bitflips there increase with the
optimizations of the technology).

Do you mind only exposing User Data 1?

Thanks,
Miqu=C3=A8l
