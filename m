Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B14C3B47E9
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 08:24:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.153.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791879862; cv=none; b=YEdm/Am9be9J+xa90dXbLtIKdgJn15urh86OJk3HeTzu26GdIPYIx8lpe54u+nqJhI//2sB6LM1fIMolFYEtVsvA/odytS8bK+mywwm2LJbgI0nXqsvsDpJqsS22uQfcZudHXdKYpwu3DYjcyAN12EvWLpx5THSLePvP6adHsf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791879862; c=relaxed/simple;
	bh=FTxZbIRzjHN8Ao/LYW7FYIJxjuUQnB+2+yOa6PRxNs4=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=QUn5gXxrmIPvXYiptn5NpViRqrAvUAlO7JJEr4Rzeozm6CtWp9rqTwIs3459BhqZnn2fkTJVVY7CVgKdkkglkv9p7WZiLzaAuTtR/rFiQvEV+jYiiDSHVSpBxEeXbxuhFoCURoBk7amHPtpYQ6vh7tANOyqAzCzDzrpL4Y/XjNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=n9t+CZYH; arc=none smtp.client-ip=68.232.153.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="n9t+CZYH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1791879860; x=1823415860;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=FTxZbIRzjHN8Ao/LYW7FYIJxjuUQnB+2+yOa6PRxNs4=;
  b=n9t+CZYHRJ2YOgA+bflXlX+j0DOFa3j7MwdUlkMKo/iSf7XfQjKDuR2z
   XEnUfs3n3BqyNN5KcaHHwn4kWnZEXVYfwUMlu41dpPYWAL8kdhuO1S2Cs
   /DJupRc1H+Whpt70TA9axNq9irQVS+KxabIFPiR07ClsEFeQngd7zgKEm
   58X5/RdNq5h+qMHPTPUt68sDzpnP6w3Ff+/5+gmDPh0beCgtlhb9KGagq
   rYwXo+//xi0J1F3vst+24D2iYPbE8AjF5/HQXid2HkWnbGkdDKb6K7InY
   Nligt2AtRSuoBiTv5xma/U0kCKseNryxQcTb5sVMBkQb80aGTuFDYhQde
   Q==;
X-CSE-ConnectionGUID: 0NvGL0pDRK+TX9TXxYqZAg==
X-CSE-MsgGUID: vBQs5LFcQQepkjfYtoS+jg==
X-IronPort-AV: E=Sophos;i="6.27,155,1787036400"; 
   d="scan'208";a="75297029"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2026 01:24:19 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.87.151) by
 chn-vm-ex1.mchp-main.com (10.10.87.30) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.49; Tue, 13 Oct 2026 01:24:19 -0700
Received: from archlinux.mchp-main.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Tue, 13 Oct 2026 01:24:18 -0700
From: Mihai Sain <mihai.sain@microchip.com>
To: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>, "Mihai
 Sain" <mihai.sain@microchip.com>
Subject: [PATCH] mtd: mtdpart: convert printk to pr_* and define pr_fmt
Date: Tue, 13 Oct 2026 11:23:43 +0300
Message-ID: <20261013082352.5051-2-mihai.sain@microchip.com>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Define pr_fmt to prefix all pr_* print statements in this file with
"mtd: ". Convert legacy printk() invocations to their modern pr_err(),
pr_warn(), and pr_notice() equivalents so that the prefix applies
consistently across all logs.

Where applicable, redundant "mtd: " substrings embedded within individual
print strings were removed to avoid duplicate prefixing in the final output.

before this patch:

[    1.593577] 6 fixed-partitions partitions found on MTD device at91-nand
[    1.600241] Creating 6 MTD partitions on "at91-nand":
[    1.605304] 0x000000000000-0x000000040000 : "nand: at91bootstrap"
[    1.611961] 0x000000040000-0x000000140000 : "nand: u-boot"
[    1.617855] 0x000000140000-0x000000180000 : "nand: u-boot env"
[    1.624128] 0x000000180000-0x000000200000 : "nand: device tree"
[    1.630517] 0x000000200000-0x000000800000 : "nand: kernel"
[    1.636322] 0x000000800000-0x000040000000 : "nand: rootfs"

after this patch:

[    1.596940] mtd: 6 fixed-partitions partitions found on MTD device at91-nand
[    1.604040] mtd: Creating 6 MTD partitions on "at91-nand":
[    1.609480] mtd: 0x000000000000-0x000000040000 : "nand: at91bootstrap"
[    1.616700] mtd: 0x000000040000-0x000000140000 : "nand: u-boot"
[    1.623149] mtd: 0x000000140000-0x000000180000 : "nand: u-boot env"
[    1.629729] mtd: 0x000000180000-0x000000200000 : "nand: device tree"
[    1.636543] mtd: 0x000000200000-0x000000800000 : "nand: kernel"
[    1.642889] mtd: 0x000000800000-0x000040000000 : "nand: rootfs"

Signed-off-by: Mihai Sain <mihai.sain@microchip.com>
---
 drivers/mtd/mtdpart.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
