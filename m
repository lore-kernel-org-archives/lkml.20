Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793382346;
	b=Z45oDKeEuq1WGG6yGYjxtjUa9acjcR1VOuQm3NYMDCiadIcxlPvQQLqncchncgAIyGga
	 kVHwHtrq6faM/CdWxreqhXwRc0khlHhJe8OOuFbYwJyg0rod7/L8Php7W7MrbHt78T7qS
	 mzLZGrExBwbdIKZ9ELYHz7bnQOfsiw3EeOSKQMJFzDcXdv1+ShAXnAqFJKiWBq3RDn5ZE
	 go3yrOZbYmpqzMoHB5Ny/RtMplrZvdfqzmjhibdAJi+CTfssyZSkjt548l++3denXHCsf
	 bweKqXp0o/4DUxidixb/068dRQraNec2onpWjTnhY10f35TTLhl1zpCXw7N+Enkhzig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793382346;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Last-TLS-Session-Version;
	bh=gpxeTdnSVcB9G2EKfcTP3afP0FaMUeOKOAX4egTqN8E=;
	b=hIcehRjmUdMzJ7mugFfGCGsYBS/lq51qUuJXeNhvCh36oIrAlvNDR6xSG2BfmUf2B83t
	 nAaEnQ1iBOXpdmP/19p2MbnGEGvbez7mMTMIjjPsIODizALXLDB0TJ5nxa79EMBbrqZf0
	 r2KiuvFACivTnW0kqHtqsGOMamojFQibyWpw6oP2ABdPGPGzdGnPl0oEIQJSFXt2GIBHm
	 MZgwpm60+lBIAs4euWSpt3ZiEsiOVK133zOFUjJ9gAHf85wZQMJn7kLi5twkc1yl3I1Xw
	 Lihpomw3WpwLDGHSUJaM0qqnvoOunA9kiW0TBCxKNpqrskP9DN1D5gs6kR4CchAq3+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=0y24LisV;
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF3B3606A33B
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 17:45:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AF3B3606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=0y24LisV
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 9070A1A13D9;
	Fri, 30 Oct 2026 17:45:44 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5F0B4603C2;
	Fri, 30 Oct 2026 17:45:44 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 32D1A10328D09;
	Fri, 30 Oct 2026 18:45:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793382343; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=gpxeTdnSVcB9G2EKfcTP3afP0FaMUeOKOAX4egTqN8E=;
	b=0y24LisVcU3mU9CXKgWFgFof3U/FKUZ1kSi8PHek2bIu0ff3puk874UxgkVoDfpbnApkrz
	wLHge9MLE4mz+COKidNL787J+y3prbTHr4vRyFWTstTYzHE4f/2HIpU02IR/ExTmgQuDxP
	QBPNhZL0X3IaFMfLGxeiXacfqzDhAznAPkyIcmaOmu+r6UlJFnVzBAOv4xD+B/n2GW3FNC
	6sZPJZW5bscGzSich695fib0xXQCXq9YkIra2uPL/l8Wf5xPbEqESHzCSyRSGfN71+T49Y
	tzxuWY55J9JpppexHU4iKZZFB2li322XYVi0OzMd5wU/e4KgzzNC2yM81ZAZNg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 30 Oct 2026 18:45:31 +0100
Subject: [PATCH 07/13] mtd: spinand: winbond: Add basic support for
 W25N02LV
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
Message-Id: <20261030-winbond-master-w25nxxlvw-v1-7-91f67407dc8b@bootlin.com>
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

