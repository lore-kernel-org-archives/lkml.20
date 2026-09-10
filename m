Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9074396B76
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 04:26:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789014381; cv=none; b=jEB40kD/0QGm+N9cnkwszcE4ZkD1BDewCV+o7k/bRPl1RD91XDMid9EKRbkpv4MboFVhDOKaV1C4G/jNA+j/fhRZLcu90rIx5KbU7a+jZl/OMitzSrh2ZvgCInJ5prgPC9hed3TA3vvcDYVinP7UszI6nNQm4z0kgKCP27PJm1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789014381; c=relaxed/simple;
	bh=061LFgQp18L4PupwwtZzn8CT5+cZ0kYlkLMp2SmK5P8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=SD94Sso1M/TTZlxu3QZWBAef5d7CXmt4jcr8VYDDTfneOMDPSpQEQGIQjCMDOd2DuPtZgouj6SBiIK1x/DZXonJro9CPG8zBsF9fjO3XtRmK4Yn0ctU4ITFk05leiDsiMAv6AkTG44qWXV+PJL0m61UhgsZqN925du5SSWyD0Us=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PExRhWUN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PExRhWUN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A3731F000FF;
	Thu, 10 Sep 2026 04:26:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789014379;
	bh=bDcKLcxvVz5jOSgqx4gz4DvfE/OssiYpCZIPKOjIx0o=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=PExRhWUNzCVae33RzxiWAVbydHGHhUgpEI5j8UnFkOweIb3szOTqIBXqgILowg8Ly
	 PJeS0MAzyto8lIspWJ/xKgN8xAZegnnGp4bZQpE97DwXieF26zRMiltUXJ249beJq8
	 W/H6mwSOt8GQsVr+Iex6gbhVHUdovBJpniVQ7Hd2UFeFtJ9mnQT05+uoB3OpRlfj7t
	 40Ug2Led+waMW3O+/oumKc3nJaPu+xERBkWj4vTx58O/rwkZeKgDHdbmd2BtajcTdX
	 /3TFjFhN+HvjryJLGbPDvt2x24n/n+3vNQothfpOSkKquCMo/kmUwLM6fLH62nG2TH
	 vCr2l2y5TpGGQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4] mtd: spinand: cache the last read page to avoid
 redundant SPI operations
Reply-To: sashiko-reviews@lists.linux.dev
To: "Zongzhen Feng" <1768315307@qq.com>, "Vignesh Raghavendra" <vigneshr@ti.com>, "Miquel
 Raynal" <miquel.raynal@bootlin.com>
Cc: linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, "Richard
 Weinberger" <richard@nod.at>
In-Reply-To: <tencent_522792EE6F63A5581C238FF17E9862F10A08@qq.com>
References: <tencent_E818586423F2F16D98DEF1EC2723EE4A6308@qq.com>
 <tencent_522792EE6F63A5581C238FF17E9862F10A08@qq.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 10 Sep 2026 04:26:18 +0000
Message-Id: <20260910042619.2A3731F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [Critical] Partial page reads with software/host ECC cause silent data co=
rruption on subsequent cache hits due to incomplete cache updates.
- [Critical] Cache hit logic fails to check the Logical Unit Number (LUN), =
leading to cross-LUN cache aliasing.
- [High] Missing cache invalidation on OOB/OTP writes causes cached reads t=
o return clobbered data.
- [High] Error handling leaves cache valid with uncorrected data on non-EBA=
DMSG errors.
--

commit 5e46633e4cdf72f3fb112f28479efe0c2e5ed5d8
Author: Zongzhen Feng <1768315307@qq.com>

mtd: spinand: cache the last read page to avoid redundant SPI operations

This patch caches the last successfully read page in the SPI NAND driver to
avoid redundant SPI read operations when accessing smaller sectors (like 512
bytes) within a larger page. It serves repeated reads directly from a bounce
buffer and attempts to invalidate the cache during writes, erases, and
errors.

> diff --git a/drivers/mtd/nand/spi/core.c b/drivers/mtd/nand/spi/core.c
> index 43bbe2629b85b..a742a1cb572a4 100644
> --- a/drivers/mtd/nand/spi/core.c
> +++ b/drivers/mtd/nand/spi/core.c
[ ... ]
> @@ -577,6 +578,13 @@ static int spinand_read_from_cache_op(struct spinand=
_device *spinand,
>  			       req->ooblen);
>  	}
> =20
> +	if (req->datalen && !req->continuous && req->mode !=3D MTD_OPS_RAW) {
> +		spinand->cur_target_cache =3D req->pos.target;
> +		spinand->cur_block_cache =3D req->pos.eraseblock;
> +		spinand->cur_page_cache =3D req->pos.page;
> +		spinand->cache_valid =3D true;
> +	}
> +

