Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 897D64A012B;
	Tue, 22 Sep 2026 19:55:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790106911; cv=none; b=QneLgB8CU7EzdN/oc29Cqa9WwAC+G8R9y5PoXtjqsrse0CCmhW8z3dG0bY6CDsp5pthN3MwVs/r1hycpe8yFJGYyCRZZCRiKM5d+TvS25If1FLjRY1FJrITIKIY1+2ozG/H9p4vzBaJl9xF3+x+TLLx4BjQIlkRMsUcD4rD71sY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790106911; c=relaxed/simple;
	bh=W7QpDbuzpLCqIp0MKuHCf6oL2lZCwy64G16gQ9dlbMk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kvQOFNShsoX1avvww1yH/lTiWz8Wn23xjgjH2LjmwqT25KtYwKzTewY70Wi5B3UGbjKs6cz05tgqAJlqL8x80SisMU5iLIcTjCNXKGPUJjrDeHlJFpAKUlhVcK/8nTH3SUbujJ9872nSzREl9kWwITlWupyOzaJNSI+G/xvZI5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=owJgOB2/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="owJgOB2/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF8651F000FF;
	Tue, 22 Sep 2026 19:55:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790106909;
	bh=Nb71XVGxN3R2MxtTDnL6kdmJZRIDV18V8tQLOUcQmgg=;
	h=From:To:Cc:Subject:Date;
	b=owJgOB2/8rdgNyaNK1+qLqitv68/0OEjLdptIlSe/fdtbMnHxe+DjD7HkrWuGsRHl
	 o83W2Oa0KeBipjmt/+/g+lycb7TKtzwGispk8Q402idhuHmX3aL7VSC2ncW8VMqjDy
	 nrVXy9WdZ5ro8nYW6pgRyMm1pSSJDZ9phRrghE0+aps3WnoIBg8NbYJ5GonJB/nXtv
	 Xb/feolKhIxsLeeWw5NsPf1mObD6z48NrzmZUxewYadXHhaDytKeTBPvbXFpL1DigA
	 8vL4M9gV/gQ0KCsA81gDcZDWcgZoRg8wOOeMTC/txLeIn0D5AvUN+xYJ5fXPK5OYx1
	 ZU88eKGOd2uMQ==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Flora Fu <flora.fu@mediatek.com>,
	Alexandre Mergnat <amergnat@baylibre.com>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH] regulator: dt-bindings: Convert mediatek,mt6380-regulator to DT schema
Date: Tue, 22 Sep 2026 14:55:01 -0500
Message-ID: <20260922195502.818012-1-robh@kernel.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the MediaTek mediatek,mt6380-regulator binding to DT schema
format. It's a straight forward conversion.

The regulators are part of the "pwrap" block, so add a $ref to them.

Assisted-by: LLM
Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../regulator/mediatek,mt6380-regulator.yaml  | 117 ++++++++++++++++++
 .../bindings/regulator/mt6380-regulator.txt   |  89 -------------
 .../bindings/soc/mediatek/mediatek,pwrap.yaml |   3 +
 3 files changed, 120 insertions(+), 89 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/regulator/mediatek,mt6380-regulator.yaml
 delete mode 100644 Documentation/devicetree/bindings/regulator/mt6380-regulator.txt

