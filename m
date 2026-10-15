Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 234583E9C16
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 05:29:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792042145; cv=none; b=V/ACGybf7/SADfFzh8Rjv7/KwXUaR1KRWN1P6bKrDg5MlWZoki9a5xLQSp9yqIQE/dM2twudj4U8ECAlZRL2YJCFjSvV2AF9FOZ2PMtI1BsVIaNOz2wmhhi+X4XCGkdSBUyJ2uMyud7o3xjQEB3CT0sobLl+mLQQd3HS+aTb43Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792042145; c=relaxed/simple;
	bh=lE3Nkqw/kDIE0H/jFnmt2+oaxzWg6QHwwHm+dtm07po=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BU9ZwHkBUGdFPyvE4oKqhAvCXOSjc5os4LY1KHWWUhTqndt8imscDsBFWx6lfsjO8waO3ev/csEg2bglx4i5rTPMt67IXXJgeZm6tNi29VLmnwF4VuzUIASxJnOoexBd1vLqYLid1/IajPJ6qYrGW1NAYwyt8j4JzAiLNVxpwW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kLEqpxzl; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kLEqpxzl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792042144; x=1823578144;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=lE3Nkqw/kDIE0H/jFnmt2+oaxzWg6QHwwHm+dtm07po=;
  b=kLEqpxzlvl71dw7cfxBDw3uGRiRIuIrzgS90TV4/Ccd55RUC4BasNst3
   ywnJqfwCkYFREB01QsiCWZiHVPbtV/xoqcWpNe+SRFEPFg77r2Ni00v4I
   QQm7g2bFgMwdHenvwhTW37PpOAzElzAg8mA6/5IiCyuO5bcYTHWmuV8Sc
   6vYd7zpf21Yu/8sf1jOsuydpiwsPrEdKoRxdWNRHWw2kQYA8bULl31q7U
   dRk2MCbkM79bsYzsHKOr6+Tdnl4J3y332228w23sA/9uWYhk6Nf9+fF65
   hpfMEyJ9W8qi63iIkGtOrV/LxBoqS5EG3LDeXkLsGrOytQzsooh8l1apD
   Q==;
X-CSE-ConnectionGUID: N5cm0/PnThuMJa7YLpjR7w==
X-CSE-MsgGUID: Hs9SPcutQnuwU7jPCH5srQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11935"; a="813104"
X-IronPort-AV: E=Sophos;i="6.27,159,1787036400"; 
   d="scan'208";a="813104"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2026 22:29:03 -0700
X-CSE-ConnectionGUID: egkeIJO3S+G/652uHXxehA==
X-CSE-MsgGUID: hdqRNevNSCa9gL42DVvvcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,159,1787036400"; 
   d="scan'208";a="1928849"
Received: from sannilnx-dsk.jer.intel.com (HELO [127.0.1.1]) ([10.12.231.107])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2026 22:29:02 -0700
From: Alexander Usyskin <alexander.usyskin@intel.com>
Date: Thu, 15 Oct 2026 08:28:43 +0300
Subject: [PATCH char-misc-next 3/4] issei: host_client: add dma allocation
 support
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-issei_pm_and_itf-v1-3-8212238a57a4@intel.com>
References: <20261015-issei_pm_and_itf-v1-0-8212238a57a4@intel.com>
In-Reply-To: <20261015-issei_pm_and_itf-v1-0-8212238a57a4@intel.com>
To: Arnd Bergmann <arnd@arndb.de>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, Menachem Adin <menachem.adin@intel.com>, 
 Andrzej Kacprowski <andrzej.kacprowski@linux.intel.com>, 
 Karol Wachowski <karol.wachowski@linux.intel.com>, 
 Alexander Usyskin <alexander.usyskin@intel.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792042134; l=4933;
 i=alexander.usyskin@intel.com; s=20260315; h=from:subject:message-id;
 bh=lE3Nkqw/kDIE0H/jFnmt2+oaxzWg6QHwwHm+dtm07po=;
 b=o4hdNgLHxn9ZgrYkUQ8ZjjMuKWGl4y4JMX5/CIcz+8wUxXHirGKNOI2NHpOPeUqOADFBYVNMl
 zwpEuBBvIJRDDqQIoCcA764PHVjA7lXP9vHx4DsYWyalCiaY5j4BcbD
X-Developer-Key: i=alexander.usyskin@intel.com; a=ed25519;
 pk=X+qoF/nFCdDOV04IForWSxnkyoCAbUE10egZi6PSfcU=

Add functions to allow dedicated DMA buffer allocated on current
hardware device per host client.

Signed-off-by: Alexander Usyskin <alexander.usyskin@intel.com>
---
 drivers/misc/issei/host_client.c | 66 ++++++++++++++++++++++++++++++++++++++++
 drivers/misc/issei/host_client.h | 12 ++++++++
 drivers/misc/issei/issei_dev.h   |  3 ++
 3 files changed, 81 insertions(+)

diff --git a/drivers/misc/issei/host_client.c b/drivers/misc/issei/host_client.c
index d16b5835c619..751296e3dc25 100644
--- a/drivers/misc/issei/host_client.c
+++ b/drivers/misc/issei/host_client.c
@@ -2,6 +2,7 @@
 /* Copyright (C) 2023-2026 Intel Corporation */
 #include <linux/cleanup.h>
 #include <linux/dev_printk.h>
+#include <linux/dma-mapping.h>
 #include <linux/err.h>
 #include <linux/fs.h>
 #include <linux/kobject.h>
