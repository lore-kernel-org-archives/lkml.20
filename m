Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794413796;
	b=ivo0cOt+PyNqjqEB8gTF51Yj2nhqlK4U4qNbmP60H1FbGZLMqx8vbpGmurKRE9dKEXHv
	 bO/C9Rtokmdu830q8R2v0maggUAKu78oKhuBIrsZqkgxAP6P1On+7EkQiIGih3yiAiE6z
	 w5Xpa5QgkT19x27WjVmbIAXLrNHG0mtHJySBlA3eOZKjOJ3obv1IjDLgQ4A6d/HqdKuhF
	 NyGKgroogob6sMCmxyaEnGA72WSBeGoYpM1odBJ182CnrwyOSr0rpmvdPMIrW0q9Hrp4T
	 BK7I5sEa/Fm5ts2SVt4kKPXItosBC56MIE9qQnKbe++K5LJJr1rB9OdrZxRt+N68WrQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794413796;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=mQpRUZlaWkX1Ytw6oqJM/cfVbl8bbjDHgz7gYq9iuk8=;
	b=IkxE5qP3kCDLwBxH8npp5HJb2vSKmVkio7mw068mXPFwclB6ygrzMhC9Utj1GxGRhFev
	 OY/K03Zyz+hwIzQxaZJnEMDjDXViCeBEkuifvz2fSbRyb+OPevQuuFuhdcs8Lzofr1Ens
	 /2JeHxdGF95EJZoo7UKTaHocJg+NjWNkUzYFh5FH1iwEosKOP7DLbcZ1ASzj36iMbSu+X
	 lRxV3bOXqGfdpaL836+zIceKELVwPw6B6s7mdbH/Vd1PthM2rzWoILCtQzDTplQ20q3tb
	 3ZI/OFcAA3K3zZkk/+5GNH2QPVAY2dmvYBts+QtbkoFxQ258dsW29rcln8CxJlrj2BQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sartura.hr;
	spf=pass smtp.mailfrom=sartura.hr;
	dkim=pass header.d=sartura.hr header.i=@sartura.hr header.a=rsa-sha256 header.s=sartura header.b=xCGgpKHO;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B9CA606A336
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 16:16:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8B9CA606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.a=rsa-sha256 header.s=sartura header.b=xCGgpKHO
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a20bde60a0so34083775e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 08:16:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1794413794; x=1795018594; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mQpRUZlaWkX1Ytw6oqJM/cfVbl8bbjDHgz7gYq9iuk8=;
        b=xCGgpKHON65vGWLu5CG1Egngwk2+BdTi+fnSsSL8D0x8Xqivs1HujwomCjDv2PPMZR
         q1VSZnruWiOoG/A8ksoUMLToYXYFzCXX6Wka8yk3Bkz6oolx7esGfrc0u+7+e/NfowS6
         K3blGXurwKXyACJIfPTQ62IhUwWmSqR9Ajgri9lqTE5lEYbTPQIItU3FfyeA08d0SYEN
         RmPhSHR0/kChKXvGKMKn9Hc3XMRZgExRnHHXpFfOTvW9IWTYHWQGFTPhIZ+PQkKgxdfF
         zfhdOksppr/kElqDPx/cr3e1HM7bkbGnizpDpDOZxpYxaeW5nbN0SDGeiE6q4MfVH6+N
         NbyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794413794; x=1795018594;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mQpRUZlaWkX1Ytw6oqJM/cfVbl8bbjDHgz7gYq9iuk8=;
        b=e4KfGDUFq7hezcloF9gOWAsZEsIjOET2tqk+YXGXW1ZRZUsYT6v5ii7s53eV2xel9t
         i74+XNsqAU5noJTQiBmkRTfD4pTLFiUtCJh1LeGnH2bLzOTZ+T/q/i48ili2yXl+qsoO
         PcHSZUrfy+Bcv3jzdZNmMdwUbfkf1/jS9AKl8jDBfP24HYSfzgcGxOwoIkZKYFvUPhhj
         GAWZHDrjKh9iuUu3GgZFYv7sUwy8vXt/3nlZbrI4VLahGfRiilrlrF6McSwiUSegPCm/
         HF6/gR0NZolsZ2RgvN88zkepzlq+qEpAXG2nhoQWt9HFzLPa3C7styCuwkSEMTdDzhgd
         YFGQ==
