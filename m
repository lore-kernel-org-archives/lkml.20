Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 516B03F4DF3;
	Mon, 14 Sep 2026 07:34:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.61.82.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789371282; cv=none; b=dptk2YJWPBSVIUJ0i8hv6Rm8ltov7B9CyuUb06BLijmuLLm6WbQE3ob1C5/cSWlnpMjmUXoTWzvdIKVSIBqGa3l2C5BShwMtLxjpoIUExzJrM3LcrP1bhO8HS5tqdvnUR41U6ZZmVD9Jv94/SSEPTYFhR2XkmvEtKzCu3f5tsaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789371282; c=relaxed/simple;
	bh=GHdeLYyeE8xD+G9sQ2PG4zIK5RqatIvD6MVoVTydbuw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JwDOms6sE4vRPRXe+TnbVu9uj3LYuh6et6qspxj3grJ5/4uVQ7wC8mDszcDRLq1mb3SKgu3PrNX942Wmg4GqD1oSPo3kKLoa+9hQX54xS1CcQ+9rPQTkV8anzyMC3N4zQ1MsjRZs/MCvZVvhGoRSvu12H+mmYfoLPHfBzgVPtbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=WvM8i3Kw; arc=none smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="WvM8i3Kw"
X-UUID: b98cc204b00e11f18dc8c9802ae25ab1-20260914
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=jydOWwyWG5XusoBfc0mQalh/h5uQRX9LP+eGbL/HLiE=;
	b=WvM8i3KwcLEY62gOn/GqSEaza4/JAng5EYr7ZEFnjnlImOGs6j8Bb/SjGzXOlBAK+eT22mD4hl8DRC08eRyzcToIue00jmdK4Md6fytw+ZOmgHDRQkPcKkmn14iRF3e+IM4vbvI5jiyuxDedKeKfnY4GEexzWeTEWW0pPUjAnQo=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:b4d9e113-da58-4627-b462-99e681b19f8f,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:7db8b62,CLOUDID:33c2cee2-72a5-4ba1-af40-18bbd6ea8ffd,B
	ulkID:nil,BulkQuantity:0,SF:81|82|102|836|865|888|898,TC:-5,Content:0|15|5
	0|99,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI:0,
	OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: b98cc204b00e11f18dc8c9802ae25ab1-20260914
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <irui.wang@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 224400386; Mon, 14 Sep 2026 15:34:31 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 14 Sep 2026 15:34:29 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Mon, 14 Sep 2026 15:34:28 +0800
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
Subject: [PATCH v8 2/6] media: mediatek: encoder: Add new platform data members
Date: Mon, 14 Sep 2026 15:34:17 +0800
Message-ID: <20260914073423.16131-3-irui.wang@mediatek.com>
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

Add new platform data members to support different encoder ICs:
- venc_model_num: encoder model number
- fw_type: firmware type (VPU, SCP, or VCP)
- fw_init: firmware-specific initialization callback
- ipi_id: IPI ID for encoder communication

This centralizes all static platform configuration in the platform
data structure, eliminating the need for runtime device tree parsing
and the per-device fw_init callback pointer. Each platform's pdata
now directly specifies its firmware initialization function.

Changes:
1. Add venc_model_num to pdata and remove mtk_vcodec_enc_get_chip_name()
2. Add fw_type to pdata for each platform (VPU or SCP)
3. Add ipi_id field declaration to pdata
4. Remove device tree parsing for fw_type

Signed-off-by: Irui Wang <irui.wang@mediatek.com>
---
 .../mediatek/vcodec/encoder/mtk_vcodec_enc.c  | 22 +---------
 .../vcodec/encoder/mtk_vcodec_enc_drv.c       | 41 +++++++++++--------
 .../vcodec/encoder/mtk_vcodec_enc_drv.h       | 10 ++++-
 3 files changed, 35 insertions(+), 38 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc.c b/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc.c
index 48cb5dded..fcf0e4f90 100644
--- a/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc.c
+++ b/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc.c
@@ -198,33 +198,15 @@ static int vidioc_enum_fmt_vid_out(struct file *file, void *priv,
 			       pdata->num_output_formats);
 }
 
