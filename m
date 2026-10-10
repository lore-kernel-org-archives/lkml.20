Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E2193B8D78;
	Sat, 10 Oct 2026 08:36:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.244.123.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791621415; cv=none; b=sRxFbCrI4KdaGVNctxuCAfvYTwOqUtnXwiMl3Mp7+8nhMgqgv7gr4qPyDHKh9ExVqP5hnFF1C2oxPjS+Q8cWFeJ3BTM9MQTPFl16x4EyG0mhNUJHHmTDiEmAGyPR3RVMShg8DMNmd9KLDSPJx7Ih5VEai4aX1lt6uffva7DXrZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791621415; c=relaxed/simple;
	bh=pX4rrQs97PyQN4dXMucH5CmxQiBM1Pp1ljihUaFqTeM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=khqLBcoVnELXcJPiZLHDdOC4383N/3MdG7kB9DipQ84P7La1+6PCmt0aL1T13XBXrE67WxBgmJAVbFK2tNuyHfl3/bt8YR71VN0L8MQbrRY9DFvL+Gb8sOM32nbgtg6KmzHMdLqr/K+LZbrSjPF40SE+Ta874lC3JWzedSzxqtE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=sZaHOfX7; arc=none smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="sZaHOfX7"
X-UUID: b705d3dcc48511f1b1788b6acf885367-20261010
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=gHkee2r523b439WdtPLwa7ae+EG8NSMOQIiS08/78AU=;
	b=sZaHOfX715ee9yu4HwWhbUWm3IyuiYI+iocx35BY70A6AlMyZsp7MgH+Od0U6JlAP/K684ogE+/ALJjatI7FR+0yTtGjILOMyZsx3eZrbN7tMYMxIK1nf2mWHxxjJIwFiFexNe40pk8vbRnUKWuCW1zDM2rf2qNiOEgCPLTFpKA=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.20,REQID:de262505-1d6d-4861-b466-af84d576b466,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:291e20b,CLOUDID:b6822c20-2f17-48f6-b8a0-2bb5971c52b4,B
	ulkID:nil,BulkQuantity:0,SF:81|82|102|136|836|865|888|898,TC:-5,Content:0|
	15|50|99,EDM:-3|-100,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL
	:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: b705d3dcc48511f1b1788b6acf885367-20261010
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw01.mediatek.com
	(envelope-from <kyrie.wu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 468845839; Sat, 10 Oct 2026 16:36:40 +0800
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Sat, 10 Oct 2026 16:36:39 +0800
Received: from gcnsap21.gcn.mediatek.inc (10.17.81.22) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Sat, 10 Oct 2026 16:36:37 +0800
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
Subject: [PATCH v8 14/14] media: mediatek: decoder: support av1 extend vsi
Date: Sat, 10 Oct 2026 16:36:13 +0800
Message-ID: <1ed11835bd1833066e162035a2529eda1304edcd.1791619743.git.kyrie.wu@mediatek.com>
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

The driver can't access tile buffer address for extend architecture,
set tile group information in vcp and share it with kernel.

Signed-off-by: Kyrie Wu <kyrie.wu@mediatek.com>
---
 .../vcodec/decoder/vdec/vdec_av1_req_lat_if.c | 59 ++++++++++++++++---
 1 file changed, 52 insertions(+), 7 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_av1_req_lat_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_av1_req_lat_if.c
index 2d6e08e7..664adde3 100644
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
@@ -1403,17 +1410,29 @@ static void vdec_av1_slice_setup_uh(struct vdec_av1_slice_instance *instance,
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
@@ -1608,6 +1627,15 @@ static int vdec_av1_slice_setup_pfc(struct vdec_av1_slice_instance *instance,
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
@@ -1648,12 +1676,18 @@ static void vdec_av1_slice_setup_lat_buffer(struct vdec_av1_slice_instance *inst
 
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
@@ -1676,7 +1710,7 @@ static void vdec_av1_slice_setup_tile_buffer(struct vdec_av1_slice_instance *ins
 					     struct vdec_av1_slice_vsi *vsi,
 					     struct mtk_vcodec_mem *bs)
 {
-	struct vdec_av1_slice_tile_group *tile_group = &instance->tile_group;
+	struct vdec_av1_slice_tile_group *tile_group;
 	struct vdec_av1_slice_uncompressed_header *uh = &vsi->frame.uh;
 	struct vdec_av1_slice_tile *tile = &uh->tile;
 	u32 tile_num, tile_row, tile_col;
@@ -1687,6 +1721,8 @@ static void vdec_av1_slice_setup_tile_buffer(struct vdec_av1_slice_instance *ins
 	u32 *tile_info_buf = instance->tile.va;
 	u64 pa = (u64)bs->dma_addr;
 
+	tile_group = vdec_av1_get_tile_group(instance, vsi);
+
 	if (uh->disable_cdf_update == 0)
 		allow_update_cdf = 1;
 
@@ -1909,7 +1945,7 @@ static int vdec_av1_slice_init(struct mtk_vcodec_dec_ctx *ctx)
 	struct vdec_av1_slice_instance *instance;
 	struct vdec_av1_slice_init_vsi *vsi;
 	enum mtk_vcodec_fw_type fw_type = ctx->dev->fw_handler->type;
-	int ret;
+	int ret, vsi_size = AV1_NON_EXT_VSI_SIZE;
 
 	instance = kzalloc_obj(*instance);
 	if (!instance)
@@ -1943,9 +1979,18 @@ static int vdec_av1_slice_init(struct mtk_vcodec_dec_ctx *ctx)
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
 
 	instance->irq_enabled = 1;
 	instance->inneracing_mode = IS_VDEC_INNER_RACING(instance->ctx->dev->dec_capability);
