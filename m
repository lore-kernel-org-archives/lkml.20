Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF139442118
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 09:31:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792315901; cv=none; b=XqJP66ObmEJEjKqXGTvMAkAWuVsAXdhrJF8KZZSb3R64wZfPyAzJcn/5DFMCZwHAj0qvLJpSLjnhiiuGoovwd/ZtOrxKMHZvPT8DvbVc+1XovSTRPgUl2iLNXhJ44KKsFSRJ6m0Itl5aD+PkFyBNAfMmFRolXw/qv40ioeJuMVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792315901; c=relaxed/simple;
	bh=AbtlFciISKm0YnV2NDL39jmGVILr9ExZBfRSvUKUpJQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rQi73U9R/DpEIkYDE3uMHYzgHOntpK5RNYyGzaNJsmLCKpWLhTrBIkCpVITAUiNztwssKbXKQNFasrNvXFlMYeMQa3o+nkoUHpt5WW3xGjoxDKzG4QtSRLI1SSNOzVW8l4EFWz2rIhkC8ed4n0MlZN2TzuapXjjt73X7L9/3ehk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=REi9P8+q; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="REi9P8+q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792315900; x=1823851900;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=AbtlFciISKm0YnV2NDL39jmGVILr9ExZBfRSvUKUpJQ=;
  b=REi9P8+qYt6RWu8+EqJY68eraYgT3S3AtiI9iy4SfVfunuUqOu/9q0MM
   umDE9+s/sJp5r/CyuWyzopumIoo71KPeEz9yUtPHihV0myenqjXZbpvY+
   KYuI6fsWN+IhULzpOOEhW/gIs0VQbMjogwuXF8E5s++IpwMTHTA9xWDxt
   m5HURhNCGiYZcad0FWb112BQIv1eLptoTsEasU0G+YX8WDP6QyY3VXa7Y
   zA69JyZzDz9d8QjxGT1PRTGfAHhxwOn/klUf/YQI/YzianeFVMpYOprBv
   fRTmyTF/LR/NnCqTVWOnBYjUBaLBo74Mfv1eOYgw9aY1nXYBx1X0e2P04
   w==;
X-CSE-ConnectionGUID: 1iYnyhyiTzyQAER6PiGxAA==
X-CSE-MsgGUID: IvnS5GrXT9m8e80wNjRdDQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11938"; a="932719"
X-IronPort-AV: E=Sophos;i="6.27,165,1787036400"; 
   d="scan'208";a="932719"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2026 02:31:39 -0700
X-CSE-ConnectionGUID: eBX6XVEhQPuuzppZLQmKhQ==
X-CSE-MsgGUID: vKiN9z7xS321F2znLZc40g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,165,1787036400"; 
   d="scan'208";a="4047710"
Received: from sannilnx-dsk.jer.intel.com (HELO [127.0.1.1]) ([10.12.231.107])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2026 02:31:37 -0700
From: Alexander Usyskin <alexander.usyskin@intel.com>
Date: Sun, 18 Oct 2026 12:30:55 +0300
Subject: [PATCH char-misc-next v2 4/4] issei: add driver to driver
 interface
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261018-issei_pm_and_itf-v2-4-7a07452e3606@intel.com>
References: <20261018-issei_pm_and_itf-v2-0-7a07452e3606@intel.com>
In-Reply-To: <20261018-issei_pm_and_itf-v2-0-7a07452e3606@intel.com>
To: Arnd Bergmann <arnd@arndb.de>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, Menachem Adin <menachem.adin@intel.com>, 
 Andrzej Kacprowski <andrzej.kacprowski@linux.intel.com>, 
 Karol Wachowski <karol.wachowski@linux.intel.com>, 
 Alexander Usyskin <alexander.usyskin@intel.com>, 
 Reuven Abliyev <reuvenab@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792315888; l=11858;
 i=alexander.usyskin@intel.com; s=20260315; h=from:subject:message-id;
 bh=AbtlFciISKm0YnV2NDL39jmGVILr9ExZBfRSvUKUpJQ=;
 b=XHcGQsp/OGOBlqYFgEaKcK1V9sQnPNJN/+jCufhmX5DZQMgRQ4lxssnslf9hZ2gFV0SlJ9o0o
 jtck2FYAmVzAdSg2V/StErZWLamwd6cTUvh4Rwuz0+qRlAZx2cILWoM
X-Developer-Key: i=alexander.usyskin@intel.com; a=ed25519;
 pk=X+qoF/nFCdDOV04IForWSxnkyoCAbUE10egZi6PSfcU=

Add new interface that enables communication with ISSEI device
from the kernel modules.
First intended consumer is an NPU driver.

