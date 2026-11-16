Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=210.61.82.184
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794792870;
	b=Gr7IgpoqITzx+TfmUUzLjdFWG5eiaG7eVW8YKubXOtfu3fLEwUZaqi6Y58jOvpxSU/U0
	 hNaRR+MjXIjqwUO/g+17DnTSmgSI/I6OrtOkftxb+aYqXk7msDhRZ2lhpOKBctsZhg+Ih
	 IbN/nSbAdKYA4ejN7unGRylRRNZ57u0HswQLjimN9682fKmlLj8R3Li77yL3jdkYRtNIi
	 6eaBPszdjDItOOxIw8uqSlO0HzLcWiD2ypfE5Z5Q+DsKqbKxfEYmcZK42dP7dFgwoq3+m
	 Ub4Mqjc7SlNukFXaD3litjpHJRRTADKfOkF80wTRJSX6Sz+1byW6rC8mFn/RcD6ibtA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794792870;
	h=DMARC-Filter:X-UUID:DKIM-Signature:X-CID-P-RULE:X-CID-O-INFO:
	 X-CID-META:X-CID-BVR:X-CID-BAS:X-CID-FACTOR:X-CID-RHF:X-UUID:Received:
	 Received:Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 Content-Type:X-MTK;
	bh=ILKlUEVzjE+bNEcPkG1cJyJDe7C21/6eCIZFy79gQ5c=;
	b=iW7DuKbRFtY2JukJKPlO6aRUuiTIAddWLHHnnS2ie4caRWMclpuYzjEH8KLNuu4c63W5
	 F9wAKmmPx9X0UwrrjqJAiTyQYh9e4tbWP0jxysqimPlQb44kcYTVv8XfY1pdQcasTKD18
	 exn2TXp56RXXbqRmDlNKFMLbeBx2kdo/JDI+00du7X8uM96/MdWH2dOSHD9kI/ZJoJegW
	 7+VZyrbjuvFSY0xgjizgi62KaAqc0XtghSijk0Biz75fpXWh/BOg4P3imBcFPx4MtTWt7
	 gj5Xfsz9hTguXFP6YBJaJmXQIHv56SmJYVqSZrC9PJ4C2kdvognZ2x9+j9gWB7n5JWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mediatek.com;
	spf=pass smtp.mailfrom=mediatek.com;
	dkim=pass header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=G5EB5ZHF;
	arc=none smtp.remote-ip=210.61.82.184
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B26E606A8BD;
	Mon, 16 Nov 2026 01:34:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1B26E606A8BD
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=G5EB5ZHF
X-UUID: d8e7fa4ee15d11f18dc8c9802ae25ab1-20261116
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=ILKlUEVzjE+bNEcPkG1cJyJDe7C21/6eCIZFy79gQ5c=;
	b=G5EB5ZHFxF2jX+oTnd2RO0eWzcqncRofu2Yt62tiD2HniW0CnaUJbd5cVRk7bKj0jhRdUIgh47jorfwlB1neUFG3OVazP1OFNvOrkFlBcm/Xse78xRt2Eq64RbwDX+mk0DrFHXNKk8fVlXNkOcrR/5jAuBC65hNik4bdbaIMcUY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.21,REQID:81b64152-4b8f-43e2-b521-da8fe30fe8f5,IP:0,U
	RL:25,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:20
X-CID-META: VersionHash:b0318ac,CLOUDID:d04a16e2-fda1-4acf-b5b4-cc5598a4e59b,B
	ulkID:nil,BulkQuantity:0,SF:81|82|102|836|865|888|898,TC:-5,Content:0|15|5
	0|99,EDM:-3,IP:nil,URL:11|81|106|97|99|93|83|1,File:130,RT:0,Bulk:nil,QS:n
	il,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC
	:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: d8e7fa4ee15d11f18dc8c9802ae25ab1-20261116
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw02.mediatek.com
	(envelope-from <kyrie.wu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 252315359; Mon, 16 Nov 2026 09:34:21 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS14N2.mediatek.inc (172.21.101.76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 16 Nov 2026 09:34:19 +0800
Received: from gcnsap21.gcn.mediatek.inc (10.17.81.22) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Mon, 16 Nov 2026 09:34:18 +0800
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
Subject: [PATCH v19 09/13] dt-bindings: soc: mediatek: Add MT8196 JPEG SMMU
Date: Mon, 16 Nov 2026 09:33:34 +0800
Message-ID: <20261116013402.1273016-10-kyrie.wu@mediatek.com>
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

Document the dedicated MT8196 JPEG SMMU configuration syscon and its
GUSER_ID register block. JPEG decoder and encoder cores use this shared
register block to configure their SMMU stream IDs.

Signed-off-by: Kyrie Wu <kyrie.wu@mediatek.com>
---
 .../mediatek/mediatek,mt8196-jpeg-smmu.yaml   | 41 +++++++++++++++++++
 MAINTAINERS                                   |  2 +
 2 files changed, 43 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/mediatek/mediatek,mt8196-jpeg-smmu.yaml

diff --git a/Documentation/devicetree/bindings/soc/mediatek/mediatek,mt8196-jpeg-smmu.yaml b/Documentation/devicetree/bindings/soc/mediatek/mediatek,mt8196-jpeg-smmu.yaml
new file mode 100644
index 000000000..2bc67a2af
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
index 3e31de6e2..8a0805ac7 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3241,6 +3241,7 @@ L:	linux-mediatek@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
 W:	https://mtk.wiki.kernel.org/
 C:	irc://irc.libera.chat/linux-mediatek
+F:	Documentation/devicetree/bindings/soc/mediatek/mediatek,mt8196-jpeg-smmu.yaml
 F:	arch/arm/boot/dts/mediatek/
 F:	arch/arm/mach-mediatek/
 F:	arch/arm64/boot/dts/mediatek/
@@ -17070,6 +17071,7 @@ F:	include/dt-bindings/memory/mt*-port.h
 MEDIATEK JPEG DRIVER
 M:	Bin Liu <bin.liu@mediatek.com>
 S:	Supported
+F:	Documentation/devicetree/bindings/media/mediatek,mt8195-jpeg*.yaml
 F:	Documentation/devicetree/bindings/media/mediatek-jpeg-*.yaml
 F:	drivers/media/platform/mediatek/jpeg/
 
-- 
2.51.0.windows.2

