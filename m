Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794231384;
	b=ehJ5PCEJZCFuAqCaEsPA+AN0ljoZAd1i27LAprCEZJoFpz4Xsdx1p13xfYwu3x0ROEtY
	 uuUPVxa5cUVIxLd/EiAT1q1NGfdcHR+DmJU0ar+ESwxxieYR/47ZDAzhM8sI9MArEoHUd
	 X4cCy0dZeTkFZi3OqzD8LgDJQvnUPgeK+kd03b3fA/7a8g7J2k1NIV4abMbOn8598yJ5p
	 AzGtze1kMYrA+yLmsZktkGLlgnV+mFtO5O0CMVuWKVSBDnZc1Xy4dV5U60+ryRkHedWlz
	 WEaCYKbxQNVAuIzyC3xhxjSv51WBa+MeqYpFrdgfMK4XWfrL7UAJHAyWZel+CAJ1/lA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794231384;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=O3DcDAcu/e7R2Ks6MhqHwiL2VWmAmz6xdp3JBivfIuM=;
	b=bSkOvN/okG7J4CVY6hd1bAJADtN3wWTi6pDzWFyHsOCbp+10NGBfKtqYzRT4GcOe3cRd
	 CHg9ZzSgJK5XOK8p5g341kM0Aq20LneMFx+TdQh/Twn3iKXD/FC7FwSOFaz1eIDM4W2Nv
	 j0YkkYuUcoDqX+St1kqy/PyiO0hu51KRhQPxtpSNiBXZvT5Nm8MBsX3zbCkwbYg0cNYt5
	 3x8xeSNVHNSUducwg0JaBtisNgTyPN1lkf266J7HYhVheaHlcBbhLHqk8DJbHRY2j68at
	 6VlfjcBeYLIoD9ectssYnnkzecC/nGhAavRVQY+SVViCuMo5Z2euU4Q0WxaK3Df0EIA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sartura.hr;
	spf=pass smtp.mailfrom=sartura.hr;
	dkim=pass header.d=sartura.hr header.i=@sartura.hr header.a=rsa-sha256 header.s=sartura header.b=Lddqbonz;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20F18606A339
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 13:36:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 20F18606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.a=rsa-sha256 header.s=sartura header.b=Lddqbonz
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a140e7405dso7123825e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 05:36:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1794231382; x=1794836182; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=O3DcDAcu/e7R2Ks6MhqHwiL2VWmAmz6xdp3JBivfIuM=;
        b=LddqbonzUr6K0romfGF6hlerJbpmIzHvEHhqyIWAmAqdmk/R/RLWOz57Zi/UW/CxWH
         znBTgbW4yHY5aYHkODU8j2wnYFi/mel9aRfgUbkIxM+mHIoNhu15PMhrj1e7+E8OhMcT
         j8x+KiRb1/La5Rooi5P6A6uu9lXmk7j+uByHVEjrnV3amn0x/sRYfmJ5edOQesRb+he/
         aJl4karHtl4ur9/hWKlLgGPSay0ISSarnokiHFKgoVCeOHF8kJOQloMP/OmlLTcszoGC
         qbp5tnbYmGXru/ffupw7/Y4LpMU41pEBoxKS8btbKzb8vYC9lIKPkwyKN05QV+Mi78XP
         mqkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794231382; x=1794836182;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O3DcDAcu/e7R2Ks6MhqHwiL2VWmAmz6xdp3JBivfIuM=;
        b=K+bzrDErxVNJ/Dp5JP0C8z2HUuv9KUvlFIbR8mii9ALyyVvc+0BxKglMl4WoNRD3vV
         c+xrzxSgJiGhy8d3UcnpazmXFwEB1DO2GChGw4T/2LuMdybKVhiI8Ixx1Py6mg36njNZ
         bqpc/J0R06Lx3z4PBFljzn/HaqrySDfjd40s7W3JjpEZn9vXSA2DcPvhRG9kSrP/qTWW
         ZTJvQb7AnrxR847HlmoPBqgru2drsqyYpJBznU8eyRqNLETfLPwbfDMyEHQP8NuNLcGp
         /CCmgem4VGzz7dZ+7griFzsh2FQk7zOVs3/aXkcyIsLUHPHcvG7KkmIsWCuBKGH6CX6O
         5QCg==
X-Forwarded-Encrypted: i=1; AL+hErFB1Y3BTcImaQCt6pZBfBR3ZziuX2/GH5LF1krZich18J8aFmB65E8YwWn3EFExHNH9UPqgsEnL83ptP7I=@vger.kernel.org
X-Gm-Message-State: APuU4Z86vwx979TRq5UAEhbyFOYUhUY+C7XZVB9gDZZiBW+YcDtorMuO
	xiCJC31uO6La0j0d9Us2+ypBRUQVwWP16V/os4wQvXLH06hdo8HNTsr0hQTaW9RUkoU=
