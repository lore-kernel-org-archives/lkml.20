Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA6083AA4EB;
	Thu,  3 Sep 2026 21:30:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788471051; cv=none; b=fzG2RJcnvWf0gobRlqIpTqHzLNDDIrq8P8DSGbzeV48JNJ1LjeylY0lJnlFDnIT4+2Dj3kIzVlO8Gz1UATI1Saxojf0A3dGb6khwAlSzZYrHtiLUHr0T5fj3F3M2mRIXb/yjyVGXwDUjwBTST93cXDxF4A5GpmoUU8DGJ2Zhb6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788471051; c=relaxed/simple;
	bh=ZZtxQNVj4tl0N/GQjslPoOPYR67df+21ghPTlgKU4oA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uav7pCp4H1zJMghQJpE4Zrk/aZ30+Sprf5IN92LtkeLIuY3AZ8ibDYzZcOtjg3UrXctNv/DpOJat6b8iCAgOk92JT/Dgwui4sF30L05d1mykes4YRaoeDXOskz6UgwPQZ/XrW+pmaYAjzWxrOBMo/KDVepBFsh65LWdv6i5lW9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=pfMuFqCR; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=MLcZq/Bd; arc=none smtp.client-ip=80.241.56.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="pfMuFqCR";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="MLcZq/Bd"
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4hbXnw1V1xzMlGj;
	Thu, 03 Sep 2026 23:30:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1788471044;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=LFAs0ptpwlphm32MxyaDcUmBXKWrJhAcDg58F+8Ug0Y=;
	b=pfMuFqCRBRxwUPZCLh9Tm710lpeBQ47eSuT9bBFTWxtGZfE+sjmCNOINaCPGdjttG8qpxa
	eEWMwp2DEwo2+GJ0+eAl5Sp5ico07Cz7b+SRec4RrksMhQPv6R+n95HAg+ut+3pFUao+77
	SmgSCMdOPFCn1LzaC8AZMqbzAfrRhV4tkXes9jj3COFBz9E9hHT/ZupmVablD0n1xavFYC
	eNQGkOZCthtD4aNroaB+1n4J0xnY/WZBRTW8K5NlErINwYayHhM/Zmtw37kdmL561xuGU8
	Cas77TVEekjoljXXXSxCtlMrl2SxXlqKu2nRjAdrC6/LYTHE27LnmHTMTd/pKg==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1788471042;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=LFAs0ptpwlphm32MxyaDcUmBXKWrJhAcDg58F+8Ug0Y=;
	b=MLcZq/BdOpGkzfiw+s/wB7/y78fW7rwI2z3zXGUiEHXM8x2spWdjJQLCIzIltCj4+nOz1u
	G9ISgxi81SIXSrq/HqQ2MibfFoOf49Ajv9diJcKRKVWF3+KFABNyKM3h4H7FLAOnSmMGI+
	DO9oPfxIlir29coN+16hJpmSHnff+C8egYDyjb4F0KxMLaItco0PldMbQ6DVd9rCRcE0y8
	S2JXaKyZH8zhup1q80DlqYuuQqD4nlu0ykK1M/w4SpnKKdv3QCT0/8emZ1byuEkneBhCXG
	fhutULyYLNb2sr3OirxpADl9jdpwJhH55dC1ffZ+2h57AFOpnZOYIDeLvGeycQ==
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
Subject: [PATCH v7 1/2] dt-bindings: usb: dwc3: Document Renesas R-Car Gen5 DWC3 xHCI USB controller
Date: Thu,  3 Sep 2026 23:30:12 +0200
Message-ID: <20260903213031.314473-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: drxtybm4ou571wqymr3ps6own1xoxix6
X-MBO-RS-ID: dd3476d4b890582c824

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
V7: No change
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

