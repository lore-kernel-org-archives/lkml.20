Received: from mail-wr2-f36.google.com (mail-wr2-f36.google.com [74.125.225.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8729D57983D
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 20:47:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790196469; cv=none; b=KFbT7x7Ek3KskpDh1yN3RwKFrlXlzVFLsB8/0D3EXHC+AP9LOGcTCW67rqhM1dffa7EP10aG9hI1zMyzf16+gFGr9+Ns2Rm/lYxah52D8IolzZ0S/0l7w51KNZDpsdktp+FZRPQc3ekVIOOAY36Sxa67wJtn0FlX1pGazpiMrnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790196469; c=relaxed/simple;
	bh=2Rk7dcj1EIntxo1C/ioN2dfS7ZxOV+D+YaH7GClK4Vk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YPVSo6BmxAA6nsfuGUw1Gbv1KvkburQ+5quaOxQ/3ZuQp8XE6vfJFS/6B4prFgHPDSoSDx+dGXI8vDXJ89853CtMMhSw+0Qo75ya1xqhZojDy1T9dBbNxazpB2eO4I4g6bEfIB06K6LH1BjnteVLNPok4zt2nZsrGmP/NmojLIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=RZjmM5ZT; arc=none smtp.client-ip=74.125.225.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="RZjmM5ZT"
Received: by mail-wr2-f36.google.com with SMTP id ffacd0b85a97d-4843c3ee4cfso840439f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 13:47:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1790196465; x=1790801265; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XWoyChkF8PBA93YfN7WK6+qy/EfUiqZ/evixTMMcgfA=;
        b=RZjmM5ZTQ2abI5sKPWDx8RQY2Q4r0HApK7/uZ3nRavmrrJtIBiCn9q8kXWwpyCe/9T
         wW5wGHwE3dlgMJ569UDM/h9rUDAaJkjYk9MP7l1dqb/zKNlz+gAcEKj1PMpOGHFd7J55
         OVY+fZ1urO5QSmOq5bW+UiC0vrB3jsWR+ask+8dCX+SzCYZNj2FSRcJ9qeYk8TtDK/0X
         HvSSzPbjrledFI5LTszh7/rvo+2d3/UMz8cK34au/6DEqMYFK+gy5/nWSHAys2B9hzuY
         JUIMTIcrtl9fCqpaNox9rWGqObibuUqftLea3zaCB3MVdpxpLSA9YQg4xARU+byviyAs
         veQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790196465; x=1790801265;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XWoyChkF8PBA93YfN7WK6+qy/EfUiqZ/evixTMMcgfA=;
        b=CSUA3/LWSn83G940xanU0oD+SPW0u98sUhA8zDLfXLRkKLg84XskDXPWID0bLJnR4/
         fBAKVjYUm/4o3eObCvkWQPghUCpIN4jL8RAeNN26bw3x5PMB8HUn3X0aKhtEZT36Vr/7
         1o/u83imCgMGOy5KR/qzQHmZsBAvtZdIkdxCXDehMgGM559O8Fhlc3yKHgETQEnbV8ev
         1pez18H37snvghE59mvAqgxBHGni4tgPLXn2PwSHkekR5fSaMPZHNMzPy90c7h0E5NgW
         UmDcjAAA1gB0ZOLZfnevf7IYvz6JJ4aI5ZAaNeOJrETZt86h0nxiyj1fda5z3ncuuc2T
         uTZA==
X-Forwarded-Encrypted: i=1; AKwUvByWRiQY3Ocrbpja7/l1a+3d2965Ts1A8uVoiQ8Lrk/W8PstY1Tq1kABcJdBjswB0muEyA6CukjrftLWCeI=@vger.kernel.org
X-Gm-Message-State: AFuF++nUgHK4zaCGEdyqrawaX5sJ70r1r292YBf5TAjt4uEBpqs1udqg
	ow2KVB8kBFw0wp4lXS7uqYXBkkNA9islc2XwogyPcUJ3DR7xJiPK5HRsj1PDaVPsNIQ=
X-Gm-Gg: AYBFou3h4a3iFDaUn0Wdhze3Ao00sXwJ3GNDbIJ0zHdMfz+6ROTfMrKgrP/MYFbgkRz
	3NsmFmcWrSdg4I8xGsaU2HmE/11iLuW9hitiiKt6z5DvIYIO4bWHdN2aCc4+/eqYOdrj7Fq8sph
	SxqZjf+ApjxUISagN4nGBj6PmIgKVpMP9G5p6iUXOYYNJLXKr6lUA1pG5LWcYU3wHZ4AM3AFKWR
	l268trfyoO0gOLJQMezJmMOoYsWso+VcASVhZbpS/FjQ+FMKshse6Saekn65AuzIxCgwGx5//3i
	rLfzgk112/7R6aR1RupE7VdJSzdRQQcr7wRFcCvYk+dwJpR9ymE3z4/QZszlIZ3HwKe5NHoX7cg
	2CgC/sk+1RbvU3+opjwGCPnVOZcFK9iwPT9IobcGPnFGMWgTZ/CYtxDWWvGTsJx3s5CZO/qvYr+
	E5z5zANkyBm3EtSnHLMtO/WQF6q0CFCi4HPL6DH2lN6WDSXp0TZMNLUcmAihJy84227jjOF4Qda
	DOwd1QRC7wqwQi7ew==
X-Received: by 2002:a05:6000:25c2:b0:487:2354:d9d5 with SMTP id ffacd0b85a97d-488717240c7mr464443f8f.55.1790196464768;
        Wed, 23 Sep 2026 13:47:44 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4886876c500sm9316780f8f.19.2026.09.23.13.47.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 13:47:43 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Wed, 23 Sep 2026 22:47:31 +0200
Subject: [PATCH net-next v3 1/5] dt-bindings: net: sun8i-emac: Add A733
 GMAC210 compatible
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260923-allwinner-a733-gmac-support-v3-1-15735155a789@baylibre.com>
References: <20260923-allwinner-a733-gmac-support-v3-0-15735155a789@baylibre.com>
In-Reply-To: <20260923-allwinner-a733-gmac-support-v3-0-15735155a789@baylibre.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Richard Cochran <richardcochran@gmail.com>, 
 Maxime Ripard <mripard@kernel.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 Andre Przywara <andre.przywara@arm.com>, 
 Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=6760; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=2Rk7dcj1EIntxo1C/ioN2dfS7ZxOV+D+YaH7GClK4Vk=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDFlbrN5qaUf77BN3bJwfJC++VkBvYaWMbYWR1afZ6mJr4
 ja++vSso4SFQYyLQVZMkaWGu1r8naTWl1nTdW7DzGFlAhnCwMUpABPZupHhxz517jN7T5x3alB1
 N9/pM2vPwZOyh00kIpz4098WTOzczMgwY17a0wPyxufk71jW3GtatmaK+xmGP3+FGRsu27j4yvX
 xAwA=
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

The A733 GMAC210 is a DesignWare MAC 5.20 close to the A523 GMAC200, with
the following differences:

 * The glue configuration registers are a dedicated MMIO region of the
   controller instead of a syscon register, so a second reg entry replaces
   the syscon phandle.
 * The DMA channels and the LPI event have their own interrupt lines.
 * A PTP reference clock and an AHB reset are needed.
 * Unlike the A523, the controller does not appear to belong to a power
   domain.
 * The TX clock delay field is 5 bits wide and both TX and RX delays use a
   180ps step, allowing up to 5580ps.

Add the new compatible and describe those differences. Declare the internal
delay properties at the top level and keep their limits per compatible.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 .../bindings/net/allwinner,sun8i-a83t-emac.yaml    | 142 ++++++++++++++++++---
 1 file changed, 126 insertions(+), 16 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/allwinner,sun8i-a83t-emac.yaml b/Documentation/devicetree/bindings/net/allwinner,sun8i-a83t-emac.yaml
index 323a669fa982..a4e0d9b760fe 100644
--- a/Documentation/devicetree/bindings/net/allwinner,sun8i-a83t-emac.yaml
+++ b/Documentation/devicetree/bindings/net/allwinner,sun8i-a83t-emac.yaml
@@ -22,6 +22,7 @@ select:
           - allwinner,sun8i-v3s-emac
           - allwinner,sun50i-a64-emac
           - allwinner,sun55i-a523-gmac200
+          - allwinner,sun60i-a733-gmac210
   required:
     - compatible
 
@@ -44,25 +45,38 @@ properties:
       - items:
           - const: allwinner,sun55i-a523-gmac200
           - const: snps,dwmac-4.20a
+      - items:
+          - const: allwinner,sun60i-a733-gmac210
+          - const: snps,dwmac-5.20
 
   reg:
-    maxItems: 1
+    minItems: 1
+    items:
+      - description: MAC controller registers
+      - description: Glue configuration registers
 
   interrupts:
-    maxItems: 1
+    minItems: 1
+    maxItems: 4
 
   interrupt-names:
-    const: macirq
+    minItems: 1
+    items:
+      - const: macirq
+      - const: eth_lpi
+      - const: tx-queue-0
+      - const: rx-queue-0
 
   clocks:
     minItems: 1
-    maxItems: 2
+    maxItems: 3
 
   clock-names:
     minItems: 1
     items:
       - const: stmmaceth
       - const: mbus
+      - const: ptp_ref
 
   phy-supply:
     description: PHY regulator
@@ -76,6 +90,18 @@ properties:
       Phandle to the device containing the EMAC or GMAC clock
       register
 
+  tx-internal-delay-ps:
+    default: 0
+    minimum: 0
+    description:
+      Internal RGMII PHY TX clock delay chain value in ps.
+
+  rx-internal-delay-ps:
+    default: 0
+    minimum: 0
+    description:
+      Internal RGMII PHY RX clock delay chain value in ps.
+
 required:
   - compatible
   - reg
@@ -87,7 +113,6 @@ required:
   - reset-names
   - phy-handle
   - phy-mode
-  - syscon
 
 allOf:
   - $ref: snps,dwmac.yaml#
@@ -215,6 +240,34 @@ allOf:
             - mdio-parent-bus
             - mdio@1
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - allwinner,sun8i-a83t-emac
+              - allwinner,sun8i-h3-emac
+              - allwinner,sun8i-r40-gmac
+              - allwinner,sun8i-v3s-emac
+              - allwinner,sun50i-a64-emac
+    then:
+      properties:
+        reg:
+          maxItems: 1
+        interrupts:
+          maxItems: 1
+        interrupt-names:
+          maxItems: 1
+        clocks:
+          maxItems: 1
+        clock-names:
+          maxItems: 1
+        power-domains: false
+        tx-internal-delay-ps: false
+        rx-internal-delay-ps: false
+      required:
+        - syscon
+
   - if:
       properties:
         compatible:
@@ -222,32 +275,60 @@ allOf:
             const: allwinner,sun55i-a523-gmac200
     then:
       properties:
+        reg:
+          maxItems: 1
+        interrupts:
+          maxItems: 1
+        interrupt-names:
+          maxItems: 1
         clocks:
           minItems: 2
+          maxItems: 2
         clock-names:
           minItems: 2
+          maxItems: 2
+        resets:
+          maxItems: 1
+        reset-names:
+          maxItems: 1
         tx-internal-delay-ps:
-          default: 0
-          minimum: 0
           maximum: 700
           multipleOf: 100
-          description:
-            External RGMII PHY TX clock delay chain value in ps.
         rx-internal-delay-ps:
-          default: 0
-          minimum: 0
           maximum: 3100
           multipleOf: 100
-          description:
-            External RGMII PHY TX clock delay chain value in ps.
       required:
         - power-domains
-    else:
+        - syscon
+
+  - if:
       properties:
+        compatible:
+          contains:
+            const: allwinner,sun60i-a733-gmac210
+    then:
+      properties:
+        reg:
+          minItems: 2
+        interrupts:
+          minItems: 4
+        interrupt-names:
+          minItems: 4
         clocks:
-          maxItems: 1
+          minItems: 3
         clock-names:
-          maxItems: 1
+          minItems: 3
+        resets:
+          minItems: 2
+        reset-names:
+          minItems: 2
+        tx-internal-delay-ps:
+          maximum: 5580
+          multipleOf: 180
+        rx-internal-delay-ps:
+          maximum: 5580
+          multipleOf: 180
+        syscon: false
         power-domains: false
 
 unevaluatedProperties: false
@@ -412,4 +493,33 @@ examples:
             };
         };
     };
+
+  - |
+    ethernet@4510000 {
+        compatible = "allwinner,sun60i-a733-gmac210",
+                     "snps,dwmac-5.20";
+        reg = <0x04510000 0x8000>,
+              <0x04518000 0x1000>;
+        clocks = <&ccu 58>, <&ccu 59>, <&ccu 60>;
+        clock-names = "stmmaceth", "mbus", "ptp_ref";
+        resets = <&ccu 30>, <&ccu 31>;
+        reset-names = "stmmaceth", "ahb";
+        interrupts = <0 175 4>, <0 179 4>, <0 176 4>, <0 177 4>;
+        interrupt-names = "macirq", "eth_lpi", "tx-queue-0", "rx-queue-0";
+        pinctrl-names = "default";
+        pinctrl-0 = <&rgmii1_pins>;
+        phy-handle = <&ext_rgmii_phy_2>;
+        phy-mode = "rgmii-id";
+        snps,fixed-burst;
+
+        mdio {
+            compatible = "snps,dwmac-mdio";
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            ext_rgmii_phy_2: ethernet-phy@1 {
+                reg = <1>;
+            };
+        };
+    };
 ...

-- 
2.53.0

