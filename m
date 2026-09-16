Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 058934A64DB;
	Wed, 16 Sep 2026 11:08:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789556933; cv=none; b=QNLI42mn/MZEumeq/kKq+ZWz6TydwgtSKXuI52JwDAGnCznnslos8kDKbI8v9LyyMjf4mtVp7PGDodl6ODtI+aUcIhvw9++VHMVgYQn/PRK2rMr0iPbnF1otKLgKwf+XirNM1OW1rDwGJ6NJDMDoo+JFAPdGsD7D9ZwIZ3CFnfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789556933; c=relaxed/simple;
	bh=j/gsFohJsX2pb991NM8358zeV5EJxqTR9EawuUysLmA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SdBtawm9MoR06M57OC4Vcct5ShzLbZ9v4506edsA2NpJ3J79zskfEeMS5KtsXRL24gIzAvPuBwd/fOJ7F02p8yvIWiFKtNlWY0IeqDYwrF7/AMBzgKig+jIUy2e27vS6Y3w4YQ9XltIJ22mlxCwR5TB+k5VcYtb6yxHSSpbJ3Rc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=QNKt687A; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="QNKt687A"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1789556911;
	bh=j/gsFohJsX2pb991NM8358zeV5EJxqTR9EawuUysLmA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QNKt687A/gPrA9a+UfT7S8xsQUKMqNyVBB/F3+NFyI7AuJI5/7jJclZCeE3BvARCi
	 kYwNM/8n6BgHOuWSKeWh/tE7qDloCPLL23r5rHw7yqRlzJ8vpJlVLsiiXAU9oEKGd5
	 5/pbvVV0PyV6bL7dPuNvx56c0hPbmA5r1Qw1CBwC+t4NeUDRgVtRwSOmANyk3vX+x0
	 IIKd0Bc69fQpdl4QzMdlToOqgybOyxfIcMnOdxBuElFKEBQ7evjuiKoskUSLZf+0bk
	 Q2UuWEkuPPeMU8M1VVXcBzFZn/NN0/bmWulfuA3WXHa6/I12mv6/0GBHg+4WBCCVQf
	 uTlZSbPz2PIFQ==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 07D2E17E127A;
	Wed, 16 Sep 2026 13:08:30 +0200 (CEST)
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
Subject: [PATCH v9 03/13] dt-bindings: display: mediatek: dsi: Document MT8189 and MT8196
Date: Wed, 16 Sep 2026 13:08:15 +0200
Message-ID: <20260916110825.102631-4-angelogioacchino.delregno@collabora.com>
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