diff --git a/Documentation/devicetree/bindings/regulator/mediatek,mt6380-regulator.yaml b/Documentation/devicetree/bindings/regulator/mediatek,mt6380-regulator.yaml
new file mode 100644
index 000000000000..0b3c604da727
--- /dev/null
+++ b/Documentation/devicetree/bindings/regulator/mediatek,mt6380-regulator.yaml
@@ -0,0 +1,117 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/regulator/mediatek,mt6380-regulator.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek MT6380 Regulator
+
+maintainers:
+  - Sean Wang <sean.wang@mediatek.com>
+
+properties:
+  compatible:
+    const: mediatek,mt6380-regulator
+
+patternProperties:
+  '^buck-(vcore1?|vrf)$':
+    description: BUCK regulators
+    $ref: regulator.yaml#
+    unevaluatedProperties: false
+
+    required:
+      - regulator-min-microvolt
+      - regulator-max-microvolt
+      - regulator-ramp-delay
+
+  '^ldo-v([mat]|phy|ddr)$':
+    type: object
+    description: LDO regulators
+    $ref: regulator.yaml#
+    unevaluatedProperties: false
+
+    required:
+      - regulator-min-microvolt
+      - regulator-max-microvolt
+      - regulator-ramp-delay
+
+required:
+  - compatible
+
+additionalProperties: false
+
+examples:
+  - |
+    regulators {
+        compatible = "mediatek,mt6380-regulator";
+
+        buck-vcore1 {
+            regulator-name = "vcore1";
+            regulator-min-microvolt = <600000>;
+            regulator-max-microvolt = <1393750>;
+            regulator-ramp-delay = <6250>;
+            regulator-always-on;
+            regulator-boot-on;
+        };
+
+        buck-vcore {
+            regulator-name = "vcore";
+            regulator-min-microvolt = <600000>;
+            regulator-max-microvolt = <1393750>;
+            regulator-ramp-delay = <6250>;
+        };
+
+        buck-vrf {
+            regulator-name = "vrf";
+            regulator-min-microvolt = <1200000>;
+            regulator-max-microvolt = <1575000>;
+            regulator-ramp-delay = <0>;
+            regulator-always-on;
+            regulator-boot-on;
+        };
+
+        ldo-vm {
+            regulator-name = "vm";
+            regulator-min-microvolt = <1050000>;
+            regulator-max-microvolt = <1400000>;
+            regulator-ramp-delay = <0>;
+            regulator-always-on;
+            regulator-boot-on;
+        };
+
+        ldo-va {
+            regulator-name = "va";
+            regulator-min-microvolt = <2200000>;
+            regulator-max-microvolt = <3300000>;
+            regulator-ramp-delay = <0>;
+            regulator-always-on;
+            regulator-boot-on;
+        };
+
+        ldo-vphy {
+            regulator-name = "vphy";
+            regulator-min-microvolt = <1800000>;
+            regulator-max-microvolt = <1800000>;
+            regulator-ramp-delay = <0>;
+            regulator-always-on;
+            regulator-boot-on;
+        };
+
+        ldo-vddr {
+            regulator-name = "vddr";
+            regulator-min-microvolt = <1240000>;
+            regulator-max-microvolt = <1840000>;
+            regulator-ramp-delay = <0>;
+            regulator-always-on;
+            regulator-boot-on;
+        };
+
+        ldo-vt {
+            regulator-name = "vt";
+            regulator-min-microvolt = <2200000>;
+            regulator-max-microvolt = <3300000>;
+            regulator-ramp-delay = <0>;
+            regulator-always-on;
+            regulator-boot-on;
+        };
+    };
diff --git a/Documentation/devicetree/bindings/regulator/mt6380-regulator.txt b/Documentation/devicetree/bindings/regulator/mt6380-regulator.txt
deleted file mode 100644
index 0058441f16d2..000000000000
--- a/Documentation/devicetree/bindings/regulator/mt6380-regulator.txt
+++ /dev/null
@@ -1,89 +0,0 @@
-MediaTek MT6380 Regulator
-
-All voltage regulators provided by the MT6380 PMIC are described as the
-subnodes of the MT6380 regulators node. Each regulator is named according
-to its regulator type, buck-<name> and ldo-<name>. The definition for each
-of these nodes is defined using the standard binding for regulators at
-Documentation/devicetree/bindings/regulator/regulator.txt.
-
-The valid names for regulators are:
-BUCK:
-  buck-core1, buck-vcore, buck-vrf
-LDO:
-  ldo-vm ,ldo-va , ldo-vphy, ldo-vddr, ldo-vt
-
-Example:
-
-	regulators {
-		compatible = "mediatek,mt6380-regulator";
-
-		mt6380_vcpu_reg: buck-vcore1 {
-			regulator-name = "vcore1";
-			regulator-min-microvolt = < 600000>;
-			regulator-max-microvolt = <1393750>;
-			regulator-ramp-delay = <6250>;
-			regulator-always-on;
-			regulator-boot-on;
-		};
-
-		mt6380_vcore_reg: buck-vcore {
-			regulator-name = "vcore";
-			regulator-min-microvolt = <600000>;
-			regulator-max-microvolt = <1393750>;
-			regulator-ramp-delay = <6250>;
-		};
-
-		mt6380_vrf_reg: buck-vrf {
-			regulator-name = "vrf";
-			regulator-min-microvolt = <1200000>;
-			regulator-max-microvolt = <1575000>;
-			regulator-ramp-delay = <0>;
-			regulator-always-on;
-			regulator-boot-on;
-		};
-
-		mt6380_vm_reg: ldo-vm {
-			regulator-name = "vm";
-			regulator-min-microvolt = <1050000>;
-			regulator-max-microvolt = <1400000>;
-			regulator-ramp-delay = <0>;
-			regulator-always-on;
-			regulator-boot-on;
-		};
-
-		mt6380_va_reg: ldo-va {
-			regulator-name = "va";
-			regulator-min-microvolt = <2200000>;
-			regulator-max-microvolt = <3300000>;
-			regulator-ramp-delay = <0>;
-			regulator-always-on;
-			regulator-boot-on;
-		};
-
-		mt6380_vphy_reg: ldo-vphy {
-			regulator-name = "vphy";
-			regulator-min-microvolt = <1800000>;
-			regulator-max-microvolt = <1800000>;
-			regulator-ramp-delay = <0>;
-			regulator-always-on;
-			regulator-boot-on;
-		};
-
-		mt6380_vddr_reg: ldo-vddr {
-			regulator-name = "vddr";
-			regulator-min-microvolt = <1240000>;
-			regulator-max-microvolt = <1840000>;
-			regulator-ramp-delay = <0>;
-			regulator-always-on;
-			regulator-boot-on;
-		};
-
-		mt6380_vt_reg: ldo-vt {
-			regulator-name = "vt";
-			regulator-min-microvolt = <2200000>;
-			regulator-max-microvolt = <3300000>;
-			regulator-ramp-delay = <0>;
-			regulator-always-on;
-			regulator-boot-on;
-		};
-	};
diff --git a/Documentation/devicetree/bindings/soc/mediatek/mediatek,pwrap.yaml b/Documentation/devicetree/bindings/soc/mediatek/mediatek,pwrap.yaml
index e7c4a3984c60..79b755858bad 100644
--- a/Documentation/devicetree/bindings/soc/mediatek/mediatek,pwrap.yaml
+++ b/Documentation/devicetree/bindings/soc/mediatek/mediatek,pwrap.yaml
@@ -105,6 +105,9 @@ properties:
   pmic:
     type: object
 
+  regulators:
+    $ref: /schemas/regulator/mediatek,mt6380-regulator.yaml#
+
 required:
   - compatible
   - reg
-- 
2.53.0

