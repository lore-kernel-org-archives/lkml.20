Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94CF241D635
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 21:03:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788815002; cv=none; b=cgMK+jRh4NU2odHyVrcwVRr/oluDcio/o646NTq8wLgiyonZYDvGMLuTbNb45gCh0u666zcRQN2YoYTb6ravXj3Ut/ZeUiVwShpJRkjJh5KLsps5xiw/jayzg7fO1aIwqX/jFTPgVdVtDoK22fS1fzq0DtozXqybwWErtbGzxZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788815002; c=relaxed/simple;
	bh=jMRpsd3j+pt+9tXwCteT1HE5rW6E2A4LzSPmsehBg5c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ovnem7geQHBgSiLTB+Uflta5ui3MLQoV6jcT2mcCQwvIePkIP5S8APWLCMbCk52MT915AzTkTXBEjZc6bOZzIrslc/R/B30mkrg1SDiBn6AjHmjlv99TMhzeJA244DD881/qC0VRPn+8es2air6ZDWbGrwpylcXZI5d69ED/aog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WArIvOOx; arc=none smtp.client-ip=209.85.210.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WArIvOOx"
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-7f5934ba2a5so1810086a34.3
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 14:03:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788814999; x=1789419799; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4jpCCjkwLxTbuRp/jE8q+8hPAWv2DtTwJ2ey0v93TXY=;
        b=WArIvOOx4dcL1/wxb2M+56uJzR+dOhouwi47ZIFl7ohGYQ/45Pbjc+fZ83BMNiltyq
         A3ugPdgeeJBwQ57TjomxD7y3EDr3EdpfOU45xhPEXYt98nvGyypP9aRe4yPqkJIoIZ6W
         YpAi2Z08Kuw1HLjx7u/5Bz97g7yu5ksfEHNJcvvtvhBwRzdjTfgm+j2IszVZvzJFpilQ
         AgzRXmyPeaanEvXTFCYcR6CvPlTiipzcab9YXXnAC+HshEXsl1EoI/4HymdA+BSkmpLP
         gCx5kbUJ/JAnCU0TanUy7Av002WmTQxyueIcw9SS9OX+qWc5BwRxuD0uD74FojHTz4WG
         qMPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788814999; x=1789419799;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4jpCCjkwLxTbuRp/jE8q+8hPAWv2DtTwJ2ey0v93TXY=;
        b=Le93aEng4fJzL2pSo97Io3N0uE3rWUYbzFxtIeuCPs0br+DA0d0W66op+IqWJqgArJ
         eITinQJh1qu88r+e8HJ6aWTmyAAyFzFNuaP9zXZtB7u2VTm1vN3OP9QIxnKQ2M7NRh3c
         61nQDecsq4KMhTx+VjKxZHbMWVC3KFn0YYX/NRIu28gpuoLkzUGeMvxSoL6utcIkrcSz
         gE6V74BlSYDg9tOBdQUbb52ILMfUsadK2O1G73noHcXWYJgNoPel0/E6+H9BBP0TaAOd
         khbfmNdm96g+fQ9TYHqs2RN/0Xmk+Q7P22cIH62fDYVVbYGQNbJQrFsyV15QUGyvW1Zd
         C4/A==
X-Forwarded-Encrypted: i=1; AKwUvByJy5OBvRpoG6DTAvSDQPUlG715EtrhFKSEfoAekTWWZct/Hocvk8q4S2Nz7Da+TAxSqo/BZs0ezab0+ok=@vger.kernel.org
X-Gm-Message-State: AFuF++mplRCJZ1cpI+vPMGV4lRZnwevNrkOexWsuqhABXcvFzFBA1XGC
	9mQrxJGq+r3FczoadEjl551SRpFkxu/W2WDT3QD6ASg4BBo6q5iNyv6+
X-Gm-Gg: AYBFou2etkB/yt50FR8V0LjaCsqI8Qap7poASJ/3zTTyINoQMQ9TSQq/VIWa6nxUU5S
	Mr2j0hx0apF5+UdGIC+SD4lNU+oDa2b7N1wsVXXDoFtJbaebqS0ijM4mkNWLN1l7dpBLjW5/JHm
	u2/nWvCFLngSdsMzOFsubnyOtF2ZAqtkGzKobd4aeI3sgfZVQwSuj8IofCOZPIsawCuQvag1alu
	NvcldmH2egCfgyS47+jaUiJjWShOMt6lKMvGn2kxY/2U3Ett3hUx+h7PXc7w1YO4UqsSU7lC+93
	4uX3kopt4BgbG/RhZ+bolOeowf3hAh/w9kLQ9lEoKXKPUVgrssL5jIKfSH5zguemfCtd69v4rTe
	NZB33oOFuKO45qjDeuYqh+hXWy0lssQ0X9o5heoVxXyMLD4hECynxQwVJ8AHe4IdBZq8AncFXcq
	lHdtid7ng9ruI6lb3ZQZJd0ILWt+ctzTIoXbEwwCnmJ+qvwjD8jZmpiA5OtEaCwaKbfzhl/ZDS4
	HS6D87fx3bK3M9J/fDNbyTpIzBql/WWnN8ci7URzeT6D0Oq9XJXqnciX8Lv6Lv2QSnCGLGcHd82
	XAiVZYMvbiWB+mYdjqCQTJKRUofvLfUWcNckMWrr1OZYoXSr6GSTrqUislH01lI/0p75fhd43IL
	R7dJpcHGk33MJwwUGCI0=
X-Received: by 2002:a05:6830:7302:b0:7e6:50dc:6512 with SMTP id 46e09a7af769-7fa1e5cbc6bmr15664093a34.6.1788814999238;
        Mon, 07 Sep 2026 14:03:19 -0700 (PDT)
Received: from [127.0.1.1] (184-96-151-165.hlrn.qwest.net. [184.96.151.165])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7fc68d5ae2bsm6640077a34.3.2026.09.07.14.03.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 14:03:18 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 07 Sep 2026 15:03:14 -0600
Subject: [PATCH v11 1/2] dt-bindings: mfd: x-powers: Add AC200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260907-submit-ac200-mfd-v11-1-58dd9dc7f69a@gmail.com>
References: <20260907-submit-ac200-mfd-v11-0-58dd9dc7f69a@gmail.com>
In-Reply-To: <20260907-submit-ac200-mfd-v11-0-58dd9dc7f69a@gmail.com>
To: Jernej Skrabec <jernej.skrabec@gmail.com>, 
 James Hilliard <james.hilliard1@gmail.com>, Lee Jones <lee@kernel.org>, 
 Arnd Bergmann <arnd@arndb.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Andrew Lunn <andrew@lunn.ch>, 
 "Jagielski, Jedrzej" <jedrzej.jagielski@intel.com>, 
 Andre Przywara <andre.przywara@arm.com>, Chen-Yu Tsai <wens@kernel.org>, 
 linux-sunxi@lists.linux.dev, mfd@lists.linux.dev, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
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

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
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

