Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D05AA39A7F4;
	Sat, 10 Oct 2026 08:07:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.61.82.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791619662; cv=none; b=Sk2Wua2pHoBR1uAZvNtT/GlLI7YBzqSfbbiADz3WllSk+K63pfX7uF3FjmpZij8oN2eFOh6rQFVYmzRRRJ5oOS8UM2ThA5N7zpJwAXW1N1SkL7e9LroBmefyg3OOElFW7T7jBBI94GhgoHM9WhpU1LeFenp+0gcztJH9y6Ra8vM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791619662; c=relaxed/simple;
	bh=GzxAE0fwW1nX92Gp/629zKbCVuoqG3XOxo5cDcGOOSo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IHAdz7t14ZuAMF7mcYtuD0D8iUhvq7RGzgy+fnX4RRf4sPgZFWXil8cspXI5EciVzO/WAfUiW87jCVfUTymrektew5PCz56RRm97shy/HvWXx3AxB4lwDOhwISdyxeIvUnsqHIXIcaL9c/TcRravwZcDRH60TNOGy1s+LY80UCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=uBYXPK+6; arc=none smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="uBYXPK+6"
X-UUID: a78ad28ac48111f18dc8c9802ae25ab1-20261010
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=+OW8tTSCFzMhIHhbZF7r32KMo8bVPe6J+saiKq+/0SA=;
	b=uBYXPK+6lHQwzA1DStp6BH5artCE457OXRpAS4tuKRNZkLcQzjPWk1I6/gtTxuLFnfSR65hVdn4sF+HVZRx6EIEerOxyUwGn4HLNciwJFaQ3HfgGTOb27BlZ3dWv5HdaviPMuerM/p7Y9QAaLDRf5+sApQ7jw9H930WQbZ4I3Vk=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.20,REQID:421e9764-0b64-4e6d-bc17-1fd78e230af7,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:291e20b,CLOUDID:7dfeecb8-514b-419b-be8a-53f1868a3ee6,B
	ulkID:nil,BulkQuantity:0,SF:81|82|102|836|865|888|898,TC:-5,Content:0|15|5
	0|99,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI:0,
	OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: a78ad28ac48111f18dc8c9802ae25ab1-20261010
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw02.mediatek.com
	(envelope-from <kyrie.wu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 94330763; Sat, 10 Oct 2026 16:07:36 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Sat, 10 Oct 2026 16:07:35 +0800
Received: from gcnsap21.gcn.mediatek.inc (10.17.81.22) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Sat, 10 Oct 2026 16:07:34 +0800
From: Kyrie Wu <kyrie.wu@mediatek.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Bin Liu <bin.liu@mediatek.com>,
	kyrie wu <kyrie.wu@mediatek.corp-partner.google.com>, Hans Verkuil
	<hverkuil@kernel.org>, irui wang <irui.wang@mediatek.com>, Nicolas Dufresne
	<nicolas.dufresne@collabora.com>, <linux-media@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
CC: Kyrie Wu <kyrie.wu@mediatek.com>
Subject: [PATCH v18 13/13] media: mediatek: jpeg: add jpeg smmu sid setting
Date: Sat, 10 Oct 2026 16:07:17 +0800
Message-ID: <844186eba43ba7e3c956ad9264cd4ae41a0f2548.1791614327.git.kyrie.wu@mediatek.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1791614327.git.kyrie.wu@mediatek.com>
References: <cover.1791614327.git.kyrie.wu@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N

Add a configuration to set jpeg dec & enc smmu sid

Signed-off-by: Kyrie Wu <kyrie.wu@mediatek.com>
Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
---
 .../platform/mediatek/jpeg/mtk_jpeg_core.c    | 29 +++++++++++++++++++
 .../platform/mediatek/jpeg/mtk_jpeg_core.h    | 15 ++++++++++
 .../platform/mediatek/jpeg/mtk_jpeg_dec_hw.c  | 23 +++++++++++++++
 .../platform/mediatek/jpeg/mtk_jpeg_enc_hw.c  | 23 +++++++++++++++
 4 files changed, 90 insertions(+)

diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
index 8e96501..bb9bdd9 100644
--- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
+++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
@@ -15,6 +15,7 @@
 #include <linux/of_platform.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
+#include <linux/regmap.h>
 #include <linux/slab.h>
 #include <linux/spinlock.h>
 #include <media/v4l2-event.h>
@@ -1602,6 +1603,22 @@ static irqreturn_t mtk_jpeg_enc_done(struct mtk_jpeg_dev *jpeg)
 	return IRQ_HANDLED;
 }
 
