Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51C7C3932FF
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 21:40:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788644457; cv=none; b=aZ0PfB6oq35g4vRHRRbFlCAMZAia6exD1BnFRB1G/Hkj2xOXWbivh0MEJGgEMz32JelO/ACq0seLN3WZZwg+V5ZUl9/mj/Jjv3x3dKfNxvkxXJKaba0ZDI2Jx8Z04cttvy1nF8Xtcp9tlucnKF74foMZTUAOF/78KKmigAd4zdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788644457; c=relaxed/simple;
	bh=e23BakfpYJhjyP2ucXP6cacP2+FKBtaeDCbJOqNaJ7A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=LBqhJ9YUtroZ/DeupaKnrJ8q5HwoZ/akUK1QZDuHy+DnRMdPywZwob3K2s8lVPNmimPLPIsgbE2zsO6lvcC67lo5UCI5aBbdQQNf95IWxHwTrTXKIh+5ZEl+2WW5l60eAkVnZOuR9HBA3izTFXDhgt3HK3MPQS7ZIm7oGAqicC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D4dBCCxy; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D4dBCCxy"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d6ff2f2c4dso1578965ad.0
        for <linux-kernel@vger.kernel.org>; Sat, 05 Sep 2026 14:40:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788644452; x=1789249252; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Xr9RpJGtTR8iOeBIr69Q6X2tM34/vFLnHddN/zE6R7Q=;
        b=D4dBCCxyb/DUKFbo8rwg+kNrXpQifUFMSu9pAV140xQk/2gtx2JjAg7B5BZ3YEt5GM
         /wE8pJINSWeZ2tsE2IJoUz8o/bfGy4nrGS0Ut1Yqkw8dLgbK1K3/kIhD0HbZ8jczMDDS
         sAiZaG/K+hwkPUWU9jQ8qBkA3Mm8WqKhADyi1kx0+rJvbdnkrln2guQs204ErLemGjNW
         TjIhZBIWhcRR1+XT6adQs/3TLItTvBadWlrXw2HN9enn1sPUiF+PprZOPwnJN43+0LUU
         uKcUrWvfCTB4W7mrrbtkS7GYvrJeTkt8/zkSADWu6VlIINEzMX6Gw2oQ/w1ESq0NnUf/
         WG0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788644452; x=1789249252;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Xr9RpJGtTR8iOeBIr69Q6X2tM34/vFLnHddN/zE6R7Q=;
        b=dtpWE9h5tp5ENLgxxF9tRT+BG/3Tn+mttzewIRrwQo2TWOdUI9kDbcEQ7L9g8uCMJn
         ru7e+txZItLiTDPnrjdS1501Xlpyp34GOeFoOnOsTc5p61tzpFJdugkFHjEfltdHpMPV
         cRAIBO/we3KrQPxLZyUpromXoNO4sQCo2c/ji2b5OJd05seCIdTMXBpnH53bINzBbErd
         HOLtm+N0gBwTmA0FJME13b1tAPLz3d6lXCcQlhRfAZ0mzX5VvG14vFdCYx+TtkpF7vbm
         PUo4pWx38PFSnqmzTf9BqUdTILjc9s5wsfUdRI1moq1Wi8BlF3HIrH9rsDEO012q8g5g
         K4pg==
X-Forwarded-Encrypted: i=1; AKwUvBxwHJVi7VZqovYVirSvRnB7j/Yi5UkYg1wqQa/3aGJg0dsTaAMbc4gr2f0BNvH4HZ4kNGAI1f1V42jHuiA=@vger.kernel.org
X-Gm-Message-State: AFuF++l1buOt0b/N6NpIo88FfxdHR3RT1YIvBZTSxI+ae4TPKUTWUhF3
	2GhMXKJ3UAGmQZwQnfXIp0SxYEr20oj5pNVLvxMJiaPpib8Bgf77l+KJ
