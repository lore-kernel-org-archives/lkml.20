Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794166187;
	b=nUFO68TfOt9ozLO+Ubcnqjma+dP84QGj0DH4c+JVHDdRDt8dv1pzRvIpN/QcbYOEODbW
	 K/8qBtHByjHrOqsesnz4QyCmhAloDpdZ/z0rB0Oztr5Iuv9TtuLIllRfg8/Fz1/qwW99g
	 E+UbnU4Tey1cd6/E0i9HfYpQxkaGpJIN6lJsAeKRKRvIBDwSA9aYK1txLL16Vx+UDp+nf
	 5gekVpHEQh+e0eIr7eZUwwi0SNI9FkF/+GHMMul+QJWWsL1QLTzVpqJXoxpw7CLHDziuz
	 j48qFNha/UMs1CPjYwl+nwcf+z9YmLkDaRqpes13/AdqhJPz6KBNIZzk0WD7SnMclUQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794166187;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=6UKVF1iHp7lqvxGLRS0YlyJBvqOEg+SmNvS8fWsdmow=;
	b=PuGYdPuZtp2nX+3vt5JROGoGFJZwUKALhT0NYepQ7B7EaVcFDrSQGk611TFVlInl4STk
	 4YX4JNvd7dQLVHR9ZRI7UMSVMyniuvCHDVMfRaufbE96sctwJ/lhQs4Z8C7+vUgMKxzG1
	 iahCoj6RG+TDgUXLHCK1bUvE9U0nWrYKgriMRvyiwRv56PIAl9zDVSvce3xifXqc0eXLa
	 nY6b6dB7YT7adaAnSg/jHZR0Hk2ejsQpCSz3BSVOhKtEBX5rEoaxEh0AupNz3v4AH2Y1x
	 QhpjczasBEOB3Sy2yC8mLrVR9O6HDgKw4+mgMyoQxo8UjHYpQWvZU5Ujv+uRYtV0rXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QYyjDE8Y;
	arc=none smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B769E606A322
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 19:29:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B769E606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QYyjDE8Y
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-33bb5afa736so21885eec.1
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 11:29:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794166186; x=1794770986; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6UKVF1iHp7lqvxGLRS0YlyJBvqOEg+SmNvS8fWsdmow=;
        b=QYyjDE8Y6qx/3YIQveeXYvFlrAE13E8t4YClOXKlUraf/sbjtDrtw7SbHDQjymdjqj
         R1d9E4TkjSlN+jz0JMSj7UemHmzWyESZ5OiPLLCcHkFK3E9MMDzjwykfAw3Wj+1Ypy/Z
         69mgRE8z5MVeRUj413Fjnjd98KM3QWe5ZSE501juI6SnuifRRv4hsGSi2c5BP3nowLBf
         cUUt48zcFbR2eVcYv8x48qzY7UltY2qlzJiCMD8ZOkk/dRBIqJTktsGnPKIYlvKEOnZM
         9FIVl/H2G/n1BYKJfRsJYDVQQSGt0Xkt95p615L3rZ/hHayJ1JCm9fvDXDB3csw9qQRd
         n8eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794166186; x=1794770986;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6UKVF1iHp7lqvxGLRS0YlyJBvqOEg+SmNvS8fWsdmow=;
        b=zOUjievnF7Fmmgunh0jzHWkEnilnp4RrRwJfcRAeHuOqkq3WwOKrZBmdAu2an5n+rk
         FJRlMy00KtLu6gf/7OAM6jD3CesoJQ6ZXh8eY5Ss3Bsf6cC/lKwstAJJCM537V8+1nuW
         JsYJL1RaXfMDD4pYEPS4he8EpYuFjjYi4IUT9G4684J82aiRdfpdXFAwGa+qnWfqOTSf
         +owEgLdHs9Ju0z0gTb8RUB8PHXsAIvuUnsMZzwijeADER5u5P+yih49b1Scdazs9Bx2y
         db+SUDr7eoKfLck5APC40ONsjqNnfYM+nqxI3BYqgkjjK4PqaqzFIlo/MNisT0+svP4J
         O5oA==
X-Forwarded-Encrypted: i=1; AL+hErHPTOiwh1y3SS1M2q51+Mwy+eRzLOXj2ZAhhevaotNqXI/SMVpTCJ2RI3fd4fOCigUKRQpf5VXG5IfCygw=@vger.kernel.org
X-Gm-Message-State: APuU4Z/eMQSsPos+Q1NjPNEZvhuPReBmESnqkSSLoRKm8y/1ardUhxFQ
	mEgA3/G6BVCwJ0UQNjgDtk76t/+YG6DTa0ePFMH+wOU5HOGcT6TA2ApR
