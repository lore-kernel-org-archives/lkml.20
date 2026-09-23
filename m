Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3FE838BF89;
	Wed, 23 Sep 2026 02:43:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.244.123.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790131410; cv=none; b=qMqqmOE9r7LPDgAXDyAr8Rib3FiZR4KSmH0z/XVMciaav67hRc8I440NyEH003O01z1JSK8I7f9rKbkQDgHhz/WaDwo3E9riTrRCnQX2Y0gi1tnjIgfhftLBBr56gF0JXQBeGdloegP/wSKEg8YOBr9Ix0crM4rtF+PyX9+wv3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790131410; c=relaxed/simple;
	bh=x1aiIOCF72GDJrftWrogmE1pT98XUVHZmmFovP4/Miw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SoXdNmLY+dfwXsab2GmmZBd2J4GJAJNXAm8HLz3J5DQcVziLNdHOmMTLNM208Gq8JcJJ22eQlbxjKQwruiQ9QqqrM1h5666qKldLzmyXQGV0Jl+NqZYDOsGigF9Ef3dYgm6KUYaYsbPgq0NsF+vJEmYFNkcW8myD4/QAHTj24uw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=aMm4x5rf; arc=none smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="aMm4x5rf"
X-UUID: 86d9efbcb6f811f1b1788b6acf885367-20260923
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=VB/PnLSy1Qmjr5GM8tF6ove7cL99TMo7OZ29mqGEy+A=;
	b=aMm4x5rfE/pn5k0VSFy1EtfmZAQgt5ue4ZhulMQY/m3gJRqQxSW69uNCxvdRhz8IWNVBY2mqJCCI4/ncT7Yw7mTpEFrH2frenE5PboF8Aw842cs7oLx0UHBxYO4IjI1zZrEAW1BOXaE6WBpqN6bQh2jv8ItiZ+tnDtVDCqJeDjE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:9369f7fd-de53-4668-b9dc-462784b033b6,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:7db8b62,CLOUDID:93b58794-3103-4fdb-b79c-08de0e281a5d,B
	ulkID:nil,BulkQuantity:0,SF:81|82|102|836|865|888|898,TC:-5,Content:0|15|5
	0|99,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI:0,
	OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 86d9efbcb6f811f1b1788b6acf885367-20260923
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw01.mediatek.com
	(envelope-from <kyrie.wu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 757649230; Wed, 23 Sep 2026 10:43:15 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 23 Sep 2026 10:43:14 +0800
Received: from gcnsap21.gcn.mediatek.inc (10.17.81.22) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Wed, 23 Sep 2026 10:43:12 +0800
From: Kyrie Wu <kyrie.wu@mediatek.com>
To: Tiffany Lin <tiffany.lin@mediatek.com>, Andrew-CT Chen
	<andrew-ct.chen@mediatek.com>, Yunfei Dong <yunfei.dong@mediatek.com>, Mauro
 Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Kyrie Wu <kyrie.wu@mediatek.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>, Ricardo Ribalda
	<ribalda@chromium.org>, Kees Cook <kees@kernel.org>, Hans Verkuil
	<hverkuil+cisco@kernel.org>, Fei Shao <fshao@chromium.org>, Haoxiang Li
	<haoxiang_li2024@163.com>, Chen-Yu Tsai <wenst@chromium.org>, Laurent
 Pinchart <laurent.pinchart+renesas@ideasonboard.com>, Tomasz Figa
	<tfiga@chromium.org>, Philipp Zabel <p.zabel@pengutronix.de>, Benjamin
 Gaignard <benjamin.gaignard@collabora.com>, Qianfeng Rong
	<rongqianfeng@vivo.com>, Irui Wang <irui.wang@mediatek.com>, Jacopo Mondi
	<jacopo.mondi@ideasonboard.com>, Fan Wu <fanwu01@zju.edu.cn>,
	<linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>
CC: Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: [PATCH v7 08/14] Add the MT8196 compatible string to the MediaTek vcodec subdev decoder binding.
Date: Wed, 23 Sep 2026 10:42:51 +0800
Message-ID: <20260923024258.257846-9-kyrie.wu@mediatek.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260923024258.257846-1-kyrie.wu@mediatek.com>
References: <20260923024258.257846-1-kyrie.wu@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N

Compared to previous ICs, the MT8196 supports a 10-bit decoder
and has a decoding capability of 4K@120fps. It also supports
36-bit DRAM IOVA address and Video Power Control to optimize
bandwidth and voltage usage.

Signed-off-by: Kyrie Wu <kyrie.wu@mediatek.com>
Acked-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
---
 .../media/mediatek,vcodec-subdev-decoder.yaml | 50 ++++++++++++++++++-
 1 file changed, 49 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/mediatek,vcodec-subdev-decoder.yaml b/Documentation/devicetree/bindings/media/mediatek,vcodec-subdev-decoder.yaml
index d1d209cbb..618be8c52 100644
--- a/Documentation/devicetree/bindings/media/mediatek,vcodec-subdev-decoder.yaml
+++ b/Documentation/devicetree/bindings/media/mediatek,vcodec-subdev-decoder.yaml
@@ -76,6 +76,7 @@ properties:
       - mediatek,mt8186-vcodec-dec
       - mediatek,mt8188-vcodec-dec
       - mediatek,mt8195-vcodec-dec
+      - mediatek,mt8196-vcodec-dec
 
   reg:
     minItems: 1
@@ -96,6 +97,12 @@ properties:
       The node of system control processor (SCP), using
       the remoteproc & rpmsg framework.
 
+  mediatek,vcp:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: |
+      The node of video companion processor (VCP), using
+      the remoteproc & rpmsg framework.
+
   "#address-cells":
     const: 2
 
@@ -163,7 +170,6 @@ required:
   - compatible
   - reg
   - iommus
-  - mediatek,scp
   - ranges
 
 if:
@@ -179,6 +185,48 @@ then:
     - interrupts
 
 allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: mediatek,mt8196-vcodec-dec
+
+    then:
+      required:
+        - mediatek,vcp
+
+      properties:
+        mediatek,scp: false
+
+      patternProperties:
+        '^video-codec@[0-9a-f]+$':
+          properties:
+            compatible:
+              enum:
+                - mediatek,mtk-vcodec-core
+                - mediatek,mtk-vcodec-lat
+
+            clock-names:
+              items:
+                - const: sel
+                - const: vdec
+                - const: lat
+                - const: top
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - mediatek,mt8192-vcodec-dec
+              - mediatek,mt8186-vcodec-dec
+              - mediatek,mt8188-vcodec-dec
+              - mediatek,mt8195-vcodec-dec
+
+    then:
+      required:
+        - mediatek,scp
+
   - if:
       properties:
         compatible:
-- 
2.51.0.windows.2

