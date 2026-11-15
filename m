Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794733121;
	b=i+F/HOWNMIJcwxRHymRiy1YGoCBT3UKqqAN6WPa03f+cc9nBNPIo2XqyEcQxx8je3sBn
	 e+HT6x1Q9HQXw7wa8xm16jKr27vUn1nrPQGywrs+f7LHJZtmP4vu1YT9MszfS6+2keBYU
	 P+2eaf3kI5V4BTz1Giji+ooh/LQ0OOjxHbWkJUWrrtrj80YRdR8mDjoTY2dhwI5qqV38a
	 od2l4n3rAz9wEyOIUk/H0eNumFahnVB1yupLKUmrugkblUFqH99L4IO7ShbV0b2u3NYbd
	 iXQgrkN08egzd7UpxFSTrn5zA0XwwnOKyCCUFIkc8Lot5U2vlFiFVRGUc7ljZi+QGjQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794733121;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=o49Az/X7nnRMbCTvuIgrTpIjxf+w39CY1NNO3CjBfDA=;
	b=XVxUHVHUOwwfe+faVE1Z4lkut77yahRQIWUC2Dng0pfitCDupZ4BqvUdToaApiqCVw00
	 mMe6Vh7BY2kpVvPyyHkbwwqFqjJ/3B8DkS+ndzJbYKw/sDTtm/2BmtemfZ0aixQqKFF/u
	 KcxakY7IwT87xesvhgEe1JdT5nZzdMczzg0kF4Ic/UC4Y/cPLgbm/tnGKGEE1UuEJV6Ig
	 dFVXzzBe5Gr06WvBfQUjc+KjErxkCyOf4SiW9ibWfN/7LNBaHG1P+oMuVmoY68tArvCaV
	 AfDzO04bp8GuCz4cETxWl9gpI5ygLvgZEJsZ658NH6YeixqfRjdRLorbhpQpl+066UQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sPsUUrm6;
	arc=none smtp.remote-ip=209.85.218.44
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FB07606A332
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 08:58:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2FB07606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sPsUUrm6
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c4682977f9aso386050166b.1
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 00:58:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794733119; x=1795337919; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o49Az/X7nnRMbCTvuIgrTpIjxf+w39CY1NNO3CjBfDA=;
        b=sPsUUrm635yddSdvTL7IG5cX2QAsw0XXrkPv6Pn/50HxLhpopLxnB9woE8SMJdkzPQ
         ZyVD8w+AHewcn3a1c93CucFI0Mq7zRsKJF3bldMV6CmQ7PmZYthmcnDhoE7sLD1fnnvs
         dIIsDTtaffiPVjVGvOEBHgEPuR21kH9N+mID9RNJnNk8Da0GEbDNj7iJDNF0bqtwyFAv
         BUVyH0xeSCizRcmsccXEMu4YUe057/v/rwPf3CF5G4ETita+V5S8Tubdlkd76sQwxDpD
         cQkaQ24toV68rPjAkXeG0zSt84eDQUSER3+3fu8KgxhsR7aNQpY8L/sJE1ymtU8my4g7
         7MYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794733119; x=1795337919;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=o49Az/X7nnRMbCTvuIgrTpIjxf+w39CY1NNO3CjBfDA=;
        b=ZtO+PwqQKTakMPh/bXvT65wF5HKIBrOl6jlbgtXn3/oTTZNMgtRkonJmmjqHb8Omwc
         8ZOyFbPeTgSvMKcnO+jKOMsSTkmW7kouw4vtviWl8JU6i+oR0brbQFCnYuQsZfsspBOB
         31QaKKCMV0752u/fcTN/NX5fIHisn18GXPyDU4tTs13YAMxD3yGLMuNnNMjxeF2DG/FZ
         23EDSsfKKxK3DTByBATRV7utuD6xsjVK/0wwCOptO7AFJFmlPnK7uuh3ZGcqCbGOlcQg
         ZUoZ/jQiqErrnlH99bX1W+PM23DneTQQ6/glJADnn9LNbwxY8cR6wchQmdl4qaVSpNqh
         VJnQ==
X-Forwarded-Encrypted: i=1; AL+hErFsYhU65j/9ZjIp01ArhI6n3xa2to8g8fy/rnIy4oS1gJDV6i/USn0HhaRpNE+nN5zE2rSsqWhwA3wb1IA=@vger.kernel.org
X-Gm-Message-State: APuU4Z8PyIe1xS4Tl1UuTOFNRlknBYohYeiJOgdfQBjF72cDRf95VwZz
	3In+gpV5XY9YiWEnQKFOZhiJluJExzLdFufa/AMD4IO/lJggzwJYAmvn