index ddded0dbe77e..df93f198b1b2 100644
--- a/drivers/mtd/mtdpart.c
+++ b/drivers/mtd/mtdpart.c
@@ -6,6 +6,7 @@
  * Copyright © 2002 Thomas Gleixner <gleixner@linutronix.de>
  * Copyright © 2000-2010 David Woodhouse <dwmw2@infradead.org>
  */
+#define pr_fmt(fmt) "mtd: " fmt
 
 #include <linux/module.h>
 #include <linux/types.h>
@@ -57,7 +58,7 @@ static struct mtd_info *allocate_partition(struct mtd_info *parent,
 	child = kzalloc_obj(*child);
 	name = kstrdup(part->name, GFP_KERNEL);
 	if (!name || !child) {
-		printk(KERN_ERR"memory allocation error while creating partitions for \"%s\"\n",
+		pr_err("memory allocation error while creating partitions for \"%s\"\n",
 		       parent->name);
 		kfree(name);
 		kfree(child);
@@ -102,7 +103,7 @@ static struct mtd_info *allocate_partition(struct mtd_info *parent,
 		remainder = do_div(tmp, wr_alignment);
 		if (remainder) {
 			child->part.offset += wr_alignment - remainder;
-			printk(KERN_NOTICE "Moving partition %d: "
+			pr_notice("Moving partition %d: "
 			       "0x%012llx -> 0x%012llx\n", partno,
 			       (unsigned long long)cur_offset,
 			       child->part.offset);
@@ -114,7 +115,7 @@ static struct mtd_info *allocate_partition(struct mtd_info *parent,
 			child->part.size = parent_size - child->part.offset -
 					   child->part.size;
 		} else {
-			printk(KERN_ERR "mtd partition \"%s\" doesn't have enough space: %#llx < %#llx, disabled\n",
+			pr_err("partition \"%s\" doesn't have enough space: %#llx < %#llx, disabled\n",
 				part->name, parent_size - child->part.offset,
 				child->part.size);
 			/* register to preserve ordering */
@@ -127,7 +128,7 @@ static struct mtd_info *allocate_partition(struct mtd_info *parent,
 	if (child->part.size == MTDPART_SIZ_FULL)
 		child->part.size = parent_size - child->part.offset;
 
-	printk(KERN_NOTICE "0x%012llx-0x%012llx : \"%s\"\n",
+	pr_notice("0x%012llx-0x%012llx : \"%s\"\n",
 	       child->part.offset, child->part.offset + child->part.size,
 	       child->name);
 
@@ -139,13 +140,13 @@ static struct mtd_info *allocate_partition(struct mtd_info *parent,
 
 		/* Initialize ->erasesize to make add_mtd_device() happy. */
 		child->erasesize = parent->erasesize;
-		printk(KERN_ERR"mtd: partition \"%s\" is out of reach -- disabled\n",
+		pr_err("partition \"%s\" is out of reach -- disabled\n",
 			part->name);
 		goto out_register;
 	}
 	if (child->part.offset + child->part.size > parent->size) {
 		child->part.size = parent_size - child->part.offset;
-		printk(KERN_WARNING"mtd: partition \"%s\" extends beyond the end of device \"%s\" -- size truncated to %#llx\n",
+		pr_warn("partition \"%s\" extends beyond the end of device \"%s\" -- size truncated to %#llx\n",
 			part->name, parent->name, child->part.size);
 	}
 
@@ -190,7 +191,7 @@ static struct mtd_info *allocate_partition(struct mtd_info *parent,
 		/* FIXME: Let it be writable if it is on a boundary of
 		 * _minor_ erase size though */
 		child->flags &= ~MTD_WRITEABLE;
-		printk(KERN_WARNING"mtd: partition \"%s\" doesn't start on an erase/write block boundary -- force read-only\n",
+		pr_warn("partition \"%s\" doesn't start on an erase/write block boundary -- force read-only\n",
 			part->name);
 	}
 
@@ -198,7 +199,7 @@ static struct mtd_info *allocate_partition(struct mtd_info *parent,
 	remainder = do_div(tmp, wr_alignment);
 	if ((child->flags & MTD_WRITEABLE) && remainder) {
 		child->flags &= ~MTD_WRITEABLE;
-		printk(KERN_WARNING"mtd: partition \"%s\" doesn't end on an erase/write block -- force read-only\n",
+		pr_warn("partition \"%s\" doesn't end on an erase/write block -- force read-only\n",
 			part->name);
 	}
 
@@ -241,8 +242,7 @@ static int mtd_add_partition_attrs(struct mtd_info *new)
 {
 	int ret = sysfs_create_files(&new->dev.kobj, mtd_partition_attrs);
 	if (ret)
-		printk(KERN_WARNING
-		       "mtd: failed to create partition attrs, err=%d\n", ret);
+		pr_warn("failed to create partition attrs, err=%d\n", ret);
 	return ret;
 }
 
@@ -409,7 +409,7 @@ int add_mtd_partitions(struct mtd_info *parent,
 	uint64_t cur_offset = 0;
 	int i, ret;
 
-	printk(KERN_NOTICE "Creating %d MTD partitions on \"%s\":\n",
+	pr_notice("Creating %d MTD partitions on \"%s\":\n",
 	       nbparts, parent->name);
 
 	for (i = 0; i < nbparts; i++) {
-- 
2.56.0