X-Gm-Gg: AYBFou0+s6Yd2VI36z1AP3m0dUw2vw29ddRArzQAYKlKII7F3gu91n+kpqu7ZmVNF9z
	6UtpBKByMjZkX9GlxebT0eiSNaePnJ72Ufzvv9X918A7HH7+gN+uyGsXSLkiHh3gw6/yMFebxop
	1ivrpO4Lk8AhNzYdjW2onVD3l9Kb86LvxzOcCsN7X/SkJVYCifu/sU3kY/S3rQFqdxGktyntuQJ
	fqJwyNBeZ+UqL5zZlcVJFht30mXASPx8m38HUXPzvhx3zLoJkyofx+B1SQ6nbnPjwfJ3THLRl5J
	ADgSvOcW60cPJxDx2OOkQHxWitzkXDGNvGLKUp626Z2hb7f6PxWz6piSQfQB5UtPgmgJmvhTCgL
	YDA/RSzSwTiANxnDG/jWbBGrSAmQbRN6Yce5akmKnpawRY//e8nLhBtJYlUb3vqh3x/tu7ksftm
	6qN339BbF+KZof8YxqyJEt89Yq7kGlsKdbVN79vXFs5ZWParLqPGz99lT9OHqH/FFLItmH3a35X
	ToklU+MjN01d/52vGO1HtWset9RotHoC5Jnpane3WLD+cVX4TN5sAEIar/leUfMzMKMPgIFskWy
	JVjK/cEUqQV6IKJ1UtEd7U8XqJkdekKiaBPdJ222PiFWu34qdZsfB3AdbyOrUV8Wl9EGAVTH9a1
	1zG6LP+sjprW4Te7OkRkwyLey6sVmcAUFdkAtN6aH3EuwhD6Mn/fu6cM746+XFktQ5YRHAyPZby
	muu4ELEyrgLv21qJcy5ye8rGjg
X-Received: by 2002:a05:600c:3e88:b0:4b0:bc65:b9b5 with SMTP id 5b1f17b1804b1-4b963c8809emr71051325e9.35.1794231382337;
        Mon, 09 Nov 2026 05:36:22 -0800 (PST)
Received: from threadripper-fedora-workstation (cpe-109-60-83-229.zg3.cable.xnet.hr. [109.60.83.229])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b7efb1b64esm245418915e9.13.2026.11.09.05.36.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 05:36:20 -0800 (PST)
From: Robert Marko <robert.marko@sartura.hr>
To: linux@roeck-us.net,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	Steen.Hegelund@microchip.com,
	daniel.machon@microchip.com,
	UNGLinuxDriver@microchip.com,
	nicolas.ferre@microchip.com,
	claudiu.beznea@tuxon.dev,
	linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: luka.perkov@sartura.hr,
	Robert Marko <robert.marko@sartura.hr>
Subject: [PATCH v2 1/6] dt-bindings: hwmon: add Microchip LAN969x fan controller
Date: Mon,  9 Nov 2026 14:35:05 +0100
Message-ID: <20261109133609.810876-1-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.56.0
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

The LAN969x fan controller has a PWM output and tachometer input in a
register block separate from the Sparx5-compatible temperature sensor.
Describe it with its own compatible and binding.

The optional fan child specifies PWM period and polarity, tachometer
pulses per revolution, and thermal cooling levels.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
---
Changes in v2:
- Describe the fan controller in a separate binding and compatible.
- Keep the existing temperature-sensor binding unchanged.

 .../bindings/hwmon/microchip,lan9691-fan.yaml | 83 +++++++++++++++++++
 1 file changed, 83 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/microchip,lan9691-fan.yaml

diff --git a/Documentation/devicetree/bindings/hwmon/microchip,lan9691-fan.yaml b/Documentation/devicetree/bindings/hwmon/microchip,lan9691-fan.yaml
new file mode 100644
index 0000000000000..0b7d38a6d20ae
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/microchip,lan9691-fan.yaml
@@ -0,0 +1,83 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/hwmon/microchip,lan9691-fan.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Microchip LAN969x Fan Controller
+
+maintainers:
+  - Robert Marko <robert.marko@sartura.hr>
+
+description: |
+  LAN969x fan controller with a PWM output and tachometer input. The fan
+  child's pwms property references this node to specify the PWM period and
+  polarity.
+
+properties:
+  compatible:
+    const: microchip,lan9691-fan
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: System reference clock
+
+  '#pwm-cells':
+    const: 2
+    description: |
+      Number of cells in a PWM specifier.
+      - cell 0: PWM period in nanoseconds
+      - cell 1: PWM polarity: 0 or PWM_POLARITY_INVERTED
+
+  fan:
+    $ref: fan-common.yaml#
+    unevaluatedProperties: false
+
+    properties:
+      cooling-levels:
+        description:
+          PWM duty-cycle values corresponding to thermal cooling states.
+        items:
+          maximum: 255
+
+      pulses-per-revolution:
+        minimum: 1
+        maximum: 4
+        default: 2
+
+    required:
+      - pwms
+
+    dependencies:
+      '#cooling-cells':
+        - cooling-levels
+      cooling-levels:
+        - '#cooling-cells'
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - '#pwm-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/pwm/pwm.h>
+
+    fanctrl: fan-controller@e2010348 {
+        compatible = "microchip,lan9691-fan";
+        reg = <0xe2010348 0xc>;
+        clocks = <&sys_clk>;
+        #pwm-cells = <2>;
+
+        fan {
+            pwms = <&fanctrl 40000 PWM_POLARITY_INVERTED>;
+            cooling-levels = <0 128 192 255>;
+            #cooling-cells = <2>;
+        };
+    };
-- 
2.56.0

