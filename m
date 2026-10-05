Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 843C646D0B9;
	Mon,  5 Oct 2026 09:50:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791193822; cv=none; b=VZ6Tx+9N3lsVuOCXCkpTStQZEon2eRKhxEiahWIjoxcFws6hbnCXQeeYE31w3CmvwqGbWyxyc7EWLXKj2Rr2auNMuLp8CO6o3rbwsAuaV3Juadle3KofrgkKM1BbrmDiga3mW//Qk9xlf31fn8bykDjUkgf2HNnPBa0prT6vhVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791193822; c=relaxed/simple;
	bh=8cwhZfMt3uqWWC2sc5Db5MZ/1ZFkHtueAt9v6MbQA1U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PkEL1k5k5EQUoICcQl1WrJXQmfsasKCPq6vmmREHUOvlqxH2SCmBs+bFn1H7T2CW8lewRMBQsDypKQ96WdZQM+w67J7ng1etQSsKCPq3dSHfK83aCaYrTDhogVuWzthDBzNQDkzlWgOB4mpOmILo/dRHEMcIV8B5RDbvbelVMx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=CZiRzcX1; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="CZiRzcX1"
Received: from francesco-nb.. (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 70EA91FC47;
	Mon,  5 Oct 2026 11:50:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1791193816;
	bh=zQCJHTmUR2ik7FJ/fHt/vodGLDZk2JgO4ighUQKlqSE=; h=From:To:Subject;
	b=CZiRzcX17qLU1RfmIaqp8H4HA8ppPmq4kaCJQvseXqC/MJ/5LOo6XObOftDBa3Svi
	 LsA8bPUqR70jxpCGsOgNkTFqGfuiUrmiOHqTWbKh3w0RPo/4uiKBo0vORgpCCpSzY5
	 NXxvxKaFGtrnt3DIVzi8E3qYTw1HdU8Tlz0hdDLxdbI9EOIfqLNw2YZ4RzVIIbpKmo
	 QCdGkKdf5NxkkO42LP458movXKdQk/R9WwyBg8pkTnpPXWgXQX6bX9/dXhccML8h6h
	 vikIvbhbgZVShHjUO64r50YYBqhQK23skdyuqt2qvPpbiKXbytL1adKpy/kirMgvjE
	 m3hf26+rT2tEQ==
From: Francesco Dolcini <francesco@dolcini.it>
To: Francesco Dolcini <francesco@dolcini.it>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 1/4] dt-bindings: display: bridge: Add THine THC63LVD827
Date: Mon,  5 Oct 2026 11:50:01 +0200
Message-ID: <20261005095006.20290-2-francesco@dolcini.it>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261005095006.20290-1-francesco@dolcini.it>
References: <20261005095006.20290-1-francesco@dolcini.it>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Francesco Dolcini <francesco.dolcini@toradex.com>

Add THine THC63LVD827 DPI to LVDS encoder.

The THC63LVD827 is a simple DPI to LVDS encoder that can be configured
with input pins.

Link: https://www.thine.co.jp/en/products/detail/THC63LVD827.html
Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
v2:
 - use folded style for the description
 - document the power supplies
---
 .../display/bridge/thine,thc63lvd827.yaml     | 138 ++++++++++++++++++
 MAINTAINERS                                   |   5 +
 2 files changed, 143 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/thine,thc63lvd827.yaml