X-Gm-Gg: AYBFou0M5mydNy2aUyqq7yrjKZ4yAzhAMtv+fm3w1uG/8ZashzapdIqNUDAitfzVtsG
	zBIvgaUvsZ1T8/Iyl/oqCRL8nB/Lrl0nmVIjWGvjd+kDZVEo04JZavdmq18/3orjn4+AubsrLoc
	lTU4cZ3OTb7oVu0v0oZMAp6rdB1AERNw0YO30sDz77H8Mi9U6la7E753kbBXArkllyj1q4WdUS3
	HYUE+Ih+UL9wNVRvChzOg2UMpFiFnbE3MNlU+6iBFnzdGmsr5E7e5lIuq3pO8tOix4j2BODHd0x
	fFVwIGeWuY7X1Coeu0r2gHqe8DiCfKC8pYqNt5/lt63q1j/v+xtcvrk2dXzm5XKstgpPvwB2GhY
	3JyllhEMpy+gBGrtfevmOua6SwgnVCgB0LxrxP2NMEDFV1NSompEeUICahmh3lBCyx5YBhGcbRh
	lAX8AerGC0rWssRmGOfJpPz7CBz38HqIWEsUGaR5InEt7vPEmJpTaH5fl+c1I99xBzMfBz0E9r
X-Received: by 2002:a17:90b:578b:b0:39b:3510:4af7 with SMTP id 98e67ed59e1d1-39b3d5ccb8fmr7822983a91.1.1788644451722;
        Sat, 05 Sep 2026 14:40:51 -0700 (PDT)
Received: from [10.63.138.252] ([2409:40c2:5007:4aea:63cc:914c:1243:e03c])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39ae8f1448esm7585629a91.4.2026.09.05.14.40.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 14:40:51 -0700 (PDT)
From: Bhargav Joshi <j.bhargav.u@gmail.com>
Date: Sun, 06 Sep 2026 03:10:31 +0530
Subject: [PATCH v3] dt-bindings: clock: ti,da850-pll: Convert to DT schema
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260906-ti-pll-v3-1-d1751f4648f0@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/02NTQ6DIBgFr2JYl0awCHTVezRdIH4ojX8BS9oY7
 17QtHE5yZt5C/LgLHh0zRbkIFhvxyFCccqQbtXQALZ1ZERzWuZlkePZ4qnrsLwYAZWURGiB4nh
 yYOx7C90fO/tX9QQ9JzstWuvn0X22p0DSbo9ywn/RQDDBpjSyUkLLisGt6ZXtznrsUYoGetBo8
 ddo1HStGTAmFef1UVvX9QsHVs7b5QAAAA==
X-Change-ID: 20260630-ti-pll-94f8eb9918c8
To: David Lechner <david@lechnology.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, goledhruva@gmail.com, m-chawdhry@ti.com, 
 daniel.baluta@gmail.com, simona.toaca@nxp.com, j.bhargav.u@gmail.com
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788644439; l=7892;
 i=j.bhargav.u@gmail.com; h=from:subject:message-id;
 bh=e23BakfpYJhjyP2ucXP6cacP2+FKBtaeDCbJOqNaJ7A=;
 b=jQB7NQIGTZkgGY+jZr0o6McuwYWNAH1wjd+9tmauTJ34+Z5k3GV/7LJUEei9VMKJZiUy+F69+
 KTkwnzPwMilATNspe6RlcumVc69WIyq8clO6imDVk5arYObeulsVqoy
X-Developer-Key: i=j.bhargav.u@gmail.com; a=ed25519;
 pk=IqNDwUZKECEA+n8wXctFLBbYL9NhFstZNbOznm/nX1k=

Convert TI da850-pll binding from legacy text to dt schema.
No functional change is introduced during conversion.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: David Lechner <david@lechnology.com>
Link: https://lore.kernel.org/r/20260717-ti-pll-v1-1-f6f9ba8c9b5e@gmail.com
Signed-off-by: Bhargav Joshi <j.bhargav.u@gmail.com>
---
Changes in v3:
- Collected tags.
- Rebased to latest mainline rc.
- Link to v2: https://lore.kernel.org/r/20260723-ti-pll-v2-1-cdc5e559a77d@gmail.com

