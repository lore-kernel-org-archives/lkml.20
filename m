Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFEAC23EAAF
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 19:10:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791745848; cv=none; b=LJeEhbVYD1pzQ4OCh5mo+HZLmd4tLFb7fMmE1vySWSR0ztAtuM0dVSE9MZ4OOD607u1e/xlGqhflGsLjwZysb4zmBVwxVmV+6JXTPP4inSzU1tj0amLPnqWMtOR9XgJ0I7juurcnXrm1fWdYHYy92+Z3L0DKlA4hEEdg7qi31ag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791745848; c=relaxed/simple;
	bh=wVwtf3VBmI07awCkCM8Q0hmm9lshfUUpGDDa7XJpyRE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dptjOHa3pdvEfjRaJGJvd38RC0rm5KEXI2RuHV04OfXlFRSwtSc46h4mUU/Gg6rIf32PB8gKhthv+ss2W1NaK5rFuJvkib4D5G/oROQYAhIRfFdwYoI9qXetc530FlnsM6q/H5+s7VS+lKrORMph9xcYTluhqecJT32dbyYvpv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ksjhg+Bw; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ksjhg+Bw"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-48c411d6615so714941f8f.3
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 12:10:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791745845; x=1792350645; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fTeW0dCMannfUqmrWOxDyxXAwJxDr0EkxzUlrfb9Tgs=;
        b=Ksjhg+Bw5UCnBvJbkjQBwNfm4RZXZjT26jboELZrU8NbRXzPjvHybyitKNzKdfaq9E
         xKZ7YBiiXX4l6bm5U34dIxODeoAzcRlHuolMZaZD7vYyy3QTqSuVSY0TipV0xKtmYnE3
         ce8Cjr+ca/gXO9v8SZFWdEEhzQ2Rm+MePZzG81WYBcWEGdFkzpmorbt8CKJ5pYTwttMr
         WGvPLRHqr86UEvmXUHzsIEcbCu6FBZYwq85pFBWLqmpT/wqL02ExXw78BISQiDvI0THu
         tT9kLzzqO/l4d2GRz/rHxU2YIV9NSN2DEyfB+aPtqL4d4ZPfjt6dkrzS9a+qHWmeBb3S
         bFHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791745845; x=1792350645;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fTeW0dCMannfUqmrWOxDyxXAwJxDr0EkxzUlrfb9Tgs=;
        b=zoIPnNCf+nbRgO1yXZ8FBAkWPUfbt0yat26nAvIlHUlW0WmJWB5vyuh3TEIw51edDy
         4uYrUlRGDlh2ChpDfxcjsoIEfTNDY+DchCc3IHKpMiGdy84JKsIFenrU4iz3EYIyJ0Xr
         V1m3EhsLKYeNQZhp4WqO6rOTem+/ig4iFAL1noNYxk6to9TbYPgqncXaaRJjEEQEXIm6
         zTYzX17USChEXkKIL8HhbDPHmdBv+dwAIRFsXVtO+LkYta8vedMN/72yIexrTUK6OY1K
         5qnU477Y8tMDrvHscH1f9hWI8trpm2KZ3VIc11Zv0Niavx5UyRPpoUjVKUP7Euvkqhxm
         0Zow==
X-Forwarded-Encrypted: i=1; AKwUvBzN09qvHRpSxQAQ/vr5vxfBWKjVm03C26W7/xejby7Akc62f4Ii1Kyci/vneuggSV4tot+ivJy0SuLS4u4=@vger.kernel.org
X-Gm-Message-State: AFq9FYIjxwV6vvV1doMP42jkxj1L94FpIihkG52P0ltVQrVYFndU2JiN
	/ZznzVz7wacU0AIviduHvh1oDJkJKLvSjGA4C+qMd7ert08PaIlt4Abx
X-Gm-Gg: AYBFou2nBcmZ2CQLFdyBue394T+cARja6i24QfNWPRRG5S9Fn6Sj2RwLg45SV3Aas2Q
	7+FBG048WvY+bsea5BeTZ6LahSrgR89KBG3GoRJK3GG7I76hvR+dj9vDPJmebtoSjsuX+211gk9
	rW08frc+pLOBZz7NFO63UYtd+q3WW9Mtz4N6FSVP2j3SamuM0r6HlTeFqlg+1pXyHYUO6o3edO6
	qMbL0Lj39QmobwjrXuWpFR1f0r7B3coWe7RoAVvoftVz/bCmJCUvp6Tb4MbrUMQbG2FcvhCTH07
	Vj1LjO8YqtP5KxZWEkiLLYmBAcI8ScDOD65l3HgoVy2d5MyZaTkMrASdeV4vfW/DEDdzsbNF7Hl
	tSLlrkrbmKAnOSg6HSnU9berlbJw2QVUBy8cQW2uQ4iCtRjnZwBMBkLDeDYS6iX1lFgIYOzPKso
	ohwLZvErbwlWXWnguqLzGZWxqRnvzdUs9/qxbe0Ma+zMOzQ7/nFSLzvDzleSWrgwx1HHE79qG+G
	b02Fq6gmqoEEpYTkqyjgpXihqL1Yj9UaQE=
