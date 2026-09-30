Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56C723D3D00
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 07:15:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790752534; cv=none; b=dBRffOtpNQv4cuAMup3cCg/QQ4Bek9IDnonpe4vrOQkNJxHJ13vDy1wHBGaCKkI74ySEWXI8bxOW3A507080xonkSC1wso7ThZ1zjiu1HYG23eYnKLckzoQ0WEaR8m8fTRcegZi3oT8rAMuuHRI46MUp67u74IivCnWcn5M792E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790752534; c=relaxed/simple;
	bh=ownnF2eA8yjuB5F7r+YjnScn5LX/aUHmRE+jgVipf6Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Bkh9XUUoafs+o9J5wo1KdPK1DrOqXy2xnuCXFgL+R55wrz6tMCiDrns8ueijT6xcOtzhij8NP12CAiKpPHMIp4/jqwzAMzWX2KRoNBz7equzt8xwPgZEzKlrBBq2d4yZZfl03CYWwh08+VIcWW2t++aRCEMHlHdv5Iq1lqc/ot8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Dlevv48F; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Dlevv48F"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49cd5462b69so27871305e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 00:15:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790752525; x=1791357325; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bshOoGO6/a2WohdGzsO4t4N/wsEAXwivylUfNFmKjAo=;
        b=Dlevv48FImISrQ/FDxQj/yhEvNlPu5Kkq8w7pAP3rb8XJVdT0YPoKO25x/KOmK5O++
         sIuMdm4H1W/9T4LmIhF3ZWt3DVkNR8t5LMdnUfxoNxm9/tkZfsPylyYv4QRhcX+vKIKA
         uTQ1uKToeswq9j3BLQ8sMvewDEhZ2iJfqXES1gisdOSiAgYSwGJWuUaILtV4NtBMLqJ/
         399MZiKT3IwTLzbYGxYXW5Sem/9ZjH2ll6EZIe7WyIP4sr2x5qX8Myt0fNdQJOGudqZ9
         ZrwWcZlBNNSOLibJ5JpbP9gTE3KL9SoJQsN55ThfWbbGh1K5Ll6B3rd/pE3DZDCQXxHw
         JsDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790752525; x=1791357325;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bshOoGO6/a2WohdGzsO4t4N/wsEAXwivylUfNFmKjAo=;
        b=z37ePs966+3a20JRm/21ADhuW39rpcNVKHjuAUA0Sux1rsV15TxKiLinaP6SvNxzek
         0dLWqcV0MWSTyFGL4UUZCM08iP/IIgcNYNkhIfr/UNRuWMPilguNlLwN5G8jxrEHA+z6
         xJMEa+76P1rxY1er64muyapj3hd9RJI6d7GyuPmR8ePLHFMscC33TU2WeHqowVqQwX8f
         onKseqgcN8W75GPfqNBYnFvnZhzKm69ai3capC7YHg+iBwFwXNEMVCqsP7yANi2T4BZL
         we3zzy6/++MK6iogTa4JJb0W0Of1OsnMRpIiZ6yrwqLzpf9w5o+Em2ew3qArabnYZKnG
         JJ1g==
X-Forwarded-Encrypted: i=1; AKwUvBxD8Sqfn9tPPm99p5uY7X76NJSghDsX1dr5yEJ2tIRVGtLmg0ib+R+uWi/jucbDQrxy3mcHZyfnqF7cyoU=@vger.kernel.org
X-Gm-Message-State: AFuF++k1BZMFHs7Vob2B38pNfDKB93lc1bomtbJUTMXqIWHR3aSqVqFJ
	lufXxcrfX184zy7AbJDkxb1ziUKIvUJTSngsIcUH8iWTO8/sMmQD9QgmNyQpIQ==
X-Gm-Gg: AYBFou1J4cfxXxPXgFsrenRbnNvMv1O5t5U2iNLZ6dgg8gm01drJhB3EeZuVq0uJ2Wa
	03hgZJIrxg1jMywzlZ+PiMRDm6TDBjtUvy3e3i0upZNx8LMpi+P3vWieaUKavFaIhclBHRa5sHV
	nn7ipN2VFMlvI6GTaWBQMIqW5AW3b7F3F6OBZILoB+dbjJ0pYCj5P1LALIdYNktNRG4zprIN0hI
	u0F4rJTIpwdrVhXS6wdyQLVGjgQHXsXaFXOdceMygdbxdGdcoRRYxiHagCZLuNt2FcTIrtU7GAX
	BbmYuCsZqIXyvJZSM26yp1AhiTJrOLOO4NqHQzhoJO6Tt2j0fly2GCGtqN27VIrHT4LtR9Itb8F
	cfszwsZRQbDamdXdTCCskq2jOQgheK86zGO6trJfolxXGj0Ut/H3tIxpA7AsjQsp2Kry1XE+E4+
	FrGXU7izptGr5W9ycvkTBLqPmE+gqWiryZl3zxFOFgn7sSW8OVZWXVTw3fkv1LGI9qmAkKwKtrD
	88iJ66D4Q+VEzFyyt4n8sBSApum7pw=
X-Received: by 2002:a05:600c:1c29:b0:49e:6c11:c4fc with SMTP id 5b1f17b1804b1-4a01aff0d75mr5571755e9.7.1790752525426;
        Wed, 30 Sep 2026 00:15:25 -0700 (PDT)
Received: from xeon ([188.163.112.76])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b029be7e4sm1256979f8f.12.2026.09.30.00.15.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 00:15:24 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
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
Subject: [PATCH v1 1/3] dt-bindings: mfd: Document Skyworks AAT2870
Date: Wed, 30 Sep 2026 10:15:11 +0300
Message-ID: <20260930071513.54697-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260930071513.54697-1-clamor95@gmail.com>
References: <20260930071513.54697-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document Skyworks AAT2870 LED Backlight Driver and Multiple LDO Lighting
Management Unit.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../bindings/leds/skyworks,aat2870.yaml       | 127 ++++++++++++++++++
 1 file changed, 127 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/skyworks,aat2870.yaml

diff --git a/Documentation/devicetree/bindings/leds/skyworks,aat2870.yaml b/Documentation/devicetree/bindings/leds/skyworks,aat2870.yaml
new file mode 100644
index 0000000000000..6dfcd1fa399ca
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/skyworks,aat2870.yaml
@@ -0,0 +1,127 @@
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
+        minimum: 450000
+        maximum: 27900000
+        default: 450000
+
+      max-brightness:
+        default: 255
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
+      "^(ldo-(a|b|c|d))$":
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
+                led-max-microamp = <27900000>;
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

