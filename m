Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F36C23F412C;
	Wed, 16 Sep 2026 07:07:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.121.34.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789542480; cv=none; b=JhAIhvhLl/PmMieIGtWSebWDGQu/jjkGp7U90FoBHwgY0yotTC/hf72RjaKmblGA/sjTL0WbHSl3MwEkUOtNwNY+GdClitZy5xGlWh1JB/Vxcy+o8lQrZaprlHtzm+whsdOw32+vSMFGZz/nZ6r6CNV+oniesU8Fwyosn3chZic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789542480; c=relaxed/simple;
	bh=GPMbYw6kgOV098T4Ro/Sv+bQYnxclcR5EsNB/i9jurc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=W70tW8FtQMi5c1B2zpkJhmbOPKm4BxIvOVAz/LV6lXhBdgjJ12TT47BN+u66jx0Sb3FFSLpwUUK7ksctTkkg7ZI/iBGTEbazn3pX8vV4su5/ATfhoVK/k2qwb+joQrA5TtRsuOzDZrrUzVqsiRpHV64p4tlt6R32FKM6YdWqlqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; arc=none smtp.client-ip=92.121.34.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Received: from inva021.nxp.com (localhost [127.0.0.1])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 0F1E0200197;
	Wed, 16 Sep 2026 09:07:47 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id A3E0C200193;
	Wed, 16 Sep 2026 09:07:46 +0200 (CEST)
Received: from lsv03900.swis.in-blr01.nxp.com (lsv03900.swis.in-blr01.nxp.com [10.12.177.15])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id 7202F180006C;
	Wed, 16 Sep 2026 15:07:43 +0800 (+08)
From: Lakshay Piplani <lakshay.piplani@nxp.com>
To: linux-kernel@vger.kernel.org,
	linux-i3c@lists.infradead.org,
	alexandre.belloni@bootlin.com,
	krzk+dt@kernel.org,
	robh@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	broonie@kernel.org,
	lee@kernel.org,
	Frank.Li@nxp.com,
	lgirdwood@gmail.com
Cc: vikash.bansal@nxp.com,
	priyanka.jain@nxp.com,
	aman.kumarpandey@nxp.com,
	Lakshay Piplani <lakshay.piplani@nxp.com>
Subject: [PATCH v19 3/8] dt-bindings: i3c: Add NXP P3H2x4x i3c-hub support
Date: Wed, 16 Sep 2026 12:37:23 +0530
Message-Id: <20260916070728.1088801-4-lakshay.piplani@nxp.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260916070728.1088801-1-lakshay.piplani@nxp.com>
References: <20260916070728.1088801-1-lakshay.piplani@nxp.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: ClamAV using ClamSMTP

From: Aman Kumar Pandey <aman.kumarpandey@nxp.com>

Add bindings for the NXP P3H2x4x (P3H2440/P3H2441/P3H2840/P3H2841)
multiport I3C hub family. These devices connect to a host via
I3C/I2C/SMBus and allow communication with multiple downstream
peripherals.

Signed-off-by: Aman Kumar Pandey <aman.kumarpandey@nxp.com>
Signed-off-by: Vikash Bansal <vikash.bansal@nxp.com>
Signed-off-by: Lakshay Piplani <lakshay.piplani@nxp.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Frank Li <Frank.Li@nxp.com>

---
Changes in v19:
 - Express P3H2440, P3H2441 and P3H2841 using nxp,p3h2840 as the
   fallback compatible
 - Reword the description's closing paragraph to drop the driver
   reference and state that x0/x1 differ only in power-up defaults
 - Update the I3C example to demonstrate the fallback-compatible form

Changes in v18:
 - Rebased onto v7.3-rc1; no intended driver behaviour changes

Changes in v17:
 - Explain in the binding description that all variants share the same register
   interface, software reads the target-port count from DEV_CAPAB, and
   the x0/x1 variants differ only in power-up defaults that the driver
   overrides

