Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=68.232.154.123
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794925708;
	b=26QVgCwsODd81ZzbZrEcaHmkB6hMENSMNAJz44G3nXTOyhHCa18J8DCHlOkpZPHEChJp
	 Qm5XkD/JgT4dv/RKntpA7ySiUBqrynQ1xIK9d3R4clVPMzkX5xAwKCGpMnfejKylwDF+c
	 xMdCRDmluy1Mm2GkMLH65yqKXkbinK4Nbhw1YzG9CwNdlqu0u8/ACv4edoJrmaFHcoKqV
	 wjewZQKapklohPZyp5Mtqi+cib+d9GT+MsVgBphdlbHfyDnnCKRe/KuQCSjDVBcrSkGpP
	 s6NFPhpCCFtUPW7zHe5u3l+CSgkXsMrAGXRZv9nFFwO3orazvdlfyokBFUYegEQy0rw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794925708;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-Amp-Result:Received:Received:Received:From:To:CC:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=85KflbrbxVhXSkNzLtpEHFfKOjLQOIN6AvkukMG7gV4=;
	b=P4SruORHI1lZ2yrSV5Q9xvA8dvZrmsoiCUtuIxuLBRugSTB3HiuOy7aTKzOqjeC/z5bw
	 CwrqYCC2dhrsgM+5lRhKii8tbxbWPsAcKUz/GK5mYs7cR21sjlMthT+/zMP5ncvhIOIND
	 w1W2e+KL/Abpqpy0pdF/8IgSzYqBRBdz82sMccP4WCAnUUKl7c2IXp5yufbwwoQ6TAhtw
	 lDSJW9yNOkINZ/gCbadP88CLfeA55sRQoa/rSAgy2C9ZNKIQOiaf7CxKHITXZICZlOx2q
	 VyVxAzdA66ToivHE4mGTlDWHqW43OsPtSnre1/xDBk5nCPnJ2QJmERM6wIvH6cqcXdw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=microchip.com;
	spf=pass smtp.mailfrom=microchip.com;
	dkim=pass header.d=microchip.com header.i=@microchip.com header.a=rsa-sha256 header.s=mchp header.b=NL04txYb;
	arc=none smtp.remote-ip=68.232.154.123
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95850606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 14:28:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 95850606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=microchip.com header.i=@microchip.com header.a=rsa-sha256 header.s=mchp header.b=NL04txYb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1794925707; x=1826461707;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=NtRgW8juifUJuw1UVbGSuFrtiwx8Mx264GHtjgWFAQ4=;
  b=NL04txYbEDtLQ+0ihTbPrkajaHTo2gVsaOJhQr2ERIx0RJVSPLwg2gTP
   8MC2Bhc/ud2islCU1xO34acg9TJuE0GAxScEIjTi7uDJrvLmql2DQdRRc
   R9sd0bQOKQggmArGZpmoWZfx7n1JphyytaQPnyjij8d+3wYIR12Qb50qo
   OjBO1AnJBEbutdbD81HTPtEc6ilDnqEwQ8NNy7s0Xax+NalHLBeMlGx7E
   KwIll6Zhddd2HRfLWMJo3Ec4U5iCMO9prvVdjv09osFJH2/IOnME+BwMB
   nC/XuDmQkQQts6yHdWGUMRTT0+Zr7JJZEMgKLzxtb2yF6BKV1oUrudBs0
   A==;
X-CSE-ConnectionGUID: YXArr9RISDiTmr8Y2Vd4kw==
X-CSE-MsgGUID: 5kSqcNZLTFioyT1B4U7JGw==
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="233693733"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 17 Nov 2026 07:28:26 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Tue, 17 Nov 2026 07:28:26 -0700
Received: from archlinux.mchp-main.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Tue, 17 Nov 2026 07:28:24 -0700
From: Mihai Sain <mihai.sain@microchip.com>
To: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>, "Mihai
 Sain" <mihai.sain@microchip.com>
Subject: [PATCH v2] mtd: mtdpart: convert printk to pr_* and define pr_fmt
Date: Tue, 17 Nov 2026 16:28:12 +0200
Message-ID: <20261117142817.2658-1-mihai.sain@microchip.com>
X-Mailer: git-send-email 2.56.1
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
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
Changes in v2:

- Fix alignment of continuation lines to match open parenthesis

 drivers/mtd/mtdpart.c | 40 ++++++++++++++++++++--------------------
 1 file changed, 20 insertions(+), 20 deletions(-)

diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
index ddded0dbe77e..9543e9579c7b 100644
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
@@ -102,10 +101,10 @@ static struct mtd_info *allocate_partition(struct mtd_info *parent,
 		remainder = do_div(tmp, wr_alignment);
 		if (remainder) {
 			child->part.offset += wr_alignment - remainder;
-			printk(KERN_NOTICE "Moving partition %d: "
-			       "0x%012llx -> 0x%012llx\n", partno,
-			       (unsigned long long)cur_offset,
-			       child->part.offset);
+			pr_notice("Moving partition %d: 0x%012llx -> 0x%012llx\n",
+				  partno,
+				  (unsigned long long)cur_offset,
+				  child->part.offset);
 		}
 	}
 	if (child->part.offset == MTDPART_OFS_RETAIN) {
@@ -114,9 +115,9 @@ static struct mtd_info *allocate_partition(struct mtd_info *parent,
 			child->part.size = parent_size - child->part.offset -
 					   child->part.size;
 		} else {
-			printk(KERN_ERR "mtd partition \"%s\" doesn't have enough space: %#llx < %#llx, disabled\n",
-				part->name, parent_size - child->part.offset,
-				child->part.size);
+			pr_err("partition \"%s\" doesn't have enough space: %#llx < %#llx, disabled\n",
+			       part->name, parent_size - child->part.offset,
+			       child->part.size);
 			/* register to preserve ordering */
 			child->part.offset = 0;
 			child->part.size = 0;
@@ -127,9 +128,9 @@ static struct mtd_info *allocate_partition(struct mtd_info *parent,
 	if (child->part.size == MTDPART_SIZ_FULL)
 		child->part.size = parent_size - child->part.offset;
 
-	printk(KERN_NOTICE "0x%012llx-0x%012llx : \"%s\"\n",
-	       child->part.offset, child->part.offset + child->part.size,
-	       child->name);
+	pr_notice("0x%012llx-0x%012llx : \"%s\"\n",
+		  child->part.offset, child->part.offset + child->part.size,
+		  child->name);
 
 	/* let's do some sanity checks */
 	if (child->part.offset >= parent_size) {
@@ -139,13 +140,13 @@ static struct mtd_info *allocate_partition(struct mtd_info *parent,
 
 		/* Initialize ->erasesize to make add_mtd_device() happy. */
 		child->erasesize = parent->erasesize;
-		printk(KERN_ERR"mtd: partition \"%s\" is out of reach -- disabled\n",
-			part->name);
+		pr_err("partition \"%s\" is out of reach -- disabled\n",
+		       part->name);
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
 
@@ -409,8 +409,8 @@ int add_mtd_partitions(struct mtd_info *parent,
 	uint64_t cur_offset = 0;
 	int i, ret;
 
-	printk(KERN_NOTICE "Creating %d MTD partitions on \"%s\":\n",
-	       nbparts, parent->name);
+	pr_notice("Creating %d MTD partitions on \"%s\":\n",
+		  nbparts, parent->name);
 
 	for (i = 0; i < nbparts; i++) {
 		child = allocate_partition(parent, parts + i, i, cur_offset);
-- 
2.56.1

