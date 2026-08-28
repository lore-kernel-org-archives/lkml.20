Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE2E0353A74;
	Fri, 28 Aug 2026 18:24:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.161
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787941469; cv=none; b=gXxCeIhxp1CDmbdiJi27b11RLxWsxscZX2Bm9c+/ms29moEbnn2zbMEP67kHgFxf5l+Q/CR1Pi+CJKDK3jSGq4Bo2t5gm1OzoMl5JWWx1jgQPWn8ziHxy2IigosYxaqs5zbi0XngFsPvPdOwVIghMpQ8Lr+EUtAInyYNdopLqW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787941469; c=relaxed/simple;
	bh=rRAjI+E54HifwY+wCFY2p/lBznJUa27ntiEiBqTO+R0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qliyW7/+fuH4JBhIPPePAAHrjHPh2vUP7rHF76nhdyIPZdc6uNE09Q6EIrL5zif8x1xU8galRxX81Bu+Y0HtssSt8bzj8mXfvMcYrFL/ivmalp/BXNuyUQwIO2NlV1iA1ib7BaNN2GIG/pIjoO1HbIXDDja+Z6lCINmUnTzGX3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=WN/n1R2f; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=lCoRsHUW; arc=none smtp.client-ip=80.241.56.161
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="WN/n1R2f";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="lCoRsHUW"
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4hWmxh1hrZzKmLq;
	Fri, 28 Aug 2026 20:24:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1787941464;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=UiPol/RgkHdv2e1z3rus8Wikod0VrFjR9pZAE8QgYxU=;
	b=WN/n1R2fAQVmDIRrSIH3a5bLnovTfd+KRbHnRP+dyTfdSg4saq6sRcNQDYIrmslYtbXp9B
	9KXAPKWSgWf/UUymc1qkHwvzkTz0Jjb048y1IRhB7ZWa7BwuTX3UXQwHk8o8E+t6Ji5Nax
	sMnlTu6H8oE+hfP8lbfN/JbEXl11F+XXPfkCu99Xi0hwk+spsFShcjzADePBBX0WlRD0OF
	2I3E9E1mwk2J7Drw6uZQrUDvi4ylOJCCVq7hr2UQ5/cglr7AB97pKgfCboVQENUnK4cELj
	YXOrruqJPftniRdZaSyLOPi8qXK7DzSGaZnDI592lBnyhrtemxbjOaPPsuqiYg==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=lCoRsHUW;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut+renesas@mailbox.org designates 2001:67c:2050:b231:465::2 as permitted sender) smtp.mailfrom=marek.vasut+renesas@mailbox.org
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1787941462;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=UiPol/RgkHdv2e1z3rus8Wikod0VrFjR9pZAE8QgYxU=;
	b=lCoRsHUWksbNfwM6fjODcqZ/+Vi4s98x1nLBr1Ci3rqlVP1IU6qPIfE2/aLtXVmUNADTQV
	u9AlsUPnkQkJjjvYAbORzsxtBaTtFU8hvBas7nFXfc467hm1RAOruqandzVKgte/smPf7q
	yBqi0nGAbUFtG8ccxm65gIQ1uixXRxM40oK/Tjmu0+9C6nfsL5yMI9GxmZaGrLtD2RafuN
	2IfWIeiYxVk9L76Er4Kxpksj9ODdjAm2aIkKLJDNMxbPQ4HMbk59NdP3697nE+maZebUOL
	gwm9oZfdiSnI3GwerGc+fjNcwbQr+bls9lWfRVK43IVLhRMyWxFaoY1Fl5zbnA==
To: linux-usb@vger.kernel.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v5 1/2] dt-bindings: usb: dwc3: Document Renesas R-Car Gen5 DWC3 xHCI USB controller
Date: Fri, 28 Aug 2026 20:23:24 +0200
Message-ID: <20260828182415.388367-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: f7ghc5jbexoh8g6s5g8bz3pk659zocgc
X-MBO-RS-ID: 19b0700d4c8741c4a2b
X-Rspamd-Queue-Id: 4hWmxh1hrZzKmLq

The Renesas R-Car Gen5 SoC contains multiple instances of DWC3 USB
controller with glue logic wrapper around them. Document the glue
logic and DWC3 controller.

Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Rob Herring <robh@kernel.org>
Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
Cc: linux-usb@vger.kernel.org
---
V2: Rework to use flat bindings for generic plat driver
V3: - Support one or two PHYs to correctly describe the hardware
    - Make maximum-speed optional
V4: - Use ref: snps,dwc3-common.yaml and drop generic dr_mode/maximum-speed/phys/phy-names
    - Switch to unevaluatedProperties: false
V5: - Limit maximum PHY count to 2
---
 .../bindings/usb/renesas,rcar-gen5-dwc3.yaml  | 76 +++++++++++++++++++
 1 file changed, 76 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/renesas,rcar-gen5-dwc3.yaml

diff --git a/Documentation/devicetree/bindings/usb/renesas,rcar-gen5-dwc3.yaml b/Documentation/devicetree/bindings/usb/renesas,rcar-gen5-dwc3.yaml
new file mode 100644
index 0000000000000..c8a770d7e0241
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/renesas,rcar-gen5-dwc3.yaml
@@ -0,0 +1,76 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/usb/renesas,rcar-gen5-dwc3.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Renesas R-Car Gen5 DWC3 xHCI USB controller
+
+maintainers:
+  - Marek Vasut <marek.vasut+renesas@mailbox.org>
+
+allOf:
+  - $ref: snps,dwc3-common.yaml#
+
+properties:
+  compatible:
+    items:
+      - const: renesas,r8a78000-dwc3
+      - const: renesas,rcar-gen5-dwc3
+
+  reg:
+    maxItems: 2
+
+  reg-names:
+    items:
+      - const: dwc3
+      - const: glue
+
+  clocks:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  phys:
+    minItems: 1
+    maxItems: 2
+
+  phy-names:
+    minItems: 1
+    maxItems: 2
+
+  power-domains:
+    maxItems: 1
+
+  resets:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - clocks
+  - interrupts
+  - phys
+  - phy-names
+  - power-domains
+  - resets
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    usb@c8800000 {
+        compatible = "renesas,r8a78000-dwc3", "renesas,rcar-gen5-dwc3";
+        reg = <0xc8800000 0x100000>, <0xc9c54000 0x2000>;
+        reg-names = "dwc3", "glue";
+        clocks = <&scmi_clk 336>;
+        interrupts = <GIC_SPI 795 IRQ_TYPE_LEVEL_HIGH>;
+        phys = <&usb30_phy>, <&mp_phy 2>;
+        phy-names = "usb2-phy", "usb3-phy";
+        power-domains = <&scmi_devpd 16>;
+        resets = <&scmi_reset 336>;
+    };
-- 
2.53.0

