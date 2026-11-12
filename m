Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.167.242.64
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794482329;
	b=Sd9QqanyCRd37BMFgZjHpR+mnr2wCZfrDmDRcW+54x2CAu2wfBatLqUk6Gvdtba5ofvr
	 agSVkWC288tRh/q/HGgM7PcpgB30frfiuMHKe5b2a5jL5Ur3wlVGqY67GWsNe+KhrLg8L
	 cpBDEHa4GAialapORIpQiM4XzqDoOLfqFL80wPE/UHzQrR04SnJ8PFdUi3XjA8GY+9mmp
	 RPZ2KGdZY5Wl1ib0U/SSUDQIwLnThUQfKm5h0brdX6UFj77MwUHFJv3dT1YnyfnS3uYEn
	 3M/Q+1+oUhYnoa5IZl4mrtCKAL5Kfhs+iO5/td63tPdkrIzxJCk8+XbCNzzI3+HdnWw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794482329;
	h=DMARC-Filter:Received:DKIM-Signature:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=gzWWMWDJVy4+Xbgn+Ihfst+Ol+iB1NbI/jU2laJOVSg=;
	b=QBljj/5NoGDZ9M2TRD5Fw7jM6JlLV7sVm914Xt/W6aGcE6FWY6K5G/YxVdl9Y3Sn6uht
	 22ybG0/5XbBXGThsphoZj6uUNRDDuM7eB6m8GHxCzOVPARx4zCmLAzl24jEgCHFtx8Hql
	 2l3vZk1waa9i5Z49mqgXfEgt8YnwinDzQY/jSsXR+mBPzj5b/OX4CIunI86ZUNyBkKeY+
	 NKoFchCpkeYprRoLEpfcGzGKG+gDEKYifbnW6t1QJEYkZIPcYPrLdEbV/IWtZfcrSa+NH
	 nGJKwIqJkeA7yrF87McNvlymtAt7kOES/ijVPMp4s51v2laZoFvZRAxJne0WnCu+R8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ideasonboard.com;
	spf=pass smtp.mailfrom=ideasonboard.com;
	dkim=pass header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=dTXeAM8T;
	arc=none smtp.remote-ip=213.167.242.64
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67AB7606A884;
	Thu, 12 Nov 2026 11:18:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 67AB7606A884
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=dTXeAM8T
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c67:cdf:7464:6c04:36e4:ee87])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6BC7233D;
	Thu, 12 Nov 2026 12:16:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1794482182;
	bh=pK63PRVYGy3W4Y3cnazSum+H3jLOga2cN5cps1LuFW8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=dTXeAM8TO2KLyTby22/4LTT/wNw6EFjLoIbxucVSWnQAdRYhqM3cPeeZVeBlyHYpZ
	 TnjM6RlMJe1xafoFdjrIPzj0v1Zp4c5dtG8MF74jqUYle8i2SnttonL/M1jNNjTdU0
	 T52PkdojG+LTes4iLiCIndH7pj5vbjtX2FIhauIM=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Thu, 12 Nov 2026 16:48:01 +0530
Subject: [PATCH v5 03/11] platform/raspberrypi: Add VideoCore shared memory
 support
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
Message-Id: <20261112-b4-vc-sm-cma-v5-3-d25e3b687e71@ideasonboard.com>
References: <20261112-b4-vc-sm-cma-v5-0-d25e3b687e71@ideasonboard.com>
In-Reply-To: <20261112-b4-vc-sm-cma-v5-0-d25e3b687e71@ideasonboard.com>
To: Stefan Wahren <wahrenst@gmx.net>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Phil Elwell <phil@raspberrypi.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 bcm-kernel-feedback-list@broadcom.com
Cc: Martin Wetterwald <martin@wetterwald.eu>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-rpi-kernel@lists.infradead.org, linux-media@vger.kernel.org, 
 Jai Luthra <jai.luthra@ideasonboard.com>, Dom Cobley <popcornmix@gmail.com>, 
 Alexander Winkowski <dereference23@outlook.com>, 
 Juerg Haefliger <juerg.haefliger@canonical.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=61311;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=q886KU82W7PzX6aMLTUdSwOmjxsVVi4GRhYMHPNPDFs=;
 b=owEBbQKS/ZANAwAKAUPekfkkmnFFAcsmYgBq9aB2BRcRtVp9lZ09u6zvIkKEJBJ+Qhk8vlcfn
 j4i9AnMAw2JAjMEAAEKAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCavWgdgAKCRBD3pH5JJpx
 RZalD/41IAhoTuyYpmU8rSPfW5bxJhT/sMgsXKY9SZRcPfsZb/HqtMaQqkxg8pqnQx6cvNvF0zk
 PZ97OARSrH5wRjxjhi3cmgNnhra/Mzy/F5kafo7qPMqlm8q7y+MnDHXwWvAILYuYCyBl33V5bVf
 tSSi2kcsZuDqIXgY0QeGQ2wghHeU9PD65fkFtGjixeAMWv4zSdOVHBeIqfgvbqAzuWD2JcZS+S6
 hKQUYx6da6cnASLk/F6piiObwxwvDlP1CNsexmdeaCD7NhKv0lgWyC9FSW/1dKaHh8Cero8htn3
 GQhIm3VIEnutg59RVV33KU5j2tVfTu7ygNfXJzvER1WJswKzDiPR3j7axN+16uNHzUwSKmoraYk
 O5+rj0y/3508+u4fdXChYkN8iFhXEdM19rC9v2O5YOrqryN7QpNdHjNNadHaqucuPFX7owlkvcN
 wz9xqu2Uj2bzYcbuDodK2i9Cr4Tv7lC9OqzFk5XAJw1RMrl7qkuCV1ScbbxEgp0B99a0YG7VWKH
 0DLWEnZc4vb+qqRjXmRVRNYf+eM5S8Bkun/1C8HOFevwQI88s0A2Of5XAgeKFzwAaO/5BV+XBQR
 TCcZdwImOBfY2W8pgTbg9yqJYOITdDA0K3gCw4C5kCzY8Li7QmMoScSePnISWR2WBP7B807D6Yn
 sDsclHliKck2nIw==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145

From: Dave Stevenson <dave.stevenson@raspberrypi.com>

Add support for the vc-sm-cma driver, to enable sharing of contiguous
CMA memory allocations with the VideoCore VPU on Raspberry Pi. The
driver allocates CMA-backed buffers, imports external dmabufs, and
manages their lifetime via VCHIQ messaging to the VPU service, ensuring
buffers are not released until both the linux userspace and the VPU
confirm completion.

VC4 can only physically address the lower 1GB of RAM and requires
buffers to be mapped through specific uncached address aliases
(0xC0000000). Thus, standard CMA could not be used as it has no
mechanism to ensure allocations are visible and valid to VideoCore
firmware, or handle cache flushes as VC4 can't see ARM's cache state.

The vc-sm-cma driver bridges this gap by allocating memory via CMA on
the ARM side and explicitly importing it into VideoCore via VCHI.

This driver is primarily used by the wrapper V4L2 drivers for codec and
ISP, where firmware running on VC4 does the actual video and image
processing, while the linux userspace interacts with standard V4L2
driver interfaces. For example, the ISP driver populates large
lens-shading related tables for a particular camera setup, and uses
vc-sm-cma to share this buffer with VC4.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Dom Cobley <popcornmix@gmail.com>
Signed-off-by: Phil Elwell <phil@raspberrypi.com>
Signed-off-by: Alexander Winkowski <dereference23@outlook.com>
Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
Signed-off-by: Juerg Haefliger <juerg.haefliger@canonical.com>
[clean-up for mainline and switch to xarray instead of idr]
Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
Changes in v4:
- Rebase on v7.3-rc1
- Cut out all userspace import and VPU alloc code (from Dave)
- Fix most of the overflow lines (> 80)
Changes in v3:
- Rebase on v7.2-rc1
- Switch from kzalloc with sizeof to kzalloc_obj
- Fix lkp bot errors with Kconfig dependencies
---
 MAINTAINERS                                        |   7 +
 drivers/platform/raspberrypi/Kconfig               |   2 +
 drivers/platform/raspberrypi/Makefile              |   1 +
 drivers/platform/raspberrypi/vc-sm-cma/Kconfig     |   9 +
 drivers/platform/raspberrypi/vc-sm-cma/Makefile    |   5 +
 drivers/platform/raspberrypi/vc-sm-cma/vc_sm.c     | 810 +++++++++++++++++++++
 drivers/platform/raspberrypi/vc-sm-cma/vc_sm.h     |  64 ++
 .../raspberrypi/vc-sm-cma/vc_sm_cma_vchi.c         | 513 +++++++++++++
 .../raspberrypi/vc-sm-cma/vc_sm_cma_vchi.h         |  64 ++
 .../platform/raspberrypi/vc-sm-cma/vc_sm_defs.h    | 304 ++++++++
 include/linux/raspberrypi/vc_sm_cma_ioctl.h        | 105 +++
 include/linux/raspberrypi/vc_sm_knl.h              |  76 ++
 12 files changed, 1960 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 93abbb315065..ca8508dc818b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5786,6 +5786,13 @@ L:	netdev@vger.kernel.org
 S:	Maintained
 F:	drivers/net/ethernet/broadcom/tg3.*
 
