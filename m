Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793382356;
	b=fvrMAkS6oXq60mtxHcAbA1/8WA+KaQ3IoO+WQiNliEvgKxYsfMJpSysZR3AuPiI7EinX
	 +JGcR+x8FHk8Tckjr9UnyXb5lw1+Qv1/zT/yeIfKlJCBYsS1RKK0xeEvXwLRXsf2Ocaqq
	 FzbbRcUd3Kku0MbW1ul3dXavpnPCmQ8nTMBUL8Squ2/pLtujjS4Cq3KqRe5noWzLzKgwL
	 aknmSwoywYOJP1X4FDlVwfo7DrGS0fHXwn0ddQpB07B9HA+7eLRKugNNwpd8V3ISdjSLE
	 Wr6PldP9kxarI/jmjO3mz8XC5goM/JDbtja9zMswdHYFzfMg6BCOVRehMiozR3UQn9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793382356;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Last-TLS-Session-Version;
	bh=n7sInAa+9PlXGWZCJzzo904kubVPq+QghlWscMX+YQo=;
	b=c8t1xSeYkQJEf3uCBnKkHGEDAnS2wLeGhbE6KM0eFyrrZ5e3DPp6VRUGK0Fdp4qUoFbh
	 0ItgXKrs/AXDH/+jluxcm1b72mumaI4GrQFg8vKYR0nzc4gDKJWF/1bhxbUSIQSQ5sHtm
	 MfpJVKOW4haUXdTgOhG7UckrqljOSUV05Pd7ew8GP7TJioQbe/pgzk9S5rwzQgr5XVMAd
	 zDnTrPIG0z3CXQDNZbOxkTAFs8WfVTn4rzktXLkfN5jV0ms1uX7ISmy1kMm0RgfpPCJ2k
	 87kljOwVAz0AADFJSHwLM6PjnGPcOYYgW8aSErShNXO6d30NlsR+94Oqm7U6v0JndMw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b="tQ0I6/7y";
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E39A60A261F
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 17:45:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3E39A60A261F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=tQ0I6/7y
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id B09414E413A2;
	Fri, 30 Oct 2026 17:45:54 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7B671603C2;
	Fri, 30 Oct 2026 17:45:54 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id F0E44103290F9;
	Fri, 30 Oct 2026 18:45:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793382353; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=n7sInAa+9PlXGWZCJzzo904kubVPq+QghlWscMX+YQo=;
	b=tQ0I6/7yp25kvnoexTrIi6k8S8WWsSiP/U66GKPUAw1uqcMqlFpP8+zP1objSXB4t0AmrI
	y7kvtjcDf//xqwygwUUFycuAaDwIzRsrQtWIJhEUE/nTa5IenNHzyyO0Bh5yHitVskWzBf
	D0w3vJN/boO6h6EEA3cDLZhT4UgOAF+8f/akOntNnxUQaQM0Gc7LgbAqTa2SAVNPnAEXYu
	E+v/PC0/w5BoFoH1snv0h9jqNJJGbBC7UG4tWRTnHOkiAeFwcaxstjO7gMtoHNmTxUFnuj
	3tfBGHDIef0dKoBkyO+FF5n4GwMeqdFaSTQZzvQdaiKqssI5avVSpEfDtspstw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 30 Oct 2026 18:45:36 +0100
Subject: [PATCH 12/13] mtd: spinand: winbond: Add continuous read support
 for W25N02LW
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
Message-Id: <20261030-winbond-master-w25nxxlvw-v1-12-91f67407dc8b@bootlin.com>
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

LW chips follow the existing patterns, we can reuse the existing
set_cont_read() helper as well as the existing continuous read variants.

$ nandcontreadtest /dev/mtd0
testing 2 blocks from 0 to 1 (2 good), seed 22
success: verified 262144 bytes read in 202.780 ms (1262.45 KiB/s)

$ flash_speed /dev/mtd0 -C
1 page read speed is 1185 KiB/s
2 page read speed is 1207 KiB/s
3 page read speed is 1223 KiB/s
4 page read speed is 1242 KiB/s
5 page read speed is 1250 KiB/s
6 page read speed is 1263 KiB/s
7 page read speed is 1260 KiB/s
8 page read speed is 1267 KiB/s
9 page read speed is 1260 KiB/s
10 page read speed is 1263 KiB/s
11 page read speed is 1264 KiB/s
12 page read speed is 1263 KiB/s
13 page read speed is 1253 KiB/s
14 page read speed is 1272 KiB/s
15 page read speed is 1276 KiB/s
16 page read speed is 1267 KiB/s
32 page read speed is 1280 KiB/s
64 page read speed is 1280 KiB/s

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/spi/winbond.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/spi/winbond.c b/drivers/mtd/nand/spi/winbond.c
index 6dd3341c6dd7..17147444f8cb 100644
--- a/drivers/mtd/nand/spi/winbond.c
+++ b/drivers/mtd/nand/spi/winbond.c
@@ -841,11 +841,13 @@ static const struct spinand_info winbond_spinand_table[] = {
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0x12, 0x22),
 		     NAND_MEMORG(1, 2048, 128, 64, 2048, 40, 1, 1, 1),
 		     NAND_ECCREQ(8, 512),
-		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
-					      &write_cache_variants,
-					      &update_cache_variants),
+		     SPINAND_INFO_OP_VARIANTS_WITH_CONT(&read_cache_variants,
+							&write_cache_variants,
+							&update_cache_variants,
+							&cont_read_cache_variants),
 		     0,
-		     SPINAND_ECCINFO(&w25nxxlv_lw_ooblayout, w25nxxkv_kw_lv_lw_ecc_get_status)),
+		     SPINAND_ECCINFO(&w25nxxlv_lw_ooblayout, w25nxxkv_kw_lv_lw_ecc_get_status),
+		     SPINAND_CONT_READ(w25n_set_cont_read)),
 	SPINAND_INFO("W35N02JW", /* 1.8V */
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xdf, 0x22),
 		     NAND_MEMORG(1, 4096, 128, 64, 512, 10, 1, 2, 1),

-- 
2.56.0

