Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793960019;
	b=CpDIUxVRlE+P7YqcKDUAXfH6286jl9XDy9S+Hj76yLtlu+KZ+dxLUKJc3BEO+lx1nZ7B
	 pnTWfXKmb0ubsOUag4KR7jdWCAc/NrG8PxVz1cP3U5KfJyiZfV1uh7ZznCM89wVaqz2a1
	 CbP6Yj3cPsP855vE5pKNVfw2cXdbAOMyKL5fW1OZnOl8G2PFX9pMD8Z+t+EoT64luvSvS
	 PAtKAqWuQhfz3S9olf1ZJWFKmmpHrtPHCCalwZalYCYetbp1r4bqJl4Xev0dQtV797Iz0
	 1J5P+HXw8NZXBO37C14X/xbfvIrxx9vp9gnrxANKXC6RcHm/mnHJxhxdqcJCgTXi0sw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793960019;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Last-TLS-Session-Version;
	bh=rX0XLb4rNBe6MC2T6ZKpG0ovSwZvZlIxj0EJQ4gRtjw=;
	b=ijDErNcYWowoM8i2z5Nci1VOznGt0GyE+YZRdpzjtdyJgkD7GEShygvi6tPJ99lDTZ7W
	 +Yrehz88VNsN6ebp9d2fznoJ59Wm9AQC+OqcKDVaB0ZZUtG7BCzGD5d+uSuZg3hsIr/RT
	 M6Vl4NYSCgIGOGQ7gpgEOmiwNLYjCguWpnaVUq+Nr6MguKUvNrBXVYZ9b/naZlpBFIDNE
	 I1OvpPXhN2POoWcrvHoX24AZU7GPst0ZdNVSLxIEorksZ+9Tqluep8dI1FbUoNb8cu7pa
	 4UdwVzzYlEL7CuQjqBog//M0r4YNDHyD7P3guhdg2DbOdsVPcEHOuwDfoa3zhU8LksQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=BiIDXwNV;
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83698606D806
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 10:13:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 83698606D806
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=BiIDXwNV
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 0DAB61A135D;
	Fri,  6 Nov 2026 10:13:37 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C88195FFBC;
	Fri,  6 Nov 2026 10:13:36 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 209E4103292CA;
	Fri,  6 Nov 2026 11:13:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793960015; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=rX0XLb4rNBe6MC2T6ZKpG0ovSwZvZlIxj0EJQ4gRtjw=;
	b=BiIDXwNV2roS8rdAO4nHuPF8flMYVgTqleLnG7JHyE17SmeDGT5LEy8rD9nEAzBIA84Vbg
	OYlK9M066a6Cj3B7XHWRUNk2LvCkPkcDGajPYzht13QTAoIPzU40h8C//zHO3CJaGJ8XVj
	Ft/cm+GC4T529Cc9pDXWjQq8av2I++YvTIpIVJyZ98QBc3GXfXaGuHqyeQ7N46nDovIHcw
	k98JEYMnB1tX3OJX6+fYqmJ1O/dfLZJ3ZbLxPm7veJmemBAZkjQLy49Ye0ww06gLfk/yRz
	2W5y3vyafPRCy340WuIOWSthEDn2VXfwmt+mEEFA0MlnbqI8mbaA+4P465azrA==
From: Paul Louvel <paul.louvel@bootlin.com>
Date: Fri, 06 Nov 2026 11:12:20 +0100
Subject: [PATCH v5 1/3] regulator: dt-bindings: Add TI LM51772 support
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261106-paul-lm51772-v5-1-0e83ac9711d9@bootlin.com>
References: <20261106-paul-lm51772-v5-0-0e83ac9711d9@bootlin.com>
In-Reply-To: <20261106-paul-lm51772-v5-0-0e83ac9711d9@bootlin.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Herve Codina <herve.codina@bootlin.com>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Paul Louvel <paul.louvel@bootlin.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793960009; l=8712;
 i=paul.louvel@bootlin.com; s=20260313; h=from:subject:message-id;
 bh=TP0RTEhxJyi5/x1EMXLgHB4xABAu/LOEq3c5jcsJ/mM=;
 b=rmGOHzNtNy159GEv1LWc0wlWkuOIVKveaaq/ZwsAJ/wREu+H28nxt2dNVsEQAZ15GQVkMkPnj
 pMY4yjIRGroCWjYlrpTAIErL6GN3MGyx24aALkHg0ork1cdSbaU/8jy
