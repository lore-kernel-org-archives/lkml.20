Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5A04341057;
	Sat, 10 Oct 2026 08:07:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.61.82.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791619657; cv=none; b=HZhBxdIZOH2lcOrEH4AwZz/Ca1WctpQkuxU1i0hu+CyQ83G/a3JQREyG0X1FFYVaW5+MqhrbbHB08uJq60bVqCMvqHwn4mmRTijtpYTQEDMT2NwhN2enS4rPsJZSuBtoHSSRjt1fZP5RwEzY3enKdx7ToJF9GYQNAm1glxvqDG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791619657; c=relaxed/simple;
	bh=Fp+i9vsvEqpxMZ23lNGxSjGfDyMuMZCzSaKTD5FSkIg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=auYFE/xOjz2DD0hMhs6SVDBDDpJ//fu/OczrFMtN0ItO1RNSoKg9bPu4Nz0v7Ulmn3zDA/GnFYjILKjnIcrWMIiLYsj9FK7lHbBNlNUHmwRCLqn6LVU1a9QxXhfIj8EIRX94kfBHdwYdVtC9NsEAaTGrP2hQk+Np4xCcGWPNVh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=eg7mv5H/; arc=none smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="eg7mv5H/"
X-UUID: 9fd622f6c48111f18dc8c9802ae25ab1-20261010
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=epdv4eoosvzzhjE+CmfslSk/AaY3jK3E/F++hZtsh+0=;
	b=eg7mv5H/juF32zFn27dORxy0Aji5wXKty5zDsOrVkj9FIsqDqgqKS1CGLQm6m2LSoV9dj4jUt2vZmlGPstdmrKR2LT5hnvPf54Pn8obvvWAZjgaYF+NFu2LOQuj/6bPoNig0zFZu2V9vJ/VlLIQWKsLo4VKD82ypJHD05sSeW9Q=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.20,REQID:d8e275b0-ca9b-4658-ad78-d103f29b905d,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:291e20b,CLOUDID:44882e95-3103-4fdb-b79c-08de0e281a5d,B
	ulkID:nil,BulkQuantity:0,SF:81|82|102|836|865|888|898,TC:-5,Content:0|15|5
	0|99,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI:0,
	OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 9fd622f6c48111f18dc8c9802ae25ab1-20261010
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw02.mediatek.com
	(envelope-from <kyrie.wu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 93958575; Sat, 10 Oct 2026 16:07:23 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Sat, 10 Oct 2026 16:07:23 +0800
Received: from gcnsap21.gcn.mediatek.inc (10.17.81.22) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Sat, 10 Oct 2026 16:07:22 +0800
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
Subject: [PATCH v18 01/13] media: mediatek: jpeg: fix jpeg cores' amounts setting
Date: Sat, 10 Oct 2026 16:07:05 +0800
Message-ID: <cc21c4887ec07ac8abf68100a9512a6a121b868b.1791614327.git.kyrie.wu@mediatek.com>
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

Different ICs have different amounts of cores,
use a variable to set the cores' amounts.

Fixes: 934e8bccac95 ("mtk-jpegenc: support jpegenc multi-hardware")
Fixes: 0fa49df4222f ("media: mtk-jpegdec: support jpegdec multi-hardware")
Signed-off-by: Kyrie Wu <kyrie.wu@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c  | 11 ++++++-----
 drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.h  |  2 ++
 .../media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c    |  2 ++
 .../media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c    |  2 ++
 4 files changed, 12 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
index d147ec4..41c4cf8 100644
--- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
+++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
@@ -1325,7 +1325,8 @@ static int mtk_jpeg_probe(struct platform_device *pdev)
 		for_each_child_of_node(pdev->dev.of_node, child)
 			num_child++;
 
-		atomic_set(&jpeg->hw_rdy, num_child);
+		jpeg->max_hw_count = num_child;
+		atomic_set(&jpeg->hw_rdy, 0);
 		atomic_set(&jpeg->hw_index, 0);
 
 		jpeg->workqueue = alloc_ordered_workqueue(MTK_JPEG_NAME,
@@ -1462,7 +1463,7 @@ static int mtk_jpegenc_get_hw(struct mtk_jpeg_ctx *ctx)
 	int i;
 
 	spin_lock_irqsave(&jpeg->hw_lock, flags);
-	for (i = 0; i < MTK_JPEGENC_HW_MAX; i++) {
+	for (i = 0; i < jpeg->max_hw_count; i++) {
 		comp_jpeg = jpeg->enc_hw_dev[i];
 		if (comp_jpeg->hw_state == MTK_JPEG_HW_IDLE) {
 			hw_id = i;
@@ -1509,7 +1510,7 @@ static int mtk_jpegdec_get_hw(struct mtk_jpeg_ctx *ctx)
 	int i;
 
 	spin_lock_irqsave(&jpeg->hw_lock, flags);
-	for (i = 0; i < MTK_JPEGDEC_HW_MAX; i++) {
+	for (i = 0; i < jpeg->max_hw_count; i++) {
 		comp_jpeg = jpeg->dec_hw_dev[i];
 		if (comp_jpeg->hw_state == MTK_JPEG_HW_IDLE) {
 			hw_id = i;
@@ -1592,7 +1593,7 @@ static void mtk_jpegenc_worker(struct work_struct *work)
 		jpeg_work);
 	struct mtk_jpeg_dev *jpeg = ctx->jpeg;
 
-	for (i = 0; i < MTK_JPEGENC_HW_MAX; i++)
+	for (i = 0; i < jpeg->max_hw_count; i++)
 		comp_jpeg[i] = jpeg->enc_hw_dev[i];
 	i = 0;
 
@@ -1687,7 +1688,7 @@ static void mtk_jpegdec_worker(struct work_struct *work)
 	struct mtk_jpeg_fb fb;
 	unsigned long flags;
 
-	for (i = 0; i < MTK_JPEGDEC_HW_MAX; i++)
+	for (i = 0; i < jpeg->max_hw_count; i++)
 		comp_jpeg[i] = jpeg->dec_hw_dev[i];
 	i = 0;
 
diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.h b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.h
index 02ed0ed..6be5cf3 100644
--- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.h
+++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.h
@@ -212,6 +212,7 @@ struct mtk_jpegdec_comp_dev {
  * @reg_decbase:	jpg decode register base addr
  * @dec_hw_dev:	jpg decode hardware device
  * @hw_index:		jpg hw index
+ * @max_hw_count:	jpeg hw-core count
  */
 struct mtk_jpeg_dev {
 	struct mutex		lock;
@@ -234,6 +235,7 @@ struct mtk_jpeg_dev {
 	void __iomem *reg_decbase[MTK_JPEGDEC_HW_MAX];
 	struct mtk_jpegdec_comp_dev *dec_hw_dev[MTK_JPEGDEC_HW_MAX];
 	atomic_t hw_index;
+	u32 max_hw_count;
 };
 
 /**
diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c
index 3237278..9ca68cd 100644
--- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c
+++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c
@@ -668,6 +668,8 @@ static int mtk_jpegdec_hw_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, dev);
 	pm_runtime_enable(&pdev->dev);
 
+	atomic_inc(&master_dev->hw_rdy);
+
 	return 0;
 }
 
diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c
index b312a15..44a064d 100644
--- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c
+++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c
@@ -389,6 +389,8 @@ static int mtk_jpegenc_hw_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, dev);
 	pm_runtime_enable(&pdev->dev);
 
+	atomic_inc(&master_dev->hw_rdy);
+
 	return 0;
 }
 
-- 
2.51.0.windows.2