-static int mtk_vcodec_enc_get_chip_name(struct mtk_vcodec_enc_ctx *ctx)
-{
-	struct device *dev = &ctx->dev->plat_dev->dev;
-
-	if (of_device_is_compatible(dev->of_node, "mediatek,mt8173-vcodec-enc"))
-		return 8173;
-	else if (of_device_is_compatible(dev->of_node, "mediatek,mt8183-vcodec-enc"))
-		return 8183;
-	else if (of_device_is_compatible(dev->of_node, "mediatek,mt8192-vcodec-enc"))
-		return 8192;
-	else if (of_device_is_compatible(dev->of_node, "mediatek,mt8195-vcodec-enc"))
-		return 8195;
-	else if (of_device_is_compatible(dev->of_node, "mediatek,mt8188-vcodec-enc"))
-		return 8188;
-	else
-		return 8173;
-}
-
 static int vidioc_venc_querycap(struct file *file, void *priv,
 				struct v4l2_capability *cap)
 {
 	struct mtk_vcodec_enc_ctx *ctx = file_to_enc_ctx(file);
+	const struct mtk_vcodec_enc_pdata *pdata = ctx->dev->venc_pdata;
 	struct device *dev = &ctx->dev->plat_dev->dev;
-	int platform_name = mtk_vcodec_enc_get_chip_name(ctx);
 
 	strscpy(cap->driver, dev->driver->name, sizeof(cap->driver));
-	snprintf(cap->card, sizeof(cap->card), "MT%d video encoder", platform_name);
+	snprintf(cap->card, sizeof(cap->card), "MT%d video encoder", pdata->venc_model_num);
 
 	return 0;
 }
