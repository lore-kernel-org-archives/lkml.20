Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E01D369972;
	Sat, 10 Oct 2026 08:36:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.61.82.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791621397; cv=none; b=pRcCDCjL5/NktdDoz1A7Pah8dFjXIcldh3ydU38z8ue13tlvLydC6qY3IwhYu38P4XDoOjyFQbDCPwLbPfyo21OiUZOXPJL1pHCq80Z6H2vSwyJ0LLnRWGe9hpqqX1tQnAtq4bqjVqxsevgs3ilP/Qjh6lvnqcwGOk34kEkF/c0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791621397; c=relaxed/simple;
	bh=DGcWXiTUWy5M7C5lmOdNzZXWaYnZDrKVA7py/Jnx4GE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=R+gYpSOhdQJXsIMIzvSSkocktAa6LVrJdP7LcEmZoT51OiUe9fVM6Jv099pPRsQtFsyYBfeTrUQCQ8LgDJlZvY2hSPBehkjHaqVwcvixMdFgQV4dXtsL2Y98K4oDY4YxJBIXAXBzpglrum1+rdxboju0LIFSiTBdva2lPzv1Fhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=faCqmYLv; arc=none smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="faCqmYLv"
X-UUID: ab59a68ac48511f18dc8c9802ae25ab1-20261010
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=r7oPl2mjIbdmG2kuDPHZIPIvPzh+TIEL9Vn1OY9V1OQ=;
	b=faCqmYLvVBdUiLiqhIq1iTY72ctrPNckDUTqJ7svGWSGrIBXU+XPhLDBDwNHJo2lrTsq4rKUAV/InHUo+qYZfrgin/BGk4eR6mYR7xHMS+RbHV0m3w3A1yu8DjxcNz6ltUJsCzNrKbVCN9lQKj8r6x4mbN5O2H2JtRG/8zWX/QE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.20,REQID:95eed146-af0d-4df8-a59f-1d6003dd375c,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:291e20b,CLOUDID:0428edb8-514b-419b-be8a-53f1868a3ee6,B
	ulkID:nil,BulkQuantity:0,SF:81|82|102|136|836|865|888|898,TC:-5,Content:0|
	15|50|99,EDM:-3|-100,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL
	:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: ab59a68ac48511f18dc8c9802ae25ab1-20261010
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw02.mediatek.com
	(envelope-from <kyrie.wu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 668722686; Sat, 10 Oct 2026 16:36:20 +0800
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 MTKMBS09N1.mediatek.inc (172.21.101.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Sat, 10 Oct 2026 16:36:19 +0800
Received: from gcnsap21.gcn.mediatek.inc (10.17.81.22) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Sat, 10 Oct 2026 16:36:18 +0800
From: Kyrie Wu <kyrie.wu@mediatek.com>
To: Tiffany Lin <tiffany.lin@mediatek.com>, Andrew-CT Chen
	<andrew-ct.chen@mediatek.com>, Yunfei Dong <yunfei.dong@mediatek.com>, Mauro
 Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Kyrie Wu <kyrie.wu@mediatek.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>, Ricardo Ribalda
	<ribalda@chromium.org>, Kees Cook <kees@kernel.org>, Hans Verkuil
	<hverkuil+cisco@kernel.org>, Fei Shao <fshao@chromium.org>, Haoxiang Li
	<haoxiang_li2024@163.com>, Chen-Yu Tsai <wenst@chromium.org>, Laurent
 Pinchart <laurent.pinchart+renesas@ideasonboard.com>, Tomasz Figa
	<tfiga@chromium.org>, Philipp Zabel <p.zabel@pengutronix.de>, Benjamin
 Gaignard <benjamin.gaignard@collabora.com>, Qianfeng Rong
	<rongqianfeng@vivo.com>, Irui Wang <irui.wang@mediatek.com>, Jacopo Mondi
	<jacopo.mondi@ideasonboard.com>, Fan Wu <fanwu01@zju.edu.cn>,
	<linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>
CC: Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: [PATCH v8 02/14] media: mediatek: vcodec: add driver to support vcp
Date: Sat, 10 Oct 2026 16:36:01 +0800
Message-ID: <c20ce2980a5fa57296b3593045225f02e782fb57.1791619742.git.kyrie.wu@mediatek.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1791619742.git.kyrie.wu@mediatek.com>
References: <cover.1791619742.git.kyrie.wu@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N

The processor is changed from scp to vcp in mt8196 platform.
Adding new firmware interface to communicate kernel with vcp
for the communication method is changed.

Signed-off-by: Kyrie Wu <kyrie.wu@mediatek.com>
---
 .../media/platform/mediatek/vcodec/Kconfig    |   4 +
 .../platform/mediatek/vcodec/common/Makefile  |   4 +
 .../mediatek/vcodec/common/mtk_vcodec_fw.c    |  23 +-
 .../mediatek/vcodec/common/mtk_vcodec_fw.h    |   6 +-
 .../vcodec/common/mtk_vcodec_fw_priv.h        |  12 +
 .../vcodec/common/mtk_vcodec_fw_scp.c         |   1 +
 .../vcodec/common/mtk_vcodec_fw_vcp.c         | 571 ++++++++++++++++++
 .../vcodec/common/mtk_vcodec_fw_vcp.h         | 152 +++++
 .../vcodec/common/mtk_vcodec_fw_vpu.c         |   1 +
 .../vcodec/decoder/mtk_vcodec_dec_drv.c       |   5 +-
 .../vcodec/decoder/mtk_vcodec_dec_drv.h       |   2 +
 .../vcodec/encoder/mtk_vcodec_enc_drv.c       |   4 +-
 .../vcodec/encoder/mtk_vcodec_enc_drv.h       |   2 +
 13 files changed, 768 insertions(+), 19 deletions(-)
 create mode 100644 drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vcp.c
 create mode 100644 drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vcp.h

diff --git a/drivers/media/platform/mediatek/vcodec/Kconfig b/drivers/media/platform/mediatek/vcodec/Kconfig
index bc829223..d23dad5c 100644
--- a/drivers/media/platform/mediatek/vcodec/Kconfig
+++ b/drivers/media/platform/mediatek/vcodec/Kconfig
@@ -1,4 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
+config VIDEO_MEDIATEK_VCODEC_VCP
+	bool
+
 config VIDEO_MEDIATEK_VCODEC_SCP
 	bool
 
@@ -21,6 +24,7 @@ config VIDEO_MEDIATEK_VCODEC
 	select V4L2_MEM2MEM_DEV
 	select VIDEO_MEDIATEK_VCODEC_VPU if VIDEO_MEDIATEK_VPU
 	select VIDEO_MEDIATEK_VCODEC_SCP if MTK_SCP
+	select VIDEO_MEDIATEK_VCODEC_VCP if MTK_VCP_RPROC
 	select V4L2_H264
 	select V4L2_VP9
 	select MEDIA_CONTROLLER
diff --git a/drivers/media/platform/mediatek/vcodec/common/Makefile b/drivers/media/platform/mediatek/vcodec/common/Makefile
index d0479914..2f68692e 100644
--- a/drivers/media/platform/mediatek/vcodec/common/Makefile
+++ b/drivers/media/platform/mediatek/vcodec/common/Makefile
@@ -14,6 +14,10 @@ ifneq ($(CONFIG_VIDEO_MEDIATEK_VCODEC_SCP),)
 mtk-vcodec-common-y += mtk_vcodec_fw_scp.o
 endif
 
+ifneq ($(CONFIG_VIDEO_MEDIATEK_VCODEC_VCP),)
+mtk-vcodec-common-y += mtk_vcodec_fw_vcp.o
+endif
+
 ifneq ($(CONFIG_DEBUG_FS),)
 obj-$(CONFIG_VIDEO_MEDIATEK_VCODEC) += mtk-vcodec-dbgfs.o
 
diff --git a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw.c b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw.c
index 08949b08..552d0d8a 100644
--- a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw.c
+++ b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw.c
@@ -4,25 +4,18 @@
 #include "../encoder/mtk_vcodec_enc_drv.h"
 #include "mtk_vcodec_fw_priv.h"
 
-struct mtk_vcodec_fw *mtk_vcodec_fw_select(void *priv, enum mtk_vcodec_fw_type type,
-					   enum mtk_vcodec_fw_use fw_use)
+struct mtk_vcodec_fw *mtk_vcodec_fw_select(void *priv, enum mtk_vcodec_fw_use fw_use,
+					   mtk_vcodec_fw_init_func fw_init)
 {
-	struct platform_device *plat_dev;
-
-	if (fw_use == ENCODER)
-		plat_dev = ((struct mtk_vcodec_enc_dev *)priv)->plat_dev;
-	else
-		plat_dev = ((struct mtk_vcodec_dec_dev *)priv)->plat_dev;
+	if (!fw_init)
+		return ERR_PTR(-EINVAL);
 
-	switch (type) {
-	case VPU:
-		return mtk_vcodec_fw_vpu_init(priv, fw_use);
-	case SCP:
-		return mtk_vcodec_fw_scp_init(priv, fw_use);
-	default:
-		dev_err(&plat_dev->dev, "Invalid vcodec fw type");
+	if (fw_use != ENCODER && fw_use != DECODER) {
+		pr_err("Invalid firmware use %d\n", fw_use);
 		return ERR_PTR(-EINVAL);
 	}
+
+	return fw_init(priv, fw_use);
 }
 EXPORT_SYMBOL_GPL(mtk_vcodec_fw_select);
 
diff --git a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw.h b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw.h
index c1642fb0..50d93d47 100644
--- a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw.h
+++ b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw.h
@@ -24,11 +24,13 @@ enum mtk_vcodec_fw_use {
 
 struct mtk_vcodec_fw;
 
+typedef struct mtk_vcodec_fw *(*mtk_vcodec_fw_init_func)(void *priv,
+							 enum mtk_vcodec_fw_use fw_use);
 typedef void (*mtk_vcodec_ipi_handler) (void *data,
 	unsigned int len, void *priv);
 
-struct mtk_vcodec_fw *mtk_vcodec_fw_select(void *priv, enum mtk_vcodec_fw_type type,
-					   enum mtk_vcodec_fw_use fw_use);
+struct mtk_vcodec_fw *mtk_vcodec_fw_select(void *priv, enum mtk_vcodec_fw_use fw_use,
+					   mtk_vcodec_fw_init_func fw_init);
 void mtk_vcodec_fw_release(struct mtk_vcodec_fw *fw);
 
 int mtk_vcodec_fw_load_firmware(struct mtk_vcodec_fw *fw);
diff --git a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_priv.h b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_priv.h
index 99603acc..0a2a9b01 100644
--- a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_priv.h
+++ b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_priv.h
@@ -4,6 +4,7 @@
 #define _MTK_VCODEC_FW_PRIV_H_
 
 #include "mtk_vcodec_fw.h"
+#include "mtk_vcodec_fw_vcp.h"
 
 struct mtk_vcodec_dec_dev;
 struct mtk_vcodec_enc_dev;
@@ -13,6 +14,7 @@ struct mtk_vcodec_fw {
 	const struct mtk_vcodec_fw_ops *ops;
 	struct platform_device *pdev;
 	struct mtk_scp *scp;
+	struct mtk_vcp *vcp;
 	enum mtk_vcodec_fw_use fw_use;
 };
 
@@ -49,4 +51,14 @@ mtk_vcodec_fw_scp_init(void *priv, enum mtk_vcodec_fw_use fw_use)
 }
 #endif /* CONFIG_VIDEO_MEDIATEK_VCODEC_SCP */
 
+#if IS_ENABLED(CONFIG_VIDEO_MEDIATEK_VCODEC_VCP)
+struct mtk_vcodec_fw *mtk_vcodec_fw_vcp_init(void *priv, enum mtk_vcodec_fw_use fw_use);
+#else
+static inline struct mtk_vcodec_fw *
+mtk_vcodec_fw_vcp_init(void *priv, enum mtk_vcodec_fw_use fw_use)
+{
+	return ERR_PTR(-ENODEV);
+}
+#endif /* CONFIG_VIDEO_MEDIATEK_VCODEC_VCP */
+
 #endif /* _MTK_VCODEC_FW_PRIV_H_ */
diff --git a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_scp.c b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_scp.c
index 1b0bc473..1aad5c3e 100644
--- a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_scp.c
+++ b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_scp.c
@@ -90,3 +90,4 @@ struct mtk_vcodec_fw *mtk_vcodec_fw_scp_init(void *priv, enum mtk_vcodec_fw_use
 
 	return fw;
 }
+EXPORT_SYMBOL_GPL(mtk_vcodec_fw_scp_init);
diff --git a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vcp.c b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vcp.c
new file mode 100644
index 00000000..150d842c
--- /dev/null
+++ b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vcp.c
@@ -0,0 +1,571 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2025 MediaTek Inc.
+ * Author: Kyrie Wu <kyrie.wu@mediatek.com>
+ */
+
+#include <linux/delay.h>
+#include <linux/dma-direction.h>
+#include <linux/dma-mapping.h>
+#include <linux/iommu.h>
+#include <linux/remoteproc/mtk_vcp_public.h>
+#include <linux/firmware/mediatek/mtk-vcp-ipc.h>
+
+#include "../decoder/mtk_vcodec_dec_drv.h"
+#include "../decoder/vdec_ipi_msg.h"
+#include "mtk_vcodec_fw_priv.h"
+
+#define IPI_SEND_TIMEOUT_MS  100U
+#define IPI_TIMEOUT_MS       100U
+
+#define VCP_IPI_HEADER_SIZE (sizeof(u32) * 2)
+#define VCP_IPI_ALIGN (4)
+
+static bool mtk_vcodec_vcp_ipi_id_valid(unsigned int ipi_id)
+{
+	return ipi_id < VCP_IPI_MAX;
+}
+
+static void mtk_vcodec_vcp_ipi_lock(struct mtk_vcp *vcp, u32 ipi_id)
+{
+	mutex_lock(&vcp->ipi_desc[ipi_id].lock);
+}
+
+static void mtk_vcodec_vcp_ipi_unlock(struct mtk_vcp *vcp, u32 ipi_id)
+{
+	lockdep_assert_held(&vcp->ipi_desc[ipi_id].lock);
+	mutex_unlock(&vcp->ipi_desc[ipi_id].lock);
+}
+
+static void mtk_vcodec_vcp_msq_queue_lock(struct mtk_vcodec_fw *fw, unsigned long *flags)
+{
+	spin_lock_irqsave(&fw->vcp->msg_queue.lock, *flags);
+}
+
+static void mtk_vcodec_vcp_msq_queue_unlock(struct mtk_vcodec_fw *fw, unsigned long *flags)
+{
+	spin_unlock_irqrestore(&fw->vcp->msg_queue.lock, *flags);
+}
+
+static int mtk_vcodec_vcp_notifier(struct notifier_block *nb, unsigned long event, void *ptr)
+{
+	struct mtk_vcp *vcp = container_of(nb, struct mtk_vcp, vcp_notify);
+
+	switch (event) {
+	case VCP_EVENT_SUSPEND:
+	case VCP_EVENT_STOP:
+		dev_dbg(&vcp->pdev->dev, "vcp notifier suspend");
+		break;
+	case VCP_EVENT_READY:
+	case VCP_EVENT_RESUME:
+		dev_dbg(&vcp->pdev->dev, "vcp notifier ready");
+		break;
+	}
+
+	return NOTIFY_DONE;
+}
+
+static void mtk_vcodec_vcp_free_msg_node(struct mtk_vcodec_fw *fw,
+					 struct mtk_vcp_msg_node *msg_node)
+{
+	unsigned long flags;
+
+	mtk_vcodec_vcp_msq_queue_lock(fw, &flags);
+	list_add(&msg_node->list, &fw->vcp->msg_queue.node_list);
+	mtk_vcodec_vcp_msq_queue_unlock(fw, &flags);
+}
+
+static int mtk_vcodec_vcp_ipi_register(struct mtk_vcp *vcp, u32 ipi_id, vcp_ipi_handler_t handler,
+				       void *priv)
+{
+	if (!vcp)
+		return -EPROBE_DEFER;
+
+	if (WARN_ON(!mtk_vcodec_vcp_ipi_id_valid(ipi_id)) || WARN_ON(!handler))
+		return -EINVAL;
+
+	mtk_vcodec_vcp_ipi_lock(vcp, ipi_id);
+	vcp->ipi_desc[ipi_id].handler = handler;
+	vcp->ipi_desc[ipi_id].priv = priv;
+	mtk_vcodec_vcp_ipi_unlock(vcp, ipi_id);
+
+	return 0;
+}
+
+static int mtk_vcodec_vcp_msg_process_thread(void *arg)
+{
+	struct mtk_vcodec_fw *fw = arg;
+	struct vdec_vpu_ipi_ack *msg = NULL;
+	struct mtk_vcp_share_obj *obj;
+	struct mtk_vcp_msg_node *msg_node;
+	vcp_ipi_handler_t handler;
+	unsigned long flags;
+	int ret = 0;
+
+	do {
+		ret = wait_event_interruptible(fw->vcp->msg_queue.wq,
+					       atomic_read(&fw->vcp->msg_queue.cnt) > 0 ||
+					       kthread_should_stop());
+		if (ret < 0) {
+			dev_err(&fw->pdev->dev, "wait msg queue ack timeout %d %d\n",
+				ret, atomic_read(&fw->vcp->msg_queue.cnt));
+			continue;
+		}
+		if (kthread_should_stop())
+			break;
+
+		mtk_vcodec_vcp_msq_queue_lock(fw, &flags);
+		msg_node = list_entry(fw->vcp->msg_queue.msg_list.next,
+				      struct mtk_vcp_msg_node, list);
+		list_del(&msg_node->list);
+		atomic_dec(&fw->vcp->msg_queue.cnt);
+		mtk_vcodec_vcp_msq_queue_unlock(fw, &flags);
+
+		obj = &msg_node->ipi_data;
+		msg = (struct vdec_vpu_ipi_ack *)obj->share_buf;
+
+		if (!msg->ap_inst_addr) {
+			dev_err(&fw->pdev->dev, "invalid message address\n");
+			mtk_vcodec_vcp_free_msg_node(fw, msg_node);
+			continue;
+		}
+
+		dev_dbg(&fw->pdev->dev, "msg ack id %d len %d msg_id 0x%x\n", obj->id, obj->len,
+			msg->msg_id);
+
+		if (!mtk_vcodec_vcp_ipi_id_valid(obj->id)) {
+			dev_err(&fw->pdev->dev, "invalid ack ipi id %u\n", obj->id);
+			mtk_vcodec_vcp_free_msg_node(fw, msg_node);
+			continue;
+		}
+
+		mtk_vcodec_vcp_ipi_lock(fw->vcp, obj->id);
+		handler = fw->vcp->ipi_desc[obj->id].handler;
+		if (!handler) {
+			dev_err(&fw->pdev->dev, "invalid ack ipi handler id = %d\n", obj->id);
+			mtk_vcodec_vcp_ipi_unlock(fw->vcp, obj->id);
+			mtk_vcodec_vcp_free_msg_node(fw, msg_node);
+			continue;
+		}
+
+		handler(msg, obj->len, fw->vcp->ipi_desc[obj->id].priv);
+		mtk_vcodec_vcp_ipi_unlock(fw->vcp, obj->id);
+
+		fw->vcp->msg_signaled[obj->id] = true;
+		wake_up(&fw->vcp->msg_wq[obj->id]);
+
+		mtk_vcodec_vcp_free_msg_node(fw, msg_node);
+	} while (!kthread_should_stop());
+
+	return ret;
+}
+
+static int mtk_vcodec_vcp_msg_ack_isr(unsigned int id, void *prdata, void *data, unsigned int len)
+{
+	struct mtk_vcodec_fw *fw = prdata;
+	struct mtk_vcp_msg_queue *msg_queue = &fw->vcp->msg_queue;
+	struct mtk_vcp_msg_node *msg_node;
+	struct vdec_vpu_ipi_ack *msg = NULL;
+	struct mtk_vcp_share_obj *obj = data;
+	unsigned long flags;
+
+	msg = (struct vdec_vpu_ipi_ack *)obj->share_buf;
+
+	if (!mtk_vcodec_vcp_ipi_id_valid(obj->id)) {
+		dev_err(&fw->pdev->dev, "invalid ack ipi id %u\n", obj->id);
+		return -EINVAL;
+	}
+
+	mtk_vcodec_vcp_msq_queue_lock(fw, &flags);
+	if (!list_empty(&msg_queue->node_list)) {
+		msg_node = list_entry(msg_queue->node_list.next, struct mtk_vcp_msg_node, list);
+
+		memcpy(&msg_node->ipi_data, obj, sizeof(*obj));
+		list_move_tail(&msg_node->list, &msg_queue->msg_list);
+		atomic_inc(&msg_queue->cnt);
+		mtk_vcodec_vcp_msq_queue_unlock(fw, &flags);
+
+		dev_dbg(&fw->pdev->dev, "push ipi_id %x msg_id %x, msg cnt %d\n",
+			obj->id, msg->msg_id, atomic_read(&msg_queue->cnt));
+
+		wake_up(&msg_queue->wq);
+	} else {
+		mtk_vcodec_vcp_msq_queue_unlock(fw, &flags);
+		dev_err(&fw->pdev->dev, "no free nodes in msg queue\n");
+	}
+
+	return 0;
+}
+
+static int mtk_vcodec_vcp_msg_ipi_send(struct mtk_vcodec_fw *fw, int id, void *buf,
+				       unsigned int len, unsigned int wait)
+{
+	struct mtk_vcp *vcp = fw->vcp;
+	struct mtk_vcp_device *vcp_device = vcp->vcp_device;
+	bool *msg_signaled;
+	wait_queue_head_t *msg_wq;
+	int ret, ipi_size, feature_id, mailbox_id, retry_cnt = 0;
+	unsigned long timeout_jiffies = 0;
+	struct mtk_vcp_share_obj obj = {0};
+	unsigned int *data;
+
+	if (id < 0 || !mtk_vcodec_vcp_ipi_id_valid(id)) {
+		dev_err(&fw->pdev->dev, "invalid ipi id %d\n", id);
+		return -EINVAL;
+	}
+
+	msg_signaled = &vcp->msg_signaled[id];
+	msg_wq = &vcp->msg_wq[id];
+
+	if (!vcp_device) {
+		dev_dbg(&fw->pdev->dev, "vcp device is null\n");
+		return -EINVAL;
+	}
+
+	mutex_lock(&vcp->ipi_mutex);
+	feature_id = VDEC_FEATURE_ID;
+	mailbox_id = IPI_OUT_VDEC_1;
+
+	timeout_jiffies = jiffies + msecs_to_jiffies(VCP_SYNC_TIMEOUT_MS);
+	while (!vcp_device->ops->vcp_is_ready(vcp_device, feature_id)) {
+		if (time_after(jiffies, timeout_jiffies)) {
+			vcp->ipi_id_ack[id] = -EINVAL;
+			ret = -EINVAL;
+			goto error;
+		}
+		usleep_range(1000, 2000);
+	}
+
+	if (len > VCP_SHARE_BUF_SIZE) {
+		vcp->ipi_id_ack[id] = -EINVAL;
+		ret = -EINVAL;
+		goto error;
+	}
+
+	obj.id = id;
+	obj.len = len;
+	memcpy(obj.share_buf, buf, len);
+
+	ipi_size = round_up(VCP_IPI_HEADER_SIZE + len, VCP_IPI_ALIGN);
+	data = (unsigned int *)obj.share_buf;
+	dev_dbg(&fw->pdev->dev, "vcp send message: id %d len %d data 0x%x\n",
+		obj.id, obj.len, data[0]);
+
+	*msg_signaled = false;
+	vcp->ipi_id_ack[id] = VCODEC_IPI_MSG_STATUS_OK;
+
+	ret = mtk_vcp_ipc_send(vcp_get_ipidev(vcp_device), mailbox_id, &obj, ipi_size);
+	if (ret != IPI_ACTION_DONE) {
+		vcp->ipi_id_ack[id] = -EIO;
+		ret = -EIO;
+		goto error;
+	}
+
+wait_ack:
+	/* wait for VCP's ACK */
+	ret = wait_event_interruptible_timeout(*msg_wq, *msg_signaled,
+					       msecs_to_jiffies(IPI_TIMEOUT_MS));
+	if (!ret) {
+		vcp->ipi_id_ack[id] = VCODEC_IPI_MSG_STATUS_FAIL;
+		dev_err(&fw->pdev->dev, "wait ipi ack timeout! %d %d\n", ret, vcp->ipi_id_ack[id]);
+	} else if (ret == -ERESTARTSYS) {
+		if (retry_cnt++ < 5)
+			goto wait_ack;
+
+		dev_err(&fw->pdev->dev, "wait ipi ack err (%d)\n", vcp->ipi_id_ack[id]);
+		vcp->ipi_id_ack[id] = VCODEC_IPI_MSG_STATUS_FAIL;
+	} else if (ret < 0) {
+		dev_err(&fw->pdev->dev, "wait ipi ack fail ret %d %d\n", ret, vcp->ipi_id_ack[id]);
+		vcp->ipi_id_ack[id] = VCODEC_IPI_MSG_STATUS_FAIL;
+	}
+
+	dev_dbg(&fw->pdev->dev, "receive message: id %d len %d data 0x%x\n",
+		obj.id, obj.len, data[0]);
+
+	mutex_unlock(&vcp->ipi_mutex);
+
+	return vcp->ipi_id_ack[id];
+
+error:
+	mutex_unlock(&vcp->ipi_mutex);
+	dev_err(&fw->pdev->dev, "send msg error type:%d msg:%d > %d ret:%d\n", fw->type, len,
+		VCP_SHARE_BUF_SIZE, ret);
+
+	return ret;
+}
+
+static bool mtk_vcodec_vcp_driver_loaded(struct mtk_vcodec_fw *fw)
+{
+	struct device *dev = &fw->pdev->dev;
+	struct device_driver *drv;
+
+	drv = driver_find("mtk-vcp", &platform_bus_type);
+	if (!drv) {
+		dev_dbg(dev, "find mtk-vcp driver failed, need to reload.");
+		return false;
+	}
+
+	return true;
+}
+
+static int mtk_vcodec_vcp_get_vcp_device(struct mtk_vcodec_fw *fw)
+{
+	struct device *dev = &fw->pdev->dev;
+	int retry = 0, retry_cnt = 10000;
+	phandle vcp_phandle;
+
+	while (!try_then_request_module(mtk_vcodec_vcp_driver_loaded(fw), "mtk-vcp")) {
+		if (++retry > retry_cnt) {
+			dev_err(dev, "failed to load mtk-vcp module");
+			return -EPROBE_DEFER;
+		}
+		usleep_range(1000, 2000);
+	}
+
+	if (of_property_read_u32(dev->of_node, "mediatek,vcp", &vcp_phandle)) {
+		dev_err(dev, "can't get vcp handle.\n");
+		return -ENODEV;
+	}
+
+	fw->vcp->vcp_device = mtk_vcp_get_by_phandle(vcp_phandle);
+	if (!fw->vcp->vcp_device) {
+		dev_err(dev, "get vcp device failed\n");
+		return -ENODEV;
+	}
+
+	return 0;
+}
+
+static void mtk_vcodec_vcp_put_device(struct mtk_vcodec_fw *fw)
+{
+	if (!fw->vcp->vcp_device)
+		return;
+
+	rproc_put(fw->vcp->vcp_device->rproc);
+	fw->vcp->vcp_device = NULL;
+}
+
+static int mtk_vcodec_vcp_load_firmware(struct mtk_vcodec_fw *fw)
+{
+	struct mtk_vcp_device *vcp_device;
+	int ret, feature_id, mem_id, mailbox_id, ipi_id;
+	int i;
+
+	if (fw->vcp->is_init_done) {
+		dev_dbg(&fw->pdev->dev, "vcp has already been initialized done.\n");
+		return 0;
+	}
+
+	if (mtk_vcodec_vcp_get_vcp_device(fw) < 0) {
+		dev_err(&fw->pdev->dev, "vcp device is null.\n");
+		return -EINVAL;
+	}
+
+	vcp_device = fw->vcp->vcp_device;
+
+	feature_id = VDEC_FEATURE_ID;
+	mem_id = VDEC_MEM_ID;
+	mailbox_id = IPI_IN_VDEC_1;
+	ipi_id = VCP_IPI_LAT_DECODER;
+
+	ret = mtk_vcp_mbox_ipc_register(vcp_get_ipidev(vcp_device), mailbox_id,
+					mtk_vcodec_vcp_msg_ack_isr, fw, &fw->vcp->share_data);
+	if (ret) {
+		dev_dbg(&fw->pdev->dev, "ipi register fail %d %d %d %d\n", ret, feature_id,
+			mem_id, mailbox_id);
+		ret = -EINVAL;
+		goto err_put_device;
+	}
+	fw->vcp->feature_id = feature_id;
+	fw->vcp->mailbox_id = mailbox_id;
+	fw->vcp->is_ipi_registered = true;
+
+	fw->vcp->vcp_notify.notifier_call = mtk_vcodec_vcp_notifier;
+	fw->vcp->vcp_notify.priority = 1;
+	vcp_device->ops->register_notify(vcp_device, feature_id, &fw->vcp->vcp_notify);
+	fw->vcp->is_notify_registered = true;
+
+	if (!fw->vcp->is_register_done) {
+		ret = vcp_device->ops->register_feature(vcp_device, feature_id);
+		if (ret < 0) {
+			dev_err(&fw->pdev->dev, "%d register to vcp fail(%d)\n", feature_id, ret);
+			ret = -EINVAL;
+			goto err_unregister_notify;
+		}
+
+		fw->vcp->is_register_done = true;
+	}
+
+	fw->vcp->is_init_done = true;
+
+	for (i = 0; i < VCP_IPI_MAX; i++)
+		mutex_init(&fw->vcp->ipi_desc[i].lock);
+	mutex_init(&fw->vcp->ipi_mutex);
+
+	init_waitqueue_head(&fw->vcp->msg_wq[VCP_IPI_LAT_DECODER]);
+	init_waitqueue_head(&fw->vcp->msg_wq[VCP_IPI_CORE_DECODER]);
+	fw->vcp->msg_thread =
+		kthread_run(mtk_vcodec_vcp_msg_process_thread, fw, "vcp_vdec_msq_thread");
+	if (IS_ERR(fw->vcp->msg_thread)) {
+		ret = PTR_ERR(fw->vcp->msg_thread);
+		fw->vcp->msg_thread = NULL;
+		goto err_deregister_feature;
+	}
+
+	fw->vcp->vsi_addr = vcp_device->ops->get_mem_virt(vcp_device, mem_id);
+	fw->vcp->vsi_core_addr = fw->vcp->vsi_addr + VCODEC_VSI_LEN;
+	fw->vcp->vsi_size = vcp_device->ops->get_mem_size(vcp_device, mem_id);
+	fw->vcp->iova_addr = vcp_device->ops->get_mem_iova(vcp_device, mem_id);
+
+	dev_dbg(&fw->pdev->dev, "vdec vcp init done => va: %p size:0x%x iova:%p.\n",
+		fw->vcp->vsi_addr, fw->vcp->vsi_size, &fw->vcp->iova_addr);
+
+	return 0;
+
+err_deregister_feature:
+	if (fw->vcp->is_register_done) {
+		vcp_device->ops->deregister_feature(vcp_device, feature_id);
+		fw->vcp->is_register_done = false;
+	}
+err_unregister_notify:
+	if (fw->vcp->is_notify_registered) {
+		vcp_device->ops->unregister_notify(vcp_device, feature_id,
+						       &fw->vcp->vcp_notify);
+		fw->vcp->is_notify_registered = false;
+	}
+	if (fw->vcp->is_ipi_registered) {
+		mtk_vcp_mbox_ipc_unregister(vcp_get_ipidev(vcp_device), mailbox_id);
+		fw->vcp->is_ipi_registered = false;
+	}
+	fw->vcp->is_init_done = false;
+
+err_put_device:
+	mtk_vcodec_vcp_put_device(fw);
+	return ret;
+}
+
+static unsigned int mtk_vcodec_vcp_get_vdec_capa(struct mtk_vcodec_fw *fw)
+{
+	return MTK_VDEC_FORMAT_MM21 | MTK_VDEC_FORMAT_H264_SLICE | MTK_VDEC_FORMAT_VP9_FRAME |
+	       MTK_VDEC_FORMAT_AV1_FRAME | MTK_VDEC_FORMAT_HEVC_FRAME |
+	       MTK_VDEC_IS_SUPPORT_10BIT | MTK_VDEC_IS_SUPPORT_EXT;
+}
+
+static void *mtk_vcodec_vcp_dm_addr(struct mtk_vcodec_fw *fw, u32 dtcm_dmem_addr)
+{
+	return NULL;
+}
+
+static int mtk_vcodec_vcp_set_ipi_register(struct mtk_vcodec_fw *fw, int id,
+					   mtk_vcodec_ipi_handler handler,
+					   const char *name, void *priv)
+{
+	return mtk_vcodec_vcp_ipi_register(fw->vcp, id, handler, priv);
+}
+
+static int mtk_vcodec_vcp_ipi_send(struct mtk_vcodec_fw *fw, int id, void *buf,
+				   unsigned int len, unsigned int wait)
+{
+	return mtk_vcodec_vcp_msg_ipi_send(fw, id, buf, len, wait);
+}
+
+static void mtk_vcodec_vcp_release(struct mtk_vcodec_fw *fw)
+{
+	struct mtk_vcp_device *vcp_device = fw->vcp->vcp_device;
+	struct device *dev = &fw->pdev->dev;
+	int ret;
+
+	if (!fw->vcp->vcp_device) {
+		dev_err(dev, "vcp device is null\n");
+		return;
+	}
+
+	if (fw->vcp->is_ipi_registered) {
+		mtk_vcp_mbox_ipc_unregister(vcp_get_ipidev(vcp_device), fw->vcp->mailbox_id);
+		fw->vcp->is_ipi_registered = false;
+	}
+
+	if (fw->vcp->msg_thread) {
+		kthread_stop(fw->vcp->msg_thread);
+		fw->vcp->msg_thread = NULL;
+	}
+
+	if (fw->vcp->is_notify_registered) {
+		vcp_device->ops->unregister_notify(vcp_device, fw->vcp->feature_id,
+						       &fw->vcp->vcp_notify);
+		fw->vcp->is_notify_registered = false;
+	}
+
+	if (!fw->vcp->is_register_done) {
+		fw->vcp->is_init_done = false;
+		goto put_device;
+	}
+
+	ret = vcp_device->ops->deregister_feature(vcp_device, fw->vcp->feature_id);
+	if (ret < 0) {
+		dev_err(dev, "deregister feature_id(%d) fail(%d)\n", fw->vcp->feature_id, ret);
+		return;
+	}
+
+	fw->vcp->is_register_done = false;
+	fw->vcp->is_init_done = false;
+
+put_device:
+	mtk_vcodec_vcp_put_device(fw);
+}
+
+static const struct mtk_vcodec_fw_ops mtk_vcodec_vcp_msg = {
+	.load_firmware = mtk_vcodec_vcp_load_firmware,
+	.get_vdec_capa = mtk_vcodec_vcp_get_vdec_capa,
+	.map_dm_addr = mtk_vcodec_vcp_dm_addr,
+	.ipi_register = mtk_vcodec_vcp_set_ipi_register,
+	.ipi_send = mtk_vcodec_vcp_ipi_send,
+	.release = mtk_vcodec_vcp_release,
+};
+
+struct mtk_vcodec_fw *mtk_vcodec_fw_vcp_init(void *priv, enum mtk_vcodec_fw_use fw_use)
+{
+	struct mtk_vcp_msg_node *msg_node;
+	struct platform_device *plat_dev;
+	struct mtk_vcodec_fw *fw;
+	int i;
+
+	if (fw_use == DECODER) {
+		struct mtk_vcodec_dec_dev *dec_dev = priv;
+
+		plat_dev = dec_dev->plat_dev;
+	} else {
+		pr_err("Invalid fw_use %d (use a reasonable fw id here)\n", fw_use);
+		return ERR_PTR(-EINVAL);
+	}
+
+	fw = devm_kzalloc(&plat_dev->dev, sizeof(*fw), GFP_KERNEL);
+	if (!fw)
+		return ERR_PTR(-ENOMEM);
+
+	fw->type = VCP;
+	fw->pdev = plat_dev;
+	fw->fw_use = fw_use;
+	fw->ops = &mtk_vcodec_vcp_msg;
+	fw->vcp = devm_kzalloc(&plat_dev->dev, sizeof(*fw->vcp), GFP_KERNEL);
+	if (!fw->vcp)
+		return ERR_PTR(-ENOMEM);
+
+	INIT_LIST_HEAD(&fw->vcp->msg_queue.msg_list);
+	INIT_LIST_HEAD(&fw->vcp->msg_queue.node_list);
+	spin_lock_init(&fw->vcp->msg_queue.lock);
+	init_waitqueue_head(&fw->vcp->msg_queue.wq);
+	atomic_set(&fw->vcp->msg_queue.cnt, 0);
+	fw->vcp->pdev = plat_dev;
+
+	for (i = 0; i < VCP_MAX_MQ_NODE_CNT; i++) {
+		msg_node = devm_kzalloc(&plat_dev->dev, sizeof(*msg_node), GFP_KERNEL);
+		if (!msg_node)
+			return ERR_PTR(-ENOMEM);
+
+		list_add(&msg_node->list, &fw->vcp->msg_queue.node_list);
+	}
+
+	return fw;
+}
+EXPORT_SYMBOL_GPL(mtk_vcodec_fw_vcp_init);
diff --git a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vcp.h b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vcp.h
new file mode 100644
index 00000000..83742096
--- /dev/null
+++ b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vcp.h
@@ -0,0 +1,152 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2025 MediaTek Inc.
+ * Author: Kyrie Wu <kyrie.wu@mediatek.com>
+ */
+
+#ifndef _MTK_VCODEC_FW_VCP_H_
+#define _MTK_VCODEC_FW_VCP_H_
+
+typedef void (*vcp_ipi_handler_t) (void *data, unsigned int len, void *priv);
+
+#define VCP_MAX_MQ_NODE_CNT  6
+#define VCP_SHARE_BUF_SIZE 64
+
+#define VCODEC_VSI_LEN (0x2000)
+
+/* enum mtk_vcp_ipi_index - index used to separate different hardware */
+enum mtk_vcp_ipi_index {
+	VCP_IPI_LAT_DECODER,
+	VCP_IPI_CORE_DECODER,
+	VCP_IPI_MAX,
+};
+
+/**
+ * struct mtk_vcp_msg_queue - process the vcp message between kernel with vcp
+ *
+ * @msg_list:  store share buffer list which from vcp to kernel
+ * @wq:        waitqueue that can be used to wait for vcp message
+ * @lock:      protect msg list
+ * @cnt:       the count of share obj in msg list
+ * @node_list: share obj list
+ */
+struct mtk_vcp_msg_queue {
+	struct list_head msg_list;
+	wait_queue_head_t wq;
+	/* protect msg_list and node_list */
+	spinlock_t lock;
+	atomic_t cnt;
+	struct list_head node_list;
+};
+
+/**
+ * struct mtk_vcp_ipi_desc - store the ack handler
+ *
+ * @lock:    protect ack handler data
+ * @handler: calling this handler when kernel receive ack
+ * @priv:    private data when calling handler to process
+ */
+struct mtk_vcp_ipi_desc {
+	/* protect handler and priv */
+	struct mutex lock;
+	vcp_ipi_handler_t handler;
+	void *priv;
+};
+
+/**
+ * struct mtk_vcp_share_obj - share buffer used to send data to vcp
+ *
+ * @id:        message index
+ * @len:       message size
+ * @share_buf: message data
+ */
+struct mtk_vcp_share_obj {
+	unsigned int id;
+	unsigned int len;
+	unsigned char share_buf[VCP_SHARE_BUF_SIZE];
+};
+
+/* enum mtk_vcp_ipi_msg_status - the status when send message to vcp */
+enum mtk_vcp_ipi_msg_status {
+	VCODEC_IPI_MSG_STATUS_OK         = 0,
+	VCODEC_IPI_MSG_STATUS_FAIL       = -1,
+	VCODEC_IPI_MSG_STATUS_MAX_INST   = -2,
+	VCODEC_IPI_MSG_STATUS_ILSEQ      = -3,
+	VCODEC_IPI_MSG_STATUS_INVALID_ID = -4,
+	VCODEC_IPI_MSG_STATUS_DMA_FAIL   = -5,
+};
+
+/**
+ * struct mtk_vcp_msg_node - share buffer used to send data to vcp
+ *
+ * @ipi_data: share obj data
+ * @list:     list to store msg node
+ */
+struct mtk_vcp_msg_node {
+	struct mtk_vcp_share_obj ipi_data;
+	struct list_head list;
+};
+
+/**
+ * struct mtk_vcp - vcp firmware private data
+ *
+ * @is_init_done:  vcp is ready to use
+ *
+ * @ipi_mutex:     used to protect ipi data
+ * @msg_signaled:  whether receive ack from vcp
+ * @msg_wq:        wake message queue
+ *
+ * @ipi_desc:      store ack handler
+ * @ipi_id_ack:    the ack handler status
+ *
+ * @msg_queue:     process vcp message
+ * @share_data:    temp share obj data
+ *
+ * @vcp_notify:    register notifier to vcp
+ * @msg_thread:    process VCP message queue
+ *
+ * @vsi_addr:      vsi virtual data address
+ * @vsi_core_addr: vsi core virtual data address
+ * @iova_addr:     vsi iova address
+ * @vsi_size:      vsi size
+ *
+ * @pdev:          platform device
+ * @vcp_device:    vcp private data
+ * @feature_id:     registered VCP feature id
+ * @mailbox_id:     registered VCP mailbox id
+ * @is_register_done: feature registration state
+ * @is_ipi_registered: mailbox IPC registration state
+ * @is_notify_registered: notifier registration state
+ */
+struct mtk_vcp {
+	bool is_init_done;
+
+	/* serialize ipi message send/receive */
+	struct mutex ipi_mutex;
+	bool msg_signaled[VCP_IPI_MAX];
+	wait_queue_head_t msg_wq[VCP_IPI_MAX];
+
+	struct mtk_vcp_ipi_desc ipi_desc[VCP_IPI_MAX];
+	int ipi_id_ack[VCP_IPI_MAX];
+
+	struct mtk_vcp_msg_queue msg_queue;
+	struct mtk_vcp_share_obj share_data;
+
+	struct notifier_block vcp_notify;
+	struct task_struct *msg_thread;
+
+	void *vsi_addr;
+	void *vsi_core_addr;
+	dma_addr_t iova_addr;
+	int vsi_size;
+
+	struct platform_device *pdev;
+	struct mtk_vcp_device *vcp_device;
+	int feature_id;
+	int mailbox_id;
+	bool is_register_done;
+	bool is_ipi_registered;
+	bool is_notify_registered;
+};
+
+#endif
diff --git a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vpu.c b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vpu.c
index 3632037f..41643db9 100644
--- a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vpu.c
+++ b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vpu.c
@@ -130,3 +130,4 @@ struct mtk_vcodec_fw *mtk_vcodec_fw_vpu_init(void *priv, enum mtk_vcodec_fw_use
 
 	return fw;
 }
+EXPORT_SYMBOL_GPL(mtk_vcodec_fw_vpu_init);
diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c
index d220b645..ab5f6c01 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c
@@ -376,19 +376,22 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
 	if (!of_property_read_u32(pdev->dev.of_node, "mediatek,vpu",
 				  &rproc_phandle)) {
 		fw_type = VPU;
+		dev->fw_init = mtk_vcodec_fw_vpu_init;
 	} else if (!of_property_read_u32(pdev->dev.of_node, "mediatek,scp",
 					 &rproc_phandle)) {
 		fw_type = SCP;
+		dev->fw_init = mtk_vcodec_fw_scp_init;
 	} else if (!of_property_read_u32(pdev->dev.of_node, "mediatek,vcp",
 					 &rproc_phandle)) {
 		fw_type = VCP;
+		dev->fw_init = mtk_vcodec_fw_vcp_init;
 	} else {
 		dev_dbg(&pdev->dev, "Could not get vdec IPI device");
 		return -ENODEV;
 	}
 	dma_set_max_seg_size(&pdev->dev, UINT_MAX);
 
-	dev->fw_handler = mtk_vcodec_fw_select(dev, fw_type, DECODER);
+	dev->fw_handler = mtk_vcodec_fw_select(dev, DECODER, dev->fw_init);
 	if (IS_ERR(dev->fw_handler))
 		return PTR_ERR(dev->fw_handler);
 
diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h
index c9d27534..15e43732 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h
+++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h
@@ -251,6 +251,7 @@ struct mtk_vcodec_dec_ctx {
  * @vdecsys_regmap: VDEC_SYS register space passed through syscon
  *
  * @fw_handler: used to communicate with the firmware.
+ * @fw_init: firmware-specific init callback selected at probe time
  * @id_counter: used to identify current opened instance
  *
  * @dec_mutex: decoder hardware lock
@@ -292,6 +293,7 @@ struct mtk_vcodec_dec_dev {
 	struct regmap *vdecsys_regmap;
 
 	struct mtk_vcodec_fw *fw_handler;
+	struct mtk_vcodec_fw *(*fw_init)(void *priv, enum mtk_vcodec_fw_use fw_use);
 	u64 id_counter;
 
 	/* decoder hardware mutex lock */
diff --git a/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc_drv.c b/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc_drv.c
index 4e4541b2..811bc62a 100644
--- a/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc_drv.c
+++ b/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc_drv.c
@@ -259,16 +259,18 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
 	if (!of_property_read_u32(pdev->dev.of_node, "mediatek,vpu",
 				  &rproc_phandle)) {
 		fw_type = VPU;
+		dev->fw_init = mtk_vcodec_fw_vpu_init;
 	} else if (!of_property_read_u32(pdev->dev.of_node, "mediatek,scp",
 					 &rproc_phandle)) {
 		fw_type = SCP;
+		dev->fw_init = mtk_vcodec_fw_scp_init;
 	} else {
 		dev_err(&pdev->dev, "[MTK VCODEC] Could not get venc IPI device");
 		return -ENODEV;
 	}
 	dma_set_max_seg_size(&pdev->dev, UINT_MAX);
 
-	dev->fw_handler = mtk_vcodec_fw_select(dev, fw_type, ENCODER);
+	dev->fw_handler = mtk_vcodec_fw_select(dev, ENCODER, dev->fw_init);
 	if (IS_ERR(dev->fw_handler))
 		return PTR_ERR(dev->fw_handler);
 
diff --git a/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc_drv.h b/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc_drv.h
index 0cddfa13..934ff648 100644
--- a/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc_drv.h
+++ b/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc_drv.h
@@ -174,6 +174,7 @@ struct mtk_vcodec_enc_ctx {
  * @venc_pdata: encoder IC-specific data
  *
  * @fw_handler: used to communicate with the firmware.
+ * @fw_init: firmware-specific init callback selected at probe time
  * @id_counter: used to identify current opened instance
  *
  * @enc_mutex: encoder hardware lock.
@@ -201,6 +202,7 @@ struct mtk_vcodec_enc_dev {
 	const struct mtk_vcodec_enc_pdata *venc_pdata;
 
 	struct mtk_vcodec_fw *fw_handler;
+	struct mtk_vcodec_fw *(*fw_init)(void *priv, enum mtk_vcodec_fw_use fw_use);
 	u64 id_counter;
 
 	/* encoder hardware mutex lock */
