Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=60.244.123.138
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794886225;
	b=Q29hNHuGUza7dIjUqiz3i+97Ki0U33B8S5EnBljIhTwxdFkIvQnJ9XPl4efmXpelsAAT
	 6n8Uc0q/WVseJ4f+li6og9z7ld6IxqSF56QJOnzq9QjU9lDC8zSN8Uzm1aQApM37v/Qna
	 4LHE91+qThtNJ3601S4G6el7i7ZMv982ap/xB4w49wNKUb085TQqyBz4C50GPew2mbD/C
	 prQ82G8zGNL2FPoY6V/Ap6iCUWQ0ttcYvmlatwmecZ8rxVYIeH80O8F+SPIeL0sAONimQ
	 t2dg0KyWVE33TA4Y6J5pr7d27Dxn6VrlE8ThiyNuU/WP9XNtaWi11SLyd4ePaGmY3qQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794886225;
	h=DMARC-Filter:X-UUID:DKIM-Signature:X-CID-P-RULE:X-CID-O-INFO:
	 X-CID-META:X-CID-BVR:X-CID-BAS:X-CID-FACTOR:X-CID-RHF:X-UUID:Received:
	 Received:Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 Content-Type:X-MTK;
	bh=0apghHnuQxUiE5aXAgd429Vt6lLW+tTk14XHzF5IIbo=;
	b=IxhhBJNk4TF3CbH3xgrv0u0RlfPMkTpU2HGcp5BzmNKyxLduLVKa/pnA/jSAYNgwhOkz
	 M2llFAt3/BsscWVho5UduTN/PNPud9SdMLfkiIL4O9gilLXzcQYQKnIbGaZF2rvp6GJJk
	 Vml6rQ9K4C2qmUPZNqcWNY9wSQoDi66OrTZGUQKaTy3relGMmhiw64ybTQVLMwcS5WidR
	 93ww0HI24wW/KGkwIXilYND6s6ipM/ahI92NS0nSp8X/n1TCglPp0Zxnp/2NZN3q8x6q1
	 5OAAks5H78SR/Y5fxWzySWOjgME4Z0jkVKjsqGljRCizOPpi/UJJWlYFriyhRb78YGg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mediatek.com;
	spf=pass smtp.mailfrom=mediatek.com;
	dkim=pass header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=bfqBPAMZ;
	arc=none smtp.remote-ip=60.244.123.138
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBC6B60A5BD4;
	Tue, 17 Nov 2026 03:30:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EBC6B60A5BD4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=bfqBPAMZ
