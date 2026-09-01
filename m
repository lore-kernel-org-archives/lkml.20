Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FC883890F3
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 17:04:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788282283; cv=none; b=Kv1hPersMHXx1FkONX539oJVE/6PQEJlNCyX9Hbdy0bKgEy4tFSjqN8TKZOunq1FcgzDUCmW5x49RIELGZqYwCMz6zC6lztN8tPF06v1HAo7lfyEU4BM9jerLg6l54EMoSkFlFa5xvfuqz9ch9muxFSW0iM12C0fzBT9qPz0hbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788282283; c=relaxed/simple;
	bh=1X/qnV8vzg9tJPFlS6BMkOFMp3DyOY/TrtNCEvo4TAE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=pYVHnv5X6U0PH+i4Kp/2ldq7doOL6QBNW7UNgCCLIoSO1N2y3qo+MLgyXnDWd9wwntxA2U4g/fzXIAT8Rz/UO60cfAWMiWX7lXmlfZ94jg4zE77l8G/9xcOWDueSo7YAVCdnGRZygPceFBTwX/3xDsJqX37SzZ5i800y9stP00w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=o7oUPXAF; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="o7oUPXAF"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2d71d1cc8b2so60725ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 10:04:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788282280; x=1788887080; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=uWnlK88LsKs7/tUdroGlxm7SknJObd+rEmQrujEmjq0=;
        b=o7oUPXAFV8WedSg5bR9Tp4xVp4I+77ykHBqL+q8Kw0oL8/S7QEC+J29Hi8fEsMN7GY
         EmSJTQ0qFiY9kTcV+Ju4JE6IYjPj393C4AiDfgOtHFZOdRPhi2t2nh0a+3vZNSsfT5bz
         0LBThDSydiITC0Ltkk73MlYO5QzOpQraSYrDlWTBDDx3zvcf6bDbIEmNM6dhXlHnXXIb
         ZLhXtvCKuk/ykCQCgx3tDN9DsJ1fmA9KWtFGXPSmxy0EHvhIXvHaAJMwgXcLfn9WSoxF
         HCMHOMznTt/TUB0qTQK+pAWV5bUW4kUmnQRnEuXLimUe2BKxwY+YqzDjo/99Zz04e2xf
         pLtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788282280; x=1788887080;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uWnlK88LsKs7/tUdroGlxm7SknJObd+rEmQrujEmjq0=;
        b=FltTBWlIt94+XphDQtq8dRS7vPkut1pBzT4iXOnis5aj9URlPXSAoXvMwdwRHBNPF9
         6gZp1KSBxUCBgtE39KBVexVYN9mpshvgl/dnXfaa1Qn48GUrUnb/Xm13suuVo2MDOG5F
         p2Q9aUEqW9kE+gAfzrPbM2P8SNKpvBzXKhBgQi5e4ZF48Usm9bb/4PEsRLnNOshXRF9e
         Z0RHV+cHh3/l0mzOj0/XtzODN6KTLDhuVO15j/Le6YKtPkOB9Q6Tv/gVwYc8Aerj7rTH
         zFWeTjIZlkgpHgAbQoyDOAf0z2oq1bm931EDdR+I9eqO3F9aF7oAwC3ZG8hLSRYMmoNs
         ZLRw==
X-Forwarded-Encrypted: i=1; AKwUvBzIbh9onnpyCPph1+3PsiGdgRs3BwbmY3Yq0D2MAtX7mMpcuommQTuJeWkF/gZCkJrBxWwlXQQRk4P1W+A=@vger.kernel.org
X-Gm-Message-State: AFuF++lyNocvwsdRgH2rl9LHUaeZFNc4B8yOYVE8pti2PcUlCAyKq3XQ
	IRC9F8smTNgZvkQqUtUZz7ZUY1QIKymCs6mMfUhmoaBTfjziXPqq8eun
