Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7287B39E196
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 20:09:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788466217; cv=none; b=C6lOYUQG/RArv2YZXt7YzKQ0UvfD7P2GeAkJtLqQY23POl90XTEW1uy3Jzp6bQwShaaMnLjR/9mntvYTmrhsQdSyZeKxPphJmIbrKGCPDDpOuw85n2wzTLB8z0Fh73u008o5Ov3V66LF8ee1DyxHJMBcDtbsB2xEec3vVKa/Yes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788466217; c=relaxed/simple;
	bh=mH14szGLvIYL5H6TXttKxaAR0CFbgwfmQQqN74KFZFM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OlNvJcVDwIw8WbzF7jwqEwhnk1Gq1TGtiAZo8qTSnvm/4LuHatHW5ouf+AaMpJHMhggremq+dVQzJidUff81QpETrI+PIWUQ3XsNrlqjwK3sECpv9ryx9sGcgp2DIyorJNkdEQreX72c19NOynGdj9lgeGTeSxuA9M0QMdsQDSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kDJGVIdY; arc=none smtp.client-ip=209.85.167.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kDJGVIdY"
Received: by mail-oi1-f180.google.com with SMTP id 5614622812f47-4b28df1f600so206148b6e.2
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 13:09:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788466195; x=1789070995; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I04cR33VXyehaIB9vYInZkrZkowazKWlWZnlj/UHpYc=;
        b=kDJGVIdYexyMwn0Ds+egzoFNWWR4OsdMDOZ67cj9EfKtf3rCmSn8fjJj5DmzBzc2Yr
         ndFkzEi9dch3M8Ui8q2rTnVE+CZYlCJuzIGIdrhzx6jj3lz3oWXqXNHLymGWdxlx8A3g
         QGS2VTFmUlzkP6iy8z4UjKwOay8B0JbJRcUGY66ioEhR08G89no+vMdSijqS7gByDfKD
         dlX+CtBzjpRSOHgCTPbvGU9HoYhdVGKhBowOcvI7crIO5fXe/6a6Icdihx902uXxjpQ3
         +JKuB1vbQaqWuhtGcnOZRMf5uWdVd3HZy+j+/3d5nrxxvWAcI2b80RvnK7qEw/dthrPd
         Ggpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788466195; x=1789070995;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=I04cR33VXyehaIB9vYInZkrZkowazKWlWZnlj/UHpYc=;
        b=Wvm3RJVhBM6D/x49qhpLm3paoFigxGo6FG7qKmoq0/BMT8zgXbF3zLLvnGQZzQp1BY
         OpdD8dMjvMqX0GvsJEznPnjrAE/FIKVadUON35aP12Mjoi2dWaiCapkjkpRDfovfDIVw
         +/hw3jWwGf5wx4lXDvxNKQpF2ecPaC/YEhvJ6fgTSM2D4i6WsQ3uCgEe3gK976mjvTpl
         dMO7sjTQ8VXitgVHao+h6DKXUhBW4++lkdv+oiHFpZmjHefi1D+IAHAcFSHX43Ljsubq
         DNYAGEUIhrvNYnGBZcQnKFdgBCrSf20XuOmFP+EPOyYo4SDrIWUZiIfvxWfptpv6HuFj
         GXEw==
X-Forwarded-Encrypted: i=1; AKwUvByKD1lk1heitE1b2mlyJkT+UOlT+Rcj0hF1D0MvrFs/TanHgR4Q/5OrAfjEceFg2qYlNot+xW2BPf518Os=@vger.kernel.org
X-Gm-Message-State: AFuF++n/TLYIQ9qLdOJUMtnOApsU3zmECaj7VJkOH/8lJIFt0eWNgVew
	gEmslKJwBwan3m6ZNknaq3m3QkwgBhRMpug0upthwwP+HkWpfjg9VH4B
