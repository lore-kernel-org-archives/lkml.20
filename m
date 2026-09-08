Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF12C4F30FE
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 09:39:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788860398; cv=none; b=n6sWNp5q+P+px3MFc2Y8fQPu/nmAYmDp6ikEpchnvmk1+c3YlcqsjLyAkqu010psIfiuNXKk6QmGd8Ni44lumRaPkOgVqshaFfUS63mErrvNqPCPczOgjnqzAVXsyRXnbsIwMU+H1LYKb/eA5FXcjYSYAnawtYXWr2NvniJ//xE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788860398; c=relaxed/simple;
	bh=4GHa3lNHMkLWKE81S5CI6BlV5V3PtJ3VoW2M7li/Edg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=dqIj/Gzlr61rmDZgHqdSZBItgQupeI/kufAZzXnKlmxWNg1A2NhAhHCvy/hL/dyzs/Pl3H8d+33coZIIygGRlIqdwO5wu+sC7SWptyH+jBd+iMcGwAVVSa2aocXUBzI7EJyCmdTLSWx8lb0spCvJdDtkYnnDKwr3/zHhtQBH+pg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=LCHZ571R; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="LCHZ571R"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 082204E41592;
	Tue,  8 Sep 2026 09:39:54 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C8C96603C4;
	Tue,  8 Sep 2026 09:39:53 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2328311C79CA0;
	Tue,  8 Sep 2026 11:39:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788860393; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=4GHa3lNHMkLWKE81S5CI6BlV5V3PtJ3VoW2M7li/Edg=;
	b=LCHZ571RWZ7U7M8TbTFAHthgTx+h87AllccsZvqf2kcMsQ7Y6z0dBhWg78XiFpgPtu91DG
	qWApgX2wU/Juan6iBKL3phpPFPVL3+EwYmzzANWuBOrXD/uBQIw81qBl1I7xItXgp3vZvX
	Xib49WAQukU1h+vXVE4qAYVL/lhiyo1f6zSRWyUNDhdoy+VPOvFePPcY2qtj/F3bsQ96Rk
	nUa4eIqo8mPww930rz2amNUzrdx1QeoVuS/DBqwWn6KN9EVezFvrKjBGq2QxblAZgp2wDu
	VjjjpxZUUKEo9ZeDuFfnsBduHrEe5Y7iuPSuK9fiinzcDoijKLR46VRCYuAPVQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: fzz <1768315307@qq.com>
Cc: Vignesh Raghavendra <vigneshr@ti.com>,  Richard Weinberger
 <richard@nod.at>,  linux-mtd@lists.infradead.org,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] mtd: spinand: cache the last read page to avoid
 redundant SPI operations
In-Reply-To: <tencent_4C47F17C98F6F164274CEE84638558D62308@qq.com> (fzz's
	message of "Tue, 8 Sep 2026 11:25:30 +0800")
References: <tencent_4C47F17C98F6F164274CEE84638558D62308@qq.com>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Tue, 08 Sep 2026 11:39:49 +0200
Message-ID: <87bja8ulne.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3

Hello Zongzhen,

On 08/09/2026 at 11:25:30 +08, fzz <1768315307@qq.com> wrote:

> From: Zongzhen Feng <1768315307@qq.com>
>
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
>
> Signed-off-by: Zongzhen Feng <1768315307@qq.com>

Sashiko reports interesting warnings, can you please address them?

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Critical] The page caching mechanism uses the shared bounce buffer
`spinand->databuf` to store cached data, but fails to unconditionally
invalidate the cache when this buffer is overwritten by other
operations, leading to severe cross-page data corruption.
- [Critical] Pages with uncorrectable ECC errors are prematurely cached
as valid, causing subsequent reads to bypass ECC checks and silently
return corrupted data as successful.

Thanks,
Miqu=C3=A8l