X-Gm-Gg: AYBFou3rKozUBUb685OGz6vqX8eNIyXChv/6i+Y3hODxGGYKRfOsPUG3qEVjAwfwGwQ
	spKjj2fkaKmrfrSDk1elc5WzIM6T9GkwRsI/ASCVpXdLAs6i1fPmAqGev3p7O6FNQaVHI5Wag40
	FavdzxoQ7GR0ZLZx7e9yD/PTpiUbiNxheRvQZDw1hlFUpNeYELkcjk+kQsNv+YqpXkfBaxO5L+q
	9b7YCf+7ktogvQwLPCvKtItjUV9pnxhaIdFPSc0hmmXghrvK0Y64IC+7MncNtjXTMelVzkdAIOQ
	Y6euCJ/Ic2uGlVpjCuPNlnsCYRixYtyRpTLOyUM8AvuZs/mrn1dO4RGYeGsDn0ThxDTWBwOUl3B
	VTB/UEFKEtwagT1RRVPeggiiJV8jixL3tb4Ne8Uii3FaD5sSbqTlpoziWUArl2rzH3/OouSlImY
	HHaufRdQztRjAzxHqWgMLRFNyKiCqQj4+LMQTvSny1VfAL+IgFTh9ZupZhikIxD8St9ZOKdK8Of
	T29xyg=
X-Received: by 2002:a17:902:e54e:b0:2d9:2ff6:2497 with SMTP id d9443c01a7336-2d92ff6258fmr185049165ad.13.1788282279845;
        Tue, 01 Sep 2026 10:04:39 -0700 (PDT)
Received: from inhnjlux1020.ls.ege.ds ([2406:b400:53:5146:59ac:3f4b:833e:8027])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-32b26fd7edbsm29492199eec.5.2026.09.01.10.04.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 10:04:38 -0700 (PDT)
From: Udaya Kiran Challa <challauday369@gmail.com>
To: lee@kernel.org,
	pavel@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: skhan@linuxfoundation.org,
	me@brighamcampbell.com,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Udaya Kiran Challa <challauday369@gmail.com>
Subject: [PATCH v3] dt-bindings: leds: lacie,netxbig-leds: Convert to DT schema
Date: Tue,  1 Sep 2026 22:33:58 +0530
Message-Id: <20260901170358.176103-1-challauday369@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert lacie,netxbig-leds devicetree binding from legacy
text format to DT schema.

Signed-off-by: Udaya Kiran Challa <challauday369@gmail.com>
---
Changelog:
Changes since v2:
- Add reference to led common.yaml
- Drop type for all common properties

Link to v2:https://lore.kernel.org/all/20260821123723.198286-1-challauday369@gmail.com/

Changes since v1:
- Use pattenProperties for LED child nodes instead of additionalProperties
- Explicitly list the two optional properties supported by the binding
- Place the top-level required block after child-node definition

Link to v1:https://lore.kernel.org/all/20260820150223.108374-1-challauday369@gmail.com/
---
 .../bindings/leds/lacie,netxbig-leds.yaml     | 139 ++++++++++++++++++
 .../devicetree/bindings/leds/leds-netxbig.txt |  92 ------------
 2 files changed, 139 insertions(+), 92 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/leds/lacie,netxbig-leds.yaml
 delete mode 100644 Documentation/devicetree/bindings/leds/leds-netxbig.txt