Changes in v16:
 - Add an allOf/if-then block for the 4-port variants (nxp,p3h2440 and
   nxp,p3h2441) that limits i3c@[0-3]/smbus@[0-3] and disallows target
   ports [4-7], so DTs describing nonexistent ports fail validation
 - Add #address-cells and #size-cells to the required list, since the hub
   is a parent bus to the target-port child node
 - Add an explicit minimum of 0 to the target-port reg constraints, retain
   the maximum of 7, and restrict the maximum to 3 for four-port variants

Changes in v15:
 - Add compatible strings for the P3H2440, P3H2441, P3H2840 and P3H2841
   variants
 - Fix the target-port reg schema to describe the single-cell port index

Changes in v14:
 - No change

Changes in v13:
 - Fix mismatch between example unit-address and reg property by correcting the reg value
   to match the node name

Changes in v12:
 - No change, added Reviewed-By tag

Changes in v11:
 - No change

Changes in v10:
 - No change, added Reviewed-By tag

Changes in v9:
 - Referenced i3c.yaml and i2c-controller.yaml for child nodes
 - Dropped unnecessary #address-cells and #size-cells from child nodes

Changes in v8:
 - Add compatible in i3c example

Changes in v7:
 - Fix schema validation issues
 - Adjust required properties
 - Add I2C example

Changes in v6:
 - Use a vendor prefix for the attributes

Changes in v5:
 - Removed SW properties: cp0-ldo-microvolt,cp1-ldo-microvolt,
   tp0145-ldo-microvolt, tp2367-ldo-microvolt
 - Changed supply entries and its descriptions

Changes in v4:
 - Fixed DT binding check warning
 - Removed SW properties: ibi-enable, local-dev, and always-enable

Changes in v3:
 - Added MFD (Multi-Function Device) support for I3C hub and on-die regulator
 - Added Regulator supply node

Changes in v2:
 - Fixed DT binding check warning
 - Revised logic for parsing DTS nodes
---
---
 .../devicetree/bindings/i3c/nxp,p3h2840.yaml  | 330 ++++++++++++++++++
 MAINTAINERS                                   |   9 +
 2 files changed, 339 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/i3c/nxp,p3h2840.yaml