+static void mtk_jpeg_set_smmu_sid(struct regmap *smmu_regmap, unsigned int sid)
+{
+	if (sid == JPG_REG_GUSER_ID_DEC_SID)
+		regmap_update_bits(smmu_regmap, JPEG_DEC_SMMU_SID,
+				   JPG_REG_GUSER_ID_MASK <<
+				   JPG_REG_DEC_GUSER_ID_SHIFT,
+				   JPG_REG_GUSER_ID_DEC_SID <<
+				   JPG_REG_DEC_GUSER_ID_SHIFT);
+	else
+		regmap_update_bits(smmu_regmap, JPEG_ENC_SMMU_SID,
+				   JPG_REG_GUSER_ID_MASK <<
+				   JPG_REG_ENC_GUSER_ID_SHIFT,
+				   JPG_REG_GUSER_ID_ENC_SID <<
+				   JPG_REG_ENC_GUSER_ID_SHIFT);
+}
+
 static void mtk_jpegenc_worker(struct work_struct *work)
 {
 	struct mtk_jpegenc_comp_dev *comp_jpeg[MTK_JPEGENC_HW_MAX];
@@ -1663,6 +1680,11 @@ static void mtk_jpegenc_worker(struct work_struct *work)
 	jpeg_dst_buf->frame_num = ctx->total_frame_num;
 	ctx->total_frame_num++;
 	mtk_jpeg_enc_reset(comp_jpeg[hw_id]->reg_base);
+
+	if (jpeg->variant->support_smmu && comp_jpeg[hw_id]->smmu_regmap)
+		mtk_jpeg_set_smmu_sid(comp_jpeg[hw_id]->smmu_regmap,
+				      JPG_REG_GUSER_ID_ENC_SID);
+
 	mtk_jpeg_set_enc_dst(ctx,
 			     comp_jpeg[hw_id]->reg_base,
 			     &dst_buf->vb2_buf);
@@ -1772,6 +1794,11 @@ static void mtk_jpegdec_worker(struct work_struct *work)
 	jpeg_dst_buf->frame_num = ctx->total_frame_num;
 	ctx->total_frame_num++;
 	mtk_jpeg_dec_reset(comp_jpeg[hw_id]->reg_base);
+
+	if (jpeg->variant->support_smmu && comp_jpeg[hw_id]->smmu_regmap)
+		mtk_jpeg_set_smmu_sid(comp_jpeg[hw_id]->smmu_regmap,
+				      JPG_REG_GUSER_ID_DEC_SID);
+
 	mtk_jpeg_dec_set_config(comp_jpeg[hw_id]->reg_base,
 				jpeg->variant->support_34bit,
 				&jpeg_src_buf->dec_param,
@@ -1931,6 +1958,7 @@ static struct mtk_jpeg_variant mtk8196_jpegenc_drvdata = {
 	.multi_core = true,
 	.jpeg_worker = mtk_jpegenc_worker,
 	.support_34bit = true,
+	.support_smmu = true,
 };
 
 static const struct mtk_jpeg_variant mtk8195_jpegdec_drvdata = {
@@ -1958,6 +1986,7 @@ static const struct mtk_jpeg_variant mtk8196_jpegdec_drvdata = {
 	.multi_core = true,
 	.jpeg_worker = mtk_jpegdec_worker,
 	.support_34bit = true,
+	.support_smmu = true,
 };
 
 static const struct of_device_id mtk_jpeg_match[] = {
diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.h b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.h
index 148fd41..186cd18 100644
--- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.h
+++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.h
@@ -11,6 +11,7 @@
 
 #include <linux/clk.h>
 #include <linux/interrupt.h>
+#include <linux/mfd/syscon.h>
 #include <media/v4l2-ctrls.h>
 #include <media/v4l2-device.h>
 #include <media/v4l2-fh.h>
@@ -34,6 +35,14 @@
 
 #define MTK_JPEG_MAX_EXIF_SIZE	(64 * 1024)
 
+#define JPEG_DEC_SMMU_SID				0
+#define JPEG_ENC_SMMU_SID				0
+#define JPG_REG_GUSER_ID_MASK			0x7
+#define JPG_REG_GUSER_ID_DEC_SID		0x4
+#define JPG_REG_GUSER_ID_ENC_SID		0x5
+#define JPG_REG_DEC_GUSER_ID_SHIFT		8
+#define JPG_REG_ENC_GUSER_ID_SHIFT		4
+
 #define MTK_JPEG_ADDR_MASK GENMASK(1, 0)
 
 /**
@@ -65,6 +74,7 @@ enum mtk_jpeg_ctx_state {
  * @multi_core:		mark jpeg hw is multi_core or not
  * @jpeg_worker:		jpeg dec or enc worker
  * @support_34bit:	flag to check support for 34-bit DMA address
+ * @support_smmu:	flag to check if support smmu
  */
 struct mtk_jpeg_variant {
 	struct clk_bulk_data *clks;
@@ -82,6 +92,7 @@ struct mtk_jpeg_variant {
 	bool multi_core;
 	void (*jpeg_worker)(struct work_struct *work);
 	bool support_34bit;
+	bool support_smmu;
 };
 
 struct mtk_jpeg_src_buf {
@@ -150,6 +161,7 @@ struct mtk_jpegdec_clk {
  * @hw_param:		jpeg encode hw parameters
  * @hw_state:		record hw state
  * @hw_lock:		spinlock protecting the hw device resource
+ * @smmu_regmap:	SMMU registers mapping
  */
 struct mtk_jpegenc_comp_dev {
 	struct device *dev;
@@ -163,6 +175,7 @@ struct mtk_jpegenc_comp_dev {
 	enum mtk_jpeg_hw_state hw_state;
 	/* spinlock protecting the hw device resource */
 	spinlock_t hw_lock;
+	struct regmap *smmu_regmap;
 };
 
 /**
@@ -177,6 +190,7 @@ struct mtk_jpegenc_comp_dev {
  * @hw_param:			jpeg decode hw parameters
  * @hw_state:			record hw state
  * @hw_lock:			spinlock protecting hw
+ * @smmu_regmap:		SMMU registers mapping
  */
 struct mtk_jpegdec_comp_dev {
 	struct device *dev;
@@ -190,6 +204,7 @@ struct mtk_jpegdec_comp_dev {
 	enum mtk_jpeg_hw_state hw_state;
 	/* spinlock protecting the hw device resource */
 	spinlock_t hw_lock;
+	struct regmap *smmu_regmap;
 };
 
 /**
diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c
index 2bd2c3f..dfea301 100644
--- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c
+++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c
@@ -613,6 +613,25 @@ static int mtk_jpegdec_hw_init_irq(struct mtk_jpegdec_comp_dev *dev)
 	return 0;
 }
 
+static int mtk_jpegdec_smmu_init(struct mtk_jpegdec_comp_dev *dev)
+{
+	struct mtk_jpeg_dev *master_dev = dev->master_dev;
+
+	if (!master_dev->variant->support_smmu)
+		return 0;
+
+	dev->smmu_regmap =
+		syscon_regmap_lookup_by_phandle(dev->plat_dev->dev.of_node,
+						"mediatek,smmu-config");
+	if (IS_ERR(dev->smmu_regmap)) {
+		return dev_err_probe(dev->dev, PTR_ERR(dev->smmu_regmap),
+				     "mmap smmu_base failed(%pe)\n",
+				     dev->smmu_regmap);
+	}
+
+	return 0;
+}
+
 static int mtk_jpegdec_hw_probe(struct platform_device *pdev)
 {
 	struct mtk_jpegdec_clk *jpegdec_clk;
@@ -665,6 +684,10 @@ static int mtk_jpegdec_hw_probe(struct platform_device *pdev)
 	master_dev->reg_decbase[i] = dev->reg_base;
 	dev->master_dev = master_dev;
 
+	ret = mtk_jpegdec_smmu_init(dev);
+	if (ret)
+		return ret;
+
 	platform_set_drvdata(pdev, dev);
 	pm_runtime_enable(&pdev->dev);
 
diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c
index 7c6474c..cd91bc0 100644
--- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c
+++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c
@@ -338,6 +338,25 @@ static int mtk_jpegenc_hw_init_irq(struct mtk_jpegenc_comp_dev *dev)
 	return 0;
 }
 
+static int mtk_jpegenc_smmu_init(struct mtk_jpegenc_comp_dev *dev)
+{
+	struct mtk_jpeg_dev *master_dev = dev->master_dev;
+
+	if (!master_dev->variant->support_smmu)
+		return 0;
+
+	dev->smmu_regmap =
+		syscon_regmap_lookup_by_phandle(dev->plat_dev->dev.of_node,
+						"mediatek,smmu-config");
+	if (IS_ERR(dev->smmu_regmap)) {
+		return dev_err_probe(dev->dev, PTR_ERR(dev->smmu_regmap),
+				     "mmap smmu_base failed(%pe)\n",
+				     dev->smmu_regmap);
+	}
+
+	return 0;
+}
+
 static int mtk_jpegenc_hw_probe(struct platform_device *pdev)
 {
 	struct mtk_jpegenc_clk *jpegenc_clk;
@@ -388,6 +407,10 @@ static int mtk_jpegenc_hw_probe(struct platform_device *pdev)
 	master_dev->reg_encbase[i] = dev->reg_base;
 	dev->master_dev = master_dev;
 
+	ret = mtk_jpegenc_smmu_init(dev);
+	if (ret)
+		return ret;
+
 	platform_set_drvdata(pdev, dev);
 	pm_runtime_enable(&pdev->dev);
 
-- 
2.51.0.windows.2

