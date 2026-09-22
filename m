Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C9C54562A6;
	Tue, 22 Sep 2026 09:15:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.244.123.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790068548; cv=none; b=ann/hTucGJTWXfbHcg7hJk3rpzy8KbXMXUOYZkpn5UfDPPy+4AQg7M3nImwcwTz3jVeHUXddimwGHCtU7L4ifEllUpyDahSN6ikBBtpV4kSnZxy+ahQrT+eYSmiZb7Hrnyswsp825UrF+COmda06DU0dScuwoNY5iYB7Z4QuGyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790068548; c=relaxed/simple;
	bh=yU6XEeK164oWs9/TS/6lXTysg3hqlP1/v05f/JeUyJY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IpjkI2wpw3HGe5wdTGTtevDyiUK2haceTT5NUVL9S9Yv/jd0uQE5897L3aWL4Py/VACC9mRqcMP2vR3eB6QaRcAag5xuCEPCTEpLzA4Xj5q4w3k6+f7uWNBB3w/CjIyh8poU7SvQoT+2CNavpdtxnIeb0ci6aIV+FS4CyS8WH9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=tPOHA/OT; arc=none smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="tPOHA/OT"
X-UUID: 2eeb300ab66611f1b1788b6acf885367-20260922
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=fOpsBLVqc+uJVBy2XaIQpZ01Hi4aRvrpaPdzwgJXp9o=;
	b=tPOHA/OTBa42NQOszUzW+XF603LuCwl8GYyMVFFJW/dgBa6YmMBE3rrB8Bi8JJtNlHfXrZckWCmM3fCU7I0gR6UMiQf0wM6uJQcixwY4RCkBA2e810K+7XzA0twT+mFMk/aSspIOQP9iLQYrYsGegdyFv5h/lh3CGPcQ42rXNhI=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:912e8d83-a0b0-4cdc-90ad-6830160142ef,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:7db8b62,CLOUDID:a061697c-2058-4298-90ad-1156c3f1dffd,B
	ulkID:nil,BulkQuantity:0,SF:81|82|102|836|865|888|898,TC:-5,Content:0|15|5
	0|99,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI:0,
	OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 2eeb300ab66611f1b1788b6acf885367-20260922
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw01.mediatek.com
	(envelope-from <kyrie.wu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 321662175; Tue, 22 Sep 2026 17:15:41 +0800
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 22 Sep 2026 17:15:40 +0800
Received: from gcnsap21.gcn.mediatek.inc (10.17.81.22) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Tue, 22 Sep 2026 17:15:39 +0800
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
Subject: [PATCH v17 07/12] media: mediatek: jpeg: fix resolution change event handling in decoder
Date: Tue, 22 Sep 2026 17:15:24 +0800
Message-ID: <20260922091530.241762-8-kyrie.wu@mediatek.com>
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

This patch refines the handling of resolution change events within
JPEG decoder worker. The `mtk_jpeg_set_queue_data` function is now
called to set up queue data before signaling a source change through
`mtk_jpeg_queue_src_chg_event`. By reorganizing these calls, the
patch ensures that necessary queue information is updated prior to
transitioning the context state to `MTK_JPEG_SOURCE_CHANGE`.
A condition is added to exit early if the context is already in the
`MTK_JPEG_SOURCE_CHANGE` state, preventing redundant operations and
improving processing efficiency.

Fixes: dedc21500334 ("media: mtk-jpegdec: add jpeg decode worker interface")
Signed-off-by: Kyrie Wu <kyrie.wu@mediatek.com>
Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
---
 drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
index e152ebae0..edd9e2d0a 100644
--- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
+++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
@@ -1738,11 +1738,15 @@ static void mtk_jpegdec_worker(struct work_struct *work)
 
 	if (mtk_jpeg_check_resolution_change(ctx,
 					     &jpeg_src_buf->dec_param)) {
-		mtk_jpeg_queue_src_chg_event(ctx);
+		mtk_jpeg_set_queue_data(ctx, &jpeg_src_buf->dec_param);
 		ctx->state = MTK_JPEG_SOURCE_CHANGE;
+		mtk_jpeg_queue_src_chg_event(ctx);
 		goto getbuf_fail;
 	}
 
+	if (ctx->state == MTK_JPEG_SOURCE_CHANGE)
+		goto getbuf_fail;
+
 	mtk_jpegdec_set_hw_param(ctx, hw_id, src_buf, dst_buf);
 	ret = pm_runtime_resume_and_get(comp_jpeg[hw_id]->dev);
 	if (ret < 0) {
-- 
2.51.0.windows.2

