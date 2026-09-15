Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CA4847DD56;
	Tue, 15 Sep 2026 08:42:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789461743; cv=none; b=BwxlQnBshZF5+6uXhGDxOM0cTM7gihooW9K8HX6uxsJ0mdQ4W+zhO4eOa+Ol//6X0RTuZofupLl2GtZ07DONd8YGoT0kU1SXfycGRa7WcAh4cRblth1+e7GWKzHKw+AEfpAc6udEEb/cnz3lULg/b0xqj1LSWu8DGZSGuyTGP4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789461743; c=relaxed/simple;
	bh=43A1BM9waMG6ewhWBGIC1XAm5wq/Dw6qxwtteFBu24Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=d2QwBmghqzlBxA/fhofe9o09OMr3jcXkK0Pom+GguM9SqUZkfpnNzvQCqZKHMtg0ozQkeARmtQWNL8wjlrB3OWLYksiF/PKJNmaWevopY0pM3wF8AG4C6c8muGXplOtEJW/YPa2vk3pqsnxnSSwM0ss+hxi+wnO3JDRwQEMABrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=YkFJ/15b; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="YkFJ/15b"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1789461739;
	bh=43A1BM9waMG6ewhWBGIC1XAm5wq/Dw6qxwtteFBu24Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YkFJ/15bRhHTE3uiJHWxNrWwH3ueQHRC4QHhskffYYEybssCoqomdjV5mDQnwrxlk
	 Gi3gRRKLV6YGf/pJQZy1V7Yg14TxIQzmr86rU02ZUm8aVtkIBvoW3Q4s/vATZ9hFNL
	 CnnXbbx2OZTD197SKs3IigtpTDgOb6B5gASHTW6cdqLhfaKuCnWSjEn4j/9BZpZ58V
	 ZgQbjBG6ER94HtVUCXAlzr7jTN+p2iNiZETvkWhCIgKeeu+58/OpooN7Jy9v82pf1D
	 AeXKC6T4+at+oZYf2kYtMFNewUiB9Ri8MSZqksp3W9bpZpLMM+0cZkstx77CcNmmMG
	 6F5ui1YCfzhBw==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C45A917E1054;
	Tue, 15 Sep 2026 10:42:17 +0200 (CEST)
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
Subject: [PATCH v8 12/13] dt-bindings: display: mediatek: wdma: Add compatibles for more SoCs
Date: Tue, 15 Sep 2026 10:41:47 +0200
Message-ID: <20260915084148.11385-13-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260915084148.11385-1-angelogioacchino.delregno@collabora.com>
References: <20260915084148.11385-1-angelogioacchino.delregno@collabora.com>
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

