Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE55335C6B5;
	Sat, 10 Oct 2026 08:36:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.244.123.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791621393; cv=none; b=sjZBgTN9xjKesyxfvQ0+gaoii8VXrjx0htbzNvZIJXHH8w58EaM0I6syk+Mqx4MgqlDhUEpASPzY2bdGD5coFrbmaLj2UuORDxJ744p2TEwB9/mKHhN2DbiztZrmoUeGMDY0mwmhecaVZAe9G2/fVRAkiqDzyLy6g/qUbUEpHDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791621393; c=relaxed/simple;
	bh=bAHXqaA75D+zpDc7JPxNusIdhdBWiwu7fAW1O5daJLg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ouXorzbx7EV1T/tvbo2P6tMt9mHnX0jQmRAAHy2Jr2HdIwFkekbk8JLAMeAb91MCC49pRR8eLcgvzh1XtatuX58rCMxH6cs/Vdvo0sOGy93SSTMCo/Y/eqrceztKKqCvB1g8j2hidyrVV5uiFLOR02x5bHxjgQ0RZTfICZJaKyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=fail (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=J07RoA/6 reason="signature verification failed"; arc=none smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="J07RoA/6"
X-UUID: ad4a1f1ac48511f1b1788b6acf885367-20261010
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=CdNonXnosvhCQRyhkYqbUr083fcLK6nmT3Wqr6LHZHo=;
	b=J07RoA/6kxpFzyK+ASGoUsV058yMl+JQUelUfwOLkqlIXb5IkE0b3oOQ6osxw3w3dMd43bqRJLxT1KgthrbMbAa/bpGBoBjRfTXg5np+cnQgAbulh0Ovosb6qgd3LmaBAB9t/plu3EoOwZmIIsstTsgao8hAhnROBmAztDtQ5EA=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.20,REQID:d7f7226c-9f0c-4d8d-bfb6-f72ef209e38e,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:291e20b,CLOUDID:0c28edb8-514b-419b-be8a-53f1868a3ee6,B
	ulkID:nil,BulkQuantity:0,SF:81|82|102|836|865|888|898,TC:-5,Content:0|15|5
	0|99,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI:0,
	OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: ad4a1f1ac48511f1b1788b6acf885367-20261010
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw01.mediatek.com
	(envelope-from <kyrie.wu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 113145304; Sat, 10 Oct 2026 16:36:24 +0800
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 MTKMBS09N1.mediatek.inc (172.21.101.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Sat, 10 Oct 2026 16:36:22 +0800
Received: from gcnsap21.gcn.mediatek.inc (10.17.81.22) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Sat, 10 Oct 2026 16:36:21 +0800
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
Subject: [PATCH v8 04/14] media: mediatek: vcodec: get different firmware ipi id
Date: Sat, 10 Oct 2026 16:36:03 +0800
Message-ID: <61d082035d1bd9f3394834963ca59defaf663370.1791619743.git.kyrie.wu@mediatek.com>
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

Getting ipi(inter-processor interrupt) id according to firmware
type and hardware index for different architecture.

Signed-off-by: Kyrie Wu <kyrie.wu@mediatek.com>
---
 .../mediatek/vcodec/common/mtk_vcodec_fw.c         | 14 ++++++++++++++
 .../mediatek/vcodec/common/mtk_vcodec_fw.h         |  1 +
 .../vcodec/decoder/vdec/vdec_av1_req_lat_if.c      |  5 +++--
 .../vcodec/decoder/vdec/vdec_h264_req_multi_if.c   |  5 +++--
 .../vcodec/decoder/vdec/vdec_hevc_req_multi_if.c   |  5 +++--
 .../mediatek/vcodec/decoder/vdec/vdec_vp8_req_if.c |  5 +++--
 .../vcodec/decoder/vdec/vdec_vp9_req_lat_if.c      |  5 +++--
 7 files changed, 30 insertions(+), 10 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw.c b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw.c
index 552d0d8a..8630e871 100644
--- a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw.c
+++ b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw.c
@@ -3,6 +3,20 @@
 #include "../decoder/mtk_vcodec_dec_drv.h"
 #include "../encoder/mtk_vcodec_enc_drv.h"
 #include "mtk_vcodec_fw_priv.h"
+#include "mtk_vcodec_fw_vcp.h"
+
+int mtk_vcodec_fw_get_ipi(enum mtk_vcodec_fw_type type, int hw_id)
+{
+	switch (type) {
+	case SCP:
+		return hw_id == MTK_VDEC_LAT0 ? SCP_IPI_VDEC_LAT : SCP_IPI_VDEC_CORE;
+	case VCP:
+		return hw_id == MTK_VDEC_LAT0 ? VCP_IPI_LAT_DECODER : VCP_IPI_CORE_DECODER;
+	default:
+		return -EINVAL;
+	}
+}
+EXPORT_SYMBOL_GPL(mtk_vcodec_fw_get_ipi);
 
 struct mtk_vcodec_fw *mtk_vcodec_fw_select(void *priv, enum mtk_vcodec_fw_use fw_use,
 					   mtk_vcodec_fw_init_func fw_init)
diff --git a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw.h b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw.h
index 50d93d47..005ac996 100644
--- a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw.h
+++ b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw.h
@@ -43,5 +43,6 @@ int mtk_vcodec_fw_ipi_register(struct mtk_vcodec_fw *fw, int id,
 int mtk_vcodec_fw_ipi_send(struct mtk_vcodec_fw *fw, int id,
 			   void *buf, unsigned int len, unsigned int wait);
 int mtk_vcodec_fw_get_type(struct mtk_vcodec_fw *fw);
+int mtk_vcodec_fw_get_ipi(enum mtk_vcodec_fw_type type, int hw_id);
 
 #endif /* _MTK_VCODEC_FW_H_ */
diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_av1_req_lat_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_av1_req_lat_if.c
index 49d9b4a7..84d28a0b 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_av1_req_lat_if.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_av1_req_lat_if.c
@@ -1878,6 +1878,7 @@ static int vdec_av1_slice_init(struct mtk_vcodec_dec_ctx *ctx)
 {
 	struct vdec_av1_slice_instance *instance;
 	struct vdec_av1_slice_init_vsi *vsi;
+	enum mtk_vcodec_fw_type fw_type = ctx->dev->fw_handler->type;
 	int ret;
 
 	instance = kzalloc_obj(*instance);
@@ -1885,8 +1886,8 @@ static int vdec_av1_slice_init(struct mtk_vcodec_dec_ctx *ctx)
 		return -ENOMEM;
 
 	instance->ctx = ctx;
-	instance->vpu.id = SCP_IPI_VDEC_LAT;
-	instance->vpu.core_id = SCP_IPI_VDEC_CORE;
+	instance->vpu.id = mtk_vcodec_fw_get_ipi(fw_type, MTK_VDEC_LAT0);
+	instance->vpu.core_id = mtk_vcodec_fw_get_ipi(fw_type, MTK_VDEC_CORE);
 	instance->vpu.ctx = ctx;
 	instance->vpu.codec_type = ctx->current_codec;
 
diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_multi_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_multi_if.c
index 10359ce9..69d60717 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_multi_if.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_multi_if.c
@@ -1204,6 +1204,7 @@ static int vdec_h264_slice_single_decode(void *h_vdec, struct mtk_vcodec_mem *bs
 
 static int vdec_h264_slice_init(struct mtk_vcodec_dec_ctx *ctx)
 {
+	enum mtk_vcodec_fw_type fw_type = ctx->dev->fw_handler->type;
 	struct vdec_h264_slice_inst *inst;
 	int err, vsi_size;
 	unsigned char *temp;
@@ -1214,8 +1215,8 @@ static int vdec_h264_slice_init(struct mtk_vcodec_dec_ctx *ctx)
 
 	inst->ctx = ctx;
 
-	inst->vpu.id = SCP_IPI_VDEC_LAT;
-	inst->vpu.core_id = SCP_IPI_VDEC_CORE;
+	inst->vpu.id = mtk_vcodec_fw_get_ipi(fw_type, MTK_VDEC_LAT0);
+	inst->vpu.core_id = mtk_vcodec_fw_get_ipi(fw_type, MTK_VDEC_CORE);
 	inst->vpu.ctx = ctx;
 	inst->vpu.codec_type = ctx->current_codec;
 	inst->vpu.capture_type = ctx->capture_fourcc;
diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_hevc_req_multi_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_hevc_req_multi_if.c
index 02f39954..dd638ef4 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_hevc_req_multi_if.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_hevc_req_multi_if.c
@@ -855,6 +855,7 @@ static int vdec_hevc_slice_setup_core_buffer(struct vdec_hevc_slice_inst *inst,
 
 static int vdec_hevc_slice_init(struct mtk_vcodec_dec_ctx *ctx)
 {
+	enum mtk_vcodec_fw_type fw_type = ctx->dev->fw_handler->type;
 	struct vdec_hevc_slice_inst *inst;
 	int err, vsi_size;
 
@@ -864,8 +865,8 @@ static int vdec_hevc_slice_init(struct mtk_vcodec_dec_ctx *ctx)
 
 	inst->ctx = ctx;
 
-	inst->vpu.id = SCP_IPI_VDEC_LAT;
-	inst->vpu.core_id = SCP_IPI_VDEC_CORE;
+	inst->vpu.id = mtk_vcodec_fw_get_ipi(fw_type, MTK_VDEC_LAT0);
+	inst->vpu.core_id = mtk_vcodec_fw_get_ipi(fw_type, MTK_VDEC_CORE);
 	inst->vpu.ctx = ctx;
 	inst->vpu.codec_type = ctx->current_codec;
 	inst->vpu.capture_type = ctx->capture_fourcc;
diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp8_req_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp8_req_if.c
index 391e789a..d65e276f 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp8_req_if.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp8_req_if.c
@@ -272,6 +272,7 @@ static int vdec_vp8_slice_get_decode_parameters(struct vdec_vp8_slice_inst *inst
 
 static int vdec_vp8_slice_init(struct mtk_vcodec_dec_ctx *ctx)
 {
+	enum mtk_vcodec_fw_type fw_type = ctx->dev->fw_handler->type;
 	struct vdec_vp8_slice_inst *inst;
 	int err;
 
@@ -281,8 +282,8 @@ static int vdec_vp8_slice_init(struct mtk_vcodec_dec_ctx *ctx)
 
 	inst->ctx = ctx;
 
-	inst->vpu.id = SCP_IPI_VDEC_LAT;
-	inst->vpu.core_id = SCP_IPI_VDEC_CORE;
+	inst->vpu.id = mtk_vcodec_fw_get_ipi(fw_type, MTK_VDEC_LAT0);
+	inst->vpu.core_id = mtk_vcodec_fw_get_ipi(fw_type, MTK_VDEC_CORE);
 	inst->vpu.ctx = ctx;
 	inst->vpu.codec_type = ctx->current_codec;
 	inst->vpu.capture_type = ctx->capture_fourcc;
diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c
index ba7a1cd9..b4926867 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c
@@ -1833,6 +1833,7 @@ static int vdec_vp9_slice_update_core(struct vdec_vp9_slice_instance *instance,
 
 static int vdec_vp9_slice_init(struct mtk_vcodec_dec_ctx *ctx)
 {
+	enum mtk_vcodec_fw_type fw_type = ctx->dev->fw_handler->type;
 	struct vdec_vp9_slice_instance *instance;
 	struct vdec_vp9_slice_init_vsi *vsi;
 	int ret;
@@ -1842,8 +1843,8 @@ static int vdec_vp9_slice_init(struct mtk_vcodec_dec_ctx *ctx)
 		return -ENOMEM;
 
 	instance->ctx = ctx;
-	instance->vpu.id = SCP_IPI_VDEC_LAT;
-	instance->vpu.core_id = SCP_IPI_VDEC_CORE;
+	instance->vpu.id = mtk_vcodec_fw_get_ipi(fw_type, MTK_VDEC_LAT0);
+	instance->vpu.core_id = mtk_vcodec_fw_get_ipi(fw_type, MTK_VDEC_CORE);
 	instance->vpu.ctx = ctx;
 	instance->vpu.codec_type = ctx->current_codec;
 
