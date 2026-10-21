Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792578528;
	b=Z2/Ijp4QHdYuPHc236dRzqg40biydfiUSM5Ktn4kUE1L8gwn+4CDuG0jXqFovRYpR2cq
	 NxMeD6vswdTgUN4ZlnMgJQj2ay6Uh41oki/ghqoDJSGiAYvvEPEzIPlDa8tGfx2EXGGMm
	 3UXktZjJycWC7LYCB4EVXaYpEp3/doyV5DbB/A4iogBkU9aLePNVgHazObuyioGMad3PM
	 oU3ckYQ3U3ABlD3GUOOMGJWtKppNBwJjbfY8qD6SltRXFtwwz4G5JB/XURmmfwVJQ/plO
	 U5rtL3kWGM80LPYlG6hBHRcwDVLltagsiv155odq9LuVaO5AHhh6ip8LPyR7tvcDxcQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792578528;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Last-TLS-Session-Version;
	bh=wkTncgtGM4wE/4VuWxOB/zkDY/DAVz++M7SSce1gSjI=;
	b=UmFL7UU1BFzCSuhBZMCpvofx4a2Zd9PmMCUPANI/ifApOPKnSOrRIuM6FNYt23QSan10
	 Nl9TH0vrE/OE84ySl8sXf+g+e+DVPMexC9lVTZGC+z8uA6Z80qVEYRenxtLiGWyo/sG8c
	 72fF6A3mNJwWgCLmdsEiNZjdupeUY5cG5Fv7IhpXEklRlq5eYIUCHm0LFxoOHDZHyqXgJ
	 OjiMyFaASzDrzH4mrD+JUTQ5hmCbXiawz9/IVrA0c2Utypuw34UX0Nm7gkafbFJTGp3+h
	 hrOrUn45jyOJD22TznYvzsWgi/hD/MTek5h+OAjjeHU4DaMFimV2RSGgU9UO50eDDRw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=U5gUwm1L;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93F57606A31F
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 10:28:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 93F57606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=U5gUwm1L
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 6183D4E41298
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 10:28:46 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 36E75606E3;
	Wed, 21 Oct 2026 10:28:46 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id F1D5510328E21;
	Wed, 21 Oct 2026 12:28:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1792578525; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=wkTncgtGM4wE/4VuWxOB/zkDY/DAVz++M7SSce1gSjI=;
	b=U5gUwm1LsLMF8Rsk0/4NeiXVKWXeWbwioxp+LynPBRJItszq5CV+nGiPDNd2Y90Okt23Ov
	c3Z9PLwAWNoh3gSMigfgO6otS27/4XX/YyRrXlV34Sa3X+cz5qO05JmT0ESubi5aq5Qllq
	Umqc5bWjFrMBuff+HMbP2EgImtVb3k4q+y9kZOgd+idk47t7yCJAnUn/sYieeB+jbr6wYD
	bsHgtE71BpzZ9N/Pd+CoQv28DddlYYGg0XYS75ICncR1k7cyI/cuokDAKwaKR+cY22dw2q
	5ATf6OtT8QyLxgMA2pv30vk0zLxua3/ojIzVdeQrQBe3Shrw4aTS019vazlHPA==
From: Paul Louvel <paul.louvel@bootlin.com>
Date: Wed, 21 Oct 2026 12:27:43 +0200
Subject: [PATCH 2/5] regulator: dt-bindings: Add TI LM51772 support
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
Message-Id: <20261021-paul-lm51772-v1-2-25f0ffbffa8d@bootlin.com>
References: <20261021-paul-lm51772-v1-0-25f0ffbffa8d@bootlin.com>
In-Reply-To: <20261021-paul-lm51772-v1-0-25f0ffbffa8d@bootlin.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Herve Codina <herve.codina@bootlin.com>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Paul Louvel <paul.louvel@bootlin.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792578518; l=8804;
 i=paul.louvel@bootlin.com; s=20260313; h=from:subject:message-id;
 bh=oLmSCiTuR92xAp+hIN3gbmgBhgx4dZIO8nNffPeq99g=;
 b=Lj/+44RynQQO65Qdwu9vosPervoWlg4V4iVta7VMOssASdgbYPLT5r2179PrD2YXgiJ/evS3p
 NC9BTIC6xS+D+x+V5CVEaru6LX+hzFtI6zg49N5j0Uu1vLYUkd2b9l5
X-Developer-Key: i=paul.louvel@bootlin.com; a=ed25519;
 pk=eLW50NT18UAvUT5cAcYf88zNbBCZDLFXuptpyLVhVIU=
