Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=210.61.82.184
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794792862;
	b=09RZzPtVjb/YG8udJC9JqK+w9kpLAMPdzCcJBOYY8Bh1mU0WkZL3Ub/LHdEq7OlOynRa
	 0kbm7aw3jv7DrSi3gQ1QseDqlDVfMLrihcMZZy2bAJfFnr2VnBLP8IMDorcrn+7DG7406
	 1j2/RG2OdHUDfZE7jwejdJ/hJQW6x/L7V+mbGn/VpvVkGwojbf/j+eH01E0XzfCa8bCX4
	 5SMLOTy2baRcw/2W1XVcVHlrxO3WE73EIL43CyuC6/awubxOO4BIvjoYKjR3ZOGFJ4hj7
	 DtO2wMlWAvXnZx4cp73jArjJwVLTwxxHWza2sf+zKnRT/O9q32irBDPhjOdi6SPU1ow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794792862;
	h=DMARC-Filter:X-UUID:DKIM-Signature:X-CID-P-RULE:X-CID-O-INFO:
	 X-CID-META:X-CID-BVR:X-CID-BAS:X-CID-FACTOR:X-CID-RHF:X-UUID:Received:
	 Received:Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 Content-Type:X-MTK;
	bh=AxhLt5oPl1Af49KuI4VEIgf+UURMNbPIfKBjA5L4+fQ=;
	b=j03vxMjZ9ngWAzSMmnVk7BZhiVF1NgX+RIHGNqBR+kZthrHHmWb+ptH8ikHBSPb6o/QW
	 z640lRs4ve3KXtBL6r4YNCKsBiboEiokIpKbDXJlYkkmZB5/C/QL4j06W4KsrVpt0114L
	 IcQWAEoFjQy/u8qzT/vA+UvBBPBcIkF91rqiPGeJcOd3D+vluTg/Yx7rzY9twQ1ZOkM5L
	 2xnxOdB48YARNqpk6Ye/qGwZqVFzakTk/AM1xfpddsKMUGXp2Drr2LABJYEKY1Xw7B40s
	 1Pyd24Zaais3Z7DoJF5RqU0yVnjJwYVxH0bfNn85w/OklCnqXZd5+CUtp1hn0HKRX8g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mediatek.com;
	spf=pass smtp.mailfrom=mediatek.com;
	dkim=pass header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=FyqS5NYx;
	arc=none smtp.remote-ip=210.61.82.184
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DAE2606A33E;
	Mon, 16 Nov 2026 01:34:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9DAE2606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=FyqS5NYx
