Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D8DA2DFA4A
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 00:26:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789000017; cv=none; b=LILmcoEpDOLO61Cn5QmQoU0V4SZaTW2dC8ykKtMHxo/xo3UkzPcUBxNMO8GAINz+NeWjr0zfJhBLhMB1pDFaHALjqwRSPZDxt/b5KjL1KoseOJUnWNnMgYVqtjjP5ZWIDtrHcCAHaXIDwA93u7Tt3vhHSAORtWWOVyEK1I5+MAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789000017; c=relaxed/simple;
	bh=LUDT1kHiXHBCnePbIaYBUJQHAxuAaQl4Sg3kYNxuzRM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MUy/gE6lIy66lnRQKIuoe0pXcDn4PklJQd7U6Fh/bsm9wAczvh8R12DvlznUpTC/hPy+nKOi405hA6+X34id7KOgvwzDx3z19TZO4bP8iRS47FFzv3EOjRcAUPHrbmekzYZztoEx1x/2++8n8m/7jOzBcJxUszYPd2gfL0b6dDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YPub2A6S; arc=none smtp.client-ip=209.85.210.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YPub2A6S"
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-7f4e729368fso5834785a34.0
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 17:26:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789000014; x=1789604814; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eTa0efMcyPx+a3sRs/5/R1BWxQ19AFGAD7UOiV7rwak=;
        b=YPub2A6S/UP3hFAXhnVcdhWvveAR+mT6APt4gGg0VtItSMNF8Q6blGLnReXI4078iF
         YIrRumPrF2tcdHdlKm+EaynuG5oaQ9Qg3BAxGDr7cvtiBBxhan8gg5j6W9+tzjgSEFmn
         aeW2FOYS35GfeVUJASdeJpWNnUwX2x7TGC4XnztkMvmuAYQnCP+5P3me0ficBNZDehI0
         ndnMwqdW4GbqvVdOiRJOGJXp4z8eAE39kUw+Zipgt8F74vmfu9m5vvbRl0HJqC7ypFu7
         hjizTmIEZdRr/QZ796fhZigKr3bxKxo0xwmSjlRqPq9kiUA4sfSsz/G3UavNmuf9iO+k
         Y5iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789000014; x=1789604814;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eTa0efMcyPx+a3sRs/5/R1BWxQ19AFGAD7UOiV7rwak=;
        b=lnQHeli1ffgogd+wQPzfMRRksbiN9EhQ3oA91sggWk2eWUSqdTdBZqtNA95FiJMsQI
         8XpMOrlv/bEofrvxy/qL/68hQN9TljxbnE3Q7m9apIHzwJ4FyrI9JUf76YJR6ewdJM6O
         bHv/+NNQyQpOjXURiSuaXJgTeG5FzLHoztsgqL85IaNrp+fa2OZ09o1wYR9Iy2AbvwFY
         +rIv2GfsHUlxt2NeDRv8Uc20XmvAguqALE5aWCO1h1tCc8++O0fZTI+S/Ud0PYupMDCw
         7DTEPosshGzyzNo4nFUEw2VnGnb/4PmOCGjQ6cOGKZnosXTwz7gMum37i/8qR5OGZtIK
         AC/g==
X-Forwarded-Encrypted: i=1; AKwUvBwjOtBWYTjhflgyVErdCFoxQpmCScokTV8/s1KJhjfA7EG3Jfv//dh6cVK1FQ/Hu6uwmgu26XdjXzmBRhw=@vger.kernel.org
X-Gm-Message-State: AFuF++kthoH0uWS5R6MHFLfN/IrXQBWhPBUjokF+flCEEuOGd/B/bfXb
	cdxr2MM2mTMCaCvRgnQ9gJdift+ZSFkXbFcHdzdbsyF01Z4HdpREj9aF
