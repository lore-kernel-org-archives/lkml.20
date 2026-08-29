Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFF413B6363;
	Sat, 29 Aug 2026 20:09:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788034167; cv=none; b=YZwzu4mc+xhNSCCaYNdtYNFwYfIC0H4Y2liTH4Yj6LhnWVm2gA8fdesxV2xVczXr6PJXSsSDaYmCBlclcXM7NbR529xa6fQ2wURIukbHNMJGHu6Bq7h8Ri6GKfmldyjn1XUKSB/oYMJm1SiGS/R6n8lGhRAhF8MXvEzqsNmxp18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788034167; c=relaxed/simple;
	bh=ODOd/3ZW32aN4TGSCybwKQ2f2GUK2CdpCDOyC5ojuMg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DZaooajat59uq8JVutadrM5c/ixbPemtzeUvyYQDZYddQppwsr3qlxBuU18TWlbrbmiUzcGRN7N41D/WkvUc/mu6dWTGXaHDWMPV24Bjz1zhF9MAfoE4XFWGDgAJdnSif4ipOqbSiob2bTcqLOyBWkKESlrjtW3aP1KeexfFiNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=qTT5xHib; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=DhqLQLMW; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="qTT5xHib";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="DhqLQLMW"
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1788034160; bh=pR0fE7oJ788aDLCrtNOmB5V
	AEfVYZ1+UzA4iaBX/Qaw=; b=qTT5xHibHkrMI25DEBId67l09GLzSOJVSmr0uwqDDtdAfa9p0c
	T+2VINnT80bL47wilhiLPJSeiuotXD+qxD4Lanoq4ctgO0T31G+lZPlBuJaVrsfVAMwp16qnPaF
	B4DCEVxUuRhRkNG+yOtj2mlUjGk80ae1ooKwZ0VhWqvhgZ2Zi7s9qTYU8Cqfo55ky71mDOpcZ+f
	7NIricaf2VPkaqypsKF1xGKiean7vLWdFgm816awyvKlBNROE05swtO3KTeJffjTRtSbvtFoxfT
	9s/CHvz4tn9wS14w7ygBU4lMASbD4AI+V5BKK9kAb/RB2Q8JldpixW3KqHeJb97i6JQ==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1788034160; bh=pR0fE7oJ788aDLCrtNOmB5V
	AEfVYZ1+UzA4iaBX/Qaw=; b=DhqLQLMWSuaOyAUHpApst32V9v7QE98JM6XXgRcgTjWQeWP/dV
	UpLv/iPFw8Wh2jjoaUjXMo6Z7NiTdoy6yKDw==;
From: Nickolay Goppen <setotau@mainlining.org>
Date: Sat, 29 Aug 2026 23:09:13 +0300
Subject: [PATCH RFC 1/2] dt-bindings: display: panel: Add bindings for
 Novatek NT51021
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260829-qcom-novatek-nt51021-panels-v1-1-cc1ca61bd261@mainlining.org>
References: <20260829-qcom-novatek-nt51021-panels-v1-0-cc1ca61bd261@mainlining.org>
In-Reply-To: <20260829-qcom-novatek-nt51021-panels-v1-0-cc1ca61bd261@mainlining.org>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Nickolay Goppen <setotau@mainlining.org>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788034158; l=4080;
 i=setotau@mainlining.org; s=20250815; h=from:subject:message-id;
 bh=ODOd/3ZW32aN4TGSCybwKQ2f2GUK2CdpCDOyC5ojuMg=;
 b=W4FLNpInQe/10sfXGMNaoT0NVTLvlnhte4/VJZqxGZQ6FNHtSs6KJOldITVSnr1Vh3abTclce
 UAW8isqUWFFCgrlKIjD05fJakZz9htCEWofVcqFrsXeVjxki3Q18Mqk
X-Developer-Key: i=setotau@mainlining.org; a=ed25519;
 pk=Og7YO6LfW+M2QfcJfjaUaXc8oOr5zoK8+4AtX5ICr4o=

