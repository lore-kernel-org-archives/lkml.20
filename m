Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F09DF38D406;
	Wed, 23 Sep 2026 02:43:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.61.82.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790131411; cv=none; b=bpgjL9hplUsjt3Z15jNu9PjVrpvAXwzsp8Bw0uCdhkjXoAmMGU8o8oc7jJ3xpxzDGnOn+C4+dF8pQq6pY0AZLxk05L6XPPS+aZArkmOYr/GIrhWnMvaZAhThYsjKDZMF219BbgUtmwrKKfl6KRVUnjVzaYa7H2cjHWlAobaopOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790131411; c=relaxed/simple;
	bh=Onx+GUhgId6jT8nqk5XChQ395sCyKFdVgxb5orfSVOw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=u4fqz7lzgyTLd523YMMcnRixhnCkbywQaMsG9pR33VfGwvDab55SwARuH1aAl7HVNi0f8y1wmUXyWzyQwRxFeuTbAYntXnBDuqZI3BmHeo9Y6a7+QnUcFOHDjlxLMcfnijWviQT73f84elUfoDwy5FRy3DfkV2+KYzWVaq60dPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=Q++6d2bd; arc=none smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="Q++6d2bd"
X-UUID: 83f53e96b6f811f18dc8c9802ae25ab1-20260923
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=7aLmHfaWrZlvoEIHPEphC806gDUpRHwQ5lE50pXKCFo=;
	b=Q++6d2bddXN+kOGRhA/DIEacJPxdXnaSDgx2Qn68qylPcn/djoHLzzeo+OFw3wM2MfCj0KbMAFFIzjSYS7s+O/EfUVCKG25wpzGaXE44Y2cHTi36LyabO5iCnTnEq2OjJenuE/IaZmXWY2HGY+oNcq5xvzYD3C6PuagSfK6QkWM=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:2865a4cf-0819-48c6-8c69-9f5a26fde6dd,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:7db8b62,CLOUDID:0582dafa-1cb6-4618-8a29-fa072b24d2a9,B
	ulkID:nil,BulkQuantity:0,SF:81|82|102|136|836|865|888|898,TC:-5,Content:0|
	15|50|99,EDM:-3|-100,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL
	:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 83f53e96b6f811f18dc8c9802ae25ab1-20260923
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw02.mediatek.com
	(envelope-from <kyrie.wu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1058069012; Wed, 23 Sep 2026 10:43:10 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 23 Sep 2026 10:43:09 +0800
Received: from gcnsap21.gcn.mediatek.inc (10.17.81.22) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Wed, 23 Sep 2026 10:43:07 +0800
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
Subject: [PATCH v7 05/14] media: mediatek: vcodec: get share memory address
Date: Wed, 23 Sep 2026 10:42:48 +0800
Message-ID: <20260923024258.257846-6-kyrie.wu@mediatek.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260923024258.257846-1-kyrie.wu@mediatek.com>
References: <20260923024258.257846-1-kyrie.wu@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N

There is only one share memory for vcp architecture, need to
divide it into many different functions.

Signed-off-by: Kyrie Wu <kyrie.wu@mediatek.com>
---
 .../vcodec/common/mtk_vcodec_fw_vcp.c         | 26 +++++++++++++-
 .../vcodec/common/mtk_vcodec_fw_vcp.h         | 13 +++++++
 .../vcodec/decoder/vdec/vdec_av1_req_lat_if.c | 35 ++++++++++++++++---
 .../decoder/vdec/vdec_h264_req_multi_if.c     |  6 +++-
 .../decoder/vdec/vdec_hevc_req_multi_if.c     |  7 ++--
 .../vcodec/decoder/vdec/vdec_vp9_req_lat_if.c | 22 ++++++++++--
 .../mediatek/vcodec/decoder/vdec_vpu_if.c     | 10 +++++-
 7 files changed, 108 insertions(+), 11 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vcp.c b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vcp.c
index ece4e3e87..468c4bf4e 100644
--- a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vcp.c
+++ b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vcp.c
@@ -483,8 +483,31 @@ static unsigned int mtk_vcodec_vcp_get_vdec_capa(struct mtk_vcodec_fw *fw)
 	       MTK_VDEC_IS_SUPPORT_10BIT | MTK_VDEC_IS_SUPPORT_EXT;
 }
 
