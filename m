Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 282DD43CEF3;
	Sat, 10 Oct 2026 09:24:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.61.82.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791624270; cv=none; b=XO5jchLJONcEgHgq/fUTOgaiCKypbeTh8HQf+oOFSSjgN3FnPIjpVxGK0RQn9xI6AUCMTBt3yV3EUjnj2+CCFcjBeX/lTlOBntUmQUKAQfdl9P4XlmL3O7Fmup5cyGxfBPm0YgCzks5DZQCgQ+/2dMYYPvEYng138mYOmoo1Ibg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791624270; c=relaxed/simple;
	bh=3Ib78J1yf9V0EGia0PvdK7onPKBSH7Z9Px2fzBVrQ4o=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CGNCqn3eUAjzLi0cek7oHiyDpAyhsoEKeeFl50z3sRKqSRIbE8rlWhEGPwCWadaHAVahJK9zksW8a19sPlpc3cJkETwC859JGlYnj2uxeTLyDrboAihDAO60mAkpWNfu3sb4VbUFaABH0ue2HFpDXsiih2jI9lQR0cxXZhN5QaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=Gqz991xp; arc=none smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="Gqz991xp"
X-UUID: 5afd01eec48c11f18dc8c9802ae25ab1-20261010
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=Fd+b9e22NFCGgQ6TyTE0ORYTIGnLmzAJN/D1Fnt4unY=;
	b=Gqz991xpU3JCnq2kS5uia0kVXIRmPA8upepNUiaxj5MtvpV1uchAj3t9/hY7QANwudVdUeZaeymNwtdFNOVDBw2QqwDGCFUjuFU8ttEnquGDGcYOZNXhti1IKiniBPhcvz3ehDXY/bF6VGrnU0Q5ip+PMBasawXjq7EhrLJojXA=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.20,REQID:1e5f1ddc-e51e-496d-8d7b-2adbd07ac25c,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:291e20b,CLOUDID:e72dc136-6282-4b0c-af2d-f8e81f6df999,B
	ulkID:nil,BulkQuantity:0,SF:81|82|102|836|865|888|898,TC:-5,Content:0|15|5
	0|99,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI:0,
	OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 5afd01eec48c11f18dc8c9802ae25ab1-20261010
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw02.mediatek.com
	(envelope-from <kyrie.wu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1679064618; Sat, 10 Oct 2026 17:24:12 +0800
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Sat, 10 Oct 2026 17:24:11 +0800
Received: from gcnsap21.gcn.mediatek.inc (10.17.81.22) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Sat, 10 Oct 2026 17:24:10 +0800
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
Subject: [PATCH v11 08/10] media: mediatek: vcodec: Fix media device node number
Date: Sat, 10 Oct 2026 17:23:56 +0800
Message-ID: <be2d800f52a206c86606513b5e72708a63a2c833.1791623423.git.kyrie.wu@mediatek.com>
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

change media register device node number to a correct value.
The vfd minor is used to record the number of registered
video device nodes. The mdev_dec.devnode minor counter is
used to record the number of registered media device nodes.

Fixes: 41f03c673cb7b ("media: mediatek: vcodec: replace pr_* with dev_* for v4l2 debug message")
Signed-off-by: Kyrie Wu <kyrie.wu@mediatek.com>
Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c      | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c
index c8d9dbdf..d529cc76 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c
@@ -480,7 +480,8 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
 			goto err_media_reg;
 		}
 
-		dev_dbg(&pdev->dev, "media registered as /dev/media%d", vfd_dec->minor);
+		dev_dbg(&pdev->dev, "media registered as /dev/media%d",
+			dev->mdev_dec.devnode->minor);
 	}
 
 	mtk_vcodec_dbgfs_init(dev, false);
-- 
2.51.0.windows.2

