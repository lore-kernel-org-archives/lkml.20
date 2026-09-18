Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45EE55FDA7
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 21:02:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789765375; cv=none; b=YJ4ecVyc6CeJlXylK1MdZaNSPvFjeOasoRMx1AblejCBjQC4O7OQ213tB2+rV7EVOCQoduS3TH2vGTR5IuUwJUIgWIMEA7WiTY+Do/lsr1apygmrf5obSXxHQNQ6LUz6NEwDvmcgLdCq2MnclW3yeUaHi3kp2GDxgpIGzvYN8Gw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789765375; c=relaxed/simple;
	bh=7VFJeJ4QrNJQ+InqE+bbZQH2NYeGdB0Jrv+prGbC5A4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lbaGyUxPAdsjICvHBhN2g5jIzd8N4NhB3A0+34VejeEl4IRn/8W7iZkUqRJVkLq0JjK6fetzNyf0Nlh3+RD8tMFXn8Lc4ftnCE1CqQRRMhL5+dQ4HsWw3LCLcpQfj7o5XPDGuwzoBWUgL48cIeRXLmtwfnlpzxE1i19D7q/0fDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q5lu/KRE; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q5lu/KRE"
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc1ab17a810so166036a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 14:02:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789765372; x=1790370172; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=geikbrKsDXcFqc56hsKasFpB/gHezUrUiLv7oPljlwY=;
        b=Q5lu/KRE87f//CE7Fe54rvEIU7rXiThU5AqgpSbVCc0EaI11cII3k5NcgG5oqnGrL9
         euS55NeFkyF/U89RImifcWhi6HD1N5goANHD7NJrbcPAnH6+3cIguXtKAASG1Sc4x6F5
         G9OscVZOD5ZrWXJoztXpJvE/BEbgL1CgVUw5q2uYz6OohN5G8KfqwDDCZTE2/JYneig+
         mO7Bzetz4LyGl/jzcHxrVWiOOi4XWnrbs4dGFbSX5iuZNci7hi+Ww0vIEJSa7LyKfszs
         fxcdGWcZazRDV0nc3XQeoWG/zG/UMpumz2WS7wPwXw8i6J9jSPKuLxjQZ9S3DGrgjZQ9
         iPcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789765372; x=1790370172;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=geikbrKsDXcFqc56hsKasFpB/gHezUrUiLv7oPljlwY=;
        b=DNVYoEBBp49kS3OljvS+law8WbZYWjg9wesZBq1qpxC4WyRqq4jxtlW1iDtUb95g24
         xn1vrdz4yeYO0UenAp0PYcMtjHppCOvZ4vJEHKsIjNfAEe002VhVgziKHH2KpnPsnZ6i
         7NQZFU9H8N62zRg7XkRCfkhfoWLdtESEZeve+whEJWO6R6ZWqJl+T5/BzStvoeLBw3cD
         Ushz8+Jees9YU8N76/iuAkOaCdgiHMmo91HXZ58v20pY3yj+iDdAmDUlRckYSKwwtRLk
         fUH/90JYhy6L2TugpZci+8y4A6AYcf1uOtFtS2cM8xfOJVCuOajEYuXM/Anr+320TDP0
         CzvA==
X-Gm-Message-State: AFuF++mbsYsedqiF2brNeydnUeLgdNi16qjApElHPa+MjH66swij8YDk
	ihPsL4pF0vTaaFqDaHM097MptP1SwJAL1R+dlQhSWiBuUXhngxL8Lzgl
X-Gm-Gg: AYBFou1otSzlBRt6UQk6qfh+LpB3IFJ3nQ6u9Hp5xW48hKAgpkVKI+FwxxoJ147OEhf
	roZ2jw6zdYQNdZT8YPNL6Jy6RJPC1c50PeMGArxB3LA2ApuvyyuV9+JzLa55SQj1haoKcefkaQk
	y6bkKOQ8wnphnX8LghENPvMf8nBKC6ssFGj+uPxCis/33pk2acEYzFctY7lXSrgCxJhrQRbqEEU
	fX8/bHriOySUP2B+AHPcShetBOSTefYCOTY/gdV7gCVHoe+EjpR+bJ6kr6k8TRDwa/Gz3XzhguT
	/zfJB1b4+K8BfbRSZB+SgJ1C+7YHAcM2a1GikXIHzGx4yxf4VgTbF/s1sQjAwjy31xBX1dq+t4t
	IuRwuXtvoCIQbkSKtFcAKDgAZx7ec4oEhiHjdJFA0nem0d5eJPraXn2mfOmEp79VVSrpcF7+bEy
	8LtFGNmraWyYPiV6WAVM+0aL6H+OvnhwBS/KcEzTNRrZkCnTgyhyrKQbSlBV26UGPFDNTEgruMR
	O9/UKmU
