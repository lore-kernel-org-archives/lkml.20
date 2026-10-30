Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793382338;
	b=4F4dkOoJn/6QE0a07PCgMCC1/fMoUGiqdtslLG/BfRUgw8bHLjYmcrMl3y0OMJRw8Cg3
	 z8QWSXEZR/9PEBNhZ3SiWJWjLrE802K0w8jaZ2UslRpLIXE/J2C15Y77RgE50vug5nbyV
	 pdgnfixBYoNkVxCQ/L2XYzeSGMZcsEz0V89QyWreB9QAEO8Ww++40I6clT/TB/4k+k2mv
	 B8hr5cdAr3pcx1VFXaeQgf4JxL8h7qgrgNLFQhdKzohe76eL5ebjktN3oBs+yzkF/c6d8
	 LNY2H2rjNO6Jo9RO9WGKaPDUtRPSfXfGnRyx05ipBDe7aftdSfU2ru3yQlBEyjgverQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793382338;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Last-TLS-Session-Version;
	bh=R8JAceMMwHGuwqfi9fHes1au02XQEjVobeDAMWxCelg=;
	b=ZhWMsRBwDaWs7bKitHgkXk3TU07D/MndWg6ZRKWHRbiaZ0WHwvfgFb3wi99aDgDOAe19
	 hOL56VSrti4T2B2IsSlryE2/3E4H/aAH7t6Xy5VqJJYQt9YV0sIP90wYA2rIy2rg0ZekU
	 lgMnxRBpFwHXvXL7hBgNncBMLvdfi8ofgrzfLgERDU/U6+B0MksHjLqbS9P8emzHrmL7r
	 9F+HALYX4js3GemwNKXupv5UQmxD3Vs75MENREddr3HCYBADNRbTRH4kGZ+pcqMu6cAiI
	 Cj8HWZMvBVzZrGAPTwGStEOnkhusafIEJ/Xigp67R3TEazim2PxHLx6U844Dpui2b5Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=RxdX9r++;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C66D5606A322
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 17:45:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C66D5606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=RxdX9r++
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id CB208C49F67;
	Fri, 30 Oct 2026 17:46:38 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E7B53603C2;
	Fri, 30 Oct 2026 17:45:35 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C14FB103290EE;
	Fri, 30 Oct 2026 18:45:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793382335; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=R8JAceMMwHGuwqfi9fHes1au02XQEjVobeDAMWxCelg=;
	b=RxdX9r++HgNmEbEVDr69nkHvLnitlKNp4mEWJHe6/tiDnHohtkmPEsTOn9C0Vd+d33kuVi
	4YLiz4AgQoi8JkpqrJvJe2Ksif7zp5bsgI4Iyz2GqDg6SxH103wyJ6PR9q+s4aJwOk5wg3
	GRsxVKoeJ8MKNwnYtYTM9+Cp265kNEUCe1mvW29z0fJ/bxypY4XUa3CiEoTlmHpNNP+k55
	d/0nf1xvDiG0LGSvlOb5uWRm52ymdqQOQ1K3kwro7Ry+JHXcWYabxhj0zn1Aedctr+NhMf
	f8fLuo6XVN1fLkTLPbPnTCTyvWMQbfNGXcTzSQPSPr5Egd5HZoWd9HHz7mgWOg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 30 Oct 2026 18:45:26 +0100
Subject: [PATCH 02/13] mtd: spinand: winbond: Generalize the KV OOB layout
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
Message-Id: <20261030-winbond-master-w25nxxlvw-v1-2-91f67407dc8b@bootlin.com>
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

All W25NxxKV and W25NxxKW chips use the same OOB layout. Rename the
helpers and structures to make it more obvious.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/spi/winbond.c | 54 ++++++++++++++++++------------------------
 1 file changed, 23 insertions(+), 31 deletions(-)

diff --git a/drivers/mtd/nand/spi/winbond.c b/drivers/mtd/nand/spi/winbond.c
index 49fa545a4113..4ef30f1a4aa8 100644
--- a/drivers/mtd/nand/spi/winbond.c
+++ b/drivers/mtd/nand/spi/winbond.c
@@ -318,16 +318,11 @@ static int w25n01kv_ooblayout_ecc(struct mtd_info *mtd, int section,
 	return 0;
 }
 