X-Gm-Gg: AYBFou33E9gq4FFRwN6umoF/M1akXe1WJsxs6wAqozMsguqI+lr+EHA/AvPnVRGNGlB
	WlbvmXDfGx01rI2IctEzolGdKpESsuy1XHjpM65fv5j4ySlSpLTHRzRo7wZwSf5DOmWGIkQUPGA
	c2QXEciUZyzUUv/O7r6YdaB+D7Z0OMhVbHb0NpywTs3U+s63S224cf7AlpPaR6zLLMq56l5p9v1
	HrATO8dFrqU7T3xoDjGgqFiC5G72zcnwBXtYMDxI11yYW8lQNE/ATL0OTNOzx5vrH2x8sd+P318
	kjVR79uEk5OIxsY3HWWbDFU5zOdkagSNCvElUNHvAz5ZowyWFje2geY4dB/DYzILyIaWNnxhTEO
	xxNTLiSsRJ4NsTnjCcJChfNfiFLBT3czp16j4XsSNylJmzx8Smxg1QYq/rGlinSpbTKAGxGRsfK
	q5yvgtiT0tNQVWBEBqcM9uY01ZhbYKGT49VRdnwzUebLFsCv59E24O75zmB2SVPnmLlllVxJxOk
	mhphGR7UmvUK/orPI/20COM3PqmaSn9LABWa9LmBR7OMr/qhNpYxl+jAhFrXFpFYEDraSl5fZro
	LxouYCRqiRGdnYBURVlnvLuZM9b5YEr/fPzAHkTN3//I8+LxB+guDtJzxkqwBcKQ9TGP0xOvgWv
	zp8Q4UIyIF9rnAUcaqjllwDhzYrswNQ==
X-Received: by 2002:a05:6808:3098:b0:4b3:74fe:2f77 with SMTP id 5614622812f47-4b961a7cde9mr979497b6e.11.1788466195567;
        Thu, 03 Sep 2026 13:09:55 -0700 (PDT)
Received: from [127.0.1.1] (184-96-151-165.hlrn.qwest.net. [184.96.151.165])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4b971246d9csm252885b6e.7.2026.09.03.13.09.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 13:09:55 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 03 Sep 2026 14:09:42 -0600
Subject: [PATCH v9 3/4] dt-bindings: mfd: x-powers: Describe AC200
 functions
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260903-submit-ac200-mfd-v9-3-6b7ed278989c@gmail.com>
References: <20260903-submit-ac200-mfd-v9-0-6b7ed278989c@gmail.com>
In-Reply-To: <20260903-submit-ac200-mfd-v9-0-6b7ed278989c@gmail.com>
To: Lee Jones <lee@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 James Hilliard <james.hilliard1@gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>, 
 "Jagielski, Jedrzej" <jedrzej.jagielski@intel.com>, 
 Andre Przywara <andre.przywara@arm.com>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, linux-sunxi@lists.linux.dev, 
 mfd@lists.linux.dev, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2

From: Jernej Skrabec <jernej.skrabec@gmail.com>

Describe the AC200 audio codec and TV encoder as child nodes of the
shared I2C register provider. Keep their analog supplies on the function
consumers and describe the TV encoder display graph and optional bandgap
calibration cell.

Add the shared interrupt-controller properties and interrupt numbers needed
by the TV encoder. The Ethernet PHY remains represented on its primary MDIO
bus and is therefore not an MFD child.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 .../devicetree/bindings/mfd/x-powers,ac200.yaml    | 136 +++++++++++++++++++++
 MAINTAINERS                                        |   1 +
 include/dt-bindings/mfd/x-powers,ac200.h           |  13 ++
 3 files changed, 150 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/x-powers,ac200.yaml b/Documentation/devicetree/bindings/mfd/x-powers,ac200.yaml
index ca7a910b2c73..935dc07138cb 100644
--- a/Documentation/devicetree/bindings/mfd/x-powers,ac200.yaml
+++ b/Documentation/devicetree/bindings/mfd/x-powers,ac200.yaml
@@ -28,15 +28,114 @@ properties:
       be 24 or 27 MHz, matching the rates encoded by the documented EPHY clock
       selector.
 