X-Received: by 2002:a17:90b:5303:b0:39e:56a2:b81 with SMTP id 98e67ed59e1d1-39e598b5a15mr6134359a91.3.1789765372243;
        Fri, 18 Sep 2026 14:02:52 -0700 (PDT)
Received: from [10.198.60.252] ([2409:40c2:5404:cbbd:a461:609f:eccf:23f])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144d55ab3a3sm1396904c88.5.2026.09.18.14.02.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 14:02:51 -0700 (PDT)
From: Bhargav Joshi <j.bhargav.u@gmail.com>
Date: Sat, 19 Sep 2026 02:31:25 +0530
Subject: [PATCH v3 4/4] regulator: dt-bindings: ti,tps6586x: Convert to DT
 schema
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260919-ti-tps6586x-v3-4-63dd240f4684@gmail.com>
References: <20260919-ti-tps6586x-v3-0-63dd240f4684@gmail.com>
In-Reply-To: <20260919-ti-tps6586x-v3-0-63dd240f4684@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@avionic-design.de>, 
 Lee Jones <lee@kernel.org>, Shree Ramamoorthy <s-ramamoorthy@ti.com>, 
 Thierry Reding <thierry.reding@kernel.org>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Dmitry Osipenko <digetx@gmail.com>, 
 Svyatoslav Ryhel <clamor95@gmail.com>, 
 Laxman Dewangan <ldewangan@nvidia.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 goledhruva@gmail.com, m-chawdhry@ti.com, daniel.baluta@gmail.com, 
 simona.toaca@nxp.com, j.bhargav.u@gmail.com, mfd@lists.linux.dev, 
 Thierry Reding <treding@nvidia.com>, linux-tegra@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789765290; l=10424;
 i=j.bhargav.u@gmail.com; h=from:subject:message-id;
 bh=7VFJeJ4QrNJQ+InqE+bbZQH2NYeGdB0Jrv+prGbC5A4=;
 b=kn13BB5y4Wt5AneZVvAv+A4peK674VBv3FPrC+PiZ9CNnmVuQAgL+oAcMRI7xDwBKRmRPQ6Bn
 vV+4FfWx+iaDtVqFcZte9dejveVcH1QnwC5q2dy1CLPAS1CdfkDMOLC
X-Developer-Key: i=j.bhargav.u@gmail.com; a=ed25519;
 pk=IqNDwUZKECEA+n8wXctFLBbYL9NhFstZNbOznm/nX1k=

Convert Texas Instruments tps6586x regulator binding from text to DT
schema. Reference to nvidia,tegra-regulators-coupling in child regulator
nodes.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Bhargav Joshi <j.bhargav.u@gmail.com>
---
 .../devicetree/bindings/regulator/ti,tps6586x.yaml | 196 +++++++++++++++++++++
 .../devicetree/bindings/regulator/tps6586x.txt     | 135 --------------
 2 files changed, 196 insertions(+), 135 deletions(-)

