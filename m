Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81F193BFAE0;
	Mon, 14 Sep 2026 07:34:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.244.123.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789371281; cv=none; b=Es+HC6oaSOe7uVVncAbnTU98TIDzRxUqYHMTA0fjffX48eKTRaW0BhbBaM6OBsN8Oxd9+sAKW8CBlJagpQm9O6R+X2OyGm+vZbQ5+V008AZKKuNMGjABANfroSyPJtauLJaWl/+IALU8HGxZals1YfOzYOgNxpwsKTr91EX0jOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789371281; c=relaxed/simple;
	bh=9Zci53ryu+ezj859lpIgJsHcD/pq70mD9bxUdVWe/zE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CtPA2SSwmqLPvJ5JnByspKZpiauBdzJb8ggKhZ44Z8HiB1OccDmDJ6pdIASqB0vssmVmL3NRcZ1Z5SQEx0TqfjLR/IFQWCxluD3Lrpai7ea/PAjNjVBgcI6RFEKOPL/UnBcFYgMPM9GQchMzA+WtGnF+0JjVrIxAZuPtnIuaCaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=b5WgmyPz; arc=none smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="b5WgmyPz"
X-UUID: bb9bbed8b00e11f1b1788b6acf885367-20260914
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=gdfwjGADhgtUrDpDoqj+aKYY1Y3zXb2Kw/5200kXnaw=;
	b=b5WgmyPzbjd7+LUppDscfU9R96UJP37qybzMH8yPiC+m9WamykiTD9c289fqL8AWov80YCfed7lrrwMhndGvMvtVaee7VcHUMTRULeYls2az7ebau5kp0mZyQkXqrb66fzdKR+q9zSL7ZnMwazcaGfTzLT8Yt9O6ISrN1Locjzk=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:93388172-9f01-49ff-96dd-860f4a4a4c81,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:7db8b62,CLOUDID:24e3c2dc-e2a3-4c41-83fa-4adacd638ae3,B
	ulkID:nil,BulkQuantity:0,SF:81|82|102|136|836|865|888|898,TC:-5,Content:0|
	15|50|99,EDM:-3|-100,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL
	:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: bb9bbed8b00e11f1b1788b6acf885367-20260914
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw01.mediatek.com
	(envelope-from <irui.wang@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1362139187; Mon, 14 Sep 2026 15:34:34 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 14 Sep 2026 15:34:33 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Mon, 14 Sep 2026 15:34:32 +0800
From: Irui Wang <irui.wang@mediatek.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	<wenst@chromium.org>, <angelogioacchino.delregno@collabora.com>,
	<nicolas.dufresne@collabora.com>, Tiffany Lin <tiffany.lin@mediatek.com>,
	kyrie wu <kyrie.wu@mediatek.com>
CC: Yunfei Dong <yunfei.dong@mediatek.com>, Maoguang Meng
	<maoguang.meng@mediatek.com>, Longfei Wang <longfei.wang@mediatek.com>, Irui
 Wang <irui.wang@mediatek.com>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>
Subject: [PATCH v8 5/6] media: mediatek: encoder: Add support for VCP encode process
Date: Mon, 14 Sep 2026 15:34:20 +0800
Message-ID: <20260914073423.16131-6-irui.wang@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20260914073423.16131-1-irui.wang@mediatek.com>
References: <20260914073423.16131-1-irui.wang@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N

Adapt the encoder driver to support VCP firmware interface.

Use platform data fw_type to identify VCP firmware and perform
VCP-specific operations:
- Allocate RC buffers using the VCP device
- Send shared memory address to VCP firmware
- Map the encoder VSI address to the CPU address space using the
VCP shared memory address.

Signed-off-by: Irui Wang <irui.wang@mediatek.com>
---
 .../mediatek/vcodec/common/mtk_vcodec_fw.c    |  6 +++++
 .../mediatek/vcodec/common/mtk_vcodec_fw.h    |  1 +
 .../vcodec/common/mtk_vcodec_fw_priv.h        |  1 +
 .../vcodec/common/mtk_vcodec_fw_vcp.c         |  6 +++++
 .../vcodec/encoder/venc/venc_common_if.c      | 22 ++++++++++++++-----
 .../mediatek/vcodec/encoder/venc_vpu_if.c     | 16 ++++++++++++--
 6 files changed, 44 insertions(+), 8 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw.c b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw.c
index 8630e871d..962fb2a77 100644
--- a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw.c
+++ b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw.c
@@ -83,3 +83,9 @@ int mtk_vcodec_fw_get_type(struct mtk_vcodec_fw *fw)
 	return fw->type;
 }
 EXPORT_SYMBOL_GPL(mtk_vcodec_fw_get_type);
