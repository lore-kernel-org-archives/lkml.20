Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B5F8442B06
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 09:43:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.154.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791884638; cv=none; b=ayGVOFHFdRMswxE8PHBHu63ImgXfS2eStgMBVFwf/w5S3hIPz4/v2a2e4Lm7cl3ynrisTVeso0fPFueTTdVD8LRMxDQuz12CupoHC9UgjQl/+uO4fRGkALgNPV/+33IYMeifr6XXbVklzS12jQw/yYDH+M1hgtSEhlbPSSXh89U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791884638; c=relaxed/simple;
	bh=aeBt89eyCnZiDw01mhYSfPD5Jm1xqwUzTa20QYRZwz8=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=I1ZQVnw99gW1UhP8VpM9lupVHsqLA6tmdYJxanvyP3DrCk6fpbaDGCXDCD3ShXqYXnU18eyf08g8rb/LnMW2twBoHezZECDEGQ/cf7zDiUsgu7iJblGaDwqAapstCyFVfWWfc3K7AQEXAx0UENYuzTzEgGfiyI0RvAtkb4VrV94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=0NIZXtqy; arc=none smtp.client-ip=68.232.154.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="0NIZXtqy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1791884636; x=1823420636;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=aeBt89eyCnZiDw01mhYSfPD5Jm1xqwUzTa20QYRZwz8=;
  b=0NIZXtqyLikP1ol1m+1sERq2fFa7RlmtrZaVYRzQk2DadWPckCpBcwIJ
   9Kecavsib7rxhQcrmhc2QkXVJHgl0LUcHTP832WROche+WmMY/Ax+kIWl
   pO9n17WZUFrX+fo3T8qBrVyhg6t0vRlwjC2eSZG3by3hq0epNhpeN4Oc9
   p4e0OW4rNrMKnPQcHKYi3CarYsqCQmoDnuokLbBkwtv/8JvmqEXVTvYxG
   Atb/olw6AQLo7uN3jVH0dhPNRHexYtbxz5yAWXcXRYOX11ccz40mRL23S
   tJ3GcbVbziaeWhGrAdgGGhjzQHfLY3nY/Otl4/uRjx8R7nHbvx6UIW0Ib
   w==;
X-CSE-ConnectionGUID: /SwY72YgQ9iSb42s3ajJtg==
X-CSE-MsgGUID: k72G8NVCREe0f1gvGgWCgw==
X-IronPort-AV: E=Sophos;i="6.27,155,1787036400"; 
   d="scan'208";a="65227556"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 13 Oct 2026 02:43:50 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Tue, 13 Oct 2026 02:43:49 -0700
Received: from archlinux.mchp-main.com (10.10.85.11) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Tue, 13 Oct 2026 02:43:47 -0700
From: Mihai Sain <mihai.sain@microchip.com>
To: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
	<tglx@kernel.org>, <kees@kernel.org>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>, "Mihai
 Sain" <mihai.sain@microchip.com>
Subject: [PATCH] mtd: nand: bbt: Use pr_fmt() for consistent log prefixes
Date: Tue, 13 Oct 2026 12:43:39 +0300
Message-ID: <20261013094339.7285-1-mihai.sain@microchip.com>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Define pr_fmt() in nand_bbt.c to automatically prepend the nand_bbt:
prefix to log messages. Remove redundant subsystem prefixes from
individual logging statements to avoid duplication and ensure consistent
log formatting across the NAND bad block table implementation.
No functional changes intended.

Signed-off-by: Mihai Sain <mihai.sain@microchip.com>
---
 drivers/mtd/nand/raw/nand_bbt.c | 29 +++++++++++++++--------------
 1 file changed, 15 insertions(+), 14 deletions(-)

diff --git a/drivers/mtd/nand/raw/nand_bbt.c b/drivers/mtd/nand/raw/nand_bbt.c
index b0e7592a2ab7..93f162805f31 100644
--- a/drivers/mtd/nand/raw/nand_bbt.c
+++ b/drivers/mtd/nand/raw/nand_bbt.c
@@ -52,6 +52,7 @@
  * - bbts start at a page boundary, if autolocated on a block boundary
  * - the space necessary for a bbt in FLASH does not exceed a block boundary
  */
+#define pr_fmt(fmt) "nand_bbt: " fmt
 
 #include <linux/slab.h>
 #include <linux/types.h>
