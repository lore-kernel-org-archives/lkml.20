Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793797063;
	b=ZoMzZhCcmfmW1uCVoG5CDYOarbsf2KJeMeGIWV4YX6KIN0ZYLLdKahVdI63XL7ffiS7Q
	 FFDIOXvBP5rPXxRDcBMMzqEJ/2ASQ0sOAhXrU58dOf2PNXW2Tr7QNRyfH6I8nClgrYhxD
	 Z6T/2WNW6UmtgwKDf4lT4bkzl9LNPksa3Aj/nhk6S2xWVDV++QFPVeBxlB67EVoTL2puK
	 tnvbYpiM7rNi0mvcSvpvtjjWWpdyVoWYXA5oPzQWmjl1qo8xzUC+UVPJ4Y9T+m4H6+7bL
	 BHtfgt72sdGmL4dlG1TiH5YJF9oQt6QEVaaafp1jCOV3U6XTEZaXPTDECSEfsNTZQkg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793797063;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=9G2dte95Vad2uVhSzYUBfUzMCe9j2QVGsk/Niv3oma4=;
	b=ci9obWDqNE24ibLXvX9o4DBk1vgYTHwOaEEf86Ed8YCxn3MRQNP1QPtaLuBEl8nmj1ns
	 bwP56EY5kZBfiejphjEp4KHCZTIe+CTQl+NMiiH/wQy1Bqqp6Os5bEp/E67w3NrCPz+dP
	 Gx6TBFPDuq4VAiFkeEbYmucCUfGvxGi455Ua9PIXieVXMLhf42oXYfo6DXAUTLvDTOBaT
	 BK/PqoeX8fT2zLSsaVKenPk1sbJ9xKq40bKDTCoT6h24HeXutapX8SQWfOO2a+JgRfxn3
	 uDpD1RMEOPcW01Z/Q/AiTk+BHV6e3AgPr5Ho99YbEq+XjfpZtoFsTjtDkFl5yCnDiHw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=CwkJyYH2;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4179606A334
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 12:57:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D4179606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=CwkJyYH2
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id A90D24E413FC;
	Wed,  4 Nov 2026 12:57:40 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7C4F760770;
	Wed,  4 Nov 2026 12:57:40 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 76E7F103283F6;
	Wed,  4 Nov 2026 13:57:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793797058; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=9G2dte95Vad2uVhSzYUBfUzMCe9j2QVGsk/Niv3oma4=;
	b=CwkJyYH2vUaX02aCsyl9Kqg5k9wnyYfFWPpq37wHlX8xvIrv7gO1+arDCCxhke05nyYKAb
	o2jMJ+gyDKXDPGyWLOrIubdlNikQNwPerhq0cRHt9Y/3VLnDrDYETj3BK4Oe5V8A9j9RF1
	wUNyPTM6nfo4vO7AyXhqQp0hOTVAG2aQzKSgCLLznP2vN6OhDhc7f1+sJtm5sdeI5jHvpC
	YXIL+2VR87SwCmZ2lRYwIeoZ8sETzLUKeHxQ/C/ju+OWa5pFm1Iry0gls5v+VwZhRTpLuf
	mH9FVl8iVvvDk3C634qa5UBFfjEIBHbLps4CmFiAYHBnyAeFzUu/Ua9udRXTwg==
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Matti Vaittinen <mazziesaccount@gmail.com>,
	Rodolfo Giometti <giometti@enneenne.com>,
	Marcelo Schmitt <marcelo.schmitt@analog.com>,
	Antoniu Miclaus <antoniu.miclaus@analog.com>,
	Angelo Dureghello <adureghello@baylibre.com>,
	Tobias Sperling <tobias.sperling@softing.com>,
	Eason Yang <j2anfernee@gmail.com>,
	Marilene Andrade Garcia <marilene.agarcia@gmail.com>,
	Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>,
	duje@dujemihanovic.xyz,
	herve.codina@bootlin.com,
	thomas.petazzoni@bootlin.com,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v3 1/2] dt-bindings: iio: adc: add Texas Instruments TLA2528
Date: Wed,  4 Nov 2026 13:57:24 +0100
Message-ID: <20261104125726.1754980-2-maxime.chevallier@bootlin.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261104125726.1754980-1-maxime.chevallier@bootlin.com>
References: <20261104125726.1754980-1-maxime.chevallier@bootlin.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

The TI TLA2528 is a simple 8-channel, 12-bit ADC and GPIO chip
accessible over i2c. The ADC part has an AVDD supply that doubles as a
reference.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
---
 .../bindings/iio/adc/ti,tla2528.yaml          | 91 +++++++++++++++++++
 MAINTAINERS                                   |  6 ++
 2 files changed, 97 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/adc/ti,tla2528.yaml

diff --git a/Documentation/devicetree/bindings/iio/adc/ti,tla2528.yaml b/Documentation/devicetree/bindings/iio/adc/ti,tla2528.yaml
new file mode 100644
index 000000000000..7a50a5026c1e
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/adc/ti,tla2528.yaml
@@ -0,0 +1,91 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/iio/adc/ti,tla2528.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Texas Instruments TLA2528 8-channel 12-bit I2C ADC
+
+maintainers:
+  - Maxime Chevallier <maxime.chevallier@bootlin.com>
+
+description:
+  Each of the 8 input pins can be configured as an analog input, a digital
+  input or a digital output.
+
+properties:
+  compatible:
+    const: ti,tla2528
+
+  reg:
+    maxItems: 1
+
+  avdd-supply:
+    description: Analog supply, also used as the ADC reference voltage.
+
+  dvdd-supply: true
+
+  gpio-controller: true
+
+  "#gpio-cells":
+    const: 2
+
+  "#io-channel-cells":
+    const: 1
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 0
+
+patternProperties:
+  "^channel@[0-7]$":
+    type: object
+    $ref: adc.yaml
+    description: Represents an analog input.
+
+    properties:
+      reg:
+        description: AIN pin number
+        minimum: 0
+        maximum: 7
+
+    required:
+      - reg
+
+    unevaluatedProperties: false
+
+required:
+  - compatible
+  - reg
+  - avdd-supply
+  - dvdd-supply
+
+additionalProperties: false
+
+examples:
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        adc@17 {
+            compatible = "ti,tla2528";
+            reg = <0x17>;
+            avdd-supply = <&reg_adc_supply>;
+            dvdd-supply = <&reg_adc_supply>;
+            #io-channel-cells = <1>;
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            channel@0 {
+                reg = <0>;
+            };
+
+            channel@3 {
+                reg = <3>;
+            };
+        };
+    };
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index 93abbb315065..9ccb33ada3d5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -27758,6 +27758,12 @@ F:	include/dt-bindings/soc/ti,sci_pm_domain.h
 F:	include/linux/soc/ti/ti_sci_inta_msi.h
 F:	include/linux/soc/ti/ti_sci_protocol.h
 
+TEXAS INSTRUMENTS' TLA2528 ADC DRIVER
+M:	Maxime Chevallier <maxime.chevallier@bootlin.com>
+L:	linux-iio@vger.kernel.org
+S:	Supported
+F:	Documentation/devicetree/bindings/iio/adc/ti,tla2528.yaml
+
 TEXAS INSTRUMENTS' TMP117 TEMPERATURE SENSOR DRIVER
 M:	Puranjay Mohan <puranjay@kernel.org>
 L:	linux-iio@vger.kernel.org
-- 
2.56.0