+
+struct device *mtk_vcodec_fw_get_dev(struct mtk_vcodec_fw *fw)
+{
+	return fw->ops->get_fw_dev(fw);
+}
+EXPORT_SYMBOL_GPL(mtk_vcodec_fw_get_dev);
diff --git a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw.h b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw.h
index 005ac9969..7428b5d6f 100644
--- a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw.h
+++ b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw.h
@@ -44,5 +44,6 @@ int mtk_vcodec_fw_ipi_send(struct mtk_vcodec_fw *fw, int id,
 			   void *buf, unsigned int len, unsigned int wait);
 int mtk_vcodec_fw_get_type(struct mtk_vcodec_fw *fw);
 int mtk_vcodec_fw_get_ipi(enum mtk_vcodec_fw_type type, int hw_id);
+struct device *mtk_vcodec_fw_get_dev(struct mtk_vcodec_fw *fw);
 
 #endif /* _MTK_VCODEC_FW_H_ */
diff --git a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_priv.h b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_priv.h
index 0a2a9b010..710c83c87 100644
--- a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_priv.h
+++ b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_priv.h
@@ -29,6 +29,7 @@ struct mtk_vcodec_fw_ops {
 	int (*ipi_send)(struct mtk_vcodec_fw *fw, int id, void *buf,
 			unsigned int len, unsigned int wait);
 	void (*release)(struct mtk_vcodec_fw *fw);
+	struct device *(*get_fw_dev)(struct mtk_vcodec_fw *fw);
 };
 
 #if IS_ENABLED(CONFIG_VIDEO_MEDIATEK_VCODEC_VPU)
diff --git a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vcp.c b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vcp.c
index 468c4bf4e..ece171380 100644
--- a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vcp.c
+++ b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vcp.c
@@ -569,6 +569,11 @@ static void mtk_vcodec_vcp_release(struct mtk_vcodec_fw *fw)
 	mtk_vcodec_vcp_put_device(fw);
 }
 