[Severity: Critical]
Is it necessary to include the Logical Unit Number (LUN) in this cache logi=
c?

The SPI NAND subsystem supports devices with multiple LUNs per target. The
nand_pos structure includes a lun field to address these, but this mechanism
tracks identity using only the target, eraseblock, and page.

Could this cause a read from one LUN to falsely hit the cache and serve data
from a different LUN when accessing the exact same eraseblock and page inde=
x?

>  	return 0;
>  }
> =20
> @@ -780,7 +788,12 @@ int spinand_read_page(struct spinand_device *spinand,
>  	if (ret)
>  		return ret;
> =20
> -	return nand_ecc_finish_io_req(nand, (struct nand_page_io_req *)req);
> +	ret =3D nand_ecc_finish_io_req(nand, (struct nand_page_io_req *)req);
> +	if (ret > 0 && req->datalen && !req->continuous && req->mode !=3D MTD_O=
PS_RAW)
> +		memcpy(spinand->databuf + req->dataoffs, req->databuf.in,
> +		       req->datalen);
> +
> +	return ret;
>  }

[Severity: Critical]
Are partial page reads handled correctly here?

When a partial page read occurs, the full page is loaded into the cache and
marked valid, but only the requested req->datalen bytes are corrected by the
ECC engine and explicitly copied back to spinand->databuf. The remainder of
the cached page remains raw and uncorrected.

Will subsequent reads requesting a different chunk of the same page hit the
cache, bypass the SPI read and ECC correction, and return uncorrected data?

[ ... ]
> @@ -849,6 +862,20 @@ static int spinand_mtd_regular_page_read(struct mtd_=
info *mtd, loff_t from,
>  		if (disable_ecc)
>  			iter.req.mode =3D MTD_OPS_RAW;
> =20
> +		if (spinand->cache_valid && !disable_ecc &&
> +		    !iter.req.ooblen &&
> +		    iter.req.pos.target =3D=3D spinand->cur_target_cache &&
> +		    iter.req.pos.eraseblock =3D=3D spinand->cur_block_cache &&
> +		    iter.req.pos.page =3D=3D spinand->cur_page_cache) {
> +			if (iter.req.datalen)
> +				memcpy(iter.req.databuf.in,
> +				       spinand->databuf + iter.req.dataoffs,
> +				       iter.req.datalen);
> +			ops->retlen +=3D iter.req.datalen;
> +			ops->oobretlen +=3D iter.req.ooblen;
> +			continue;
> +		}
> +
>  		ret =3D spinand_select_target(spinand, iter.req.pos.target);
>  		if (ret)
>  			break;
> @@ -858,6 +885,9 @@ static int spinand_mtd_regular_page_read(struct mtd_i=
nfo *mtd, loff_t from,
>  		if (ret < 0 && ret !=3D -EBADMSG)
>  			break;
> =20
> +		if (ret =3D=3D -EBADMSG)
> +			spinand->cache_valid =3D false;
> +

[Severity: High]
Could the cache be left valid with uncorrected data if a non-EBADMSG error
occurs?

In spinand_read_from_cache_op(), raw data is loaded into the cache buffer a=
nd
spinand->cache_valid is prematurely set to true. If the subsequent
nand_ecc_finish_io_req() fails with a non-EBADMSG error (such as -ERANGE fr=
om
software BCH ECC layout parsing, or -ETIMEDOUT from a hardware engine),
spinand_read_page() propagates this error.

When the loop breaks here on ret < 0 && ret !=3D -EBADMSG, the cache is not
invalidated.

Will a subsequent access to the same page incorrectly hit the cache and ret=
urn
the uncorrected data as a success?

[ ... ]
> @@ -1080,6 +1110,8 @@ static int spinand_mtd_write(struct mtd_info *mtd, =
loff_t to,
>  		if (ret)
>  			break;
> =20
> +		spinand->cache_valid =3D false;
> +
>  		ret =3D spinand_write_page(spinand, &iter.req);
>  		if (ret)
>  			break;

[Severity: High]
Are other write paths missing cache invalidation?

While this patch correctly invalidates the cache in spinand_mtd_write() and
spinand_erase(), other write paths like spinand_markbad() and
spinand_otp_rw() also invoke spinand_write_page().

Because spinand_write_to_cache_op() unconditionally overwrites the shared
data buffer (spinand->databuf) with 0xFFs during any write operation, this
can cause the cache buffer to be clobbered while spinand->cache_valid
remains true.

Will subsequent reads to the cached coordinates falsely hit the cache and
return clobbered data instead of the actual page contents?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/tencent_522792EE6F6=
3A5581C238FF17E9862F10A08@qq.com?part=3D1