X-Gm-Gg: AYBFou0B59Mm9Gvv3sIKywiB2yMRyG8g6nft+MiikynilSK5tJdaT8HvEjOQBTDF0Gf
	5ZecrlFT/qTwvXgNluGofXcpx4oOEoBxe9JC0w8ju2mz/l/zgpLeMnyrvTRKEEpNCyjIL4l/nmD
	NdAAQPOkzbHmLmxpH4AUFs/Gn41lJCE7hu7KlESPiprCymYbbQrDidBwxulCbLh8dMbnwow3zJH
	qWQk559706OFjGr22pqZ5WBpQVimVvTLfpp3g8F2qpnzwVeYff3NOUKvXI1SZTdUPDB/E5H25F/
	zeSI/SzwfX2VE9l+GWZ2zgf/1D2sPLzYkRtN6IeUp2G8KH4bE+Kkh0Dr6fWz8ZpmWpen2ZzSQiJ
	W0oWaqSuMkHVNpVMKf44V3EpPntwBue3TOwj+HLk4fXqbn+WaftNgztKMAnXvAcG0VNchsbMIP+
	t6JRBROozNrXHVitxUItYAyc3nCgY1YGARZit7LDPtzfcv7QAm8BR3BElUmpaT12JB12p+e2MDB
	8fNqSjhTuA35lOJdpIoJWEe6Fgs2BjkMSwTPSXFBD2KdUwXVI9Xzbb0SkeZ9hCw1L+xLNC7zUvA
	HsAHE9cj8fixLbH5z635NURXer54KXiamMyJPghu99sBRm+HFAPMi/ULDZkCkRtC9UlKI3f0rj1
	l2dRRBQW0Q/R+dCLtiw5c1QlyYgHHP4NgbWDuQ7Bj
X-Received: by 2002:a05:6830:3509:b0:7dc:c749:ade3 with SMTP id 46e09a7af769-7fa1deab695mr24907263a34.3.1789000014269;
        Wed, 09 Sep 2026 17:26:54 -0700 (PDT)
Received: from [127.0.1.1] (184-96-151-165.hlrn.qwest.net. [184.96.151.165])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7fe2fbf5db8sm10182789a34.25.2026.09.09.17.26.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 17:26:53 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 09 Sep 2026 18:26:50 -0600
Subject: [PATCH v12 1/2] dt-bindings: mfd: x-powers: Add AC200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260909-submit-ac200-mfd-v12-1-a44d6bc30a4f@gmail.com>
References: <20260909-submit-ac200-mfd-v12-0-a44d6bc30a4f@gmail.com>
In-Reply-To: <20260909-submit-ac200-mfd-v12-0-a44d6bc30a4f@gmail.com>
To: Jernej Skrabec <jernej.skrabec@gmail.com>, 
 James Hilliard <james.hilliard1@gmail.com>, Lee Jones <lee@kernel.org>, 
 Arnd Bergmann <arnd@arndb.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Andrew Lunn <andrew@lunn.ch>, 
 "Jagielski, Jedrzej" <jedrzej.jagielski@intel.com>, 
 Andre Przywara <andre.przywara@arm.com>, Chen-Yu Tsai <wens@kernel.org>, 
 linux-sunxi@lists.linux.dev, mfd@lists.linux.dev, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.15.2

The AC200 is an I2C-controlled mixed-signal companion IC containing
audio, video, RTC and Fast Ethernet PHY functions.

Describe the shared input clock, audio DAI, TV encoder display graph and
optional bandgap calibration in one parent node. The codec and TV encoder
do not need separate firmware nodes.

AC_LDOIN and TV_VCC are distinct 3.3 V supply inputs. Describe them
separately without requiring different external regulators. Require the
audio supply when the DAI is described and the video supply when the
display graph is present, while allowing PHY-only configurations.

Describe the optional shared INTB connection without an internal
interrupt domain. Cable detection status remains readable over I2C when
INTB is not connected. Include wired and unwired examples.

The Ethernet PHY is represented by a PHY package on its MDIO bus, with a
phandle back to this device for access to the package control registers.
It therefore does not require an MFD child node. The input clock must run
at 24 or 27 MHz when the Ethernet PHY is used, matching the rates encoded
by its documented clock selector.

Co-developed-by: Jernej Skrabec <jernej.skrabec@gmail.com>
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../devicetree/bindings/mfd/x-powers,ac200.yaml    | 168 +++++++++++++++++++++
 MAINTAINERS                                        |   7 +
 2 files changed, 175 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/x-powers,ac200.yaml b/Documentation/devicetree/bindings/mfd/x-powers,ac200.yaml
