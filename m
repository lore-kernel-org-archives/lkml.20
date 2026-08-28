Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7DD9360EE5
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 15:35:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787931347; cv=none; b=mKPuc5YoLLQZdrn9MulctQ5myIVFsjHEcfIO79dRFyNe58trBorXRka90hUOWRnvSiyEjYoE56UUJ2k2p9K+k3DCVHDdC2dRpaRS/kFLR3tzdBENcOnOwCJ3keyTWM1UQ5mdFTrHqzWK5rWISZDBi+LE2TfQCiw5a/hWHKfRpio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787931347; c=relaxed/simple;
	bh=f5LUIDQ3kAGbUCa6eRCIqJESiuxof5cuH09KVsyXOAY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=qtM58FvcQht0bSBZJRCJP87mQGkke+QEEo2yIDWBmnlPTj5pND92UbcIN9uRrtUdKbrcy/m2kyPCYb2CFyASf9GPqLhwUao/C8ZwPh7gb/llrKKgFF/Mja5xomPvt4+PYKhHERRHjQnTWkMrRWdOkiTMAamzUwZNOVpoXk3Q+HI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fR8kpdJC; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fR8kpdJC"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-39647184c73so2196370a91.1
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 08:35:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787931345; x=1788536145; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zCeTc9lFzVngFgqZDJ957kMMyxZG+4tMbEHn+5tCb/Y=;
        b=fR8kpdJCbGGVx89B28YlPOcwYnkxAryYYFxQebjUorQbXTfYQ7CiXNzV+YNouCjzMK
         hLjZSY/8qXlUa9VXtpsuIVHEogxK6NGoAonPe/GQ9hz5zHUfFGC8VoVe/RFEG8AN7nWF
         xinqF4Ap1nKh5fTVR/bfTKcDPISYLPv/9ENuBMd95JkROeSAuOwmFF+BaXe1KG2GUxHm
         zMGLxqoL+FfBI9brLMUCEHsd7uNL7+qV77UmjPTiIQsbrt33s/p9B1YSGx1TKVd62zoW
         uu8uJa/YGznYESIpcEewxa0IDM8K4bCXihywn1/yIvlyh0zHaum7VCCEVMetq7zGcOk9
         JsMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787931345; x=1788536145;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zCeTc9lFzVngFgqZDJ957kMMyxZG+4tMbEHn+5tCb/Y=;
        b=cX2bpku5QcVznZ3pHqvP79A0FMnYzhLWd8oOyi2fULN7Rego/r4lMn70ekVlW9jZjG
         v5s3r/AP56fAZJoM5GRl+wPf21kFtew8IOrMME4m5Dr88PrMXvoTVVi2mI0RIgJeJfsZ
         OTNHo51tz1FTx4eB7yymgQ36YFwsPFxFKIAhnb2HkJFCS9wJt6RphjEnjUNWmr5/PzRo
         nF3hZ7kIBoStfcN7w9VuR92wj1s3LAo4YQ8sMOO6QhMttViKla7CdEIrZZSjwX8k8cTT
         erZHWdY2X/EPGsCBxILFWV0wsraHE3OHN4yt0q/EXuE2XWYvJl4rZ4Uac3axBuUtpKot
         Z9Bg==
X-Forwarded-Encrypted: i=1; AHgh+Rrm07RKuHjhHECntstlraYtWZMn5YqylPxTrVlZjvo3E1z2lWCJAKlPlaEbla8MC1+p4JGueE1bAgGVLWs=@vger.kernel.org
X-Gm-Message-State: AFuF++kMugbKiyvrTvS8AmR6pzYijvHWDiPEKqshA5V/1QafX+CDvkYT
	k9CufXxlUmps/l2l/JHBo4guRqMq5icuLxJfWu/V+nYXMVzI2p2TIE7d
