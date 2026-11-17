Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=60.244.123.138
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794905936;
	b=4Y0pNzW4xvJRmB9/0mepGKOaoDib0PsbfvQsSezYRcZV177VGb/fLtbTNrST5pKeWqcU
	 5ieV5YPWUVZy0GmkTBRQcnak+QbnZNXOyvEE5YLwSnN2o0UkXUDbfvuqyixlaNjvd6Lab
	 phLqTRPVP5AKO7dJhDJX08W0NUQRcSDP9FpTwdjrtWWmV+osmZb3ByzBhZ4omxsaW3yp9
	 cUNB1+oz9Lx22WqwgpuR91QTiR+cMIoVBejWKinfwXWeLEIOP7HibOdoF27lJf842Eklb
	 w+sJf3/XdkY88T/7qA7rJk6llgzbWFVsZUW5dLfC+VL1qJnFXJrKnl5WsHGIeXdAr7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794905936;
	h=DMARC-Filter:X-UUID:DKIM-Signature:X-CID-P-RULE:X-CID-O-INFO:
	 X-CID-META:X-CID-BVR:X-CID-BAS:X-CID-FACTOR:X-CID-RHF:X-UUID:Received:
	 Received:Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 Content-Type:X-MTK;
	bh=JxDj8dsu3VTpd2HGTCa6+DJUtBB0nwp+X4SNqJKfF14=;
	b=p7qLpbjQgtYIuloFS2PLCGdYUY3Ij4vH816UCjGeJu4dRGXW/1YXeDGE9DwF8CPWn2IK
	 2qRdLCZMO4/adAQLLtkJbxMKoRFoP33/v63Uiynqrk4V38ruPbmwzunGUR0AZeoCEgxoL
	 F4FOQ7yyc8eYbXSRhaTjSblCWero8W0WUILl/+GAXKSiDtIQBNXV6MXCGv03e5wk5pR60
	 rto19lDzYSSNPL35WvAR1pX+D1I2vCKsdF3PxIZ/JyzgKXPKf/EXkqFo1uTTz/S8Kl/SC
	 jLw6vDe+TRlk/1FnzoH2dXQIOX8GBsJjXJJCR79s+8GMDln4PTqQNeuhJLL3BjwrBtA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mediatek.com;
	spf=pass smtp.mailfrom=mediatek.com;
	dkim=pass header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=fZuY5Q+F;
	arc=none smtp.remote-ip=60.244.123.138
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3709660A260A;
	Tue, 17 Nov 2026 08:58:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3709660A260A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=fZuY5Q+F
X-UUID: 1aedc7d6e26511f1b1788b6acf885367-20261117
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=JxDj8dsu3VTpd2HGTCa6+DJUtBB0nwp+X4SNqJKfF14=;
	b=fZuY5Q+FJeVfY/6KaonEoW5pAzga+O5pHVh+DbRNC3ux9ppEVVhcyjiskxc+5Z4YPiPTYCaMH6C7OFK+vEUHhofkF8m0pqOG4kbxSlPos6IKe2/hoqWgNq2s7RLepVz2rs+qaLQwzNn2xaT6wV6DmWzFevp83OSLSH/okoWDdOs=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.21,REQID:957b8965-32c4-48e0-858d-c8177ea2afb9,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:b0318ac,CLOUDID:15b0b2e5-d982-4007-9b34-7130451043ce,B
	ulkID:nil,BulkQuantity:0,SF:81|82|102|836|865|888|898,TC:-5,Content:0|15|5
	0|99,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0
	,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 1aedc7d6e26511f1b1788b6acf885367-20261117
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw01.mediatek.com
	(envelope-from <kyrie.wu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 819982166; Tue, 17 Nov 2026 16:58:49 +0800
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 17 Nov 2026 16:58:48 +0800
Received: from gcnsap21.gcn.mediatek.inc (10.17.81.22) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Tue, 17 Nov 2026 16:58:47 +0800
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
Subject: [PATCH v12 08/10] media: mediatek: vcodec: Fix media device node number
Date: Tue, 17 Nov 2026 16:58:31 +0800
Message-ID: <20261117085834.1464723-9-kyrie.wu@mediatek.com>
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
index a052f4d95..5b318afa1 100644
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

