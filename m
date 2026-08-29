Received: from canpmsgout05.his.huawei.com (canpmsgout05.his.huawei.com [113.46.200.220])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83AAD348C52
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 06:25:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.220
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787984746; cv=none; b=l60CT0+CkPs8c2Q57CKthBT1Sdm95uWFQOU8HowiCUts/zXwKu/Xi+Iwv8Ss+OjBmQoaYZJWAXgHQfNyTWdMOFBH6GGwzl6kPXAnqTMNUqZDZNzRT/PmkKpiWj7RStQia5VpZvwSLGs/mTK31wv9FGr/XrEvJA03U+YPfMs9ehQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787984746; c=relaxed/simple;
	bh=P2jj/NVenMrYbTc7r2bbQSGyREGvs1wa/tFZKLs1GfU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NXUr1JdtKB0lggn5HNto5ZDapYHTA7hd9oBh9Vr+3VUBphhg4KUbe12e0aRAPNLTQX8Fvk9cIlCDpDuE8jhzMV9EoS/2dsEpYfZpXKa6ZolIe+vGhW4IGwu5AGOLdLu3C9uhqmJ+5XZz7FjodqF6x2gyDX1MdZA9wBDMP1iJTN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=e1y7l4Ph; arc=none smtp.client-ip=113.46.200.220
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="e1y7l4Ph"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=TJPANoRDN+fYMKpdt+JU9S3bLccMRqCiof0MgFwWlzU=;
	b=e1y7l4PhB4SfaOvwKAgMRqpDb/LHbrOvtd4RRG+s06Bp4xSgq0ZtZIK38odls8nOMy+Pssfhs
	dIjbctOBeEbXuDyPgy+AkY4UfTzbYxhEcpy+gjZcQ9qv73489a4eDbvWgIWcyRat6z/ITUyOQq+
	TAfgjFIDi2aRqlLcXMYK00s=
Received: from mail.maildlp.com (unknown [172.19.162.197])
	by canpmsgout05.his.huawei.com (SkyGuard) with ESMTPS id 4hX4jz5zbRz12LDl;
	Sat, 29 Aug 2026 14:15:19 +0800 (CST)
Received: from dggpemr100018.china.huawei.com (unknown [7.185.36.64])
	by mail.maildlp.com (Postfix) with ESMTPS id 483714057D;
	Sat, 29 Aug 2026 14:25:35 +0800 (CST)
Received: from huawei.com (10.50.85.155) by dggpemr100018.china.huawei.com
 (7.185.36.64) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.36; Sat, 29 Aug
 2026 14:25:34 +0800
From: zhouminqiang <zhouminqiang2@huawei.com>
To: <linux@armlinux.org.uk>, <vz@mleia.com>, <piotr.wojtaszczyk@timesys.com>,
	<maddy@linux.ibm.com>, <dwmw2@infradead.org>, <richard@nod.at>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linuxppc-dev@lists.ozlabs.org>, <linux-mtd@lists.infradead.org>,
	<chengzhihao1@huawei.com>, <yangerkun@huawei.com>, <yi.zhang@huawei.com>
Subject: [PATCH v2 7/7] jffs2: add runtime toggle for write verification
Date: Sat, 29 Aug 2026 14:16:57 +0800
Message-ID: <20260829061658.306854-8-zhouminqiang2@huawei.com>
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

Write verification is a diagnostic facility that adds read-back
overhead to every write. In production, this overhead is undesirable
unless fault isolation is required.

Add a module parameter jffs2.write_verify (bool, 0644) that defaults
to off when CONFIG_JFFS2_FS_WRITE_VERIFY is enabled. The verification
entry checks READ_ONCE(jffs2_write_verify) and returns immediately
when disabled, avoiding any overhead. The parameter can be toggled at
runtime via /sys/module/jffs2/parameters/write_verify or set at
boot/modprobe time.

Signed-off-by: zhouminqiang <zhouminqiang2@huawei.com>
---
 fs/jffs2/Kconfig  |  8 ++++++++
 fs/jffs2/writev.c | 23 +++++++++++++++++++++++
 2 files changed, 31 insertions(+)

diff --git a/fs/jffs2/Kconfig b/fs/jffs2/Kconfig
index 556025a5d438..03dadbd003cd 100644
--- a/fs/jffs2/Kconfig
+++ b/fs/jffs2/Kconfig
@@ -61,6 +61,14 @@ config JFFS2_FS_WRITE_VERIFY
 	  tell transport/program-time corruption from post-commit media
 	  damage.
 
+	  Verification defaults to off when this option is selected and can
+	  be enabled at runtime via sysfs:
+
+	    /sys/module/jffs2/parameters/write_verify
+
+	  Write 0 to disable, 1 to enable.  Boot/modprobe parameter
+	  jffs2.write_verify=0|1 is also supported.
+
 	  If unsure, say 'N'.
 
 config JFFS2_SUMMARY
diff --git a/fs/jffs2/writev.c b/fs/jffs2/writev.c
index 75b4244e93b8..913183329c54 100644
--- a/fs/jffs2/writev.c
+++ b/fs/jffs2/writev.c
@@ -9,12 +9,32 @@
  *
  */
 
+#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
+
 #include <linux/kernel.h>
+#include <linux/module.h>
 #include <linux/slab.h>
 #include <linux/mtd/mtd.h>
 #include "nodelist.h"
 
 #ifdef CONFIG_JFFS2_FS_WRITE_VERIFY
+/*
+ * Optional read-back after writes.
+ *
+ * Catch cases where data is corrupted after node CRCs are calculated but
+ * before it is correctly programmed -- e.g. in RAM or during DMA/bus
+ * transfer to the flash controller -- so mtd_write() succeeds while the
+ * medium does not match the in-memory image.
+ *
+ * Runtime toggle: /sys/module/jffs2/parameters/write_verify
+ * (also boot/modprobe: jffs2.write_verify=0|1)
+ */
+static bool jffs2_write_verify;
+module_param_named(write_verify, jffs2_write_verify, bool, 0644);
+MODULE_PARM_DESC(write_verify,
+		 "Verify flash writes by reading back (default: N)");
+
+
 int jffs2_verify_write(struct jffs2_sb_info *c, const unsigned char *buf,
 			      uint32_t ofs, size_t len)
 {
@@ -23,6 +43,9 @@ int jffs2_verify_write(struct jffs2_sb_info *c, const unsigned char *buf,
 	char *eccstr;
 	void *verify_buf;
 
+	if (!READ_ONCE(jffs2_write_verify))
+		return 0;
+
 	verify_buf = kmalloc(len, GFP_NOFS);
 	if (!verify_buf) {
 		pr_warn("%s(): verify buffer allocation failed, skipping verification\n",
-- 
2.52.0