X-Gm-Gg: AR+sD13+x58SavN/m3vQlR8y1IorJaPSBOYvcJqV2i9ho3lBgK8fpx+v2J87x08+g2v
	vYaoJYVAW1WP7aODXe9W23OXMfixWm1GAR0HSlT8prxaP4dErPWGsAXa8e4Sl9GSUACheGz8tGj
	MJYV6KfqyN5WziCConwKKmJOGKOAF7aoH00BvV4eCqc5XoF9r4WMRGDpx7xISXW+FmtgJgRzuuY
	s/YFZ0BHARBTw5pnO6LcqMllxYfBO8vnZf24sg83SgbmnmhPhq4JElRVo2TLuw0Kz58d5M0dYd4
	xQ4uubYft7zIYOQ8HKcndoi/xpxqo5RQQ572xSTTSrgV29AsJl2RWk/wt0yVgM0XHWVkYxJ474l
	NUZQypMq57ps2DJbQyJIIkTUZtr+IVK22gWQJhfJWghK0sfKt6kYD3B9ctBtwUkBbcJpIHsvIMH
	ggXUnSkFzHl979/vQzd5bexbCy1NRfvHG/76F4Dkw/9vvoQyM44TJTEy1XQe3hKIQkm68oVKfv
X-Received: by 2002:a17:90a:d410:b0:380:8bb9:aba9 with SMTP id 98e67ed59e1d1-3969ba3c165mr21493038a91.3.1787931345118;
        Fri, 28 Aug 2026 08:35:45 -0700 (PDT)
Received: from DESKTOP-TIT0J8O.dm.ae ([157.51.224.60])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286f9e2a95sm6256824eec.23.2026.08.28.08.35.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 08:35:44 -0700 (PDT)
From: Ahmed Naseef <naseefkm@gmail.com>
To: linux-gpio@vger.kernel.org
Cc: Ahmed Naseef <naseefkm@gmail.com>,
	Benjamin Larsson <benjamin.larsson@genexis.eu>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v2 2/3] dt-bindings: pinctrl: Add EcoNet EN7528 pin controller
Date: Fri, 28 Aug 2026 19:35:14 +0400
Message-Id: <c20005a81b4069f3ff68311629ff7d4678fa92dd.1787931313.git.naseefkm@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1787931313.git.naseefkm@gmail.com>
References: <cover.1787931313.git.naseefkm@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the binding for the pin controller found on the EcoNet EN7528 MIPS
SoC. It shares the IP with the Airoha pin controllers, but its IOMUX and
pin configuration registers have a different layout, so it gets its own
compatible.

The CHIP SCU holding those registers is referenced by the airoha,chip-scu
phandle.

Signed-off-by: Ahmed Naseef <naseefkm@gmail.com>
---
 .../pinctrl/econet,en7528-pinctrl.yaml        | 190 ++++++++++++++++++
 1 file changed, 190 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/econet,en7528-pinctrl.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/econet,en7528-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/econet,en7528-pinctrl.yaml
