Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC0A83E00AA
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 06:21:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.244.123.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788416512; cv=none; b=nLbZqIHTIkiLrNGbsRouD4WYVmhpmOmDP1MH9NoUDPMXFPi/GD45w+Eje8wsoh8eBO4X4775hbzSlOCZ8rsNhDD1TeoI26Sf1wP3erAGFtU+6SLcUCqIKHsrt1oESYQ1eW6ZQ5YzLd+g2St20XdzoLvzB6049k0TV5LgCrg6YNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788416512; c=relaxed/simple;
	bh=BQeaunhfw2eYyNTATt67o4c1lJtOmSEtVbZNNxbYwQs=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=pczVext7UgZF8fyQgGgu9XvMgdNxJNKngZE7HgmMwTKtKUrQKLrk6RWHk02sOy6299Lw0Anb6LTPuIjv65YUTnbaHm1aXjC3RLj0BTgxfBI8+1EVfJhgmiA0O4GoEwjIethWePbMaW+cmimDIw9Vy3qcvHtENDECbkJKV1w0AZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=GbUGAfXm; arc=none smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="GbUGAfXm"
X-UUID: bce5c69ca75f11f1b1788b6acf885367-20260903
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=GyYjgTttZtjkAr8NAkvK68j3Vbwf6uVP9KCugF+tJnk=;
	b=GbUGAfXmU+37mZ4zAZWcMJXvHO/ChkE3eGs5p/rOkhG4TGA4dLZ33ta1Z0Hy7KuQLNu5C2RFQwX/wQl5vxUQxx72ICYbjRrKSm3AiGGEg6eakdWhvmCF1gK6aRozaMH8rinDHqZLHL4vSNIHvcgtd5GhFWu5dJJw4zMDCO7I37M=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:fef4410d-9ea5-449f-85ae-189c747a7632,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:7db8b62,CLOUDID:87087423-5869-48e3-bf78-b0f483615649,B
	ulkID:nil,BulkQuantity:0,SF:102|136|836|865|888|898,TC:-5,Content:0|15|50|
	99,EDM:-3|-100,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI
	:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: bce5c69ca75f11f1b1788b6acf885367-20260903
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw01.mediatek.com
	(envelope-from <justin.yeh@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 176744757; Thu, 03 Sep 2026 14:21:45 +0800
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 3 Sep 2026 14:21:44 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Thu, 3 Sep 2026 14:21:44 +0800
From: Justin Yeh <justin.yeh@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, Justin Yeh <justin.yeh@mediatek.com>
Subject: [PATCH] soc: mediatek: mtk-regulator-coupler: Add support for MT8189
Date: Thu, 3 Sep 2026 14:21:24 +0800
Message-ID: <20260903062142.1025443-1-justin.yeh@mediatek.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N

MT8189 couples its GPU supply (buck_vgpu) with the GPU SRAM supply
(ldo_sram_gpu), which is exactly the GPU<->SRAM relationship this
coupler already handles for MT8183, MT8186, MT8188 and MT8192.

Register the coupler on MT8189 as well so that both supplies stay
voltage-balanced.

Signed-off-by: Justin Yeh <justin.yeh@mediatek.com>
---
 drivers/soc/mediatek/mtk-regulator-coupler.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/mediatek/mtk-regulator-coupler.c b/drivers/soc/mediatek/mtk-regulator-coupler.c
index 0b6a2884145e..1109e3d9a319 100644
--- a/drivers/soc/mediatek/mtk-regulator-coupler.c
+++ b/drivers/soc/mediatek/mtk-regulator-coupler.c
@@ -148,6 +148,7 @@ static int mediatek_regulator_coupler_init(void)
 	if (!of_machine_is_compatible("mediatek,mt8183") &&
 	    !of_machine_is_compatible("mediatek,mt8186") &&
 	    !of_machine_is_compatible("mediatek,mt8188") &&
+	    !of_machine_is_compatible("mediatek,mt8189") &&
 	    !of_machine_is_compatible("mediatek,mt8192"))
 		return 0;
 
-- 
2.45.2