X-Last-TLS-Session-Version: TLSv1.3

Add device tree binding for the TI LM51772 buck-boost voltage regulator,
which consist of a primary VOUT output, and a fixed 5V LDO.

Signed-off-by: Paul Louvel <paul.louvel@bootlin.com>
---
 .../devicetree/bindings/regulator/ti,lm51772.yaml  | 239 +++++++++++++++++++++
 MAINTAINERS                                        |   5 +
 2 files changed, 244 insertions(+)

diff --git a/Documentation/devicetree/bindings/regulator/ti,lm51772.yaml b/Documentation/devicetree/bindings/regulator/ti,lm51772.yaml
new file mode 100644
index 000000000000..1e72ac13ddfc
--- /dev/null
+++ b/Documentation/devicetree/bindings/regulator/ti,lm51772.yaml
@@ -0,0 +1,239 @@
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
+  The peak current limit threshold is programmed through software, between 0.5A
+  to 7A.
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
+
+    properties:
+      vout:
+        type: object
+        $ref: regulator.yaml#
+        description: Main output voltage.
+
+        properties:
+          ti,active-discharge-strength-milliamp:
+            description: Discharge current for VOUT.
+            $ref: /schemas/types.yaml#/definitions/uint32
+            multipleOf: 25
+            minimum: 25
+            maximum: 75
+            default: 25
+
+          ti,iset-pin:
+            description: |
+              Select the ISET pin as the source of the current limit, instead of
+              the ILIM DAC. When this property is present, the ISET pin is forced
+              in its active configuration and the ILIM DAC is disabled, so the
+              current limit can no longer be programmed through the
+              dedicated register.
+            type: boolean
+            default: false
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
+          ti,sense-res-milliohm:
+            description: |
+              Value in milliohms of the current sense resistor connected between the
+              ISNSP and ISNSN pins, used to translate the ILIM threshold voltage into
+              a current limit and vice versa.
+              TI recommands a value of 10 milliohms.
+            $ref: /schemas/types.yaml#/definitions/uint32
+            minimum: 1
+            default: 10
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
+            maximum: 70000000
+
+          regulator-max-microamp:
+            minimum: 500000
+            maximum: 70000000
+
+        unevaluatedProperties: false
+
+      vcc1:
+        type: object
+        $ref: regulator.yaml#
+        description: |
+          LDO regulator for auxiliary use.
+          It can used to power, for example, a PD controller that will drive this PMIC.
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
+        unevaluatedProperties: false
+
+  ti,sync-pin:
+    description: |
+      Selects the function of the SYNC pin, used when several converters
+      operate in parallel.
+    $ref: /schemas/types.yaml#/definitions/string
+    enum: [input-rising, input-falling, output-rising, output-falling]
+    default: input-rising
+
+  ti,ivp-thres-millivolt:
+    description: |
+      Input Overvoltage Protection and Regulation Threshold.
+      It shall avoid any damage to the device in case the current flows from the
+      output to the input and the input source cannot sink current.
+      This threshold is used for IVP (Input Voltage Protection) and IVR (Input
+      Voltage Regulation).
+    $ref: /schemas/types.yaml#/definitions/uint32
+    oneOf:
+      - multipleOf: 125
+        minimum: 4750
+        maximum: 23250
+      - multipleOf: 250
+        minimum: 23750
+        maximum: 50000
+    default: 50000
+
+  ti,ivp:
+    description: Enable the IVP feature of the regulator.
+    type: boolean
+    default: false
+
+  ti,ivr:
+    description: Enable the IVR feature of the regulator.
+    type: boolean
+    default: false
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
+    default: false
+
+  ti,cable-drop-compensation:
+    description: |
+      The cable drop compensation feature helps to keep the output voltage at the
+      nominal value over a wide range of load current without the need for
+      additional remote sensing. The cable drop compensation measures the
+      current and offsets the output voltage proportionally to the measured
+      current.
+    type: boolean
+    default: false
+
+dependencies:
+  ti,ivr: ["ti,ivp"]
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
+              vout {
+                  regulator-name = "vout";
+                  regulator-min-microvolt = <5000000>;
+                  regulator-max-microvolt = <20000000>;
+                  regulator-ov-protection-microvolt = <1000000>;
+                  regulator-min-microamp = <1000000>;
+                  regulator-max-microamp = <5000000>;
+                  regulator-temp-warn-kelvin = <368>;
+              };
+
+              vcc1 {
+                  regulator-name = "vcc1";
+                  regulator-min-microvolt = <5000000>;
+                  regulator-max-microvolt = <5000000>;
+              };
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