new file mode 100644
index 000000000000..3ce1a5309d09
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/econet,en7528-pinctrl.yaml
@@ -0,0 +1,190 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/econet,en7528-pinctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: EcoNet EN7528 Pin Controller
+
+maintainers:
+  - Lorenzo Bianconi <lorenzo@kernel.org>
+
+description:
+  The EcoNet EN7528 pin controller is used to control SoC pins. It shares the
+  IP with the Airoha pin controllers, but its IOMUX and pin configuration
+  registers have a different layout.
+
+properties:
+  compatible:
+    const: econet,en7528-pinctrl
+
+  airoha,chip-scu:
+    description: phandle to the chip SCU syscon
+    $ref: /schemas/types.yaml#/definitions/phandle
+
+  interrupts:
+    maxItems: 1
+
+  gpio-controller: true
+
+  '#gpio-cells':
+    const: 2
+
+  gpio-ranges:
+    maxItems: 1
+
+  interrupt-controller: true
+
+  '#interrupt-cells':
+    const: 2
+
+patternProperties:
+  '-pins$':
+    type: object
+
+    patternProperties:
+      '^mux(-|$)':
+        type: object
+
+        description:
+          pinmux configuration nodes.
+
+        $ref: /schemas/pinctrl/pinmux-node.yaml
+
+        properties:
+          function:
+            description:
+              A string containing the name of the function to mux to the group.
+            enum: [gpio, jtag, pcie_reset, pcm, pcm_spi, phy1_led0,
+                   phy1_led1, phy2_led0, phy2_led1, phy3_led0, phy3_led1,
+                   phy4_led0, phy4_led1, pnand, pon, pwm, sipo, spi, uart]
+
+          groups:
+            description:
+              An array of strings. Each string contains the name of a group.
+            items:
+              enum: [pon, sipo, sipo_rclk, uart2, uart2_cts_rts, uart3,
+                     ejtag, pcm1, pcm2, spi_quad, spi_cs1, pcm_spi,
+                     pcm_spi_int, pcm_spi_rst, pcm_spi_cs1, pcm_spi_cs2,
+                     pcm_spi_cs3, pcm_spi_cs4, pcm_spi_cs5, pcm_spi_cs6,
+                     pcm_spi_cs7, pnand, gpio0, gpio1, gpio2, gpio3, gpio4,
+                     gpio5, gpio6, gpio7, gpio8, gpio9, gpio10, gpio11,
+                     gpio12, gpio13, gpio14, gpio15, gpio16, gpio17,
+                     gpio18, gpio19, gpio20, gpio21, gpio22, gpio23,
+                     gpio24, gpio25, gpio26, gpio27, gpio28, gpio29,
+                     gpio30, gpio31, gpio32, gpio33, gpio34, gpio35,
+                     gpio36, gpio37, gpio38, gpio39, gpio40, gpio41,
+                     pcie_reset0, pcie_reset1]
+
+        required:
+          - function
+          - groups
+
+        additionalProperties: false
+
+      '^conf(-|$)':
+        type: object
+
+        description:
+          pinconf configuration nodes.
+
+        $ref: /schemas/pinctrl/pincfg-node.yaml
+
+        properties:
+          pins:
+            description:
+              An array of strings. Each string contains the name of a pin.
+            items:
+              enum: [gpio0, gpio1, gpio2, gpio3, gpio4, gpio5, gpio6,
+                     gpio7, gpio8, gpio9, gpio10, gpio11, gpio12, gpio13,
+                     gpio14, gpio15, gpio16, gpio17, gpio18, gpio19,
+                     gpio20, gpio21, gpio22, gpio23, gpio24, gpio25,
+                     gpio26, gpio27, gpio28, gpio29, gpio30, gpio31,
+                     gpio32, gpio33, gpio34, gpio35, gpio36, gpio37,
+                     gpio38, gpio39, pcie_reset0, pcie_reset1, i2c_sda,
+                     i2c_scl, uart_txd, uart_rxd, spi_cs0, spi_clk,
+                     spi_mosi, spi_miso]
+            minItems: 1
+            maxItems: 50
+
+          bias-disable: true
+
+          bias-pull-up: true
+
+          bias-pull-down: true
+
+          input-enable: true
+
+          output-enable: true
+
+          output-low: true
+
+          output-high: true
+
+          drive-strength:
+            description:
+              Selects the drive strength for the pin, in mA.
+            enum: [2, 4]
+
+        required:
+          - pins
+
+        additionalProperties: false
+
+    additionalProperties: false
+
+required:
+  - compatible
+  - airoha,chip-scu
+  - interrupts
+  - gpio-controller
+  - gpio-ranges
+  - "#gpio-cells"
+  - interrupt-controller
+  - "#interrupt-cells"
+
+allOf:
+  - $ref: pinctrl.yaml#
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/mips-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    pinctrl {
+      compatible = "econet,en7528-pinctrl";
+
+      airoha,chip-scu = <&chip_scu>;
+
+      interrupt-parent = <&gic>;
+      interrupts = <GIC_SHARED 10 IRQ_TYPE_LEVEL_HIGH>;
+
+      gpio-controller;
+      #gpio-cells = <2>;
+
+      interrupt-controller;
+      #interrupt-cells = <2>;
+
+      gpio-ranges = <&pinctrl 0 0 42>;
+
+      uart2-pins {
+        mux {
+          function = "uart";
+          groups = "uart2";
+        };
+
+        conf {
+          pins = "gpio28", "gpio29";
+          bias-pull-up;
+        };
+      };
+
+      pwm-pins {
+        mux {
+          function = "pwm";
+          groups = "gpio30";
+        };
+      };
+    };
-- 
2.34.1