diff --git a/Documentation/devicetree/bindings/i3c/nxp,p3h2840.yaml b/Documentation/devicetree/bindings/i3c/nxp,p3h2840.yaml
new file mode 100644
index 000000000000..09508a7bcbeb
--- /dev/null
+++ b/Documentation/devicetree/bindings/i3c/nxp,p3h2840.yaml
@@ -0,0 +1,330 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# Copyright 2025-2026 NXP
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/i3c/nxp,p3h2840.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NXP P3H2X4X I3C HUB
+
+maintainers:
+  - Aman Kumar Pandey <aman.kumarpandey@nxp.com>
+  - Vikash Bansal <vikash.bansal@nxp.com>
+  - Lakshay Piplani <lakshay.piplani@nxp.com>
+
+description: |
+  P3H2x4x (P3H2440/P3H2441/P3H2840/P3H2841) is a family of multiport I3C
+  hub devices that connect to:-
+  1. A host CPU via I3C/I2C/SMBus bus on upstream side and connect to multiple
+     peripheral devices on the downstream  side.
+  2. Have two Controller Ports which can support either
+     I2C/SMBus or I3C buses and connect to a CPU, BMC or SOC.
+  3. P3H2840/ P3H2841 are 8 port I3C hub with eight Target Ports.
+  4. P3H2440/ P3H2441 are 4 port I3C hub with four Target Ports.
+     Target ports can be configured as SMBus or I3C and connect to
+     peripherals.
+
+  All variants share the same register interface and programmable
+  functionality. The x0 and x1 variants differ only in power-up defaults.
+
+properties:
+  compatible:
+    oneOf:
+      - const: nxp,p3h2840
+      - items:
+          - enum:
+              - nxp,p3h2440
+              - nxp,p3h2441
+              - nxp,p3h2841
+          - const: nxp,p3h2840
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
+  nxp,tp0145-pullup-ohms:
+    description:
+      Selects the pull up resistance for target Port 0/1/4/5, in ohms.
+    enum: [250, 500, 1000, 2000]
+    default: 500
+
+  nxp,tp2367-pullup-ohms:
+    description:
+      Selects the pull up resistance for target Port 2/3/6/7, in ohms.
+    enum: [250, 500, 1000, 2000]
+    default: 500
+
+  nxp,cp0-io-strength-ohms:
+    description:
+      Selects the IO drive strength for controller Port 0, in ohms.
+    enum: [20, 30, 40, 50]
+    default: 20
+
+  nxp,cp1-io-strength-ohms:
+    description:
+      Selects the IO drive strength for controller Port 1, in ohms.
+    enum: [20, 30, 40, 50]
+    default: 20
+
+  nxp,tp0145-io-strength-ohms:
+    description:
+      Selects the IO drive strength for target port 0/1/4/5, in ohms.
+    enum: [20, 30, 40, 50]
+    default: 20
+
+  nxp,tp2367-io-strength-ohms:
+    description:
+      Selects the IO drive strength for target port 2/3/6/7, in ohms.
+    enum: [20, 30, 40, 50]
+    default: 20
+
+  vcc1-supply:
+    description: Controller port 0 power supply.
+
+  vcc2-supply:
+    description: Controller port 1 power supply.
+
+  vcc3-supply:
+    description: Target port 0/1/4/5 power supply.
+
+  vcc4-supply:
+    description: Target port 2/3/6/7 power supply.
+
+  regulators:
+    type: object
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
+      ldo-tpg0:
+        type: object
+        $ref: /schemas/regulator/regulator.yaml#
+        unevaluatedProperties: false
+
+      ldo-tpg1:
+        type: object
+        $ref: /schemas/regulator/regulator.yaml#
+        unevaluatedProperties: false
+
+required:
+  - reg
+  - '#address-cells'
+  - '#size-cells'
+
+patternProperties:
+  "^i3c@[0-7]$":
+    type: object
+    $ref: /schemas/i3c/i3c.yaml#
+    unevaluatedProperties: false
+
+    properties:
+      reg:
+        description:
+          The I3C HUB Target Port number.
+        items:
+          - minimum: 0
+            maximum: 7
+
+      nxp,pullup-enable:
+        type: boolean
+        description:
+          Enables the on-die pull-up for Target Port.
+
+    required:
+      - reg
+
+  "^smbus@[0-7]$":
+    type: object
+    $ref: /schemas/i2c/i2c-controller.yaml#
+    unevaluatedProperties: false
+
+    properties:
+      reg:
+        description:
+          The I3C HUB Target Port number.
+        items:
+          - minimum: 0
+            maximum: 7
+
+      nxp,pullup-enable:
+        type: boolean
+        description:
+          Enables the on-die pull-up for Target Port.
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
+              - nxp,p3h2440
+              - nxp,p3h2441
+    then:
+      patternProperties:
+        "^i3c@[0-3]$":
+          properties:
+            reg:
+              items:
+                - maximum: 3
+        "^smbus@[0-3]$":
+          properties:
+            reg:
+              items:
+                - maximum: 3
+        "^i3c@[4-7]$": false
+        "^smbus@[4-7]$": false
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    i3c {
+        #address-cells = <3>;
+        #size-cells = <0>;
+
+        hub@70,236153000c2 {
+            reg = <0x70 0x236 0x153000c2>;
+            compatible = "nxp,p3h2441", "nxp,p3h2840";
+            #address-cells = <1>;
+            #size-cells = <0>;
+            assigned-address = <0x50>;
+
+            nxp,tp0145-pullup-ohms = <1000>;
+            nxp,tp2367-pullup-ohms = <1000>;
+            nxp,cp0-io-strength-ohms = <50>;
+            nxp,cp1-io-strength-ohms = <50>;
+            nxp,tp0145-io-strength-ohms = <50>;
+            nxp,tp2367-io-strength-ohms = <50>;
+            vcc3-supply = <&reg_tpg0>;
+            vcc4-supply = <&reg_tpg1>;
+
+            regulators {
+                reg_cp0: ldo-cp0 {
+                    regulator-name = "ldo-cp0";
+                    regulator-min-microvolt = <1800000>;
+                    regulator-max-microvolt = <1800000>;
+                };
+
+                reg_cp1: ldo-cp1 {
+                    regulator-name = "ldo-cp1";
+                    regulator-min-microvolt = <1800000>;
+                    regulator-max-microvolt = <1800000>;
+                };
+
+                reg_tpg0: ldo-tpg0 {
+                    regulator-name = "ldo-tpg0";
+                    regulator-min-microvolt = <1800000>;
+                    regulator-max-microvolt = <1800000>;
+                };
+
+                reg_tpg1: ldo-tpg1 {
+                    regulator-name = "ldo-tpg1";
+                    regulator-min-microvolt = <1800000>;
+                    regulator-max-microvolt = <1800000>;
+                };
+            };
+
+            smbus@0 {
+                reg = <0x0>;
+                #address-cells = <1>;
+                #size-cells = <0>;
+                nxp,pullup-enable;
+            };
+
+            smbus@1 {
+                reg = <0x1>;
+                #address-cells = <1>;
+                #size-cells = <0>;
+                nxp,pullup-enable;
+            };
+
+            i3c@2 {
+                reg = <0x2>;
+                #address-cells = <3>;
+                #size-cells = <0>;
+                nxp,pullup-enable;
+            };
+        };
+    };
+
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        hub@70 {
+            reg = <0x70>;
+            compatible = "nxp,p3h2840";
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            nxp,tp0145-pullup-ohms = <1000>;
+            nxp,tp2367-pullup-ohms = <1000>;
+            nxp,cp0-io-strength-ohms = <50>;
+            nxp,cp1-io-strength-ohms = <50>;
+            nxp,tp0145-io-strength-ohms = <50>;
+            nxp,tp2367-io-strength-ohms = <50>;
+            vcc3-supply = <&reg_tpg0_i2c>;
+            vcc4-supply = <&reg_tpg1_i2c>;
+
+            regulators {
+                reg_cp0_i2c: ldo-cp0 {
+                    regulator-name = "ldo-cp0";
+                    regulator-min-microvolt = <1800000>;
+                    regulator-max-microvolt = <1800000>;
+                };
+
+                reg_cp1_i2c: ldo-cp1 {
+                    regulator-name = "ldo-cp1";
+                    regulator-min-microvolt = <1800000>;
+                    regulator-max-microvolt = <1800000>;
+                };
+
+                reg_tpg0_i2c: ldo-tpg0 {
+                    regulator-name = "ldo-tpg0";
+                    regulator-min-microvolt = <1800000>;
+                    regulator-max-microvolt = <1800000>;
+                };
+
+                reg_tpg1_i2c: ldo-tpg1 {
+                    regulator-name = "ldo-tpg1";
+                    regulator-min-microvolt = <1800000>;
+                    regulator-max-microvolt = <1800000>;
+                };
+            };
+
+            smbus@0 {
+                reg = <0x0>;
+                #address-cells = <1>;
+                #size-cells = <0>;
+                nxp,pullup-enable;
+            };
+
+            smbus@1 {
+                reg = <0x1>;
+                #address-cells = <1>;
+                #size-cells = <0>;
+                nxp,pullup-enable;
+            };
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index c2414447892c..4d47032c99a0 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19758,6 +19758,15 @@ L:	linux-wireless@vger.kernel.org
 S:	Maintained
 F:	drivers/net/wireless/nxp/
 
+NXP P3H2X4X I3C-HUB DRIVER
+M:	Vikash Bansal <vikash.bansal@nxp.com>
+M:	Aman Kumar Pandey <aman.kumarpandey@nxp.com>
+M:	Lakshay Piplani <lakshay.piplani@nxp.com>
+L:	linux-kernel@vger.kernel.org
+L:	linux-i3c@lists.infradead.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/i3c/nxp,p3h2840.yaml
+
 NXP PF5300/PF5301/PF5302 PMIC REGULATOR DEVICE DRIVER
 M:	Woodrow Douglass <wdouglass@carnegierobotics.com>
 S:	Maintained
-- 
2.25.1

