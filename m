Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0DD93B637E;
	Fri, 28 Aug 2026 18:42:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.161
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787942544; cv=none; b=KHAiiN3SwTs93CDWrYFA3dzgoGtEPOK42gbwuS7++kbFa58j5fr5Gs+KgGrcLjlYjZnGL7kkEiqN2sXBD8vaajwPDebLSmIgM01SzpdAuHGlyJniFsExN3dlg9OrOTHVvn/A3YKxIzgE/HLQVyxMoFEGFpO1m88RYmGYzD3ilFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787942544; c=relaxed/simple;
	bh=U3xfwWdC5F1KzOlJI+cZ+8hl6ZFMe4kqBIjuCotV0NI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JvyAemwKazH5YmDyVyJ/wQZduR7jO0tAX6CgUYe65MVyniwsBK+kTWA56QMlTBYQY1jDoB4X8UwgCLwBYLqS32SbHmQa71Ev0DWqFTDbWSNzghFOx8zf3LAPrb6wAAnroMW9BAumVMrPlHcE9H7eblFm9cG9XTLBx2tHKCJoG90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=abLescuu; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=iaBzDLWp; arc=none smtp.client-ip=80.241.56.161
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="abLescuu";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="iaBzDLWp"
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4hWnLN3Q0lzKnDX;
	Fri, 28 Aug 2026 20:42:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1787942540;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=9jviWJaI1CyiF63w9tTP9RIOY2rNf7xJSpPEKOGfoO0=;
	b=abLescuu10GTgn2VfKjbTqKJ2eXM8V8ssN9tDYZ0lKZQisgWIxB/Ehe+NoJXweMcpdr9Cg
	XcQnT7dqRlCFq+IY6MJPeB3o/bHD9ycy7snBl5TwV7LXKGCovHiNuNz2V3ih1ME9V29xIP
	f2SlAgKh0u6J75FS8y15ACizjxpzUo6wMGQixntBAf7QT76RID1m7A9sux/pdpBo4M4X9q
	ZInH98rT69vgoly4fNgztn4LPDRgHdItmvIrcWVuY/+nmY9az4epIO9hoQy1laqH0hvU9w
	3jnPjdlrgwxG/tiF6g4Qq0VIHys10Ik/DnbXkM4NjtD2noOsP9tLATdKN0ZueQ==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1787942538;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=9jviWJaI1CyiF63w9tTP9RIOY2rNf7xJSpPEKOGfoO0=;
	b=iaBzDLWpZQ5+HySE/L96mackJkl74/6vH+8rHFvlWnJs4LpiIFQImc0e7KA8F02Z5l9TRL
	T5RE0x9qCgr4j7+qAHijXpJRwJot32N/2tAZ99yOkXSGEgafx3/0SIz0Dgnzgu/DWeYQM0
	g+gpST/LkOsXf7NMujX4v1PXZNvcK6pWhOKk/pIZ9oedjLiw4zerlvBTq1jN2YM+ugeFCO
	a40fa+NlpR9AW8n1EzbM/Tt4etZjI6ecOI6Xf+5hNxPialZfW7dkzHfEuaDOUpLIq+TbIB
	Ky+cVRnt33wQvAxMCfxpgpAlzjLLZx3LdMsjLjKn/xifK3kKD3wD4Rw2OgnXtQ==
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
Subject: [PATCH v6 1/2] dt-bindings: usb: dwc3: Document Renesas R-Car Gen5 DWC3 xHCI USB controller
Date: Fri, 28 Aug 2026 20:41:45 +0200
Message-ID: <20260828184212.395082-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: x38pb5cnpyxdw3jnxstn56e6qmj1b6uj
X-MBO-RS-ID: db8aaa646003bb758b4

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
V6: No change
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