X-Developer-Key: i=paul.louvel@bootlin.com; a=ed25519;
 pk=eLW50NT18UAvUT5cAcYf88zNbBCZDLFXuptpyLVhVIU=
X-Last-TLS-Session-Version: TLSv1.3

Add device tree binding for the TI LM51772 buck-boost voltage regulator,
which consist of a primary VOUT output, and a fixed 5V LDO.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Paul Louvel <paul.louvel@bootlin.com>
---
 .../devicetree/bindings/regulator/ti,lm51772.yaml  | 230 +++++++++++++++++++++
 MAINTAINERS                                        |   5 +
 2 files changed, 235 insertions(+)

diff --git a/Documentation/devicetree/bindings/regulator/ti,lm51772.yaml b/Documentation/devicetree/bindings/regulator/ti,lm51772.yaml
new file mode 100644
index 000000000000..9d2618304c37
--- /dev/null
+++ b/Documentation/devicetree/bindings/regulator/ti,lm51772.yaml
@@ -0,0 +1,230 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/regulator/ti,lm51772.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: TI LM51772 buck-boost voltage regulator
+
+maintainers:
+  - Paul Louvel <paul.louvel@bootlin.com>
+
+description: |
+  The LM51772 is a buck-boost controller with I2C control, designed for
+  USB Power Delivery applications. The output voltage is software
+  configurable between 1V to 48V, with:
+
+    – 1V up to 24V in 10mV monotonous steps.
+    – 3.3V up to 48V in 20mV monotonous steps.
+
+  The LM51772 also provides an auxiliary fixed 5 V regulator output
+  (VCC1).
+
+properties:
+  compatible:
+    const: ti,lm51772
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+    description: Fault / warning irq.
+
+  vin-supply:
+    description: Regulator supply for the chip.
+
+  regulators:
+    type: object
+    description: List of regulators provided by this PMIC.
+    additionalProperties: false
+
+    properties:
+      vout:
+        type: object
+        $ref: regulator.yaml#
+        description: Main output voltage.
+        unevaluatedProperties: false
+
+        properties:
+          ti,active-discharge-strength-microamp:
+            description: Discharge current for VOUT.
+            multipleOf: 25000
+            minimum: 25000
+            maximum: 75000
+            default: 25000
+
+          ti,pcm-window-low-permille:
+            description: |
+              When VIN is inside a programmable window around VOUT, the PWM
+              logic stops switching entirely and the regulator connect VIN to VOUT.
+              This mode is called the Programmable Conduction Mode (PCM), and is an
+              efficiency features allowing the unit to avoid unnecessary switching
+              operation when VIN ≈ VOUT.
+
+              Lower threshold of the Programmable Conduction Mode (PCM)
+              window, expressed in permille (1/1000) below VOUT target.
+              If this property is zero, PCM is disabled.
+            $ref: /schemas/types.yaml#/definitions/uint32
+            multipleOf: 25
+            minimum: 0
+            maximum: 775
+            default: 300
+
+          regulator-temp-warn-kelvin:
+            enum: [0, 1, 368, 383, 398, 413]
+
+          regulator-ramp-delay:
+            enum: [40000, 20000, 1000, 500]
+
+          regulator-min-microvolt:
+            minimum: 1000000
+            maximum: 48000000
+
+          regulator-max-microvolt:
+            minimum: 1000000
+            maximum: 48000000
+
+          regulator-min-microamp:
+            minimum: 500000
+            maximum: 7000000
+
+          regulator-max-microamp:
+            minimum: 500000
+            maximum: 7000000
+
+      vcc1:
+        type: object
+        $ref: regulator.yaml#
+        description: |
+          LDO regulator for auxiliary use.
+          It can used to power, for example, a PD controller that will drive this PMIC.
+        unevaluatedProperties: false
+
+        properties:
+          regulator-min-microvolt:
+            minimum: 5000000
+            maximum: 5000000
+
+          regulator-max-microvolt:
+            minimum: 5000000
+            maximum: 5000000
+
+  ti,sync-pin:
+    description: |
+      Selects the function of the SYNC pin, used when several converters
+      operate in parallel.
+    $ref: /schemas/types.yaml#/definitions/string
+    enum: [input-rising, input-falling, output-rising, output-falling]
+    default: input-rising
+
+  ti,ivp-thres-microvolt:
+    description: |
+      Input Overvoltage Protection and Regulation Threshold.
+      It shall avoid any damage to the device in case the current flows from the
+      output to the input and the input source cannot sink current.
+      This threshold is used for IVP (Input Voltage Protection) and IVR (Input
+      Voltage Regulation).
+    oneOf:
+      - multipleOf: 125000
+        minimum: 4750000
+        maximum: 23250000
+      - multipleOf: 250000
+        minimum: 23500000
+        maximum: 50000000
+    default: 50000000
+
+  ti,input-voltage-mode:
+    description: |
+      Select the input voltage mode.
+
+      In protection mode, the input voltage protection (IVP) is enabled:
+      the converter stops switching when the input voltage reaches the
+      threshold.
+
+      In regulation mode, the input voltage regulation (IVR) is enabled:
+      the input voltage is regulated at the threshold by limiting the
+      current.
+    $ref: /schemas/types.yaml#/definitions/string
+    enum: [protection, regulation]
+
+  ti,nint:
+    description: |
+      Configures the nFLT/nINT pin to act as an interrupt pin.
+
+      nFLT mode: The pin remains low until the cause of the status change ceases.
+      In this mode use an level irq trigger.
+
+      nINT mode: The pin is asserted low to signal a status change.
+      In this mode use an edge irq trigger.
+    type: boolean
+
+  ti,iset-pin:
+    description: |
+      Select the ISET pin as the source of the current limit, instead of
+      the ILIM DAC. When this property is present, the ISET pin is forced
+      in its active configuration and the ILIM DAC is disabled, so the
+      current limit can no longer be programmed through the
+      dedicated register.
+    type: boolean
+
+  shunt-resistor-micro-ohms:
+    description: |
+      Value of the current sense resistor connected between the ISNSP
+      and ISNSN pins, used to translate the ILIM threshold voltage into
+      a current limit and vice versa.
+      TI recommands a value of 10000.
+    default: 10000
+
+  ti,cable-drop-compensation:
+    description: |
+      The cable drop compensation feature helps to keep the output voltage at the
+      nominal value over a wide range of load current without the need for
+      additional remote sensing. The cable drop compensation measures the
+      current and offsets the output voltage proportionally to the measured
+      current.
+    type: boolean
+
+required:
+  - compatible
+  - reg
+  - interrupts
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        pmic@6a {
+            compatible = "ti,lm51772";
+            reg = <0x6a>;
+            interrupt-parent = <&irqc>;
+            interrupts = <1 IRQ_TYPE_EDGE_FALLING>;
+
+            ti,nint;
+
+            regulators {
+                vcc1 {
+                    regulator-max-microvolt = <5000000>;
+                    regulator-min-microvolt = <5000000>;
+                    regulator-name = "vcc1";
+                };
+
+                vout {
+                    regulator-max-microamp = <5000000>;
+                    regulator-max-microvolt = <20000000>;
+                    regulator-min-microamp = <1000000>;
+                    regulator-min-microvolt = <5000000>;
+                    regulator-name = "vout";
+                    regulator-ov-protection-microvolt = <1000000>;
+                    regulator-temp-warn-kelvin = <368>;
+                };
+            };
+        };
+    };
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index 57285ff29a16..c958e116cd66 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -27461,6 +27461,11 @@ S:	Maintained
 F:	sound/soc/codecs/isabelle*
 F:	sound/soc/codecs/lm49453*
 
+TI LM51772 BUCK-BOOST REGULATOR DRIVER
+M:	Paul Louvel <paul.louvel@bootlin.com>
+S:	Maintained
+F:	Documentation/devicetree/bindings/regulator/ti,lm51772.yaml
+
 TI LMP92064 ADC DRIVER
 M:	Leonard Göhrs <l.goehrs@pengutronix.de>
 R:	kernel@pengutronix.de

-- 
2.56.0