X-Forwarded-Encrypted: i=1; AL+hErHDnwkWTZ+Ulr+JT7fe36O8WuG1wZqNIWGedaBxKFGn8IpbWxx+YVihHSvPfbOI6QwEAOssubGyGmPVu/g=@vger.kernel.org
X-Gm-Message-State: APuU4Z/ldVrHtqu59OrlM0rK6au7TOBz/CYEYqc9PfC1xH6hhzpZJdFK
	bELSxmWAUVtNw6WroZ7VyPmG/oZQxFo0Xky7PHeoUzI7fX8qvznFylm0gVTdYbVdHF8=
X-Gm-Gg: AYBFou1XpY60ecMhd/BYp8Q9cdShrrZBkOn3Cv+VG46pXtlGkTV+mZ+GGgpKD0u5yWs
	nhsW1XLF5OqnmlGLHhVvXQuXzsVOPC/un73pQw90etgwfK6Eg2JSOqFcEc7RnVkGnRn5gCygbuI
	jWqnz4sLSqDSkD+oHYhsYuke2wwNpJftQRDvMn+NYCNU46tlPvB/mugu5r7BRU6IYXLYlFoJTP5
	5AUcJyyPJnXBAYlTchkwEGhaEpw9Lmj3ionsY5tfe37BlXxtfeHlIMvwaZ78swiS59pgA+645tA
	TRW0VtzjQYodg3bKbkdUYZPduAmlrGwMzdhpCqE/ikKafe40YBuizw+wWPd6nSv16i8pyGWoDU1
	RuIiBa3c7ds4naVhjCPHyjqpD8d7rMt+z4ayIl4Eph4T1Sts3tAl22ei0R3LMAbN11vL/Y5MNhl
	GWVMAThTbXoqNVcJmyW/HrboDXkSFbKUPg3rNW1KIo/mk8zA0ruxB6jiv1FntLIM3L0GFn/lcsj
	dIN54ubBLnvLCsTJDSg78zHUn75KG33UNUT0Fo0LZv0Ge86HSwQM/yU0VZ8MwKcn+OIJsq/a754
	10jOycs1ZSJF7YuStgsqS2+d9uCHQBIwSBUzGU7Nb3i+p+z6Nah1qtQPzBmjQsXRmzeUqeUiZlP
	GDOvRuKYPAQPfTqeSOwm2Z5eHWLmMlwDpWDunwjm6/Qfq//eLIpRQd8X6909MWdNkxwngHEJdoH
	/4H99cOnv3rts+V9K6hje1VTQ=
X-Received: by 2002:a05:600c:348d:b0:4a2:148b:c88c with SMTP id 5b1f17b1804b1-4ba0935cdafmr48000605e9.8.1794413793928;
        Wed, 11 Nov 2026 08:16:33 -0800 (PST)
Received: from threadripper-fedora-workstation (d-zg1-240.globalnet.hr. [213.149.36.254])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4c52fd01sm8374925e9.4.2026.11.11.08.16.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 08:16:31 -0800 (PST)
From: Robert Marko <robert.marko@sartura.hr>
To: linux@roeck-us.net,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	nicolas.ferre@microchip.com,
	claudiu.beznea@tuxon.dev,
	linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: luka.perkov@sartura.hr,
	Robert Marko <robert.marko@sartura.hr>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v3 2/4] dt-bindings: hwmon: add Microchip LAN969x fan controller
Date: Wed, 11 Nov 2026 17:12:46 +0100
Message-ID: <20261111161619.232141-2-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261111161619.232141-1-robert.marko@sartura.hr>
References: <20261111161619.232141-1-robert.marko@sartura.hr>
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

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Robert Marko <robert.marko@sartura.hr>
---
Changes in v3:
- Drop the unnecessary literal-style description marker.
- Inherit pulse-count bounds from fan-common.yaml.
- Require cooling-levels only when #cooling-cells is present.
- Add Conor Dooley's Acked-by tag.

Changes in v2:
- Describe the fan controller in a separate binding and compatible.
- Keep the existing temperature-sensor binding unchanged.

 .../bindings/hwmon/microchip,lan9691-fan.yaml | 79 +++++++++++++++++++
 1 file changed, 79 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/microchip,lan9691-fan.yaml

diff --git a/Documentation/devicetree/bindings/hwmon/microchip,lan9691-fan.yaml b/Documentation/devicetree/bindings/hwmon/microchip,lan9691-fan.yaml
new file mode 100644
index 0000000000000..6a8d05a62f7c3
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/microchip,lan9691-fan.yaml
@@ -0,0 +1,79 @@
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
+description:
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
+        default: 2
+
+    required:
+      - pwms
+
+    dependencies:
+      '#cooling-cells':
+        - cooling-levels
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