diff --git a/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc_drv.c b/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc_drv.c
index 811bc62a1..eb4a74ad6 100644
--- a/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc_drv.c
+++ b/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc_drv.c
@@ -245,8 +245,6 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
 {
 	struct mtk_vcodec_enc_dev *dev;
 	struct video_device *vfd_enc;
-	phandle rproc_phandle;
-	enum mtk_vcodec_fw_type fw_type;
 	int ret;
 
 	dev = devm_kzalloc(&pdev->dev, sizeof(*dev), GFP_KERNEL);
@@ -256,25 +254,18 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
 	INIT_LIST_HEAD(&dev->ctx_list);
 	dev->plat_dev = pdev;
 
-	if (!of_property_read_u32(pdev->dev.of_node, "mediatek,vpu",
-				  &rproc_phandle)) {
-		fw_type = VPU;
-		dev->fw_init = mtk_vcodec_fw_vpu_init;
-	} else if (!of_property_read_u32(pdev->dev.of_node, "mediatek,scp",
-					 &rproc_phandle)) {
-		fw_type = SCP;
-		dev->fw_init = mtk_vcodec_fw_scp_init;
-	} else {
-		dev_err(&pdev->dev, "[MTK VCODEC] Could not get venc IPI device");
+	dev->venc_pdata = of_device_get_match_data(&pdev->dev);
+	if (!dev->venc_pdata) {
+		dev_err(&pdev->dev, "Failed to get match data");
 		return -ENODEV;
 	}
-	dma_set_max_seg_size(&pdev->dev, UINT_MAX);
-
-	dev->fw_handler = mtk_vcodec_fw_select(dev, ENCODER, dev->fw_init);
+	dev->fw_handler = mtk_vcodec_fw_select(dev, ENCODER,
+					      dev->venc_pdata->fw_init);
 	if (IS_ERR(dev->fw_handler))
 		return PTR_ERR(dev->fw_handler);
 
-	dev->venc_pdata = of_device_get_match_data(&pdev->dev);
+	dma_set_max_seg_size(&pdev->dev, UINT_MAX);
+
 	ret = mtk_vcodec_init_enc_clk(dev);
 	if (ret < 0) {
 		dev_err(&pdev->dev, "[MTK VCODEC] Failed to get mtk vcodec clock source!");
@@ -389,6 +380,7 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
 }
 
 static const struct mtk_vcodec_enc_pdata mt8173_avc_pdata = {
+	.venc_model_num = 8173,
 	.capture_formats = mtk_video_formats_capture_h264,
 	.num_capture_formats = ARRAY_SIZE(mtk_video_formats_capture_h264),
 	.output_formats = mtk_video_formats_output,
@@ -396,9 +388,12 @@ static const struct mtk_vcodec_enc_pdata mt8173_avc_pdata = {
 	.min_bitrate = 64,
 	.max_bitrate = 60000000,
 	.core_id = VENC_SYS,
+	.fw_type = VPU,
+	.fw_init = mtk_vcodec_fw_vpu_init,
 };
 
 static const struct mtk_vcodec_enc_pdata mt8173_vp8_pdata = {
+	.venc_model_num = 8173,
 	.capture_formats = mtk_video_formats_capture_vp8,
 	.num_capture_formats = ARRAY_SIZE(mtk_video_formats_capture_vp8),
 	.output_formats = mtk_video_formats_output,
@@ -406,9 +401,12 @@ static const struct mtk_vcodec_enc_pdata mt8173_vp8_pdata = {
 	.min_bitrate = 64,
 	.max_bitrate = 9000000,
 	.core_id = VENC_LT_SYS,
+	.fw_type = VPU,
+	.fw_init = mtk_vcodec_fw_vpu_init,
 };
 
 static const struct mtk_vcodec_enc_pdata mt8183_pdata = {
+	.venc_model_num = 8183,
 	.uses_ext = true,
 	.capture_formats = mtk_video_formats_capture_h264,
 	.num_capture_formats = ARRAY_SIZE(mtk_video_formats_capture_h264),
@@ -417,9 +415,12 @@ static const struct mtk_vcodec_enc_pdata mt8183_pdata = {
 	.min_bitrate = 64,
 	.max_bitrate = 40000000,
 	.core_id = VENC_SYS,
+	.fw_type = SCP,
+	.fw_init = mtk_vcodec_fw_scp_init,
 };
 
 static const struct mtk_vcodec_enc_pdata mt8188_pdata = {
+	.venc_model_num = 8188,
 	.uses_ext = true,
 	.capture_formats = mtk_video_formats_capture_h264,
 	.num_capture_formats = ARRAY_SIZE(mtk_video_formats_capture_h264),
@@ -429,9 +430,12 @@ static const struct mtk_vcodec_enc_pdata mt8188_pdata = {
 	.max_bitrate = 50000000,
 	.core_id = VENC_SYS,
 	.uses_34bit = true,
+	.fw_type = SCP,
+	.fw_init = mtk_vcodec_fw_scp_init,
 };
 
 static const struct mtk_vcodec_enc_pdata mt8192_pdata = {
+	.venc_model_num = 8192,
 	.uses_ext = true,
 	.capture_formats = mtk_video_formats_capture_h264,
 	.num_capture_formats = ARRAY_SIZE(mtk_video_formats_capture_h264),
@@ -440,9 +444,12 @@ static const struct mtk_vcodec_enc_pdata mt8192_pdata = {
 	.min_bitrate = 64,
 	.max_bitrate = 100000000,
 	.core_id = VENC_SYS,
+	.fw_type = SCP,
+	.fw_init = mtk_vcodec_fw_scp_init,
 };
 
 static const struct mtk_vcodec_enc_pdata mt8195_pdata = {
+	.venc_model_num = 8195,
 	.uses_ext = true,
 	.capture_formats = mtk_video_formats_capture_h264,
 	.num_capture_formats = ARRAY_SIZE(mtk_video_formats_capture_h264),
@@ -451,6 +458,8 @@ static const struct mtk_vcodec_enc_pdata mt8195_pdata = {
 	.min_bitrate = 64,
 	.max_bitrate = 100000000,
 	.core_id = VENC_SYS,
+	.fw_type = SCP,
+	.fw_init = mtk_vcodec_fw_scp_init,
 };
 
 static const struct of_device_id mtk_vcodec_enc_match[] = {
diff --git a/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc_drv.h b/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc_drv.h
index 934ff6481..6c7e8da6d 100644
--- a/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc_drv.h
+++ b/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc_drv.h
@@ -20,6 +20,7 @@
 /**
  * struct mtk_vcodec_enc_pdata - compatible data for each IC
  *
+ * @venc_model_num: encoder model number
  * @uses_ext: whether the encoder uses the extended firmware messaging format
  * @min_bitrate: minimum supported encoding bitrate
  * @max_bitrate: maximum supported encoding bitrate
@@ -29,8 +30,12 @@
  * @num_output_formats: number of entries in output_formats
  * @core_id: stand for h264 or vp8 encode index
  * @uses_34bit: whether the encoder uses 34-bit iova
+ * @fw_type: firmware type (VPU, SCP, or VCP)
+ * @fw_init: firmware-specific initialization callback
+ * @ipi_id: IPI ID for encoder communication with firmware
  */
 struct mtk_vcodec_enc_pdata {
+	u16 venc_model_num;
 	bool uses_ext;
 	u64 min_bitrate;
 	u64 max_bitrate;
@@ -40,6 +45,9 @@ struct mtk_vcodec_enc_pdata {
 	size_t num_output_formats;
 	u8 core_id;
 	bool uses_34bit;
+	enum mtk_vcodec_fw_type fw_type;
+	struct mtk_vcodec_fw *(*fw_init)(void *priv, enum mtk_vcodec_fw_use fw_use);
+	int ipi_id;
 };
 
 /*
@@ -174,7 +182,6 @@ struct mtk_vcodec_enc_ctx {
  * @venc_pdata: encoder IC-specific data
  *
  * @fw_handler: used to communicate with the firmware.
- * @fw_init: firmware-specific init callback selected at probe time
  * @id_counter: used to identify current opened instance
  *
  * @enc_mutex: encoder hardware lock.
@@ -202,7 +209,6 @@ struct mtk_vcodec_enc_dev {
 	const struct mtk_vcodec_enc_pdata *venc_pdata;
 
 	struct mtk_vcodec_fw *fw_handler;
-	struct mtk_vcodec_fw *(*fw_init)(void *priv, enum mtk_vcodec_fw_use fw_use);
 	u64 id_counter;
 
 	/* encoder hardware mutex lock */
-- 
2.55.0.windows.3