Co-developed-by: Reuven Abliyev <reuvenab@gmail.com>
Signed-off-by: Reuven Abliyev <reuvenab@gmail.com>
Co-developed-by: Andrzej Kacprowski <andrzej.kacprowski@linux.intel.com>
Signed-off-by: Andrzej Kacprowski <andrzej.kacprowski@linux.intel.com>
Signed-off-by: Alexander Usyskin <alexander.usyskin@intel.com>
---
 MAINTAINERS                       |   1 +
 drivers/misc/issei/Makefile       |   1 +
 drivers/misc/issei/cdev.c         |  12 +-
 drivers/misc/issei/issei_device.c | 269 ++++++++++++++++++++++++++++++++++++++
 include/linux/issei_device.h      |  31 +++++
 5 files changed, 308 insertions(+), 6 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index c548092c6a78..e16f6a0bc186 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13506,6 +13506,7 @@ S:	Supported
 F:	Documentation/ABI/testing/sysfs-class-issei
 F:	Documentation/driver-api/issei/issei.rst
 F:	drivers/misc/issei/
+F:	include/linux/issei_device.h
 F:	include/uapi/linux/issei.h
 
 INTEL SGX
diff --git a/drivers/misc/issei/Makefile b/drivers/misc/issei/Makefile
index 8fac360c3342..b689784357f4 100644
--- a/drivers/misc/issei/Makefile
+++ b/drivers/misc/issei/Makefile
@@ -8,6 +8,7 @@ issei-objs += dma.o
 issei-objs += fw_client.o
 issei-objs += host_client.o
 issei-objs += ham.o
+issei-objs += issei_device.o
 issei-objs += main.o
 
 obj-$(CONFIG_INTEL_SSEI_HW_HECI) += issei-heci.o
diff --git a/drivers/misc/issei/cdev.c b/drivers/misc/issei/cdev.c
index b7d65e2d0813..f5a3ebbf8740 100644
--- a/drivers/misc/issei/cdev.c
+++ b/drivers/misc/issei/cdev.c
@@ -272,14 +272,14 @@ static const struct file_operations issei_fops = {
 	.poll = issei_poll,
 };
 
-static void issei_device_release(struct device *dev)
+static void issei_dev_release(struct device *dev)
 {
 	kfree(dev_get_drvdata(dev));
 }
 
