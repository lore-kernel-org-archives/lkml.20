Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B3554F6481;
	Tue,  8 Sep 2026 10:02:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788861771; cv=none; b=HEqI526D0LKgJA94lRi1GL7R4hTcife0k7MUv2gMLod8L0h/sdHzLJehogUoABPw+9KE2Pard2bpP0kUf8OpiqsmVUagjHDzAS8vyWbxstVDT7xPEsQeSZDVMtrbmxSFTbRNwd2Ajjf3xXq5MN+a9YrUydFtUnh1p38ldm/ZwPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788861771; c=relaxed/simple;
	bh=WU3qre6rJH7AApeSR09fJkyk1FXaIxkjlTD7ptpBd3o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bZkN057cNQYvXLMYz5SwiUWc/sCpTHJ7GlJc5+TUY04oGREAHH5CCVkZxYJRUhmPAyGS8yoP5em1qmeDRHCRKXWK11x4LBMq6l/Hqkmz1NficIsZIHncWnErfzRwckHPhAM4j/hysVrAfSCg1/nwxGHqZzDxnfHol8yPXOkQ4vI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=dlshf81+; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="dlshf81+"
Received: from francesco-nb.corp.toradex.com (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch [83.173.201.248])
	by mail11.truemail.it (Postfix) with ESMTPA id BA7DB2037E;
	Tue,  8 Sep 2026 12:02:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1788861760;
	bh=V2TCIVHLFUgANDNWEbBVnC10C0FF0MGdtrz2Vu9b1xk=; h=From:To:Subject;
	b=dlshf81+8dGxY9ub4RsX410QT4OdtT7VMj5lG3Hdk+ZG3o/ngm01LaFuFB826Eo2l
	 gSa2gp1yXwYmja5f5kqtZCFkSAwzvN8kPaUyC49R5zaBp+CaRX43GjCTxhYke7qSHh
	 TEMuepx1zoP/Rj+vTyCiJJ+7hw2T5PiZuAZX9T+LJy1uTjeaM7djGVxbWnsK/lgtut
	 uJPZD2VgFejbZMdoAEmwSKB5B7/y8aUbm9o0hfzEKZ8uRWtmnDEkjMm58tyDuTVdny
	 Lne8pb+GzwUQHTf4E0yEXBr1RuYIdKml7w4CvKAGWeRkTcN9ne9ucTT7W2VjtF+Fgy
	 OAUCESzA1631Q==
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
Subject: [PATCH v1 1/3] dt-bindings: display: bridge: Add THine THC63LVD827
Date: Tue,  8 Sep 2026 12:02:25 +0200
Message-ID: <20260908100230.83796-2-francesco@dolcini.it>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260908100230.83796-1-francesco@dolcini.it>
References: <20260908100230.83796-1-francesco@dolcini.it>
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
 .../display/bridge/thine,thc63lvd827.yaml     | 126 ++++++++++++++++++
 MAINTAINERS                                   |   5 +
 2 files changed, 131 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/thine,thc63lvd827.yaml

diff --git a/Documentation/devicetree/bindings/display/bridge/thine,thc63lvd827.yaml b/Documentation/devicetree/bindings/display/bridge/thine,thc63lvd827.yaml
new file mode 100644
index 000000000000..ead50802e11e
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/bridge/thine,thc63lvd827.yaml
@@ -0,0 +1,126 @@
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
+description: |
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
index 6215fcb07770..0b5a25a35367 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8580,6 +8580,11 @@ F:	Documentation/devicetree/bindings/display/rockchip/rockchip,dw-dp.yaml
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

