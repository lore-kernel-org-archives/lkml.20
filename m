Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793382358;
	b=QcF4nCsxiZePNzqhVaHpNRNsdDcTcHZTHmFwp2eLooMUbJrxrExdMH0UsUn8rgapZ42P
	 BznIhIo+kJLjfqQmFHcFTvw8Obcpi7JAWOBw3a+V8G1U/5z4gjjCZEa949efLUy5glVNp
	 YLCK7UwQlM9ucW/gwal4GMrpbDZrNNZdrW7q0LNkZT+2If8CzFdI8TbIPKcxg3pzpfHqd
	 HrOSpHyDJaN9fnBksnNxIp2dYy7hjY4FyBHtHvsesno/kUJGbrgI1nfXrQJBWAv92YICQ
	 ptpw6Z4cQettGYhVRYXhbgsqJjKg+hDFddRlVqDlQO6OC8e+o5GKkCEavhpNwCpxWmg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793382358;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Last-TLS-Session-Version;
	bh=gUBE54SIF/OqOlW2JHUOCPYSp0w3I1V/0HGwc32fla0=;
	b=ZNk9fvFOr95/L4nz40EBid0jpINukLil05Leg3YeUIoO7+GalHcRQshUpt8CZQlD3+Rp
	 FpRsi0HlOeKKAsTk4hcbvQVZ17ju49HlhH1ceDLr7zb5zQGoza5carevmd1HSgV1XKlEt
	 upFCmdkrRbbs6RaRL6tIybQ1tirS/uDgW+fnO3DqCIJWh+2oCYfMY2F8TQKIt3eWaZeCA
	 KJ9EuVNJil0PEKuXI1yaxd0JD7WiNO60xrihuULRUs36EgI9sXi6IG2vsUSTd/2tn7K2k
	 M8P1bjHRj1q0CsPM+/xXDn8luAA37AHQMI1SITYf2IkKEVh181q9NJGH6a0V9cB4geA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=RdU3oi93;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45772606A329
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 17:45:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 45772606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=RdU3oi93
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 0CE724E413A1;
	Fri, 30 Oct 2026 17:45:57 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C67ED603C2;
	Fri, 30 Oct 2026 17:45:56 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id F16DF10328D09;
	Fri, 30 Oct 2026 18:45:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793382355; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=gUBE54SIF/OqOlW2JHUOCPYSp0w3I1V/0HGwc32fla0=;
	b=RdU3oi93kRbpPaXgfQ/0PsEadEaZ2TZjgZmWTalBDL3dj93VT8YJetFj78T9kBdcf5HRjR
	/WEzEUolvYVbAykI9hwA+BNI+28ByAV1jCvnEha7rucCZ82006laqfFy1yOvLkQKHUOICa
	JQdpPJ+94EPrfqqp8tud06q7DpCZ0kWsk2gHf32eytTbDmss1ykmPUMLb9yRa2gs7encwm
	AjZg+w7JIQXA8E+3toAhAmdnkALeYCMVwv51LfYxl5ImByEMqypiGJcG/NuJadgZHeg6Gx
	fgyTOJoATVnUABngL3vu1Uuj68oEw+AS1szORsZqAnRzR2ffe0w5C6yOTimdPA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 30 Oct 2026 18:45:37 +0100
Subject: [PATCH 13/13] mtd: spinand: winbond: Add continuous read support
 for W25N04LW
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
Message-Id: <20261030-winbond-master-w25nxxlvw-v1-13-91f67407dc8b@bootlin.com>
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
success: verified 524288 bytes read in 405.770 ms (1261.80 KiB/s)

$ flash_speed /dev/mtd0 -C
1 page read speed is 1230 KiB/s
2 page read speed is 1242 KiB/s
3 page read speed is 1247 KiB/s
4 page read speed is 1261 KiB/s
5 page read speed is 1263 KiB/s
6 page read speed is 1263 KiB/s
7 page read speed is 1266 KiB/s
8 page read speed is 1261 KiB/s
9 page read speed is 1272 KiB/s
10 page read speed is 1269 KiB/s
11 page read speed is 1271 KiB/s
12 page read speed is 1269 KiB/s
13 page read speed is 1268 KiB/s
14 page read speed is 1272 KiB/s
15 page read speed is 1276 KiB/s
16 page read speed is 1273 KiB/s
32 page read speed is 1273 KiB/s
64 page read speed is 1261 KiB/s

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/spi/winbond.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/spi/winbond.c b/drivers/mtd/nand/spi/winbond.c
index 17147444f8cb..c897d1686d25 100644
--- a/drivers/mtd/nand/spi/winbond.c
+++ b/drivers/mtd/nand/spi/winbond.c
@@ -895,11 +895,13 @@ static const struct spinand_info winbond_spinand_table[] = {
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xb2, 0x23),
 		     NAND_MEMORG(1, 4096, 256, 64, 2048, 40, 1, 1, 1),
 		     NAND_ECCREQ(8, 512),
-		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
-					      &write_cache_variants,
-					      &update_cache_variants),
+		     SPINAND_INFO_OP_VARIANTS_WITH_CONT(&read_cache_variants,
+							&write_cache_variants,
+							&update_cache_variants,
+							&cont_read_cache_variants),
 		     0,
-		     SPINAND_ECCINFO(&w25nxxkv_kw_ooblayout, w25nxxkv_kw_lv_lw_ecc_get_status)),
+		     SPINAND_ECCINFO(&w25nxxkv_kw_ooblayout, w25nxxkv_kw_lv_lw_ecc_get_status),
+		     SPINAND_CONT_READ(w25n_set_cont_read)),
 	SPINAND_INFO("W35N04JW", /* 1.8V */
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xdf, 0x23),
 		     NAND_MEMORG(1, 4096, 128, 64, 512, 10, 1, 4, 1),

-- 
2.56.0