X-UUID: 35cc4bf0e23711f1b1788b6acf885367-20261117
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=0apghHnuQxUiE5aXAgd429Vt6lLW+tTk14XHzF5IIbo=;
	b=bfqBPAMZv5eeFhgGxMYhpmMxecy6vPl58kD4nKZFEzmuGBXBJA4BG6hwYVce5TeKDYTAPNhd4wr/suCryKjIC1ISQUF5cJ0jDSA1pNWUjRN77zNgR4I0wHm5K+6PeHgW16RsZW7TSu+B7vgs0/NW7YM9nQIaRGH2Eya7EBijbns=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.21,REQID:bf5cc917-9226-4cd1-b3a4-be49e9eeddb5,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:b0318ac,CLOUDID:379c6466-4b51-4c95-bb1b-80ac6aad9c96,B
	ulkID:nil,BulkQuantity:0,SF:81|82|102|136|836|865|888|898,TC:-5,Content:0|
	15|50|99,EDM:-3|-100,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,CO
	L:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 35cc4bf0e23711f1b1788b6acf885367-20261117
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw01.mediatek.com
	(envelope-from <kyrie.wu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1850646592; Tue, 17 Nov 2026 11:30:17 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 MTKMBS09N1.mediatek.inc (172.21.101.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 17 Nov 2026 11:30:16 +0800
Received: from gcnsap21.gcn.mediatek.inc (10.17.81.22) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Tue, 17 Nov 2026 11:30:15 +0800
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
Subject: [PATCH v9 14/14] media: mediatek: decoder: support av1 extend vsi
Date: Tue, 17 Nov 2026 11:29:50 +0800
Message-ID: <20261117032950.1425556-15-kyrie.wu@mediatek.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261117032950.1425556-1-kyrie.wu@mediatek.com>
References: <20261117032950.1425556-1-kyrie.wu@mediatek.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N

The driver can't access tile buffer address for extend architecture,
set tile group information in vcp and share it with kernel.

Signed-off-by: Kyrie Wu <kyrie.wu@mediatek.com>
---
 .../vcodec/decoder/vdec/vdec_av1_req_lat_if.c | 71 ++++++++++++++++---
 1 file changed, 60 insertions(+), 11 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_av1_req_lat_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_av1_req_lat_if.c
index 2d6e08e72..97ca80fd0 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_av1_req_lat_if.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_av1_req_lat_if.c
@@ -25,6 +25,9 @@
 
 #define AV1_INVALID_IDX			-1
 
+#define AV1_NON_EXT_VSI_SIZE		0xD50
+#define AV1_TILE_SIZE			64
+
 #define AV1_DIV_ROUND_UP_POW2(value, n)			\
 ({							\
 	typeof(n) _n  = n;				\
@@ -641,6 +644,8 @@ struct vdec_av1_slice_fb {
  * @frame:		current frame info
  * @state:		status after decode done
  * @cur_lst_tile_id:	tile id for large scale
+ * @tile_group:	tile group info
+ * @reserved:		reserved
  */
 struct vdec_av1_slice_vsi {
 	/* lat */
@@ -665,6 +670,8 @@ struct vdec_av1_slice_vsi {
 	struct vdec_av1_slice_frame frame;
 	struct vdec_av1_slice_state state;
 	u32 cur_lst_tile_id;
+	struct vdec_av1_slice_tile_group tile_group;
+	unsigned int reserved[4];
 };
 
 /**
@@ -702,6 +709,7 @@ struct vdec_av1_slice_pfc {
  * @init_vsi:           vsi used for initialized AV1 instance
  * @vsi:                vsi used for decoding/flush ...
  * @core_vsi:           vsi used for Core stage
+ * @vsi_size:           validated remote vsi size
  * @seq:                global picture sequence
  */
 struct vdec_av1_slice_instance {
@@ -734,6 +742,7 @@ struct vdec_av1_slice_instance {
 		struct vdec_av1_slice_vsi *vsi;
 	};
 	struct vdec_av1_slice_vsi *core_vsi;
+	u32 vsi_size;
 	int seq;
 };
 
@@ -1073,9 +1082,10 @@ static inline void vdec_av1_slice_vsi_from_remote(struct vdec_av1_slice_vsi *vsi
 }
 
 static inline void vdec_av1_slice_vsi_to_remote(struct vdec_av1_slice_vsi *vsi,
-						struct vdec_av1_slice_vsi *remote_vsi)
+						struct vdec_av1_slice_vsi *remote_vsi,
+						u32 vsi_size)
 {
-	memcpy(remote_vsi, vsi, sizeof(*vsi));
+	memcpy(remote_vsi, vsi, vsi_size);
 }
 
 static int vdec_av1_slice_setup_lat_from_src_buf(struct vdec_av1_slice_instance *instance,
@@ -1403,17 +1413,29 @@ static void vdec_av1_slice_setup_uh(struct vdec_av1_slice_instance *instance,
 	vdec_av1_slice_setup_tile(frame, &ctrl_fh->tile_info);
 }
 
+static
+struct vdec_av1_slice_tile_group *vdec_av1_get_tile_group(struct vdec_av1_slice_instance *instance,
+							  struct vdec_av1_slice_vsi *vsi)
+{
+	if (IS_VDEC_SUPPORT_EXT(instance->ctx->dev->dec_capability))
+		return &vsi->tile_group;
+	else
+		return &instance->tile_group;
+}
+
 static int vdec_av1_slice_setup_tile_group(struct vdec_av1_slice_instance *instance,
 					   struct vdec_av1_slice_vsi *vsi)
 {
 	struct v4l2_ctrl_av1_tile_group_entry *ctrl_tge;
-	struct vdec_av1_slice_tile_group *tile_group = &instance->tile_group;
+	struct vdec_av1_slice_tile_group *tile_group;
 	struct vdec_av1_slice_uncompressed_header *uh = &vsi->frame.uh;
 	struct vdec_av1_slice_tile *tile = &uh->tile;
 	struct v4l2_ctrl *ctrl;
 	u32 tge_size;
 	int i;
 
+	tile_group = vdec_av1_get_tile_group(instance, vsi);
+
 	ctrl = v4l2_ctrl_find(&instance->ctx->ctrl_hdl, V4L2_CID_STATELESS_AV1_TILE_GROUP_ENTRY);
 	if (!ctrl)
 		return -EINVAL;
@@ -1608,6 +1630,15 @@ static int vdec_av1_slice_setup_pfc(struct vdec_av1_slice_instance *instance,
 	return ret;
 }
 
+static u32 vdec_av1_get_tiles_num(struct vdec_av1_slice_instance *instance,
+				  struct vdec_av1_slice_vsi *vsi)
+{
+	if (IS_VDEC_SUPPORT_EXT(instance->ctx->dev->dec_capability))
+		return vsi->tile_group.num_tiles;
+	else
+		return instance->tile_group.num_tiles;
+}
+
 static void vdec_av1_slice_setup_lat_buffer(struct vdec_av1_slice_instance *instance,
 					    struct vdec_av1_slice_vsi *vsi,
 					    struct mtk_vcodec_mem *bs,
@@ -1648,12 +1679,18 @@ static void vdec_av1_slice_setup_lat_buffer(struct vdec_av1_slice_instance *inst
 
 	vsi->tile.buf = instance->tile.dma_addr;
 	vsi->tile.size = instance->tile.size;
-	memcpy(lat_buf->tile_addr.va, instance->tile.va, 64 * instance->tile_group.num_tiles);
 
 	vsi->cdf_table.buf = instance->cdf_table.dma_addr;
 	vsi->cdf_table.size = instance->cdf_table.size;
 	vsi->iq_table.buf = instance->iq_table.dma_addr;
 	vsi->iq_table.size = instance->iq_table.size;
+
+	/* lat_buf is used to share hardware decoder syntax between lat and core,
+	 * there isn't only one. But there is only one tile.va for each instance.
+	 * Need to copy tile information to lat_buf every time.
+	 */
+	memcpy(lat_buf->tile_addr.va, instance->tile.va,
+	       AV1_TILE_SIZE * vdec_av1_get_tiles_num(instance, vsi));
 }
 
 static void vdec_av1_slice_setup_seg_buffer(struct vdec_av1_slice_instance *instance,
@@ -1676,7 +1713,7 @@ static void vdec_av1_slice_setup_tile_buffer(struct vdec_av1_slice_instance *ins
 					     struct vdec_av1_slice_vsi *vsi,
 					     struct mtk_vcodec_mem *bs)
 {
-	struct vdec_av1_slice_tile_group *tile_group = &instance->tile_group;
+	struct vdec_av1_slice_tile_group *tile_group;
 	struct vdec_av1_slice_uncompressed_header *uh = &vsi->frame.uh;
 	struct vdec_av1_slice_tile *tile = &uh->tile;
 	u32 tile_num, tile_row, tile_col;
@@ -1687,6 +1724,8 @@ static void vdec_av1_slice_setup_tile_buffer(struct vdec_av1_slice_instance *ins
 	u32 *tile_info_buf = instance->tile.va;
 	u64 pa = (u64)bs->dma_addr;
 
+	tile_group = vdec_av1_get_tile_group(instance, vsi);
+
 	if (uh->disable_cdf_update == 0)
 		allow_update_cdf = 1;
 
@@ -1909,7 +1948,7 @@ static int vdec_av1_slice_init(struct mtk_vcodec_dec_ctx *ctx)
 	struct vdec_av1_slice_instance *instance;
 	struct vdec_av1_slice_init_vsi *vsi;
 	enum mtk_vcodec_fw_type fw_type = ctx->dev->fw_handler->type;
-	int ret;
+	int ret, vsi_size = AV1_NON_EXT_VSI_SIZE;
 
 	instance = kzalloc_obj(*instance);
 	if (!instance)
@@ -1943,10 +1982,20 @@ static int vdec_av1_slice_init(struct mtk_vcodec_dec_ctx *ctx)
 		goto error_vsi;
 	}
 
-	if (vsi->vsi_size != sizeof(struct vdec_av1_slice_vsi))
-		mtk_vdec_err(ctx, "remote vsi size 0x%x mismatch! expected: 0x%zx\n",
-			     vsi->vsi_size, sizeof(struct vdec_av1_slice_vsi));
+	if (IS_VDEC_SUPPORT_EXT(ctx->dev->dec_capability)) {
+		vsi_size = sizeof(struct vdec_av1_slice_vsi);
+		vsi->iq_table_size = AV1_IQ_TABLE_SIZE;
+		vsi->cdf_table_size = AV1_CDF_SIZE;
+	}
+
+	if (vsi->vsi_size != vsi_size) {
+		mtk_vdec_err(ctx, "remote vsi size 0x%x mismatch! expected: 0x%x\n",
+			     vsi->vsi_size, vsi_size);
+		ret = -EINVAL;
+		goto error_vsi;
+	}
 
+	instance->vsi_size = vsi_size;
 	instance->irq_enabled = 1;
 	instance->inneracing_mode = IS_VDEC_INNER_RACING(instance->ctx->dev->dec_capability);
 
@@ -2105,7 +2154,7 @@ static int vdec_av1_slice_lat_decode(void *h_vdec, struct mtk_vcodec_mem *bs,
 		goto err_free_fb_out;
 	}
 
-	vdec_av1_slice_vsi_to_remote(vsi, instance->vsi);
+	vdec_av1_slice_vsi_to_remote(vsi, instance->vsi, instance->vsi_size);
 	ret = vpu_dec_start(&instance->vpu, NULL, 0);
 	if (ret) {
 		mtk_vdec_err(ctx, "failed to dec AV1 ret %d\n", ret);
@@ -2196,7 +2245,7 @@ static int vdec_av1_slice_core_decode(struct vdec_lat_buf *lat_buf)
 		mtk_vdec_err(ctx, "vdec_av1_slice_setup_core\n");
 		goto err;
 	}
-	vdec_av1_slice_vsi_to_remote(&pfc->vsi, instance->core_vsi);
+	vdec_av1_slice_vsi_to_remote(&pfc->vsi, instance->core_vsi, instance->vsi_size);
 	ret = vpu_dec_core(&instance->vpu);
 	if (ret) {
 		mtk_vdec_err(ctx, "vpu_dec_core\n");
-- 
2.51.0.windows.2

