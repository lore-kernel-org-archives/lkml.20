Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793795848;
	b=HsFTDOix0ObG5kHY9WoRdv8wwnFTq0FVHQgtLH0c+KR3v5cxd5mz+m59JG2qLj1EY3Hq
	 lu++lRz+Cyl3K8Il6dlk4rYUbzPkKEI/oOVqEH6vPmqmyrFJYPkEgY2U+VmI4af7kxGDd
	 ZX0OBr0Anc+Pkqb/EzXwtg8+Fh3UpnC1lk2n/jte5K5jnEQ20zuiimVB2F8gjr0D6TeLt
	 x/iHqQmV1EpCOd8c215CK6C6fq2pCr/nGYxueL6Vl/DYSSrJ/vGGpEE+pmYk2yZaFcZjV
	 ELba+65yDmRxAgJFWF30mKNm/XtQSphWf/lDeKaFHcm/yaSFc2EfDq8JVhH8xwNSF7w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793795848;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=o49Az/X7nnRMbCTvuIgrTpIjxf+w39CY1NNO3CjBfDA=;
	b=p9kehxq0tWT5CJVbt1V2R24jTVphzN7pv0USGHBTaCUY9Z5jH+Fm52wn98+WPIurMON1
	 I+FfbUzYmAuUsmqpcY6SPVyhjGmLot0HPpDZGEN9vQ9ic55MV6G+z2WGWQnml0ACCU3Fu
	 /VOY8cnOfDO+gSpB4NiOL+JPEKJVPlKfOxQ6CPw9yacsLzZfhT0E3U59j3yY5FJKRlkqh
	 tQfPsGN9qt+ndzqw+j7b+qhI8dAmHlhbDZ7T+E5NUOPelfNE0V/rpTe4CVlo4s47/my1o
	 IxogNn9yc1froGaVpg7grz2VrgYaN6vQR4rxgaCgsYmW6Pc3sr6BGKv0R+nSSxXZXYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Da3QX8PX;
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCCF1606A338
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 12:37:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DCCF1606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Da3QX8PX
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48c5358fc28so578069f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 04:37:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793795846; x=1794400646; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o49Az/X7nnRMbCTvuIgrTpIjxf+w39CY1NNO3CjBfDA=;
        b=Da3QX8PXTku83HXjS5JpLZQXqckDKYkJbgCs4095ujueL7xk3JwGOtm3FVsh+o1vph
         vraZ/41wnUMcyHqO9H4jACP/PpgWADBJTqjRB6CT5oQPHTlzBDpBaZjhGqdTfhnuBLkf
         JFlbbCp6zVwNMQ/P2fUZvixOxa46gCgjGCgzNuLm8aTCjKQuWMKXKVjrjA2aNA3++fTf
         1z3qC8xIRrsdBGrtz41eYsOZSuonwsNDlBtpw1VnajOwulH9F6+f/ek7Y6rN+d6YSOAS
         1h/trqfm4hgiERV0SrHliUsZk+9z4lTK3rqudjeGiN/a91DdC+9uXC3dhd0wfXO4ocrE
         /Qdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793795846; x=1794400646;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=o49Az/X7nnRMbCTvuIgrTpIjxf+w39CY1NNO3CjBfDA=;
        b=Cgc2mXIgma3hqWzMZ6L5ZN1ZGIoGBhBlgDGvw1j5zeuYsvPbOej4uB7C6+cbkPgUl4
         NqlWDdl2JrrZnLG39PIYmZPyJXSHHpN4MLRnirmMEPnBMk/4GCMc0Zj6rkRI8bQc4L1z
         1btMAVEPKpoLcbz1X1dC9PvlP3U6w3t4jYCTMLUXR9EKsceQRc+L/7Esw5T9hV5LCcJF
         Fek4/jEGHeFlV5yfiGPg1bM1VELxPI5sWmENK8l2y37DjEXF0Z79wJJR3Xze67iRb3P2
         0TUh0HLVRmmEdpBHVXv2V2pjgLAEbHGWJmcXbvWCoHnfzWe65g9HzKBA4mJpfSRozyUy
         vwiA==
X-Forwarded-Encrypted: i=1; AKwUvBzMeN4OrN/aaCwSaUlsTFL6/0UxoXtgQNX8jxZVCi07Nb0A99Axy7t8kmMjDjAiG3rKUyo8Tjo9pcuLz2c=@vger.kernel.org
X-Gm-Message-State: APuU4Z/WWtk6nTtWMM+HyCHU5bDkGaixhLjn8o/+41YNRaaH1IcH/Vg8
	T9oh/dcXrL2Xd3AJR+SBn6KJ09C39AVIZwQwuxa7IJwSrlMmS4QZ4TT8
X-Gm-Gg: AYBFou0FdDWqE6XDhTnBZQCUAZfE8LxU+HR9A8XsMkZLn5D1zYo4Yzd9RyTfvdvVZIy
	lPdvP+0ijyeZCNysY3UufL3s4OqUnheGK9zFdXyn0LL2PWxcMGLz9o+Z4tjh7Hovh0Lcz6qUqXq
	q2rr+OEjAFsm317QX6CAccfPl0xpVoDnEkWORoskOuPRC+g6z5SCnN9c6grEY6/PHm0ZMKbs1Xp
	D9VE5104cpUmrT1FH4xBgVX1XS9tPa38ok7VaBjfrUUw560h76oIoy0d7t7HqJw7sawN7Q9xyUy
	CYbFYj+xxU2M7He1IuYqZjbPIKKKpONqyPsestNFWhuifdvgtRpqYFxh94qnDbgcxKqi1U0IRtO
	HVqTfeQz8g4js90j92dRg1I16+9wNkuxF811vwYb0AhSe2F1lwiuEArZqUhgceHriW2riyHfnTe
	p2n5W8j6RlYwPAuiowqvF7mHXzwGRLkOaR/dhV+ieySJSs/W0nVoYkgBPsks2hF2p92dZ1V+W3F
	33ZGIThkg8HJcY1iRQ7o0wa5r25A72oXqe6uARLt8tkmLv9nXcMEVBDWCUPiJK6tq2VmErCoThS
	GQhiDQDDy2ddzpTNUkeRX400J4MeiFm6xHNJfux1D2pA4JGKqA==
X-Received: by 2002:a05:6000:22c4:b0:48f:bf3c:1631 with SMTP id ffacd0b85a97d-48fbf3c185bmr4984588f8f.21.1793795846185;
        Wed, 04 Nov 2026 04:37:26 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fed553441sm3386155f8f.43.2026.11.04.04.37.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 04:37:24 -0800 (PST)
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
Subject: [PATCH v6 1/4] dt-bindings: leds: Document Skyworks AAT2870
Date: Wed,  4 Nov 2026 14:37:11 +0200
Message-ID: <20261104123714.234634-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261104123714.234634-1-clamor95@gmail.com>
References: <20261104123714.234634-1-clamor95@gmail.com>
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