X-Received: by 2002:a05:600c:e557:20b0:49f:dd9f:6038 with SMTP id 5b1f17b1804b1-4a18e4bff94mr88482415e9.25.1791745845163;
        Sun, 11 Oct 2026 12:10:45 -0700 (PDT)
Received: from rillian-arch ([90.244.147.10])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18bf15691sm225209795e9.6.2026.10.11.12.10.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 12:10:44 -0700 (PDT)
From: Rillian Grant <rillian.grant@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ruslan Koreev <koreev.r@gmail.com>,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rillian Grant <rillian.grant@gmail.com>
Subject: [PATCH v3 1/4] dt-bindings: leds: Document TI LM3643 dual LED flash driver
Date: Sun, 11 Oct 2026 20:09:43 +0100
Message-ID: <20261011191026.149338-2-rillian.grant@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261011191026.149338-1-rillian.grant@gmail.com>
References: <20261011191026.149338-1-rillian.grant@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document Texas Instruments LM3643 dual LED flash driver devicetree
bindings.

Signed-off-by: Rillian Grant <rillian.grant@gmail.com>
---
 .../devicetree/bindings/leds/ti,lm3643.yaml   | 143 ++++++++++++++++++
 1 file changed, 143 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/ti,lm3643.yaml

diff --git a/Documentation/devicetree/bindings/leds/ti,lm3643.yaml b/Documentation/devicetree/bindings/leds/ti,lm3643.yaml
new file mode 100644
index 000000000000..63c5f09f3bd5
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/ti,lm3643.yaml
@@ -0,0 +1,143 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/leds/ti,lm3643.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Texas Instruments LM3643 1500mA dual LED Flash Driver
+
+maintainers:
+  - Rillian Grant <rillian.grant@gmail.com>
+
+description: |
+  The LM3643 is a dual LED flash driver utilizing a synchronous boost converter
+  to provide power to two current sources.
+
+  The dual high-side current sources can be tied together to provide flash
+  currents up to 1.5A through a single LED.
+
+  Datasheet: https://www.ti.com/lit/ds/symlink/lm3643.pdf
+
+properties:
+  compatible:
+    enum:
+      - ti,lm3643
+
+  reg:
+    maxItems: 1
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 0
+
+  enable-gpios:
+    description: GPIO connected to the HWEN pin.
+    maxItems: 1
+
+  flash-gpios:
+    description: GPIO connected to the STROBE pin.
+    maxItems: 1
+
+  vin-supply:
+    description: Supply connected to the IN line.
+
+patternProperties:
+  "^led@[0-1]$":
+    type: object
+    $ref: common.yaml#
+    unevaluatedProperties: false
+
+    properties:
+      reg:
+        description: Index of the LED.
+        maximum: 1
+
+      led-sources:
+        minItems: 1
+        maxItems: 2
+        items:
+          maximum: 1
+
+      flash-max-microamp:
+        description: |
+          Maximum flash current through this LED. Each high-side current source
+          can provide up to 1.5A. The maximum current the boost can deliver is
+          1.5A across both sources.
+
+          Valid values for an LED connected to one source:
+            10900 - 1500000, step by 11725 (rounded down)
+          Valid values for an LED connected to both sources:
+            21800 - 1500000, step by 23450 (rounded down)
+        minimum: 10900
+        maximum: 1500000
+
+      led-max-microamp:
+        description: |
+          Maximum torch current through this LED. In torch mode each high-side
+          current source can provide up to 179mA.
+
+          Valid values for an LED connected to one source:
+            977 - 179000, step by 1400 (rounded down)
+          Valid values for an LED connected to both sources:
+            1954 - 358000, step by 2800 (rounded down)
+        minimum: 977
+        maximum: 358000
+
+      flash-max-timeout-us:
+        description:
+          The chip supports timeouts from 10ms to 100ms in increments of 10ms
+          and from 100ms to 400ms in increments of 50ms. The provided value
+          will be rounded down to a supported value.
+        minimum: 10000
+        maximum: 400000
+
+    required:
+      - reg
+      - led-sources
+      - flash-max-microamp
+      - led-max-microamp
+      - flash-max-timeout-us
+
+required:
+  - compatible
+  - reg
+  - "#address-cells"
+  - "#size-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/leds/common.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        led-controller@63 {
+            compatible = "ti,lm3643";
+            reg = <0x63>;
+
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            enable-gpios = <&gpio 42 GPIO_ACTIVE_HIGH>;
+            flash-gpios = <&gpio 43 GPIO_ACTIVE_HIGH>;
+            vin-supply = <&vreg_flash>;
+
+            led@0 {
+                reg = <0>;
+                led-sources = <0>, <1>;
+
+                function = LED_FUNCTION_FLASH;
+                color = <LED_COLOR_ID_IR>;
+
+                flash-max-microamp = <750000>;
+                led-max-microamp = <180000>;
+                flash-max-timeout-us = <150000>;
+            };
+        };
+    };
-- 
2.56.0

