Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D73149E135
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 15:44:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791301488; cv=none; b=EJZopyw0cIaBWbDB8jGfZTGIPFPWb9zerP210rFFhqELrfVtBaudleKLnZaERqJdStUJCmsns4IgtLK4wh+NL3QahqNZnDTWEyIfKFL7Fq/qWEIlaLGP2BxkwpXQOPxUKaOD+iPoO8S70LozEMRDMOV7yCrCKrZc8NqIFSanITU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791301488; c=relaxed/simple;
	bh=rMXVE4+taDCq0nTii/N1zTIEqQ/jUnSy2Y0J7dZhCFY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WHNIMTBiFZEUcqDR7bFZNg6u3EaGKV5O8LeP1QkGXRI+5Aqt+h/4KIp51iLRGbTFmXgu1pHENk2FpZ1EDIM62dIG5umRjpnTaC7zxJiJVafzo7Iy7JqEGHcV6C2s/IdqT7H733tbreuGkRHceQNya2fRnBZ3aGbTWpS+2Az2jYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G2ZEBjG0; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G2ZEBjG0"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-486e8faff03so473144f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 08:44:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791301483; x=1791906283; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=B0YnQSv5TWrJNRUhNkkhgHnTcWHZfuBJU1BN6yforWM=;
        b=G2ZEBjG08vOJ5cDsMXo9NxVglT3+fjixl4FE4IC8nmihMA0+Q+h8ar5Dpx8AOQbEEA
         wnF6QUekzTUdbeYviDXRUGNNQIWUUw7+o2cMDqbEiNxFcANxC0apkxVknsaUAu5VNu33
         m1EGUBTvq4ELl8ihq+rHvIgGe52KnILVoVSl8iioUb/VgriJcwzUo7XhwVPuv/tqey3X
         5QNsG+yK8auKcijXB8k+hfIZnLFPsv4vQNwRNvyrnf/ivd3RT1HOy20Qk0whcXXpsC9F
         ISBSXIX/sC6nrsGMDftFJjZq7YJ+Fty8LBaPBhXkuJ1kKEt7F6subKDM/3AIhsRvSL2U
         RU2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791301483; x=1791906283;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=B0YnQSv5TWrJNRUhNkkhgHnTcWHZfuBJU1BN6yforWM=;
        b=mYjTiX7Zyfjm/G8oeZLAqcJYYAUf7bAALFT2h/BYQha0a9Y17CjgGbL9MMZOnMFHpS
         h71lEm2M89N89QmX9ER9sJfhAvXHG0VRnPAkzGa5R1TNrJzVPWO/TGeBy3B/1e74yWjx
         umwm0a2yuAq70HIERTfSSO+hFaxnOuJScqF1vItYM9toj2OeFHLTeWKO9C9El+omIBwv
         W9azPlFytOHR+Ia4nDX0+jYHtxv4IZin9VnN6atGd2iC4PM1PAYKCsJgs8xsgojrKU7+
         EtBohVrjSttKt0MiWD1mKeET/782l5VnlPWOEAXrXQ1UG+2UFPLarQj9Uz98NGP8cb4v
         +ybw==
X-Gm-Message-State: AFq9FYKYYUY4bxPGeIcow2y6P4n17Tu1LcUHSwg+CTugRQkEH1vzcv9e
	eJmoEZJG8By6oJzDSZIA8u6bc5S57jTnGji4ngJEnnNM+42qU+v98qew
