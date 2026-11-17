Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=60.244.123.138
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794905935;
	b=RNrRAh0SZd4nQLHkeJYAUkuQZNfjAaaeuhumzoHRX9QmQDVckvR4H0L7APmtueeXj0ts
	 x5y+kdlstKn02ySvg+SRhEyMEzb9ePXtoNztxU7jes5hYoF2iFdQAGlbedUapOVmZiYq1
	 1JGKv2fwrZ8r3Vnj/JkV23y3f3SFZPYUkFDJYQDVF8qfxoRLVf+GvJigSMJVwSkfgkcrp
	 Pbsla0mt56bJOi8qxewcfanWhieazEliPgmWkV5F0MvF6NzneA2Cxzo7G96rw1vRkGkgZ
	 TTORA3YY2bgwfvW8639K6TpZmt9eDD3weUSBHHJNHCl79WL6MrAjOaiwMq91Kx7PO9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794905935;
	h=DMARC-Filter:X-UUID:DKIM-Signature:X-CID-P-RULE:X-CID-O-INFO:
	 X-CID-META:X-CID-BVR:X-CID-BAS:X-CID-FACTOR:X-CID-RHF:X-UUID:Received:
	 Received:Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 Content-Type:X-MTK;
	bh=nCW5JUiSWScnM34N5ReCIW0JKR5PHJjbfsyYRUUVOIs=;
	b=PNtCUj6d0JN5w662cto40YfRcxynG694lIDSobRW+hhEsi+ut0WsHTdUwOrle5xZH7ML
	 t0NTBjO0leNirKH4YALh2BgtxOeRRObg9ATu64VKaCbWv0lc6pprYKuDy3VUohgRKI5um
	 EquRRXYoJDjeO3C+4iLCCt7/z3RggDxwCsbjGIvwKRmGr1ci68gt5W0lhaskkD+V3oVY2
	 5Mmry7CF2XuyCtj9B3xtRPjVNnOX32KoGpDzoP7W2kq/ry9UUFKC4OIgogfGIKYr229fX
	 Xzt4Wrc2AvX1bG1JNHfq+uiSVlp9ceTHfA8C+owDtp4KDHeJkZt/UsVyC0yEKt7iJww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mediatek.com;
	spf=pass smtp.mailfrom=mediatek.com;
	dkim=pass header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=RfHyJbNe;
	arc=none smtp.remote-ip=60.244.123.138
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76D1F606A8B9;
	Tue, 17 Nov 2026 08:58:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 76D1F606A8B9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=RfHyJbNe
X-UUID: 16e83a04e26511f1b1788b6acf885367-20261117
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=nCW5JUiSWScnM34N5ReCIW0JKR5PHJjbfsyYRUUVOIs=;
	b=RfHyJbNeeJHSnFZ8RyJk1tjQP5F/esxSvrc8qdQPeqyoIdBB93XCkILpcJgKmPYgZjC0EBCCO51Py1cR6uxsa0XOUdIz4hTP2ypNNEhg9dPP/Xjoybf6M8Y/+v+InWCTEBLIwcq20jmB9syt+zp2LQIqWK5AVW9afdp+HXRIODg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.21,REQID:5dc4f62f-0d11-48c0-81aa-c7596918d96f,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:b0318ac,CLOUDID:8b38af19-ae4c-4a2b-b1c4-72e411efd0c9,B
	ulkID:nil,BulkQuantity:0,SF:81|82|102|836|865|888|898,TC:-5,Content:0|15|5
	0|99,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0
	,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 16e83a04e26511f1b1788b6acf885367-20261117
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <kyrie.wu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1523882965; Tue, 17 Nov 2026 16:58:42 +0800
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 17 Nov 2026 16:58:41 +0800
Received: from gcnsap21.gcn.mediatek.inc (10.17.81.22) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Tue, 17 Nov 2026 16:58:40 +0800
From: Kyrie Wu <kyrie.wu@mediatek.com>
To: Tiffany Lin <tiffany.lin@mediatek.com>, Andrew-CT Chen
	<andrew-ct.chen@mediatek.com>, Yunfei Dong <yunfei.dong@mediatek.com>, Mauro
 Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Kyrie Wu <kyrie.wu@mediatek.com>,
	Hans Verkuil <hverkuil@xs4all.nl>, Nicolas Dufresne
	<nicolas.dufresne@collabora.com>, Nathan Hebert <nhebert@chromium.org>, Arnd
 Bergmann <arnd@arndb.de>, Irui Wang <irui.wang@mediatek.com>, George Sun
	<george.sun@mediatek.com>, <linux-media@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