+static struct device *mtk_vcodec_vcp_get_fw_dev(struct mtk_vcodec_fw *fw)
+{
+	return fw->vcp->vcp_device->dev;
+}
+
 static const struct mtk_vcodec_fw_ops mtk_vcodec_vcp_msg = {
 	.load_firmware = mtk_vcodec_vcp_load_firmware,
 	.get_vdec_capa = mtk_vcodec_vcp_get_vdec_capa,
@@ -577,6 +582,7 @@ static const struct mtk_vcodec_fw_ops mtk_vcodec_vcp_msg = {
 	.ipi_register = mtk_vcodec_vcp_set_ipi_register,
 	.ipi_send = mtk_vcodec_vcp_ipi_send,
 	.release = mtk_vcodec_vcp_release,
+	.get_fw_dev = mtk_vcodec_vcp_get_fw_dev,
 };
 
 struct mtk_vcodec_fw *mtk_vcodec_fw_vcp_init(void *priv, enum mtk_vcodec_fw_use fw_use)
diff --git a/drivers/media/platform/mediatek/vcodec/encoder/venc/venc_common_if.c b/drivers/media/platform/mediatek/vcodec/encoder/venc/venc_common_if.c
index 742420343..b7401d967 100644
--- a/drivers/media/platform/mediatek/vcodec/encoder/venc/venc_common_if.c
+++ b/drivers/media/platform/mediatek/vcodec/encoder/venc/venc_common_if.c
@@ -481,7 +481,11 @@ static void venc_free_rc_buf(struct venc_inst *inst,
 	int i;
 	struct device *dev;
 
-	dev = &inst->ctx->dev->plat_dev->dev;
+	if (inst->ctx->dev->venc_pdata->fw_type == VCP)
+		dev = mtk_vcodec_fw_get_dev(inst->ctx->dev->fw_handler);
+	else
+		dev = &inst->ctx->dev->plat_dev->dev;
+
 	mtk_venc_mem_free(inst, dev, &bufs->rc_code);
 
 	for (i = 0; i < core_num; i++)
@@ -530,12 +534,18 @@ static int venc_alloc_rc_buf(struct venc_inst *inst,
 	struct device *dev;
 	void *tmp_va;
 
-	dev = &inst->ctx->dev->plat_dev->dev;
-	if (mtk_venc_mem_alloc(inst, dev, &bufs->rc_code))
-		return -ENOMEM;
+	if (inst->ctx->dev->venc_pdata->fw_type == VCP) {
+		dev = mtk_vcodec_fw_get_dev(fw);
+		if (mtk_venc_mem_alloc(inst, dev, &bufs->rc_code))
+			return -ENOMEM;
+	} else {
+		dev = &inst->ctx->dev->plat_dev->dev;
+		if (mtk_venc_mem_alloc(inst, dev, &bufs->rc_code))
+			return -ENOMEM;
 
-	tmp_va = mtk_vcodec_fw_map_dm_addr(fw, bufs->rc_code.pa);
-	memcpy(bufs->rc_code.va, tmp_va, bufs->rc_code.size);
+		tmp_va = mtk_vcodec_fw_map_dm_addr(fw, bufs->rc_code.pa);
+		memcpy(bufs->rc_code.va, tmp_va, bufs->rc_code.size);
+	}
 
 	for (i = 0; i < core_num; i++) {
 		if (mtk_venc_mem_alloc(inst, dev, &bufs->rc_info[i]))
diff --git a/drivers/media/platform/mediatek/vcodec/encoder/venc_vpu_if.c b/drivers/media/platform/mediatek/vcodec/encoder/venc_vpu_if.c
index 7772b8442..1da9043fd 100644
--- a/drivers/media/platform/mediatek/vcodec/encoder/venc_vpu_if.c
+++ b/drivers/media/platform/mediatek/vcodec/encoder/venc_vpu_if.c
@@ -8,16 +8,26 @@
 #include "venc_ipi_msg.h"
 #include "venc_vpu_if.h"
 
+#define VSI_OFFSET_MASK 0x0FFFFFFF
+
 static void handle_enc_init_msg(struct venc_vpu_inst *vpu, const void *data)
 {
 	const struct venc_vpu_ipi_msg_init_comm *msg = data;
 	struct mtk_vcodec_fw *fw = vpu->ctx->dev->fw_handler;
+	u64 pa_start, vsi_offset;
 
 	vpu->inst_addr = msg->init_ack.vpu_inst_addr;
-	vpu->vsi = mtk_vcodec_fw_map_dm_addr(fw, vpu->inst_addr);
+
+	if (vpu->ctx->dev->venc_pdata->fw_type == VCP) {
+		pa_start = (u64)fw->vcp->iova_addr;
+		vsi_offset = (msg->vpu_vsi_addr & VSI_OFFSET_MASK) - (pa_start & VSI_OFFSET_MASK);
+		vpu->vsi = mtk_vcodec_fw_map_dm_addr(fw, ENCODER_MEM) + vsi_offset;
+	} else {
+		vpu->vsi = mtk_vcodec_fw_map_dm_addr(fw, msg->vpu_vsi_addr);
+	}
 
 	/* Firmware version field value is unspecified on MT8173. */
-	if (mtk_vcodec_fw_get_type(fw) == VPU)
+	if (vpu->ctx->dev->venc_pdata->fw_type == VPU)
 		return;
 
 	/* Check firmware version. */
@@ -155,6 +165,8 @@ int vpu_enc_init(struct venc_vpu_inst *vpu)
 	out.base.venc_inst = (unsigned long)vpu;
 	if (MTK_ENC_DRV_IS_COMM(vpu->ctx)) {
 		out.codec_type = vpu->ctx->q_data[MTK_Q_DATA_DST].fmt->fourcc;
+		if (vpu->ctx->dev->venc_pdata->fw_type == VCP)
+			out.shared_iova = vpu->ctx->dev->fw_handler->vcp->iova_addr;
 		msg_size = sizeof(struct venc_ap_ipi_msg_init_comm);
 	} else {
 		msg_size = sizeof(struct venc_ap_ipi_msg_init);
-- 
2.55.0.windows.3

