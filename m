Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=210.61.82.184
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794792869;
	b=WZNHm86isgDz1mWh9qTfBKw15xG3DqvUaKA+Qc+b7pBC7aQHF95NvIY4MSILEyzjTpFX
	 /0E4t3i4XIpjTNmrn22wwZYbdVUUTKvVOfUjIPSwG5W/bhC5TDuAVs//sQju72IK9UW2U
	 y///8+pU/97m25yBUxZy7y1whGOvajJCp6ZX9nk26xArFP5BHJjvEOWTADhh+R+DwFsT5
	 A+hCw4bRiv5+opv0xvOa01COPYUvnNSWOfOHbQI8llPNjQCnrNaAge0CFGz9UgPImdye+
	 rERf9fujVvnNFAQh90tReO341VTQYu7LMiQp1g5tSd7tDJB1D6tMn8ib0LVAAJL2cXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794792869;
	h=DMARC-Filter:X-UUID:DKIM-Signature:X-CID-P-RULE:X-CID-O-INFO:
	 X-CID-META:X-CID-BVR:X-CID-BAS:X-CID-FACTOR:X-CID-RHF:X-UUID:Received:
	 Received:Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 Content-Type:X-MTK;
	bh=JRQ9dUCL3gEAvoiCZU/uy/8OGTNyV/lMFjcH0Nid9QI=;
	b=UveB9o1iZpY3Q9LhZS+sVGuJ/emxnbDHfqYQESdx5FfCyou5QPfy8sEM/JNNG0roAa2y
	 KHneEbx63m5zolYh9tweFUJwnVJt0ABI3UD5ucKKvgq34kZEp9dG44notOj7Qel3KuPes
	 5Uc+JJkbgWMfWkDuGGxF0wQ2vRZ9RFL9dRhjMgq5J0DJrDDimxrTv1hPE13rBW0BSdDiE
	 CgwiofFO4NzbFbZHIchaIL2iyWG05zZeLNuYBNQsX1IqOBRDfT58A0b6VH4CkbSBRrKvA
	 E94w59/OhXGFH0EJzG+Waa0Fc7ElSCXGBdSLbcf83fIvUqnwyL3H31tN7CJU344Uz6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mediatek.com;
	spf=pass smtp.mailfrom=mediatek.com;
	dkim=pass header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b="GXr/dRb+";
	arc=none smtp.remote-ip=210.61.82.184
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 560CF60A262A;
	Mon, 16 Nov 2026 01:34:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 560CF60A262A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=GXr/dRb+
X-UUID: d9f9a180e15d11f18dc8c9802ae25ab1-20261116
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=JRQ9dUCL3gEAvoiCZU/uy/8OGTNyV/lMFjcH0Nid9QI=;
	b=GXr/dRb+l3gdC9yKxIjaro0ga6aSASj3U36/3KpBK9oMIlAi+8OEKXn2VIymKhr7sebOagJ6ad/5c5+bIu3DJqHAIiCFEjAAbEesqHHjemvvt95rEYLBvd9dJVyivoEZ4+PJjuMxok83OFui1AkwrxXb7iG73fKuKIbEDgiNvTg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.21,REQID:72757fe0-4dd6-45f0-b704-09c271a2e63a,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:b0318ac,CLOUDID:d14a16e2-fda1-4acf-b5b4-cc5598a4e59b,B
	ulkID:nil,BulkQuantity:0,SF:81|82|102|836|865|888|898,TC:-5,Content:0|15|5
	0|99,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0
	,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: d9f9a180e15d11f18dc8c9802ae25ab1-20261116
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw02.mediatek.com
	(envelope-from <kyrie.wu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 100605174; Mon, 16 Nov 2026 09:34:23 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 16 Nov 2026 09:34:22 +0800
Received: from gcnsap21.gcn.mediatek.inc (10.17.81.22) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Mon, 16 Nov 2026 09:34:21 +0800
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
Subject: [PATCH v19 11/13] media: dt-bindings: mediatek,jpeg: Add mediatek, mt8196-jpgenc compatible
Date: Mon, 16 Nov 2026 09:33:36 +0800
Message-ID: <20261116013402.1273016-12-kyrie.wu@mediatek.com>
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

Add the MT8196 JPEG encoder and encoder-core compatible strings.
Describe the child mediatek,smmu-config phandle to the dedicated JPEG
SMMU configuration syscon and require it for MT8196 encoder cores.

Document SMMU stream IDs for MT8196 while retaining the MediaTek IOMMU
master-port description for MT8195.

Signed-off-by: Kyrie Wu <kyrie.wu@mediatek.com>
---
 .../media/mediatek,mt8195-jpegenc.yaml        | 39 +++++++++++++++----
 1 file changed, 32 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/mediatek,mt8195-jpegenc.yaml b/Documentation/devicetree/bindings/media/mediatek,mt8195-jpegenc.yaml
index 596186497..46597003e 100644
--- a/Documentation/devicetree/bindings/media/mediatek,mt8195-jpegenc.yaml
+++ b/Documentation/devicetree/bindings/media/mediatek,mt8195-jpegenc.yaml
@@ -14,7 +14,9 @@ description:
 
 properties:
   compatible:
-    const: mediatek,mt8195-jpgenc
+    enum:
+      - mediatek,mt8195-jpgenc
+      - mediatek,mt8196-jpgenc
 
   power-domains:
     maxItems: 1
@@ -22,9 +24,11 @@ properties:
   iommus:
     maxItems: 4
     description:
-      Points to the respective IOMMU block with master port as argument, see
-      Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml for details.
-      Ports are according to the HW.
+      Phandles to the respective IOMMU blocks. For MT8195, the argument is
+      a hardware master port; see
+      Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml.
+      For MT8196, the argument is an SMMU stream ID; see
+      Documentation/devicetree/bindings/iommu/arm,smmu-v3.yaml.
 
   "#address-cells":
     const: 2
@@ -44,7 +48,9 @@ patternProperties:
 
     properties:
       compatible:
-        const: mediatek,mt8195-jpgenc-hw
+        enum:
+          - mediatek,mt8195-jpgenc-hw
+          - mediatek,mt8196-jpgenc-hw
 
       reg:
         maxItems: 1
@@ -53,8 +59,11 @@ patternProperties:
         minItems: 1
         maxItems: 32
         description:
-          List of the hardware port in respective IOMMU block for current Socs.
-          Refer to bindings/iommu/mediatek,iommu.yaml.
+          Phandles to the respective IOMMU blocks. For MT8195, the argument is
+          a hardware master port; see
+          Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml.
+          For MT8196, the argument is an SMMU stream ID; see
+          Documentation/devicetree/bindings/iommu/arm,smmu-v3.yaml.
 
       interrupts:
         maxItems: 1
@@ -69,6 +78,22 @@ patternProperties:
       power-domains:
         maxItems: 1
 
+      mediatek,smmu-config:
+        $ref: /schemas/types.yaml#/definitions/phandle
+        description:
+          Phandle to the MT8196 JPEG SMMU configuration syscon used to
+          program this encoder's GUSER_ID fields.
+
+    allOf:
+      - if:
+          properties:
+            compatible:
+              contains:
+                const: mediatek,mt8196-jpgenc-hw
+        then:
+          required:
+            - mediatek,smmu-config
+
     required:
       - compatible
       - reg
-- 
2.51.0.windows.2