+  interrupts:
+    maxItems: 1
+    description:
+      The shared open-drain INTB output for the TV encoder, Ethernet PHY and
+      RTC interrupts.
+
+  interrupt-controller: true
+
+  '#interrupt-cells':
+    const: 1
+    description:
+      The interrupt number, as defined in
+      include/dt-bindings/mfd/x-powers,ac200.h.
+
+  codec:
+    type: object
+    $ref: /schemas/sound/dai-common.yaml#
+    unevaluatedProperties: false
+
+    properties:
+      compatible:
+        const: x-powers,ac200-codec
+
+      '#sound-dai-cells':
+        const: 0
+
+      ac-ldoin-supply:
+        description: The 3.3 V supply for the audio codec LDO input.
+
+    required:
+      - compatible
+      - '#sound-dai-cells'
+      - ac-ldoin-supply
+
+  tv-encoder:
+    type: object
+    additionalProperties: false
+
+    properties:
+      compatible:
+        const: x-powers,ac200-tve
+
+      interrupts:
+        maxItems: 1
+        description: Cable detection interrupt.
+
+      tv-vcc-supply:
+        description: The 3.3 V supply for the composite-video DAC.
+
+      nvmem-cells:
+        maxItems: 1
+
+      nvmem-cell-names:
+        items:
+          - const: bandgap
+
+      ports:
+        $ref: /schemas/graph.yaml#/properties/ports
+
+        properties:
+          port@0:
+            $ref: /schemas/graph.yaml#/properties/port
+            description: Input from the display pipeline, carrying CCIR656.
+
+          port@1:
+            $ref: /schemas/graph.yaml#/properties/port
+            description: Output to the composite-video connector.
+
+        required:
+          - port@0
+          - port@1
+
+    required:
+      - compatible
+      - interrupts
+      - tv-vcc-supply
+      - ports
+
+    dependencies:
+      nvmem-cells: [ nvmem-cell-names ]
+      nvmem-cell-names: [ nvmem-cells ]
+
 required:
   - compatible
   - reg
   - clocks
 
+allOf:
+  - if:
+      required:
+        - tv-encoder
+    then:
+      required:
+        - interrupts
+        - interrupt-controller
+        - '#interrupt-cells'
+
+dependencies:
+  interrupt-controller: [ '#interrupt-cells', interrupts ]
+  '#interrupt-cells': [ interrupt-controller ]
+
 additionalProperties: false
 
 examples:
   - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/mfd/x-powers,ac200.h>
+
     i2c {
         #address-cells = <1>;
         #size-cells = <0>;
@@ -45,6 +144,43 @@ examples:
             compatible = "x-powers,ac200";
             reg = <0x10>;
             clocks = <&pwm 5>;
+            interrupt-parent = <&pio>;
+            interrupts = <1 20 IRQ_TYPE_LEVEL_LOW>;
+            interrupt-controller;
+            #interrupt-cells = <1>;
+
+            codec {
+                compatible = "x-powers,ac200-codec";
+                #sound-dai-cells = <0>;
+                ac-ldoin-supply = <&reg_aldo2>;
+            };
+
+            tv-encoder {
+                compatible = "x-powers,ac200-tve";
+                interrupts = <AC200_IRQ_TVE>;
+                tv-vcc-supply = <&reg_aldo2>;
+
+                ports {
+                    #address-cells = <1>;
+                    #size-cells = <0>;
+
+                    port@0 {
+                        reg = <0>;
+
+                        tve_in: endpoint {
+                            remote-endpoint = <&tcon_out_tve>;
+                        };
+                    };
+
+                    port@1 {
+                        reg = <1>;
+
+                        tve_out: endpoint {
+                            remote-endpoint = <&composite_in>;
+                        };
+                    };
+                };
+            };
         };
     };
 ...
diff --git a/MAINTAINERS b/MAINTAINERS
index 1d03b0060bda..8a48f6a1e593 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -29511,6 +29511,7 @@ L:	linux-sunxi@lists.linux.dev
 S:	Maintained
 F:	Documentation/devicetree/bindings/mfd/x-powers,ac200.yaml
 F:	drivers/mfd/ac200.c
+F:	include/dt-bindings/mfd/x-powers,ac200.h
 
 X-POWERS AXP288 PMIC DRIVERS
 M:	Hans de Goede <hansg@kernel.org>
diff --git a/include/dt-bindings/mfd/x-powers,ac200.h b/include/dt-bindings/mfd/x-powers,ac200.h
new file mode 100644
index 000000000000..cc59e2ab4912
--- /dev/null
+++ b/include/dt-bindings/mfd/x-powers,ac200.h
@@ -0,0 +1,13 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Interrupt numbers of the X-Powers AC200 interrupt controller.
+ */
+
+#ifndef _DT_BINDINGS_MFD_X_POWERS_AC200_H
+#define _DT_BINDINGS_MFD_X_POWERS_AC200_H
+
+#define AC200_IRQ_TVE			0
+#define AC200_IRQ_EPHY			1
+#define AC200_IRQ_RTC			2
+
+#endif /* _DT_BINDINGS_MFD_X_POWERS_AC200_H */

-- 
2.53.0

