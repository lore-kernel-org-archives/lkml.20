Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00DF550AC2B;
	Wed, 16 Sep 2026 14:25:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789568735; cv=none; b=cgZEJekmTSI3o2pmR+UuF0kqZRgwExpm1pduA8K9anCoMkREEgyzCCiJGAz73es6T7/8AghJpvlkg1u+EzCCdi2HuqKhKmn4kx111a/cgD5+pMIETSi1FuaKMTSwB61jGV7q3kIlnKXPhGD2jZMw2bNQsmdtT+VViRsxKMQesuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789568735; c=relaxed/simple;
	bh=tu5A/hm9vojiLP4EZ/79AFjJPwERokzgJSRaROMmGHc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=en5lu1Wzetix/0IiIwqVHl0iSBNyY7LrkCVy6hN2lZ44lH17EyBq3WXEpaqg/BrTWl4MOWJf2xFy6g8olqatzYuj/9PqPUfA6wFKq8iP2MMYaRNvLkK8Vl+WbMp2i6NCKpVOcXIDckN1RbOEul2l/CGn3e5UNqR2wK52b1f1/5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=Nm6kalrv; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="Nm6kalrv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1789568732;
	bh=tu5A/hm9vojiLP4EZ/79AFjJPwERokzgJSRaROMmGHc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Nm6kalrvfFhnWtZgUzPKeIWauwig2BytF98OmZgjtOxIe9l0zUoWMavAOu6J1TjU5
	 dic7glIlnYrkOBXIftfhkUaxt4fkmSrxF065LPcIIJkfBr5/vMASM9e9hQ2SJQZyOp
	 tF34HDTB5Sh49h3b/MroYMlQcvv8hjaJ0Wn3QA9S76E6ddK3+/yYRzKZwppBtjVVIn
	 9UnHvt+nklv6qt7XPYSMO3T7oMibnsQeN6uP6QsSG0/UHphY5pgEVeinwohWpRR6t3
	 66uSpzXgyJHvzySkCOB+91J6yXYP7E7x/DBcJZ+sXDXd9FPezu0YyAxSk2FvJSq371
	 /jMTRsvY1gWOw==
Received: from [192.168.0.15] (unknown [100.64.0.170])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: detlev)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 7816917E01D1;
	Wed, 16 Sep 2026 16:25:30 +0200 (CEST)
From: Detlev Casanova <detlev.casanova@collabora.com>
Date: Wed, 16 Sep 2026 10:25:26 -0400
Subject: [PATCH 1/4] media: Add a v4l2 memory allocations tracker
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260916-v4l2-add-mem-tracker-v1-1-900fa45e3e6a@collabora.com>
References: <20260916-v4l2-add-mem-tracker-v1-0-900fa45e3e6a@collabora.com>
In-Reply-To: <20260916-v4l2-add-mem-tracker-v1-0-900fa45e3e6a@collabora.com>
To: Tomasz Figa <tfiga@chromium.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Heiko Stuebner <heiko@sntech.de>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Cc: kernel@collabora.com, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, 
 Detlev Casanova <detlev.casanova@collabora.com>
X-Mailer: b4 0.15.2

This is a wrapper around dma allocation functions to keep track of
allocated buffers and expose the list through a per v4l2 device debugfs.

This currently doesn't support all kind of memory allocation, only
dma_alloc_attrs.

The wrapper can therefore be used by drivers, but also by the vb2
allocation functions, so that all buffers are accounted for.

Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
---
 drivers/media/common/videobuf2/Makefile            |   1 +
 drivers/media/common/videobuf2/v4l2-allocator.c    | 180 +++++++++++++++++++++
 .../media/common/videobuf2/videobuf2-dma-contig.c  |  24 ++-
 drivers/media/v4l2-core/v4l2-device.c              |   4 +-
 include/media/v4l2-allocator.h                     |  26 +++
 include/media/v4l2-device.h                        |   2 +
 include/media/videobuf2-core.h                     |   2 +
 7 files changed, 231 insertions(+), 8 deletions(-)

diff --git a/drivers/media/common/videobuf2/Makefile b/drivers/media/common/videobuf2/Makefile
index a6fe3f304685..aa2754731535 100644
--- a/drivers/media/common/videobuf2/Makefile
+++ b/drivers/media/common/videobuf2/Makefile
@@ -1,6 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
 videobuf2-common-objs := videobuf2-core.o
 videobuf2-common-objs += frame_vector.o
+videobuf2-common-objs += v4l2-allocator.o
 
 ifeq ($(CONFIG_TRACEPOINTS),y)
   videobuf2-common-objs += vb2-trace.o