diff --git a/Documentation/devicetree/bindings/leds/lacie,netxbig-leds.yaml b/Documentation/devicetree/bindings/leds/lacie,netxbig-leds.yaml
new file mode 100644
index 000000000000..5cb2eaf74d1a
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/lacie,netxbig-leds.yaml
@@ -0,0 +1,139 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/leds/lacie,netxbig-leds.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: LaCie/Seagate netxbig CPLD LEDs
+
+maintainers:
+  - Simon Guinot <simon.guinot@sequanux.org>
+
+description: |
+  Binding for the CPLD LEDs (GPIO extension bus) found on some LaCie/Seagate
+  boards (Example: 2Big/5Big Network v2, 2Big NAS).
+
+properties:
+  compatible:
+    const: lacie,netxbig-leds
+
+  gpio-ext:
+    description: Phandle for the gpio-ext bus.
+    $ref: /schemas/types.yaml#/definitions/phandle
+
+  timers:
+    description: |
+      Timer array. Each timer entry is represented by three integers:
+      Mode (gpio-ext bus), delay_on and delay_off.
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+
+patternProperties:
+  "^(?!gpio-ext$|pinctrl-[0-9]+$)[a-z][a-z0-9]*(-[a-z0-9]+)+$":
+    type: object
+    $ref: common.yaml#
+    unevaluatedProperties: false
+
+    properties:
+      label: true
+      linux,default-trigger: true
+
+      mode-addr:
+        description: Mode register address on gpio-ext bus.
+        $ref: /schemas/types.yaml#/definitions/uint32
+
+      mode-val:
+        description: |
+          Mode to value mapping. Each entry is represented by two integers:
+          a mode and the corresponding value on the gpio-ext bus.
+        $ref: /schemas/types.yaml#/definitions/uint32-array
+
+      bright-addr:
+        description: Brightness register address on gpio-ext bus.
+        $ref: /schemas/types.yaml#/definitions/uint32
+
+      max-brightness:
+        description: Maximum brightness value.
+        $ref: /schemas/types.yaml#/definitions/uint32
+
+    required:
+      - mode-addr
+      - mode-val
+      - bright-addr
+      - max-brightness
+
+required:
+  - compatible
+  - gpio-ext
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/leds/leds-netxbig.h>
+
+    netxbig-leds {
+        compatible = "lacie,netxbig-leds";
+
+        gpio-ext = <&netxbig_gpio_ext>;
+
+        timers = <NETXBIG_LED_TIMER1 500 500
+                  NETXBIG_LED_TIMER2 500 1000>;
+
+        blue-power {
+            label = "netxbig:blue:power";
+            mode-addr = <0>;
+            mode-val = <NETXBIG_LED_OFF 0
+                        NETXBIG_LED_ON 1
+                        NETXBIG_LED_TIMER1 3
+                        NETXBIG_LED_TIMER2 7>;
+            bright-addr = <1>;
+            max-brightness = <7>;
+        };
+        red-power {
+            label = "netxbig:red:power";
+            mode-addr = <0>;
+            mode-val = <NETXBIG_LED_OFF 0
+                        NETXBIG_LED_ON 2
+                        NETXBIG_LED_TIMER1 4>;
+            bright-addr = <1>;
+            max-brightness = <7>;
+        };
+        blue-sata0 {
+            label = "netxbig:blue:sata0";
+            mode-addr = <3>;
+            mode-val = <NETXBIG_LED_OFF 0
+                        NETXBIG_LED_ON 7
+                        NETXBIG_LED_SATA 1
+                        NETXBIG_LED_TIMER1 3>;
+            bright-addr = <2>;
+            max-brightness = <7>;
+        };
+        red-sata0 {
+            label = "netxbig:red:sata0";
+            mode-addr = <3>;
+            mode-val = <NETXBIG_LED_OFF 0
+                        NETXBIG_LED_ON 2
+                        NETXBIG_LED_TIMER1 4>;
+            bright-addr = <2>;
+            max-brightness = <7>;
+        };
+        blue-sata1 {
+            label = "netxbig:blue:sata1";
+            mode-addr = <4>;
+            mode-val = <NETXBIG_LED_OFF 0
+                        NETXBIG_LED_ON 7
+                        NETXBIG_LED_SATA 1
+                        NETXBIG_LED_TIMER1 3>;
+            bright-addr = <2>;
+            max-brightness = <7>;
+        };
+        red-sata1 {
+            label = "netxbig:red:sata1";
+            mode-addr = <4>;
+            mode-val = <NETXBIG_LED_OFF 0
+                        NETXBIG_LED_ON 2
+                        NETXBIG_LED_TIMER1 4>;
+            bright-addr = <2>;
+            max-brightness = <7>;
+        };
+    };
diff --git a/Documentation/devicetree/bindings/leds/leds-netxbig.txt b/Documentation/devicetree/bindings/leds/leds-netxbig.txt
deleted file mode 100644
index 5ef92a26d768..000000000000
--- a/Documentation/devicetree/bindings/leds/leds-netxbig.txt
+++ /dev/null
@@ -1,92 +0,0 @@
-Binding for the CPLD LEDs (GPIO extension bus) found on some LaCie/Seagate
-boards (Example: 2Big/5Big Network v2, 2Big NAS).
-
-Required properties:
-- compatible: "lacie,netxbig-leds".
-- gpio-ext: Phandle for the gpio-ext bus.
-
-Optional properties:
-- timers: Timer array. Each timer entry is represented by three integers:
-  Mode (gpio-ext bus), delay_on and delay_off.
-
-Each LED is represented as a sub-node of the netxbig-leds device.
-
-Required sub-node properties:
-- mode-addr: Mode register address on gpio-ext bus.
-- mode-val: Mode to value mapping. Each entry is represented by two integers:
-  A mode and the corresponding value on the gpio-ext bus.
-- bright-addr: Brightness register address on gpio-ext bus.
-- max-brightness: Maximum brightness value.
-
-Optional sub-node properties:
-- label: Name for this LED. If omitted, the label is taken from the node name.
-- linux,default-trigger: Trigger assigned to the LED.
-
-Example:
-
-netxbig-leds {
-	compatible = "lacie,netxbig-leds";
-
-	gpio-ext = &gpio_ext;
-
-	timers = <NETXBIG_LED_TIMER1 500 500
-		  NETXBIG_LED_TIMER2 500 1000>;
-
-	blue-power {
-		label = "netxbig:blue:power";
-		mode-addr = <0>;
-		mode-val = <NETXBIG_LED_OFF 0
-			    NETXBIG_LED_ON 1
-			    NETXBIG_LED_TIMER1 3
-			    NETXBIG_LED_TIMER2 7>;
-		bright-addr = <1>;
-		max-brightness = <7>;
-	};
-	red-power {
-		label = "netxbig:red:power";
-		mode-addr = <0>;
-		mode-val = <NETXBIG_LED_OFF 0
-			    NETXBIG_LED_ON 2
-			    NETXBIG_LED_TIMER1 4>;
-		bright-addr = <1>;
-		max-brightness = <7>;
-	};
-	blue-sata0 {
-		label = "netxbig:blue:sata0";
-		mode-addr = <3>;
-		mode-val = <NETXBIG_LED_OFF 0
-			    NETXBIG_LED_ON 7
-			    NETXBIG_LED_SATA 1
-			    NETXBIG_LED_TIMER1 3>;
-		bright-addr = <2>;
-		max-brightness = <7>;
-	};
-	red-sata0 {
-		label = "netxbig:red:sata0";
-		mode-addr = <3>;
-		mode-val = <NETXBIG_LED_OFF 0
-			    NETXBIG_LED_ON 2
-			    NETXBIG_LED_TIMER1 4>;
-		bright-addr = <2>;
-		max-brightness = <7>;
-	};
-	blue-sata1 {
-		label = "netxbig:blue:sata1";
-		mode-addr = <4>;
-		mode-val = <NETXBIG_LED_OFF 0
-			    NETXBIG_LED_ON 7
-			    NETXBIG_LED_SATA 1
-			    NETXBIG_LED_TIMER1 3>;
-		bright-addr = <2>;
-		max-brightness = <7>;
-	};
-	red-sata1 {
-		label = "netxbig:red:sata1";
-		mode-addr = <4>;
-		mode-val = <NETXBIG_LED_OFF 0
-			    NETXBIG_LED_ON 2
-			    NETXBIG_LED_TIMER1 4>;
-		bright-addr = <2>;
-		max-brightness = <7>;
-	};
-};
-- 
2.34.1