Changes in v2:
- Moved 'items' list for clocks and clock-names to the top-level
  properties block.
- Dropped redundant maxItems: 2 to fix dt_binding_check warnings.
- Simplified allOf block to only restrict maxItems for pll1.
- updated maintainers list
- Link to v1: https://lore.kernel.org/r/20260717-ti-pll-v1-1-f6f9ba8c9b5e@gmail.com
---
 .../devicetree/bindings/clock/ti/davinci/pll.txt   |  96 ------------
 .../bindings/clock/ti/davinci/ti,da850-pll.yaml    | 164 +++++++++++++++++++++
 2 files changed, 164 insertions(+), 96 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/ti/davinci/pll.txt b/Documentation/devicetree/bindings/clock/ti/davinci/pll.txt
deleted file mode 100644
index c9894538315b..000000000000
--- a/Documentation/devicetree/bindings/clock/ti/davinci/pll.txt
+++ /dev/null
@@ -1,96 +0,0 @@
-Binding for TI DaVinci PLL Controllers
-
-The PLL provides clocks to most of the components on the SoC. In addition
-to the PLL itself, this controller also contains bypasses, gates, dividers,
-an multiplexers for various clock signals.
-
-Required properties:
-- compatible: shall be one of:
-	- "ti,da850-pll0" for PLL0 on DA850/OMAP-L138/AM18XX
-	- "ti,da850-pll1" for PLL1 on DA850/OMAP-L138/AM18XX
-- reg: physical base address and size of the controller's register area.
-- clocks: phandles corresponding to the clock names
-- clock-names: names of the clock sources - depends on compatible string
-	- for "ti,da850-pll0", shall be "clksrc", "extclksrc"
-	- for "ti,da850-pll1", shall be "clksrc"
-
-Optional properties:
-- ti,clkmode-square-wave: Indicates that the board is supplying a square
-	wave input on the OSCIN pin instead of using a crystal oscillator.
-	This property is only valid when compatible = "ti,da850-pll0".
-
-
-Optional child nodes:
-
-pllout
-	Describes the main PLL clock output (before POSTDIV). The node name must
-	be "pllout".
-
-	Required properties:
-	- #clock-cells: shall be 0
-
-sysclk
-	Describes the PLLDIVn divider clocks that provide the SYSCLKn clock
-	domains. The node name must be "sysclk". Consumers of this node should
-	use "n" in "SYSCLKn" as the index parameter for the clock cell.
-
-	Required properties:
-	- #clock-cells: shall be 1
-
-auxclk
-	Describes the AUXCLK output of the PLL. The node name must be "auxclk".
-	This child node is only valid when compatible = "ti,da850-pll0".
-
-	Required properties:
-	- #clock-cells: shall be 0
-
-obsclk
-	Describes the OBSCLK output of the PLL. The node name must be "obsclk".
-
-	Required properties:
-	- #clock-cells: shall be 0
-
-
-Examples:
-
-	pll0: clock-controller@11000 {
-		compatible = "ti,da850-pll0";
-		reg = <0x11000 0x1000>;
-		clocks = <&ref_clk>, <&pll1_sysclk 3>;
-		clock-names = "clksrc", "extclksrc";
-		ti,clkmode-square-wave;
-
-		pll0_pllout: pllout {
-			#clock-cells = <0>;
-		};
-
-		pll0_sysclk: sysclk {
-			#clock-cells = <1>;
-		};
-
-		pll0_auxclk: auxclk {
-			#clock-cells = <0>;
-		};
-
-		pll0_obsclk: obsclk {
-			#clock-cells = <0>;
-		};
-	};
-
-	pll1: clock-controller@21a000 {
-		compatible = "ti,da850-pll1";
-		reg = <0x21a000 0x1000>;
-		clocks = <&ref_clk>;
-		clock-names = "clksrc";
-
-		pll0_sysclk: sysclk {
-			#clock-cells = <1>;
-		};
-
-		pll0_obsclk: obsclk {
-			#clock-cells = <0>;
-		};
-	};
-
-Also see:
-- Documentation/devicetree/bindings/clock/clock-bindings.txt
diff --git a/Documentation/devicetree/bindings/clock/ti/davinci/ti,da850-pll.yaml b/Documentation/devicetree/bindings/clock/ti/davinci/ti,da850-pll.yaml
new file mode 100644
index 000000000000..c6563290a702
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/ti/davinci/ti,da850-pll.yaml
@@ -0,0 +1,164 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/ti/davinci/ti,da850-pll.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: TI DaVinci PLL Controllers
+
+maintainers:
+  - David Lechner <david@lechnology.com>
+
+description:
+  The PLL provides clocks to most of the components on the SoC. In addition to
+  the PLL itself, this controller also contains bypasses, gates, dividers, an
+  multiplexers for various clock signals.
+
+properties:
+  compatible:
+    enum:
+      - ti,da850-pll0
+      - ti,da850-pll1
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    minItems: 1
+    items:
+      - description: Primary reference clock input
+      - description: External clock source
+
+  clock-names:
+    minItems: 1
+    items:
+      - const: clksrc
+      - const: extclksrc
+
+  ti,clkmode-square-wave:
+    type: boolean
+    description:
+      Indicates that the board is supplying a square wave input on the OSCIN
+      pin instead of using a crystal oscillator.
+
+  pllout:
+    type: object
+    description:
+      Main PLL clock output before POSTDIV.
+
+    properties:
+      '#clock-cells':
+        const: 0
+
+    required:
+      - '#clock-cells'
+
+    additionalProperties: false
+
+  sysclk:
+    type: object
+    description:
+      PLLDIVn divider clocks that provide the SYSCLKn clock domains. Consumers
+      of this node should use "n" in "SYSCLKn" as the index parameter for the
+      clock cell.
+
+    properties:
+      '#clock-cells':
+        const: 1
+
+    required:
+      - '#clock-cells'
+
+    additionalProperties: false
+
+  auxclk:
+    type: object
+    description:
+      AUXCLK output of the PLL
+
+    properties:
+      '#clock-cells':
+        const: 0
+
+    required:
+      - '#clock-cells'
+
+    additionalProperties: false
+
+  obsclk:
+    type: object
+    description:
+      the OBSCLK output of the PLL.
+
+    properties:
+      '#clock-cells':
+        const: 0
+
+    required:
+      - '#clock-cells'
+
+    additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+
+additionalProperties: false
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          const: ti,da850-pll1
+    then:
+      properties:
+        clocks:
+          maxItems: 1
+        clock-names:
+          maxItems: 1
+        ti,clkmode-square-wave: false
+        auxclk: false
+
+examples:
+  - |
+    clock-controller@11000 {
+        compatible = "ti,da850-pll0";
+        reg = <0x11000 0x1000>;
+        clocks = <&ref_clk>, <&pll1_sysclk 3>;
+        clock-names = "clksrc", "extclksrc";
+        ti,clkmode-square-wave;
+
+        pllout {
+            #clock-cells = <0>;
+        };
+
+        sysclk {
+            #clock-cells = <1>;
+        };
+
+        auxclk {
+            #clock-cells = <0>;
+        };
+
+        obsclk {
+            #clock-cells = <0>;
+        };
+    };
+
+  - |
+    clock-controller@21a000 {
+        compatible = "ti,da850-pll1";
+        reg = <0x21a000 0x1000>;
+        clocks = <&ref_clk>;
+        clock-names = "clksrc";
+
+        sysclk {
+            #clock-cells = <1>;
+        };
+
+        obsclk {
+            #clock-cells = <0>;
+        };
+    };

---
base-commit: 9f0346dcbea363787186c94ef94dd01aaa215afa
change-id: 20260630-ti-pll-94f8eb9918c8

Best regards,
--  
Bhargav