@@ -112,6 +113,17 @@ static void __issei_cl_disconnect(struct issei_device *idev, struct issei_host_c
 	cl_dbg(idev, cl, "Disconnected\n");
 }
 
+static void __issei_cl_dma_unmap(struct issei_host_client *cl)
+{
+	if (!cl->dma_size)
+		return;
+
+	dma_free_coherent(cl->idev->parent, cl->dma_size, cl->dma_vaddr, cl->dma_daddr);
+	cl->dma_size = 0;
+	cl->dma_vaddr = NULL;
+	cl->dma_daddr = 0;
+}
+
 static void __issei_cl_init(struct issei_host_client *cl, struct issei_device *idev,
 			    u16 id, struct file *fp)
 {
@@ -185,6 +197,8 @@ void issei_cl_remove(struct issei_host_client *cl)
 
 	__issei_cl_disconnect(idev, cl);
 
+	__issei_cl_dma_unmap(cl);
+
 	cl_dbg(idev, cl, "Removed\n");
 	kfree(cl);
 }
@@ -521,3 +535,55 @@ void issei_cl_clean_all_wbuf(struct issei_host_client *cl)
 
 	__issei_cl_clean_all_wbuf(idev, cl);
 }
+
+/**
+ * issei_cl_dma_map - allocate DMA mapping for client
+ *
+ * @cl: host client
+ * @size: memory size to allocate
+ * @daddr: pointer for buffer DMA address
+ * @vaddr: pointer for buffer virtual address
+ *
+ * Return: 0 on success, < 0 on error
+ */
+int issei_cl_dma_map(struct issei_host_client *cl, size_t size,
+		     dma_addr_t *daddr, void **vaddr)
+{
+	struct issei_device *idev = cl->idev;
+
+	if (size == 0 || size > ISSEI_HOST_DMA_MAX_SIZE) {
+		cl_err(idev, cl, "The size is out of bounds.\n");
+		return -EINVAL;
+	}
+
+	guard(mutex)(&idev->client_lock);
+
+	if (cl->dma_size) {
+		cl_err(idev, cl, "DMA already allocated.\n");
+		return -EALREADY;
+	}
+
+	cl->dma_vaddr = dma_alloc_coherent(cl->idev->parent, size, &cl->dma_daddr, GFP_KERNEL);
+	if (!cl->dma_vaddr)
+		return -ENOMEM;
+
+	cl->dma_size = size;
+
+	*daddr = cl->dma_daddr;
+	*vaddr = cl->dma_vaddr;
+	return 0;
+}
+
+/**
+ * issei_cl_dma_unmap - deallocate DMA mapping for client
+ *
+ * @cl: host client
+ */
+void issei_cl_dma_unmap(struct issei_host_client *cl)
+{
+	struct issei_device *idev = cl->idev;
+
+	guard(mutex)(&idev->client_lock);
+
+	__issei_cl_dma_unmap(cl);
+}
diff --git a/drivers/misc/issei/host_client.h b/drivers/misc/issei/host_client.h
index 05e2f4ade9c3..987cee609676 100644
--- a/drivers/misc/issei/host_client.h
+++ b/drivers/misc/issei/host_client.h
@@ -38,6 +38,10 @@ enum issei_host_client_state {
  * @read_wait: waitqueue for read object
  * @read_data: received data pointer
  * @read_data_size: received data size
+ *
+ * @dma_vaddr: allocated DMA buffer virtual address
+ * @dma_daddr: allocated DMA buffer DMA address
+ * @dma_size: allocated DMA buffer size, zero if no buffer allocated
  */
 struct issei_host_client {
 	struct list_head list;
@@ -54,6 +58,10 @@ struct issei_host_client {
 	wait_queue_head_t read_wait;
 	u8 *read_data;
 	size_t read_data_size;
+
+	void *dma_vaddr;
+	dma_addr_t dma_daddr;
+	size_t dma_size;
 };
 
 struct issei_host_client *issei_cl_create(struct issei_device *idev, struct file *fp);
@@ -72,4 +80,8 @@ int issei_cl_check_read(struct issei_host_client *cl);
 int issei_cl_check_write(struct issei_host_client *cl);
 void issei_cl_clean_all_wbuf(struct issei_host_client *cl);
 
+int issei_cl_dma_map(struct issei_host_client *cl, size_t size,
+		     dma_addr_t *daddr, void **vaddr);
+void issei_cl_dma_unmap(struct issei_host_client *cl);
+
 #endif /* ISSEI_HOST_CLIENT_H_ */
diff --git a/drivers/misc/issei/issei_dev.h b/drivers/misc/issei/issei_dev.h
index b47c4a7c2da4..244dc62ad85f 100644
--- a/drivers/misc/issei/issei_dev.h
+++ b/drivers/misc/issei/issei_dev.h
@@ -6,6 +6,7 @@
 #include <linux/device.h>
 #include <linux/mutex.h>
 #include <linux/sched.h>
+#include <linux/sizes.h>
 #include <linux/time64.h>
 #include <linux/types.h>
 #include <linux/wait.h>
@@ -31,6 +32,8 @@ extern struct class *issei_class;
 #define ISSEI_STOP_TIMEOUT_MSEC         500
 #define ISSEI_WRITE_TIMEOUT_MSEC        (MSEC_PER_SEC)
 
+#define ISSEI_HOST_DMA_MAX_SIZE	        SZ_64M
+
 /**
  * struct issei_write_buf - write buffer object
  * @list: linked list pointer

-- 
2.53.0