+BROADCOM VIDEOCORE SHARED MEMORY DRIVER
+M:	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
+L:	linux-kernel@vger.kernel.org
+S:	Maintained
+F:	drivers/platform/raspberrypi/vc-sm-cma/*
+F:	include/linux/raspberrypi/vc_sm_cma*
+
 BROADCOM VK DRIVER
 M:	Scott Branden <scott.branden@broadcom.com>
 R:	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
diff --git a/drivers/platform/raspberrypi/Kconfig b/drivers/platform/raspberrypi/Kconfig
index 2c928440a47c..68a7a2d5701c 100644
--- a/drivers/platform/raspberrypi/Kconfig
+++ b/drivers/platform/raspberrypi/Kconfig
@@ -48,5 +48,7 @@ config VCHIQ_CDEV
 endif
 
 source "drivers/platform/raspberrypi/vchiq-mmal/Kconfig"
+source "drivers/platform/raspberrypi/vc-sm-cma/Kconfig"
+
 
 endif
diff --git a/drivers/platform/raspberrypi/Makefile b/drivers/platform/raspberrypi/Makefile
index 2a7c9511e5d8..1980f618e218 100644
--- a/drivers/platform/raspberrypi/Makefile
+++ b/drivers/platform/raspberrypi/Makefile
@@ -13,3 +13,4 @@ vchiq-objs += vchiq-interface/vchiq_dev.o
 endif
 
 obj-$(CONFIG_BCM2835_VCHIQ_MMAL)	+= vchiq-mmal/
+obj-$(CONFIG_BCM_VC_SM_CMA)		+= vc-sm-cma/
diff --git a/drivers/platform/raspberrypi/vc-sm-cma/Kconfig b/drivers/platform/raspberrypi/vc-sm-cma/Kconfig
new file mode 100644
index 000000000000..4af14a0e3458
--- /dev/null
+++ b/drivers/platform/raspberrypi/vc-sm-cma/Kconfig
@@ -0,0 +1,9 @@
+config BCM_VC_SM_CMA
+	tristate "VideoCore Shared Memory (CMA) driver"
+	select BCM2835_VCHIQ if HAS_DMA
+	select DMA_SHARED_BUFFER
+	help
+	  Say Y here to enable the shared memory interface that
+	  supports sharing dmabufs with VideoCore.
+	  This operates over the VCHIQ interface to a service
+	  running on VideoCore.
diff --git a/drivers/platform/raspberrypi/vc-sm-cma/Makefile b/drivers/platform/raspberrypi/vc-sm-cma/Makefile
new file mode 100644
index 000000000000..0419b9770b68
--- /dev/null
+++ b/drivers/platform/raspberrypi/vc-sm-cma/Makefile
@@ -0,0 +1,5 @@
+# SPDX-License-Identifier: GPL-2.0
+vc-sm-cma-$(CONFIG_BCM_VC_SM_CMA) := \
+	vc_sm.o vc_sm_cma_vchi.o
+
+obj-$(CONFIG_BCM_VC_SM_CMA) += vc-sm-cma.o
diff --git a/drivers/platform/raspberrypi/vc-sm-cma/vc_sm.c b/drivers/platform/raspberrypi/vc-sm-cma/vc_sm.c
new file mode 100644
index 000000000000..4dda06fee533
--- /dev/null
+++ b/drivers/platform/raspberrypi/vc-sm-cma/vc_sm.c
@@ -0,0 +1,810 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * VideoCore Shared Memory driver using CMA.
+ *
+ * Copyright: 2018, Raspberry Pi (Trading) Ltd
+ * Dave Stevenson <dave.stevenson@raspberrypi.com>
+ *
+ * Based on vmcs_sm driver from Broadcom Corporation for some API,
+ * and taking some code for buffer allocation and dmabuf handling from
+ * videobuf2.
+ *
+ * This driver has 3 main uses:
+ * 1) Allocating buffers for the kernel or userspace that can be shared with the
+ *    VPU.
+ * 2) Importing dmabufs from elsewhere for sharing with the VPU.
+ * 3) Allocating buffers for use by the VPU.
+ *
+ * In the first and second cases the native handle is a dmabuf. Releasing the
+ * resource inherently comes from releasing the dmabuf, and this will trigger
+ * unmapping on the VPU. The underlying allocation and our buffer structure are
+ * retained until the VPU has confirmed that it has finished with it.
+ *
+ * For the VPU allocations the VPU is responsible for triggering the release,
+ * and therefore the released message decrements the dma_buf refcount (with the
+ * VPU mapping having already been marked as released).
+ */
+
+#include <linux/device.h>
+#include <linux/debugfs.h>
+#include <linux/dma-mapping.h>
+#include <linux/dma-buf.h>
+#include <linux/fs.h>
+#include <linux/list.h>
+#include <linux/miscdevice.h>
+#include <linux/module.h>
+#include <linux/of_device.h>
+#include <linux/raspberrypi/vchiq_arm.h>
+#include <linux/raspberrypi/vchiq_bus.h>
+#include <linux/raspberrypi/vc_sm_cma_ioctl.h>
+#include <linux/raspberrypi/vc_sm_knl.h>
+#include <linux/slab.h>
+#include <linux/seq_file.h>
+#include <linux/xarray.h>
+
+#include "vc_sm_cma_vchi.h"
+#include "vc_sm_defs.h"
+
+#include "vc_sm.h"
+
+MODULE_IMPORT_NS("DMA_BUF");
+
+#define DEVICE_NAME		"vcsm-cma"
+#define DEVICE_MINOR		0
+
+#define VC_SM_RESOURCE_NAME_DEFAULT       "sm-host-resource"
+
+#define VC_SM_DIR_ROOT_NAME	"vcsm-cma"
+#define VC_SM_STATE		"state"
+
+/* VC4 address aliases for the lower 1GB of RAM. */
+#define VC_SM_VC4_ALIAS_MASK		0xc0000000
+#define VC_SM_VC4_UNCACHED_ALIAS	0xc0000000
+/* L2 coherent, non-alocating */
+#define VC_SM_VC4_COHERENT_ALIAS	0x80000000
+
+struct sm_pde_t {
+	int (*show)(struct seq_file *s, void *v); /* Debug fs fn hookup */
+	struct dentry *dir_entry;		  /* Debug fs directory entry */
+	void *priv_data;			  /* Private data */
+};
+
+/* Global state information. */
+struct sm_state_t {
+	struct vchiq_device *device;
+
+	struct miscdevice misc_dev;
+
+	struct sm_instance *sm_handle;	/* Handle for videocore service. */
+
+	struct xarray kernelid_map;
+
+	struct mutex map_lock;          /* Global map lock. */
+	struct list_head buffer_list;	/* List of buffer. */
+
+	struct dentry *dir_root;	/* Debug fs entries root. */
+	struct sm_pde_t dir_state;	/* Debug fs entries state sub-tree. */
+
+	bool require_released_callback;	/* VPU will send a released msg when it
+					 * has finished with a resource.
+					 */
+	/* State for transactions */
+	int restart_sys;		/* Tracks restart on interrupt. */
+	enum vc_sm_msg_type int_action;	/* Interrupted action. */
+	u32 int_trans_id;		/* Interrupted transaction. */
+	struct vchiq_instance *vchiq_instance;
+};
+
+struct vc_sm_dma_buf_attachment {
+	struct device *dev;
+	struct sg_table sg_table;
+	struct list_head list;
+	enum dma_data_direction	dma_dir;
+};
+
+static struct sm_state_t *sm_state;
+static int sm_inited;
+
+static int get_kernel_id(struct vc_sm_buffer *buffer)
+{
+	int handle, ret;
+
+	ret = xa_alloc(&sm_state->kernelid_map, &handle, buffer, xa_limit_31b,
+		       GFP_KERNEL);
+
+	return ret < 0 ? ret : handle;
+}
+
+static struct vc_sm_buffer *lookup_kernel_id(int handle)
+{
+	return xa_load(&sm_state->kernelid_map, handle);
+}
+
+static void free_kernel_id(int handle)
+{
+	xa_erase(&sm_state->kernelid_map, handle);
+}
+
+static int vc_sm_cma_seq_file_show(struct seq_file *s, void *v)
+{
+	struct sm_pde_t *sm_pde;
+
+	sm_pde = (struct sm_pde_t *)(s->private);
+
+	if (sm_pde && sm_pde->show)
+		sm_pde->show(s, v);
+
+	return 0;
+}
+
+static int vc_sm_cma_single_open(struct inode *inode, struct file *file)
+{
+	return single_open(file, vc_sm_cma_seq_file_show, inode->i_private);
+}
+
+static const struct file_operations vc_sm_cma_debug_fs_fops = {
+	.open = vc_sm_cma_single_open,
+	.read = seq_read,
+	.llseek = seq_lseek,
+	.release = single_release,
+};
+
+static int vc_sm_cma_global_state_show(struct seq_file *s, void *v)
+{
+	struct vc_sm_buffer *resource = NULL;
+	int resource_count = 0;
+
+	if (!sm_state)
+		return 0;
+
+	/* Log all applicable mapping(s). */
+
+	mutex_lock(&sm_state->map_lock);
+	seq_puts(s, "\nResources\n");
+	if (!list_empty(&sm_state->buffer_list)) {
+		list_for_each_entry(resource, &sm_state->buffer_list,
+				    global_buffer_list) {
+			resource_count++;
+
+			seq_printf(s, "\nResource                %p\n",
+				   resource);
+			seq_printf(s, "           NAME         %s\n",
+				   resource->name);
+			seq_printf(s, "           SIZE         %zu\n",
+				   resource->size);
+			seq_printf(s, "           DMABUF       %p\n",
+				   resource->dma_buf);
+			seq_printf(s, "           IMPORTED_DMABUF %p\n",
+				   resource->imported_dma_buf);
+			seq_printf(s, "           ATTACH       %p\n",
+				   resource->attach);
+			seq_printf(s, "           SGT          %p\n",
+				   resource->sgt);
+			seq_printf(s, "           DMA_ADDR     %pad\n",
+				   &resource->dma_addr);
+			seq_printf(s, "           VC_HANDLE     %08x\n",
+				   resource->vc_handle);
+			seq_printf(s, "           VC_MAPPING    %d\n",
+				   resource->vpu_state);
+		}
+	}
+	seq_printf(s, "\n\nTotal resource count:   %d\n\n", resource_count);
+
+	mutex_unlock(&sm_state->map_lock);
+
+	return 0;
+}
+
+/*
+ * Adds a buffer to the private data list which tracks all the allocated
+ * data.
+ */
+static void vc_sm_add_resource(struct vc_sm_buffer *buffer)
+{
+	mutex_lock(&sm_state->map_lock);
+	list_add(&buffer->global_buffer_list, &sm_state->buffer_list);
+	mutex_unlock(&sm_state->map_lock);
+}
+
+/*
+ * Cleans up imported dmabuf.
+ * Should be called with mutex held.
+ */
+static void vc_sm_clean_up_dmabuf(struct vc_sm_buffer *buffer)
+{
+	/* Handle cleaning up imported dmabufs */
+	if (buffer->sgt) {
+		dma_buf_unmap_attachment_unlocked(buffer->attach,
+						  buffer->sgt,
+						  DMA_BIDIRECTIONAL);
+		buffer->sgt = NULL;
+	}
+	if (buffer->attach) {
+		dma_buf_detach(buffer->imported_dma_buf, buffer->attach);
+		buffer->attach = NULL;
+	}
+}
+
+/*
+ * Instructs VPU to decrement the refcount on a buffer.
+ */
+static void vc_sm_vpu_free(struct vc_sm_buffer *buffer)
+{
+	if (buffer->vc_handle && buffer->vpu_state == VPU_MAPPED) {
+		struct vc_sm_free_t free = { buffer->vc_handle, 0 };
+		int status = vc_sm_cma_vchi_free(sm_state->sm_handle, &free,
+					     &sm_state->int_trans_id);
+		if (status != 0 && status != -EINTR) {
+			dev_err(&sm_state->device->dev,
+				"%s: failed to free memory on videocore (status: %u, trans_id: %u)\n",
+				__func__, status, sm_state->int_trans_id);
+		}
+
+		if (sm_state->require_released_callback) {
+			/*
+			 * Need to wait for the VPU to confirm the free. Retain
+			 * a reference on this until the VPU has released it
+			 */
+			buffer->vpu_state = VPU_UNMAPPING;
+		} else {
+			buffer->vpu_state = VPU_NOT_MAPPED;
+			buffer->vc_handle = 0;
+		}
+	}
+}
+
+/*
+ * Release an allocation.
+ * All refcounting is done via the dma buf object.
+ *
+ * Must be called with the mutex held. The function will either release the
+ * mutex (if defering the release) or destroy it. The caller must therefore not
+ * reuse the buffer on return.
+ */
+static void vc_sm_release_resource(struct vc_sm_buffer *buffer)
+{
+	/* We've sent the unmap request but not had the response. */
+	if (buffer->vc_handle)
+		goto defer;
+	/* dmabuf still in use - we await the release */
+	if (buffer->in_use)
+		goto defer;
+
+	/* Release the allocation */
+	if (buffer->imported_dma_buf)
+		dma_buf_put(buffer->imported_dma_buf);
+	else
+		dev_err(&sm_state->device->dev, "%s: Imported dmabuf already been put for buf %p\n",
+			__func__, buffer);
+	buffer->imported_dma_buf = NULL;
+
+	/* Free our buffer. Start by removing it from the list */
+	mutex_lock(&sm_state->map_lock);
+	list_del(&buffer->global_buffer_list);
+	mutex_unlock(&sm_state->map_lock);
+
+	mutex_unlock(&buffer->lock);
+	mutex_destroy(&buffer->lock);
+
+	kfree(buffer);
+	return;
+
+defer:
+	mutex_unlock(&buffer->lock);
+}
+
+static void vc_sm_dma_buf_release(struct dma_buf *dmabuf)
+{
+	struct vc_sm_buffer *buffer;
+
+	if (!dmabuf)
+		return;
+
+	buffer = (struct vc_sm_buffer *)dmabuf->priv;
+
+	mutex_lock(&buffer->lock);
+
+	buffer->in_use = false;
+
+	/* Unmap on the VPU */
+	vc_sm_vpu_free(buffer);
+
+	/*
+	 * Unmap our dma_buf object (the vc_sm_buffer remains until released
+	 * on the VPU).
+	 */
+	vc_sm_clean_up_dmabuf(buffer);
+
+	/*
+	 * buffer->lock will be destroyed by vc_sm_release_resource if finished
+	 * with, otherwise unlocked. Do NOT unlock here.
+	 */
+	vc_sm_release_resource(buffer);
+}
+
+/* Dma_buf operations for chaining through to an imported dma_buf */
+
+static
+int vc_sm_import_dma_buf_attach(struct dma_buf *dmabuf,
+				struct dma_buf_attachment *attachment)
+{
+	struct vc_sm_buffer *buf = dmabuf->priv;
+
+	return buf->imported_dma_buf->ops->attach(buf->imported_dma_buf,
+						attachment);
+}
+
+static
+void vc_sm_import_dma_buf_detatch(struct dma_buf *dmabuf,
+				  struct dma_buf_attachment *attachment)
+{
+	struct vc_sm_buffer *buf = dmabuf->priv;
+
+	buf->imported_dma_buf->ops->detach(buf->imported_dma_buf, attachment);
+}
+
+static
+struct sg_table *vc_sm_import_map_dma_buf(struct dma_buf_attachment *attachment,
+					  enum dma_data_direction direction)
+{
+	struct vc_sm_buffer *buf = attachment->dmabuf->priv;
+
+	return buf->imported_dma_buf->ops->map_dma_buf(attachment,
+						     direction);
+}
+
+static
+void vc_sm_import_unmap_dma_buf(struct dma_buf_attachment *attachment,
+				struct sg_table *table,
+				enum dma_data_direction direction)
+{
+	struct vc_sm_buffer *buf = attachment->dmabuf->priv;
+
+	buf->imported_dma_buf->ops->unmap_dma_buf(attachment, table, direction);
+}
+
+static
+int vc_sm_import_dmabuf_mmap(struct dma_buf *dmabuf, struct vm_area_struct *vma)
+{
+	struct vc_sm_buffer *buf = dmabuf->priv;
+
+	return buf->imported_dma_buf->ops->mmap(buf->imported_dma_buf, vma);
+}
+
+static
+int vc_sm_import_dma_buf_begin_cpu_access(struct dma_buf *dmabuf,
+					  enum dma_data_direction direction)
+{
+	struct vc_sm_buffer *buf = dmabuf->priv;
+	const struct dma_buf_ops *ops = buf->imported_dma_buf->ops;
+
+	return ops->begin_cpu_access(buf->imported_dma_buf, direction);
+}
+
+static
+int vc_sm_import_dma_buf_end_cpu_access(struct dma_buf *dmabuf,
+					enum dma_data_direction direction)
+{
+	struct vc_sm_buffer *buf = dmabuf->priv;
+
+	return buf->imported_dma_buf->ops->end_cpu_access(buf->imported_dma_buf,
+							  direction);
+}
+
+static const struct dma_buf_ops dma_buf_import_ops = {
+	.map_dma_buf = vc_sm_import_map_dma_buf,
+	.unmap_dma_buf = vc_sm_import_unmap_dma_buf,
+	.mmap = vc_sm_import_dmabuf_mmap,
+	.release = vc_sm_dma_buf_release,
+	.attach = vc_sm_import_dma_buf_attach,
+	.detach = vc_sm_import_dma_buf_detatch,
+	.begin_cpu_access = vc_sm_import_dma_buf_begin_cpu_access,
+	.end_cpu_access = vc_sm_import_dma_buf_end_cpu_access,
+};
+
+/* Import a dma_buf to be shared with VC. */
+static int
+vc_sm_cma_import_dmabuf_internal(struct dma_buf *dma_buf,
+				 int fd,
+				 struct dma_buf **imported_buf)
+{
+	DEFINE_DMA_BUF_EXPORT_INFO(exp_info);
+	struct dma_buf_attachment *attach = NULL;
+	struct vc_sm_import_result result = { };
+	struct vc_sm_buffer *buffer = NULL;
+	struct vc_sm_import import = { };
+	struct sg_table *sgt = NULL;
+	dma_addr_t dma_addr;
+	u32 cache_alias;
+	int ret = 0;
+	int status;
+
+	/* Setup our allocation parameters */
+	if (fd < 0)
+		get_dma_buf(dma_buf);
+	else
+		dma_buf = dma_buf_get(fd);
+
+	if (!dma_buf)
+		return -EINVAL;
+
+	attach = dma_buf_attach(dma_buf, &sm_state->device->dev);
+	if (IS_ERR(attach)) {
+		ret = PTR_ERR(attach);
+		goto error;
+	}
+
+	sgt = dma_buf_map_attachment_unlocked(attach, DMA_BIDIRECTIONAL);
+	if (IS_ERR(sgt)) {
+		ret = PTR_ERR(sgt);
+		goto error;
+	}
+
+	/* Verify that the address block is contiguous */
+	if (sgt->nents != 1) {
+		ret = -ENOMEM;
+		goto error;
+	}
+
+	/* Allocate local buffer to track this allocation. */
+	buffer = kzalloc(sizeof(*buffer), GFP_KERNEL);
+	if (!buffer) {
+		ret = -ENOMEM;
+		goto error;
+	}
+
+	import.type = VC_SM_ALLOC_NON_CACHED;
+	dma_addr = sg_dma_address(sgt->sgl);
+	import.addr = (u32)dma_addr;
+	cache_alias = import.addr & VC_SM_VC4_ALIAS_MASK;
+	if (cache_alias != VC_SM_VC4_UNCACHED_ALIAS &&
+	    cache_alias != VC_SM_VC4_COHERENT_ALIAS) {
+		dev_err(&sm_state->device->dev, "%s: Expecting an uncached alias for dma_addr %pad\n",
+			__func__, &dma_addr);
+		/*
+		 * Note that this assumes we're on >= Pi2, but it implies a
+		 * DT configuration error.
+		 */
+		import.addr |= VC_SM_VC4_UNCACHED_ALIAS;
+	}
+	import.size = sg_dma_len(sgt->sgl);
+	import.allocator = current->tgid;
+	import.kernel_id = get_kernel_id(buffer);
+	if (import.kernel_id < 0) {
+		ret = import.kernel_id;
+		goto error;
+	}
+
+	memcpy(import.name, VC_SM_RESOURCE_NAME_DEFAULT,
+	       sizeof(VC_SM_RESOURCE_NAME_DEFAULT));
+
+	/* Allocate the videocore buffer. */
+	status = vc_sm_cma_vchi_import(sm_state->sm_handle, &import, &result,
+				       &sm_state->int_trans_id);
+	if (status == -EINTR) {
+		dev_dbg(&sm_state->device->dev,
+			"%s: requesting import memory action restart (trans_id: %u)\n",
+			__func__, sm_state->int_trans_id);
+		ret = -ERESTARTSYS;
+		sm_state->restart_sys = -EINTR;
+		sm_state->int_action = VC_SM_MSG_TYPE_IMPORT;
+		goto error;
+	} else if (status || !result.res_handle) {
+		dev_dbg(&sm_state->device->dev,
+			"%s: failed to import memory on videocore (status: %u, trans_id: %u)\n",
+			 __func__, status, sm_state->int_trans_id);
+		ret = -ENOMEM;
+		goto error;
+	}
+
+	mutex_init(&buffer->lock);
+	INIT_LIST_HEAD(&buffer->attachments);
+	memcpy(buffer->name, import.name,
+	       min(sizeof(buffer->name), sizeof(import.name) - 1));
+
+	/* Keep track of the buffer we created. */
+	buffer->vc_handle = result.res_handle;
+	buffer->size = import.size;
+	buffer->vpu_state = VPU_MAPPED;
+
+	buffer->imported_dma_buf = dma_buf;
+
+	buffer->attach = attach;
+	buffer->sgt = sgt;
+	buffer->dma_addr = dma_addr;
+	buffer->in_use = true;
+	buffer->kernel_id = import.kernel_id;
+
+	/*
+	 * We're done - we need to export a new dmabuf chaining through most
+	 * functions, but enabling us to release our own internal references
+	 * here.
+	 */
+	exp_info.ops = &dma_buf_import_ops;
+	exp_info.size = import.size;
+	exp_info.flags = O_RDWR;
+	exp_info.priv = buffer;
+
+	buffer->dma_buf = dma_buf_export(&exp_info);
+	if (IS_ERR(buffer->dma_buf)) {
+		ret = PTR_ERR(buffer->dma_buf);
+		goto error;
+	}
+
+	vc_sm_add_resource(buffer);
+
+	*imported_buf = buffer->dma_buf;
+
+	return 0;
+
+error:
+	if (result.res_handle) {
+		struct vc_sm_free_t free = { result.res_handle, 0 };
+
+		vc_sm_cma_vchi_free(sm_state->sm_handle, &free,
+				    &sm_state->int_trans_id);
+	}
+	free_kernel_id(import.kernel_id);
+	kfree(buffer);
+	if (sgt)
+		dma_buf_unmap_attachment_unlocked(attach, sgt,
+						  DMA_BIDIRECTIONAL);
+	if (attach)
+		dma_buf_detach(dma_buf, attach);
+	dma_buf_put(dma_buf);
+	return ret;
+}
+
+static void
+vc_sm_vpu_event(struct sm_instance *instance, struct vc_sm_result_t *reply,
+		int reply_len)
+{
+	switch (reply->trans_id & ~VC_SM_TRANS_ID_VPU_FLAG) {
+	case VC_SM_MSG_TYPE_CLIENT_VERSION:
+	{
+		/* Acknowledge that the firmware supports the version command */
+		sm_state->require_released_callback = true;
+	}
+	break;
+	case VC_SM_MSG_TYPE_RELEASED:
+	{
+		struct vc_sm_released *release = (struct vc_sm_released *)reply;
+		struct vc_sm_buffer *buffer =
+					lookup_kernel_id(release->kernel_id);
+		if (!buffer) {
+			dev_err(&sm_state->device->dev,
+				"%s: VC released a buffer that is already released, kernel_id %d\n",
+				__func__, release->kernel_id);
+			break;
+		}
+		mutex_lock(&buffer->lock);
+
+		dev_dbg(&sm_state->device->dev,
+			"%s: Released addr %08x, size %u, id %08x, mem_handle %08x\n",
+			__func__, release->addr, release->size,
+			release->kernel_id, release->vc_handle);
+
+		buffer->vc_handle = 0;
+		buffer->vpu_state = VPU_NOT_MAPPED;
+		free_kernel_id(release->kernel_id);
+
+		vc_sm_release_resource(buffer);
+	}
+	break;
+	default:
+		dev_err(&sm_state->device->dev, "%s: Unknown vpu cmd %x\n",
+			__func__, reply->trans_id);
+		break;
+	}
+}
+
+/* Driver load/unload functions */
+static void vc_sm_connected_init(void)
+{
+	struct vc_sm_result_t version_result;
+	struct vc_sm_version version;
+	int ret;
+
+	/*
+	 * Digging the vchiq_drv_mgmt, so low here and through a global seems
+	 * suspicious.
+	 *
+	 * The callbacks should be able to pass a parameter or context.
+	 */
+	struct vchiq_drv_mgmt *mgmt =
+		dev_get_drvdata(sm_state->device->dev.parent);
+
+	/*
+	 * Initialize and create a VCHI connection for the shared memory service
+	 * running on videocore.
+	 */
+	ret = vchiq_initialise(&mgmt->state, &sm_state->vchiq_instance);
+	if (ret) {
+		dev_err(&sm_state->device->dev,
+			"%s: failed to initialise VCHI instance (ret=%d)\n",
+			__func__, ret);
+
+		return;
+	}
+
+	ret = vchiq_connect(sm_state->vchiq_instance);
+	if (ret) {
+		dev_err(&sm_state->device->dev,
+			"%s: failed to connect VCHI instance (ret=%d)\n",
+			__func__, ret);
+
+		return;
+	}
+
+	/* Initialize an instance of the shared memory service. */
+	sm_state->sm_handle = vc_sm_cma_vchi_init(sm_state->vchiq_instance, 1,
+						  vc_sm_vpu_event);
+	if (!sm_state->sm_handle) {
+		dev_err(&sm_state->device->dev,
+			"%s: failed to initialize shared memory service\n",
+			__func__);
+
+		return;
+	}
+
+	/* Create a debug fs directory entry (root). */
+	sm_state->dir_root = debugfs_create_dir(VC_SM_DIR_ROOT_NAME, NULL);
+
+	sm_state->dir_state.show = &vc_sm_cma_global_state_show;
+	sm_state->dir_state.dir_entry =
+		debugfs_create_file(VC_SM_STATE, 0444, sm_state->dir_root,
+				    &sm_state->dir_state,
+				    &vc_sm_cma_debug_fs_fops);
+
+	INIT_LIST_HEAD(&sm_state->buffer_list);
+
+	version.version = 2;
+	ret = vc_sm_cma_vchi_client_version(sm_state->sm_handle, &version,
+					    &version_result,
+					    &sm_state->int_trans_id);
+	if (ret) {
+		dev_err(&sm_state->device->dev,
+			"%s: Failed to send version request %d\n", __func__,
+			ret);
+	}
+
+	sm_inited = 1;
+}
+
+static int bcm2835_vc_sm_cma_probe(struct vchiq_device *device)
+{
+	int err;
+
+	err = dma_set_mask_and_coherent(&device->dev, DMA_BIT_MASK(32));
+	if (err) {
+		dev_err(&device->dev, "dma_set_mask_and_coherent failed: %d\n",
+			err);
+		return err;
+	}
+
+	sm_state = devm_kzalloc(&device->dev, sizeof(*sm_state), GFP_KERNEL);
+	if (!sm_state)
+		return -ENOMEM;
+	sm_state->device = device;
+	mutex_init(&sm_state->map_lock);
+
+	xa_init_flags(&sm_state->kernelid_map, XA_FLAGS_ALLOC1);
+
+	device->dev.dma_parms = devm_kzalloc(&device->dev,
+					     sizeof(*device->dev.dma_parms),
+					     GFP_KERNEL);
+	/* dma_set_max_seg_size checks if dma_parms is NULL. */
+	dma_set_max_seg_size(&device->dev, 0x3FFFFFFF);
+
+	vchiq_add_connected_callback(device, vc_sm_connected_init);
+	return 0;
+}
+
+static void bcm2835_vc_sm_cma_remove(struct vchiq_device *device)
+{
+	if (sm_inited) {
+		misc_deregister(&sm_state->misc_dev);
+
+		/* Remove all proc entries. */
+		debugfs_remove_recursive(sm_state->dir_root);
+
+		/* Stop the videocore shared memory service. */
+		vc_sm_cma_vchi_stop(sm_state->vchiq_instance,
+				    &sm_state->sm_handle);
+	}
+
+	if (sm_state) {
+		xa_destroy(&sm_state->kernelid_map);
+
+		/* Free the memory for the state structure. */
+		mutex_destroy(&sm_state->map_lock);
+	}
+}
+
+/* Get an internal resource handle mapped from the external one. */
+int vc_sm_cma_get_vc_handle(void *handle)
+{
+	struct dma_buf *dma_buf = (struct dma_buf *)handle;
+	struct vc_sm_buffer *buf;
+
+	/* Validate we can work with this device. */
+	if (!sm_state || !handle) {
+		pr_err("%s: invalid input\n", __func__);
+		return 0;
+	}
+
+	buf = (struct vc_sm_buffer *)dma_buf->priv;
+	return buf->vc_handle;
+}
+EXPORT_SYMBOL_GPL(vc_sm_cma_get_vc_handle);
+
+/* Free a previously allocated shared memory handle and block. */
+int vc_sm_cma_free(void *handle)
+{
+	struct dma_buf *dma_buf = (struct dma_buf *)handle;
+
+	/* Validate we can work with this device. */
+	if (!sm_state || !handle) {
+		pr_err("%s: invalid input\n", __func__);
+		return -EPERM;
+	}
+
+	dma_buf_put(dma_buf);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(vc_sm_cma_free);
+
+/* Import a dmabuf to be shared with VC. */
+int vc_sm_cma_import_dmabuf(struct dma_buf *src_dmabuf, void **handle)
+{
+	struct dma_buf *new_dma_buf;
+	int ret;
+
+	/* Validate we can work with this device. */
+	if (!sm_state || !src_dmabuf || !handle) {
+		pr_err("%s: invalid input\n", __func__);
+		return -EPERM;
+	}
+
+	ret = vc_sm_cma_import_dmabuf_internal(src_dmabuf, -1, &new_dma_buf);
+
+	if (!ret) {
+		/* Assign valid handle at this time.*/
+		*handle = new_dma_buf;
+	} else {
+		/*
+		 * succeeded in importing the dma_buf, but then
+		 * failed to look it up again. How?
+		 * Release the fd again.
+		 */
+		dev_err(&sm_state->device->dev,
+			"%s: imported vc_sm_cma_get_buffer failed %d\n",
+			__func__, ret);
+	}
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(vc_sm_cma_import_dmabuf);
+
+static struct vchiq_device_id device_id_table[] = {
+	{ .name = "vcsm-cma" },
+	{}
+};
+MODULE_DEVICE_TABLE(vchiq, device_id_table);
+
+static struct vchiq_driver bcm2835_vcsm_cma_driver = {
+	.probe = bcm2835_vc_sm_cma_probe,
+	.remove = bcm2835_vc_sm_cma_remove,
+	.id_table = device_id_table,
+	.driver = {
+		.name = DEVICE_NAME,
+		.owner = THIS_MODULE,
+	},
+};
+
+module_vchiq_driver(bcm2835_vcsm_cma_driver);
+
+MODULE_AUTHOR("Dave Stevenson");
+MODULE_DESCRIPTION("VideoCore CMA Shared Memory Driver");
+MODULE_LICENSE("GPL");
diff --git a/drivers/platform/raspberrypi/vc-sm-cma/vc_sm.h b/drivers/platform/raspberrypi/vc-sm-cma/vc_sm.h
new file mode 100644
index 000000000000..acb00b9fbd8e
--- /dev/null
+++ b/drivers/platform/raspberrypi/vc-sm-cma/vc_sm.h
@@ -0,0 +1,64 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+/*
+ * VideoCore Shared Memory driver using CMA.
+ *
+ * Copyright: 2018, Raspberry Pi (Trading) Ltd
+ *
+ */
+
+#ifndef VC_SM_H
+#define VC_SM_H
+
+#include <linux/device.h>
+#include <linux/dma-direction.h>
+#include <linux/kref.h>
+#include <linux/mm_types.h>
+#include <linux/mutex.h>
+#include <linux/sched.h>
+#include <linux/shrinker.h>
+#include <linux/types.h>
+#include <linux/miscdevice.h>
+
+#define VC_SM_MAX_NAME_LEN 32
+
+enum vc_sm_vpu_mapping_state {
+	VPU_NOT_MAPPED,
+	VPU_MAPPED,
+	VPU_UNMAPPING
+};
+
+struct vc_sm_buffer {
+	struct list_head global_buffer_list;	/* Global list of buffers. */
+
+	/* Index in the kernel_id idr so that we can find the
+	 * mmal_msg_context again when servicing the VCHI reply.
+	 */
+	int kernel_id;
+
+	size_t size;
+
+	/* Lock over all the following state for this buffer */
+	struct mutex lock;
+	struct list_head attachments;
+
+	char name[VC_SM_MAX_NAME_LEN];
+
+	bool in_use:1;   /* Kernel is still using this resource */
+
+	enum vc_sm_vpu_mapping_state vpu_state;
+	u32 vc_handle;	/* VideoCore handle for this buffer */
+
+	/* DMABUF related fields */
+	struct dma_buf *dma_buf;
+	dma_addr_t dma_addr;
+	void *cookie;
+
+	struct vc_sm_privdata_t *private;
+
+	struct dma_buf *imported_dma_buf;
+	struct dma_buf_attachment *attach;
+	struct sg_table *sgt;
+};
+
+#endif
diff --git a/drivers/platform/raspberrypi/vc-sm-cma/vc_sm_cma_vchi.c b/drivers/platform/raspberrypi/vc-sm-cma/vc_sm_cma_vchi.c
new file mode 100644
index 000000000000..098342601895
--- /dev/null
+++ b/drivers/platform/raspberrypi/vc-sm-cma/vc_sm_cma_vchi.c
@@ -0,0 +1,513 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * VideoCore Shared Memory CMA allocator
+ *
+ * Copyright: 2018, Raspberry Pi (Trading) Ltd
+ * Copyright 2011-2012 Broadcom Corporation.  All rights reserved.
+ *
+ * Based on vmcs_sm driver from Broadcom Corporation.
+ *
+ */
+
+#include "vc_sm_defs.h"
+#include <linux/completion.h>
+#include <linux/dev_printk.h>
+#include <linux/kernel.h>
+#include <linux/kthread.h>
+#include <linux/list.h>
+#include <linux/mutex.h>
+#include <linux/semaphore.h>
+#include <linux/slab.h>
+#include <linux/raspberrypi/vchiq_arm.h>
+#include <linux/types.h>
+
+#include "vc_sm_cma_vchi.h"
+
+#define VC_SM_VER  1
+#define VC_SM_MIN_VER 0
+
+/* Command blocks come from a pool */
+#define SM_MAX_NUM_CMD_RSP_BLKS 32
+
+/* The number of supported connections */
+#define SM_MAX_NUM_CONNECTIONS 3
+
+struct sm_cmd_rsp_blk {
+	struct list_head head;	/* To create lists */
+	/* To be signaled when the response is there */
+	struct completion cmplt;
+
+	u32 id;
+	u16 length;
+
+	u8 msg[VC_SM_MAX_MSG_LEN];
+
+	uint32_t wait:1;
+	uint32_t sent:1;
+	uint32_t alloc:1;
+
+};
+
+struct sm_instance {
+	u32 num_connections;
+	unsigned int service_handle[SM_MAX_NUM_CONNECTIONS];
+	struct task_struct *io_thread;
+	struct completion io_cmplt;
+
+	vpu_event_cb vpu_event;
+
+	/* Mutex over the following lists */
+	struct mutex lock;
+	u32 trans_id;
+	struct list_head cmd_list;
+	struct list_head rsp_list;
+	struct list_head dead_list;
+
+	struct sm_cmd_rsp_blk free_blk[SM_MAX_NUM_CMD_RSP_BLKS];
+
+	/* Mutex over the free_list */
+	struct mutex free_lock;
+	struct list_head free_list;
+
+	struct semaphore free_sema;
+	struct vchiq_instance *vchiq_instance;
+};
+
+static int
+bcm2835_vchi_msg_queue(struct vchiq_instance *vchiq_instance,
+		       unsigned int handle, void *data, unsigned int size)
+{
+	return vchiq_queue_kernel_message(vchiq_instance, handle, data, size);
+}
+
+static struct
+sm_cmd_rsp_blk *vc_vchi_cmd_create(struct sm_instance *instance,
+				   enum vc_sm_msg_type id, void *msg,
+				   u32 size, int wait)
+{
+	struct vc_sm_msg_hdr_t *hdr;
+	struct sm_cmd_rsp_blk *blk;
+
+	if (down_interruptible(&instance->free_sema)) {
+		blk = kmalloc_obj(*blk, GFP_KERNEL);
+		if (!blk)
+			return NULL;
+
+		blk->alloc = 1;
+		init_completion(&blk->cmplt);
+	} else {
+		mutex_lock(&instance->free_lock);
+		blk =
+		    list_first_entry(&instance->free_list,
+				     struct sm_cmd_rsp_blk, head);
+		list_del(&blk->head);
+		mutex_unlock(&instance->free_lock);
+	}
+
+	blk->sent = 0;
+	blk->wait = wait;
+	blk->length = sizeof(*hdr) + size;
+
+	hdr = (struct vc_sm_msg_hdr_t *)blk->msg;
+	hdr->type = id;
+	mutex_lock(&instance->lock);
+	instance->trans_id++;
+	/*
+	 * Retain the top bit for identifying asynchronous events, or VPU cmds.
+	 */
+	instance->trans_id &= ~VC_SM_TRANS_ID_VPU_FLAG;
+	hdr->trans_id = instance->trans_id;
+	blk->id = instance->trans_id;
+	mutex_unlock(&instance->lock);
+
+	if (size)
+		memcpy(hdr->body, msg, size);
+
+	return blk;
+}
+
+static void
+vc_vchi_cmd_delete(struct sm_instance *instance, struct sm_cmd_rsp_blk *blk)
+{
+	if (blk->alloc) {
+		kfree(blk);
+		return;
+	}
+
+	mutex_lock(&instance->free_lock);
+	list_add(&blk->head, &instance->free_list);
+	mutex_unlock(&instance->free_lock);
+	up(&instance->free_sema);
+}
+
+static void vc_sm_cma_vchi_rx_ack(struct sm_instance *instance,
+				  struct sm_cmd_rsp_blk *cmd,
+				  struct vc_sm_result_t *reply,
+				  u32 reply_len)
+{
+	mutex_lock(&instance->lock);
+	list_for_each_entry(cmd,
+			    &instance->rsp_list,
+			    head) {
+		if (cmd->id == reply->trans_id)
+			break;
+	}
+	mutex_unlock(&instance->lock);
+
+	if (&cmd->head == &instance->rsp_list) {
+		dev_err(instance->vchiq_instance->state->dev,
+			"%s: received response %u, throw away...", __func__,
+			reply->trans_id);
+	} else if (reply_len > sizeof(cmd->msg)) {
+		dev_err(instance->vchiq_instance->state->dev,
+			"%s: reply too big (%u) %u, throw away...", __func__,
+			reply_len, reply->trans_id);
+	} else {
+		memcpy(cmd->msg, reply,
+		       reply_len);
+		complete(&cmd->cmplt);
+	}
+}
+
+static int vc_sm_cma_vchi_videocore_io(void *arg)
+{
+	struct sm_instance *instance = arg;
+	struct sm_cmd_rsp_blk *cmd = NULL, *cmd_tmp;
+	struct vc_sm_result_t *reply;
+	struct vchiq_header *header;
+	int status;
+	int svc_use = 1;
+
+	while (1) {
+		if (svc_use)
+			vchiq_release_service(instance->vchiq_instance,
+					      instance->service_handle[0]);
+		svc_use = 0;
+
+		if (wait_for_completion_interruptible(&instance->io_cmplt))
+			continue;
+		vchiq_use_service(instance->vchiq_instance,
+				  instance->service_handle[0]);
+		svc_use = 1;
+
+		do {
+			/*
+			 * Get new command and move it to response list
+			 */
+			mutex_lock(&instance->lock);
+			if (list_empty(&instance->cmd_list)) {
+				/* no more commands to process */
+				mutex_unlock(&instance->lock);
+				break;
+			}
+			cmd = list_first_entry(&instance->cmd_list,
+					       struct sm_cmd_rsp_blk, head);
+			list_move(&cmd->head, &instance->rsp_list);
+			cmd->sent = 1;
+			mutex_unlock(&instance->lock);
+			/* Send the command */
+			status = bcm2835_vchi_msg_queue(instance->vchiq_instance,
+							instance->service_handle[0],
+							cmd->msg, cmd->length);
+			if (status) {
+				dev_err(instance->vchiq_instance->state->dev,
+					"%s: failed to queue message (%d)",
+					__func__, status);
+			}
+
+			/* If no reply is needed then we're done */
+			if (!cmd->wait) {
+				mutex_lock(&instance->lock);
+				list_del(&cmd->head);
+				mutex_unlock(&instance->lock);
+				vc_vchi_cmd_delete(instance, cmd);
+				continue;
+			}
+
+			if (status) {
+				complete(&cmd->cmplt);
+				continue;
+			}
+
+		} while (1);
+
+		while ((header = vchiq_msg_hold(instance->vchiq_instance,
+						instance->service_handle[0]))) {
+			reply = (struct vc_sm_result_t *)header->data;
+			if (reply->trans_id & VC_SM_TRANS_ID_VPU_FLAG) {
+				/* Async event or cmd from the VPU */
+				if (instance->vpu_event)
+					instance->vpu_event(instance, reply,
+							    header->size);
+			} else {
+				vc_sm_cma_vchi_rx_ack(instance, cmd, reply,
+						      header->size);
+			}
+
+			vchiq_release_message(instance->vchiq_instance,
+					      instance->service_handle[0],
+					      header);
+		}
+
+		/* Go through the dead list and free them */
+		mutex_lock(&instance->lock);
+		list_for_each_entry_safe(cmd, cmd_tmp, &instance->dead_list,
+					 head) {
+			list_del(&cmd->head);
+			vc_vchi_cmd_delete(instance, cmd);
+		}
+		mutex_unlock(&instance->lock);
+	}
+
+	return 0;
+}
+
+static int vc_sm_cma_vchi_callback(struct vchiq_instance *vchiq_instance,
+				   enum vchiq_reason reason,
+				   struct vchiq_header *header,
+				   unsigned int handle, void *userdata,
+				   void __user *cb_userdata)
+{
+	struct sm_instance *instance =
+		vchiq_get_service_userdata(vchiq_instance, handle);
+
+	switch (reason) {
+	case VCHIQ_MESSAGE_AVAILABLE:
+		vchiq_msg_queue_push(vchiq_instance, handle, header);
+		complete(&instance->io_cmplt);
+		break;
+
+	case VCHIQ_SERVICE_CLOSED:
+		dev_info(instance->vchiq_instance->state->dev,
+			 "%s: service CLOSED!!", __func__);
+		break;
+
+	default:
+		break;
+	}
+
+	return 0;
+}
+
+struct sm_instance *vc_sm_cma_vchi_init(struct vchiq_instance *vchiq_instance,
+					unsigned int num_connections,
+					vpu_event_cb vpu_event)
+{
+	struct sm_instance *instance;
+	int status;
+	u32 i;
+
+	if (num_connections > SM_MAX_NUM_CONNECTIONS) {
+		dev_err(vchiq_instance->state->dev,
+			"%s: unsupported number of connections %u (max=%u)",
+			__func__, num_connections, SM_MAX_NUM_CONNECTIONS);
+
+		return NULL;
+	}
+	/* Allocate memory for this instance */
+	instance = kzalloc(sizeof(*instance), GFP_KERNEL);
+	if (!instance)
+		return NULL;
+
+	/* Misc initialisations */
+	mutex_init(&instance->lock);
+	init_completion(&instance->io_cmplt);
+	INIT_LIST_HEAD(&instance->cmd_list);
+	INIT_LIST_HEAD(&instance->rsp_list);
+	INIT_LIST_HEAD(&instance->dead_list);
+	INIT_LIST_HEAD(&instance->free_list);
+	sema_init(&instance->free_sema, SM_MAX_NUM_CMD_RSP_BLKS);
+	mutex_init(&instance->free_lock);
+	for (i = 0; i < SM_MAX_NUM_CMD_RSP_BLKS; i++) {
+		init_completion(&instance->free_blk[i].cmplt);
+		list_add(&instance->free_blk[i].head, &instance->free_list);
+	}
+
+	instance->vchiq_instance = vchiq_instance;
+
+	/* Open the VCHI service connections */
+	instance->num_connections = num_connections;
+	for (i = 0; i < num_connections; i++) {
+		struct vchiq_service_params_kernel params = {
+			.version = VC_SM_VER,
+			.version_min = VC_SM_MIN_VER,
+			.fourcc = VCHIQ_MAKE_FOURCC('S', 'M', 'E', 'M'),
+			.callback = vc_sm_cma_vchi_callback,
+			.userdata = instance,
+		};
+
+		status = vchiq_open_service(vchiq_instance, &params,
+					    &instance->service_handle[i]);
+		if (status) {
+			dev_err(vchiq_instance->state->dev,
+				"%s: failed to open VCHI service (%d)",
+				__func__, status);
+
+			goto err_close_services;
+		}
+	}
+	/* Create the thread which takes care of all io to/from videocore. */
+	instance->io_thread = kthread_create(&vc_sm_cma_vchi_videocore_io,
+					     (void *)instance, "vc-sm-cma-io");
+	if (!instance->io_thread) {
+		dev_err(vchiq_instance->state->dev,
+			"%s: failed to create SMIO thread", __func__);
+
+		goto err_close_services;
+	}
+	instance->vpu_event = vpu_event;
+	set_user_nice(instance->io_thread, -10);
+	wake_up_process(instance->io_thread);
+
+	return instance;
+
+err_close_services:
+	for (i = 0; i < instance->num_connections; i++) {
+		if (instance->service_handle[i])
+			vchiq_close_service(vchiq_instance,
+					    instance->service_handle[i]);
+	}
+	kfree(instance);
+
+	return NULL;
+}
+
+int vc_sm_cma_vchi_stop(struct vchiq_instance *vchiq_instance,
+			struct sm_instance **handle)
+{
+	struct sm_instance *instance;
+	u32 i;
+
+	if (!handle) {
+		pr_err("%s: invalid pointer to handle", __func__);
+		goto lock;
+	}
+
+	if (!*handle) {
+		pr_err("%s: invalid handle", __func__);
+		goto lock;
+	}
+
+	instance = *handle;
+
+	/* Close all VCHI service connections */
+	for (i = 0; i < instance->num_connections; i++) {
+		vchiq_use_service(vchiq_instance, instance->service_handle[i]);
+		vchiq_close_service(vchiq_instance,
+				    instance->service_handle[i]);
+	}
+
+	kfree(instance);
+
+	*handle = NULL;
+	return 0;
+
+lock:
+	return -EINVAL;
+}
+
+static int vc_sm_cma_vchi_send_msg(struct sm_instance *handle,
+				   enum vc_sm_msg_type msg_id, void *msg,
+				   u32 msg_size, void *result, u32 result_size,
+				   u32 *cur_trans_id, u8 wait_reply)
+{
+	struct sm_instance *instance = handle;
+	struct sm_cmd_rsp_blk *cmd_blk;
+	int status = 0;
+
+	if (!handle) {
+		pr_err("%s: invalid handle", __func__);
+		return -EINVAL;
+	}
+	if (!msg) {
+		dev_err(instance->vchiq_instance->state->dev,
+			"%s: invalid msg pointer", __func__);
+		return -EINVAL;
+	}
+
+	cmd_blk =
+	    vc_vchi_cmd_create(instance, msg_id, msg, msg_size, wait_reply);
+	if (!cmd_blk) {
+		dev_err(instance->vchiq_instance->state->dev,
+			"[%s]: failed to allocate global tracking resource",
+			__func__);
+		return -ENOMEM;
+	}
+
+	if (cur_trans_id)
+		*cur_trans_id = cmd_blk->id;
+
+	mutex_lock(&instance->lock);
+	list_add_tail(&cmd_blk->head, &instance->cmd_list);
+	mutex_unlock(&instance->lock);
+	complete(&instance->io_cmplt);
+
+	if (!wait_reply)
+		/* We're done */
+		return 0;
+
+	/* Wait for the response */
+	if (wait_for_completion_interruptible(&cmd_blk->cmplt)) {
+		mutex_lock(&instance->lock);
+		if (!cmd_blk->sent) {
+			list_del(&cmd_blk->head);
+			mutex_unlock(&instance->lock);
+			vc_vchi_cmd_delete(instance, cmd_blk);
+			return -ENXIO;
+		}
+
+		list_move(&cmd_blk->head, &instance->dead_list);
+		mutex_unlock(&instance->lock);
+		complete(&instance->io_cmplt);
+		return -EINTR;	/* We're done */
+	}
+
+	if (result && result_size) {
+		memcpy(result, cmd_blk->msg, result_size);
+	} else {
+		struct vc_sm_result_t *res =
+			(struct vc_sm_result_t *)cmd_blk->msg;
+		status = (res->success == 0) ? 0 : -ENXIO;
+	}
+
+	mutex_lock(&instance->lock);
+	list_del(&cmd_blk->head);
+	mutex_unlock(&instance->lock);
+	vc_vchi_cmd_delete(instance, cmd_blk);
+	return status;
+}
+
+int vc_sm_cma_vchi_free(struct sm_instance *handle, struct vc_sm_free_t *msg,
+			u32 *cur_trans_id)
+{
+	return vc_sm_cma_vchi_send_msg(handle, VC_SM_MSG_TYPE_FREE,
+				   msg, sizeof(*msg), 0, 0, cur_trans_id, 0);
+}
+
+int vc_sm_cma_vchi_import(struct sm_instance *handle, struct vc_sm_import *msg,
+			  struct vc_sm_import_result *result, u32 *cur_trans_id)
+{
+	return vc_sm_cma_vchi_send_msg(handle, VC_SM_MSG_TYPE_IMPORT,
+				   msg, sizeof(*msg), result, sizeof(*result),
+				   cur_trans_id, 1);
+}
+
+int vc_sm_cma_vchi_client_version(struct sm_instance *handle,
+				  struct vc_sm_version *msg,
+				  struct vc_sm_result_t *result,
+				  u32 *cur_trans_id)
+{
+	return vc_sm_cma_vchi_send_msg(handle, VC_SM_MSG_TYPE_CLIENT_VERSION,
+				   msg, sizeof(*msg), NULL, 0,
+				   cur_trans_id, 0);
+}
+
+int vc_sm_vchi_client_vc_mem_req_reply(struct sm_instance *handle,
+				       struct vc_sm_vc_mem_request_result *msg,
+				       uint32_t *cur_trans_id)
+{
+	return vc_sm_cma_vchi_send_msg(handle,
+				       VC_SM_MSG_TYPE_VC_MEM_REQUEST_REPLY,
+				       msg, sizeof(*msg), 0, 0, cur_trans_id,
+				       0);
+}
diff --git a/drivers/platform/raspberrypi/vc-sm-cma/vc_sm_cma_vchi.h b/drivers/platform/raspberrypi/vc-sm-cma/vc_sm_cma_vchi.h
new file mode 100644
index 000000000000..6b6fa2837c9f
--- /dev/null
+++ b/drivers/platform/raspberrypi/vc-sm-cma/vc_sm_cma_vchi.h
@@ -0,0 +1,64 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+/*
+ * VideoCore Shared Memory CMA allocator
+ *
+ * Copyright: 2018, Raspberry Pi (Trading) Ltd
+ * Copyright 2011-2012 Broadcom Corporation.  All rights reserved.
+ *
+ * Based on vmcs_sm driver from Broadcom Corporation.
+ *
+ */
+
+#ifndef __VC_SM_CMA_VCHI_H__INCLUDED__
+#define __VC_SM_CMA_VCHI_H__INCLUDED__
+
+#include <linux/raspberrypi/vchiq.h>
+
+#include "vc_sm_defs.h"
+
+/*
+ * Forward declare.
+ */
+struct sm_instance;
+
+typedef void (*vpu_event_cb)(struct sm_instance *instance,
+			     struct vc_sm_result_t *reply, int reply_len);
+
+/*
+ * Initialize the shared memory service, opens up vchi connection to talk to it.
+ */
+struct sm_instance *vc_sm_cma_vchi_init(struct vchiq_instance *vchi_instance,
+					unsigned int num_connections,
+					vpu_event_cb vpu_event);
+
+/*
+ * Terminates the shared memory service.
+ */
+int vc_sm_cma_vchi_stop(struct vchiq_instance *vchi_instance,
+			struct sm_instance **handle);
+
+/*
+ * Ask the shared memory service to free up some memory that was previously
+ * allocated by the vc_sm_cma_vchi_alloc function call.
+ */
+int vc_sm_cma_vchi_free(struct sm_instance *handle, struct vc_sm_free_t *msg,
+			u32 *cur_trans_id);
+
+/*
+ * Import a contiguous block of memory and wrap it in a GPU MEM_HANDLE_T.
+ */
+int vc_sm_cma_vchi_import(struct sm_instance *handle, struct vc_sm_import *msg,
+			  struct vc_sm_import_result *result,
+			  u32 *cur_trans_id);
+
+int vc_sm_cma_vchi_client_version(struct sm_instance *handle,
+				  struct vc_sm_version *msg,
+				  struct vc_sm_result_t *result,
+				  u32 *cur_trans_id);
+
+int vc_sm_vchi_client_vc_mem_req_reply(struct sm_instance *handle,
+				       struct vc_sm_vc_mem_request_result *msg,
+				       uint32_t *cur_trans_id);
+
+#endif /* __VC_SM_CMA_VCHI_H__INCLUDED__ */
diff --git a/drivers/platform/raspberrypi/vc-sm-cma/vc_sm_defs.h b/drivers/platform/raspberrypi/vc-sm-cma/vc_sm_defs.h
new file mode 100644
index 000000000000..c8167ab31e4e
--- /dev/null
+++ b/drivers/platform/raspberrypi/vc-sm-cma/vc_sm_defs.h
@@ -0,0 +1,304 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+/*
+ * VideoCore Shared Memory CMA allocator
+ *
+ * Copyright: 2018, Raspberry Pi (Trading) Ltd
+ *
+ * Based on vc_sm_defs.h from the vmcs_sm driver Copyright Broadcom Corporation.
+ * All IPC messages are copied across to this file, even if the vc-sm-cma
+ * driver is not currently using them.
+ *
+ ****************************************************************************
+ */
+
+#ifndef __VC_SM_DEFS_H__INCLUDED__
+#define __VC_SM_DEFS_H__INCLUDED__
+
+#include <linux/types.h>
+
+/* Maximum message length */
+#define VC_SM_MAX_MSG_LEN (sizeof(union vc_sm_msg_union_t) + \
+	sizeof(struct vc_sm_msg_hdr_t))
+#define VC_SM_MAX_RSP_LEN (sizeof(union vc_sm_msg_union_t))
+
+/* Resource name maximum size */
+#define VC_SM_RESOURCE_NAME 32
+
+/*
+ * Version to be reported to the VPU
+ * VPU assumes 0 (aka 1) which does not require the released callback, nor
+ * expect the client to handle VC_MEM_REQUESTS.
+ * Version 2 requires the released callback, and must support VC_MEM_REQUESTS.
+ */
+#define VC_SM_PROTOCOL_VERSION	2
+
+/*
+ * Top bit of vc_sm_result_t.trans_id
+ * Set on asynchronous events or commands sent by the VPU.
+ */
+#define VC_SM_TRANS_ID_VPU_FLAG	0x80000000U
+
+enum vc_sm_msg_type {
+	/* Message types supported for HOST->VC direction */
+
+	/* Allocate shared memory block */
+	VC_SM_MSG_TYPE_ALLOC,
+	/* Lock allocated shared memory block */
+	VC_SM_MSG_TYPE_LOCK,
+	/* Unlock allocated shared memory block */
+	VC_SM_MSG_TYPE_UNLOCK,
+	/* Unlock allocated shared memory block, do not answer command */
+	VC_SM_MSG_TYPE_UNLOCK_NOANS,
+	/* Free shared memory block */
+	VC_SM_MSG_TYPE_FREE,
+	/* Resize a shared memory block */
+	VC_SM_MSG_TYPE_RESIZE,
+	/* Walk the allocated shared memory block(s) */
+	VC_SM_MSG_TYPE_WALK_ALLOC,
+
+	/* A previously applied action will need to be reverted */
+	VC_SM_MSG_TYPE_ACTION_CLEAN,
+
+	/*
+	 * Import a physical address and wrap into a MEM_HANDLE_T.
+	 * Release with VC_SM_MSG_TYPE_FREE.
+	 */
+	VC_SM_MSG_TYPE_IMPORT,
+	/*
+	 *Tells VC the protocol version supported by this client.
+	 * 2 supports the async/cmd messages from the VPU for final release
+	 * of memory, and for VC allocations.
+	 */
+	VC_SM_MSG_TYPE_CLIENT_VERSION,
+	/* Response to VC request for memory */
+	VC_SM_MSG_TYPE_VC_MEM_REQUEST_REPLY,
+
+	/*
+	 * Asynchronous/cmd messages supported for VC->HOST direction.
+	 * Signalled by setting the top bit in vc_sm_result_t trans_id.
+	 */
+
+	/*
+	 * VC has finished with an imported memory allocation.
+	 * Release any Linux reference counts on the underlying block.
+	 */
+	VC_SM_MSG_TYPE_RELEASED,
+	/* VC request for memory */
+	VC_SM_MSG_TYPE_VC_MEM_REQUEST,
+
+	VC_SM_MSG_TYPE_MAX
+};
+
+/* Type of memory to be allocated */
+enum vc_sm_alloc_type_t {
+	VC_SM_ALLOC_CACHED,
+	VC_SM_ALLOC_NON_CACHED,
+};
+
+/* Message header for all messages in HOST->VC direction */
+struct vc_sm_msg_hdr_t {
+	u32 type;
+	u32 trans_id;
+	u8 body[];
+};
+
+/* Request to allocate memory (HOST->VC) */
+struct vc_sm_alloc_t {
+	/* type of memory to allocate */
+	enum vc_sm_alloc_type_t type;
+	/* byte amount of data to allocate per unit */
+	u32 base_unit;
+	/* number of unit to allocate */
+	u32 num_unit;
+	/* alignment to be applied on allocation */
+	u32 alignment;
+	/* identity of who allocated this block */
+	u32 allocator;
+	/* resource name (for easier tracking on vc side) */
+	char name[VC_SM_RESOURCE_NAME];
+
+};
+
+/* Result of a requested memory allocation (VC->HOST) */
+struct vc_sm_alloc_result_t {
+	/* Transaction identifier */
+	u32 trans_id;
+
+	/* Resource handle */
+	u32 res_handle;
+	/* Pointer to resource buffer */
+	u32 res_mem;
+	/* Resource base size (bytes) */
+	u32 res_base_size;
+	/* Resource number */
+	u32 res_num;
+
+};
+
+/* Request to free a previously allocated memory (HOST->VC) */
+struct vc_sm_free_t {
+	/* Resource handle (returned from alloc) */
+	u32 res_handle;
+	/* Resource buffer (returned from alloc) */
+	u32 res_mem;
+
+};
+
+/* Request to lock a previously allocated memory (HOST->VC) */
+struct vc_sm_lock_unlock_t {
+	/* Resource handle (returned from alloc) */
+	u32 res_handle;
+	/* Resource buffer (returned from alloc) */
+	u32 res_mem;
+
+};
+
+/* Request to resize a previously allocated memory (HOST->VC) */
+struct vc_sm_resize_t {
+	/* Resource handle (returned from alloc) */
+	u32 res_handle;
+	/* Resource buffer (returned from alloc) */
+	u32 res_mem;
+	/* Resource *new* size requested (bytes) */
+	u32 res_new_size;
+
+};
+
+/* Result of a requested memory lock (VC->HOST) */
+struct vc_sm_lock_result_t {
+	/* Transaction identifier */
+	u32 trans_id;
+
+	/* Resource handle */
+	u32 res_handle;
+	/* Pointer to resource buffer */
+	u32 res_mem;
+	/*
+	 * Pointer to former resource buffer if the memory
+	 * was reallocated
+	 */
+	u32 res_old_mem;
+
+};
+
+/* Generic result for a request (VC->HOST) */
+struct vc_sm_result_t {
+	/* Transaction identifier */
+	u32 trans_id;
+
+	s32 success;
+
+};
+
+/* Request to revert a previously applied action (HOST->VC) */
+struct vc_sm_action_clean_t {
+	/* Action of interest */
+	enum vc_sm_msg_type res_action;
+	/* Transaction identifier for the action of interest */
+	u32 action_trans_id;
+
+};
+
+/* Request to remove all data associated with a given allocator (HOST->VC) */
+struct vc_sm_free_all_t {
+	/* Allocator identifier */
+	u32 allocator;
+};
+
+/* Request to import memory (HOST->VC) */
+struct vc_sm_import {
+	/* type of memory to allocate */
+	enum vc_sm_alloc_type_t type;
+	/* pointer to the VC (ie physical) address of the allocated memory */
+	u32 addr;
+	/* size of buffer */
+	u32 size;
+	/* opaque handle returned in RELEASED messages */
+	u32 kernel_id;
+	/* Allocator identifier */
+	u32 allocator;
+	/* resource name (for easier tracking on vc side) */
+	char     name[VC_SM_RESOURCE_NAME];
+};
+
+/* Result of a requested memory import (VC->HOST) */
+struct vc_sm_import_result {
+	/* Transaction identifier */
+	u32 trans_id;
+
+	/* Resource handle */
+	u32 res_handle;
+};
+
+/* Notification that VC has finished with an allocation (VC->HOST) */
+struct vc_sm_released {
+	/* cmd type / trans_id */
+	u32 cmd;
+
+	/* pointer to the VC (ie physical) address of the allocated memory */
+	u32 addr;
+	/* size of buffer */
+	u32 size;
+	/* opaque handle returned in RELEASED messages */
+	u32 kernel_id;
+	u32 vc_handle;
+};
+
+/*
+ * Client informing VC as to the protocol version it supports.
+ * >=2 requires the released callback, and supports VC asking for memory.
+ * Failure means that the firmware doesn't support this call, and therefore the
+ * client should either fail, or NOT rely on getting the released callback.
+ */
+struct vc_sm_version {
+	u32 version;
+};
+
+/* Request FROM VideoCore for some memory */
+struct vc_sm_vc_mem_request {
+	/* cmd type */
+	u32 cmd;
+
+	/* trans_id (from VPU) */
+	u32 trans_id;
+	/* size of buffer */
+	u32 size;
+	/* alignment of buffer */
+	u32 align;
+	/* resource name (for easier tracking) */
+	char     name[VC_SM_RESOURCE_NAME];
+	/* VPU handle for the resource */
+	u32 vc_handle;
+};
+
+/* Response from the kernel to provide the VPU with some memory */
+struct vc_sm_vc_mem_request_result {
+	/* Transaction identifier for the VPU */
+	u32 trans_id;
+	/* pointer to the physical address of the allocated memory */
+	u32 addr;
+	/* opaque handle returned in RELEASED messages */
+	u32 kernel_id;
+};
+
+/* Union of ALL messages */
+union vc_sm_msg_union_t {
+	struct vc_sm_alloc_t alloc;
+	struct vc_sm_alloc_result_t alloc_result;
+	struct vc_sm_free_t free;
+	struct vc_sm_lock_unlock_t lock_unlock;
+	struct vc_sm_action_clean_t action_clean;
+	struct vc_sm_resize_t resize;
+	struct vc_sm_lock_result_t lock_result;
+	struct vc_sm_result_t result;
+	struct vc_sm_free_all_t free_all;
+	struct vc_sm_import import;
+	struct vc_sm_import_result import_result;
+	struct vc_sm_version version;
+	struct vc_sm_released released;
+	struct vc_sm_vc_mem_request vc_request;
+	struct vc_sm_vc_mem_request_result vc_request_result;
+};
+
+#endif /* __VC_SM_DEFS_H__INCLUDED__ */
diff --git a/include/linux/raspberrypi/vc_sm_cma_ioctl.h b/include/linux/raspberrypi/vc_sm_cma_ioctl.h
new file mode 100644
index 000000000000..acd739e893a3
--- /dev/null
+++ b/include/linux/raspberrypi/vc_sm_cma_ioctl.h
@@ -0,0 +1,105 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+/*
+ * Copyright 2019 Raspberry Pi (Trading) Ltd.  All rights reserved.
+ *
+ * Based on vmcs_sm_ioctl.h Copyright Broadcom Corporation.
+ */
+
+#ifndef __VC_SM_CMA_IOCTL_H
+#define __VC_SM_CMA_IOCTL_H
+
+#include <linux/ioctl.h>
+#include <linux/types.h>
+
+#define VC_SM_CMA_RESOURCE_NAME               32
+#define VC_SM_CMA_RESOURCE_NAME_DEFAULT       "sm-host-resource"
+
+/* Type define used to create unique IOCTL number */
+#define VC_SM_CMA_MAGIC_TYPE                  'J'
+
+/* IOCTL commands on /dev/vc-sm-cma */
+enum vc_sm_cma_cmd_e {
+	VC_SM_CMA_CMD_ALLOC = 0x5A,	/* Start at 0x5A arbitrarily */
+
+	VC_SM_CMA_CMD_IMPORT_DMABUF,
+
+	VC_SM_CMA_CMD_CLEAN_INVALID2,
+
+	VC_SM_CMA_CMD_LAST	/* Do not delete */
+};
+
+/* Cache type supported, conveniently matches the user space definition in
+ * user-vcsm.h.
+ */
+enum vc_sm_cma_cache_e {
+	VC_SM_CMA_CACHE_NONE,
+	VC_SM_CMA_CACHE_HOST,
+	VC_SM_CMA_CACHE_VC,
+	VC_SM_CMA_CACHE_BOTH,
+};
+
+/* IOCTL Data structures */
+struct vc_sm_cma_ioctl_alloc {
+	/* user -> kernel */
+	__u32 size;
+	__u32 num;
+	__u32 cached;		/* enum vc_sm_cma_cache_e */
+	__u32 pad;
+	__u8 name[VC_SM_CMA_RESOURCE_NAME];
+
+	/* kernel -> user */
+	__s32 handle;
+	__u32 vc_handle;
+	__u64 dma_addr;
+};
+
+struct vc_sm_cma_ioctl_import_dmabuf {
+	/* user -> kernel */
+	__s32 dmabuf_fd;
+	__u32 cached;		/* enum vc_sm_cma_cache_e */
+	__u8 name[VC_SM_CMA_RESOURCE_NAME];
+
+	/* kernel -> user */
+	__s32 handle;
+	__u32 vc_handle;
+	__u32 size;
+	__u32 pad;
+	__u64 dma_addr;
+};
+
+/*
+ * Cache functions to be set to struct vc_sm_cma_ioctl_clean_invalid2
+ * invalidate_mode.
+ */
+#define VC_SM_CACHE_OP_NOP       0x00
+#define VC_SM_CACHE_OP_INV       0x01
+#define VC_SM_CACHE_OP_CLEAN     0x02
+#define VC_SM_CACHE_OP_FLUSH     0x03
+
+struct vc_sm_cma_ioctl_clean_invalid2 {
+	__u32 op_count;
+	__u32 pad;
+	struct vc_sm_cma_ioctl_clean_invalid_block {
+		__u32 invalidate_mode;
+		__u32 block_count;
+		void *  __user start_address;
+		__u32 block_size;
+		__u32 inter_block_stride;
+	} s[];
+};
+
+/* IOCTL numbers */
+#define VC_SM_CMA_IOCTL_MEM_ALLOC\
+	_IOR(VC_SM_CMA_MAGIC_TYPE, VC_SM_CMA_CMD_ALLOC,\
+	 struct vc_sm_cma_ioctl_alloc)
+
+#define VC_SM_CMA_IOCTL_MEM_IMPORT_DMABUF\
+	_IOR(VC_SM_CMA_MAGIC_TYPE, VC_SM_CMA_CMD_IMPORT_DMABUF,\
+	 struct vc_sm_cma_ioctl_import_dmabuf)
+
+#define VC_SM_CMA_IOCTL_MEM_CLEAN_INVALID2\
+	_IOR(VC_SM_CMA_MAGIC_TYPE, VC_SM_CMA_CMD_CLEAN_INVALID2,\
+	 struct vc_sm_cma_ioctl_clean_invalid2)
+
+#endif /* __VC_SM_CMA_IOCTL_H */
diff --git a/include/linux/raspberrypi/vc_sm_knl.h b/include/linux/raspberrypi/vc_sm_knl.h
new file mode 100644
index 000000000000..3c26a0daf6c1
--- /dev/null
+++ b/include/linux/raspberrypi/vc_sm_knl.h
@@ -0,0 +1,76 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+/*
+ * VideoCore Shared Memory CMA allocator
+ *
+ * Copyright: 2018, Raspberry Pi (Trading) Ltd
+ *
+ * Based on vc_sm_defs.h from the vmcs_sm driver Copyright Broadcom Corporation.
+ *
+ */
+
+#ifndef __VC_SM_KNL_H__INCLUDED__
+#define __VC_SM_KNL_H__INCLUDED__
+
+#include <linux/dma-buf.h>
+
+/**
+ * vc_sm_cma_free() - Release a VideoCore shared memory buffer
+ * @handle: Pointer to dmabuf representing the buffer to free
+ *
+ * This function should be called to release handles obtained from
+ * vc_sm_cma_import_dmabuf(). It decrements the dmabuf reference count,
+ * which triggers the cleanup sequence if this was the last reference.
+ *
+ * The actual memory deallocation is deferred until both the ARM-side
+ * references are released AND VideoCore confirms it has finished accessing
+ * the buffer. This ensures safe cleanup even if VideoCore operations are
+ * still in progress.
+ *
+ * Returns 0 on success, -%EPERM if the device is not initialized or handle is
+ * invalid.
+ */
+int vc_sm_cma_free(void *handle);
+
+/**
+ * vc_sm_cma_get_vc_handle() - Get VideoCore handle from dmabuf handle
+ * @handle: Pointer to dmabuf representing the shared memory buffer
+ *
+ * This function retrieves the VideoCore firmware handle associated with
+ * a dmabuf that was previously allocated or imported through this driver.
+ * The VideoCore handle is required when communicating with VideoCore
+ * firmware to reference the shared buffer.
+ *
+ * The handle parameter must be a dmabuf pointer that was obtained from
+ * either vc_sm_cma_import_dmabuf() or through the /dev/vcsm-cma device
+ * allocation ioctls.
+ *
+ * Returns VideoCore handle (non-zero) on success, 0 on failure or invalid
+ * input.
+ */
+int vc_sm_cma_get_vc_handle(void *handle);
+
+/**
+ * vc_sm_cma_import_dmabuf() - Import a dmabuf for sharing with VideoCore
+ * @src_dmabuf: DMA-BUF to import
+ * @handle: Output pointer to receive the new dmabuf handle
+ *
+ * Imports an existing dmabuf into the VideoCore shared memory subsystem,
+ * making it accessible to VideoCore firmware. This allows sharing of
+ * buffers allocated by other kernel drivers (such as V4L2) with VideoCore.
+ *
+ * The returned handle must be freed with vc_sm_cma_free() when no longer
+ * needed. The handle can be passed to vc_sm_cma_int_handle() to obtain
+ * the VideoCore firmware handle for use in MMAL or other VideoCore APIs.
+ *
+ * The imported buffer must be physically contiguous and located in memory
+ * addressable by VideoCore.
+ *
+ * Returns 0 on success and @handle is set to the new dmabuf pointer,
+ *         -%EPERM if the device is not initialized or input is invalid,
+ *         -%ENOMEM if allocation fails,
+ *         -%ERESTARTSYS if interrupted by signal during VCHI communication.
+ */
+int vc_sm_cma_import_dmabuf(struct dma_buf *dmabuf, void **handle);
+
+#endif /* __VC_SM_KNL_H__INCLUDED__ */

-- 
2.56.0

