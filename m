Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.10
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794382861;
	b=KpdU788kWgygDQQZS1U+tok15c3P5eEa0q36lhHxHii9mmFVvn/5Im8ntVkLd6zdfEET
	 88Bg2aEXxQ3HgrWuQwt/5IwMjnhBMswx3JExk9+vxv8drWpiCb3wlkbBB1Mx3I/J/pdnX
	 wr7+WfSRKIEWnH5A/QciwmbQQ1FE5AKQrQVJoIqubqnHDilNM1GaFu1Va27gTG24OwPrk
	 YXYCQwer1fSwSqGPCChnROydwe1Omczz5nMYbFx3OAupShKiCV7HWZ3uy67CRo8G1pUmB
	 ZwCbNdHdPY54XWe6zyFVzlzcYRmIncIVNiDzTXvtQ3kjgxVzXnwhsvhjrHIEhhd5wXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794382861;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=T/uRI2nDy43OHsCx/SIbyjzVyJ377CVZIxTebYV+bro=;
	b=bgpWMx5QaHPGmmL+eFaAIbJHP4xAVnbz7jKDzkLuXCnSUUw0d6egm0D14wMZX9IzO6Cs
	 Q6AozNnM7Zho5bwcVKkpE2NdN7jr/u+4WPwXhcpR4llzaDrIUSxjtUZnFcKxcoo6n2NVe
	 FBYB0fIB5Gggjj6I2HMRjr8zBi8A++8kb49lQAwsbReTksOQhuUH8soApMomsqLBobDyH
	 lx7QgUmOg3abi/Way4SpJEWhBjWphsejmIchIpEj4KCjIqK84Bq268RIacigW8ZQ4m+Dz
	 3JIyyp1cJy9qSe4ygX2id4l2VFzXhT8WAc5Ih9imF4FfqWWIcbVISGTUwo3SrRiEiUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ea4on36M;
	arc=none smtp.remote-ip=192.198.163.10
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4BD2606A332
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 07:41:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A4BD2606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ea4on36M
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794382861; x=1825918861;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=lE3Nkqw/kDIE0H/jFnmt2+oaxzWg6QHwwHm+dtm07po=;
  b=ea4on36MVodBqhuPZ5jWHHl0ek79vT2sMBYwDBY3K5LQ4rajE0bGYWMO
   GYaLKxDwFHZHJvONFbXlmo8ku2DO3dQVPnT+T6kJ/D//fdu1u+ejNbuuB
   PnFR7n1pORo1sjk6zSQOuW5ePfet81ucwI0aCMEWJ5bN5/qdIpFhIVIW7
   jWINiOQWkNuD/nWev75LyarevuYxnqSdc3bm4D+ad/3nhbixOeC6Sr0iA
   Axm6p8k4LM8fpdpT67wa0HWSl1Tl/YGSG/H0lejtEiaTJ8ryRNXEYyyna
   s188PP6weFg2IPNPzb6lU7RbWihoFlh8tEBXDstuBX0fLaKnIA/9XBlMV
   A==;
X-CSE-ConnectionGUID: Y+bAhzkBQXuW+y26Rg1A8w==
X-CSE-MsgGUID: iJKrNDxpReC5zAPlCFQEGA==
X-IronPort-AV: E=McAfee;i="6800,10657,11962"; a="3050839"
X-IronPort-AV: E=Sophos;i="6.27,207,1787036400"; 
   d="scan'208";a="3050839"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2026 23:41:01 -0800
X-CSE-ConnectionGUID: pZn/ZfnkTueJ2hDAHhyA5A==
X-CSE-MsgGUID: 6uf2Zs4+QKmeBQ56zDqt3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,207,1787036400"; 
   d="scan'208";a="8923857"
Received: from sannilnx-dsk.jer.intel.com (HELO [127.0.1.1]) ([10.12.231.107])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2026 23:40:59 -0800
From: Alexander Usyskin <alexander.usyskin@intel.com>
Date: Wed, 11 Nov 2026 09:40:32 +0200
Subject: [PATCH char-misc-next v3 3/4] issei: host_client: add dma
 allocation support
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
Message-Id: <20261111-issei_pm_and_itf-v3-3-4f4f6d626ff3@intel.com>
References: <20261111-issei_pm_and_itf-v3-0-4f4f6d626ff3@intel.com>
In-Reply-To: <20261111-issei_pm_and_itf-v3-0-4f4f6d626ff3@intel.com>
To: Arnd Bergmann <arnd@arndb.de>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, Menachem Adin <menachem.adin@intel.com>, 
 Andrzej Kacprowski <andrzej.kacprowski@linux.intel.com>, 
 Karol Wachowski <karol.wachowski@linux.intel.com>, 
 Alexander Usyskin <alexander.usyskin@intel.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794382852; l=4933;
 i=alexander.usyskin@intel.com; s=20260315; h=from:subject:message-id;
 bh=lE3Nkqw/kDIE0H/jFnmt2+oaxzWg6QHwwHm+dtm07po=;
 b=LEOMk+G2vCLdE4C4AXRFIeqzypE7svsSVbEZFV4NTpAk5IFUPzRlsKo5Km2ikjLWmrQnDi6Rk
 WFHCG/lFnSbDO1Af73DKO+UGwoGJ9WTwOxc8ZPAGiDpiBf5Wzw9nELA
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