-static int w25n02kv_ooblayout_ecc(struct mtd_info *mtd, int section,
-				  struct mtd_oob_region *region)
+static int w25nxxkv_kw_ooblayout_ecc(struct mtd_info *mtd, int section,
+				     struct mtd_oob_region *region)
 {
-	int num_sections = 4;
-	int offset = 64;
-
-	if (mtd->oobsize == 256) {
-		num_sections = 8;
-		offset = 128;
-	}
+	unsigned int offset = mtd->oobsize / 2;
+	unsigned int num_sections = mtd->writesize / 512;
 
 	if (section >= num_sections)
 		return -ERANGE;
@@ -338,24 +333,21 @@ static int w25n02kv_ooblayout_ecc(struct mtd_info *mtd, int section,
 	return 0;
 }
 
-static int w25n02kv_ooblayout_free(struct mtd_info *mtd, int section,
-				   struct mtd_oob_region *region)
+/*
+ * The OOB layout is the same for all the W25NxxKV/KW/LV/LW chips: each
+ * 16-byte section holds 4 unprotected "User Data II" bytes followed by
+ * 12 ECC-protected "User Data I" bytes.
+ *
+ * This layout exposes both User Data I and II for backward compatibility.
+ */
+static int w25nxxkv_kw_ooblayout_free(struct mtd_info *mtd, int section,
+				      struct mtd_oob_region *region)
 {
-	int num_sections = 4;
-
-	if (mtd->oobsize == 256)
-		num_sections = 8;
+	unsigned int num_sections = mtd->writesize / 512;
 
 	if (section >= num_sections)
 		return -ERANGE;
 
-	/*
-	 * For at least W25N04KW and W25N04LW, this region is actually
-	 * split in two:
-	 * ECC-protected "User Data I" at + 4 offset, length 12
-	 * unprotected "User Data II" at + 2 offset, length 2
-	 * This returns the full region for backwards compatibility.
-	 */
 	region->offset = (16 * section) + 2;
 	region->length = 14;
 
@@ -364,12 +356,12 @@ static int w25n02kv_ooblayout_free(struct mtd_info *mtd, int section,
 
 static const struct mtd_ooblayout_ops w25n01kv_ooblayout = {
 	.ecc = w25n01kv_ooblayout_ecc,
-	.free = w25n02kv_ooblayout_free,
+	.free = w25nxxkv_kw_ooblayout_free,
 };
 
-static const struct mtd_ooblayout_ops w25n02kv_ooblayout = {
-	.ecc = w25n02kv_ooblayout_ecc,
-	.free = w25n02kv_ooblayout_free,
+static const struct mtd_ooblayout_ops w25nxxkv_kw_ooblayout = {
+	.ecc = w25nxxkv_kw_ooblayout_ecc,
+	.free = w25nxxkv_kw_ooblayout_free,
 };
 
 static int w25n08lw_ooblayout_ecc(struct mtd_info *mtd, int section,
@@ -786,7 +778,7 @@ static const struct spinand_info winbond_spinand_table[] = {
 					      &write_cache_variants,
 					      &update_cache_variants),
 		     0,
-		     SPINAND_ECCINFO(&w25n02kv_ooblayout, w25n02kv_ecc_get_status)),
+		     SPINAND_ECCINFO(&w25nxxkv_kw_ooblayout, w25n02kv_ecc_get_status)),
 	SPINAND_INFO("W25N02KW", /* 1.8V */
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xba, 0x22),
 		     NAND_MEMORG(1, 2048, 128, 64, 2048, 40, 1, 1, 1),
@@ -795,7 +787,7 @@ static const struct spinand_info winbond_spinand_table[] = {
 					      &write_cache_variants,
 					      &update_cache_variants),
 		     0,
-		     SPINAND_ECCINFO(&w25n02kv_ooblayout, w25n02kv_ecc_get_status)),
+		     SPINAND_ECCINFO(&w25nxxkv_kw_ooblayout, w25n02kv_ecc_get_status)),
 	SPINAND_INFO("W35N02JW", /* 1.8V */
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xdf, 0x22),
 		     NAND_MEMORG(1, 4096, 128, 64, 512, 10, 1, 2, 1),
@@ -818,7 +810,7 @@ static const struct spinand_info winbond_spinand_table[] = {
 					      &write_cache_variants,
 					      &update_cache_variants),
 		     0,
-		     SPINAND_ECCINFO(&w25n02kv_ooblayout, w25n02kv_ecc_get_status)),
+		     SPINAND_ECCINFO(&w25nxxkv_kw_ooblayout, w25n02kv_ecc_get_status)),
 	SPINAND_INFO("W25N04KW", /* 1.8V */
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xba, 0x23),
 		     NAND_MEMORG(1, 2048, 128, 64, 4096, 40, 1, 1, 1),
@@ -827,7 +819,7 @@ static const struct spinand_info winbond_spinand_table[] = {
 					      &write_cache_variants,
 					      &update_cache_variants),
 		     0,
-		     SPINAND_ECCINFO(&w25n02kv_ooblayout, w25n02kv_ecc_get_status)),
+		     SPINAND_ECCINFO(&w25nxxkv_kw_ooblayout, w25n02kv_ecc_get_status)),
 	SPINAND_INFO("W25N04LW", /* 1.8V */
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xb2, 0x23),
 		     NAND_MEMORG(1, 4096, 256, 64, 2048, 40, 1, 1, 1),
@@ -836,7 +828,7 @@ static const struct spinand_info winbond_spinand_table[] = {
 					      &write_cache_variants,
 					      &update_cache_variants),
 		     0,
-		     SPINAND_ECCINFO(&w25n08lw_ooblayout, w25n02kv_ecc_get_status)),
+		     SPINAND_ECCINFO(&w25nxxkv_kw_ooblayout, w25n02kv_ecc_get_status)),
 	SPINAND_INFO("W35N04JW", /* 1.8V */
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xdf, 0x23),
 		     NAND_MEMORG(1, 4096, 128, 64, 512, 10, 1, 4, 1),

-- 
2.56.0

