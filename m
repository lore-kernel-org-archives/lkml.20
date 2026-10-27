Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793100775;
	b=dKEZ0QlARVtRR/WdRnhlWOXm4KcA4LGSztEfesB4dVqtUqkHzxkgPOODxvRqP6V7Dwd2
	 gP7XRDfEds1KuOq69dAbKWBh8iAdIn7dr7gNeqQGPrFZ+CpppDk/zS6MD+nw8jTmitZvP
	 8WEBpystNxgozmB19TCpdjVg/7nJ6EidR6LtEan4WK8k+A2S0+fPNIRMAVJMK7tQfXwbu
	 AsjLeGp2+yOm1L0UlpFDOpCm6BSa4yoTfcF2PmjWI4MMWMvkq0thc+hH6EMl5SXFYjsOA
	 t6jzJyS60UKYVX6ONCsV5IoLoR6yUGx1l5JoNi1QvNaR2g0T1G2lL7FRtXYnkmFBQ2A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793100775;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=bleP8syB94cG1bo4A3J3eIEtjKnK9hoV/0t42kw/sr4=;
	b=jrZCZD2RJlYO8lMwibbv3VuRXwIH79Wq4i/sfwsUFQPxf8JFQv9MoSXoxfTSNfOpaBWa
	 Zzs7p6/HPD9y2WxSwQbc2YMWxAkIGff0acAvDbw1OR2fZj+oy26UxSa06Q5z0wsFwwbxu
	 q8rvpzzj6iUWS7lrn7cpRlBApTeBXH9gQi18z7ttJpPGNTVQzbd4NV1wlIENS5a2nB7Ii
	 CxJl/IQT5Lo9TMncbGQI1VRmTFWC7qxkjCTSt2c1BIkSIhCadXwguACuAbIfTm9jAFUce
	 lAfpLYTa4EZgYFTKtPWncz7q8d5NuVOVykSbU9tfAAd661EeUs0TPRaOSxNuJWHm5wQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="Oy/3KG5W";
	arc=none smtp.remote-ip=209.85.218.53
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2443E60A2621
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 11:32:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2443E60A2621
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Oy/3KG5W
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c46822eefb6so525911566b.2
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 04:32:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793100773; x=1793705573; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bleP8syB94cG1bo4A3J3eIEtjKnK9hoV/0t42kw/sr4=;
        b=Oy/3KG5WqtvrHjqq1wuaW48vC3gsYJBtBXLHxWy7q1M/Haq/6EVU7ytgS6OBQjO5Eg
         XN5CqyDgsGYRw95TTKHft/iIcKiLv0VrIINjBHOyAGLbjAIMMYkeqRj9xOQV4rXcO8av
         lVGiZ6tA/pcY3MYlU4WJuBR6IcfK5EOweDwNsCX3XFQKerkj0E2DW1eUQKlWMxmCixPj
         yzAYQqJV+sq7fHRvtnzQMwZqI5qlOZZmpG0ERzkab5d2VG4pkSilpBqTk80qh5Ee6iIi
         8hX6NNQm8aC8ShpfLPVblX6PHGe4Zk+jEu9XIWHHQu/FBKNMXa6+AFYNPrjKDZzOcsH2
         Jf+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793100773; x=1793705573;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bleP8syB94cG1bo4A3J3eIEtjKnK9hoV/0t42kw/sr4=;
        b=mBFbQ77NwAp4NFZ6IUhZw2b6Vmk1uR45BDe0aS9jTjj7Gh0xFRwbbXCo06LHsCZfaI
         H1YubV0cFQ+ygKIk583vh0M9WRhqQ57/BAc8eotl2DSqRlENCbdceqZyxarnQM4g+Eij
         VAbygH75afihXgJ+H6dfBx+unfuxdRU4xMB3JRa3587/9UshWMQ9JhE66NXdgdpC40mg
         FG1LDjLp0/FRdExY1Catn0/eL+zpGotf8rAPf48lUDz6Ek1YJ9G9W+SoST4MLCU3jZCl
         TK09OjsPvBDFvdTUNDirvhOXzn0LmMhep8yYHVvKS0utJc4Ge6ZC4z9OT0+iWE1126NH
         5N/A==
X-Forwarded-Encrypted: i=1; AKwUvBwK3R0sYe2y2ZzUym4Co1Qlq3dEdAFSAQ40X0H03rba86+8tiXXXWzqBE8dLL6wgeiNGHaPiDyqoUHwEXQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYL+06DoFhDL5sZ5eJRz6KsIIczKIDjuk3RayXl8i5kJhXYa5uvq
	6WNOSOCshuZYNB7fpzADUdVJEZUK1nVY4kBPSvPT15xDjrqYQ5mgr4cm
X-Gm-Gg: AYBFou06FOH+eD7HUXd5GT0YlW9U1CZ/j3ftaP5qixd/Ckm8KtmecuEnrCh7zJk8St0
	xs+7e7+EHWSGz0Uj8l3BCDtTDoBDlAIHaUg+SRx0tXD9VM7rc/XrwblZ9yCeF+sPSwCwpEPoeSp
	NZKyYV9OC2Jdkb2xpxMS68c1z/n6w9ca+Qx4voURF/UVokA7dCkFHatPDjNKYWQIsykYV4LTZyu
	DiTdpS4YyD75tEo20KLwc5WIO8sj79KqTnuMbRnXLLmXKX9qjMe9xXN8QXg9pj4jg87sRD3qZVm
	72oORd0RUkuYA/ekkVWACbwtvtcvYp93TYkKZKTfm1+R2uiqmN3P/kUjkpbbMZc+/nZl6xJ394F
	inrL1aUVP/BDLj6MlAb04LGZW/u35P5HoPMc4WmqnM10XXuoX7cT2urNL5j9Sd+GY1rIfwVl0Vp
	Q+RMgsBaBq0TIVG2xQhUNHrVB+fct8rNPu4tg6oBq/bHz+ax2Q1ooKpkY5PMbdR0JJgDm0juhJZ
	gQ+IdNLxqKImZVzhsgWSVp48iEO1pTpQYWgDIW/1Rsf0XM0biShXgWtMEbqqWKkPS6HpQYPCwiN
X-Received: by 2002:a17:907:6092:b0:c31:82aa:dd4c with SMTP id a640c23a62f3a-c46bde48accmr960707066b.24.1793100773381;
        Tue, 27 Oct 2026 04:32:53 -0700 (PDT)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd4ea608sm428920566b.21.2026.10.27.04.32.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 04:32:52 -0700 (PDT)
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
Subject: [PATCH v5 1/4] dt-bindings: leds: Document Skyworks AAT2870
Date: Tue, 27 Oct 2026 13:32:27 +0200
Message-ID: <20261027113230.47538-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261027113230.47538-1-clamor95@gmail.com>
References: <20261027113230.47538-1-clamor95@gmail.com>
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
index 0000000000000..0b4b8be9015bf
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
+        default: 450
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

