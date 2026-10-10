Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D394A43785D;
	Sat, 10 Oct 2026 09:24:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.244.123.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791624266; cv=none; b=jhy0Qksi2VN8J5hjamxZQcS3OT2hoMBs/WGhSRHsbB9wPooi8i8gDO3FmSltRdQrvMQmWdNN3Q3YhNm8qCnfsl2Fb5gvRk7UVGDlhlnIV6QbTTwy2Xf9bJLf+aQZky+cr6biImz95biPSreLekaPme2nwMzPMedNm+E23VzKRGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791624266; c=relaxed/simple;
	bh=zZK5WN/qEDKNbfOzcImEXTKCFw4kxjCAXWZDA1Jge8c=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KkvULKr7NrhN+9XN+A6FAMYAe2gar9nRtT/7ryf2AIkzIWDICTw/42kJaPlHVXnQviXBzVtXDgVxnDUourhWq3C2xi1VOXlOPr2WrHVChL9PtQKaeJ9LsCaKte9yoHFhCt9gwGyaFWbnuyz9U7o2cGVQ73D75c99gXy02HbdXQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=PDvJ3C+6; arc=none smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="PDvJ3C+6"
X-UUID: 58a7b344c48c11f1b1788b6acf885367-20261010
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=FsHGc1FxQUH0A5z3W3pDgP9mL6mND4o6RWrp4sYM9QQ=;
	b=PDvJ3C+65psSbwOE6MFaEgiPv2l3uQJnynInf1vo2ogke5DvX0ld+ACZvfHdmamkySZ6wZuQj0oPCiy2ofTjZba1OIGHtYKCntjnIpKEJI5j8Bgd90iyrlnjrI7O7C8nWw1amJfLDjVHz+iJ0G6zGWvpvsyYCR60sGfEmfU//F4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.20,REQID:018f83a0-242e-40a7-b55e-330a5048df3f,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:291e20b,CLOUDID:bc6dedb8-514b-419b-be8a-53f1868a3ee6,B
	ulkID:nil,BulkQuantity:0,SF:81|82|102|836|865|888|898,TC:-5,Content:0|15|5
	0|99,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI:0,
	OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 58a7b344c48c11f1b1788b6acf885367-20261010
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <kyrie.wu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1243756880; Sat, 10 Oct 2026 17:24:08 +0800
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Sat, 10 Oct 2026 17:24:07 +0800
Received: from gcnsap21.gcn.mediatek.inc (10.17.81.22) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Sat, 10 Oct 2026 17:24:06 +0800
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
Subject: [PATCH v11 05/10] media: mediatek: vcodec: Add VP9 Probability Size Configuration
Date: Sat, 10 Oct 2026 17:23:53 +0800
Message-ID: <4631de39cca43bba156c526d379f3d5b9ce67309.1791623423.git.kyrie.wu@mediatek.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1791623422.git.kyrie.wu@mediatek.com>
References: <cover.1791623422.git.kyrie.wu@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N

Introduce support for using different probability buffer sizes for
different stateless decoders: in particular, the VP9 decoder can use
a different size on different SoCs because of different
hardware capabilities.

Move the hardcoded single probability buffer size value to
decoder params, introduce a new VP9_4K_PROB_BUF_SIZE and assign:
  - VP9_PROB_BUF_SIZE (2560 lines) to legacy SoCs;
  - VP9_4K_PROB_BUF_SIZE (3840 lines) to newer SoCs (MT8196, MT8189).

Signed-off-by: Kyrie Wu <kyrie.wu@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h         | 2 ++
 .../mediatek/vcodec/decoder/mtk_vcodec_dec_stateful.c    | 1 +
 .../mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c   | 9 +++++++++
 .../mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c   | 4 ++--
 4 files changed, 14 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h
