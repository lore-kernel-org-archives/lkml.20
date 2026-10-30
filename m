Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793382344;
	b=LsnF3Uc4P960pAm3PtAuiiyAInYNr3Ux6GJ0ed0MvknkdIci8xDSORQm/DYY653cLYoa
	 4PeDTICa8d3ITGW3viI4tYuRFjB92XVeButid+UMB0ICbbMXPZwoiZMaiAeqSwsV5uDzu
	 IN3XHW3p6XPwbEP2BA7x1cocoAVuXCBcPt5v+VbhDpFuJLHgc/VKgFFb4a4IIL7+Puy30
	 JXG9MLyTrpBZcdu8H046PANaT0QJuYSIYZ0biNyQ/yzDK2n+a3A8/qwn0t+4P5eTifUX0
	 P6c+H982Txshsi8dCdg0fUIsbhoDTQ+r/7cYmup59HKXH1eGheSBjXdSMXsRDBZyV4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793382344;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Last-TLS-Session-Version;
	bh=jtSnfiKbZvkF3HLRucP99Ez9yPkR5XGBZ4TZYrbyCPI=;
	b=DYohfGsGfgKQAvNj/gth5QLIF/Ts+BgIcrqfNWx6sFbUJKl/EUa3jOOLLMRnyxOmR4pX
	 1ngY5QrKpqvWWMcJ6Vnm5TayMv8qLXh5dFT8wMqV2VRuuJSDsWGXQKmG9Dvg7I3n8WDYc
	 A2LwY8ZxdCPOLepMAQe78kUEdu4kFW0cwWSfIGXnqdKKI9g6sT+Q3Rydp9CUlnXhkp2pX
	 9V7pO1UVKIxDIjEAQV2c/p/waJM7xE53Uk+gdpWcuhtXXYwwP+121EXGMPnx/56iR3Kys
	 xnnk6J9to5nXqTmt40StZ7rtd7gCNWZZzig7Atf986Glk2wTyxVoALMje/XkYkKp8yQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=l1CcjvtC;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF73E606A334
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 17:45:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DF73E606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=l1CcjvtC
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 7A65EC49F68;
	Fri, 30 Oct 2026 17:46:40 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 99A8A603C2;
	Fri, 30 Oct 2026 17:45:37 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 878C7103290F9;
	Fri, 30 Oct 2026 18:45:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793382336; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=jtSnfiKbZvkF3HLRucP99Ez9yPkR5XGBZ4TZYrbyCPI=;
	b=l1CcjvtC2KuIu1EX2mDlsJK5DGDg8K0EQme8pSbbEe5l5eNT1G5Lm+tg9b2e74M58lAmEs
	6VwS+mDk7/G/OlrFxv6xgcWD+LBmE7iUs+jl4Jzac7msEVQFMJeb13QVeXdZJT9rAVuMs0
	fkqlSBf2X8Q2PpqPrwjzHAtLlIe7NkITDCgQcz31OqqP3oOTzgdrzYNsVnp4DnWsAE/vh6
	los+n2Xm37qLIBN5zqylkiySYELchin5sPtuZdeu10yRQ/VlQ+62YX+dE60MoS2aVmRHeM
	7OjKAFkyGt5Yv7Uz1Se55upl8BPhdsj3SEGAhECZ9/0/wCCbJ32LU9qSUF2NnA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 30 Oct 2026 18:45:27 +0100
Subject: [PATCH 03/13] mtd: spinand: winbond: Generalize the LW OOB layout
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
Message-Id: <20261030-winbond-master-w25nxxlvw-v1-3-91f67407dc8b@bootlin.com>
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

All W25NxxLV and W25NxxLW chips use the same OOB layout. Rename the
helpers and structures to make it more obvious, and improve the comment
to reflect this situation.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/spi/winbond.c | 41 ++++++++++++++++++++++-------------------
 1 file changed, 22 insertions(+), 19 deletions(-)

diff --git a/drivers/mtd/nand/spi/winbond.c b/drivers/mtd/nand/spi/winbond.c
index 4ef30f1a4aa8..e3be93690bb7 100644
--- a/drivers/mtd/nand/spi/winbond.c
+++ b/drivers/mtd/nand/spi/winbond.c
@@ -339,6 +339,8 @@ static int w25nxxkv_kw_ooblayout_ecc(struct mtd_info *mtd, int section,
  * 12 ECC-protected "User Data I" bytes.
  *
  * This layout exposes both User Data I and II for backward compatibility.
+ * See w25nxxlv_lw_ooblayout_free() for a variant that only exposes the
+ * ECC-protected bytes.
  */
 static int w25nxxkv_kw_ooblayout_free(struct mtd_info *mtd, int section,
 				      struct mtd_oob_region *region)
@@ -364,37 +366,38 @@ static const struct mtd_ooblayout_ops w25nxxkv_kw_ooblayout = {
 	.free = w25nxxkv_kw_ooblayout_free,
 };
 
-static int w25n08lw_ooblayout_ecc(struct mtd_info *mtd, int section,
-				  struct mtd_oob_region *region)
+/*
+ * The second half of the OOB is not accessible when the on-die ECC
+ * engine is enabled. This prevents accessing the ECC bytes.
+ */
+static int w25nxxlv_lw_ooblayout_ecc(struct mtd_info *mtd, int section,
+				     struct mtd_oob_region *region)
 {
-	/*
-	 * With ecc enabled the parity bits are not accessible. So we can
-	 * only see page + 128. Without ecc the full page + 256 is accessible.
-	 * To make it simple just return the area as not accessible.
-	 */
 	return -ERANGE;
 }
 
-static int w25n08lw_ooblayout_free(struct mtd_info *mtd, int section,
-				   struct mtd_oob_region *region)
+/*
+ * Same layout as w25nxxkv_kw_ooblayout_free(), except that only the
+ * ECC-protected "User Data I" bytes are exposed. The non ECC-protected
+ * "User Data II" bytes are not exposed.
+ */
+static int w25nxxlv_lw_ooblayout_free(struct mtd_info *mtd, int section,
+				      struct mtd_oob_region *region)
 {
-	if (section > 7)
+	unsigned int num_sections = mtd->writesize / 512;
+
+	if (section >= num_sections)
 		return -ERANGE;
 
-	/*
-	 * Only expose the ECC protected "User Data I" bytes. The "User Data II"
-	 * bytes at offset + 2 are not covered by the on-die ECC engine, and the
-	 * first two bytes of the section hold the BBM.
-	 */
 	region->offset = (16 * section) + 4;
 	region->length = 12;
 
 	return 0;
 }
 
-static const struct mtd_ooblayout_ops w25n08lw_ooblayout = {
-	.ecc = w25n08lw_ooblayout_ecc,
-	.free = w25n08lw_ooblayout_free,
+static const struct mtd_ooblayout_ops w25nxxlv_lw_ooblayout = {
+	.ecc = w25nxxlv_lw_ooblayout_ecc,
+	.free = w25nxxlv_lw_ooblayout_free,
 };
 
 static int w25n01jw_ooblayout_ecc(struct mtd_info *mtd, int section,
@@ -852,7 +855,7 @@ static const struct spinand_info winbond_spinand_table[] = {
 							&update_cache_variants,
 							&cont_read_cache_variants),
 		     0,
-		     SPINAND_ECCINFO(&w25n08lw_ooblayout, w25n02kv_ecc_get_status),
+		     SPINAND_ECCINFO(&w25nxxlv_lw_ooblayout, w25n02kv_ecc_get_status),
 		     SPINAND_CONT_READ(w25n0xjw_set_cont_read)),
 };
 

-- 
2.56.0

