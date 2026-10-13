Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDD1E389104
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 12:57:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791896271; cv=none; b=UfhBt/gu5yxto80rixx62/+CnMH6dQPi8TezM7XdnrYehqOmg93b4fSMX8jntGJZTyMV8MKWofP9SHyAHllN42xSKa5i4sZf9NiWAfPDJibXnd/0FLhWoM2dn2XJdwz8DXMold057AshYpq9kEiQP1FWTx4RpdUGJ2qZnEwMP1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791896271; c=relaxed/simple;
	bh=lkbzM8u6Ksurvv8STfByGe12+IIc/BqAKbB9v2Dn01E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eTnpmag9gzvp+wWXEx9UJWREPDNw0EmHUu9pwlYYC27OCpwitp0EpUEGUrwROGW5j9bvMni+Xf5621MAIZbojiQWUSHySOPi6pNzogj2OIHDm7af+ah+p3Z9jTEFO93Chkxw/2dRF0RydOkI4KENSK/VnKIlaKOufE4q6I5FymQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr; spf=pass smtp.mailfrom=sartura.hr; dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b=eikGID/a; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b="eikGID/a"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c3762b0d45aso65909866b.3
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 05:57:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1791896268; x=1792501068; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=uhznKuYnN5ZlVlaqPy/qLcJWMqnPhwIquwlakdmcYyI=;
        b=eikGID/a0PzhTKWjihDtoyGQCpXMB6PZTPzrpqyaMSwJKawTd0t3thc3ppO+PSwqyd
         bNOelHj0fO0PbISxFPQ2dPsGcOhUW8G7LwlLjnnBTzBCaGrV2e8xzVcAnmVu8urr2F10
         nGabXO/0Nr26GtQt0l7/MLhp3RBm7glj2UrsQZgeGXcSSxaHW6Sr+0pRD+UOJ54IQyJf
         vs2kIP56hqTpjMTzPikc2ETvpYLPoEW0ExEap978XaAzOzMRXpMB5xswSW33+1zwryW0
         ivMPkV5yUlvbaXSVfHgZiqfaV9id3l7ZCCbB0/92vJiQyCzHc4GHuVNDalykygPdp+rx
         IVAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791896268; x=1792501068;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uhznKuYnN5ZlVlaqPy/qLcJWMqnPhwIquwlakdmcYyI=;
        b=vE4AAKg0pW2VEO5mal7YpG3Rz/Ey0FFDQ2EtFd00TaKyvBjNIQkcZ8B/zjijfAwlve
         fHch6Ul5frxW6YsuuY+vn4ypllk+NkDRNEiHx1Vk4ha9KEWvwoNxUT82UAwLOz08SYg7
         bjldebXFdueqWu7x9QqHcNk9+wPWTbmT7SEnJ3s7BALdedZ6+rI+rT9N8xSFEc11WHEe
         lEHsx78K07K0l6NK54z73783BX0Wak0I7KkxlofZq4Ce8b0YCgd/L935yMtECFGjd1lO
         9OK5sqnFBjHkpu2OaOjrOzm/QjLJAi+u2wcPW7a0jHWWuvm/X4Np5Pn1H7reAOYHLF9I
         GFUA==
X-Forwarded-Encrypted: i=1; AKwUvBxNKVOIKSVGaLa+vTDLno4L70gwsAXprsoZsJFK7gGDGk7TxxAQs81s1D9vnJle+2hVdpiSAy49iQfSLOk=@vger.kernel.org
X-Gm-Message-State: AFq9FYJNBPAqUCWUqQ2WTGqw38A7rQ4EkhEz7POMj6Vc6Ww8HqXoP1Vx
	F+H3EP4z5xvMhT3KdUXTT0yZwAaScB9eaQ8vIji45D67v4AUXrXpCIluCzn2jFJq1nI=
X-Gm-Gg: AYBFou2rFoESL0m5iDklUNe+44tz72rdw6YdVPtaLtmGGgsrUB1bod7ifehiqRYxMuG
	4C9Sir5nmRIIAwGqOJkXu0Xi0CQMUVWmQnqaJWtss9W4wPHfrpHCCgoSu6EJ7YW1A5IQgVkHdeW
	7v9feWtvWCBnkBag+LVJQAEeIyrCt+vo23Br2ubtinfEEzt/8ZwL/y0XILpjhN2E2ZpKnt3KRTT
	kRcazuLajSoKmxwVSkSMsfCQ8r5b90asUT3yKCqUlqgYAXA30QYbrdwQhu5ClFnPUIdXB7dklEk
	lQ8Xdl7CBFD8HAGve63aKTX+W9P4nOVooEYhx2EMh8y9KiY7jlGNCc1O4d80YSlfF8j4U/BGDUm
	QSPZ1tRb+ORd/0E6iC97JwOBKAMSZ9adxG2JUjZdQfWd6IQiltqxFXfdAbS/EhDEfy3YRqAqh1H
	1HoMGt30d5/v95z/9vr7N8rrqeHFYL6jzmUZ7XslnrkV8smUz4pCuuZWSwRO34lOMh+OqlrCiY1
	Svt1wokbYuAPvmUxCFlDsN70ASXpyTxNQGVctlnEo8CyIDNt/1IHQs3EIJkN0D+OXJnam9yT1SS
	mGb8s9TNAHB5ixmHIfC83jTnfHF5xCY=
