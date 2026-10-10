Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B588A3B3BE1;
	Sat, 10 Oct 2026 09:24:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.61.82.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791624252; cv=none; b=jdG6RJvQUFgTVbMaLc6spfZX5P+40vjJT3/mPb2a3Few1NtyyhKlpAY+gc7hOs+jgp8Y6rRW62ubsMubquvpVAcfCqcd1G5ezeJka2OXLxGcBVBkLKSOL8UDnBtOSPCnC0OGo0z0vowd8KjQRAU0ZnX+MIAuZ1L5zruoeRZJWEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791624252; c=relaxed/simple;
	bh=PuDA6rK5fAkUaPeSWE5PbU7R40+FRptqs3cpAUdGCN8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ejj1zQVuWibICswXcGS2XTiKXoVvgwhDaLQ3qFUM6jjqV/LCPq4rGrrz3MDAXOG17ojpMAHK+JzkUdnKGIjbnDKu7nUFNyYj5oWqKjGUvxLT23G9TB6H1Vvz8VklbsQcZvl8fJwIVGq7P1TLn7eH9KaVP0TY8/CN2d7ySBSjXVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=GgtiOfOV; arc=none smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="GgtiOfOV"
X-UUID: 558db618c48c11f18dc8c9802ae25ab1-20261010
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=rXh109/op7sj0mSpIgJfGBFMzWHZfPW0nwTrz4Ec6Ks=;
	b=GgtiOfOV/Q45Fhqx4jl3byw9I8XxsKxrVyod1EBAEo0ja87d7jQmJm74F6PzxM0+2QRpDocb20jNTdX4G32/HJVxdCB3qqxHG1l1RJLmsjgaRhZbQvLnaidtENuStBPHgXUq7MHkMNT4Q85NdlXEch0dgrraraTBL1nxVHvABvo=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.20,REQID:1c6f1252-9e5d-42f3-9970-c246809eff76,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:291e20b,CLOUDID:82f82e95-3103-4fdb-b79c-08de0e281a5d,B
	ulkID:nil,BulkQuantity:0,SF:81|82|102|836|865|888|898,TC:-5,Content:0|15|5
	0|99,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI:0,
	OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 558db618c48c11f18dc8c9802ae25ab1-20261010
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw02.mediatek.com
	(envelope-from <kyrie.wu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 844022293; Sat, 10 Oct 2026 17:24:03 +0800
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Sat, 10 Oct 2026 17:24:02 +0800
Received: from gcnsap21.gcn.mediatek.inc (10.17.81.22) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Sat, 10 Oct 2026 17:24:01 +0800
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
Subject: [PATCH v11 01/10] dt-bindings: media: mediatek: decoder: Add MT8189 mediatek,vcodec-decoder
Date: Sat, 10 Oct 2026 17:23:49 +0800
Message-ID: <951691c0a3d4ccf1cdfbeaead6d576145c731520.1791623422.git.kyrie.wu@mediatek.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1791623422.git.kyrie.wu@mediatek.com>
References: <cover.1791623422.git.kyrie.wu@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N

Add compatible for video decoder on MT8189 platform. Compared with
former ICs, the MT8189 decoder use iommu to instead of smmu, and
use scp architecture, the frequency is only 406MHZ, and cannot reach
more than 700MHZ. It uses only one clock. At the same time, the decoder
supports the vp9 decoding protocol for the first time in single IC.

Signed-off-by: Kyrie Wu <kyrie.wu@mediatek.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
---
 .../bindings/media/mediatek,vcodec-subdev-decoder.yaml       | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/mediatek,vcodec-subdev-decoder.yaml b/Documentation/devicetree/bindings/media/mediatek,vcodec-subdev-decoder.yaml
index d8f25ccd..50321824 100644
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
-- 
2.51.0.windows.2

