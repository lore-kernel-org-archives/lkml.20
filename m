Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CE5A47ACF6;
	Fri, 11 Sep 2026 15:38:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789141104; cv=none; b=KegJGIka0pWEuDDl5Yg/XMMqRiom6KrfuW1WGuXp8A/EXx8yEIUPoL6hXbzt7V6q04ZPnZMuE2Euc1z80tBuGaypktbrUJ+kJmLupg+BeCKSZllJ8hPia4VKh1ahHYDpxkiT09ow2UyqkMDte17CHXNfKQe0oMXMvYc54YRxpw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789141104; c=relaxed/simple;
	bh=QzcExhrYuXnEZ7sW1ceH2vX8BTjdwMxPasQkVjImVic=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JSISz53zmPWDetSGCTFKEbcB+0QWsJem93KHEv91Y3U+DZISs6xiFkCbm8IWOukwU0KibImn1xAR8BILwE1HsQrT+Er7Qojm8EeyDM/5ptuqoV77e3sLgfYeksiTQoPTXh/XuXyAy7269JGyfN290omw//JTo+oVod3IocSakdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=WQwPS5Su; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=0EaU7Wc/; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="WQwPS5Su";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="0EaU7Wc/"
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1789141091; bh=3yqcx7zDAq4gYSOjr2GBmU7
	MbuQrcW/L7w2LoJLYyA4=; b=WQwPS5Su81bR4eDLmuWJUWEeyV56TJyXYzOUiolQB1oWJp3s6W
	+ldiDSsxl7OQe8B/mRmY+lJDmDCbDod3D2306bJz/sM33kM1seJysEM1ts3OEWVvP5E81YiA20c
	oAbHDHiraIYn2XBVCSe6g+sYqj4TPNnMZzE0vOC7Aa/OJTz7DUeicDniEW9NBv4P5xf04+rM+s7
	w2iYt81b5bPr68hwxzJ6quzDklCXaYiTKJvv1wpd2SPIfCsAyX3weUJhnCo5jVgq/YEc0Eym8p3
	IEXb0Ix9zCodbWxhbIxZnC0rF9y24hhkGdRKt4ZckBVyIxw5Vk6yInwGIJRhuM6wqaw==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1789141091; bh=3yqcx7zDAq4gYSOjr2GBmU7
	MbuQrcW/L7w2LoJLYyA4=; b=0EaU7Wc/KrBSD1ffzJekICsFP+upo6NjdlMuWgk+XQ0LRCxbUM
	mU5H2BTmR2LhfUoY11m8qYt6Dev7x1vPRXCA==;
From: Nickolay Goppen <setotau@mainlining.org>
Date: Fri, 11 Sep 2026 18:38:00 +0300
Subject: [PATCH v2 1/3] dt-bindings: display: panel: Add bindings for
 Novatek NT51021
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260911-qcom-novatek-nt51021-panels-v2-1-135e3190a7fb@mainlining.org>
References: <20260911-qcom-novatek-nt51021-panels-v2-0-135e3190a7fb@mainlining.org>
In-Reply-To: <20260911-qcom-novatek-nt51021-panels-v2-0-135e3190a7fb@mainlining.org>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Nickolay Goppen <setotau@mainlining.org>, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, ryanbrue.dev@gmail.com
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789141089; l=3292;
 i=setotau@mainlining.org; s=20250815; h=from:subject:message-id;
 bh=QzcExhrYuXnEZ7sW1ceH2vX8BTjdwMxPasQkVjImVic=;
 b=d2ZUoDWzDjfOQc4toMdnOzHuZRDS8bnr6gPtJOMRubdrRgJ04P2ikOYPgY8vx/YD3awKl2EyY
 DLjCCO6AHaoBU6JVMONLztfqRXAG5EaAnNNrC7ouu6PSzdcssBnDMcS
X-Developer-Key: i=setotau@mainlining.org; a=ed25519;
 pk=Og7YO6LfW+M2QfcJfjaUaXc8oOr5zoK8+4AtX5ICr4o=

Novatek NT51021 is a display driver IC that can drive DSI panel. It
is also present in the BOE TV101WUM-NX0 video mode panel, which is a WUXGA
panel with a resolution of 1200x1920 and 10.1 inches size. It is found in
Xiaomi Mi Pad 4 Plus. Also it's present in the BOE-TV080WUM-NX2 video mode
panel, which also has a resolution of 1200x1920, but 8 inches size. It is
found in Xiaomi Mi Pad 4.

This patch adds the bindings for display driver for the IC, with support
added for this BOE TV101WUM-NX0 and TV080WUM-NX2 WUXGA video mode panels.

Signed-off-by: Nickolay Goppen <setotau@mainlining.org>
---
 .../bindings/display/panel/novatek,nt51021.yaml    | 89 ++++++++++++++++++++++
 1 file changed, 89 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/novatek,nt51021.yaml b/Documentation/devicetree/bindings/display/panel/novatek,nt51021.yaml
new file mode 100644
index 000000000000..550aefaead46
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/novatek,nt51021.yaml
@@ -0,0 +1,89 @@
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
+
+  reg:
+    maxItems: 1
+
+  reset-gpios:
+    maxItems: 1
+    description: phandle of gpio for reset line - This should be 8mA, gpio
+      can be configured using mux, pinctrl, pinctrl-names (active low)
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

-- 
2.55.0

