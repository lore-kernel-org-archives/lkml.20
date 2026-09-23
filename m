Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F33CD46AA67;
	Wed, 23 Sep 2026 08:13:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.244.123.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790151206; cv=none; b=Z7CjksURAXCgd2i0lklfp19O+ySpD+22Zod13t4YeAxWHRSo9DYoRIZiu9Juuf0Qm941CWH+IUZ3kKSUfLj4Y0rYs3lvtnQCdUrxesfkqOQpJHH/wzvGNUz6qTv+gb5jI0t01Op77v8jQJCuqptQ4lBvUuT6D4xjWs0VWbyg+Jo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790151206; c=relaxed/simple;
	bh=781alSK15eCrcn7ipYNyG0dOqFwWRrZ49w73i6OR0VI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MBuyd/Sk2kdoKKNUjaU69cFA9SLs/Oao54wXy4vb57wdQCmtib0gX6HONROlDUBsd5CEG04HOS2L/lvI6eEWLqmikDLback91f6Vd9Na6bS3z+VClIOn+HKHLxx+jhzyC6I1EI27LtDnpVDFeQ64VIak7uIRu0Wy4hG0l8L1SbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=c57G50Ql; arc=none smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="c57G50Ql"
X-UUID: a33f4cf0b72611f1b1788b6acf885367-20260923
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=Iru778a3vD5ji5770Gp1d+eejWrCOiASP6ip0vgrCQ8=;
	b=c57G50Ql2PBu/c9MeSu5LHQqavcFDgMbq0ZjGooMnHGPXSEHPcgEHSiVtKnHMXruRZtJvZVomdqN3uZvD61pBX50RmD8mpNg/AV+j5eo5u2E1tNPzsksXkXS27S7Z7DL+Ie740wyL3NUp51EUMYnlpvSPYYFk3ObcHtXzF2m2ps=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:9f1471dd-b00c-469a-8937-93f8ee09a792,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:7db8b62,CLOUDID:7fe8e108-d10d-41b3-a8f1-bc707284d0ce,B
	ulkID:nil,BulkQuantity:0,SF:81|82|102|836|865|888|898,TC:-5,Content:0|15|5
	0|99,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI:0,
	OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: a33f4cf0b72611f1b1788b6acf885367-20260923
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw01.mediatek.com
	(envelope-from <kyrie.wu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 519440469; Wed, 23 Sep 2026 16:13:20 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 23 Sep 2026 16:13:18 +0800
Received: from gcnsap21.gcn.mediatek.inc (10.17.81.22) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Wed, 23 Sep 2026 16:13:06 +0800
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
Subject: [PATCH v10 04/10] media: mediatek: vcodec: Refactor Decoder profile & level Handling
Date: Wed, 23 Sep 2026 16:12:40 +0800
Message-ID: <20260923081246.268182-5-kyrie.wu@mediatek.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260923081246.268182-1-kyrie.wu@mediatek.com>
References: <20260923081246.268182-1-kyrie.wu@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N

This commit refactors the handling of decoder parameters for H264,
H265, and VP9 codecs by introducing a new structure to standardize
supported level and profile information. By leveraging this change,
chipset-specific conditional logic in the codec configuration
functions is significantly reduced.

Signed-off-by: Kyrie Wu <kyrie.wu@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../vcodec/decoder/mtk_vcodec_dec_drv.h       |  16 ++
 .../vcodec/decoder/mtk_vcodec_dec_stateful.c  |  12 ++
 .../vcodec/decoder/mtk_vcodec_dec_stateless.c | 165 ++++++++++--------
 3 files changed, 118 insertions(+), 75 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h
index d7ed7bfe7d50..bbfa6954d616 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h
+++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h
@@ -78,6 +78,16 @@ struct vdec_pic_info {
 	unsigned int reserved;
 };
 
+/**
+ * struct mtk_vcodec_dec_params - decoder supported parameters
+ * @level: decoder supported vcodec level
+ * @profile: decoder supported vcodec profile
+ */
+struct mtk_vcodec_dec_params {
+	s64 level;
+	s64 profile;
+};
+
 /**
  * struct mtk_vcodec_dec_pdata - compatible data for each IC
  * @init_vdec_params: init vdec params
@@ -100,6 +110,9 @@ struct vdec_pic_info {
  * @fw_type: firmware type (VPU, SCP, or VCP)
  * @fw_init: firmware-specific initialization callback
  * @chip_model: platforms configuration values
+ * @h264_params: H264 decoder default supported params
+ * @h265_params: H265 decoder default supported params
+ * @vp9_params: VP9 decoder default supported params
  */
 struct mtk_vcodec_dec_pdata {
 	void (*init_vdec_params)(struct mtk_vcodec_dec_ctx *ctx);
@@ -125,6 +138,9 @@ struct mtk_vcodec_dec_pdata {
 	struct mtk_vcodec_fw *(*fw_init)(void *priv,
 					 enum mtk_vcodec_fw_use fw_use);
 	unsigned int chip_model;
+	struct mtk_vcodec_dec_params h264_params;
+	struct mtk_vcodec_dec_params h265_params;
+	struct mtk_vcodec_dec_params vp9_params;
 };
 
 /**
diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateful.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateful.c
index e7ae90e8238e..bf3569e6b559 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateful.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateful.c
@@ -621,4 +621,16 @@ const struct mtk_vcodec_dec_pdata mtk_vdec_8173_pdata = {
 	.fw_type = VPU,
 	.fw_init = mtk_vcodec_fw_vpu_init,
 	.chip_model = 8173,
+	.h264_params = {
+		.level = V4L2_MPEG_VIDEO_H264_LEVEL_4_1,
+		.profile = V4L2_MPEG_VIDEO_H264_PROFILE_HIGH,
+	},
+	.h265_params = {
+		.level = V4L2_MPEG_VIDEO_HEVC_LEVEL_4,
+		.profile = V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_STILL_PICTURE,
+	},
+	.vp9_params = {
+		.level = V4L2_MPEG_VIDEO_VP9_LEVEL_4_0,
+		.profile = V4L2_MPEG_VIDEO_VP9_PROFILE_1,
+	},
 };
diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c
index 2a03395ab30b..cbea445e5c2b 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c
@@ -571,106 +571,49 @@ static const struct v4l2_ctrl_ops mtk_vcodec_dec_ctrl_ops = {
 static void mtk_vcodec_dec_fill_h264_level(struct v4l2_ctrl_config *cfg,
 					   struct mtk_vcodec_dec_ctx *ctx)
 {
-	switch (ctx->dev->chip_model) {
-	case 8192:
-	case 8188:
-		cfg->max = V4L2_MPEG_VIDEO_H264_LEVEL_5_2;
-		break;
-	case 8195:
-	case 8196:
-		cfg->max = V4L2_MPEG_VIDEO_H264_LEVEL_6_0;
-		break;
-	case 8183:
-	case 8186:
-		cfg->max = V4L2_MPEG_VIDEO_H264_LEVEL_4_2;
-		break;
-	default:
-		cfg->max = V4L2_MPEG_VIDEO_H264_LEVEL_4_1;
-		break;
-	}
+	struct mtk_vcodec_dec_dev *pdev = ctx->dev;
+
+	cfg->max = pdev->vdec_pdata->h264_params.level;
 }
 
 static void mtk_vcodec_dec_fill_h264_profile(struct v4l2_ctrl_config *cfg,
 					     struct mtk_vcodec_dec_ctx *ctx)
 {
-	switch (ctx->dev->chip_model) {
-	case 8188:
-	case 8195:
-	case 8196:
-		cfg->max = V4L2_MPEG_VIDEO_H264_PROFILE_HIGH_10;
-		break;
-	default:
-		cfg->max = V4L2_MPEG_VIDEO_H264_PROFILE_HIGH;
-		break;
-	}
+	struct mtk_vcodec_dec_dev *pdev = ctx->dev;
+
+	cfg->max = pdev->vdec_pdata->h264_params.profile;
 }
 
 static void mtk_vcodec_dec_fill_h265_level(struct v4l2_ctrl_config *cfg,
 					   struct mtk_vcodec_dec_ctx *ctx)
 {
-	switch (ctx->dev->chip_model) {
-	case 8188:
-		cfg->max = V4L2_MPEG_VIDEO_HEVC_LEVEL_5_1;
-		break;
-	case 8195:
-	case 8196:
-		cfg->max = V4L2_MPEG_VIDEO_HEVC_LEVEL_5_2;
-		break;
-	default:
-		cfg->max = V4L2_MPEG_VIDEO_HEVC_LEVEL_4;
-		break;
-	}
+	struct mtk_vcodec_dec_dev *pdev = ctx->dev;
+
+	cfg->max = pdev->vdec_pdata->h265_params.level;
 }
 
 static void mtk_vcodec_dec_fill_h265_profile(struct v4l2_ctrl_config *cfg,
 					     struct mtk_vcodec_dec_ctx *ctx)
 {
-	switch (ctx->dev->chip_model) {
-	case 8188:
-	case 8195:
-	case 8196:
-		cfg->max = V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_10;
-		break;
-	default:
-		cfg->max = V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_STILL_PICTURE;
-		break;
-	}
+	struct mtk_vcodec_dec_dev *pdev = ctx->dev;
+
+	cfg->max = pdev->vdec_pdata->h265_params.profile;
 }
 
 static void mtk_vcodec_dec_fill_vp9_level(struct v4l2_ctrl_config *cfg,
 					  struct mtk_vcodec_dec_ctx *ctx)
 {
-	switch (ctx->dev->chip_model) {
-	case 8192:
-	case 8188:
-		cfg->max = V4L2_MPEG_VIDEO_VP9_LEVEL_5_1;
-		break;
-	case 8195:
-	case 8196:
-		cfg->max = V4L2_MPEG_VIDEO_VP9_LEVEL_5_2;
-		break;
-	case 8186:
-		cfg->max = V4L2_MPEG_VIDEO_VP9_LEVEL_4_1;
-		break;
-	default:
-		cfg->max = V4L2_MPEG_VIDEO_VP9_LEVEL_4_0;
-		break;
-	}
+	struct mtk_vcodec_dec_dev *pdev = ctx->dev;
+
+	cfg->max = pdev->vdec_pdata->vp9_params.level;
 }
 
 static void mtk_vcodec_dec_fill_vp9_profile(struct v4l2_ctrl_config *cfg,
 					    struct mtk_vcodec_dec_ctx *ctx)
 {
-	switch (ctx->dev->chip_model) {
-	case 8188:
-	case 8195:
-	case 8196:
-		cfg->max = V4L2_MPEG_VIDEO_VP9_PROFILE_2;
-		break;
-	default:
-		cfg->max = V4L2_MPEG_VIDEO_VP9_PROFILE_1;
-		break;
-	}
+	struct mtk_vcodec_dec_dev *pdev = ctx->dev;
+
+	cfg->max = pdev->vdec_pdata->vp9_params.profile;
 }
 
 static void mtk_vcodec_dec_reset_controls(struct v4l2_ctrl_config *cfg,
@@ -938,6 +881,18 @@ const struct mtk_vcodec_dec_pdata mtk_vdec_8183_pdata = {
 	.fw_type = SCP,
 	.fw_init = mtk_vcodec_fw_scp_init,
 	.chip_model = 8183,
+	.h264_params = {
+		.level = V4L2_MPEG_VIDEO_H264_LEVEL_4_2,
+		.profile = V4L2_MPEG_VIDEO_H264_PROFILE_HIGH,
+	},
+	.h265_params = {
+		.level = V4L2_MPEG_VIDEO_HEVC_LEVEL_4,
+		.profile = V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_STILL_PICTURE,
+	},
+	.vp9_params = {
+		.level = V4L2_MPEG_VIDEO_VP9_LEVEL_4_0,
+		.profile = V4L2_MPEG_VIDEO_VP9_PROFILE_1,
+	},
 };
 
 /* This platform data is used for one lat and one core architecture. */
@@ -979,6 +934,18 @@ const struct mtk_vcodec_dec_pdata mtk_vdec_8188_pdata = {
 	.fw_type = SCP,
 	.fw_init = mtk_vcodec_fw_scp_init,
 	.chip_model = 8188,
+	.h264_params = {
+		.level = V4L2_MPEG_VIDEO_H264_LEVEL_5_2,
+		.profile = V4L2_MPEG_VIDEO_H264_PROFILE_HIGH_10,
+	},
+	.h265_params = {
+		.level = V4L2_MPEG_VIDEO_HEVC_LEVEL_5_1,
+		.profile = V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_10,
+	},
+	.vp9_params = {
+		.level = V4L2_MPEG_VIDEO_VP9_LEVEL_5_1,
+		.profile = V4L2_MPEG_VIDEO_VP9_PROFILE_2,
+	},
 };
 
 const struct mtk_vcodec_dec_pdata mtk_vdec_8192_pdata = {
@@ -987,6 +954,18 @@ const struct mtk_vcodec_dec_pdata mtk_vdec_8192_pdata = {
 	.fw_type = SCP,
 	.fw_init = mtk_vcodec_fw_scp_init,
 	.chip_model = 8192,
+	.h264_params = {
+		.level = V4L2_MPEG_VIDEO_H264_LEVEL_5_2,
+		.profile = V4L2_MPEG_VIDEO_H264_PROFILE_HIGH,
+	},
+	.h265_params = {
+		.level = V4L2_MPEG_VIDEO_HEVC_LEVEL_4,
+		.profile = V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_STILL_PICTURE,
+	},
+	.vp9_params = {
+		.level = V4L2_MPEG_VIDEO_VP9_LEVEL_5_1,
+		.profile = V4L2_MPEG_VIDEO_VP9_PROFILE_2,
+	},
 };
 
 const struct mtk_vcodec_dec_pdata mtk_vdec_8195_pdata = {
@@ -995,6 +974,18 @@ const struct mtk_vcodec_dec_pdata mtk_vdec_8195_pdata = {
 	.fw_type = SCP,
 	.fw_init = mtk_vcodec_fw_scp_init,
 	.chip_model = 8195,
+	.h264_params = {
+		.level = V4L2_MPEG_VIDEO_H264_LEVEL_6_0,
+		.profile = V4L2_MPEG_VIDEO_H264_PROFILE_HIGH_10,
+	},
+	.h265_params = {
+		.level = V4L2_MPEG_VIDEO_HEVC_LEVEL_5_2,
+		.profile = V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_10,
+	},
+	.vp9_params = {
+		.level = V4L2_MPEG_VIDEO_VP9_LEVEL_5_1,
+		.profile = V4L2_MPEG_VIDEO_VP9_PROFILE_1,
+	},
 };
 
 const struct mtk_vcodec_dec_pdata mtk_vdec_8196_pdata = {
@@ -1003,6 +994,18 @@ const struct mtk_vcodec_dec_pdata mtk_vdec_8196_pdata = {
 	.fw_type = VCP,
 	.fw_init = mtk_vcodec_fw_vcp_init,
 	.chip_model = 8196,
+	.h264_params = {
+		.level = V4L2_MPEG_VIDEO_H264_LEVEL_6_0,
+		.profile = V4L2_MPEG_VIDEO_H264_PROFILE_HIGH_10,
+	},
+	.h265_params = {
+		.level = V4L2_MPEG_VIDEO_HEVC_LEVEL_5_2,
+		.profile = V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_10,
+	},
+	.vp9_params = {
+		.level = V4L2_MPEG_VIDEO_VP9_LEVEL_5_2,
+		.profile = V4L2_MPEG_VIDEO_VP9_PROFILE_2,
+	},
 };
 
 const struct mtk_vcodec_dec_pdata mtk_vdec_single_core_pdata = {
@@ -1028,4 +1031,16 @@ const struct mtk_vcodec_dec_pdata mtk_vdec_8186_pdata = {
 	.fw_type = SCP,
 	.fw_init = mtk_vcodec_fw_scp_init,
 	.chip_model = 8186,
+	.h264_params = {
+		.level = V4L2_MPEG_VIDEO_H264_LEVEL_4_2,
+		.profile = V4L2_MPEG_VIDEO_H264_PROFILE_HIGH,
+	},
+	.h265_params = {
+		.level = V4L2_MPEG_VIDEO_HEVC_LEVEL_4,
+		.profile = V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_STILL_PICTURE,
+	},
+	.vp9_params = {
+		.level = V4L2_MPEG_VIDEO_VP9_LEVEL_4_1,
+		.profile = V4L2_MPEG_VIDEO_VP9_PROFILE_1,
+	},
 };
-- 
2.51.0.windows.2

