Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 561BB42E8FA;
	Tue, 22 Sep 2026 09:15:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.244.123.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790068549; cv=none; b=PK3g0gWOJwrG0CdLTEJ9V3Oy/5BPniNA4dqhh4bTr2ZIkWCVY00b5IoWAOFI1AS/LSGbYZat3oRgA+3KxyPiewC/FOzZuBz36VDs9YvQC3bWy2Ho5bkfkORjgYsn1eugcEU46gcWSLuQ7MnCKwZlPMI4QA/aHa3jfPUZg05X5xE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790068549; c=relaxed/simple;
	bh=s43fVfdYFFe9jNB4BXC+PNogW2hMxMahS9YBIkXWm2Q=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Y6nclLPohZ0oJ7BEuMjrYHLLIhcVT6tzwGSiAtNDhQgB+Xedf2H9wl+4TBycciMiInajg4q2JDhapBoFoR2IxYeMxAyHvckh822AWzzbwVV9WEzLHo9TtHFxhIHSIUoHnh9nK1xEEkmG7W63SD8+yH+5eYDaRJum/xKg2Wp1hUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=Jce5IK6l; arc=none smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="Jce5IK6l"
X-UUID: 2d047eb8b66611f1b1788b6acf885367-20260922
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=xLU1raGNRNkiRMZRkTcRsI52O6Ivn3m3LlM8helEoEo=;
	b=Jce5IK6lkdFIvK3av8DKo+vp5N6Tuh6vKp9Wj1b7QknFriLF1WX73WQtT7t6j/Iq9P0ehr1BxD/riIZrpcfoosgk1SmAkSW/jBmYssJBAhW3UYV4r8SsYYGXj3qStaYrt1aeMG+izQeUukRfFLgUCY/qHLOQW1uCm+qB3jY6KLs=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:1b5d557c-8f5f-4e80-b90b-71377c844272,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:7db8b62,CLOUDID:515aa128-9ebf-4787-bb42-3cd26eee85aa,B
	ulkID:nil,BulkQuantity:0,SF:81|82|102|836|865|888|898,TC:-5,Content:0|15|5
	0|99,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI:0,
	OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 2d047eb8b66611f1b1788b6acf885367-20260922
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw01.mediatek.com
	(envelope-from <kyrie.wu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1763403215; Tue, 22 Sep 2026 17:15:38 +0800
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 MTKMBS09N1.mediatek.inc (172.21.101.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 22 Sep 2026 17:15:37 +0800
Received: from gcnsap21.gcn.mediatek.inc (10.17.81.22) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Tue, 22 Sep 2026 17:15:36 +0800
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
Subject: [PATCH v17 04/12] media: mediatek: jpeg: Fix buffer completion on multi-core streaming stop
Date: Tue, 22 Sep 2026 17:15:21 +0800
Message-ID: <20260922091530.241762-5-kyrie.wu@mediatek.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260922091530.241762-1-kyrie.wu@mediatek.com>
References: <20260922091530.241762-1-kyrie.wu@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N

Enhances the Mediatek JPEG driver's stability and reliability by ensuring
that all queued buffers are processed before stopping the streaming in
multi-core environments. It introduces a call to
`vb2_wait_for_all_buffers()` in the `mtk_jpeg_enc_stop_streaming()` and
`mtk_jpeg_dec_stop_streaming()` functions when the `multi_core` variant
is enabled. This change ensures that no buffers are left unprocessed,
preventing potential data loss or corruption during multi-core flow.

Fixes: 0fa49df4222f ("media: mtk-jpegdec: support jpegdec multi-hardware")
Fixes: dedc21500334 ("media: mtk-jpegdec: add jpeg decode worker interface")
Fixes: 934e8bccac95 ("mtk-jpegenc: support jpegenc multi-hardware")
Fixes: 5fb1c2361e56 ("mtk-jpegenc: add jpeg encode worker interface")
Signed-off-by: Kyrie Wu <kyrie.wu@mediatek.com>
Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
---
 drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
index 7856a556c..d0fb68bc8 100644
--- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
+++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
@@ -850,8 +850,12 @@ static struct vb2_v4l2_buffer *mtk_jpeg_buf_remove(struct mtk_jpeg_ctx *ctx,
 static void mtk_jpeg_enc_stop_streaming(struct vb2_queue *q)
 {
 	struct mtk_jpeg_ctx *ctx = vb2_get_drv_priv(q);
+	struct mtk_jpeg_dev *jpeg = ctx->jpeg;
 	struct vb2_v4l2_buffer *vb;
 
+	if (jpeg->variant->multi_core)
+		vb2_wait_for_all_buffers(q);
+
 	while ((vb = mtk_jpeg_buf_remove(ctx, q->type)))
 		v4l2_m2m_buf_done(vb, VB2_BUF_STATE_ERROR);
 }
@@ -859,6 +863,7 @@ static void mtk_jpeg_enc_stop_streaming(struct vb2_queue *q)
 static void mtk_jpeg_dec_stop_streaming(struct vb2_queue *q)
 {
 	struct mtk_jpeg_ctx *ctx = vb2_get_drv_priv(q);
+	struct mtk_jpeg_dev *jpeg = ctx->jpeg;
 	struct vb2_v4l2_buffer *vb;
 
 	/*
@@ -866,6 +871,9 @@ static void mtk_jpeg_dec_stop_streaming(struct vb2_queue *q)
 	 * Before STREAMOFF, we still have to return the old resolution and
 	 * subsampling. Update capture queue when the stream is off.
 	 */
+	if (jpeg->variant->multi_core)
+		vb2_wait_for_all_buffers(q);
+
 	if (ctx->state == MTK_JPEG_SOURCE_CHANGE &&
 	    V4L2_TYPE_IS_CAPTURE(q->type)) {
 		struct mtk_jpeg_src_buf *src_buf;
-- 
2.51.0.windows.2