-static void *mtk_vcodec_vcp_dm_addr(struct mtk_vcodec_fw *fw, u32 dtcm_dmem_addr)
+static unsigned int mtk_vcodec_vcp_get_venc_capa(struct mtk_vcodec_fw *fw)
 {
+	return 0;
+}
+
+static void *mtk_vcodec_vcp_dm_addr(struct mtk_vcodec_fw *fw, u32 mem_type)
+{
+	unsigned char *vsi_core = fw->vcp->vsi_core_addr;
+
+	switch (mem_type) {
+	case ENCODER_MEM:
+	case VCODEC_LAT_MEM:
+		return fw->vcp->vsi_addr;
+	case VCODEC_CORE_MEM:
+		return vsi_core;
+	case VP9_FRAME_MEM:
+		return vsi_core + VCODEC_VSI_LEN;
+	case AV1_CDF_MEM:
+		return vsi_core + VCODEC_VSI_LEN + VP9_FRAME_SIZE;
+	case AV1_IQ_MEM:
+		return vsi_core + VCODEC_VSI_LEN + VP9_FRAME_SIZE + AV1_CDF_SIZE;
+	default:
+		break;
+	}
+
 	return NULL;
 }
 
@@ -549,6 +572,7 @@ static void mtk_vcodec_vcp_release(struct mtk_vcodec_fw *fw)
 static const struct mtk_vcodec_fw_ops mtk_vcodec_vcp_msg = {
 	.load_firmware = mtk_vcodec_vcp_load_firmware,
 	.get_vdec_capa = mtk_vcodec_vcp_get_vdec_capa,
+	.get_venc_capa = mtk_vcodec_vcp_get_venc_capa,
 	.map_dm_addr = mtk_vcodec_vcp_dm_addr,
 	.ipi_register = mtk_vcodec_vcp_set_ipi_register,
 	.ipi_send = mtk_vcodec_vcp_ipi_send,
diff --git a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vcp.h b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vcp.h
index 97ba642dc..79504bb2d 100644
--- a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vcp.h
+++ b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vcp.h
@@ -13,6 +13,19 @@ typedef void (*vcp_ipi_handler_t) (void *data, unsigned int len, void *priv);
 #define VCP_SHARE_BUF_SIZE 64
 
 #define VCODEC_VSI_LEN (0x2000)
+#define VP9_FRAME_SIZE (0x1000)
+#define AV1_CDF_SIZE (0xFE80)
+#define AV1_IQ_TABLE_SIZE (0x12200)
+
+/* enum mtk_vcp_mem_type - memory type for different hardware */
+enum mtk_vcp_mem_type {
+	ENCODER_MEM,
+	VCODEC_LAT_MEM,
+	VCODEC_CORE_MEM,
+	VP9_FRAME_MEM,
+	AV1_CDF_MEM,
+	AV1_IQ_MEM,
+};
 
 /* enum mtk_vcp_ipi_index - index used to separate different hardware */
 enum mtk_vcp_ipi_index {
diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_av1_req_lat_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_av1_req_lat_if.c
index 756fbb777..4932ef469 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_av1_req_lat_if.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_av1_req_lat_if.c
@@ -765,6 +765,15 @@ static void *vdec_av1_get_ctrl_ptr(struct mtk_vcodec_dec_ctx *ctx, int id)
 	return ctrl->p_cur.p;
 }
 
+static u32 vdec_av1_get_cdf_table_addr(struct mtk_vcodec_dec_ctx *ctx,
+				       struct vdec_av1_slice_init_vsi *vsi)
+{
+	if (mtk_vcodec_fw_get_type(ctx->dev->fw_handler) == VCP)
+		return AV1_CDF_MEM;
+	else
+		return (u32)vsi->cdf_table_addr;
+}
+
 static int vdec_av1_slice_init_cdf_table(struct vdec_av1_slice_instance *instance)
 {
 	u8 *remote_cdf_table;
@@ -775,7 +784,7 @@ static int vdec_av1_slice_init_cdf_table(struct vdec_av1_slice_instance *instanc
 	ctx = instance->ctx;
 	vsi = instance->vpu.vsi;
 	remote_cdf_table = mtk_vcodec_fw_map_dm_addr(ctx->dev->fw_handler,
-						     (u32)vsi->cdf_table_addr);
+						     vdec_av1_get_cdf_table_addr(ctx, vsi));
 	if (IS_ERR(remote_cdf_table)) {
 		mtk_vdec_err(ctx, "failed to map cdf table\n");
 		return PTR_ERR(remote_cdf_table);
@@ -796,6 +805,15 @@ static int vdec_av1_slice_init_cdf_table(struct vdec_av1_slice_instance *instanc
 	return 0;
 }
 
+static u32 vdec_av1_get_iq_table_addr(struct mtk_vcodec_dec_ctx *ctx,
+				      struct vdec_av1_slice_init_vsi *vsi)
+{
+	if (mtk_vcodec_fw_get_type(ctx->dev->fw_handler) == VCP)
+		return AV1_IQ_MEM;
+	else
+		return (u32)vsi->iq_table_addr;
+}
+
 static int vdec_av1_slice_init_iq_table(struct vdec_av1_slice_instance *instance)
 {
 	u8 *remote_iq_table;
@@ -806,7 +824,7 @@ static int vdec_av1_slice_init_iq_table(struct vdec_av1_slice_instance *instance
 	ctx = instance->ctx;
 	vsi = instance->vpu.vsi;
 	remote_iq_table = mtk_vcodec_fw_map_dm_addr(ctx->dev->fw_handler,
-						    (u32)vsi->iq_table_addr);
+						    vdec_av1_get_iq_table_addr(ctx, vsi));
 	if (IS_ERR(remote_iq_table)) {
 		mtk_vdec_err(ctx, "failed to map iq table\n");
 		return PTR_ERR(remote_iq_table);
@@ -1873,6 +1891,15 @@ static int vdec_av1_slice_update_core(struct vdec_av1_slice_instance *instance,
 	return 0;
 }
 
+static u32 vdec_av1_get_core_vsi_addr(struct mtk_vcodec_dec_ctx *ctx,
+				      struct vdec_av1_slice_init_vsi *vsi)
+{
+	if (mtk_vcodec_fw_get_type(ctx->dev->fw_handler) == VCP)
+		return VCODEC_CORE_MEM;
+	else
+		return (u32)vsi->core_vsi;
+}
+
 static int vdec_av1_slice_init(struct mtk_vcodec_dec_ctx *ctx)
 {
 	struct vdec_av1_slice_instance *instance;
@@ -1904,8 +1931,8 @@ static int vdec_av1_slice_init(struct mtk_vcodec_dec_ctx *ctx)
 		goto error_vsi;
 	}
 	instance->init_vsi = vsi;
-	instance->core_vsi = mtk_vcodec_fw_map_dm_addr(ctx->dev->fw_handler, (u32)vsi->core_vsi);
-
+	instance->core_vsi = mtk_vcodec_fw_map_dm_addr(ctx->dev->fw_handler,
+						       vdec_av1_get_core_vsi_addr(ctx, vsi));
 	if (!instance->core_vsi) {
 		mtk_vdec_err(ctx, "failed to get AV1 core vsi\n");
 		ret = -EINVAL;
diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_multi_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_multi_if.c
index 69d607171..544d3bc06 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_multi_if.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_multi_if.c
@@ -1233,7 +1233,11 @@ static int vdec_h264_slice_init(struct mtk_vcodec_dec_ctx *ctx)
 		vsi_size = round_up(vsi_size, VCODEC_DEC_ALIGNED_64);
 		inst->vsi_ext = inst->vpu.vsi;
 		temp = (unsigned char *)inst->vsi_ext;
-		inst->vsi_core_ext = (struct vdec_h264_slice_vsi_ext *)(temp + vsi_size);
+		if (mtk_vcodec_fw_get_type(ctx->dev->fw_handler) == VCP)
+			inst->vsi_core_ext =
+				mtk_vcodec_fw_map_dm_addr(ctx->dev->fw_handler, VCODEC_CORE_MEM);
+		else
+			inst->vsi_core_ext = (struct vdec_h264_slice_vsi_ext *)(temp + vsi_size);
 
 		if (inst->ctx->dev->vdec_pdata->hw_arch == MTK_VDEC_PURE_SINGLE_CORE)
 			inst->decode = vdec_h264_slice_single_decode_ext;
diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_hevc_req_multi_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_hevc_req_multi_if.c
index dd638ef44..a5dd42987 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_hevc_req_multi_if.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_hevc_req_multi_if.c
@@ -879,8 +879,11 @@ static int vdec_hevc_slice_init(struct mtk_vcodec_dec_ctx *ctx)
 
 	vsi_size = round_up(sizeof(struct vdec_hevc_slice_vsi), VCODEC_DEC_ALIGNED_64);
 	inst->vsi = inst->vpu.vsi;
-	inst->vsi_core =
-		(struct vdec_hevc_slice_vsi *)(((char *)inst->vpu.vsi) + vsi_size);
+	if (mtk_vcodec_fw_get_type(ctx->dev->fw_handler) == VCP)
+		inst->vsi_core = mtk_vcodec_fw_map_dm_addr(ctx->dev->fw_handler, VCODEC_CORE_MEM);
+	else
+		inst->vsi_core =
+			(struct vdec_hevc_slice_vsi *)(((char *)inst->vpu.vsi) + vsi_size);
 
 	inst->resolution_changed = true;
 	inst->realloc_mv_buf = true;
diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c
index b49268678..ee4d1cd82 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c
@@ -500,6 +500,15 @@ static DEFINE_MUTEX(vdec_vp9_slice_frame_ctx_lock);
 
 static int vdec_vp9_slice_core_decode(struct vdec_lat_buf *lat_buf);
 
+static u32 vdec_vp9_get_frame_ctx_addr(struct mtk_vcodec_dec_ctx *ctx,
+				       struct vdec_vp9_slice_init_vsi *vsi)
+{
+	if (mtk_vcodec_fw_get_type(ctx->dev->fw_handler) == VCP)
+		return VP9_FRAME_MEM;
+	else
+		return (u32)vsi->default_frame_ctx;
+}
+
 static int vdec_vp9_slice_init_default_frame_ctx(struct vdec_vp9_slice_instance *instance)
 {
 	struct vdec_vp9_slice_frame_ctx *remote_frame_ctx;
@@ -514,7 +523,7 @@ static int vdec_vp9_slice_init_default_frame_ctx(struct vdec_vp9_slice_instance
 		return -EINVAL;
 
 	remote_frame_ctx = mtk_vcodec_fw_map_dm_addr(ctx->dev->fw_handler,
-						     (u32)vsi->default_frame_ctx);
+						     vdec_vp9_get_frame_ctx_addr(ctx, vsi));
 	if (!remote_frame_ctx) {
 		mtk_vdec_err(ctx, "failed to map default frame ctx\n");
 		return -EINVAL;
@@ -1831,6 +1840,15 @@ static int vdec_vp9_slice_update_core(struct vdec_vp9_slice_instance *instance,
 	return 0;
 }
 
+static u32 vdec_vp9_get_core_vsi_addr(struct mtk_vcodec_dec_ctx *ctx,
+				      struct vdec_vp9_slice_init_vsi *vsi)
+{
+	if (mtk_vcodec_fw_get_type(ctx->dev->fw_handler) == VCP)
+		return VCODEC_CORE_MEM;
+	else
+		return (u32)vsi->core_vsi;
+}
+
 static int vdec_vp9_slice_init(struct mtk_vcodec_dec_ctx *ctx)
 {
 	enum mtk_vcodec_fw_type fw_type = ctx->dev->fw_handler->type;
@@ -1864,7 +1882,7 @@ static int vdec_vp9_slice_init(struct mtk_vcodec_dec_ctx *ctx)
 	}
 	instance->init_vsi = vsi;
 	instance->core_vsi = mtk_vcodec_fw_map_dm_addr(ctx->dev->fw_handler,
-						       (u32)vsi->core_vsi);
+						       vdec_vp9_get_core_vsi_addr(ctx, vsi));
 	if (!instance->core_vsi) {
 		mtk_vdec_err(ctx, "failed to get VP9 core vsi\n");
 		ret = -EINVAL;
diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec_vpu_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec_vpu_if.c
index b35759a0b..cdb673e6b 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/vdec_vpu_if.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec_vpu_if.c
@@ -9,6 +9,14 @@
 #include "vdec_ipi_msg.h"
 #include "vdec_vpu_if.h"
 
+static u32 vpu_dec_get_vsi_addr(struct vdec_vpu_inst *vpu, const struct vdec_vpu_ipi_init_ack *msg)
+{
+	if (mtk_vcodec_fw_get_type(vpu->ctx->dev->fw_handler) == VCP)
+		return VCODEC_LAT_MEM;
+	else
+		return msg->vpu_inst_addr;
+}
+
 static void handle_init_ack_msg(const struct vdec_vpu_ipi_init_ack *msg)
 {
 	struct vdec_vpu_inst *vpu = (struct vdec_vpu_inst *)
@@ -19,7 +27,7 @@ static void handle_init_ack_msg(const struct vdec_vpu_ipi_init_ack *msg)
 	/* mapping VPU address to kernel virtual address */
 	/* the content in vsi is initialized to 0 in VPU */
 	vpu->vsi = mtk_vcodec_fw_map_dm_addr(vpu->ctx->dev->fw_handler,
-					     msg->vpu_inst_addr);
+					     vpu_dec_get_vsi_addr(vpu, msg));
 	vpu->inst_addr = msg->vpu_inst_addr;
 
 	mtk_vdec_debug(vpu->ctx, "- vpu_inst_addr = 0x%x", vpu->inst_addr);
-- 
2.51.0.windows.2

