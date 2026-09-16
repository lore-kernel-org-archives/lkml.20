Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 063994F55D0
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 13:14:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789564448; cv=none; b=rCBYwL4zA1RqnPmTYZZxjnugpe22Dan+HBLUHeOtC64tOUNGvAeAdMVbpQpvvZzvyQjwqwh9VUsAJt/JnhKp2VgnIaqL0a9jp8j7lpY20+d0F3kJYoS1Z14bvdlP2XcvyJ9WCedKWFgXxzGqylxVOg723atsaBuCmUcZ4bXMT6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789564448; c=relaxed/simple;
	bh=Co/FuuwQTAJHp+zfOvsnW4jKaJGU3w7YpCQXjFi9wF8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QuIX4DasKxlDRlly6MMfC4PzENh0+D3Fa6rFn4Pvy2U8mX1KqFQB8ccnzSFP78qZFV2ZIP2kLnFrtLklsKBz2KlpKioZRlEH0uaZ9veqMcpD/PCgityhLMC8OIsygXqR0lEIyFQBDVmvjcto2NmWzkuyO2qTlDLPWQdmvkThMoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WuOrxGUp; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WuOrxGUp"
Received: by mail-pz2-f12.google.com with SMTP id d2e1a72fcca58-85368f1d484so120559b3a.1
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 06:14:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789564446; x=1790169246; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IvH662dOnIBtA8vIbuF/kJDS4lP+vMorwMZVPkvKzh8=;
        b=WuOrxGUpLMZbLSt+nVIMdWzjdJoEdzM5Fy2RMju81M0JpquoVMkpuHpQmaLSC884vN
         jPe8TZaGfzgU03aoitlRcHUzastGRfS2DqM0VPsA5FkxiObpTR0R5cocGGXNrkOPel3u
         siuVmJNte5w+I/mMteJ6SS2iFjzVE0AazrrrtqDXVocQjp8+7HM+4RsaUFfI/eLlg9db
         1SJPqMyAcoe6z9ZR9hactHlfg2mPt1A6NWxDp4MdThf2RKm1SY/qyFaRAHeajkuAE2uO
         8zxPN5J1cv80NeYy0oxMbwihC1QhqYdfnYt+IQg/suwWnSTna/gh3+Xtivm1Wht+hvsS
         2mdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789564446; x=1790169246;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IvH662dOnIBtA8vIbuF/kJDS4lP+vMorwMZVPkvKzh8=;
        b=xSfNS4wid9xd9bbDLDGcaTlnO04ny7sRFp0SXTiEH0H53k3KgBu6IeyGcsuc9ZaRO/
         CSDIzmvgMmIQUA+V1zHXtBF2qUmwB0yyckHL4b+2mUyGdHurMoKhPV5T7Vmr93Hye0b8
         9p/wHqvdeZGRE1zbQSpFBY5L62u6zivk/Hf9W+XcbCWFls0UlEeZCYHs6vPU3F/MABo4
         yyMgFXEdYnz8mKSxXeW6eYdrFYBJSEaizY2CArVODiGGdLwzML+Umchln4fMt9eH0jfJ
         IEGPErMMCTid+UBaziU42MfBxfX6Evj9Z1OeqTCGQRZLDu2//uARJYTLTtAxFQhzVwda
         KABA==
X-Gm-Message-State: AFuF++moPUuj+Wgey5E5yvOQexv2t55W9QPfqBI22uGlkOedKIvebsM6
	u74kpJxfCYwqs1ZGcT6chzJD7K/3W86EJTCuqXG/AUf20cGbsxo42G0p
X-Gm-Gg: AYBFou3Z6pt3p8Y3YkKQ5cOJbbb32WT7Xbmuj9qoufEpsm/A5J8AUthrTRtQyBMuuHF
	+EV6x8VYlScfbi4IOxJVGY8Yq7j+PcnNN8psUScnHqxaOmrIqDd/EiwGUjNbE6ZCLVgkKOkLM16
	F+hD40j0dp9BrS4Gn4Pa9JGhdRBuVllr6o9Htbai7EALK3736soM5GFYvow0fJ1rH+SU9PtPH+5
	HRZMVXOuj13mReIrq9Yi6pXag/UtY285WjrWFA2AKNSCQ2H2lpbgtEPSzGU0703LW6Rpl7qqL/W
	IYS/LFP/PO0yE/lE/Cfa98b8bWcqW1jEW//CYdZ+fCHrl7GmQ+Hp5gpEyZ46+WtQvh+q5NT9wxE
	3H5uxALqKWaEBgstFHV21TH9GLBnAmvYxmhae2JZg3tCCnYujUuL8EBCNIrYviv2QMvlsR95l/A
	3weDoa3P/e5aLXC+skGTObB58JbgmAFXMHnJC0+BiSjM+enbZI8haoWRPi9Mw+4yA1ZgP86V+vw
	Rr60qR8aOLLoBANCpGK9A==
X-Received: by 2002:a17:90b:4c49:b0:39b:3510:4af7 with SMTP id 98e67ed59e1d1-39e1e2655f1mr4104606a91.1.1789564446036;
        Wed, 16 Sep 2026 06:14:06 -0700 (PDT)
Received: from [10.107.92.252] ([2409:40c2:5413:87f7:9fa7:eb18:a8e7:30a7])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bf5aa1194sm9422972eec.14.2026.09.16.06.13.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 06:14:05 -0700 (PDT)
From: Bhargav Joshi <j.bhargav.u@gmail.com>
Date: Wed, 16 Sep 2026 18:41:29 +0530
Subject: [PATCH v2 4/4] regulator: dt-bindings: ti,tps6586x: Convert to DT
 schema
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260916-ti-tps6586x-v2-4-f12cfdfb446c@gmail.com>
References: <20260916-ti-tps6586x-v2-0-f12cfdfb446c@gmail.com>
In-Reply-To: <20260916-ti-tps6586x-v2-0-f12cfdfb446c@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789564321; l=10374;
 i=j.bhargav.u@gmail.com; h=from:subject:message-id;
 bh=Co/FuuwQTAJHp+zfOvsnW4jKaJGU3w7YpCQXjFi9wF8=;
 b=trvJkb/BTxF/UoaOp+8twTlQVAKaroMcYVW3hMh74EPDUNt2Qi0Qtn6iIRknGMy6Gud95wz0a
 33kUASyJ65wAuvX/Qo9Bm6ugnAwIx2X6dFV7J6hLVDpa/bJHrlURWlj
X-Developer-Key: i=j.bhargav.u@gmail.com; a=ed25519;
 pk=IqNDwUZKECEA+n8wXctFLBbYL9NhFstZNbOznm/nX1k=

Convert Texas Instruments tps6586x regulator binding from text to DT
schema. Reference to nvidia,tegra-regulators-coupling in child regulator
nodes.

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

