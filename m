Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=210.61.82.184
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794905933;
	b=ol3MptSM/GbWwlzMyHj3yigjuQho3w2wzScNC6dhhRKVsikrsWAnMxMpugtoxmdd7Z/W
	 m8i+w0equ749Ww55JWpIGGd99RCY+wj4iwU3hal2q76CKgSjJ9LZ4iiiiXzdZ9tBuWQC8
	 kBcj/BdT6xdq+M/Qt7qC1QL/0UQYztliCPgPvUho2ghWDcAMGbChbeyo5O1QeevjAVmDZ
	 S/EpfdyseC6PPxYAs0sSdphOozwjABA8YmATFMPpcmoBo+UDoqqd+f0Z+Wy2sG6CLit36
	 MJXBuC/rJvGJEUadd3wg22QYTJwZAkjqqGwav98eAJFAToRNb7tsvpxYUk9olvZa7ow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794905933;
	h=DMARC-Filter:X-UUID:DKIM-Signature:X-CID-P-RULE:X-CID-O-INFO:
	 X-CID-META:X-CID-BVR:X-CID-BAS:X-CID-FACTOR:X-CID-RHF:X-UUID:Received:
	 Received:Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 Content-Type:X-MTK;
	bh=OiCgaUybXr3WnS/B48Rn16H+XVO0hUzNRUE3rDSuarY=;
	b=3jWgSV+Qjinuhn/vd8Lv2vkPMZwlbusEwrxvsWpOnB6B4yRflqOsD3VF9a8dk47Ey2+m
	 42XLY/ViK/2QgbimS9Ss6dxDMzhQupvp4lqW26hz5pjx3sBLe/OnlMPfa2AANB3qhPRAB
	 6nH2MAqkBcTKkx4K5cy0YnIWSF1bWo25Z4Px0zyarlT89yT6Ece676+/UNu4IQ50FwI3C
	 fyNByQgT1yw3o1EgFZCnaaNEPpa219l5iUI6ziqxP0yHydCxGzCdHwxV+L8FMcYVsynkW
	 2xpEkvklrFomV5+gkL+y6s4VNu/9Fp98cBziVz6BNIOGnICKeOdM211vjYmviyQneGQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mediatek.com;
	spf=pass smtp.mailfrom=mediatek.com;
	dkim=pass header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=pWpAC40u;
	arc=none smtp.remote-ip=210.61.82.184
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 459F960A2616;
	Tue, 17 Nov 2026 08:58:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 459F960A2616
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=pWpAC40u
X-UUID: 187ccd80e26511f18dc8c9802ae25ab1-20261117
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=OiCgaUybXr3WnS/B48Rn16H+XVO0hUzNRUE3rDSuarY=;
	b=pWpAC40u19YYvkpQbixYtIUvtUIxCZja7dJI1trrVfSz6COHHxkKNMD4HzecwtrIROoiYYai8ht8YO3YE3D/cMuxHV8hkJUL653/dEYi9yxG9Vi75aLefhuay4uylqTqWzvCvGm6YVFuAy6mrn8Zi2U8QN46Qmly8SkdxsBrKgE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.21,REQID:b905712b-2eef-4a4e-9f66-da268d535bbf,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:b0318ac,CLOUDID:ebb86866-4b51-4c95-bb1b-80ac6aad9c96,B
	ulkID:nil,BulkQuantity:0,SF:81|82|102|836|865|888|898,TC:-5,Content:0|15|5
	0|99,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0
	,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 187ccd80e26511f18dc8c9802ae25ab1-20261117
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw02.mediatek.com
	(envelope-from <kyrie.wu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1162138829; Tue, 17 Nov 2026 16:58:45 +0800
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 17 Nov 2026 16:58:44 +0800
Received: from gcnsap21.gcn.mediatek.inc (10.17.81.22) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Tue, 17 Nov 2026 16:58:43 +0800
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
Subject: [PATCH v12 05/10] media: mediatek: vcodec: Add VP9 Probability Size Configuration
Date: Tue, 17 Nov 2026 16:58:28 +0800
Message-ID: <20261117085834.1464723-6-kyrie.wu@mediatek.com>
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
index bbfa6954d..0bde1c5b5 100644
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
index bf3569e6b..bfa62974b 100644
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
index cbea445e5..56656222d 100644
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
index ee4d1cd82..d08be051d 100644
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

