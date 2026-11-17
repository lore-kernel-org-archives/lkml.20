Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=210.61.82.184
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794905929;
	b=2CknyZOuNvyqUDYL9yf2d3yUsSlCStipj8xJHsx8CUZWJLKTSK5L7HEcF4yMrTA+HUol
	 YsJ6vV3RjuX3IkKlnw4rLa1QXPj2QGoP4YPw6/0QQCkz0s+FcLzxTDpEgNK+tazWokTAj
	 g4OlbFjmsa5Iq0dJ1ObtKza+bp7BmDVijptcgQcxzZwcb0wVUtftYz9nLozHbtNxI0913
	 86nfZMiAiV37VHp1nCZygz0VekP6upCDGbEv9dOGK2/ObLrM2+lRixhao2Xlr3eL6dn/z
	 O/n9eJWMb9s6Gf8ZBmaWlWpn5lUhOiHIlAa1zMu9Xy2rgYpN32PGnjAXcHNJeAdJqcw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794905929;
	h=DMARC-Filter:X-UUID:DKIM-Signature:X-CID-P-RULE:X-CID-O-INFO:
	 X-CID-META:X-CID-BVR:X-CID-BAS:X-CID-FACTOR:X-CID-RHF:X-UUID:Received:
	 Received:Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 Content-Type:X-MTK;
	bh=4z0yPrSEE392+/bjFW9l0SSF+B3MXZs4fe3gvJ8KJp0=;
	b=4uF+HgScZk285P6v13cXAjprvLAAqN00B1sJuBWFYToUei9n/xXKpeurSyReUNwTqbrz
	 UUaI0SV+dGINFkbN6EduDA83GS5bNcEzCYIJ1FPU8fHs15FJN5wRy8MsUOasHapp2kyrd
	 0iVoLQZiS3c7OtBg3StSW/tLTVSymME75fcanIiw6nTXL3I5JkBCgc+ZjCtnIE+5Etiyl
	 3NgW2FleiJQ0RRIjEXUToOTr26HwHHTYYf/e6xf8kRUKp5l45apVkmWcgnxbmtczX96P1
	 WEFhuTAbIWergDiDCKlYlb7mNGMODozPPKKTT2dA+l8B6y2je4VJj53YeKr1TkIEsyg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mediatek.com;
	spf=pass smtp.mailfrom=mediatek.com;
	dkim=pass header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=Eglg5PfK;
	arc=none smtp.remote-ip=210.61.82.184
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28BFA606A889;
	Tue, 17 Nov 2026 08:58:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 28BFA606A889
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=Eglg5PfK
X-UUID: 14bf152ce26511f18dc8c9802ae25ab1-20261117
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=4z0yPrSEE392+/bjFW9l0SSF+B3MXZs4fe3gvJ8KJp0=;
	b=Eglg5PfKj+nSB5zG6helWEZ7+sihKLxD0mCu2pACk2gzkO3OIPCbXYtLsPuPEHAVH0tOwIXLu7VhSnxotSeZFoWTvXgr+1B4xpWfctR4+970BGiBAbQ+d0XRwoBDcHaG5RfZv6M85ETHLpOb7SIS/h0vI78ORlZu3BjckaDnFuw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.21,REQID:58c8d105-d991-4cf9-bd6b-fe4d9862c5eb,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:b0318ac,CLOUDID:3eaef730-f289-4656-bb36-27baf4489f11,B
	ulkID:nil,BulkQuantity:0,SF:81|82|102|836|865|888|898,TC:-5,Content:0|15|5
	0|99,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0
	,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 14bf152ce26511f18dc8c9802ae25ab1-20261117
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw02.mediatek.com
	(envelope-from <kyrie.wu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1498033273; Tue, 17 Nov 2026 16:58:39 +0800
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 17 Nov 2026 16:58:38 +0800
Received: from gcnsap21.gcn.mediatek.inc (10.17.81.22) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Tue, 17 Nov 2026 16:58:37 +0800
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
Subject: [PATCH v12 01/10] dt-bindings: media: mediatek: decoder: Add MT8189 mediatek,vcodec-decoder
Date: Tue, 17 Nov 2026 16:58:24 +0800
Message-ID: <20261117085834.1464723-2-kyrie.wu@mediatek.com>
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

Add compatible for video decoder on MT8189 platform. Compared with
former ICs, the MT8189 decoder use iommu to instead of smmu, and
use scp architecture, the frequency is only 406MHZ, and cannot reach
more than 700MHZ. It uses two clocks named soc-vdec and vdec. At the
same time, the decoder supports the vp9 decoding protocol for the first
time in single IC.

Signed-off-by: Kyrie Wu <kyrie.wu@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
---
 .../media/mediatek,vcodec-subdev-decoder.yaml | 24 +++++++++++++++++--
 1 file changed, 22 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/mediatek,vcodec-subdev-decoder.yaml b/Documentation/devicetree/bindings/media/mediatek,vcodec-subdev-decoder.yaml
index c06d8a8a6..ae102a44e 100644
--- a/Documentation/devicetree/bindings/media/mediatek,vcodec-subdev-decoder.yaml
+++ b/Documentation/devicetree/bindings/media/mediatek,vcodec-subdev-decoder.yaml
@@ -75,6 +75,7 @@ properties:
       - mediatek,mt8192-vcodec-dec
       - mediatek,mt8186-vcodec-dec
       - mediatek,mt8188-vcodec-dec
+      - mediatek,mt8189-vcodec-dec
       - mediatek,mt8195-vcodec-dec
       - mediatek,mt8196-vcodec-dec
 
@@ -137,11 +138,11 @@ patternProperties:
           Refer to bindings/iommu/mediatek,iommu.yaml.
 
       clocks:
-        minItems: 4
+        minItems: 1
         maxItems: 5
 
       clock-names:
-        minItems: 4
+        minItems: 1
         maxItems: 5
 
       assigned-clocks:
@@ -184,6 +185,25 @@ then:
     - interrupts
 
 allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: mediatek,mt8189-vcodec-dec
+
+    then:
+      patternProperties:
+        '^video-codec@[0-9a-f]+$':
+          properties:
+            clocks:
+              minItems: 2
+              maxItems: 2
+
+            clock-names:
+              items:
+                - const: soc-vdec
+                - const: vdec
+
   - if:
       properties:
         compatible:
-- 
2.51.0.windows.2

