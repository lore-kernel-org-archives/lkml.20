Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=60.244.123.138
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794792866;
	b=G1oX38RO4Xwchr7b/UPNGpwRzHU9R75dSbrls3XMKG5h2KDiHxQb9/mJXC0YSWcDx4bg
	 Bqg2DsCrTJzlDtpigISlLdM5ckS5PvRJ3jJtwQXa1QM5f3lwuy5ibxXzYtPemirzICTOS
	 T8RGzvJgDAmkQLogO5O2XwwFEYY+qvfHfiRTxjw+ZH2YPphH0EV/KaJcz/w+S/7Tuy3rp
	 SeNYgjcS56snFgbl+oM0kKyZ9s87kRy1xt32EPhnFNLNgR+Mi7a9dM+7qfz1N9Han+enr
	 t5TPew3FBcwAEaDVLIcw/fVigVBxspMmNTAJVru/IbV66A9+L/8GYaQHO91+SB+HXJQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794792866;
	h=DMARC-Filter:X-UUID:DKIM-Signature:X-CID-P-RULE:X-CID-O-INFO:
	 X-CID-META:X-CID-BVR:X-CID-BAS:X-CID-FACTOR:X-CID-RHF:X-UUID:Received:
	 Received:Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 Content-Type:X-MTK;
	bh=p4Sgu9+wyhPOBxc0f56Q89MG92E3siMZXun1AnFFUZA=;
	b=3NzO4ga3LnDfqx6sEAdtYhSREouMiGvxM1+gnP9wCquBrbsr86J9RcSfXw8PsvxsSWuE
	 aGS4GBGJxmO3H3+m6iwlrjulHRSa84gwvhoeP64Li+lVzu9mn6Uh2+w7evE3Ej9mQ0aaU
	 tGqNStUNbjhRzdeWXzYs91doS4iRI+HOZ0v0ilZKmEU97WqtZz2Rr5SXdGgUl7VPRCifx
	 MWeyS2C+z4rTEr/STjFdTOUHhQzC9Zr89fThSPwG9peEMDfsAf4rXpAnR9qFWJH3dA1Kd
	 EeUgC0ookPATcsj+39TKouGJMEavQCwHQTbzll2LNeIhKOrmDrfOtsyGQs2XfGOOVgQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mediatek.com;
	spf=pass smtp.mailfrom=mediatek.com;
	dkim=pass header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=Y+9rof1c;
	arc=none smtp.remote-ip=60.244.123.138
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAE5960A261D;
	Mon, 16 Nov 2026 01:34:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EAE5960A261D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=Y+9rof1c
X-UUID: d7fb1a30e15d11f1b1788b6acf885367-20261116
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=p4Sgu9+wyhPOBxc0f56Q89MG92E3siMZXun1AnFFUZA=;
	b=Y+9rof1cjLoqXhv5nbZ04//nqeHaz7nmwSqNaEOvDAZ1338KoysAhty8mqhl1knYfYfsFI2Jo3T7aQsTbXTykJ/rUNhDVYzYFN83bk8TUApllGckSx1eQWHan/08Zv386t+MA4rN0m0CpYhNTLu9ci+FsmUergJqIULytocBphI=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.21,REQID:f99ce46b-6973-4fdb-aabd-556f503338dd,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:b0318ac,CLOUDID:b64a16e2-fda1-4acf-b5b4-cc5598a4e59b,B
	ulkID:nil,BulkQuantity:0,SF:81|82|102|836|865|888|898,TC:-5,Content:0|15|5
	0|99,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0
	,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: d7fb1a30e15d11f1b1788b6acf885367-20261116
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw01.mediatek.com
	(envelope-from <kyrie.wu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 131611511; Mon, 16 Nov 2026 09:34:19 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS09N1.mediatek.inc (172.21.101.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 16 Nov 2026 09:34:18 +0800
Received: from gcnsap21.gcn.mediatek.inc (10.17.81.22) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Mon, 16 Nov 2026 09:34:17 +0800
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
Subject: [PATCH v19 08/13] media: mediatek: jpeg: fix remove buffer removal timing for multi-core
Date: Mon, 16 Nov 2026 09:33:33 +0800
Message-ID: <20261116013402.1273016-9-kyrie.wu@mediatek.com>
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

Remove prepared source and destination buffers from the M2M ready
queues in the multi-core decoder after destination preparation succeeds
and before arming the timeout or starting hardware, matching the encoder
flow. Completion can then return buffers without leaving them linked
in a ready queue. Preparation failures keep the existing cleanup path.

Fixes: 86379bd9d399 ("media: mtk-jpeg: Fixes jpeg enc&dec worker sw flow")
Signed-off-by: Kyrie Wu <kyrie.wu@mediatek.com>
---
 drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
index a34f2d6a5..1a289e448 100644
--- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
+++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
@@ -1760,9 +1760,6 @@ retry_select:
 		goto dec_end;
 	}
 
-	v4l2_m2m_src_buf_remove(ctx->fh.m2m_ctx);
-	v4l2_m2m_dst_buf_remove(ctx->fh.m2m_ctx);
-
 	mtk_jpeg_set_dec_src(ctx, &src_buf->vb2_buf, &bs);
 	if (mtk_jpeg_set_dec_dst(ctx,
 				 &jpeg_src_buf->dec_param,
@@ -1777,6 +1774,9 @@ retry_select:
 	jpeg_dst_buf->frame_num = ctx->total_frame_num;
 	ctx->total_frame_num++;
 
+	v4l2_m2m_src_buf_remove(ctx->fh.m2m_ctx);
+	v4l2_m2m_dst_buf_remove(ctx->fh.m2m_ctx);
+
 	schedule_delayed_work(&comp_jpeg[hw_id]->job_timeout_work,
 			      msecs_to_jiffies(MTK_JPEG_HW_TIMEOUT_MSEC));
 
-- 
2.51.0.windows.2