X-Received: by 2002:a17:906:e114:20b0:c33:62c0:d8cf with SMTP id a640c23a62f3a-c3362c15642mr504101666b.13.1791896268023;
        Tue, 13 Oct 2026 05:57:48 -0700 (PDT)
Received: from threadripper-fedora-workstation (d-zg2-045.globalnet.hr. [213.149.37.45])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c31a9ac9ecfsm605985766b.74.2026.10.13.05.57.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 05:57:46 -0700 (PDT)
From: Robert Marko <robert.marko@sartura.hr>
To: linux@roeck-us.net,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Steen.Hegelund@microchip.com,
	daniel.machon@microchip.com,
	UNGLinuxDriver@microchip.com,
	nicolas.ferre@microchip.com,
	claudiu.beznea@tuxon.dev,
	lars.povlsen@microchip.com,
	linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: luka.perkov@sartura.hr,
	Robert Marko <robert.marko@sartura.hr>
Subject: [PATCH 1/6] dt-bindings: hwmon: sparx5: add LAN969x fan controller
Date: Tue, 13 Oct 2026 14:56:25 +0200
Message-ID: <20261013125735.1542349-1-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

LAN969x integrates a PWM fan controller with a tachometer input in
addition to the Sparx5-compatible temperature sensor. Add a LAN969x
hardware-monitor compatible and describe the second register region.

Describe the fan as a child node using a two-cell PWM specifier for the
period and standard polarity flags. The child also carries the optional
tachometer pulses-per-revolution and thermal cooling properties.

Keep the existing microchip,lan9691-temp compatible for device tree ABI
compatibility.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
---
 .../bindings/hwmon/microchip,sparx5-temp.yaml | 90 ++++++++++++++++++-
 1 file changed, 87 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/hwmon/microchip,sparx5-temp.yaml b/Documentation/devicetree/bindings/hwmon/microchip,sparx5-temp.yaml
index 611fcadb1e771..e91c2a3ccd3c9 100644
--- a/Documentation/devicetree/bindings/hwmon/microchip,sparx5-temp.yaml
+++ b/Documentation/devicetree/bindings/hwmon/microchip,sparx5-temp.yaml
@@ -4,13 +4,15 @@
 $id: http://devicetree.org/schemas/hwmon/microchip,sparx5-temp.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Microchip Sparx5 Temperature Monitor
+title: Microchip Sparx5 Hardware Monitor
 
 maintainers:
   - Lars Povlsen <lars.povlsen@microchip.com>
 
 description: |
-  Microchip Sparx5 embedded temperature monitor
+  Microchip Sparx5 temperature monitor with a fan controller on LAN969x.
+  The fan child's pwms property references this node to specify the
+  PWM period and polarity.
 
 properties:
   compatible:
@@ -18,11 +20,19 @@ properties:
       - const: microchip,sparx5-temp
       - items:
           - enum:
+              - microchip,lan9691-hwmon
               - microchip,lan9691-temp
           - const: microchip,sparx5-temp
 
   reg:
-    maxItems: 1
+    minItems: 1
+    maxItems: 2
+
+  reg-names:
+    minItems: 1
+    items:
+      - const: temp
+      - const: fan
 
   clocks:
     items:
@@ -31,11 +41,67 @@ properties:
   '#thermal-sensor-cells':
     const: 0
 
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
 required:
   - compatible
   - reg
   - clocks
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: microchip,lan9691-hwmon
+    then:
+      properties:
+        reg:
+          minItems: 2
+        reg-names:
+          minItems: 2
+      required:
+        - '#pwm-cells'
+        - reg-names
+    else:
+      properties:
+        '#pwm-cells': false
+        fan: false
+        reg:
+          maxItems: 1
+        reg-names:
+          maxItems: 1
+
 additionalProperties: false
 
 examples:
@@ -46,3 +112,21 @@ examples:
         #thermal-sensor-cells = <0>;
         clocks = <&sys_clk>;
     };
+
+  - |
+    #include <dt-bindings/pwm/pwm.h>
+
+    hwmon: hwmon@e2020100 {
+        compatible = "microchip,lan9691-hwmon", "microchip,sparx5-temp";
+        reg = <0xe2020100 0xc>, <0xe2010348 0xc>;
+        reg-names = "temp", "fan";
+        #pwm-cells = <2>;
+        #thermal-sensor-cells = <0>;
+        clocks = <&sys_clk>;
+
+        fan {
+            pwms = <&hwmon 40000 PWM_POLARITY_INVERTED>;
+            cooling-levels = <0 128 192 255>;
+            #cooling-cells = <2>;
+        };
+    };
-- 
2.56.0

