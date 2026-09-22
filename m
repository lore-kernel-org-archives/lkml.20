Received: from mail-oo2-f41.google.com (mail-oo2-f41.google.com [74.125.231.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9866B5678EA
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 16:34:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790094889; cv=none; b=q+yX09aSMMQpwSdMpJxt2SoKFeiX9myFc+UtvwdamLSs8oLBY9XGymZJxXAjne1ul3iAugoaPPVzxiPcrbF0bwECMTzG8ROQKF4boN/yb29QSdmajKaxF559KzCGE2PO0Chpc2ZlgaSiOuPbK2EOgMrGWO+6MXRd0j8Pxwj+VFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790094889; c=relaxed/simple;
	bh=LUDT1kHiXHBCnePbIaYBUJQHAxuAaQl4Sg3kYNxuzRM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DErOOUG036B2lRkUQJKz0ujRvnGea0TZvwTxdzmYQX2l8rcNmhH4nGm0Fr9CaEsksnljYX00MDneX2JS5raGcVG4WfZOU2O/uJbEGmJZUxljONPKLjURCsk4QjzrmM6vWuUSq4Wy2DSwmEDg/myfvIi8Gss+klT3asQcqv0MQ1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L3VDAaPw; arc=none smtp.client-ip=74.125.231.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L3VDAaPw"
Received: by mail-oo2-f41.google.com with SMTP id 006d021491bc7-6b1ae6b1b26so11278eaf.2
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 09:34:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790094885; x=1790699685; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eTa0efMcyPx+a3sRs/5/R1BWxQ19AFGAD7UOiV7rwak=;
        b=L3VDAaPwigTL0Yqzv2WXjuLyTxsVHgB/GB2iaqNiyYWP3dOBMlIjQ0hibDALLLqv6U
         rzKykCmBm5OXf8+AoZ+FHXIfc4m2EKaVrI6HU+NscIEwH0x6F4Yw/IHYDqNr60sweLYX
         ZiEW8vKzi1KGbtRmM1KdAnI6VsU1Pzo5UiKgL0PK2VbQ7aNSIjVZ/k7fIDaDPv4tceP6
         eejJylM6Sj1AyadIbLXfHnThwbXxMuPx24M4hkyATgI7WxKKCNQmxNZxIZRoParuefS2
         YQwcF0YikmEK8BirtyuzA0hmWYy0oQ8K8uNMQXC60+jvyuKxHW4wMMhhxo9bJcXcgYlY
         c9tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790094885; x=1790699685;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eTa0efMcyPx+a3sRs/5/R1BWxQ19AFGAD7UOiV7rwak=;
        b=Xvga6poxShO6PWxnVPZ3QR8YAq1NjvI+xRK4gCk/34Odb8hkyexHC0TNY21etPUOA2
         4aySo/z3J/zmyef4ZGmUotXjB16tJM1txMQ1w4lIoPhWlda5eWD754KgrpciUAbVb67t
         7iTpzxivL+tJqRpaVyiHABy78S7lu/qjgszD7aFoHyfYHKYnb1ikZOA9sHFALVILbGYl
         A8rELP+/qzen/5WjvX6wmQhnA3Mbk0nMv0LrYwsP8Nv0tY5CvdscLhWivRwYcxPYzSSM
         6KFTYKy/Hdj7LLVfi9LiU84PQe7L/UgMWbx2FQA7drbWhXGCPhEqaf50Z5l32HY1b+sZ
         jxkg==
X-Forwarded-Encrypted: i=1; AKwUvBzNt5q1zksZlNjAxynE4cchY9taATpMiac0sapJ1jc0tUpSnF8UQPTPDxb0BeuZHn8hN3TT45kcueDuMiY=@vger.kernel.org
X-Gm-Message-State: AFuF++kfsi2TTjyr3au5NiYt5W0OKeHR1VgwJodHd2cXpx+ocoSoQrsT
	Te/teDLConGbK2Z1ItrHYdo35Jie+LvRRVpbzEo433PY+2R6R/KuPJmA
X-Gm-Gg: AYBFou01cEVbAi854D4J8wBdoV6l17dZgSvKxOwTDlwXsegW7N9yMtWuRvbwnSzUlwm
	BtWHC3frfnCu70j7eQ5BIJQKtp1dFXcaGi5AEaK/TG+2mse7S8APLRxch6BZn+QHy+mXasWiiie
	uIyL4yhwjIlCX+cZT9PHDt9IdS5cpoDUMHHXNachsUInSGiITMc2fNCKQ7q2L4H8Qo63ayasGus
	okZAXdiUwZJrr296dhx3rG87VoyFeRcr5zXOnG4B+unGVfvtDxaOHoTWkOkXPd+X+EglPtUmkOH
	yaONliaS+G4sX6G7bmwTg6/OXCzlaLMnO8NTnRjdQrcLTpzQgieOT2kNymTmXPqP6SlZCj1wLlo
	6W/hO/QXr2BdEz07BWgtbJmpVrmdXpbsiTwGPxbiqyaXmb/b76aA8pNnCFonKC5q8dNnYRgA6oQ
	zHgAHfOqt4zzdc4OGWBiMNfpW/5gT8j8TORyG0e91nvC9+FgioHFthwj/WxXpKlvmPQmMb4o2Eh
	fFXaCS3X7rrxKRZd0qaXjYTVOkvzW2KrE8C/nefDof/gKmcqDWOFvAsu7zo4dvmJZVuLvLq0WkW
	2I14chojAzZGJOlqr0MZWmgYuFia65o/X85LP4K9TrWCJCpskNff8DD7pW/rA5/aSFxgecgO+ru
	P3i7TRP7JGbi0muPHIi+JCQ==
X-Received: by 2002:a05:6820:4c15:b0:6c3:68bb:ec42 with SMTP id 006d021491bc7-6ca9be4ff88mr13199753eaf.35.1790094884804;
        Tue, 22 Sep 2026 09:34:44 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-814e0a13a73sm2679320a34.0.2026.09.22.09.34.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 09:34:44 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 22 Sep 2026 10:34:34 -0600
Subject: [PATCH v13 1/2] dt-bindings: mfd: x-powers: Add AC200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260922-submit-ac200-mfd-v13-1-8832afd2481c@gmail.com>
References: <20260922-submit-ac200-mfd-v13-0-8832afd2481c@gmail.com>
In-Reply-To: <20260922-submit-ac200-mfd-v13-0-8832afd2481c@gmail.com>
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