X-Gm-Gg: AYBFou1/DJO5LPDa2PgKpwJLKopjQWcuVYe0m6vB9+1WufYBBcwWNn4Dut0oIlu+GJ7
	Z6A2TQzHLk9Dn5Eblawp6+1YvS+ZeiOreWirxrgP4YayUzGRGagbbPNWCKCIez+PS3G5vbBQzju
	ORCFI3mMUuoXFR0syfJiD38e8OGvhdGBgTGwUHysQo7ye8Yjv4T2ASzpa+Xhmf8NRPy6Ec2IoyV
	v8ZqiHmZd8pAYWwS8x1W+nn1YZCNBXfgAly0YugjhRFDYhkGOcGzh1xSj+rZdQXtpX58tTzM2GX
	VO8VHnpRA3Iaz05L7fTtSAyiRwibSbFBNw0Kdm4cRHGuWrvtICJiNIP8xgqDLaAne8Jn8QhbDO/
	J7BgJrIxjG8U0gmquZUc+abZWSQt/oxi8MmVQkpkNdVZQczLL0pkLvzF30tpXCBaGcwhUV9l1bw
	lz5TQyn6nhezmBMJmNOs8JoTc1qJd5Gw4VkNZkONCCtmA6VIHLjNRZjeKGVUV3luohPdLRmikup
	Q2ABRVCv+0pXQ8MyZY=
X-Received: by 2002:a05:6000:1acf:b0:48c:6969:756e with SMTP id ffacd0b85a97d-48c6d1a40b4mr3475561f8f.43.1791301482884;
        Tue, 06 Oct 2026 08:44:42 -0700 (PDT)
Received: from xeon ([188.163.112.76])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c71c0b6e6sm327615f8f.14.2026.10.06.08.44.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 08:44:42 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v1 1/7] regulator: dt-bindings: ti,lp872x: Convert to DT schema
Date: Tue,  6 Oct 2026 18:44:25 +0300
Message-ID: <20261006154431.318936-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261006154431.318936-1-clamor95@gmail.com>
References: <20261006154431.318936-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert TI LP872x regulator binding from text to DT schema.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../devicetree/bindings/regulator/lp872x.txt  | 161 ------------
 .../bindings/regulator/ti,lp8720.yaml         | 232 ++++++++++++++++++
 2 files changed, 232 insertions(+), 161 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/regulator/lp872x.txt
 create mode 100644 Documentation/devicetree/bindings/regulator/ti,lp8720.yaml