CC: Neil Armstrong <neil.armstrong@linaro.org>, Andrzej Pietrasiewicz
	<andrzejtp2010@gmail.com>, Yilong Zhou <yilong.zhou@mediatek.com>
Subject: [PATCH v12 03/10] media: mediatek: decoder: Move firmware selection to platform data
Date: Tue, 17 Nov 2026 16:58:26 +0800
Message-ID: <20261117085834.1464723-4-kyrie.wu@mediatek.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261117085834.1464723-1-kyrie.wu@mediatek.com>
References: <20261117085834.1464723-1-kyrie.wu@mediatek.com>
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

The decoder currently selects its firmware backend by testing optional
mediatek,vpu, mediatek,scp, and mediatek,vcp properties in the device
tree.  The firmware backend is, however, fixed by the decoder compatible.

Add the firmware type and initialization callback to the decoder platform
data, initialize them for each supported SoC, and use the callback from
the platform data at probe time.  This matches the existing encoder
platform-data design and removes the DT-property dependency.

Fixes: bf1d556ad4e0 ("media: mtk-vcodec: abstract firmware interface")
Fixes: c7244811b1c9 ("media: mtk-vcodec: add SCP firmware ops")
Fixes: c3da5e939cbc ("media: mediatek: vcodec: support vcp architecture")
Signed-off-by: Kyrie Wu <kyrie.wu@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../vcodec/decoder/mtk_vcodec_dec_drv.c         | 17 ++---------------
 .../vcodec/decoder/mtk_vcodec_dec_drv.h         |  7 +++++--
 .../vcodec/decoder/mtk_vcodec_dec_stateful.c    |  2 ++
 .../vcodec/decoder/mtk_vcodec_dec_stateless.c   | 12 ++++++++++++
 4 files changed, 21 insertions(+), 17 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c
index 75e495b1a..b8f19c481 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c
@@ -340,7 +340,6 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
 {
 	struct mtk_vcodec_dec_dev *dev;
 	struct video_device *vfd_dec;
-	phandle rproc_phandle;
 	int i, ret;
 
 	dev = devm_kzalloc_obj(&pdev->dev, *dev);
@@ -352,19 +351,6 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
 
 	dev->vdec_pdata = of_device_get_match_data(&pdev->dev);
 	mtk_vcodec_dec_get_chip_model(dev);
-	if (!of_property_read_u32(pdev->dev.of_node, "mediatek,vpu",
-				  &rproc_phandle)) {
-		dev->fw_init = mtk_vcodec_fw_vpu_init;
-	} else if (!of_property_read_u32(pdev->dev.of_node, "mediatek,scp",
-					 &rproc_phandle)) {
-		dev->fw_init = mtk_vcodec_fw_scp_init;
-	} else if (!of_property_read_u32(pdev->dev.of_node, "mediatek,vcp",
-					 &rproc_phandle)) {
-		dev->fw_init = mtk_vcodec_fw_vcp_init;
-	} else {
-		dev_dbg(&pdev->dev, "Could not get vdec IPI device");
-		return -ENODEV;
-	}
 	dma_set_max_seg_size(&pdev->dev, UINT_MAX);
 	if (dev->chip_model == 8196) {
 		ret = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(36));
@@ -374,7 +360,8 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
 		}
 	}
 
-	dev->fw_handler = mtk_vcodec_fw_select(dev, DECODER, dev->fw_init);
+	dev->fw_handler = mtk_vcodec_fw_select(dev, DECODER,
+					      dev->vdec_pdata->fw_init);
 	if (IS_ERR(dev->fw_handler))
 		return PTR_ERR(dev->fw_handler);
 
diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h
index 153c617df..d7ed7bfe7 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h
+++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h
@@ -97,6 +97,8 @@ struct vdec_pic_info {
  *
  * @is_subdev_supported: whether support parent-node architecture(subdev)
  * @uses_stateless_api: whether the decoder uses the stateless API with requests
+ * @fw_type: firmware type (VPU, SCP, or VCP)
+ * @fw_init: firmware-specific initialization callback
  * @chip_model: platforms configuration values
  */
 struct mtk_vcodec_dec_pdata {
@@ -119,6 +121,9 @@ struct mtk_vcodec_dec_pdata {
 
 	bool is_subdev_supported;
 	bool uses_stateless_api;
+	enum mtk_vcodec_fw_type fw_type;
+	struct mtk_vcodec_fw *(*fw_init)(void *priv,
+					 enum mtk_vcodec_fw_use fw_use);
 	unsigned int chip_model;
 };
 
@@ -243,7 +248,6 @@ struct mtk_vcodec_dec_ctx {
  * @vdecsys_regmap: VDEC_SYS register space passed through syscon
  *
  * @fw_handler: used to communicate with the firmware.
- * @fw_init: firmware-specific init callback selected at probe time
  * @id_counter: used to identify current opened instance
  *
  * @dec_mutex: decoder hardware lock
@@ -285,7 +289,6 @@ struct mtk_vcodec_dec_dev {
 	struct regmap *vdecsys_regmap;
 
 	struct mtk_vcodec_fw *fw_handler;
-	struct mtk_vcodec_fw *(*fw_init)(void *priv, enum mtk_vcodec_fw_use fw_use);
 	u64 id_counter;
 
 	/* decoder hardware mutex lock */
diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateful.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateful.c
index 0e702d6a4..e7ae90e82 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateful.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateful.c
@@ -618,5 +618,7 @@ const struct mtk_vcodec_dec_pdata mtk_vdec_8173_pdata = {
 	.flush_decoder = mtk_vdec_flush_decoder,
 	.is_subdev_supported = false,
 	.hw_arch = MTK_VDEC_PURE_SINGLE_CORE,
+	.fw_type = VPU,
+	.fw_init = mtk_vcodec_fw_vpu_init,
 	.chip_model = 8173,
 };
diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c
index 5ecbfc169..2a03395ab 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c
@@ -935,6 +935,8 @@ const struct mtk_vcodec_dec_pdata mtk_vdec_8183_pdata = {
 	.get_cap_buffer = vdec_get_cap_buffer,
 	.is_subdev_supported = false,
 	.hw_arch = MTK_VDEC_PURE_SINGLE_CORE,
+	.fw_type = SCP,
+	.fw_init = mtk_vcodec_fw_scp_init,
 	.chip_model = 8183,
 };
 
@@ -974,24 +976,32 @@ const struct mtk_vcodec_dec_pdata mtk_lat_sig_core_pdata = {
 const struct mtk_vcodec_dec_pdata mtk_vdec_8188_pdata = {
 	MTK_STATELESS_DEC_DATA,
 	.hw_arch = MTK_VDEC_LAT_SINGLE_CORE,
+	.fw_type = SCP,
+	.fw_init = mtk_vcodec_fw_scp_init,
 	.chip_model = 8188,
 };
 
 const struct mtk_vcodec_dec_pdata mtk_vdec_8192_pdata = {
 	MTK_STATELESS_DEC_DATA,
 	.hw_arch = MTK_VDEC_LAT_SINGLE_CORE,
+	.fw_type = SCP,
+	.fw_init = mtk_vcodec_fw_scp_init,
 	.chip_model = 8192,
 };
 
 const struct mtk_vcodec_dec_pdata mtk_vdec_8195_pdata = {
 	MTK_STATELESS_DEC_DATA,
 	.hw_arch = MTK_VDEC_LAT_SINGLE_CORE,
+	.fw_type = SCP,
+	.fw_init = mtk_vcodec_fw_scp_init,
 	.chip_model = 8195,
 };
 
 const struct mtk_vcodec_dec_pdata mtk_vdec_8196_pdata = {
 	MTK_STATELESS_DEC_DATA,
 	.hw_arch = MTK_VDEC_LAT_SINGLE_CORE,
+	.fw_type = VCP,
+	.fw_init = mtk_vcodec_fw_vcp_init,
 	.chip_model = 8196,
 };
 
@@ -1015,5 +1025,7 @@ const struct mtk_vcodec_dec_pdata mtk_vdec_single_core_pdata = {
 const struct mtk_vcodec_dec_pdata mtk_vdec_8186_pdata = {
 	MTK_STATELESS_DEC_DATA,
 	.hw_arch = MTK_VDEC_PURE_SINGLE_CORE,
+	.fw_type = SCP,
+	.fw_init = mtk_vcodec_fw_scp_init,
 	.chip_model = 8186,
 };
-- 
2.51.0.windows.2

