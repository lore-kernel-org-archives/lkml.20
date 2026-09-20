Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 976273E51D4;
	Sun, 20 Sep 2026 10:07:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789898872; cv=none; b=pBm15KyRBZ/ZOw2O3lEOsITbFYi+nJiTzeUjMnjW9AZ+fs14SGRm7F1Smz3JBw2T5Z4Jc7okqxAC03ZBaukcB+K3iX0WlAZgfXsAlyJ83pN23YBj2uTBwLasGhKgejteiHDkWzaHUZkiAuY7mqxtE4ojZougr8FMUiyotBps28k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789898872; c=relaxed/simple;
	bh=zN17TYRv1ZuZaXJB4uCIaOVupGWgDf8voVXMJKSRxJI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iG1NUIwIfBeEAyCsJycmUOFPnZW7u+W4bbDIv1c824gJtN5ZBrvmc/2xvc1h0HkJ3+ZNd6Jjovha9zoeYg7xmRo/9X2FpvIW48TVkpmLSNA8cBWNqreA99HKoqWjKCNzWn8tMUM2JqiCKfd9SxtQSrRbgMcaBCg3nUEB32pnFiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realsil.com.cn; spf=pass smtp.mailfrom=realsil.com.cn; dkim=pass (2048-bit key) header.d=realsil.com.cn header.i=@realsil.com.cn header.b=OfQAsA2c; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realsil.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realsil.com.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realsil.com.cn header.i=@realsil.com.cn header.b="OfQAsA2c"
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 68KA6VyK41619108, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realsil.com.cn;
	s=dkim; t=1789898791;
	bh=j43nH7uEp0ZdE08gu7yRxkYUVGjqH6GF5n9zSBeS+fs=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	b=OfQAsA2cmkHgyEky9a72dDpUq7PStK7hesrL1WGcsucj0JMd0itTPVXPyiZXEZD8b
	 PmMvmLAWpUIa0iD2+/y4blbQrHKtDckQfHIAWBFiFDqJH7wJVQ4nb/8LKGV5K2MoKf
	 XzdZcfwy5F9wMvcgCSRcu7WMEGgij0XuDKDOmGf8yeobbRZe+6ESzmJa+oOckeYmB5
	 6tfdoqzlwllOTaxWr/iDJeg6hJBpuQW9BEIaZwlBG9M6eCarHtEa1Tkx8JMmUtIB4l
	 IW69eVOc1AuLVf9Wu/DpBkK5HW9Zequ6euGlpb+coNQ7B6UBrnLchCOv9wvMgOoysy
	 ZP2FFjxRMgKVw==
Received: from RS-EX-MBS2.realsil.com.cn ([172.29.17.102])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 68KA6VyK41619108
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sun, 20 Sep 2026 18:06:31 +0800
Received: from localhost (172.29.57.213) by RS-EX-MBS2.realsil.com.cn
 (172.29.17.102) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Sun, 20 Sep
 2026 18:06:31 +0800
From: <zain_zhou@realsil.com.cn>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, Frank Li
	<Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Lee Jones
	<lee@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown
	<broonie@kernel.org>, Vikash Bansal <vikash.bansal@nxp.com>, Aman Kumar
 Pandey <aman.kumarpandey@nxp.com>, Lakshay Piplani <lakshay.piplani@nxp.com>
CC: <devicetree@vger.kernel.org>, <linux-i3c@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <mfd@lists.linux.dev>, Wei Wang
	<wei_wang@realsil.com.cn>, Yin Zhou <zain_zhou@realsil.com.cn>
Subject: [RFC PATCH 1/4] dt-bindings: i3c: Add Realtek RTS490x I3C hub support
Date: Sun, 20 Sep 2026 18:04:58 +0800
Message-ID: <20260920100501.4091351-2-zain_zhou@realsil.com.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260920100501.4091351-1-zain_zhou@realsil.com.cn>
References: <20260920100501.4091351-1-zain_zhou@realsil.com.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: RS-EX-MBS1.realsil.com.cn (172.29.17.101) To
 RS-EX-MBS2.realsil.com.cn (172.29.17.102)

From: Yin Zhou <zain_zhou@realsil.com.cn>

Add the device tree binding for the Realtek RTS490x family of I3C
hubs. The hubs provide four or eight downstream target ports that can
operate as I3C buses or SMBus controller and target interfaces, along
with programmable LDO outputs for the controller and target-port
power domains.

