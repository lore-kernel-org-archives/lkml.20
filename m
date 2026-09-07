Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D21B949EC62
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 12:33:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788784413; cv=none; b=PNQNt5uvnaKp2BFcANQPK2vxifHMKAGOT1Wv6E3KGNkX77W6WKJPh0SPeqHZYm7N2vkwBfw6QRCYzmqKTJ1EnC9FrrFK0zeE4yK6FQqvRE3YQGrp1HC5+ce7NBLcVOtNQh2+Wl7qijUuyfiBZlPjOdlD1LydabqQ79g0c2LzOlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788784413; c=relaxed/simple;
	bh=x+rnMz3UxMZp1QPjjZ0gTv+0tQNQczIVBHrZ3c3YAtE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=WhmDH4KDuJNUMEKJfKIlufrCr6PO6mg6s5BVc6A++JKOKDtrg+Xll1QZVhPcen/baOhTAAa+651U6OT4OeZ0mYe94Fq3Giw3UzMbUnqSVO6WkByvH5fv63awMHUg0IhPA+6qHeylvVmtNS6wGxwyYJ210lHlT5kXgC7Ls0RnkRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Ixpd1Skk; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Ixpd1Skk"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 370001A1A35;
	Mon,  7 Sep 2026 12:33:29 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 096D960383;
	Mon,  7 Sep 2026 12:33:29 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C21BD11C79353;
	Mon,  7 Sep 2026 14:33:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788784408; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=W3Swg/3Aww/HrVatIhFO5ktuwEuVhc0PGPbbJ75c/r8=;
	b=Ixpd1Skk8Ws8EbxOBNWcmd4NigI856JcjOJ9d691wpAYFNeZyAoS3LfYWMITdvzdMbfdJj
	jlH7b1ZkANQEmfPxaXJ0gr9LBMjQG49Pe8hgVV4pUjiw0V9SEMfJiNu3F8Ld7Do6J1Z+UR
	nVo3OGLmYeIMCQQ83ndB2O5eobO8CPpXt4r0FbmpIyDZgwQzfhKUJy1aWW+HDmwb0UoPku
	QHEvA0EpczDfJy0FrunzxPbn+am1qP0cxy7T+hT/B8jr33dBHXAvencOXF9VYT12Hrzh86
	rZeuKtr6qufjv0cqd3yeHDJ+kWA97swvDzKMRUb4hGljHOPUopU1nsV305xo8Q==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: fzz <1768315307@qq.com>
Cc: Vignesh Raghavendra <vigneshr@ti.com>,  Richard Weinberger
 <richard@nod.at>,  linux-mtd@lists.infradead.org,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: spinand: cache the last read page to avoid
 redundant SPI operations
In-Reply-To: <tencent_219EED44C45D6CEC1D6B6724343E13733005@qq.com> (fzz's
	message of "Mon, 7 Sep 2026 19:10:40 +0800")
References: <tencent_219EED44C45D6CEC1D6B6724343E13733005@qq.com>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Mon, 07 Sep 2026 14:33:24 +0200
Message-ID: <87jyoxw8a3.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3

Hello,

On 07/09/2026 at 19:10:40 +08, fzz <1768315307@qq.com> wrote:

> When squashfs reads files through mtdblock, the mtdblock layer
> splits I/O into 512-byte sectors. For a 4K-page SPI NAND, this
> means reading the same page 8 times (4096 / 512), generating 7x
> redundant SPI read-from-cache operations. Each such operation
> involves a full SPI bus transaction, significantly slowing down
> boot time and file access.
>
> Cache the last successfully read page in spinand_device to avoid
> these redundant operations. When the same {target, eraseblock,
> page} is requested consecutively, the data is served directly
> from the bounce buffer (databuf) via memcpy, skipping the SPI
> transaction entirely.
>
> The cache is invalidated on write and erase operations. RAW reads,
> OOB reads, and continuous reads are excluded from caching to
> maintain correctness.

Why would you use mtdblock on top of a SPI NAND? It sounds like a very
bad choice.

Maybe mtdblock itself could be improved to avoid 512B accesses instead?

> Signed-off-by: fzz <1768315307@qq.com>

Unfortunately, for licensing and copyright reasons, pseudonyms are not
allowed in the Linux kernel.

> ---
>  drivers/mtd/nand/spi/core.c | 36 +++++++++++++++++++++++++++++++++++-
>  include/linux/mtd/spinand.h |  9 +++++++++
>  2 files changed, 44 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/mtd/nand/spi/core.c b/drivers/mtd/nand/spi/core.c
> index 8bf9301f25e7..fc082127bda8 100644
> --- a/drivers/mtd/nand/spi/core.c
> +++ b/drivers/mtd/nand/spi/core.c
> @@ -557,7 +557,14 @@ static int spinand_read_from_cache_op(struct spinand=
_device *spinand,
>  						    req->ooblen);
>  		else
>  			memcpy(req->oobbuf.in, spinand->oobbuf + req->ooboffs,
> -			       req->ooblen);
> +				req->ooblen);

Spurious change.

> +	}
> +

Thanks,
Miqu=C3=A8l