diff --git a/Documentation/devicetree/bindings/display/bridge/thine,thc63lvd827.yaml b/Documentation/devicetree/bindings/display/bridge/thine,thc63lvd827.yaml
new file mode 100644
index 000000000000..37d018eee813
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/bridge/thine,thc63lvd827.yaml
@@ -0,0 +1,138 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/bridge/thine,thc63lvd827.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: THine THC63LVD827 DPI to LVDS encoder
+
+maintainers:
+  - Francesco Dolcini <francesco.dolcini@toradex.com>
+
+description: >
+  The THC63LVD827 converts a 24-bit parallel RGB interface plus HSYNC,
+  VSYNC and data-enable to single-link or dual-link LVDS.
+
+  The LVDS output data mapping is configured using the MAP and 6B/8B inputs,
+  that can be controlled by GPIOs.
+
+  The LVDS output link mode (single/dual) is configured using the MODE input.
+
+  The parallel interface pixel clock sample polarity is configurable with the
+  R/F input strap option.
+
+properties:
+  compatible:
+    const: thine,thc63lvd827
+
+  map-gpios:
+    maxItems: 1
+    description:
+      GPIO connected to the MAP input. A high level selects Mapping Mode 1
+      and a low level selects Mapping Mode 2.
+
+  mode-gpios:
+    maxItems: 1
+    description:
+      GPIO connected to the MODE input. A high level selects single-link
+      LVDS output and a low level selects dual-link LVDS output.
+
+  b6b8-gpios:
+    maxItems: 1
+    description:
+      GPIO connected to the 6B/8B input. A high level selects 6-bit (21-bit)
+      mode and a low level selects 8-bit (27-bit) mode.
+
+  powerdown-gpios:
+    maxItems: 1
+    description:
+      GPIO connected to the active-low /PDWN input. A high level selects
+      normal operation and a low level power down the chip.
+
+  vcc-supply:
+    description: Power supply for the digital circuitry (1.8V).
+
+  pllvcc-supply:
+    description: Power supply for the PLL circuitry (1.8V).
+
+  lvdsvcc-supply:
+    description: Power supply for the LVDS outputs (1.8V).
+
+  iovcc-supply:
+    description: Power supply for the IO inputs circuitry (1.8V, 2.5V or 3.3V).
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        unevaluatedProperties: false
+        description: Parallel RGB input
+
+        properties:
+          endpoint:
+            $ref: /schemas/media/video-interfaces.yaml
+            unevaluatedProperties: false
+
+            properties:
+              pclk-sample:
+                description:
+                  Sample data on falling (0) or rising (1) edges of the pixel
+                  clock signal.
+                enum: [ 0, 1 ]
+                default: 0
+
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: LVDS output 1st link, used in single- and dual-link mode.
+
+      port@2:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: Optional LVDS output 2nd link, for dual-link mode.
+
+    required:
+      - port@0
+      - port@1
+
+required:
+  - compatible
+  - ports
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    lvds-encoder {
+        compatible = "thine,thc63lvd827";
+
+        map-gpios = <&gpio4 10 GPIO_ACTIVE_HIGH>;
+        mode-gpios = <&gpio4 11 GPIO_ACTIVE_HIGH>;
+        powerdown-gpios = <&gpio4 12 GPIO_ACTIVE_LOW>;
+
+        ports {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            port@0 {
+                reg = <0>;
+
+                endpoint {
+                    pclk-sample = <1>;
+                    remote-endpoint = <&dpi_out>;
+                };
+            };
+
+            port@1 {
+                reg = <1>;
+
+                endpoint {
+                    remote-endpoint = <&lvds_display_in>;
+                };
+            };
+        };
+    };
+
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index b9e03e2960e1..32923e76252b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8721,6 +8721,11 @@ F:	Documentation/devicetree/bindings/display/rockchip/rockchip,dw-dp.yaml
 F:	drivers/gpu/drm/bridge/synopsys/dw-dp.c
 F:	include/drm/bridge/dw_dp.h
 
+DRM DRIVER FOR THINE THC63LVD827 DPI TO LVDS BRIDGE
+M:	Francesco Dolcini <francesco@dolcini.it>
+S:	Maintained
+F:	Documentation/devicetree/bindings/display/bridge/thine,thc63lvd827.yaml
+
 DRM DRIVER FOR TI DLPC3433 MIPI DSI TO DMD BRIDGE
 M:	Jagan Teki <jagan@amarulasolutions.com>
 S:	Maintained
-- 
2.47.3

