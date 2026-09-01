Received: from canpmsgout04.his.huawei.com (canpmsgout04.his.huawei.com [113.46.200.219])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C4D0471260
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 13:13:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.219
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788268390; cv=none; b=to72A1fIPdlulro0eRcH4CpX4ig76Gqh361flPGDe+/tjcLTKNq+hLN1mY4PtwvuO/PqCwIDPX+IAC0nczgJoBtJbr3/PSBy0kboChJvyiwEcsGS6dvLR5O2hnvlHoIuznlZ+1q2XiTuBf3ta3arNoWg2Z3vnBzVQH6/ORnU10c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788268390; c=relaxed/simple;
	bh=2AmiSUiKl+6GpuUekKJXB/hMo25EauFgDVt8IIftU7g=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QOlGqrANIWcR5c89GjRVbkdtylCO19P4jHnZ9MwwTeJ8lJtcaHPbryP4kFXifyJilx7gOHEW1L5E5AAyZNXZV0mbJN3g/c+NWv6UMMPGEDpQdaQVI9RpdK1y1Lgq4mq3Y+mKqYEzqkua9C28CCVaP0RTv5+lLl1zN2ozgZJFvs4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=xTyBELc/; arc=none smtp.client-ip=113.46.200.219
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="xTyBELc/"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=bLJ7so2eQ04eUxA7uRgkuQiNgLyO0A/w5Eo0GY7ooL8=;
	b=xTyBELc/cInYBPOUaTwt3ILOfZ8Pf1/HI1d647R/Wj1c7mrsUsFgGo6dMICOPm6/A2FvA1OPa
	OLpDQ8pLDW77LCeJ/wMWwQZwTA8vs7oqYp02u/NAFMCA1JTKhXa+1DFZkbttwNYqEJRvMcS+5Dk
	X8P9UZhgp21LbdrV9BHtios=
Received: from mail.maildlp.com (unknown [172.19.162.197])
	by canpmsgout04.his.huawei.com (SkyGuard) with ESMTPS id 4hZ5bz1vPzz1prLc;
	Tue,  1 Sep 2026 21:02:07 +0800 (CST)
Received: from dggpemr100018.china.huawei.com (unknown [7.185.36.64])
	by mail.maildlp.com (Postfix) with ESMTPS id 7E33440579;
	Tue,  1 Sep 2026 21:12:58 +0800 (CST)
Received: from huawei.com (10.50.85.155) by dggpemr100018.china.huawei.com
 (7.185.36.64) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.36; Tue, 1 Sep
 2026 21:12:57 +0800
From: zhouminqiang <zhouminqiang2@huawei.com>
To: <linux@armlinux.org.uk>, <vz@mleia.com>, <piotr.wojtaszczyk@timesys.com>,
	<maddy@linux.ibm.com>, <dwmw2@infradead.org>, <richard@nod.at>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linuxppc-dev@lists.ozlabs.org>, <linux-mtd@lists.infradead.org>,
	<chengzhihao1@huawei.com>, <yangerkun@huawei.com>, <yi.zhang@huawei.com>
Subject: [PATCH v3 8/8] jffs2: add runtime toggle for write verification
Date: Tue, 1 Sep 2026 21:05:49 +0800
Message-ID: <20260901130549.1761342-9-zhouminqiang2@huawei.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260901130549.1761342-1-zhouminqiang2@huawei.com>
References: <20260901130549.1761342-1-zhouminqiang2@huawei.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
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
index 604a14bb5710..342c413be95c 100644
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
 	verify_buf = kmalloc(len, GFP_NOFS | __GFP_NOWARN);
 	if (!verify_buf) {
 		pr_warn("%s(): verify buffer allocation failed, skipping verification\n",
-- 
2.52.0

