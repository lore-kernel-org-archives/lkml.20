Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793382351;
	b=cC5Vp0VqYuzSSgU+4NASreNVKyPqcd0oR5NFpx00wMbfA35xx73/hz+OfPXBad0ilHNl
	 LMSpRx5wVYfJ8BrkN2TZlkquU79NeyFmJuehNzAr2ijWQi+OrVB4VspVAEKR5gHu+gVgv
	 t3wa6ezLipT7zygzgV2NOxAQ/2yzEyXxgdyxyMmmQBaTdGawiND9CV7VdplMBExNKY4ut
	 G0qg2NlEf0es00EVAi33fg9AFHBNnP8ck6Vw1ys7uMFy72J9iGPyUmK0OzFl+TZV0oUo/
	 jbGtSoZX0j90HiQiO54JJ7EMUq/Fioqx1WePZVHERFadXxm1G1LL1jR5XEXtQlIm3Ug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793382351;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Last-TLS-Session-Version;
	bh=ROFHtRsi5CP6K7kOvK0Oqv3uvcrXPcRAmoJ/pRuWBbk=;
	b=ndrC9fCcqaNlel9Oq2LSRx5Q+sSBTAHnBxUIKBwm1KMJkL5YAFlIDKkz43Uv6OrLUymT
	 9dA4KlL/HZyBVM75Gsy6lrD6vhR3dVwXvJuI1QpMrx4ZBIf/iWDlDaTmBBX7P9PZYhdu/
	 u3GQCiweuvysjXzeFOx+NZ1nk8IiDh1XvUOvi68FqkrxKDTpgJnCoUhEOdzgaUnyy6i+Y
	 aKLk9uDQkdkw7VuBvwUiUQr3vcFd6XahuBkVKpvEnZ+Ow0FVQ/ms+2dwhaWdLQmhrf4gp
	 bvEQQKojSe0m/CGWgIc1RsvATJml0b60kUIunNT1lYCXyDuE+GJ9q6CTrQ0uYb7mbYQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=BiD06NXg;
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B91560A2614
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 17:45:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0B91560A2614
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=BiD06NXg
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id B79771A13C4;
	Fri, 30 Oct 2026 17:45:49 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 852EC603C2;
	Fri, 30 Oct 2026 17:45:49 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id EAD0910328D09;
	Fri, 30 Oct 2026 18:45:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793382348; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=ROFHtRsi5CP6K7kOvK0Oqv3uvcrXPcRAmoJ/pRuWBbk=;
	b=BiD06NXgFyf608ZcLDk2jvpClg6NDqPDLQf/t2MgI5EX3E63u65FdBGNKUmY+7S38blUsE
	n0UlrWZjPd13lmxQO3iyxocZhdxjvwQBdrWK3nKuXQkOx196fVSaK2PmroyAlPznAPzf/0
	LHYiPLb8LM344GDe+ZOXBddWcXqu5ZuwRJzNWS9GyV0jqYnQ9L6NtKrnAcnmxbf+z5qdt1
	B9wuREKpF79GNO91sCYWwSPYuS19egVUgodxYsjKUu9mdxPOrDg8kYbVdkwzghV/IoxTUn
	0bSZgWbxRgPrc7v9wykYTit/D0bAmm2Djoq3raBHXLY7urJb6DQhpBDFwNt8Fg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 30 Oct 2026 18:45:34 +0100
Subject: [PATCH 10/13] mtd: spinand: winbond: Add continuous read support
 for W25N02LV
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
Message-Id: <20261030-winbond-master-w25nxxlvw-v1-10-91f67407dc8b@bootlin.com>
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
testing 10 blocks from 0 to 9 (10 good), seed 27
success: verified 1310720 bytes read in 756.306 ms (1692.44 KiB/s)

$ flash_speed /dev/mtd0 -C
1 page read speed is 1580 KiB/s
2 page read speed is 1580 KiB/s
3 page read speed is 1615 KiB/s
4 page read speed is 1641 KiB/s
5 page read speed is 1643 KiB/s
6 page read speed is 1643 KiB/s
7 page read speed is 1657 KiB/s
8 page read speed is 1662 KiB/s
9 page read speed is 1680 KiB/s
10 page read speed is 1666 KiB/s
11 page read speed is 1692 KiB/s
12 page read speed is 1690 KiB/s
13 page read speed is 1677 KiB/s
14 page read speed is 1696 KiB/s
15 page read speed is 1690 KiB/s
16 page read speed is 1684 KiB/s
32 page read speed is 1684 KiB/s
64 page read speed is 1706 KiB/s

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/spi/winbond.c | 21 +++++++++++++++++----
 1 file changed, 17 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/spi/winbond.c b/drivers/mtd/nand/spi/winbond.c
index 6d7732761785..933a85bb79b0 100644
--- a/drivers/mtd/nand/spi/winbond.c
+++ b/drivers/mtd/nand/spi/winbond.c
@@ -226,6 +226,17 @@ static SPINAND_OP_VARIANTS(w25nxxlv_read_cache_variants,
 		SPINAND_PAGE_READ_FROM_CACHE_FAST_1S_1S_1S_OP(0, 1, NULL, 0, 0),
 		SPINAND_PAGE_READ_FROM_CACHE_1S_1S_1S_OP(0, 1, NULL, 0, 0));
 
+static SPINAND_OP_VARIANTS(w25nxxlv_cont_read_cache_variants,
+		WINBOND_CONT_READ_FROM_CACHE_1S_4D_4D_OP(11, NULL, 0, 66 * HZ_PER_MHZ),
+		WINBOND_CONT_READ_FROM_CACHE_1S_1D_4D_OP(5, NULL, 0, 66 * HZ_PER_MHZ),
+		WINBOND_CONT_READ_FROM_CACHE_1S_4S_4S_OP(6, NULL, 0, 0),
+		WINBOND_CONT_READ_FROM_CACHE_1S_1S_4S_OP(4, NULL, 0, 0),
+		WINBOND_CONT_READ_FROM_CACHE_1S_2S_2S_OP(4, NULL, 0, 0),
+		WINBOND_CONT_READ_FROM_CACHE_1S_1S_2S_OP(4, NULL, 0, 0),
+		/* The 1S_1D_1D variant would require 4.5 dummy bytes, this is not possible */
+		WINBOND_CONT_READ_FROM_CACHE_FAST_1S_1S_1S_OP(4, NULL, 0, 0),
+		WINBOND_CONT_READ_FROM_CACHE_1S_1S_1S_OP(3, NULL, 0, 0));
+
 static SPINAND_OP_VARIANTS(read_cache_variants,
 		SPINAND_PAGE_READ_FROM_CACHE_1S_4S_4S_OP(0, 2, NULL, 0, 0),
 		SPINAND_PAGE_READ_FROM_CACHE_1S_1S_4S_OP(0, 1, NULL, 0, 0),
@@ -819,11 +830,13 @@ static const struct spinand_info winbond_spinand_table[] = {
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0x8a, 0x22),
 		     NAND_MEMORG(1, 2048, 128, 64, 2048, 40, 1, 1, 1),
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
 	SPINAND_INFO("W25N02LW", /* 1.8V */
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0x12, 0x22),
 		     NAND_MEMORG(1, 2048, 128, 64, 2048, 40, 1, 1, 1),

-- 
2.56.0

