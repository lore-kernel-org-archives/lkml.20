Received: from canpmsgout05.his.huawei.com (canpmsgout05.his.huawei.com [113.46.200.220])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F039037E2E2
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 06:25:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.220
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787984742; cv=none; b=PPCP0k4ajsvsSx8J0+yOyt72lOaCOtnWQsMGTAWzWDqDwUAdyaOR2JkB58MQHQc7O2ESVoWOLwil5E3umN/eYHCpq5c21vBRqytCbv8MyIjGl3NqaoIkwYijotkMnF0nfkI1aNmyfWJl4UpLmTdRpfh/rBeng7chQG9TLy/ciT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787984742; c=relaxed/simple;
	bh=88LuP5yZdyTSEeWGmG4VxI3o9iCJKLKOvpqSAVnMtP4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fd8ULBE8E87WTBxW0OLDOEnQbwImFAy8G3zRZtKnhNL8uZDKc/Y/Zl7LUPFM96onXpOuYqGw8AUPsCy0/BBiy7yxTAS5vbZ/pSCsvKaWA91V6JePM5Fnvgn9RVLwUdmT4TcERf0CdQV5btVtE2BxnQkDJho7Eh1LvzpptFQssfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=kGw3GOQA; arc=none smtp.client-ip=113.46.200.220
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="kGw3GOQA"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=S1yrFP4Pe6B/KX4VlbIF1fox942sBDwMlaUs6T4ODEg=;
	b=kGw3GOQA7j/ll6HjJ7opjr9yugQSx0srBbftBV0nHJqV0lNwEOmiK55GOyWVY9oQbti8dmf7Y
	fC4xbX4RXHos2KXMZCje/FHwjDuB0cBw1kirsBique2cBcbiJQ2mXWYVhME5LToy5ot11FKhUtz
	sEGnHGsHsyS5KN6nFTFNgsI=
Received: from mail.maildlp.com (unknown [172.19.162.140])
	by canpmsgout05.his.huawei.com (SkyGuard) with ESMTPS id 4hX4jv5tR9z12LDl;
	Sat, 29 Aug 2026 14:15:15 +0800 (CST)
Received: from dggpemr100018.china.huawei.com (unknown [7.185.36.64])
	by mail.maildlp.com (Postfix) with ESMTPS id 4728820333;
	Sat, 29 Aug 2026 14:25:31 +0800 (CST)
Received: from huawei.com (10.50.85.155) by dggpemr100018.china.huawei.com
 (7.185.36.64) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.36; Sat, 29 Aug
 2026 14:25:30 +0800
From: zhouminqiang <zhouminqiang2@huawei.com>
To: <linux@armlinux.org.uk>, <vz@mleia.com>, <piotr.wojtaszczyk@timesys.com>,
	<maddy@linux.ibm.com>, <dwmw2@infradead.org>, <richard@nod.at>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linuxppc-dev@lists.ozlabs.org>, <linux-mtd@lists.infradead.org>,
	<chengzhihao1@huawei.com>, <yangerkun@huawei.com>, <yi.zhang@huawei.com>
Subject: [PATCH v2 2/7] jffs2: replace per-superblock verify buffer with per-write buffer
Date: Sat, 29 Aug 2026 14:16:52 +0800
Message-ID: <20260829061658.306854-3-zhouminqiang2@huawei.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260829061658.306854-1-zhouminqiang2@huawei.com>
References: <20260829061658.306854-1-zhouminqiang2@huawei.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 dggpemr100018.china.huawei.com (7.185.36.64)

Subsequent patches will extend write verification to additional write
paths that may execute concurrently. A shared per-superblock buffer
would require a coarse lock to serialize all verification, hurting
concurrency.

To avoid this contention, remove the wbuf_verify field from
jffs2_sb_info, along with the scattered kmalloc/kfree of wbuf_verify
in jffs2_nand_flash_setup, jffs2_dataflash_setup,
jffs2_nor_wbuf_flash_setup and their corresponding cleanup functions.

Instead, allocate a temporary buffer inside jffs2_verify_write(),
giving each invocation its own buffer and eliminating the shared state.

Signed-off-by: zhouminqiang <zhouminqiang2@huawei.com>
---
 fs/jffs2/jffs2_fs_sb.h |  3 ---
 fs/jffs2/wbuf.c        | 61 ++++++++++++++++--------------------------
 2 files changed, 23 insertions(+), 41 deletions(-)

