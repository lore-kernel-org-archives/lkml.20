Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68FBE4EC671;
	Wed, 16 Sep 2026 11:08:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789556941; cv=none; b=FOTQeMa+s18qKsKZXnIrwDRJ1qxbpBKZHY3xnVHMHqq54+almhYFT3iGG+ypZrkphdQVMrufv3I+VLxILDthOMI7q8q9MIHpIHfk9XNVQu7B1sTN7QgkuZY+/O/BlyqSNdLH2ydXqXr8qb17kmuMovSRSmkVj9uImCjgCBUjOjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789556941; c=relaxed/simple;
	bh=43A1BM9waMG6ewhWBGIC1XAm5wq/Dw6qxwtteFBu24Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jm666glpnVxo0cVAxXaQW1yLzn/3wVIUQmJWtgvSRlPQM7NS9ROf8MLO/SPZDAfkQGhIXQOHpa1YMxjXULoB6EfoqudW06CAO5ObDyCD76z3CfXgkHkAAEJH5kpDvGVTPDRTeODhbC+k/UUpIc2FrKHOFTh+1BE1JiILc0U1A7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=TgKvZoqX; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="TgKvZoqX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1789556920;
	bh=43A1BM9waMG6ewhWBGIC1XAm5wq/Dw6qxwtteFBu24Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TgKvZoqXYCFyKVvRSa1LQVRWdZOpxCWiBqp0T06K+pfcOEM+LP+bFQCYqlsXIwcru
	 LtnfeGlF7VNT7vx40ujeeqI0g50t1zisJV5AbCzrs03LbhrHJcFkjCrRFqhBjWfo4m
	 3vLEUlvpcMT+YVIl2ue1R3tFlzmk52oq8i/Rn/ESvQyC9y7Vpu+inIdXDLOAl+QUbG
	 lZd+vSsnYfiTwShG4TJecEZJwBNhX1d1XLeeBjwAYJzWwrQlllgrNv3sWjt0ycraS9
	 0QTsTWp/ObTxQmTYo87OJXyl8n8XjuFihPr9LZNO49KQEd4E3VNuedxG5EdJwmLiE4
	 Itn+F8PTxmEoA==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 88B6A17E14FF;
	Wed, 16 Sep 2026 13:08:39 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Cc: p.zabel@pengutronix.de,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	jitao.shi@mediatek.com,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com,
	justin.yeh@mediatek.com,
	jason-jh.lin@mediatek.com,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	CK Hu <ck.hu@mediatek.com>
Subject: [PATCH v9 12/13] dt-bindings: display: mediatek: wdma: Add compatibles for more SoCs
Date: Wed, 16 Sep 2026 13:08:24 +0200
Message-ID: <20260916110825.102631-13-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260916110825.102631-1-angelogioacchino.delregno@collabora.com>
References: <20260916110825.102631-1-angelogioacchino.delregno@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Multiple MediaTek SoCs have the Write DMA hardware in their Display
Controller: add the missing compatibles for Dimensity 1200 (MT6893)
and for Kompanio 500/520/820/1200 (MT8183/MT8186/MT8192/MT8195).

Note that MT6893 is not compatible with MT8173 as it introduces
support for destination addresses larger than 32 bits by adding
one additional register for the upper 32 bits of the address.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: CK Hu <ck.hu@mediatek.com>
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../devicetree/bindings/display/mediatek/mediatek,wdma.yaml  | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,wdma.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,wdma.yaml
index 97d052b0fb61..c3ed867d058d 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,wdma.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,wdma.yaml
@@ -22,11 +22,16 @@ properties:
   compatible:
     oneOf:
       - enum:
+          - mediatek,mt6893-disp-wdma
           - mediatek,mt8173-disp-wdma
       - items:
           - enum:
               - mediatek,mt6795-disp-wdma
               - mediatek,mt8167-disp-wdma
+              - mediatek,mt8183-disp-wdma
+              - mediatek,mt8186-disp-wdma
+              - mediatek,mt8192-disp-wdma
+              - mediatek,mt8195-disp-wdma
           - const: mediatek,mt8173-disp-wdma
 
   reg:
-- 
2.55.0

