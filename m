Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=60.244.123.138
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794792868;
	b=fhzdy8GR6N0H4y/SzMtvnh03IVia/YJ2Wx0K649mbXMswv8HqnzwJWN2xMBTnn5+MLXx
	 K2YlikXo8jSoM12qlDIUHPhHbTiNAKI1w0kR3B0o2wUr2n04NJHYj6hKxH8nRU2Vz1cWx
	 /+XPhHifkhEOAFj+I8AEVNZm3KZqxF/vpmhBWkq/5xu2QaXv0ezJr27ZC/Mbv75lnX7pT
	 H9Z2nck13GseC5J5L8ixIVi0dbziGP4+AfMXJk9MPBhghcA8sybg3UsQ1qib4HKDrIL51
	 4aEqgIXqvhwdSd4Ghktp0g0/lBxqTdbJv7mL2sqhqasiljddrvDZLXN89UM2EqoJb/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794792868;
	h=DMARC-Filter:X-UUID:DKIM-Signature:X-CID-P-RULE:X-CID-O-INFO:
	 X-CID-META:X-CID-BVR:X-CID-BAS:X-CID-FACTOR:X-CID-RHF:X-UUID:Received:
	 Received:Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 Content-Type:X-MTK;
	bh=oK6hMpb78yFCXSm1kGpSAsbSKO0DhHZiwBMgRif1dkU=;
	b=i5lXvnmu9Nl7st7ZWQD3OMfXGjN5KDQSi/Ri8dR4cZj9nLh/u3ZRa0xoobPHAFytw+vh
	 sk5cVbmZwH5eksjswpv+BplMbHUQjOtarnlomOPNNyOaYG9mOzgkzoNr4g+DJKFYu1b0z
	 QUaeokwdupEQTAb2+i6/1M/Ui9nbXYxi96kTVe69XhRaAQu664U31w9xNNxB67bBlx6HJ
	 Tnjpo/dijpD8VosJT4H9H5Shzuf4iPZ6KKI2zhG4jaRc/WqrNqfVSwrfo2YOWuvYxofCC
	 1ZM0DsbsmmQhV2dwmJ4wSImcW1AtjUx1lt8z40WZ7NOrceVf4sXzfRY4e2josn7juEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mediatek.com;
	spf=pass smtp.mailfrom=mediatek.com;
	dkim=pass header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b="RmZU0j/D";
	arc=none smtp.remote-ip=60.244.123.138
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52AF9606A8A6;
	Mon, 16 Nov 2026 01:34:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 52AF9606A8A6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=RmZU0j/D
X-UUID: d97a791ee15d11f1b1788b6acf885367-20261116
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=oK6hMpb78yFCXSm1kGpSAsbSKO0DhHZiwBMgRif1dkU=;
	b=RmZU0j/DHvJDAvDI7yXcDcXeqrB8rlm9LleXiREcRS+FgOpAVqnlACrDhsYWPrOTvC2ZMvsdZhFujgP1lS7EsmOYF9Lyy4V9KZF2LxzYucZGMEddB4MrAq0r7sxsN4/pVBW7bB40TwE6yobgwY0KgTorfAzC5nx7kawCR1vqvAk=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.21,REQID:8c223da6-e02a-4403-b29d-9e76bc495ccf,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:b0318ac,CLOUDID:88cee530-f289-4656-bb36-27baf4489f11,B
	ulkID:nil,BulkQuantity:0,SF:81|82|102|836|865|888|898,TC:-5,Content:0|15|5
	0|99,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0
	,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: d97a791ee15d11f1b1788b6acf885367-20261116
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw01.mediatek.com
	(envelope-from <kyrie.wu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1562918072; Mon, 16 Nov 2026 09:34:22 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 16 Nov 2026 09:34:20 +0800
Received: from gcnsap21.gcn.mediatek.inc (10.17.81.22) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Mon, 16 Nov 2026 09:34:19 +0800
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
Subject: [PATCH v19 10/13] media: dt-bindings: mediatek,jpeg: Add mediatek, mt8196-jpgdec compatible
Date: Mon, 16 Nov 2026 09:33:35 +0800
Message-ID: <20261116013402.1273016-11-kyrie.wu@mediatek.com>
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

Add the MT8196 JPEG decoder and decoder-core compatible strings.
Describe the child mediatek,smmu-config phandle to the dedicated JPEG
SMMU configuration syscon and require it for MT8196 decoder cores, so
the compatible and its hardware requirements are introduced together.

Signed-off-by: Kyrie Wu <kyrie.wu@mediatek.com>
---
 .../media/mediatek,mt8195-jpegdec.yaml        | 24 +++++++++++++++++--
 1 file changed, 22 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/mediatek,mt8195-jpegdec.yaml b/Documentation/devicetree/bindings/media/mediatek,mt8195-jpegdec.yaml
index e5448c60e..b1dccc3c8 100644
--- a/Documentation/devicetree/bindings/media/mediatek,mt8195-jpegdec.yaml
+++ b/Documentation/devicetree/bindings/media/mediatek,mt8195-jpegdec.yaml
@@ -14,7 +14,9 @@ description:
 
 properties:
   compatible:
-    const: mediatek,mt8195-jpgdec
+    enum:
+      - mediatek,mt8195-jpgdec
+      - mediatek,mt8196-jpgdec
 
   power-domains:
     maxItems: 1
@@ -44,7 +46,9 @@ patternProperties:
 
     properties:
       compatible:
-        const: mediatek,mt8195-jpgdec-hw
+        enum:
+          - mediatek,mt8195-jpgdec-hw
+          - mediatek,mt8196-jpgdec-hw
 
       reg:
         maxItems: 1
@@ -69,6 +73,22 @@ patternProperties:
       power-domains:
         maxItems: 1
 
+      mediatek,smmu-config:
+        $ref: /schemas/types.yaml#/definitions/phandle
+        description:
+          Phandle to the MT8196 JPEG SMMU configuration syscon used to
+          program this decoder's GUSER_ID fields.
+
+    allOf:
+      - if:
+          properties:
+            compatible:
+              contains:
+                const: mediatek,mt8196-jpgdec-hw
+        then:
+          required:
+            - mediatek,smmu-config
+
     required:
       - compatible
       - reg
-- 
2.51.0.windows.2