X-UUID: d5c489e0e15d11f18dc8c9802ae25ab1-20261116
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=AxhLt5oPl1Af49KuI4VEIgf+UURMNbPIfKBjA5L4+fQ=;
	b=FyqS5NYxqaCMMLHoeesg+IzPpzyGDL9UsaD4kXlJtLlSl4R816QU+/v9mL7ELXK2I4K5+lZghdTyq1Mbqpvy3f6ioPx2xmM1b+YqEZsqSfXayo823+VR0S12rgkhHxsB78eH3XKZd/ZIfmJCYKoH5lFnwBa1SOL2hmAX71w9S3M=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.21,REQID:4c45092b-9df6-4520-b673-22651e17da04,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:b0318ac,CLOUDID:2906cb8d-b3e7-4795-ae33-b1b4d51e21d7,B
	ulkID:nil,BulkQuantity:0,SF:81|82|102|836|865|888|898,TC:-5,Content:0|15|5
	0|99,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0
	,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: d5c489e0e15d11f18dc8c9802ae25ab1-20261116
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw02.mediatek.com
	(envelope-from <kyrie.wu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 248877168; Mon, 16 Nov 2026 09:34:15 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 16 Nov 2026 09:34:14 +0800
Received: from gcnsap21.gcn.mediatek.inc (10.17.81.22) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Mon, 16 Nov 2026 09:34:13 +0800
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
Subject: [PATCH v19 05/13] media: mediatek: jpeg: Fix multi-core clk suspend and resume setting
Date: Mon, 16 Nov 2026 09:33:30 +0800
Message-ID: <20261116013402.1273016-6-kyrie.wu@mediatek.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261116013402.1273016-1-kyrie.wu@mediatek.com>
References: <20261116013402.1273016-1-kyrie.wu@mediatek.com>
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

Make multi-hw component devices own their clocks and suspend callbacks.
Keep single-core clock callbacks on the master device.

Stop new jobs and wait for the active job with v4l2_m2m_suspend()
before disabling component clocks. Runtime-PM references keep clocks
enabled until job completion or timeout.

Fixes: 934e8bccac95 ("mtk-jpegenc: support jpegenc multi-hardware")
Fixes: 0fa49df4222f ("media: mtk-jpegdec: support jpegdec multi-hardware")

Signed-off-by: Kyrie Wu <kyrie.wu@mediatek.com>
---
 .../platform/mediatek/jpeg/mtk_jpeg_core.c    | 27 +++-----
 .../platform/mediatek/jpeg/mtk_jpeg_dec_hw.c  | 64 +++++++++++++++++--
 .../platform/mediatek/jpeg/mtk_jpeg_enc_hw.c  | 62 ++++++++++++++++--
 3 files changed, 124 insertions(+), 29 deletions(-)

diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
index 0dc7fe72d..21b980607 100644
--- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
+++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
@@ -1115,6 +1115,9 @@ static void mtk_jpeg_clk_on(struct mtk_jpeg_dev *jpeg)
 {
 	int ret;
 
+	if (jpeg->variant->multi_core)
+		return;
+
 	ret = clk_bulk_prepare_enable(jpeg->variant->num_clks,
 				      jpeg->variant->clks);
 	if (ret)
@@ -1123,6 +1126,9 @@ static void mtk_jpeg_clk_on(struct mtk_jpeg_dev *jpeg)
 
 static void mtk_jpeg_clk_off(struct mtk_jpeg_dev *jpeg)
 {
+	if (jpeg->variant->multi_core)
+		return;
+
 	clk_bulk_disable_unprepare(jpeg->variant->num_clks,
 				   jpeg->variant->clks);
 }
@@ -1648,14 +1654,6 @@ retry_select:
 		goto enc_end;
 	}
 
-	ret = clk_prepare_enable(comp_jpeg[hw_id]->venc_clk.clks->clk);
-	if (ret) {
-		dev_err(jpeg->dev, "%s : %d, jpegenc clk_prepare_enable fail\n",
-			__func__, __LINE__);
-		pm_runtime_put(comp_jpeg[hw_id]->dev);
-		goto enc_end;
-	}
-
 	v4l2_m2m_src_buf_remove(ctx->fh.m2m_ctx);
 	v4l2_m2m_dst_buf_remove(ctx->fh.m2m_ctx);
 
@@ -1765,13 +1763,6 @@ retry_select:
 		goto dec_end;
 	}
 
-	ret = clk_prepare_enable(comp_jpeg[hw_id]->jdec_clk.clks->clk);
-	if (ret) {
-		dev_err(jpeg->dev, "%s : %d, jpegdec clk_prepare_enable fail\n",
-			__func__, __LINE__);
-		goto clk_end;
-	}
-
 	v4l2_m2m_src_buf_remove(ctx->fh.m2m_ctx);
 	v4l2_m2m_dst_buf_remove(ctx->fh.m2m_ctx);
 
@@ -1781,7 +1772,7 @@ retry_select:
 				 &dst_buf->vb2_buf, &fb)) {
 		dev_err(jpeg->dev, "%s : %d, mtk_jpeg_set_dec_dst fail\n",
 			__func__, __LINE__);
-		goto setdst_end;
+		goto set_dst_fail;
 	}
 
 	schedule_delayed_work(&comp_jpeg[hw_id]->job_timeout_work,
@@ -1802,9 +1793,7 @@ retry_select:
 
 	return;
 
-setdst_end:
-	clk_disable_unprepare(comp_jpeg[hw_id]->jdec_clk.clks->clk);
-clk_end:
+set_dst_fail:
 	pm_runtime_put(comp_jpeg[hw_id]->dev);
 dec_end:
 	v4l2_m2m_src_buf_remove(ctx->fh.m2m_ctx);
diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c
index 3c22417f4..b9ba37a88 100644
--- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c
+++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c
@@ -533,13 +533,12 @@ static void mtk_jpegdec_timeout_work(struct work_struct *work)
 	v4l2_m2m_buf_copy_metadata(src_buf, dst_buf);
 
 	mtk_jpeg_dec_reset(cjpeg->reg_base);
-	clk_disable_unprepare(cjpeg->jdec_clk.clks->clk);
-	pm_runtime_put(cjpeg->dev);
 	cjpeg->hw_state = MTK_JPEG_HW_IDLE;
 	atomic_inc(&master_jpeg->hw_rdy);
 	wake_up(&master_jpeg->hw_wq);
 	v4l2_m2m_buf_done(src_buf, buf_state);
 	mtk_jpegdec_put_buf(cjpeg);
+	pm_runtime_put(cjpeg->dev);
 }
 
 static irqreturn_t mtk_jpegdec_hw_irq_handler(int irq, void *priv)