diff --git a/Documentation/devicetree/bindings/regulator/ti,tps6586x.yaml b/Documentation/devicetree/bindings/regulator/ti,tps6586x.yaml
new file mode 100644
index 000000000000..1f7c7b35066f
--- /dev/null
+++ b/Documentation/devicetree/bindings/regulator/ti,tps6586x.yaml
@@ -0,0 +1,196 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/regulator/ti,tps6586x.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: TI TPS6586x family of regulators
+
+maintainers:
+  - Thierry Reding <thierry.reding@avionic-design.de>
+
+properties:
+  compatible:
+    const: ti,tps6586x
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  "#gpio-cells":
+    const: 2
+
+  gpio-controller: true
+
+  sys-supply:
+    description: The input supply for SYS.
+
+  ti,system-power-controller:
+    type: boolean
+    description:
+      Whether or not this PMIC is controlling the system power.
+
+  regulators:
+    type: object
+    additionalProperties: false
+    description:
+      list of regulators provided by this controller, LDO5 and LDO_RTC is
+      supplied by SYS regulator internally and driver take care of making
+      proper parent child relationship.
+
+    properties:
+      sys:
+        type: object
+        $ref: regulator.yaml#
+        unevaluatedProperties: false
+
+    patternProperties:
+      "^ldo([0-9]|_rtc)$":
+        type: object
+        allOf:
+          - $ref: /schemas/regulator/regulator.yaml#
+          - $ref: /schemas/regulator/nvidia,tegra-regulators-coupling.yaml#
+        unevaluatedProperties: false
+
+      "^sm[0-2]$":
+        type: object
+        allOf:
+          - $ref: /schemas/regulator/regulator.yaml#
+          - $ref: /schemas/regulator/nvidia,tegra-regulators-coupling.yaml#
+        unevaluatedProperties: false
+
+patternProperties:
+  "^vin-sm[0-2]-supply$":
+    description: The input supply for the corresponding SM (SM0, SM1, or SM2).
+
+  "^vinldo(01|23|4|678|9)-supply$":
+    description: The input supply for the corresponding LDO or group of LDOs.
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - regulators
+  - "#gpio-cells"
+  - gpio-controller
+  - sys-supply
+  - vin-sm0-supply
+  - vin-sm1-supply
+  - vin-sm2-supply
+  - vinldo01-supply
+  - vinldo23-supply
+  - vinldo4-supply
+  - vinldo678-supply
+  - vinldo9-supply
+
+additionalProperties: false
+
+examples:
+  - |
+    i2c {
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      pmic@34 {
+          compatible = "ti,tps6586x";
+          reg = <0x34>;
+          interrupts = <0 88 0x4>;
+
+          #gpio-cells = <2>;
+          gpio-controller;
+
+          ti,system-power-controller;
+
+          sys-supply = <&vdd_5v0_sys>;
+          vin-sm0-supply = <&sys_reg>;
+          vin-sm1-supply = <&sys_reg>;
+          vin-sm2-supply = <&sys_reg>;
+          vinldo01-supply = <&sm2_reg>;
+          vinldo23-supply = <&sm2_reg>;
+          vinldo4-supply = <&sm2_reg>;
+          vinldo678-supply = <&sm2_reg>;
+          vinldo9-supply = <&sm2_reg>;
+
+          regulators {
+              sys {
+                  regulator-name = "vdd_sys";
+                  regulator-boot-on;
+                  regulator-always-on;
+              };
+
+              sm0 {
+                  regulator-min-microvolt = < 725000>;
+                  regulator-max-microvolt = <1500000>;
+                  regulator-boot-on;
+                  regulator-always-on;
+              };
+
+              sm1 {
+                  regulator-min-microvolt = < 725000>;
+                  regulator-max-microvolt = <1500000>;
+                  regulator-boot-on;
+                  regulator-always-on;
+              };
+
+              sm2 {
+                  regulator-min-microvolt = <3000000>;
+                  regulator-max-microvolt = <4550000>;
+                  regulator-boot-on;
+                  regulator-always-on;
+              };
+
+              ldo0 {
+                  regulator-name = "PCIE CLK";
+                  regulator-min-microvolt = <3300000>;
+                  regulator-max-microvolt = <3300000>;
+              };
+
+              ldo1 {
+                  regulator-min-microvolt = < 725000>;
+                  regulator-max-microvolt = <1500000>;
+              };
+
+              ldo2 {
+                  regulator-min-microvolt = < 725000>;
+                  regulator-max-microvolt = <1500000>;
+              };
+
+              ldo3 {
+                  regulator-min-microvolt = <1250000>;
+                  regulator-max-microvolt = <3300000>;
+              };
+
+              ldo4 {
+                  regulator-min-microvolt = <1700000>;
+                  regulator-max-microvolt = <2475000>;
+              };
+
+              ldo5 {
+                  regulator-min-microvolt = <1250000>;
+                  regulator-max-microvolt = <3300000>;
+              };
+
+              ldo6 {
+                  regulator-min-microvolt = <1250000>;
+                  regulator-max-microvolt = <3300000>;
+              };
+
+              ldo7 {
+                  regulator-min-microvolt = <1250000>;
+                  regulator-max-microvolt = <3300000>;
+              };
+
+              ldo8 {
+                  regulator-min-microvolt = <1250000>;
+                  regulator-max-microvolt = <3300000>;
+              };
+
+              ldo9 {
+                  regulator-min-microvolt = <1250000>;
+                  regulator-max-microvolt = <3300000>;
+              };
+          };
+      };
+    };
diff --git a/Documentation/devicetree/bindings/regulator/tps6586x.txt b/Documentation/devicetree/bindings/regulator/tps6586x.txt
deleted file mode 100644
index 8b40cac24d93..000000000000
--- a/Documentation/devicetree/bindings/regulator/tps6586x.txt
+++ /dev/null
@@ -1,135 +0,0 @@
-TPS6586x family of regulators
-
-Required properties:
-- compatible: "ti,tps6586x"
-- reg: I2C slave address
-- interrupts: the interrupt outputs of the controller
-- #gpio-cells: number of cells to describe a GPIO
-- gpio-controller: mark the device as a GPIO controller
-- regulators: A node that houses a sub-node for each regulator within the
-  device. Each sub-node is identified using the node's name (or the deprecated
-  regulator-compatible property if present), with valid values listed below.
-  The content of each sub-node is defined by the standard binding for
-  regulators; see regulator.txt.
-  sys, sm[0-2], ldo[0-9] and ldo_rtc
-- sys-supply: The input supply for SYS.
-- vin-sm0-supply: The input supply for the SM0.
-- vin-sm1-supply: The input supply for the SM1.
-- vin-sm2-supply: The input supply for the SM2.
-- vinldo01-supply: The input supply for the LDO1 and LDO2
-- vinldo23-supply: The input supply for the LDO2 and LDO3
-- vinldo4-supply: The input supply for the LDO4
-- vinldo678-supply: The input supply for the LDO6, LDO7 and LDO8
-- vinldo9-supply: The input supply for the LDO9
-
-Optional properties:
-- ti,system-power-controller: Telling whether or not this pmic is controlling
-  the system power.
-
-Each regulator is defined using the standard binding for regulators.
-
-Note: LDO5 and LDO_RTC is supplied by SYS regulator internally and driver
-      take care of making proper parent child relationship.
-
-Example:
-
-	pmu: tps6586x@34 {
-		compatible = "ti,tps6586x";
-		reg = <0x34>;
-		interrupts = <0 88 0x4>;
-
-		#gpio-cells = <2>;
-		gpio-controller;
-
-		ti,system-power-controller;
-
-		sys-supply = <&some_reg>;
-		vin-sm0-supply = <&some_reg>;
-		vin-sm1-supply = <&some_reg>;
-		vin-sm2-supply = <&some_reg>;
-		vinldo01-supply = <...>;
-		vinldo23-supply = <...>;
-		vinldo4-supply = <...>;
-		vinldo678-supply = <...>;
-		vinldo9-supply = <...>;
-
-		regulators {
-			sys_reg: sys {
-				regulator-name = "vdd_sys";
-				regulator-boot-on;
-				regulator-always-on;
-			};
-
-			sm0_reg: sm0 {
-				regulator-min-microvolt = < 725000>;
-				regulator-max-microvolt = <1500000>;
-				regulator-boot-on;
-				regulator-always-on;
-			};
-
-			sm1_reg: sm1 {
-				regulator-min-microvolt = < 725000>;
-				regulator-max-microvolt = <1500000>;
-				regulator-boot-on;
-				regulator-always-on;
-			};
-
-			sm2_reg: sm2 {
-				regulator-min-microvolt = <3000000>;
-				regulator-max-microvolt = <4550000>;
-				regulator-boot-on;
-				regulator-always-on;
-			};
-
-			ldo0_reg: ldo0 {
-				regulator-name = "PCIE CLK";
-				regulator-min-microvolt = <3300000>;
-				regulator-max-microvolt = <3300000>;
-			};
-
-			ldo1_reg: ldo1 {
-				regulator-min-microvolt = < 725000>;
-				regulator-max-microvolt = <1500000>;
-			};
-
-			ldo2_reg: ldo2 {
-				regulator-min-microvolt = < 725000>;
-				regulator-max-microvolt = <1500000>;
-			};
-
-			ldo3_reg: ldo3 {
-				regulator-min-microvolt = <1250000>;
-				regulator-max-microvolt = <3300000>;
-			};
-
-			ldo4_reg: ldo4 {
-				regulator-min-microvolt = <1700000>;
-				regulator-max-microvolt = <2475000>;
-			};
-
-			ldo5_reg: ldo5 {
-				regulator-min-microvolt = <1250000>;
-				regulator-max-microvolt = <3300000>;
-			};
-
-			ldo6_reg: ldo6 {
-				regulator-min-microvolt = <1250000>;
-				regulator-max-microvolt = <3300000>;
-			};
-
-			ldo7_reg: ldo7 {
-				regulator-min-microvolt = <1250000>;
-				regulator-max-microvolt = <3300000>;
-			};
-
-			ldo8_reg: ldo8 {
-				regulator-min-microvolt = <1250000>;
-				regulator-max-microvolt = <3300000>;
-			};
-
-			ldo9_reg: ldo9 {
-				regulator-min-microvolt = <1250000>;
-				regulator-max-microvolt = <3300000>;
-			};
-		};
-	};

-- 
2.55.0

