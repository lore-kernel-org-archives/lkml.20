Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CE6753D9DB;
	Tue, 13 Oct 2026 22:51:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791931927; cv=none; b=r4OtazQ9FJcdAsli73v3+NGcP0shmtImY2nC/otQVbLPsP6aHEnW9hU26lGEIDDt2k/0NA3WDqQmNKFvmjuh5XGEhnv03muFnGHIMONYXEeFiARFNeQOiuUKrJps7tmoodgkbokfbGk1ongPIoqgeARTnu548OImXQ48ZYkpr+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791931927; c=relaxed/simple;
	bh=nePb0kyyjWqyo41M5uZpRKK5NGs/j1qWip36phnEELk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YRql5js8bV6WIRLoc+Bn5IgCOJLSUUzdGYBmNtwurTYKccaV8aVOONgN+MNfhpPCoEMNp5cC4jzxZHkZ1s7c+m6LIrdtAY8mRyFfwFTQBRBlTnuxkhQMlwBHcszND60ScH1YWRUQJroyrUL3BaTT2/QZ2tWwbKioM6rmUjENzmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=dRMJX4Dv; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="dRMJX4Dv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1791931911;
	bh=nePb0kyyjWqyo41M5uZpRKK5NGs/j1qWip36phnEELk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=dRMJX4Dv0PxU9KOJVHz25PsXe4o4o7GUByBFiJ/T944KhXP3y/i66526T2qXC0ueZ
	 FbsGhTAWn7ifpYPQjWlB1fuI6k/Zy0/XP7/na5E6VfZd4j4f0khcqNcQCPX3BRGuhk
	 FFHEVAs+GgxX2/cQ1Y1IVoKs0PnpWwrV81AAyk2M6IVdhlfYnG4A6YSE5Ym0zUgzoY
	 CTOJJea+OdOlRHbpkgAwcnYDmSVHyKdkMwHxjkb8yku3d4mv4uoR1J5drbnQkPgSXr
	 GeDDe/NDsfSmCFKY1McyYooEI8XHRa9svLG+yhgTiMetSHeDr/zhgUhNqQJNQJmS+m
	 vslKPVpsa+Tjw==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 72AAE17E07F0;
	Wed, 14 Oct 2026 00:51:51 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Wed, 14 Oct 2026 01:51:18 +0300
Subject: [PATCH v5 01/15] dt-bindings: display: vop2: Add missing reset
 properties
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261014-dw-hdmi-qp-yuv-v5-1-6fab0fe43a9b@collabora.com>
References: <20261014-dw-hdmi-qp-yuv-v5-0-6fab0fe43a9b@collabora.com>
In-Reply-To: <20261014-dw-hdmi-qp-yuv-v5-0-6fab0fe43a9b@collabora.com>
To: Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Daniel Stone <daniels@collabora.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Daniel Stone <daniel@fooishbar.org>, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: kernel@collabora.com, Andy Yan <andyshrk@163.com>, 
 dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2

Document the VOP2 resets corresponding to the AXI, AHB and DCLK_VP0..2
clocks, which are common to all supported SoCs, plus DCLK_VP3 which is
provided only on RK3588.

While at it, move 'iommus' in the example up into the expected position
to keep the properties in alphabetical order.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 .../bindings/display/rockchip/rockchip-vop2.yaml   | 46 +++++++++++++++++++++-
 1 file changed, 44 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/rockchip/rockchip-vop2.yaml b/Documentation/devicetree/bindings/display/rockchip/rockchip-vop2.yaml
index 93da1fb9adc4..f993cef0323b 100644
--- a/Documentation/devicetree/bindings/display/rockchip/rockchip-vop2.yaml
+++ b/Documentation/devicetree/bindings/display/rockchip/rockchip-vop2.yaml
@@ -82,6 +82,20 @@ properties:
       - {}
       - {}
 
+  resets:
+    minItems: 5
+    maxItems: 6
+
+  reset-names:
+    minItems: 5
+    items:
+      - const: axi
+      - const: ahb
+      - const: dclk_vp0
+      - const: dclk_vp1
+      - const: dclk_vp2
+      - const: dclk_vp3
+
   rockchip,grf:
     $ref: /schemas/types.yaml#/definitions/phandle
     description:
@@ -148,6 +162,12 @@ allOf:
         clock-names:
           maxItems: 5
 
+        resets:
+          maxItems: 5
+
+        reset-names:
+          maxItems: 5
+
         interrupts:
           maxItems: 1
 
@@ -194,6 +214,12 @@ allOf:
             - {}
             - const: pll_hdmiphy0
 
+        resets:
+          maxItems: 5
+
+        reset-names:
+          maxItems: 5
+
         interrupts:
           minItems: 4
 
@@ -246,6 +272,12 @@ allOf:
             - const: pll_hdmiphy0
             - const: pll_hdmiphy1
 
+        resets:
+          minItems: 6
+
+        reset-names:
+          minItems: 6
+
         interrupts:
           maxItems: 1
 
@@ -289,9 +321,19 @@ examples:
                               "dclk_vp0",
                               "dclk_vp1",
                               "dclk_vp2";
-                power-domains = <&power RK3568_PD_VO>;
-                rockchip,grf = <&grf>;
                 iommus = <&vop_mmu>;
+                power-domains = <&power RK3568_PD_VO>;
+                resets = <&cru SRST_A_VOP>,
+                         <&cru SRST_H_VOP>,
+                         <&cru SRST_VOP0>,
+                         <&cru SRST_VOP1>,
+                         <&cru SRST_VOP2>;
+                reset-names = "axi",
+                              "ahb",
+                              "dclk_vp0",
+                              "dclk_vp1",
+                              "dclk_vp2";
+                rockchip,grf = <&grf>;
                 vop_out: ports {
                     #address-cells = <1>;
                     #size-cells = <0>;

-- 
2.55.0