Signed-off-by: Yin Zhou <zain_zhou@realsil.com.cn>
---
 .../bindings/i3c/realtek,rts490x.yaml         | 266 ++++++++++++++++++
 MAINTAINERS                                   |   7 +
 2 files changed, 273 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/i3c/realtek,rts490x.yaml

diff --git a/Documentation/devicetree/bindings/i3c/realtek,rts490x.yaml b/Documentation/devicetree/bindings/i3c/realtek,rts490x.yaml
new file mode 100644
index 000000000000..92d5d73db435
--- /dev/null
+++ b/Documentation/devicetree/bindings/i3c/realtek,rts490x.yaml
@@ -0,0 +1,266 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# Copyright 2025-2026 Realtek Semiconductor Corp.
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/i3c/realtek,rts490x.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Realtek RTS490x I3C hub
+
+maintainers:
+  - Yin Zhou <zain_zhou@realsil.com.cn>
+
+description: |
+  The Realtek RTS490x family provides four or eight downstream target ports.
+  The hub is an I3C target and is accessed through an upstream I3C controller.
+  Each target port can operate as an I3C bus or as an SMBus controller and
+  target interface. The hub also provides four programmable LDO outputs for
+  its controller and target-port power domains.
+
+properties:
+  compatible:
+    enum:
+      - realtek,rts4900
+      - realtek,rts4901
+      - realtek,rts4902
+      - realtek,rts4903
+      - realtek,rts4904
+      - realtek,rts4906
+
+  reg:
+    maxItems: 1
+
+  '#address-cells':
+    const: 1
+
+  '#size-cells':
+    const: 0
+
+  assigned-address:
+    maximum: 0x7f
+
+  realtek,tp0145-pullup-ohms:
+    description:
+      Pull-up resistance for target ports 0, 1, 4 and 5, in ohms. If omitted,
+      the driver retains the current hardware setting.
+    enum: [250, 500, 1000, 2000]
+
+  realtek,tp2367-pullup-ohms:
+    description:
+      Pull-up resistance for target ports 2, 3, 6 and 7, in ohms. If omitted,
+      the driver retains the current hardware setting.
+    enum: [250, 500, 1000, 2000]
+
+  realtek,cp0-io-strength-ohms:
+    description:
+      IO drive strength for controller port 0, in ohms. If omitted, the driver
+      retains the current hardware setting.
+    enum: [20, 30, 40, 50]
+
+  realtek,cp1-io-strength-ohms:
+    description:
+      IO drive strength for controller port 1, in ohms. If omitted, the driver
+      retains the current hardware setting.
+    enum: [20, 30, 40, 50]
+
+  realtek,tp0145-io-strength-ohms:
+    description:
+      IO drive strength for target ports 0, 1, 4 and 5, in ohms. If omitted,
+      the driver retains the current hardware setting.
+    enum: [20, 30, 40, 50]
+
+  realtek,tp2367-io-strength-ohms:
+    description:
+      IO drive strength for target ports 2, 3, 6 and 7, in ohms. If omitted,
+      the driver retains the current hardware setting.
+    enum: [20, 30, 40, 50]
+
+  vcc-cp0-supply:
+    description:
+      Optional external power supply for controller port 0. If omitted, the
+      driver does not request or enable this supply.
+
+  vcc-cp1-supply:
+    description:
+      Optional external power supply for controller port 1. If omitted, the
+      driver does not request or enable this supply.
+
+  vcc-tp0145-supply:
+    description:
+      Optional external power supply for target ports 0, 1, 4 and 5. If
+      omitted, the driver does not request or enable this supply.
+
+  vcc-tp2367-supply:
+    description:
+      Optional external power supply for target ports 2, 3, 6 and 7. If
+      omitted, the driver does not request or enable this supply.
+
+  regulators:
+    type: object
+    description:
+      Optional container for the hub's programmable LDOs. Only enabled LDO
+      child nodes are registered by the driver. An omitted or disabled LDO
+      child is not registered and its hardware state is left unchanged.
+    additionalProperties: false
+
+    properties:
+      ldo-cp0:
+        type: object
+        $ref: /schemas/regulator/regulator.yaml#
+        unevaluatedProperties: false
+
+      ldo-cp1:
+        type: object
+        $ref: /schemas/regulator/regulator.yaml#
+        unevaluatedProperties: false
+
+      ldo-tp0145:
+        type: object
+        $ref: /schemas/regulator/regulator.yaml#
+        unevaluatedProperties: false
+
+      ldo-tp2367:
+        type: object
+        $ref: /schemas/regulator/regulator.yaml#
+        unevaluatedProperties: false
+
+required:
+  - compatible
+  - reg
+  - '#address-cells'
+  - '#size-cells'
+
+patternProperties:
+  '^i3c@[0-7]$':
+    type: object
+    $ref: /schemas/i3c/i3c.yaml#
+    unevaluatedProperties: false
+
+    properties:
+      reg:
+        description: Target-port number.
+        items:
+          - minimum: 0
+            maximum: 7
+
+      realtek,pullup-enable:
+        type: boolean
+        description:
+          Enable the on-chip pull-up for this target port. If omitted, the
+          on-chip pull-up is disabled.
+
+    required:
+      - reg
+
+  '^smbus@[0-7]$':
+    type: object
+    $ref: /schemas/i2c/i2c-controller.yaml#
+    unevaluatedProperties: false
+
+    properties:
+      reg:
+        description: Target-port number.
+        items:
+          - minimum: 0
+            maximum: 7
+
+      realtek,pullup-enable:
+        type: boolean
+        description:
+          Enable the on-chip pull-up for this target port. If omitted, the
+          on-chip pull-up is disabled.
+
+      clock-frequency:
+        description:
+          SMBus controller-agent clock frequency for this target port, in Hz.
+          If omitted, the driver uses 400 kHz.
+        enum: [100000, 200000, 400000, 1000000]
+        default: 400000
+
+    required:
+      - reg
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - realtek,rts4900
+              - realtek,rts4901
+              - realtek,rts4904
+    then:
+      patternProperties:
+        '^i3c@[0-3]$':
+          properties:
+            reg:
+              items:
+                - maximum: 3
+        '^smbus@[0-3]$':
+          properties:
+            reg:
+              items:
+                - maximum: 3
+        '^i3c@[4-7]$': false
+        '^smbus@[4-7]$': false
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    i3c {
+        #address-cells = <3>;
+        #size-cells = <0>;
+
+        hub@70,4ba00000000 {
+            compatible = "realtek,rts4900";
+            reg = <0x70 0x4ba 0x00000000>;
+            assigned-address = <0x70>;
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            realtek,tp0145-pullup-ohms = <1000>;
+            realtek,cp0-io-strength-ohms = <20>;
+            realtek,cp1-io-strength-ohms = <20>;
+            realtek,tp0145-io-strength-ohms = <30>;
+
+            vcc-cp0-supply = <&ldo_cp0>;
+            vcc-cp1-supply = <&ldo_cp1>;
+            vcc-tp0145-supply = <&ldo_tp0145>;
+
+            regulators {
+                ldo_cp0: ldo-cp0 {
+                    regulator-name = "ldo-cp0";
+                    regulator-min-microvolt = <1000000>;
+                    regulator-max-microvolt = <1000000>;
+                };
+
+                ldo_cp1: ldo-cp1 {
+                    regulator-name = "ldo-cp1";
+                    regulator-min-microvolt = <1000000>;
+                    regulator-max-microvolt = <1000000>;
+                };
+
+                ldo_tp0145: ldo-tp0145 {
+                    regulator-name = "ldo-tp0145";
+                    regulator-min-microvolt = <1800000>;
+                    regulator-max-microvolt = <1800000>;
+                };
+            };
+
+            i3c@0 {
+                reg = <0>;
+                #address-cells = <3>;
+                #size-cells = <0>;
+                realtek,pullup-enable;
+            };
+
+            smbus@1 {
+                reg = <1>;
+                #address-cells = <1>;
+                #size-cells = <0>;
+                clock-frequency = <400000>;
+                realtek,pullup-enable;
+            };
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index f76359fdebbf..a2c171a28cd2 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22992,6 +22992,13 @@ S:	Maintained
 F:	include/sound/rt*.h
 F:	sound/soc/codecs/rt*
 
+REALTEK RTS490X I3C HUB DRIVER
+M:	Yin Zhou <zain_zhou@realsil.com.cn>
+L:	linux-i3c@lists.infradead.org
+L:	linux-kernel@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/i3c/realtek,rts490x.yaml
+
 REALTEK OTTO WATCHDOG
 M:	Sander Vanheule <sander@svanheule.net>
 L:	linux-watchdog@vger.kernel.org
-- 
2.34.1

