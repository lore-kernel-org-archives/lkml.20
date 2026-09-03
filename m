Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AF3E3E172D
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 06:21:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.61.82.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788416478; cv=none; b=CuCG3U6OtVYLoD6BF+PxzFbH6oKk5xVXTRTTy7pPjr0CS2+HM7mPFm3TGJueeI9X3lYcKw2QpiMmtnRkMbSUbDeVE5aSAlq61wWjxTL7RMHuwHAGsDHC8vZ6/bAS5uMoF+O/J0/FuWBrA2k/NvbnQ8EQAwV7L27U22hsufYdBcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788416478; c=relaxed/simple;
	bh=1mYXeND5WHcpkvTVvQX+NsZay+Vdi9kCKVag4HLdPSQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kt60YUowicjPaQGpTgO9cHHX/F6B7pP81WpY8FkR4AO3maIUZAd3pBxtlBfzj0L4x0MTAEyDmwPdjRtfaFi57rdTdkEgyVB1bGtC+3UDG4qzTtVN5vLbdXDG+2Xj9wBesiyRjI5Vkt5BgWxzf1FYvZr11h8njCV4hKwNGfhDrls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=m6Zxpnoo; arc=none smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="m6Zxpnoo"
X-UUID: a5648ddca75f11f18dc8c9802ae25ab1-20260903
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=BCTA6O5xlylFQi8U1fv32AzVbh+DMDz/icuaWqG2JYg=;
	b=m6Zxpnoo+WvOJ6ILePXOMEW+XPqSOnVemsYddt8AgGtuBd8Ov9dhJwZkRuxLpo2g1Dz+ahPkDF2YbmV3J0tPMeUSybiZhPQRL/kZpxD1V7epfyAc0A0iEVzHTZabrB6QDeBRUrL9JABLZ9cE2TKR+Iie37oBXLJ3o/ip6zAl4m4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:82010d98-99e6-40f3-be72-6cddd08d7353,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:7db8b62,CLOUDID:36bd6296-8382-4d0c-b42c-b0965a0d23b4,B
	ulkID:nil,BulkQuantity:0,SF:81|82|102|836|865|888|898,TC:-5,Content:0|15|5
	0|99,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI:0,
	OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: a5648ddca75f11f18dc8c9802ae25ab1-20260903
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw02.mediatek.com
	(envelope-from <justin.yeh@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 336802033; Thu, 03 Sep 2026 14:21:06 +0800
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 3 Sep 2026 14:21:05 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Thu, 3 Sep 2026 14:21:05 +0800
From: Justin Yeh <justin.yeh@mediatek.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, Justin Yeh <justin.yeh@mediatek.com>
Subject: [PATCH 2/2] soc: mediatek: mtk-regulator-coupler: Allow building as a module
Date: Thu, 3 Sep 2026 14:20:47 +0800
Message-ID: <20260903062056.1024263-3-justin.yeh@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260903062056.1024263-1-justin.yeh@mediatek.com>
References: <20260903062056.1024263-1-justin.yeh@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N

MTK_REGULATOR_COUPLER is a bool whose prompt is only visible when
COMPILE_TEST is set, so on real MediaTek configurations the symbol has
no prompt at all and is forced to its default: it can only ever be
built in.

Turn it into a visible tristate so that the coupler can also be built
as a loadable module, which is what kernels shipping most of their
drivers as modules need. The "default ARCH_MEDIATEK" is kept, so
existing configurations keep building it in.

While at it, add the help text that the now user-visible prompt was
missing.

Signed-off-by: Justin Yeh <justin.yeh@mediatek.com>
---
 drivers/soc/mediatek/Kconfig | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/mediatek/Kconfig b/drivers/soc/mediatek/Kconfig
index d7293977f06e..4a2f2bccc213 100644
--- a/drivers/soc/mediatek/Kconfig
+++ b/drivers/soc/mediatek/Kconfig
@@ -56,9 +56,13 @@ config MTK_PMIC_WRAP
 	  hardware to connect the PMIC.
 
 config MTK_REGULATOR_COUPLER
-	bool "MediaTek SoC Regulator Coupler" if COMPILE_TEST
+	tristate "MediaTek SoC Regulator Coupler"
 	default ARCH_MEDIATEK
 	depends on REGULATOR
+	help
+	  Say yes here to add support for the MediaTek regulator coupler,
+	  which keeps the GPU supply and its coupled GPU SRAM supply
+	  voltage-balanced on the MediaTek SoCs that need it.
 
 config MTK_MMSYS
 	tristate "MediaTek MMSYS Support"
-- 
2.45.2