X-Gm-Gg: AYBFou0UxV3FRI8DZL2MKdQ1m8Q/3E3amxUqj1BVrZ0a+SBTIk1Xxpa9DrFsU/8A1AB
	meW/Ml3WNUM6pF5I8lCmqUJFLEWvYEiSWYtMSpWgRaT6vSK3A2NbhzGgMzFxRJgiN+0rg7ta7Ua
	fyEhPFI37fGN+/6devjEKpGdAgZHvKmtH6wMcEPMGyoT+0N00Gqm9CBmpuZDosnpSS+UHiDTTrh
	Nq//2DZr7det8lEEOIr0O1uAImOaNUML+D9oS45vPQfTzHhg3Ej+Rj+ViMBw1KsreNjc/QSXXmK
	zq2dJSB2dZ7jsxIZt5QEcfA68MTZ8o3qR1ol353Wn3yKI+RC52f80XeiSlVA4A+iHu+xA3PUKII
	wrMKz1r3NWi+jzTa40bhfjEmYvLhGz+aGy8eGHNkxPs3R7LxkBHItoUl+7FdozfhQsTqyZS0Ird
	OruTF08BYTkaruG7HODE9lwLdppBxwm7mYH5mFLlLNCBwwx4BwyIfyQrTAue7888BIO7yP0cMQR
	Cf4TItPHzvKTzvn4DXpLht93ccb9BsmC3B/xNdNmXAm/u+RB0F4JqEK/3MD3Rk45B+3GVhI2Jzc
	OGrOlH2tKf0K1mRLu7Aq2tsfBORjk/rHymzIkum7Mlcn+nYJz0PwPSoB9ogX
X-Received: by 2002:a05:7022:c86:b0:165:be2f:c56e with SMTP id a92af1059eb24-1b39fe8709emr5185189c88.2.1794166185651;
        Sun, 08 Nov 2026 11:29:45 -0800 (PST)
Received: from [192.168.1.11] ([2401:4900:881e:93af:b6d8:a723:b13b:3c1b])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3755eb6efsm8800387c88.4.2026.11.08.11.29.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 11:29:45 -0800 (PST)
From: Bhargav Joshi <j.bhargav.u@gmail.com>
Date: Mon, 09 Nov 2026 00:59:18 +0530
Subject: [PATCH v2 2/2] dt-bindings: arm: omap-l3-noc: Convert to DT schema
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
Content-Transfer-Encoding: 7bit
Message-Id: <20261109-ti-l3-noc-v2-2-509e8485a1f3@gmail.com>
References: <20261109-ti-l3-noc-v2-0-509e8485a1f3@gmail.com>
In-Reply-To: <20261109-ti-l3-noc-v2-0-509e8485a1f3@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Santosh Shilimkar <santosh.shilimkar@ti.com>, 
 Sricharan R <r.sricharan@ti.com>, Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, 
 Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 goledhruva@gmail.com, m-chawdhry@ti.com, daniel.baluta@gmail.com, 
 simona.toaca@nxp.com, j.bhargav.u@gmail.com, linux-omap@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794166167; l=5555;
 i=j.bhargav.u@gmail.com; h=from:subject:message-id;
 bh=V6xDIpNqnztXWcRk3NMINnD1f76BA7CWhqVK8M03U1Y=;
 b=05yU4urWD2+/64OMT9PFCCNt3uSmI8hp0xTnByhmUBySSU1GixyctN9oiO+WQMVQ89NhFZPUw
 Smqhp5KcSwfB8lhOkAMP9g1iYOva+XTo5HBARxzDufjnw6kAxBgsMoX
X-Developer-Key: i=j.bhargav.u@gmail.com; a=ed25519;
 pk=IqNDwUZKECEA+n8wXctFLBbYL9NhFstZNbOznm/nX1k=

Convert TI L3 NoC binding from text to DT schema format. Older OMAP3
uses the SMX variant which also acts as a bus parent with simple-bus
compatible so child nodes are allowed using patternproperties. Mark
ti,hwmods deprecated as it is no longer needed and only used by older
omap3-l3-smx. Move binding from /arm/omap to /bus/

Signed-off-by: Bhargav Joshi <j.bhargav.u@gmail.com>
---
 .../devicetree/bindings/arm/omap/l3-noc.txt        |  23 ----
 .../devicetree/bindings/bus/ti,omap-l3-noc.yaml    | 153 +++++++++++++++++++++
 2 files changed, 153 insertions(+), 23 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/omap/l3-noc.txt b/Documentation/devicetree/bindings/arm/omap/l3-noc.txt
