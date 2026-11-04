Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=210.61.82.184
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793759998;
	b=K4uTvLzlw9out7Jg74J8coqOXl/vf7u0GOxf/bQmo+Ja3TDs+ns3b7lOsJ6rjkyKWl1G
	 Q5U8xS2omzpQbSVeEUnHw0GSgWb/YSGMzP58+XPeqOrLjaWrsXxTlwpX/4fOSrPaNhRDh
	 jR6Lo7B8AzHbWduQckPU4g7hv3HVJcM69LhdYpK7p2DU/tPeN4PVcxf2e3hBF/pEMRbmY
	 faxj2lJysMWzgbo4OpfOn2LDIqCmVWpxEVMF2X/N1q/BlY8cbN7iimdUcBeM4l/fndjf/
	 IrFcwwJdK0NpLbxXUJLkT6XVB+RdqfNiZ3r+WaEKOhnVRYEJVZBEY2UTyeInmRbOO6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793759998;
	h=DMARC-Filter:X-UUID:DKIM-Signature:X-CID-P-RULE:X-CID-O-INFO:
	 X-CID-META:X-CID-BVR:X-CID-BAS:X-CID-FACTOR:X-CID-RHF:X-UUID:Received:
	 Received:Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding:Content-Type:X-MTK;
	bh=IWWmL06wb90kr9ZgafGX5jq8f7GYOPQUZd6qyaBYJyM=;
	b=YsOUphWasLKkzv45l0aHXDQ0XLLQzp6M9xEPZUjUXuR4zt2Nas0tCs34ggmWo/Fh+sIy
	 ojF2IS9K5JsXB9Yp4PY3OUhpgVyDt0FTO5aspHQTh1gdHV6lUk1vrq83aIn6VISuZLQcP
	 tPt1YdJ36uaK4cAgim+L87AUBhBvCrhTGvCXTDTsdwCQjjlbLMHGZmAmzlPapt5H1Ht0Q
	 eCLmwtj4mZdjxPhBMWf4na8tzNZV0MhXHg08/cisjmCmjYCArjUW2gIB4ce+BHNENiUpf
	 4xZ20o2HjM2kvOTv3TxtGBOue1ZZM6aKCzVgFjWBuFs4s50DA2udNsDLLkEpa+/s34A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mediatek.com;
	spf=pass smtp.mailfrom=mediatek.com;
	dkim=pass header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=lc7jVIpR;
	arc=none smtp.remote-ip=210.61.82.184
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 644D7606A326
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 02:39:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 644D7606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=lc7jVIpR
X-UUID: 016dd380d7f911f18dc8c9802ae25ab1-20261104
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=IWWmL06wb90kr9ZgafGX5jq8f7GYOPQUZd6qyaBYJyM=;
	b=lc7jVIpRwI3Y4Qyrjy/KO8B93DxURKufihYqGrlipjzkuJ+sA9rPjCmwAHv8ZUhmk2gOavR4MxZF1IVw9KHfiLkqQZ+D0c9RvoMdIQ0OWWMljcnX+LPWfRD2Xyi7c2Ip4b9WuIk7BYiLVx4UHUodYFGO6INUkYht0smF0alIfxs=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.21,REQID:b2b64599-746e-4edd-b3da-7bf9c7832de5,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:b0318ac,CLOUDID:1194e401-2558-43e9-8f0b-3d83d8900872,B
	ulkID:nil,BulkQuantity:0,SF:102|836|865|888|898,TC:-5,Content:0|15|50|99,E
	DM:-3,IP:nil,URL:99|1,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
	A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 016dd380d7f911f18dc8c9802ae25ab1-20261104
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw02.mediatek.com
	(envelope-from <justin.yeh@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1378834816; Wed, 04 Nov 2026 10:39:49 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 4 Nov 2026 10:39:48 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Wed, 4 Nov 2026 10:39:48 +0800
From: Justin Yeh <justin.yeh@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, Justin Yeh <justin.yeh@mediatek.com>
Subject: [PATCH RESEND] soc: mediatek: mtk-regulator-coupler: Allow building as a module
Date: Wed, 4 Nov 2026 10:38:29 +0800
Message-ID: <20261104023941.1687840-1-justin.yeh@mediatek.com>
X-Mailer: git-send-email 2.45.2
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
Resend, now that the dependency is in mainline: this was patch 2/2 of

  https://lore.kernel.org/all/20260903062056.1024263-3-justin.yeh@mediatek.com/

and patch 1/2 ("regulator: core: Export helpers used by regulator
couplers") was merged as commit 59951bd9c6b6 ("regulator: core: Export
helpers used by regulator couplers") and is in v7.4-rc1. The diff is
unchanged; it is resent on top of v7.4-rc1 as a standalone patch, as
AngeloGioacchino asked.

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