X-Gm-Gg: AYBFou2YcKnWmebGEb8uCvJpPV1AN3azV4nu3v6Gy3v5jgVLA/0OlsUQ1i9bgi9lJAb
	8X48PNqYLGHJyAf8VFOzp/OqWWKGnxs1//+9sWa0SqdO14rzMpcOt4gGMWqSBSVIGglho/4fWXV
	ebsz5cMaMsUS5vaMoEeHzB+AATU6z+o+Wmxy730HftFeoLqgwi/ZEZiVEHt4eYcYlPPeCnQyoNW
	t6AC+s5humtYU6PUwPS3kOX/thWMG8v1Uoj+fQsLnWQJB7whnlwPliWy04wkoCvnYJSg8r4iogG
	aq+jr+sCo5/MZ/CmNWboA9oWibGMpf+KsTE5XfNbd4gL1EcxbGjkxgny62duHv2AKqG8MA7x/Bj
	mbN/Dp0odf1rp/VXkuRHg/uLa1hp0aqFpI6lqvgq4I8JO+y+H2cGto5YTT7hno577n4qJwvVHt7
	4KeP5djJFHzaTPRf2lryTYPA33ZZGVf+qnweBoK8CtUU8UZWjTvixnbW1EdL40O9NIwtOoHBOXe
	xA4BBe1fS3EaiFlD8GkTWirBjNOsDf5mkDlDn1N/ueaVHvaSrhCxD2RCUtb9vnIM4FGZyJyQzL6
	J6xdoPoXwKXJ+xoYdilYiN1OswPbNpx+iDMDSJ03NSPlJfER+g2RlxOiqqHyqCYgsiBDRPSITkP
	sf7Zo9UNukA==
X-Received: by 2002:a17:907:9448:b0:c41:8e21:4d58 with SMTP id a640c23a62f3a-c5096199393mr579973966b.5.1794733118390;
        Sun, 15 Nov 2026 00:58:38 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095a5c4b7sm287613266b.1.2026.11.15.00.58.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 00:58:37 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Griffin Kroah-Hartman <griffin@kroah.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Daniel Thompson <danielt@kernel.org>,
	Jingoo Han <jingoohan1@gmail.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mfd@lists.linux.dev,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v7 1/4] dt-bindings: leds: Document Skyworks AAT2870
Date: Sun, 15 Nov 2026 10:58:22 +0200
Message-ID: <20261115085826.89641-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261115085826.89641-1-clamor95@gmail.com>
References: <20261115085826.89641-1-clamor95@gmail.com>
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

Document Skyworks AAT2870 LED Backlight Driver and Multiple LDO Lighting
Management Unit.

Reviewed-by: Daniel Thompson (RISCstar) <danielt@kernel.org> # for backlight
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../bindings/leds/skyworks,aat2870.yaml       | 124 ++++++++++++++++++
 1 file changed, 124 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/skyworks,aat2870.yaml

diff --git a/Documentation/devicetree/bindings/leds/skyworks,aat2870.yaml b/Documentation/devicetree/bindings/leds/skyworks,aat2870.yaml
new file mode 100644
index 0000000000000..3f3f3058af52d
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/skyworks,aat2870.yaml
@@ -0,0 +1,124 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/leds/skyworks,aat2870.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: AAT2870 LED Backlight Driver and Multiple LDO Lighting Management Unit
+
+maintainers:
+  - Svyatoslav Ryhel <clamor95@gmail.com>
+
+properties:
+  compatible:
+    const: skyworks,aat2870
+
+  reg:
+    maxItems: 1
+
+  enable-gpios:
+    description: GPIO connected to EN pin.
+    maxItems: 1
+
+  vin-supply:
+    description: Regulator providing power to the "IN" pin.
+
+  backlight:
+    $ref: /schemas/leds/backlight/common.yaml#
+    unevaluatedProperties: false
+
+    properties:
+      compatible:
+        const: skyworks,aat2870-backlight
+
+      led-max-microamp:
+        minimum: 450
+        maximum: 27900
+        default: 27900
+
+      skyworks,channels:
+        description: layout of active channels, where each bit represents
+          one of 8 channels.
+        $ref: /schemas/types.yaml#/definitions/uint8
+        default: 0xff
+
+    required:
+      - compatible
+
+  regulators:
+    type: object
+    additionalProperties: false
+
+    properties:
+      compatible:
+        const: skyworks,aat2870-regulator
+
+      in-ldo-supply:
+        description: Phandle to parent supply of regulators populated under
+          regulators node. They all share same parent.
+
+    patternProperties:
+      "^ldo-(a|b|c|d)$":
+        $ref: /schemas/regulator/regulator.yaml#
+        unevaluatedProperties: false
+
+    required:
+      - compatible
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        led-controller@60 {
+            compatible = "skyworks,aat2870";
+            reg = <0x60>;
+
+            enable-gpios = <&gpio 139 GPIO_ACTIVE_HIGH>;
+            vin-supply = <&vdd_3v3_vbat>;
+
+            backlight {
+                compatible = "skyworks,aat2870-backlight";
+
+                skyworks,channels = /bits/ 8 <0xff>;
+                led-max-microamp = <27900>;
+            };
+
+            regulators {
+                compatible = "skyworks,aat2870-regulator";
+
+                in-ldo-supply = <&vdd_3v3_vbat>;
+
+                ldo-a {
+                    regulator-min-microvolt = <1200000>;
+                    regulator-max-microvolt = <1200000>;
+                };
+
+                ldo-b {
+                    regulator-min-microvolt = <3300000>;
+                    regulator-max-microvolt = <3300000>;
+                    regulator-always-on;
+                };
+
+                ldo-c {
+                    regulator-min-microvolt = <1800000>;
+                    regulator-max-microvolt = <3300000>;
+                    regulator-boot-on;
+                };
+
+                ldo-d {
+                    regulator-min-microvolt = <2700000>;
+                    regulator-max-microvolt = <2800000>;
+                };
+            };
+        };
+    };
-- 
2.53.0