deleted file mode 100644
index 161448da959d2..0000000000000
--- a/Documentation/devicetree/bindings/arm/omap/l3-noc.txt
+++ /dev/null
@@ -1,23 +0,0 @@
-* TI - L3 Network On Chip (NoC)
-
-This version is an implementation of the generic NoC IP
-provided by Arteris.
-
-Required properties:
-- compatible : Should be "ti,omap3-l3-smx" for OMAP3 family
-               Should be "ti,omap4-l3-noc" for OMAP4 family
-               Should be "ti,omap5-l3-noc" for OMAP5 family
-	       Should be "ti,dra7-l3-noc" for DRA7 family
-               Should be "ti,am4372-l3-noc" for AM43 family
-- reg:	Contains L3 register address range for each noc domain.
-- ti,hwmods: "l3_main_1", ... One hwmod for each noc domain.
-
-Examples:
-
-ocp {
-	compatible = "ti,omap4-l3-noc", "simple-bus";
-	#address-cells = <1>;
-	#size-cells = <1>;
-	ranges;
-	ti,hwmods = "l3_main_1", "l3_main_2", "l3_main_3";
-};
diff --git a/Documentation/devicetree/bindings/bus/ti,omap-l3-noc.yaml b/Documentation/devicetree/bindings/bus/ti,omap-l3-noc.yaml
new file mode 100644
index 0000000000000..7dab336347b2c
--- /dev/null
+++ b/Documentation/devicetree/bindings/bus/ti,omap-l3-noc.yaml
@@ -0,0 +1,153 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/bus/ti,omap-l3-noc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: TI OMAP L3 Network On Chip (NoC) Interconnect
+
+maintainers:
+  - Santosh Shilimkar <santosh.shilimkar@ti.com>
+  - Sricharan R <r.sricharan@ti.com>
+
+description:
+  The L3 interconnect is an implementation of the generic NoC IP provided by
+  Arteris. OMAP3 uses the SMX variant while OMAP4/5, DRA7, and AM4372 use the
+  NoC variant.
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - const: ti,omap3-l3-smx
+          - const: simple-bus
+      - enum:
+          - ti,omap4-l3-noc
+          - ti,omap5-l3-noc
+          - ti,dra7-l3-noc
+          - ti,am4372-l3-noc
+
+  reg:
+    minItems: 1
+    items:
+      - description: L3_MAIN_1 / L3F / SMX domain
+      - description: L3_MAIN_2 / L3S domain
+      - description: L3_MAIN_3 domain
+
+  interrupts:
+    items:
+      - description: l3-dbg-irq
+      - description: l3-app-irq
+
+  ti,hwmods:
+    description: hwmod names for each NoC domain.
+    $ref: /schemas/types.yaml#/definitions/string-array
+    deprecated: true
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 1
+
+  ranges: true
+
+patternProperties:
+  "^.*@[0-9a-f]+$":
+    type: object
+
+required:
+  - compatible
+  - reg
+  - interrupts
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: ti,omap3-l3-smx
+    then:
+      properties:
+        reg:
+          maxItems: 1
+        ti,hwmods:
+          maxItems: 1
+      required:
+        - "#address-cells"
+        - "#size-cells"
+        - ranges
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - ti,omap4-l3-noc
+              - ti,omap5-l3-noc
+    then:
+      properties:
+        reg:
+          minItems: 3
+        "#address-cells": false
+        "#size-cells": false
+        ranges: false
+      patternProperties:
+        "^.*@[0-9a-f]+$": false
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: ti,dra7-l3-noc
+    then:
+      properties:
+        reg:
+          minItems: 2
+          maxItems: 3
+        "#address-cells": false
+        "#size-cells": false
+        ranges: false
+      patternProperties:
+        "^.*@[0-9a-f]+$": false
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: ti,am4372-l3-noc
+    then:
+      properties:
+        reg:
+          minItems: 2
+          maxItems: 2
+        "#address-cells": false
+        "#size-cells": false
+        ranges: false
+      patternProperties:
+        "^.*@[0-9a-f]+$": false
+
+additionalProperties: false
+
+examples:
+  - |
+    l3-noc@68000000 {
+        compatible = "ti,omap3-l3-smx", "simple-bus";
+        #address-cells = <1>;
+        #size-cells = <1>;
+        ranges;
+        reg = <0x68000000 0x10000>;
+        interrupts = <9>, <10>;
+        ti,hwmods = "l3_main";
+    };
+
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    l3-noc@44000000 {
+        compatible = "ti,omap4-l3-noc";
+        reg = <0x44000000 0x1000>,
+              <0x44800000 0x2000>,
+              <0x45000000 0x1000>;
+        interrupts = <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH>;
+    };

-- 
2.56.0

