Received: from mail-m49198.qiye.163.com (mail-m49198.qiye.163.com [45.254.49.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27B5B30DEA6;
	Fri, 11 Sep 2026 06:09:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789106962; cv=none; b=O7bkyuqjEo6AB8er/DWyU6p5/6No6fIDEfagguulaGZZBqH6ZhE1i7dX9Nqpr1ssUpHSKqNM81KHNULzyDdfR1OUM5FenwGZWbgiJOrzOgB6tUGXwjv8Uf+XsIdHzTfiG4VmIKrzfUY9ST+XeVq42pDYCp7SHecMnRPQg5llWnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789106962; c=relaxed/simple;
	bh=KqOnOotDwmdBWCWBd4A19InFmh+sUAa6uEWDg3Hv9Sg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=gGgoqFtTceE9kgvtdySjrLTarlN01OLKJVHTSG4cJL/EI7OMbB3bSdS1ysXo14M5HcWJpgqmcwB/Wo61D/XUTdxs3mixqEReSS1LdkRh50Y4Iw6A3zHJoVaUuBjvHYiFkzCoSh1udHUokFC/pH03orvonZWFoUuWSt2W0HyP3rU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=seu.edu.cn; spf=pass smtp.mailfrom=seu.edu.cn; dkim=pass (1024-bit key) header.d=seu.edu.cn header.i=@seu.edu.cn header.b=SXKGo9ZD; arc=none smtp.client-ip=45.254.49.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=seu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=seu.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=seu.edu.cn header.i=@seu.edu.cn header.b="SXKGo9ZD"
Received: from seu.edu.cn (unknown [221.228.238.82])
	by smtp.qiye.163.com (Hmail) with ESMTP id 4d62c4fad;
	Fri, 11 Sep 2026 14:09:14 +0800 (GMT+08:00)
From: Slavin Liu <bolin.liu@seu.edu.cn>
To: tiffany.lin@mediatek.com,
	andrew-ct.chen@mediatek.com,
	yunfei.dong@mediatek.com,
	mchehab@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	bolin.liu@seu.edu.cn
Subject: [PATCH RFC] media: mediatek: vcodec: avoid accessing a failed control
Date: Fri, 11 Sep 2026 14:09:13 +0800
Message-Id: <20260911060913.94267-1-bolin.liu@seu.edu.cn>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa08f159fd703a1kunmfc8dba361c732f
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkaTk1OVkhJHxpJQxhIGUpMTVYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlJSUpVSUlDVUlIQ1VDSVlXWRYaDxIVHRRZQVlPS0hVSktJQk
	NDTFVKS0tVS1kG
DKIM-Signature: a=rsa-sha256;
	b=SXKGo9ZDCA1zjna9TjRkb7NvxJTUpiZrTqan5RWB91f30zvivz1H5npatBgq1ukX6WQp1igV921ufnKolrgZj1xaOnx6wYy1QUntNrzmcy8mlWboClWgLbP2A7H75KyuGed+4keSruomttWCLcxVPK2PVbnwufYyjIctL5JL9NU=; c=relaxed/relaxed; s=default; d=seu.edu.cn; v=1;
	bh=J+7QTnVPPPZMqiCYBuyFWOTTKbazKI3hnsP8vEZJOS0=;
	h=date:mime-version:subject:message-id:from;

Set the volatile flag only if the control was created. The existing
handler error path remains responsible for reporting allocation errors.

Detected by static analysis and reviewed with AI-assisted source auditing.

Fixes: 590577a4e525 ("[media] vcodec: mediatek: Add Mediatek V4L2 Video Decoder Driver")
Assisted-by: LLM
Signed-off-by: Slavin Liu <bolin.liu@seu.edu.cn>
---
 .../platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateful.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateful.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateful.c
index aa9bdee7a96c..8441f1d69d2f 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateful.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateful.c
@@ -555,7 +555,8 @@ static int mtk_vcodec_dec_ctrls_setup(struct mtk_vcodec_dec_ctx *ctx)
 
 	ctrl = v4l2_ctrl_new_std(&ctx->ctrl_hdl, &mtk_vcodec_dec_ctrl_ops,
 				 V4L2_CID_MIN_BUFFERS_FOR_CAPTURE, 0, 32, 1, 1);
-	ctrl->flags |= V4L2_CTRL_FLAG_VOLATILE;
+	if (ctrl)
+		ctrl->flags |= V4L2_CTRL_FLAG_VOLATILE;
 	v4l2_ctrl_new_std_menu(&ctx->ctrl_hdl, &mtk_vcodec_dec_ctrl_ops,
 			       V4L2_CID_MPEG_VIDEO_VP9_PROFILE,
 			       V4L2_MPEG_VIDEO_VP9_PROFILE_0, 0,
