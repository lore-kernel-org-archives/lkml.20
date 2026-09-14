Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5B4944471C;
	Mon, 14 Sep 2026 11:58:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789387103; cv=none; b=XTZBOQyE3xslQxCroX1k3XKvm15JbkZ6Qg1v+HaReQwSshddiXo82k5wYXtXuOxAFtUI4nyDgCOhHhqeXb6iqlPv4BrOkqn3/PPbXwDAi+2VhP4GctxOh3qxLuC71xBIxOdfr5bLsUBKGi/Hj4GTkJZPkP9X1/+Ap+NX9CQqSa0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789387103; c=relaxed/simple;
	bh=j/gsFohJsX2pb991NM8358zeV5EJxqTR9EawuUysLmA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QoIS1sJ81ikg61JPr2wJLJ9AWWOlN4qEhWDPjJhxhD9AsXI+u7QDBrmXC/NLomtte7qh+2zslMkastunQpLUO58BBHDhuBlSegmT0VMpswmxCzFFCRp/fusbL45Zo3OXo62/7sxzEO2GcCcIt9D23nFky3lzbOr0p2T+c/nF3LQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=cWpnz3ed; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="cWpnz3ed"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1789387098;
	bh=j/gsFohJsX2pb991NM8358zeV5EJxqTR9EawuUysLmA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cWpnz3edcAAZqrpMPttcXjxn40jsxuag2xlIsd+52ur+EDak3abLKd2MDzUikWyN/
	 EmpiqfPEe1gSurb6dHvIzlvcCcyOLXonpbjoLmBbs26Lk/5q9wlLF80Cn4IPmYwPR2
	 WYo8cP13aZA0SRmfXJBh8Fxebx/yq4bmoIIdHOX6HNIgagUIHRBz3hCY+KfWtXr2Cw
	 C9M1Y+oengKmL1egxjFOhGnb1tnqYGtBDjJb/Tx0b6cc+eN1hsg24Z9+uKE3EWwkLW
	 JxnsuaySuc25Ax6fCfqu04G7HgI0a7uxUjkwtT12BLWHbghwes/xUCWFKioGltvKsd
	 GBfmJaVTEjNKg==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id BF8DA17E0CA0;
	Mon, 14 Sep 2026 13:58:17 +0200 (CEST)
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
Subject: [PATCH v7 03/13] dt-bindings: display: mediatek: dsi: Document MT8189 and MT8196
Date: Mon, 14 Sep 2026 13:58:02 +0200
Message-ID: <20260914115812.22751-4-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260914115812.22751-1-angelogioacchino.delregno@collabora.com>
References: <20260914115812.22751-1-angelogioacchino.delregno@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add compatible strings for MT8189 and MT8196 SoCs.
These are compatible with the DSI IPs found in the MT8188/95 and
others, but with differences making them not fully compatible.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: CK Hu <ck.hu@mediatek.com>
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../devicetree/bindings/display/mediatek/mediatek,dsi.yaml      | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.yaml
index 27ffbccc2a08..b5cdfe0eaca4 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.yaml
@@ -30,6 +30,8 @@ properties:
           - mediatek,mt8183-dsi
           - mediatek,mt8186-dsi
           - mediatek,mt8188-dsi
+          - mediatek,mt8189-dsi
+          - mediatek,mt8196-dsi
       - items:
           - enum:
               - mediatek,mt6795-dsi
-- 
2.55.0