diff --git a/Documentation/devicetree/bindings/regulator/lp872x.txt b/Documentation/devicetree/bindings/regulator/lp872x.txt
deleted file mode 100644
index ab895cd1cac1a..0000000000000
--- a/Documentation/devicetree/bindings/regulator/lp872x.txt
+++ /dev/null
@@ -1,161 +0,0 @@
-Binding for TI/National Semiconductor LP872x Driver
-
-Required properties:
-  - compatible: "ti,lp8720" or "ti,lp8725"
-  - reg: I2C slave address. 0x7d = LP8720, 0x7a = LP8725
-
-Optional properties:
-  - ti,general-config: the value of LP872X_GENERAL_CFG register (u8)
-    (LP8720)
-    bit[2]: BUCK output voltage control by external DVS pin or register
-            1 = external pin, 0 = bit7 of register 08h
-    bit[1]: sleep control by external DVS pin or register
-            1 = external pin, 0 = bit6 of register 08h
-    bit[0]: time step unit(usec). 1 = 25, 0 = 50
-
-    (LP8725)
-    bit[7:6]: time step unit(usec). 00 = 32, 01 = 64, 10 = 128, 11 = 256
-    bit[4]:   BUCK2 enable control. 1 = enable, 0 = disable
-    bit[3]:   BUCK2 output voltage register address. 1 = 0Ah, 0 = 0Bh
-    bit[2]:   BUCK1 output voltage control by external DVS pin or register
-              1 = register 08h, 0 = DVS
-    bit[1]:   LDO sleep control. 1 = sleep mode, 0 = normal
-    bit[0]:   BUCK1 enable control, 1 = enable, 0 = disable
-
-    For more details, please see the datasheet.
-
-  - ti,update-config: define it when LP872X_GENERAL_CFG register should be set
-  - ti,dvs-gpio: GPIO specifier for external DVS pin control of LP872x devices.
-  - ti,dvs-vsel: DVS selector. 0 = SEL_V1, 1 = SEL_V2.
-  - ti,dvs-state: initial DVS pin state. 0 = DVS_LOW, 1 = DVS_HIGH.
-  - enable-gpios: GPIO specifier for EN pin control of LP872x devices.
-
-  Sub nodes for regulator_init_data
-    LP8720 has maximum 6 nodes. (child name: ldo1 ~ 5 and buck)
-    LP8725 has maximum 9 nodes. (child name: ldo1 ~ 5, lilo1,2 and buck1,2)
-    For more details, please see the following binding document.
-    (Documentation/devicetree/bindings/regulator/regulator.txt)
-
-Datasheet
-  - LP8720: https://www.ti.com/lit/ds/symlink/lp8720.pdf
-  - LP8725: https://www.ti.com/lit/ds/symlink/lp8725.pdf
-
-Example 1) LP8720
-
-lp8720@7d {
-	compatible = "ti,lp8720";
-	reg = <0x7d>;
-
-	/* external DVS pin used, timestep is 25usec */
-	ti,general-config = /bits/ 8 <0x03>;
-	ti,update-config;
-
-	/*
-	 * The dvs-gpio depends on the processor environment.
-	 * For example, following GPIO specifier means GPIO134 in OMAP4.
-	 */
-	ti,dvs-gpio = <&gpio5 6 0>;
-	ti,dvs-vsel = /bits/ 8 <1>;		/* SEL_V2 */
-	ti,dvs-state = /bits/ 8 <1>;		/* DVS_HIGH */
-
-	vaf: ldo1 {
-		regulator-min-microvolt = <1200000>;
-		regulator-max-microvolt = <3300000>;
-	};
-
-	vmmc: ldo2 {
-		regulator-min-microvolt = <1200000>;
-		regulator-max-microvolt = <3300000>;
-	};
-
-	vcam_io: ldo3 {
-		regulator-min-microvolt = <1200000>;
-		regulator-max-microvolt = <3300000>;
-		regulator-boot-on;
-	};
-
-	vcam_core: ldo4 {
-		regulator-min-microvolt = <800000>;
-		regulator-max-microvolt = <2850000>;
-		regulator-boot-on;
-	};
-
-	vcam: ldo5 {
-		regulator-min-microvolt = <1200000>;
-		regulator-max-microvolt = <3300000>;
-	};
-
-	vcc: buck {
-		regulator-name = "VBUCK";
-		regulator-min-microvolt = <800000>;
-		regulator-max-microvolt = <2300000>;
-	};
-};
-
-Example 2) LP8725
-
-lp8725@7a {
-	compatible = "ti,lp8725";
-	reg = <0x7a>;
-
-	/* Enable BUCK1,2, no DVS, normal LDO mode, timestep is 256usec */
-	ti,general-config = /bits/ 8 <0xdd>;
-	ti,update-config;
-
-	vcam_io: ldo1 {
-		regulator-min-microvolt = <1200000>;
-		regulator-max-microvolt = <3300000>;
-	};
-
-	vcam_core: ldo2 {
-		regulator-min-microvolt = <1200000>;
-		regulator-max-microvolt = <3300000>;
-	};
-
-	vcam: ldo3 {
-		regulator-min-microvolt = <1200000>;
-		regulator-max-microvolt = <3300000>;
-	};
-
-	vcmmb_io: ldo4 {
-		regulator-min-microvolt = <1200000>;
-		regulator-max-microvolt = <3300000>;
-		regulator-boot-on;
-	};
-
-	vcmmb_core: ldo5 {
-		regulator-min-microvolt = <1200000>;
-		regulator-max-microvolt = <3300000>;
-		regulator-boot-on;
-	};
-
-	vaux1: lilo1 {
-		regulator-name = "VAUX1";
-		regulator-min-microvolt = <800000>;
-		regulator-max-microvolt = <3300000>;
-	};
-
-	vaux2: lilo2 {
-		regulator-name = "VAUX2";
-		regulator-min-microvolt = <800000>;
-		regulator-max-microvolt = <3300000>;
-	};
-
-	vcc1: buck1 {
-		regulator-name = "VBUCK1";
-		regulator-min-microvolt = <800000>;
-		regulator-max-microvolt = <3000000>;
-		regulator-min-microamp  = <460000>;
-		regulator-max-microamp  = <1370000>;
-		regulator-boot-on;
-	};
-
-	vcc2: buck2 {
-		regulator-name = "VBUCK2";
-		regulator-min-microvolt = <800000>;
-		regulator-max-microvolt = <3000000>;
-		regulator-min-microamp  = <460000>;
-		regulator-max-microamp  = <1370000>;
-		regulator-boot-on;
-	};
-};
diff --git a/Documentation/devicetree/bindings/regulator/ti,lp8720.yaml b/Documentation/devicetree/bindings/regulator/ti,lp8720.yaml
new file mode 100644
index 0000000000000..f2384749314f1
--- /dev/null
+++ b/Documentation/devicetree/bindings/regulator/ti,lp8720.yaml
@@ -0,0 +1,232 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/regulator/ti,lp8720.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: TI/National Semiconductor LP872x PMIC
+
+description: >
+  The LP8720 is a multi-function, programmable Power Management Unit,
+  optimized for sub block power requirement solutions. This device
+  integrates one highly efficient 400 mA step-down DC-DC converter with
+  Dynamic Voltage Scale (DVS), five low-noise low dropout (LDO) voltage
+  regulators, and a 400 KHz i2c-compatible interface to allow a host
+  controller access to the internal control registers of the LP8720.
+  Additionally, the LP8720 features programmable power-on sequencing.
+
+  LP8720: https://www.ti.com/lit/ds/symlink/lp8720.pdf
+  LP8725: https://www.ti.com/lit/ds/symlink/lp8725.pdf
+
+maintainers:
+  - Svyatoslav Ryhel <clamor95@gmail.com>
+
+properties:
+  compatible:
+    enum:
+      - ti,lp8720
+      - ti,lp8725
+
+  reg:
+    maxItems: 1
+
+  enable-gpios:
+    description: GPIO specifier for EN pin control.
+    maxItems: 1
+
+  dvs-gpios:
+    description: GPIO specifier for external DVS pin control.
+    maxItems: 1
+
+  ti,general-config:
+    $ref: /schemas/types.yaml#/definitions/uint8
+    description: >
+      The value of LP872X_GENERAL_CFG register
+
+      (LP8720)
+      bit[2]: BUCK output voltage control by external DVS pin or register
+                1 = external pin, 0 = bit7 of register 08h
+      bit[1]: sleep control by external DVS pin or register
+                1 = external pin, 0 = bit6 of register 08h
+      bit[0]: time step unit(usec). 1 = 25, 0 = 50
+
+      (LP8725)
+      bit[7:6]: time step unit(usec). 00 = 32, 01 = 64, 10 = 128, 11 = 256
+      bit[4]:   BUCK2 enable control. 1 = enable, 0 = disable
+      bit[3]:   BUCK2 output voltage register address. 1 = 0Ah, 0 = 0Bh
+      bit[2]:   BUCK1 output voltage control by external DVS pin or register
+                  1 = register 08h, 0 = DVS
+      bit[1]:   LDO sleep control. 1 = sleep mode, 0 = normal
+      bit[0]:   BUCK1 enable control, 1 = enable, 0 = disable
+
+      For more details, please see the datasheet.
+
+  ti,update-config:
+    type: boolean
+    description: Define it when LP872X_GENERAL_CFG register should be set
+
+  ti,dvs-vsel:
+    $ref: /schemas/types.yaml#/definitions/uint8
+    description: DVS selector. 0 = SEL_V1, 1 = SEL_V2.
+
+  ti,dvs-state:
+    $ref: /schemas/types.yaml#/definitions/uint8
+    description: Initial DVS pin state. 0 = DVS_LOW, 1 = DVS_HIGH.
+
+patternProperties:
+  "^(buck|buck[1-2]|ldo[1-5]|lilo[1-2])$":
+    $ref: /schemas/regulator/regulator.yaml#
+    unevaluatedProperties: false
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: ti,lp8720
+    then:
+      patternProperties:
+        "^(buck[1-2]|lilo[1-2])$": false
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: ti,lp8725
+    then:
+      properties:
+        buck: false
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        pmic@7d {
+            compatible = "ti,lp8720";
+            reg = <0x7d>;
+
+            /* external DVS pin used, timestep is 25usec */
+            ti,general-config = /bits/ 8 <0x03>;
+            ti,update-config;
+
+            /*
+             * The dvs-gpio depends on the processor environment.
+             * For example, following GPIO specifier means GPIO134 in OMAP4.
+             */
+            dvs-gpios = <&gpio5 6 0>;
+            ti,dvs-vsel = /bits/ 8 <1>; /* SEL_V2 */
+            ti,dvs-state = /bits/ 8 <1>; /* DVS_HIGH */
+
+            ldo1 {
+                regulator-min-microvolt = <1200000>;
+                regulator-max-microvolt = <3300000>;
+            };
+
+            ldo2 {
+                regulator-min-microvolt = <1200000>;
+                regulator-max-microvolt = <3300000>;
+            };
+
+            ldo3 {
+                regulator-min-microvolt = <1200000>;
+                regulator-max-microvolt = <3300000>;
+                regulator-boot-on;
+            };
+
+            ldo4 {
+                regulator-min-microvolt = <800000>;
+                regulator-max-microvolt = <2850000>;
+                regulator-boot-on;
+            };
+
+            ldo5 {
+                regulator-min-microvolt = <1200000>;
+                regulator-max-microvolt = <3300000>;
+            };
+
+            buck {
+                regulator-name = "VBUCK";
+                regulator-min-microvolt = <800000>;
+                regulator-max-microvolt = <2300000>;
+            };
+        };
+    };
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        pmic@7a {
+            compatible = "ti,lp8725";
+            reg = <0x7a>;
+
+            /* Enable BUCK1,2, no DVS, normal LDO mode, timestep is 256usec */
+            ti,general-config = /bits/ 8 <0xdd>;
+            ti,update-config;
+
+            ldo1 {
+                regulator-min-microvolt = <1200000>;
+                regulator-max-microvolt = <3300000>;
+            };
+
+            ldo2 {
+                regulator-min-microvolt = <1200000>;
+                regulator-max-microvolt = <3300000>;
+            };
+
+            ldo3 {
+                regulator-min-microvolt = <1200000>;
+                regulator-max-microvolt = <3300000>;
+            };
+
+            ldo4 {
+                regulator-min-microvolt = <1200000>;
+                regulator-max-microvolt = <3300000>;
+                regulator-boot-on;
+            };
+
+            ldo5 {
+                regulator-min-microvolt = <1200000>;
+                regulator-max-microvolt = <3300000>;
+                regulator-boot-on;
+            };
+
+            lilo1 {
+                regulator-name = "VAUX1";
+                regulator-min-microvolt = <800000>;
+                regulator-max-microvolt = <3300000>;
+            };
+
+            lilo2 {
+                regulator-name = "VAUX2";
+                regulator-min-microvolt = <800000>;
+                regulator-max-microvolt = <3300000>;
+            };
+
+            buck1 {
+                regulator-name = "VBUCK1";
+                regulator-min-microvolt = <800000>;
+                regulator-max-microvolt = <3000000>;
+                regulator-min-microamp  = <460000>;
+                regulator-max-microamp  = <1370000>;
+                regulator-boot-on;
+            };
+
+            buck2 {
+                regulator-name = "VBUCK2";
+                regulator-min-microvolt = <800000>;
+                regulator-max-microvolt = <3000000>;
+                regulator-min-microamp  = <460000>;
+                regulator-max-microamp  = <1370000>;
+                regulator-boot-on;
+            };
+        };
+    };
-- 
2.53.0