@@ -193,15 +194,15 @@ static int read_bbt(struct nand_chip *this, uint8_t *buf, int page, int num,
 		res = mtd_read(mtd, from, len, &retlen, buf);
 		if (res < 0) {
 			if (mtd_is_eccerr(res)) {
-				pr_info("nand_bbt: ECC error in BBT at 0x%012llx\n",
+				pr_info("ECC error in BBT at 0x%012llx\n",
 					from & ~mtd->writesize);
 				return res;
 			} else if (mtd_is_bitflip(res)) {
-				pr_info("nand_bbt: corrected error in BBT at 0x%012llx\n",
+				pr_info("corrected error in BBT at 0x%012llx\n",
 					from & ~mtd->writesize);
 				ret = res;
 			} else {
-				pr_info("nand_bbt: error reading BBT\n");
+				pr_info("error reading BBT\n");
 				return res;
 			}
 		}
@@ -214,7 +215,7 @@ static int read_bbt(struct nand_chip *this, uint8_t *buf, int page, int num,
 				if (tmp == msk)
 					continue;
 				if (reserved_block_code && (tmp == reserved_block_code)) {
-					pr_info("nand_read_bbt: reserved block at 0x%012llx\n",
+					pr_info("reserved block at 0x%012llx\n",
 						 (loff_t)(offs + act) <<
 						 this->bbt_erase_shift);
 					bbt_mark_entry(this, offs + act,
@@ -226,7 +227,7 @@ static int read_bbt(struct nand_chip *this, uint8_t *buf, int page, int num,
 				 * Leave it for now, if it's matured we can
 				 * move this message to pr_debug.
 				 */
-				pr_info("nand_read_bbt: bad block at 0x%012llx\n",
+				pr_info("bad block at 0x%012llx\n",
 					 (loff_t)(offs + act) <<
 					 this->bbt_erase_shift);
 				/* Factory marked bad or worn out? */
@@ -503,7 +504,7 @@ static int create_bbt(struct nand_chip *this, uint8_t *buf,
 		from = 0;
 	} else {
 		if (chip >= nanddev_ntargets(&this->base)) {
-			pr_warn("create_bbt(): chipnr (%d) > available chips (%d)\n",
+			pr_warn("chipnr (%d) > available chips (%d)\n",
 			        chip + 1, nanddev_ntargets(&this->base));
 			return -EINVAL;
 		}
@@ -725,7 +726,7 @@ static void mark_bbt_block_bad(struct nand_chip *this,
 	to = (loff_t)block << this->bbt_erase_shift;
 	res = nand_markbad_bbm(this, to);
 	if (res)
-		pr_warn("nand_bbt: error %d while marking block %d bad\n",
+		pr_warn("error %d while marking block %d bad\n",
 			res, block);
 
 	td->pages[chip] = -1;
@@ -825,10 +826,10 @@ static int write_bbt(struct nand_chip *this, uint8_t *buf,
 			res = mtd_read(mtd, to, len, &retlen, buf);
 			if (res < 0) {
 				if (retlen != len) {
-					pr_info("nand_bbt: error reading block for writing the bad block table\n");
+					pr_info("error reading block for writing the bad block table\n");
 					return res;
 				}
-				pr_warn("nand_bbt: ECC error while reading block for writing bad block table\n");
+				pr_warn("ECC error while reading block for writing bad block table\n");
 			}
 			/* Read oob data */
 			ops.ooblen = (len >> this->page_shift) * mtd->oobsize;
@@ -890,7 +891,7 @@ static int write_bbt(struct nand_chip *this, uint8_t *buf,
 		einfo.len = 1 << this->bbt_erase_shift;
 		res = nand_erase_nand(this, &einfo, 1);
 		if (res < 0) {
-			pr_warn("nand_bbt: error while erasing BBT block %d\n",
+			pr_warn("error while erasing BBT block %d\n",
 				res);
 			mark_bbt_block_bad(this, td, chip, block);
 			continue;
@@ -900,7 +901,7 @@ static int write_bbt(struct nand_chip *this, uint8_t *buf,
 				     td->options & NAND_BBT_NO_OOB ?
 				     NULL : &buf[len]);
 		if (res < 0) {
-			pr_warn("nand_bbt: error while writing BBT block %d\n",
+			pr_warn("error while writing BBT block %d\n",
 				res);
 			mark_bbt_block_bad(this, td, chip, block);
 			continue;
@@ -915,7 +916,7 @@ static int write_bbt(struct nand_chip *this, uint8_t *buf,
 	return 0;
 
  outerr:
-	pr_warn("nand_bbt: error while writing bad block table %d\n", res);
+	pr_warn("error while writing bad block table %d\n", res);
 	return res;
 }
 
@@ -1263,7 +1264,7 @@ static int nand_scan_bbt(struct nand_chip *this, struct nand_bbt_descr *bd)
 	 */
 	if (!td) {
 		if ((res = nand_memory_bbt(this, bd))) {
-			pr_err("nand_bbt: can't scan flash and build the RAM-based BBT\n");
+			pr_err("can't scan flash and build the RAM-based BBT\n");
 			goto err_free_bbt;
 		}
 		return 0;
@@ -1451,7 +1452,7 @@ int nand_isbad_bbt(struct nand_chip *this, loff_t offs, int allowbbt)
 	block = (int)(offs >> this->bbt_erase_shift);
 	res = bbt_get_entry(this, block);
 
-	pr_debug("nand_isbad_bbt(): bbt info for offs 0x%08x: (block %d) 0x%02x\n",
+	pr_debug("bbt info for offs 0x%08x: (block %d) 0x%02x\n",
 		 (unsigned int)offs, block, res);
 
 	if (mtd_check_expert_analysis_mode())
-- 
2.56.0

