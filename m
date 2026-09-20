Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 351764398F5
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 14:12:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789913534; cv=none; b=JdPI/5VcpdLB4ZNofCveb2fhYrISEI+BHBFAU9EfWAriDlQQzSIGo14iGeFX60wBHf2L4ssFy3P+hgikTm5GQ+3+H/bTTiBd7meIcS0PkpJYG4dt+HV9pimD5Cd8TFcsITxxAnL6agLFMqFmcas0W26Nj67A6qtNdqPs3orlq5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789913534; c=relaxed/simple;
	bh=AOFlzTmXsOMyMQB7yTW6ae66O+8yNVHZJ42DpqWAE3E=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=CFRXkPfW38vU7QnPBoV+0bGAQjqJhj8juBV8vk784RSxAQy5Fd1tcMHrUhaPVu9Ux2HuzITZPNKdExNsL+whaUgdgEfdf1/rdKxPg9ks9SI0MjRCwjzDsm/oZJHSAqGZjwT2LPi8jFE+/Lk7Kod76x7YkVIkcgJjSIXze49T+hw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Zmpz8DrX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Zmpz8DrX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B32B51F000FF;
	Sun, 20 Sep 2026 14:12:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789913531;
	bh=ooPm1z4Hk459Nv++8dOZ7VzieNwEt094pfRrZ3nLsn4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Zmpz8DrX2qKFr5Sj0eBCeNPfAqJmTrepgGk4KkUmHit7nqVavyRoy+b3lpQaxbBt/
	 s3hq6M634ooQLmBiowHKXu9dtXDVYpibSxVGvT3F64E/FHfPn5C6dR7UGrPjVJ8xq1
	 yRaJD5ox2/Jknc47KXhbCKNXIVIsgR5p5Yd1o95PDYBkV65mUNdi7r+P7jkZUgRjBB
	 BUNYztkSy+RRL3lM/rYZ7n5EFEGKuIGGB342/w4qNDtkoHoj0i8EX1McPyebBOywY7
	 KsPGajwSSSt+IqGST8UY0RNoOFmqUj+DAZFxz+W3FiH3xgJnsr37Nd3xY66O4FpLZ5
	 0mlJPsMe+hVqg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 17/25] mtd: spi-nor: winbond: Add support for
 W25Q33PW-Q/N
Reply-To: sashiko-reviews@lists.linux.dev
To: "Pratyush Yadav" <pratyush@kernel.org>, "Miquel Raynal" <miquel.raynal@bootlin.com>, "Takahiro
 Kuwano" <takahiro.kuwano@infineon.com>, "Michael Walle" <mwalle@kernel.org>, "Vignesh
 Raghavendra" <vigneshr@ti.com>, "Richard Weinberger" <richard@nod.at>
Cc: "Steam Lin" <STLin2@winbond.com>, linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, "Thomas
 Petazzoni" <thomas.petazzoni@bootlin.com>
In-Reply-To: <20260920-winbond-master-spi-nor-jw-cleanup-pw-addition-v2-17-ab9c9688d071@bootlin.com>
References: <20260920-winbond-master-spi-nor-jw-cleanup-pw-addition-v2-0-ab9c9688d071@bootlin.com>
 <20260920-winbond-master-spi-nor-jw-cleanup-pw-addition-v2-17-ab9c9688d071@bootlin.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 20 Sep 2026 14:12:10 +0000
Message-Id: <20260920141210.B32B51F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] spi-nor: winbond: commit message claims ECC support for W25Q33PW=
-Q/N but code excludes it
--

commit a0e0dc16aaef35a04a300d228b7e07949d22b31b
Author: Miquel Raynal <miquel.raynal@bootlin.com>

mtd: spi-nor: winbond: Add support for W25Q33PW-Q/N
   =20
There is an ID collision with chips of same density from the JW family
(which it self conflicted with yet another family). Chips are very
similar in practice, it is mostly a matter of electrical differences
(mostly power consumption being lower) as well as the addition of inline
ECC capability.

>     There is an ID collision with chips of same density from the JW family
>     (which it self conflicted with yet another family). Chips are very
>     similar in practice, it is mostly a matter of electrical differences
>     (mostly power consumption being lower) as well as the addition of inl=
ine
>     ECC capability.
>    =20
>     16 bytes chunks are protected against single errors. In case a
>     non-aligned write happens, ECC is locally disabled until the next era=
se.

[Severity: Medium]
Does the W25Q33PW-Q/N actually have ECC support?

The commit message claims it does, but this patch maps the W25Q33PW-Q/N to
ID 0xef 0x60 0x16. There is existing logic that explicitly excludes this
density from ECC configuration:

drivers/mtd/spi-nor/winbond.c:winbond_pw_with_ecc_match() {
	...
	/* W25QxxPW densities <=3D 32 Mbit (id[2] <=3D 0x16) do not have built-in =
ECC support */
	return id->len =3D=3D 3 && id->bytes[2] >=3D 0x17;
}

Because id->bytes[2] is 0x16, this function will return false and ECC won't
be enabled.

Could the commit message be inaccurate, or does the ECC exclusion logic need
to be updated to support the W25Q33PW-Q/N?

> diff --git a/drivers/mtd/spi-nor/winbond.c b/drivers/mtd/spi-nor/winbond.c
> index a2dea77dfc2ce..6934f3e10ec3f 100644
> --- a/drivers/mtd/spi-nor/winbond.c
> +++ b/drivers/mtd/spi-nor/winbond.c
> @@ -373,7 +373,7 @@ static const struct flash_info winbond_nor_parts[] =
=3D {
>  		.flags =3D SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB,
>  		.no_sfdp_flags =3D SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
>  	}, {
> -		/* W25Q32DW-P/G, W25Q32FW-G/Q, W25Q32JW-Q/N */
> +		/* W25Q32DW-P/G, W25Q32FW-G/Q, W25Q32JW-Q/N, W25Q33PW-Q/N */
>  		.id =3D SNOR_ID(0xef, 0x60, 0x16),
>  		.name =3D "w25q32dw",
>  		.size =3D SZ_4M,

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260920-winbond-ma=
ster-spi-nor-jw-cleanup-pw-addition-v2-0-ab9c9688d071@bootlin.com?part=3D17