new file mode 100644
index 000000000000..75dafa7c1071
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/x-powers,ac200.yaml
@@ -0,0 +1,168 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mfd/x-powers,ac200.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: X-Powers AC200 mixed-signal IC
+
+maintainers:
+  - James Hilliard <james.hilliard1@gmail.com>
+  - Jernej Skrabec <jernej.skrabec@gmail.com>
+
+description:
+  The AC200 is a mixed-signal companion IC containing audio, video, RTC and
+  Fast Ethernet PHY functions. Its control registers are accessed over I2C.
+  The audio codec and TV encoder are described by properties of this node.
+  The Ethernet PHY is described separately on its MDIO bus.
+
+allOf:
+  - $ref: /schemas/sound/dai-common.yaml#
+
+properties:
+  compatible:
+    const: x-powers,ac200
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+    description:
+      AC200 input clock. When using the Ethernet PHY, its configured rate must
+      be 24 or 27 MHz, matching the rates encoded by the documented EPHY clock
+      selector.
+
+  interrupts:
+    maxItems: 1
+    description:
+      The shared, level-triggered, open-drain INTB output for the TV encoder,
+      Ethernet PHY and RTC interrupts. Omit when INTB is not connected. TV
+      encoder cable detection status can also be read over I2C without an
+      interrupt.
+
+  '#sound-dai-cells':
+    const: 0
+
+  ac-ldoin-supply:
+    description:
+      The 3.3 V supply connected to the AC_LDOIN pin for the audio codec LDO
+      input. This may be the same regulator as tv-vcc-supply.
+
+  tv-vcc-supply:
+    description:
+      The 3.3 V supply connected to the TV_VCC pin for the composite-video
+      DAC. This may be the same regulator as ac-ldoin-supply.
+
+  nvmem-cells:
+    maxItems: 1
+    description: TV encoder bandgap calibration.
+
+  nvmem-cell-names:
+    items:
+      - const: bandgap
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: Input to the TV encoder, carrying CCIR656.
+
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: Output to the composite-video connector.
+
+    required:
+      - port@0
+      - port@1
+
+required:
+  - compatible
+  - reg
+  - clocks
+
+dependencies:
+  '#sound-dai-cells': [ ac-ldoin-supply ]
+  ports: [ tv-vcc-supply ]
+  nvmem-cells: [ nvmem-cell-names ]
+  nvmem-cell-names: [ nvmem-cells ]
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        mixed-signal@10 {
+            compatible = "x-powers,ac200";
+            reg = <0x10>;
+            clocks = <&pwm 5>;
+            interrupt-parent = <&pio>;
+            interrupts = <1 20 IRQ_TYPE_LEVEL_LOW>;
+            #sound-dai-cells = <0>;
+            ac-ldoin-supply = <&reg_aldo2>;
+            tv-vcc-supply = <&reg_aldo2>;
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                port@0 {
+                    reg = <0>;
+
+                    tve_in: endpoint {
+                        remote-endpoint = <&tcon_out_tve>;
+                    };
+                };
+
+                port@1 {
+                    reg = <1>;
+
+                    tve_out: endpoint {
+                        remote-endpoint = <&composite_in>;
+                    };
+                };
+            };
+        };
+    };
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        mixed-signal@10 {
+            compatible = "x-powers,ac200";
+            reg = <0x10>;
+            clocks = <&pwm 5>;
+            /* INTB is not connected. */
+            tv-vcc-supply = <&reg_aldo2>;
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                port@0 {
+                    reg = <0>;
+
+                    endpoint {
+                        remote-endpoint = <&tcon_out_tve>;
+                    };
+                };
+
+                port@1 {
+                    reg = <1>;
+
+                    endpoint {
+                        remote-endpoint = <&composite_in>;
+                    };
+                };
+            };
+        };
+    };
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index 3a19da74d00c..419340093c9b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -29504,6 +29504,13 @@ F:	drivers/net/wwan/
 F:	include/linux/wwan.h
 F:	include/uapi/linux/wwan.h
 
+X-POWERS AC200 DRIVERS
+M:	Jernej Skrabec <jernej.skrabec@gmail.com>
+M:	James Hilliard <james.hilliard1@gmail.com>
+L:	linux-sunxi@lists.linux.dev
+S:	Maintained
+F:	Documentation/devicetree/bindings/mfd/x-powers,ac200.yaml
+
 X-POWERS AXP288 PMIC DRIVERS
 M:	Hans de Goede <hansg@kernel.org>
 S:	Maintained

-- 
2.53.0