diff --git a/fs/jffs2/jffs2_fs_sb.h b/fs/jffs2/jffs2_fs_sb.h
index 5a7091746f68..8a75870d3fc8 100644
--- a/fs/jffs2/jffs2_fs_sb.h
+++ b/fs/jffs2/jffs2_fs_sb.h
@@ -124,9 +124,6 @@ struct jffs2_sb_info {
 
 	uint32_t wbuf_pagesize; /* 0 for NOR and other flashes with no wbuf */
 
-#ifdef CONFIG_JFFS2_FS_WBUF_VERIFY
-	unsigned char *wbuf_verify; /* read-back buffer for verification */
-#endif
 #ifdef CONFIG_JFFS2_FS_WRITEBUFFER
 	unsigned char *wbuf; /* Write-behind buffer for NAND flash */
 	uint32_t wbuf_ofs;
diff --git a/fs/jffs2/wbuf.c b/fs/jffs2/wbuf.c
index 61e3dbd4cd7b..f10be57c5543 100644
--- a/fs/jffs2/wbuf.c
+++ b/fs/jffs2/wbuf.c
@@ -233,19 +233,31 @@ static int jffs2_verify_write(struct jffs2_sb_info *c, unsigned char *buf,
 	int ret;
 	size_t retlen;
 	char *eccstr;
+	void *verify_buf;
+
+	verify_buf = kmalloc(c->wbuf_pagesize, GFP_NOFS);
+	if (!verify_buf) {
+		pr_warn("%s(): verify buffer allocation failed, skipping verification\n",
+			__func__);
+		return 0;
+	}
+
+	ret = mtd_read(c->mtd, ofs, c->wbuf_pagesize, &retlen, verify_buf);
 
-	ret = mtd_read(c->mtd, ofs, c->wbuf_pagesize, &retlen, c->wbuf_verify);
 	if (ret && ret != -EUCLEAN && ret != -EBADMSG) {
 		pr_warn("%s(): Read back of page at %08x failed: %d\n",
 			__func__, c->wbuf_ofs, ret);
-		return ret;
+		goto out_free;
 	} else if (retlen != c->wbuf_pagesize) {
 		pr_warn("%s(): Read back of page at %08x gave short read: %zd not %d\n",
 			__func__, ofs, retlen, c->wbuf_pagesize);
-		return -EIO;
+		ret = -EIO;
+		goto out_free;
+	}
+	if (!memcmp(buf, verify_buf, c->wbuf_pagesize)) {
+		ret = 0;
+		goto out_free;
 	}
-	if (!memcmp(buf, c->wbuf_verify, c->wbuf_pagesize))
-		return 0;
 
 	if (ret == -EUCLEAN)
 		eccstr = "corrected";
@@ -261,9 +273,14 @@ static int jffs2_verify_write(struct jffs2_sb_info *c, unsigned char *buf,
 
 	pr_warn("Read back:\n");
 	print_hex_dump(KERN_WARNING, "", DUMP_PREFIX_OFFSET, 16, 1,
-		       c->wbuf_verify, c->wbuf_pagesize, 0);
+		       verify_buf, c->wbuf_pagesize, 0);
 
+	kfree(verify_buf);
 	return -EIO;
+
+out_free:
+	kfree(verify_buf);
+	return ret;
 }
 #else
 #define jffs2_verify_write(c,b,o) (0)
@@ -1217,22 +1234,11 @@ int jffs2_nand_flash_setup(struct jffs2_sb_info *c)
 		return -ENOMEM;
 	}
 
-#ifdef CONFIG_JFFS2_FS_WBUF_VERIFY
-	c->wbuf_verify = kmalloc(c->wbuf_pagesize, GFP_KERNEL);
-	if (!c->wbuf_verify) {
-		kfree(c->oobbuf);
-		kfree(c->wbuf);
-		return -ENOMEM;
-	}
-#endif
 	return 0;
 }
 
 void jffs2_nand_flash_cleanup(struct jffs2_sb_info *c)
 {
-#ifdef CONFIG_JFFS2_FS_WBUF_VERIFY
-	kfree(c->wbuf_verify);
-#endif
 	kfree(c->wbuf);
 	kfree(c->oobbuf);
 }
@@ -1272,14 +1278,6 @@ int jffs2_dataflash_setup(struct jffs2_sb_info *c) {
 	if (!c->wbuf)
 		return -ENOMEM;
 
-#ifdef CONFIG_JFFS2_FS_WBUF_VERIFY
-	c->wbuf_verify = kmalloc(c->wbuf_pagesize, GFP_KERNEL);
-	if (!c->wbuf_verify) {
-		kfree(c->wbuf);
-		return -ENOMEM;
-	}
-#endif
-
 	pr_info("write-buffering enabled buffer (%d) erasesize (%d)\n",
 		c->wbuf_pagesize, c->sector_size);
 
@@ -1287,9 +1285,6 @@ int jffs2_dataflash_setup(struct jffs2_sb_info *c) {
 }
 
 void jffs2_dataflash_cleanup(struct jffs2_sb_info *c) {
-#ifdef CONFIG_JFFS2_FS_WBUF_VERIFY
-	kfree(c->wbuf_verify);
-#endif
 	kfree(c->wbuf);
 }
 
@@ -1309,20 +1304,10 @@ int jffs2_nor_wbuf_flash_setup(struct jffs2_sb_info *c) {
 	if (!c->wbuf)
 		return -ENOMEM;
 
-#ifdef CONFIG_JFFS2_FS_WBUF_VERIFY
-	c->wbuf_verify = kmalloc(c->wbuf_pagesize, GFP_KERNEL);
-	if (!c->wbuf_verify) {
-		kfree(c->wbuf);
-		return -ENOMEM;
-	}
-#endif
 	return 0;
 }
 
 void jffs2_nor_wbuf_flash_cleanup(struct jffs2_sb_info *c) {
-#ifdef CONFIG_JFFS2_FS_WBUF_VERIFY
-	kfree(c->wbuf_verify);
-#endif
 	kfree(c->wbuf);
 }
 
-- 
2.52.0

