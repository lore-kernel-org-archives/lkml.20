Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7743938A739;
	Sat, 10 Oct 2026 08:07:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.61.82.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791619673; cv=none; b=uKaZmCQNzeQQPGAdrTMU8dHcIYfj6aSw+4RHsw/DcOuTWJBgaitFa5mhTh/szKE5ROLLNLOfDxg/IEWhZq8vAyju0vltisIEqEfSqLQT2+nGGmxeW6uUbdM3iVzSh1KFao551CbPB8einjhXsocxj6ZIdJ8EZzzXxAwX6O+dSvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791619673; c=relaxed/simple;
	bh=yo/7UPsYdJztspZMTenz9iPZozANUbzY3Zm4kvltFlA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XhJCGX16F3kDQ+0VJ3zr7pH2sqhQ+zqYMODzwgrqg4J58emVY4tx9rlPREgKxVMNc97TVILxTugcsWWpSeuBdhcGe5OO4NPbrwJLuIhbbLm2pJNmcLGq1nD9AGfUxYPbsehnYqEC5507iWh6T+D7yLTwVkIcN7Mc+QfVGu0Az0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=hmcko8UG; arc=none smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="hmcko8UG"
X-UUID: a7021562c48111f18dc8c9802ae25ab1-20261010
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=/3VPvRSdYuSWm5k/oAdKI8FbgeswWe8hFqnm53gZ7iY=;
	b=hmcko8UGWDT5n1TerB0lHdwzG8TeUK3eFbYP9cYE9YG7ivjrSS1cA/xqgnrAH1YmlfhuQF7R1b1ovhyX7ozeNU4638dkTflXouAUW9ru04TRPr8fHOoI5YOnPd9owE2Tkafdih+fm0B7b2HmvpG8GiCSPYHe4QQJ8roezhyV6/k=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.20,REQID:077405f2-0d11-4f4f-a794-c79fc3869054,IP:0,U
	RL:25,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:20
X-CID-META: VersionHash:291e20b,CLOUDID:ea572c20-2f17-48f6-b8a0-2bb5971c52b4,B
	ulkID:nil,BulkQuantity:0,SF:81|82|102|836|865|888|898,TC:-5,Content:0|15|5
	0|99,EDM:-3,IP:nil,URL:81|106|11|97|99|83|1,File:130,RT:0,Bulk:nil,QS:nil,
	BEC:-1,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: a7021562c48111f18dc8c9802ae25ab1-20261010
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by mailgw02.mediatek.com
	(envelope-from <kyrie.wu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 139091251; Sat, 10 Oct 2026 16:07:35 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Sat, 10 Oct 2026 16:07:34 +0800
Received: from gcnsap21.gcn.mediatek.inc (10.17.81.22) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Sat, 10 Oct 2026 16:07:33 +0800
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
Subject: [PATCH v18 12/13] dt-bindings: mediatek: Add MT8196 JPEG SMMU bindings
Date: Sat, 10 Oct 2026 16:07:16 +0800
Message-ID: <77ae5bfdedb1240420fd1aced446c9dfee38283e.1791614327.git.kyrie.wu@mediatek.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1791614327.git.kyrie.wu@mediatek.com>
References: <cover.1791614327.git.kyrie.wu@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N

Document the decoder and encoder phandles and describe the dedicated
JPEG SMMU configuration syscon for MT8196.

Signed-off-by: Kyrie Wu <kyrie.wu@mediatek.com>
---
 .../media/mediatek,mt8195-jpegdec.yaml        | 16 ++++++++
 .../media/mediatek,mt8195-jpegenc.yaml        | 16 ++++++++
 .../mediatek/mediatek,mt8196-jpeg-smmu.yaml   | 41 +++++++++++++++++++
 MAINTAINERS                                   |  2 +
 4 files changed, 75 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/mediatek/mediatek,mt8196-jpeg-smmu.yaml

diff --git a/Documentation/devicetree/bindings/media/mediatek,mt8195-jpegdec.yaml b/Documentation/devicetree/bindings/media/mediatek,mt8195-jpegdec.yaml
index 28a9a9b..b1dccc3 100644
--- a/Documentation/devicetree/bindings/media/mediatek,mt8195-jpegdec.yaml
+++ b/Documentation/devicetree/bindings/media/mediatek,mt8195-jpegdec.yaml
@@ -73,6 +73,22 @@ patternProperties:
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
diff --git a/Documentation/devicetree/bindings/media/mediatek,mt8195-jpegenc.yaml b/Documentation/devicetree/bindings/media/mediatek,mt8195-jpegenc.yaml
index e2d772e..f099b5f 100644
--- a/Documentation/devicetree/bindings/media/mediatek,mt8195-jpegenc.yaml
+++ b/Documentation/devicetree/bindings/media/mediatek,mt8195-jpegenc.yaml
@@ -73,6 +73,22 @@ patternProperties:
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
diff --git a/Documentation/devicetree/bindings/soc/mediatek/mediatek,mt8196-jpeg-smmu.yaml b/Documentation/devicetree/bindings/soc/mediatek/mediatek,mt8196-jpeg-smmu.yaml
new file mode 100644
index 0000000..2bc67a2
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/mediatek/mediatek,mt8196-jpeg-smmu.yaml
@@ -0,0 +1,41 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/soc/mediatek/mediatek,mt8196-jpeg-smmu.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek MT8196 JPEG SMMU configuration registers
+
+maintainers:
+  - Kyrie Wu <kyrie.wu@mediatek.corp-partner.google.com>
+
+description:
+  The MT8196 JPEG SMMU configuration register block contains the GUSER_ID
+  fields used by the JPEG decoder and encoder hardware.
+
+properties:
+  compatible:
+    items:
+      - const: mediatek,mt8196-jpeg-smmu
+      - const: syscon
+
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        jpeg_smmu: syscon@38d0000 {
+            compatible = "mediatek,mt8196-jpeg-smmu", "syscon";
+            reg = <0 0x38d0000 0 0x1000>;
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index cc6a2d0..6e20f06 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3164,6 +3164,7 @@ L:	linux-mediatek@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
 W:	https://mtk.wiki.kernel.org/
 C:	irc://irc.libera.chat/linux-mediatek
+F:	Documentation/devicetree/bindings/soc/mediatek/mediatek,mt8196-jpeg-smmu.yaml
 F:	arch/arm/boot/dts/mediatek/
 F:	arch/arm/mach-mediatek/
 F:	arch/arm64/boot/dts/mediatek/
@@ -16665,6 +16666,7 @@ F:	include/dt-bindings/memory/mt*-port.h
 MEDIATEK JPEG DRIVER
 M:	Bin Liu <bin.liu@mediatek.com>
 S:	Supported
+F:	Documentation/devicetree/bindings/media/mediatek,mt8195-jpeg*.yaml
 F:	Documentation/devicetree/bindings/media/mediatek-jpeg-*.yaml
 F:	drivers/media/platform/mediatek/jpeg/
 
-- 
2.51.0.windows.2