diff --git a/drivers/media/common/videobuf2/v4l2-allocator.c b/drivers/media/common/videobuf2/v4l2-allocator.c
new file mode 100644
index 000000000000..9dde9d4a342b
--- /dev/null
+++ b/drivers/media/common/videobuf2/v4l2-allocator.c
@@ -0,0 +1,180 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <media/v4l2-allocator.h>
+#include <media/v4l2-device.h>
+
+#include <linux/types.h>
+#include <linux/debugfs.h>
+#include <linux/list.h>
+#include <linux/mutex.h>
+#include <linux/seq_file.h>
+
+#define ENTRY_NAME_LEN	64
+
+static struct dentry *v4l2_debugfs_dir;
+
+struct v4l2_allocator {
+	struct list_head list;
+	struct mutex lock;
+	struct dentry *debugfs_dir;
+	struct dentry *debugfs_entry;
+};
+
+struct v4l2_allocator_entry {
+	struct list_head list;
+	size_t size;
+	dma_addr_t dma_addr;
+	char name[ENTRY_NAME_LEN];
+	char creator[TASK_COMM_LEN];
+	pid_t tgid;
+	u16 fd;
+};
+
+static int v4l2_allocator_debugfs_show(struct seq_file *m, void *data)
+{
+	struct v4l2_device *v4l2_dev = m->private;
+	struct v4l2_allocator *allocator = v4l2_dev->v4l2_allocator;
+	struct v4l2_allocator_entry *entry;
+	size_t total_size = 0;
+
+	if (!allocator)
+		return 0;
+
+	seq_puts(m, "created-by                      fd              pid             size            label\n");
+	seq_puts(m, "-------------------------------------------------------------------------------------\n");
+	mutex_lock(&allocator->lock);
+	list_for_each_entry(entry, &allocator->list, list) {
+		seq_printf(m, "%-32s%-16u%-16u%-16zu%s\n",
+			   entry->creator,
+			   entry->fd,
+			   entry->tgid,
+			   entry->size,
+			   entry->name);
+		total_size += entry->size;
+	}
+	mutex_unlock(&allocator->lock);
+
+	seq_puts(m, "=====================================================================================\n");
+	seq_printf(m, "Total size: %zu\n", total_size);
+
+	return 0;
+}
+DEFINE_SHOW_ATTRIBUTE(v4l2_allocator_debugfs);
+
+int v4l2_allocator_init(struct v4l2_device *v4l2_dev)
+{
+	struct v4l2_allocator *allocator;
+
+	allocator = kzalloc_obj(*allocator);
+	if (!allocator)
+		return -ENOMEM;
+
+	INIT_LIST_HEAD(&allocator->list);
+	mutex_init(&allocator->lock);
+	v4l2_dev->v4l2_allocator = allocator;
+
+	if (!v4l2_debugfs_dir)
+		v4l2_debugfs_dir = debugfs_create_dir("v4l2", NULL);
+
+	allocator->debugfs_dir = debugfs_create_dir(dev_name(v4l2_dev->dev),
+						    v4l2_debugfs_dir);
+	allocator->debugfs_entry = debugfs_create_file("mem", 0444,
+						       allocator->debugfs_dir,
+						       v4l2_dev,
+						       &v4l2_allocator_debugfs_fops);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(v4l2_allocator_init);
+
+void v4l2_allocator_cleanup(struct v4l2_device *v4l2_dev)
+{
+	struct v4l2_allocator *allocator = v4l2_dev->v4l2_allocator;
+	struct v4l2_allocator_entry *entry, *tmp;
+
+	if (allocator) {
+		debugfs_remove(allocator->debugfs_entry);
+		debugfs_remove(allocator->debugfs_dir);
+		mutex_lock(&allocator->lock);
+		list_for_each_entry_safe(entry, tmp, &allocator->list, list) {
+			list_del(&entry->list);
+			kfree(entry);
+		}
+		mutex_unlock(&allocator->lock);
+		mutex_destroy(&allocator->lock);
+		kfree(allocator);
+		v4l2_dev->v4l2_allocator = NULL;
+	}
+}
+EXPORT_SYMBOL_GPL(v4l2_allocator_cleanup);
+
+static int v4l2_allocator_add(struct v4l2_device *v4l2_dev, size_t size,
+			      dma_addr_t dma_addr, const char *name)
+{
+	struct v4l2_allocator *allocator = v4l2_dev->v4l2_allocator;
+	struct v4l2_allocator_entry *entry;
+
+	if (!allocator)
+		return -EINVAL;
+
+	entry = kzalloc_obj(*entry);
+	if (!entry)
+		return -ENOMEM;
+
+	entry->size = size;
+	entry->dma_addr = dma_addr;
+	strscpy(entry->name, name, sizeof(entry->name));
+	get_task_comm(entry->creator, current->group_leader);
+	entry->tgid = current->tgid;
+
+	mutex_lock(&allocator->lock);
+	list_add(&entry->list, &allocator->list);
+	mutex_unlock(&allocator->lock);
+
+	return 0;
+}
+
+static void v4l2_allocator_remove(struct v4l2_device *v4l2_dev, size_t size, dma_addr_t dma_addr)
+{
+	struct v4l2_allocator *allocator = v4l2_dev->v4l2_allocator;
+	struct v4l2_allocator_entry *entry, *tmp;
+
+	if (!allocator)
+		return;
+
+	mutex_lock(&allocator->lock);
+	list_for_each_entry_safe(entry, tmp, &allocator->list, list) {
+		if (entry->size == size && entry->dma_addr == dma_addr) {
+			list_del(&entry->list);
+			mutex_unlock(&allocator->lock);
+			kfree(entry);
+			return;
+		}
+	}
+	mutex_unlock(&allocator->lock);
+}
+
+void *v4l2_dma_alloc_attrs(struct v4l2_device *v4l2_dev, struct device *dev,
+			   size_t size, dma_addr_t *dma_handle,
+			   gfp_t flag, unsigned long attrs, const char *name)
+{
+	void *ret = dma_alloc_attrs(dev, size, dma_handle, flag, attrs);
+
+	if (ret && v4l2_dev)
+		v4l2_allocator_add(v4l2_dev, size, *dma_handle, name);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(v4l2_dma_alloc_attrs);
+
+void v4l2_dma_free_attrs(struct v4l2_device *v4l2_dev, struct device *dev,
+			 size_t size, void *cpu_addr,
+			 dma_addr_t dma_handle, unsigned long attrs)
+{
+	if (v4l2_dev)
+		v4l2_allocator_remove(v4l2_dev, size, dma_handle);
+
+	dma_free_attrs(dev, size, cpu_addr, dma_handle, attrs);
+}
+EXPORT_SYMBOL_GPL(v4l2_dma_free_attrs);
+
diff --git a/drivers/media/common/videobuf2/videobuf2-dma-contig.c b/drivers/media/common/videobuf2/videobuf2-dma-contig.c
index 9ce6284cd5f2..b6b7ddc96b9c 100644
--- a/drivers/media/common/videobuf2/videobuf2-dma-contig.c
+++ b/drivers/media/common/videobuf2/videobuf2-dma-contig.c
@@ -22,6 +22,7 @@
 #include <media/videobuf2-v4l2.h>
 #include <media/videobuf2-dma-contig.h>
 #include <media/videobuf2-memops.h>
+#include <media/v4l2-allocator.h>
 
 struct vb2_dc_buf {
 	struct device			*dev;
@@ -43,6 +44,7 @@ struct vb2_dc_buf {
 	struct dma_buf_attachment	*db_attach;
 
 	struct vb2_buffer		*vb;
+	struct v4l2_device		*v4l2_dev;
 	bool				non_coherent_mem;
 };
 
@@ -181,8 +183,10 @@ static void vb2_dc_put(void *buf_priv)
 			sg_free_table(buf->sgt_base);
 			kfree(buf->sgt_base);
 		}
-		dma_free_attrs(buf->dev, buf->size, buf->cookie,
-			       buf->dma_addr, buf->attrs);
+
+		v4l2_dma_free_attrs(buf->v4l2_dev, buf->dev, buf->size, buf->cookie,
+				    buf->dma_addr, buf->attrs);
+
 	}
 	put_device(buf->dev);
 	kfree(buf);
@@ -191,12 +195,17 @@ static void vb2_dc_put(void *buf_priv)
 static int vb2_dc_alloc_coherent(struct vb2_dc_buf *buf)
 {
 	struct vb2_queue *q = buf->vb->vb2_queue;
+	char name[64] = {0};
+
+	sprintf(name, "%s-%d", q->name, buf->vb->index);
 
-	buf->cookie = dma_alloc_attrs(buf->dev,
-				      buf->size,
-				      &buf->dma_addr,
-				      GFP_KERNEL | q->gfp_flags,
-				      buf->attrs);
+	buf->cookie = v4l2_dma_alloc_attrs(buf->v4l2_dev,
+					   buf->dev,
+					   buf->size,
+					   &buf->dma_addr,
+					   GFP_KERNEL | q->gfp_flags,
+					   buf->attrs,
+					   name);
 	if (!buf->cookie)
 		return -ENOMEM;
 
@@ -246,6 +255,7 @@ static void *vb2_dc_alloc(struct vb2_buffer *vb,
 	buf->dma_dir = vb->vb2_queue->dma_dir;
 	buf->vb = vb;
 	buf->non_coherent_mem = vb->vb2_queue->non_coherent_mem;
+	buf->v4l2_dev = vb->vb2_queue->v4l2_dev;
 
 	buf->size = size;
 	/* Prevent the device from being released while the buffer is used */
diff --git a/drivers/media/v4l2-core/v4l2-device.c b/drivers/media/v4l2-core/v4l2-device.c
index 67e3073de132..3cce2b4bc4c7 100644
--- a/drivers/media/v4l2-core/v4l2-device.c
+++ b/drivers/media/v4l2-core/v4l2-device.c
@@ -13,6 +13,7 @@
 #include <linux/videodev2.h>
 #include <media/v4l2-device.h>
 #include <media/v4l2-ctrls.h>
+#include <media/v4l2-allocator.h>
 
 int v4l2_device_register(struct device *dev, struct v4l2_device *v4l2_dev)
 {
@@ -38,7 +39,7 @@ int v4l2_device_register(struct device *dev, struct v4l2_device *v4l2_dev)
 			dev->driver->name, dev_name(dev));
 	if (!dev_get_drvdata(dev))
 		dev_set_drvdata(dev, v4l2_dev);
-	return 0;
+	return v4l2_allocator_init(v4l2_dev);
 }
 EXPORT_SYMBOL_GPL(v4l2_device_register);
 
@@ -93,6 +94,7 @@ void v4l2_device_unregister(struct v4l2_device *v4l2_dev)
 	 * unregistered before. */
 	if (v4l2_dev == NULL || !v4l2_dev->name[0])
 		return;
+	v4l2_allocator_cleanup(v4l2_dev);
 	v4l2_device_disconnect(v4l2_dev);
 
 	/* Unregister subdevs */
diff --git a/include/media/v4l2-allocator.h b/include/media/v4l2-allocator.h
new file mode 100644
index 000000000000..f3fe0da10321
--- /dev/null
+++ b/include/media/v4l2-allocator.h
@@ -0,0 +1,26 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * V4L2 Memory Allocator - Track memory allocations and deallocations in the v4l2 device.
+ *
+ * It provides functions to allocate and free memory while keeping
+ * track of the allocations for debugging and analysis purposes.
+ *
+ * Copyright 2026 Collabora, Ltd.
+ *   Detlev Casanova <detlev.casanova@collabora.com>
+ */
+
+#include <linux/device.h>
+#include <linux/dma-mapping.h>
+
+#include <media/v4l2-device.h>
+
+int v4l2_allocator_init(struct v4l2_device *v4l2_dev);
+void v4l2_allocator_cleanup(struct v4l2_device *v4l2_dev);
+
+void *v4l2_dma_alloc_attrs(struct v4l2_device *v4l2_dev, struct device *dev,
+			   size_t size, dma_addr_t *dma_handle,
+			   gfp_t flag, unsigned long attrs, const char *name);
+
+void v4l2_dma_free_attrs(struct v4l2_device *v4l2_dev, struct device *dev,
+			 size_t size, void *cpu_addr,
+			 dma_addr_t dma_handle, unsigned long attrs);
diff --git a/include/media/v4l2-device.h b/include/media/v4l2-device.h
index 25f69b1b8db0..c2b882d32012 100644
--- a/include/media/v4l2-device.h
+++ b/include/media/v4l2-device.h
@@ -14,6 +14,7 @@
 #include <media/v4l2-dev.h>
 
 struct v4l2_ctrl_handler;
+struct v4l2_allocator;
 
 /**
  * struct v4l2_device - main struct to for V4L2 device drivers
@@ -46,6 +47,7 @@ struct v4l2_device {
 	struct device *dev;
 	struct media_device *mdev;
 	struct list_head subdevs;
+	struct v4l2_allocator *v4l2_allocator;
 	spinlock_t lock;
 	char name[36];
 	void (*notify)(struct v4l2_subdev *sd,
diff --git a/include/media/videobuf2-core.h b/include/media/videobuf2-core.h
index 4424d481d7f7..83a5aea34f3c 100644
--- a/include/media/videobuf2-core.h
+++ b/include/media/videobuf2-core.h
@@ -19,6 +19,7 @@
 #include <linux/bitops.h>
 #include <media/media-request.h>
 #include <media/frame_vector.h>
+#include <media/v4l2-device.h>
 
 #define VB2_MAX_FRAME	(32)
 #define VB2_MAX_PLANES	(8)
@@ -602,6 +603,7 @@ struct vb2_queue {
 	unsigned int			type;
 	unsigned int			io_modes;
 	struct device			*dev;
+	struct v4l2_device		*v4l2_dev;
 	unsigned long			dma_attrs;
 	unsigned int			bidirectional:1;
 	unsigned int			fileio_read_once:1;

-- 
2.55.0