$ nandbiterrs -i /dev/mtd0
incremental biterrors test
Successfully corrected 0 bit errors per subpage
Inserted biterror @ 0/5
Read reported 1 corrected bit errors
Successfully corrected 1 bit errors per subpage
Inserted biterror @ 0/2
Read reported 2 corrected bit errors
Successfully corrected 2 bit errors per subpage
Inserted biterror @ 0/0
Read reported 3 corrected bit errors
Successfully corrected 3 bit errors per subpage
Inserted biterror @ 1/7
Read reported 4 corrected bit errors
Successfully corrected 4 bit errors per subpage
Inserted biterror @ 1/5
Read reported 5 corrected bit errors
Successfully corrected 5 bit errors per subpage
Inserted biterror @ 1/2
Read reported 6 corrected bit errors
Successfully corrected 6 bit errors per subpage
Inserted biterror @ 1/0
Read reported 7 corrected bit errors
Successfully corrected 7 bit errors per subpage
Inserted biterror @ 2/6
Read reported 8 corrected bit errors
Successfully corrected 8 bit errors per subpage
Inserted biterror @ 2/5
Failed to recover 1 bitflips
Read error after 9 bit errors per page

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/spi/winbond.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/drivers/mtd/nand/spi/winbond.c b/drivers/mtd/nand/spi/winbond.c
index 72f041b87bda..e14f026fc99d 100644
--- a/drivers/mtd/nand/spi/winbond.c
+++ b/drivers/mtd/nand/spi/winbond.c
@@ -210,6 +210,22 @@ static SPINAND_OP_VARIANTS(cont_read_cache_dual_quad_dtr_variants,
 		/* The 1S_1D_1D variant would require 4.5 dummy bytes, this is not possible */
 		WINBOND_CONT_READ_FROM_CACHE_FAST_1S_1S_1S_OP(4, NULL, 0, 0));
 
+/*
+ * Unlike the other devices, W25NxxLV/LW capable chips have an absolute maximum
+ * frequency of 133MHz.
+ */
+
+static SPINAND_OP_VARIANTS(w25nxxlv_read_cache_variants,
+		SPINAND_PAGE_READ_FROM_CACHE_1S_4D_4D_OP(0, 8, NULL, 0, 66 * HZ_PER_MHZ),
+		SPINAND_PAGE_READ_FROM_CACHE_1S_1D_4D_OP(0, 2, NULL, 0, 66 * HZ_PER_MHZ),
+		SPINAND_PAGE_READ_FROM_CACHE_1S_4S_4S_OP(0, 2, NULL, 0, 0),
+		SPINAND_PAGE_READ_FROM_CACHE_1S_1S_4S_OP(0, 1, NULL, 0, 0),
+		SPINAND_PAGE_READ_FROM_CACHE_1S_2S_2S_OP(0, 1, NULL, 0, 0),
+		SPINAND_PAGE_READ_FROM_CACHE_1S_1S_2S_OP(0, 1, NULL, 0, 0),
+		SPINAND_PAGE_READ_FROM_CACHE_1S_1D_1D_OP(0, 2, NULL, 0, 66 * HZ_PER_MHZ),
+		SPINAND_PAGE_READ_FROM_CACHE_FAST_1S_1S_1S_OP(0, 1, NULL, 0, 0),
+		SPINAND_PAGE_READ_FROM_CACHE_1S_1S_1S_OP(0, 1, NULL, 0, 0));
+
 static SPINAND_OP_VARIANTS(read_cache_variants,
 		SPINAND_PAGE_READ_FROM_CACHE_1S_4S_4S_OP(0, 2, NULL, 0, 0),
 		SPINAND_PAGE_READ_FROM_CACHE_1S_1S_4S_OP(0, 1, NULL, 0, 0),
@@ -799,6 +815,15 @@ static const struct spinand_info winbond_spinand_table[] = {
 					      &update_cache_variants),
 		     0,
 		     SPINAND_ECCINFO(&w25nxxkv_kw_ooblayout, w25nxxkv_kw_lv_lw_ecc_get_status)),
+	SPINAND_INFO("W25N02LV", /* 3.3V */
+		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0x8a, 0x22),
+		     NAND_MEMORG(1, 2048, 128, 64, 2048, 40, 1, 1, 1),
+		     NAND_ECCREQ(8, 512),
+		     SPINAND_INFO_OP_VARIANTS(&w25nxxlv_read_cache_variants,
+					      &write_cache_variants,
+					      &update_cache_variants),
+		     0,
+		     SPINAND_ECCINFO(&w25nxxlv_lw_ooblayout, w25nxxkv_kw_lv_lw_ecc_get_status)),
 	SPINAND_INFO("W35N02JW", /* 1.8V */
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xdf, 0x22),
 		     NAND_MEMORG(1, 4096, 128, 64, 512, 10, 1, 2, 1),

-- 
2.56.0

