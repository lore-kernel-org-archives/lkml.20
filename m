Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793382354;
	b=AHSdBSl3Lfzbgstg6pQEw9LNlYB3p6vSoBpjiK+ahsDqnxEYPcGL77D9xePM6C2u2mME
	 BG3CwEQ4WF9MUsty5A0/C/r0XBas6eQMA/QONg+zH8WLiD/ULLgq3LPRVj7XQqFzItWQ3
	 uvlsh9Qii/+ReyIYt3i0Duc3cg6QZ5rOU/6NuXcEdQFnfeAEFYTA0MjFIXijU3BkfmcS3
	 16SonND/U8EHZZ+GikwlxahbsIVJRE+G2i1d9o/nDUF/WwYvNnE6utXVRk6Uk2HhuMrsT
	 /FJZcvHVBlOiO9tm2OzNcmferlvb05Ji61ImwJusXkZYvfejX3NyxlW4JVMfviDXazw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793382354;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Last-TLS-Session-Version;
	bh=6SLabFxTzzPS4n99rNoWuXAxfwruMyDcyDAWnNc343o=;
	b=mNvAFBYxx+oEjOKAiPE2bpTLj5QWhfbCksTG4xC2uyayMfirh4x2d5Vh2qqeqc61zJzb
	 C4GHimHQ63aohfY3OS2Bni1J/XuRYi/5pWKtfxu6bikF8zFiuRvV/r/xw56DffOiWCsZe
	 emtp/N/Us0yy84y0H45ne0rZLGRP6WaxVhr3kAYdN/OgUZfKmd4U0veltHfxuEZYQkcBO
	 6SdlIEv7FsEYpNoGRJPMP7MeiSeBrOtV1xTIXT4CHvnDESJ2XGGow0glAuV0bvtgxGBWr
	 PP/ZFvqAYQuRLH83nRY1z4cUHjSi72Cwfz02UqIi2LDxJUGfI2HwbAPCQV3P9neW4wA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=bgJdhsR6;
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A81360A261D
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 17:45:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1A81360A261D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=bgJdhsR6
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id C83821A13D3;
	Fri, 30 Oct 2026 17:45:52 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 96C3F603C2;
	Fri, 30 Oct 2026 17:45:52 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id EA87A103290E8;
	Fri, 30 Oct 2026 18:45:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793382350; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=6SLabFxTzzPS4n99rNoWuXAxfwruMyDcyDAWnNc343o=;
	b=bgJdhsR6lfV0J+usiXw2M+Tfzkswwj22dgsNvoPncWH5jeUhS8J4K9wK+v2Lc2menXRcpn
	SAjIZtBEHDPDwiGXf+l1IZdkXVnPXFyGnLm6TWZ6wP2kGgYMsCzsQH3+UFqIb0Yn1Gn/Fs
	rhuCih9SdSISOQCqFRUbGTixo7f64go9uzNEnhg9haYBWK9+XnkILRD1/l+xQQwTQDAxr9
	bbq4Ic5F0LRcWy8SCl4uGuIMwSvPvIfBZzr6SWY5wSnpGhPaJa9f2w/l9JnRdJpumFtcto
	RUXnarrXluGMZmtzQBCH07A6OZ/h7fr8ZDY37soYmilmwqYCvtGZfU42257zsA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 30 Oct 2026 18:45:35 +0100
Subject: [PATCH 11/13] mtd: spinand: winbond: Add continuous read support
 for W25N04LV
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261030-winbond-master-w25nxxlvw-v1-11-91f67407dc8b@bootlin.com>
References: <20261030-winbond-master-w25nxxlvw-v1-0-91f67407dc8b@bootlin.com>
In-Reply-To: <20261030-winbond-master-w25nxxlvw-v1-0-91f67407dc8b@bootlin.com>
To: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, 
 Daisuke Mizobuchi <mizo@atmark-techno.com>, 
 Dominique Martinet <dominique.martinet@atmark-techno.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <stlin2@winbond.com>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3

LV chips have DDR support, otherwise they support the same variants as
the other chips.

$ nandcontreadtest /dev/mtd0
testing 2 blocks from 0 to 1 (2 good), seed 29
success: verified 524288 bytes read in 291.735 ms (1755.02 KiB/s)

$ flash_speed /dev/mtd0 -C
1 page read speed is 1673 KiB/s
2 page read speed is 1718 KiB/s
3 page read speed is 1737 KiB/s
4 page read speed is 1741 KiB/s
5 page read speed is 1764 KiB/s
6 page read speed is 1764 KiB/s
7 page read speed is 1762 KiB/s
8 page read speed is 1753 KiB/s
9 page read speed is 1774 KiB/s
10 page read speed is 1764 KiB/s
11 page read speed is 1774 KiB/s
12 page read speed is 1777 KiB/s
13 page read speed is 1777 KiB/s
14 page read speed is 1763 KiB/s
15 page read speed is 1777 KiB/s
16 page read speed is 1790 KiB/s
32 page read speed is 1777 KiB/s
64 page read speed is 1777 KiB/s

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/spi/winbond.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/spi/winbond.c b/drivers/mtd/nand/spi/winbond.c
index 933a85bb79b0..6dd3341c6dd7 100644
--- a/drivers/mtd/nand/spi/winbond.c
+++ b/drivers/mtd/nand/spi/winbond.c
@@ -882,11 +882,13 @@ static const struct spinand_info winbond_spinand_table[] = {
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0x8b, 0x23),
 		     NAND_MEMORG(1, 4096, 256, 64, 2048, 40, 1, 1, 1),
 		     NAND_ECCREQ(8, 512),
-		     SPINAND_INFO_OP_VARIANTS(&w25nxxlv_read_cache_variants,
-					      &write_cache_variants,
-					      &update_cache_variants),
+		     SPINAND_INFO_OP_VARIANTS_WITH_CONT(&w25nxxlv_read_cache_variants,
+							&write_cache_variants,
+							&update_cache_variants,
+							&w25nxxlv_cont_read_cache_variants),
 		     0,
-		     SPINAND_ECCINFO(&w25nxxlv_lw_ooblayout, w25nxxkv_kw_lv_lw_ecc_get_status)),
+		     SPINAND_ECCINFO(&w25nxxlv_lw_ooblayout, w25nxxkv_kw_lv_lw_ecc_get_status),
+		     SPINAND_CONT_READ(w25n_set_cont_read)),
 	SPINAND_INFO("W25N04LW", /* 1.8V */
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xb2, 0x23),
 		     NAND_MEMORG(1, 4096, 256, 64, 2048, 40, 1, 1, 1),

-- 
2.56.0