Novatek NT51021 is a display driver IC that can drive DSI panel. It
is also present in the BOE TV101WUM-NX0 video mode panel, which is a WUXGA
panel with a resolution of 1200x1920 and 10.1 inches size. It is found in
Xiaomi Mi Pad 4 Plus.

This patch adds the bindings for display driver for the IC, with support
added for this BOE TV101WUM-NX0 WUXGA video mode panel.

Signed-off-by: Nickolay Goppen <setotau@mainlining.org>
---
 .../bindings/display/panel/novatek,nt51021.yaml    | 93 ++++++++++++++++++++++
 MAINTAINERS                                        |  5 ++
 2 files changed, 98 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/novatek,nt51021.yaml b/Documentation/devicetree/bindings/display/panel/novatek,nt51021.yaml
new file mode 100644
index 000000000000..a3e4ed10e645
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/novatek,nt51021.yaml
@@ -0,0 +1,93 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/novatek,nt51021.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Novatek NT51021 based DSI display Panels
+
+maintainers:
+  - Nickolay Goppen <setotau@mainlining.org>
+
+description: |
+  The NT51021 IC from Novatek is a generic DSI Panel IC used to drive dsi
+  panels.
+  Right now, support is added only for a BOE WUXGA LCD display panels with a
+  resolution of 1200x1920. They are video mode DSI panels.
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - boe,tv101wum-nx0
+          - boe,tv080wum-nx2
+      - const: novatek,nt51021
+    description: This indicates the panel manufacturer of the panel that is
+      in turn using the NT51021 panel driver. This compatible string
+      determines how the NT51021 panel driver is configured for the indicated
+      panel. The novatek,nt51021 compatible shall always be provided as a fallback.
+
+  reg:
+    maxItems: 1
+
+  reset-gpios:
+    maxItems: 1
+    description: phandle of gpio for reset line - This should be 8mA, gpio
+      can be configured using mux, pinctrl, pinctrl-names (active high)
+
+  vdd-supply:
+    description: phandle of the regulator that provides the supply voltage
+      for digital circuits
+
+  avdd-supply:
+    description: phandle of the regulator that provides the supply voltage
+      for analog circuits
+
+  havdd-supply:
+    description: phandle of the regulator that provides the supply voltage
+      for analog circuits
+
+  port: true
+  backlight: true
+
+required:
+  - compatible
+  - reg
+  - vdd-supply
+  - avdd-supply
+  - havdd-supply
+  - reset-gpios
+  - port
+
+unevaluatedProperties: false
+
+examples:
+  - |+
+    #include <dt-bindings/gpio/gpio.h>
+
+    dsi0 {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        panel@0 {
+            compatible = "boe,tv101wum-nx0", "novatek,nt51021";
+            reg = <0>;
+            vdd-supply = <&lcd_pwr>;
+            avdd-supply = <&lcd_pwr>;
+            havdd-supply = <&lcd_pwr>;
+
+            backlight = <&i2c_backlight>;
+            reset-gpios = <&tlmm 62 GPIO_ACTIVE_LOW>;
+
+            port {
+                panel_in: endpoint {
+                    remote-endpoint = <&dsi0_out>;
+                };
+            };
+        };
+    };
+
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index 7291238bc09f..6cbf9ee3fa9b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8354,6 +8354,11 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/display/panel/novatek,nt37801.yaml
 F:	drivers/gpu/drm/panel/panel-novatek-nt37801.c
 
+DRM DRIVER FOR NOVATEK NT51021 PANELS
+M:	Nickolay Goppen <setotau@mainlining.org>
+S:	Maintained
+F:	Documentation/devicetree/bindings/display/panel/novatek,nt51021.yaml
+
 DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS
 M:	Lyude Paul <lyude@redhat.com>
 M:	Danilo Krummrich <dakr@kernel.org>

-- 
2.55.0