index bbfa6954..0bde1c5b 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h
+++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h
@@ -82,10 +82,12 @@ struct vdec_pic_info {
  * struct mtk_vcodec_dec_params - decoder supported parameters
  * @level: decoder supported vcodec level
  * @profile: decoder supported vcodec profile
+ * @prob_size: vp9 decoder probability size
  */
 struct mtk_vcodec_dec_params {
 	s64 level;
 	s64 profile;
+	size_t prob_size;
 };
 
 /**
diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateful.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateful.c
index bf3569e6..bfa62974 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateful.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateful.c
@@ -632,5 +632,6 @@ const struct mtk_vcodec_dec_pdata mtk_vdec_8173_pdata = {
 	.vp9_params = {
 		.level = V4L2_MPEG_VIDEO_VP9_LEVEL_4_0,
 		.profile = V4L2_MPEG_VIDEO_VP9_PROFILE_1,
+		.prob_size = 2560,
 	},
 };
diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c
index cbea445e..56656222 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c
@@ -10,6 +10,9 @@
 #include "mtk_vcodec_dec_pm.h"
 #include "vdec_drv_if.h"
 
+#define VP9_PROB_BUF_SIZE 2560
+#define VP9_4K_PROB_BUF_SIZE 3840
+
 /**
  * struct mtk_stateless_control  - CID control type
  * @cfg: control configuration
@@ -892,6 +895,7 @@ const struct mtk_vcodec_dec_pdata mtk_vdec_8183_pdata = {
 	.vp9_params = {
 		.level = V4L2_MPEG_VIDEO_VP9_LEVEL_4_0,
 		.profile = V4L2_MPEG_VIDEO_VP9_PROFILE_1,
+		.prob_size = VP9_PROB_BUF_SIZE,
 	},
 };
 
@@ -945,6 +949,7 @@ const struct mtk_vcodec_dec_pdata mtk_vdec_8188_pdata = {
 	.vp9_params = {
 		.level = V4L2_MPEG_VIDEO_VP9_LEVEL_5_1,
 		.profile = V4L2_MPEG_VIDEO_VP9_PROFILE_2,
+		.prob_size = VP9_PROB_BUF_SIZE,
 	},
 };
 
@@ -965,6 +970,7 @@ const struct mtk_vcodec_dec_pdata mtk_vdec_8192_pdata = {
 	.vp9_params = {
 		.level = V4L2_MPEG_VIDEO_VP9_LEVEL_5_1,
 		.profile = V4L2_MPEG_VIDEO_VP9_PROFILE_2,
+		.prob_size = VP9_PROB_BUF_SIZE,
 	},
 };
 
@@ -985,6 +991,7 @@ const struct mtk_vcodec_dec_pdata mtk_vdec_8195_pdata = {
 	.vp9_params = {
 		.level = V4L2_MPEG_VIDEO_VP9_LEVEL_5_1,
 		.profile = V4L2_MPEG_VIDEO_VP9_PROFILE_1,
+		.prob_size = VP9_PROB_BUF_SIZE,
 	},
 };
 
@@ -1005,6 +1012,7 @@ const struct mtk_vcodec_dec_pdata mtk_vdec_8196_pdata = {
 	.vp9_params = {
 		.level = V4L2_MPEG_VIDEO_VP9_LEVEL_5_2,
 		.profile = V4L2_MPEG_VIDEO_VP9_PROFILE_2,
+		.prob_size = VP9_4K_PROB_BUF_SIZE,
 	},
 };
 
@@ -1042,5 +1050,6 @@ const struct mtk_vcodec_dec_pdata mtk_vdec_8186_pdata = {
 	.vp9_params = {
 		.level = V4L2_MPEG_VIDEO_VP9_LEVEL_4_1,
 		.profile = V4L2_MPEG_VIDEO_VP9_PROFILE_1,
+		.prob_size = VP9_PROB_BUF_SIZE,
 	},
 };
diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c
index ee4d1cd8..d08be051 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c
@@ -22,7 +22,6 @@
 #define VP9_RESET_FRAME_CONTEXT_ALL 3
 
 #define VP9_TILE_BUF_SIZE 4096
-#define VP9_PROB_BUF_SIZE 2560
 #define VP9_COUNTS_BUF_SIZE 16384
 
 #define HDR_FLAG(x) (!!((hdr)->flags & V4L2_VP9_FRAME_FLAG_##x))
@@ -551,6 +550,7 @@ static int vdec_vp9_slice_alloc_working_buffer(struct vdec_vp9_slice_instance *i
 					       struct vdec_vp9_slice_vsi *vsi)
 {
 	struct mtk_vcodec_dec_ctx *ctx = instance->ctx;
+	struct mtk_vcodec_dec_dev *pdev = ctx->dev;
 	enum vdec_vp9_slice_resolution_level level;
 	/* super blocks */
 	unsigned int max_sb_w;
@@ -621,7 +621,7 @@ static int vdec_vp9_slice_alloc_working_buffer(struct vdec_vp9_slice_instance *i
 	}
 
 	if (!instance->prob.va) {
-		instance->prob.size = VP9_PROB_BUF_SIZE;
+		instance->prob.size = pdev->vdec_pdata->vp9_params.prob_size;
 		if (mtk_vcodec_mem_alloc(ctx, &instance->prob))
 			goto err;
 	}
-- 
2.51.0.windows.2