-static void issei_device_init(struct issei_device *idev, struct device *parent,
-			      const struct issei_dma_length *dma_length,
-			      const struct issei_hw_ops *ops)
+static void issei_dev_init(struct issei_device *idev, struct device *parent,
+			   const struct issei_dma_length *dma_length,
+			   const struct issei_hw_ops *ops)
 {
 	idev->parent = parent;
 	idev->power_down = false;
@@ -322,7 +322,7 @@ struct issei_device *issei_register(size_t hw_size, struct device *parent,
 	if (!idev)
 		return ERR_PTR(-ENOMEM);
 
-	issei_device_init(idev, parent, dma_length, ops);
+	issei_dev_init(idev, parent, dma_length, ops);
 
 	ret = xa_alloc(&issei_minor_xa, &minor, idev, XA_LIMIT(0, ISSEI_MAX_DEVS), GFP_KERNEL);
 	if (ret < 0) {
@@ -339,7 +339,7 @@ struct issei_device *issei_register(size_t hw_size, struct device *parent,
 	idev->dev.class = issei_class;
 	idev->dev.parent = parent;
 	idev->dev.groups = issei_groups;
-	idev->dev.release = issei_device_release;
+	idev->dev.release = issei_dev_release;
 	dev_set_drvdata(&idev->dev, idev);
 
 	idev->cdev = cdev_alloc();
diff --git a/drivers/misc/issei/issei_device.c b/drivers/misc/issei/issei_device.c
new file mode 100644
index 000000000000..a399ffc39455
--- /dev/null
+++ b/drivers/misc/issei/issei_device.c
@@ -0,0 +1,269 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright (C) 2025-2026 Intel Corporation */
+#include <linux/cleanup.h>
+#include <linux/device.h>
+#include <linux/jiffies.h>
+#include <linux/err.h>
+#include <linux/export.h>
+#include <linux/sched/signal.h>
+#include <linux/slab.h>
+#include <linux/string.h>
+#include <linux/types.h>
+#include <linux/uuid.h>
+#include <linux/wait.h>
+
+#include <linux/issei.h>
+#include <linux/issei_device.h>
+
+#include "issei_dev.h"
+#include "host_client.h"
+
+#define ISSEI_DEVICE_CNT_TO_MS 200
+
+/**
+ * issei_device_open - open issei device context.
+ * @match: pointer to callback that should return non-zero when matching device is found
+ * @data: user data to pass to match callback
+ *
+ * Return: pointer to opaque context on success, ERR_PTR on error
+ */
+void *issei_device_open(int (*match)(struct device *, const void *), const void *data)
+{
+	struct issei_host_client *cl;
+	struct issei_device *idev;
+	struct device *dev;
+
+	dev = class_find_device(issei_class, NULL, data, match);
+	if (!dev)
+		return ERR_PTR(-ENODEV);
+
+	idev = dev_get_drvdata(dev);
+
+	cl = issei_cl_create(idev, NULL);
+	if (IS_ERR(cl))
+		put_device(dev);
+
+	return cl;
+}
+EXPORT_SYMBOL_GPL(issei_device_open);
+
+/**
+ * issei_device_release - release issei device context.
+ * @ctx: opaque context
+ */
+void issei_device_release(void *ctx)
+{
+	struct issei_host_client *cl = ctx;
+	struct issei_device *idev = cl->idev;
+
+	issei_cl_remove(cl);
+	put_device(&idev->dev);
+}
+EXPORT_SYMBOL_GPL(issei_device_release);
+
+/**
+ * issei_device_connect - connect to the firmware client.
+ * @ctx: opaque context
+ * @client_uuid: UUID of firmware client to connect
+ * @conn: pointer for client data to fill on successful connection
+ *
+ * Return: 0 on success, <0 on error
+ */
+int issei_device_connect(void *ctx, const uuid_t *client_uuid, struct issei_client *conn)
+{
+	struct issei_host_client *cl = ctx;
+	struct issei_device *idev = cl->idev;
+	long ret;
+
+	if (idev->rst_state != ISSEI_RST_STATE_DONE) {
+		ret = wait_event_interruptible_timeout(idev->wait_rst_state,
+						       idev->rst_state == ISSEI_RST_STATE_DONE,
+						       msecs_to_jiffies(ISSEI_DEVICE_CNT_TO_MS));
+		if (ret == 0) /* timeout */
+			ret = -ETIMEDOUT;
+		if (ret < 0) {
+			dev_dbg(&idev->dev, "Device is in transition ret = %ld\n", ret);
+			return ret;
+		}
+	}
+	return issei_cl_connect(cl, client_uuid, &conn->max_msg_length,
+				&conn->protocol_version, &conn->flags);
+}
+EXPORT_SYMBOL_GPL(issei_device_connect);
+
+/**
+ * issei_device_disconnect - disconnect from the firmware client.
+ * @ctx: opaque context
+ *
+ * Return: 0 on success, <0 on error
+ */
+int issei_device_disconnect(void *ctx)
+{
+	struct issei_host_client *cl = ctx;
+	struct issei_device *idev = cl->idev;
+
+	if (idev->rst_state != ISSEI_RST_STATE_DONE) {
+		dev_dbg(&idev->dev, "Device is in transition\n");
+		return -ENODEV;
+	}
+
+	return issei_cl_disconnect(cl);
+}
+EXPORT_SYMBOL_GPL(issei_device_disconnect);
+
+/**
+ * issei_device_write - send data to the firmware client.
+ * @ctx: opaque context
+ * @ubuf: data to send
+ * @length: data length
+ * @timeout: operation timeout in milliseconds
+ *
+ * Return: >=0 data length on success, <0 on error
+ */
+ssize_t issei_device_write(void *ctx, const u8 *ubuf, size_t length, unsigned long timeout)
+{
+	struct issei_host_client *cl = ctx;
+	struct issei_device *idev = cl->idev;
+	ssize_t ret;
+	long wret;
+
+	if (idev->rst_state != ISSEI_RST_STATE_DONE) {
+		dev_dbg(&idev->dev, "Device is in transition\n");
+		return -EBUSY;
+	}
+
+	if (!length)
+		return 0;
+
+	/* sanity check */
+	if (length > idev->dma.length.h2f) {
+		dev_dbg(&idev->dev, "Write is too big %zu > %zu\n", length,
+			idev->dma.length.h2f);
+		return -EFBIG;
+	}
+
+	u8 *buf __free(kfree) = kmemdup(ubuf, length, GFP_KERNEL);
+	if (!buf)
+		return -ENOMEM;
+
+	do {
+		ret = issei_cl_write(cl, buf, length);
+		if (ret < 0 && ret != -EAGAIN)
+			return ret;
+		/* buf is consumed by issei_cl_write on success */
+		if (ret >= 0)
+			retain_and_null_ptr(buf);
+		wret = wait_event_interruptible_timeout(cl->write_wait,
+							issei_cl_check_write(cl) != 1,
+							msecs_to_jiffies(timeout));
+		if (wret == 0) /* timeout */
+			wret = -ETIMEDOUT;
+		if (wret < 0) {
+			issei_cl_clean_all_wbuf(cl);
+			dev_dbg(&idev->dev, "Failed writing data ret = %ld\n", ret);
+			return wret;
+		}
+	} while (ret == -EAGAIN);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(issei_device_write);
+
+/**
+ * issei_device_read - receive data from the firmware client.
+ * @ctx: opaque context
+ * @ubuf: buffer for data
+ * @length: buffer length
+ * @timeout: operation timeout in milliseconds
+ *
+ * Return: >=0 data length on success, <0 on error
+ */
+ssize_t issei_device_read(void *ctx, u8 *ubuf, size_t length, unsigned long timeout)
+{
+	struct issei_host_client *cl = ctx;
+	struct issei_device *idev = cl->idev;
+	u8 *data = NULL;
+	ssize_t ret;
+
+	if (idev->rst_state != ISSEI_RST_STATE_DONE) {
+		dev_dbg(&idev->dev, "Device is in transition\n");
+		return -EBUSY;
+	}
+
+	if (!length)
+		return 0;
+
+	/* sanity check */
+	if (length > idev->dma.length.f2h) {
+		dev_dbg(&idev->dev, "Read is too big %zu > %zu\n", length,
+			idev->dma.length.f2h);
+		return -EFBIG;
+	}
+
+	ret = issei_cl_read(cl, &data, length);
+	if (ret < 0) {
+		if (ret != -ENOENT)
+			return ret;
+
+		ret = wait_event_interruptible_timeout(cl->read_wait,
+						       issei_cl_check_read(cl) != 0,
+						       timeout);
+		if (ret == 0) /* timeout */
+			ret = -ETIMEDOUT;
+		if (ret < 0) {
+			dev_dbg(&idev->dev, "Failed reading data ret = %zd\n", ret);
+			return ret;
+		}
+		ret = issei_cl_read(cl, &data, length);
+		if (ret < 0)
+			return ret;
+	}
+
+	memcpy(ubuf, data, ret);
+	kfree(data);
+	return ret;
+}
+EXPORT_SYMBOL_GPL(issei_device_read);
+
+/**
+ * issei_device_dma_map - allocate DMA buffer on parent device.
+ * @ctx: opaque context
+ * @size: buffer size
+ * @daddr: pointer for buffer DMA address
+ * @vaddr: pointer for buffer virtual address
+ *
+ * Return: 0 on success, <0 on error
+ */
+int issei_device_dma_map(void *ctx, size_t size, dma_addr_t *daddr, void **vaddr)
+{
+	struct issei_host_client *cl = ctx;
+
+	return issei_cl_dma_map(cl, size, daddr, vaddr);
+}
+EXPORT_SYMBOL_GPL(issei_device_dma_map);
+
+/**
+ * issei_device_dma_unmap - deallocate DMA buffer.
+ * @ctx: opaque context
+ */
+void issei_device_dma_unmap(void *ctx)
+{
+	struct issei_host_client *cl = ctx;
+
+	issei_cl_dma_unmap(cl);
+}
+EXPORT_SYMBOL_GPL(issei_device_dma_unmap);
+
+/**
+ * issei_device_register_interface - register class interface for issei class.
+ * @intf: interface structure
+ *
+ * Return: 0 on success, <0 on error
+ */
+int issei_device_register_interface(struct class_interface *intf)
+{
+	intf->class = issei_class;
+
+	return class_interface_register(intf);
+}
+EXPORT_SYMBOL_GPL(issei_device_register_interface);
diff --git a/include/linux/issei_device.h b/include/linux/issei_device.h
new file mode 100644
index 000000000000..2775aa1c1ed8
--- /dev/null
+++ b/include/linux/issei_device.h
@@ -0,0 +1,31 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/* Copyright (C) 2025-2026 Intel Corporation */
+#ifndef _ISSEI_DEVICE_H_
+#define _ISSEI_DEVICE_H_
+
+#include <linux/issei.h>
+#include <linux/types.h>
+#include <linux/uuid.h>
+
+/* add MODULE_IMPORT_NS("INTEL_SSEI") to use these APIs */
+
+struct class_interface;
+struct device;
+
+void *issei_device_open(int (*match)(struct device *, const void *), const void *data);
+void issei_device_release(void *ctx);
+
+int issei_device_connect(void *ctx, const uuid_t *client_uuid, struct issei_client *conn);
+int issei_device_disconnect(void *ctx);
+
+ssize_t issei_device_write(void *ctx, const u8 *ubuf, size_t length, unsigned long timeout);
+ssize_t issei_device_read(void *ctx, u8 *ubuf, size_t length, unsigned long timeout);
+
+int issei_device_dma_map(void *ctx, size_t size, dma_addr_t *daddr, void **vaddr);
+void issei_device_dma_unmap(void *ctx);
+
+int issei_device_register_interface(struct class_interface *intf);
+#define issei_device_unregister_interface(intf) \
+	class_interface_unregister(intf)
+
+#endif /* _ISSEI_DEVICE_H_ */

-- 
2.53.0