@@ -547,7 +546,6 @@ static irqreturn_t mtk_jpegdec_hw_irq_handler(int irq, void *priv)
 	struct vb2_v4l2_buffer *src_buf, *dst_buf;
 	struct mtk_jpeg_src_buf *jpeg_src_buf;
 	enum vb2_buffer_state buf_state;
-	struct mtk_jpeg_ctx *ctx;
 	u32 dec_irq_ret;
 	u32 irq_status;
 	int i;
@@ -557,7 +555,6 @@ static irqreturn_t mtk_jpegdec_hw_irq_handler(int irq, void *priv)
 
 	cancel_delayed_work(&jpeg->job_timeout_work);
 
-	ctx = jpeg->hw_param.curr_ctx;
 	src_buf = jpeg->hw_param.src_buffer;
 	dst_buf = jpeg->hw_param.dst_buffer;
 	v4l2_m2m_buf_copy_metadata(src_buf, dst_buf);
@@ -580,12 +577,11 @@ static irqreturn_t mtk_jpegdec_hw_irq_handler(int irq, void *priv)
 	buf_state = VB2_BUF_STATE_DONE;
 	v4l2_m2m_buf_done(src_buf, buf_state);
 	mtk_jpegdec_put_buf(jpeg);
-	pm_runtime_put(ctx->jpeg->dev);
-	clk_disable_unprepare(jpeg->jdec_clk.clks->clk);
 
 	jpeg->hw_state = MTK_JPEG_HW_IDLE;
 	wake_up(&master_jpeg->hw_wq);
 	atomic_inc(&master_jpeg->hw_rdy);
+	pm_runtime_put(jpeg->dev);
 
 	return IRQ_HANDLED;
 }
@@ -673,11 +669,67 @@ static int mtk_jpegdec_hw_probe(struct platform_device *pdev)
 	return 0;
 }
 
+static int mtk_jpegdec_pm_suspend(struct device *dev)
+{
+	struct mtk_jpegdec_comp_dev *jpeg = dev_get_drvdata(dev);
+
+	clk_bulk_disable_unprepare(jpeg->jdec_clk.clk_num,
+				   jpeg->jdec_clk.clks);
+
+	return 0;
+}
+
+static int mtk_jpegdec_pm_resume(struct device *dev)
+{
+	struct mtk_jpegdec_comp_dev *jpeg = dev_get_drvdata(dev);
+
+	return clk_bulk_prepare_enable(jpeg->jdec_clk.clk_num,
+				       jpeg->jdec_clk.clks);
+}
+
+static int mtk_jpegdec_suspend(struct device *dev)
+{
+	struct mtk_jpegdec_comp_dev *jpeg = dev_get_drvdata(dev);
+	int ret;
+
+	/* Stop new submissions before checking hardware activity. */
+	v4l2_m2m_suspend(jpeg->master_dev->m2m_dev);
+
+	if (READ_ONCE(jpeg->hw_state) != MTK_JPEG_HW_IDLE)
+		ret = -EBUSY;
+	else
+		ret = pm_runtime_force_suspend(dev);
+	if (ret)
+		v4l2_m2m_resume(jpeg->master_dev->m2m_dev);
+
+	return ret;
+}
+
+static int mtk_jpegdec_resume(struct device *dev)
+{
+	struct mtk_jpegdec_comp_dev *jpeg = dev_get_drvdata(dev);
+	int ret;
+
+	ret = pm_runtime_force_resume(dev);
+	if (ret < 0)
+		return ret;
+
+	v4l2_m2m_resume(jpeg->master_dev->m2m_dev);
+
+	return 0;
+}
+
+static const struct dev_pm_ops mtk_jpegdec_pm_ops = {
+	SYSTEM_SLEEP_PM_OPS(mtk_jpegdec_suspend, mtk_jpegdec_resume)
+	RUNTIME_PM_OPS(mtk_jpegdec_pm_suspend, mtk_jpegdec_pm_resume, NULL)
+};
+
 static struct platform_driver mtk_jpegdec_hw_driver = {
 	.probe = mtk_jpegdec_hw_probe,
 	.driver = {
 		.name = "mtk-jpegdec-hw",
 		.of_match_table = mtk_jpegdec_hw_ids,
+		.pm             = pm_ptr(&mtk_jpegdec_pm_ops),
 	},
 };
 
diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c
index 708f3fbc6..25e1aafc4 100644
--- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c
+++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c
@@ -263,13 +263,12 @@ static void mtk_jpegenc_timeout_work(struct work_struct *work)
 	v4l2_m2m_buf_copy_metadata(src_buf, dst_buf);
 
 	mtk_jpeg_enc_reset(cjpeg->reg_base);
-	clk_disable_unprepare(cjpeg->venc_clk.clks->clk);
-	pm_runtime_put(cjpeg->dev);
 	cjpeg->hw_state = MTK_JPEG_HW_IDLE;
 	atomic_inc(&master_jpeg->hw_rdy);
 	wake_up(&master_jpeg->hw_wq);
 	v4l2_m2m_buf_done(src_buf, buf_state);
 	mtk_jpegenc_put_buf(cjpeg);
+	pm_runtime_put(cjpeg->dev);
 }
 
 static irqreturn_t mtk_jpegenc_hw_irq_handler(int irq, void *priv)
@@ -303,12 +302,11 @@ static irqreturn_t mtk_jpegenc_hw_irq_handler(int irq, void *priv)
 	buf_state = VB2_BUF_STATE_DONE;
 	v4l2_m2m_buf_done(src_buf, buf_state);
 	mtk_jpegenc_put_buf(jpeg);
-	pm_runtime_put(ctx->jpeg->dev);
-	clk_disable_unprepare(jpeg->venc_clk.clks->clk);
 
 	jpeg->hw_state = MTK_JPEG_HW_IDLE;
 	wake_up(&master_jpeg->hw_wq);
 	atomic_inc(&master_jpeg->hw_rdy);
+	pm_runtime_put(jpeg->dev);
 
 	return IRQ_HANDLED;
 }
@@ -394,11 +392,67 @@ static int mtk_jpegenc_hw_probe(struct platform_device *pdev)
 	return 0;
 }
 
+static int mtk_jpegenc_pm_suspend(struct device *dev)
+{
+	struct mtk_jpegenc_comp_dev *jpeg = dev_get_drvdata(dev);
+
+	clk_bulk_disable_unprepare(jpeg->venc_clk.clk_num,
+				   jpeg->venc_clk.clks);
+
+	return 0;
+}
+
+static int mtk_jpegenc_pm_resume(struct device *dev)
+{
+	struct mtk_jpegenc_comp_dev *jpeg = dev_get_drvdata(dev);
+
+	return clk_bulk_prepare_enable(jpeg->venc_clk.clk_num,
+				       jpeg->venc_clk.clks);
+}
+
+static int mtk_jpegenc_suspend(struct device *dev)
+{
+	struct mtk_jpegenc_comp_dev *jpeg = dev_get_drvdata(dev);
+	int ret;
+
+	/* Stop new submissions before checking hardware activity. */
+	v4l2_m2m_suspend(jpeg->master_dev->m2m_dev);
+
+	if (READ_ONCE(jpeg->hw_state) != MTK_JPEG_HW_IDLE)
+		ret = -EBUSY;
+	else
+		ret = pm_runtime_force_suspend(dev);
+	if (ret)
+		v4l2_m2m_resume(jpeg->master_dev->m2m_dev);
+
+	return ret;
+}
+
+static int mtk_jpegenc_resume(struct device *dev)
+{
+	struct mtk_jpegenc_comp_dev *jpeg = dev_get_drvdata(dev);
+	int ret;
+
+	ret = pm_runtime_force_resume(dev);
+	if (ret < 0)
+		return ret;
+
+	v4l2_m2m_resume(jpeg->master_dev->m2m_dev);
+
+	return 0;
+}
+
+static const struct dev_pm_ops mtk_jpegenc_pm_ops = {
+	SYSTEM_SLEEP_PM_OPS(mtk_jpegenc_suspend, mtk_jpegenc_resume)
+	RUNTIME_PM_OPS(mtk_jpegenc_pm_suspend, mtk_jpegenc_pm_resume, NULL)
+};
+
 static struct platform_driver mtk_jpegenc_hw_driver = {
 	.probe = mtk_jpegenc_hw_probe,
 	.driver = {
 		.name = "mtk-jpegenc-hw",
 		.of_match_table = mtk_jpegenc_drv_ids,
+		.pm = pm_ptr(&mtk_jpegenc_pm_ops),
 	},
 };
 
-- 
2.51.0.windows.2

