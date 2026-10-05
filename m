Received: from mail-dy2-f43.google.com (mail-dy2-f43.google.com [74.125.229.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1334535C6A7
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 18:45:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791225916; cv=none; b=Xni7Bdtlm3UeI3H49w8y0ikSz4DXmwhWbRzoZ+N7Ey8JyQSCUMnI7qgaHJ8u9lPsHCegEOmUdBLADiqwrL8VbE1ygs88sDi9yE5ksiS4tAL+uewPlNiX0LyUgxMtDonGLraZ6J8IiRVWS+itA0IPgoZAhiquZpmT/ZoVcp9YQPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791225916; c=relaxed/simple;
	bh=Pa/B/6lzvNosJmOlBb1hGpthqBVdJojogY7Q5t5iEpg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=S15Iwft3i8APsEO8lO94zFX0zQa3VpsDg+GCmvI2Xgx3QpcnjIUIhed0O4j/dFBEGX2Ui+emHAfU+TAfvbh5DXEi0wwZ2eSBsvDTz8cRrtsJWewzzx5eWF9oxQ9uN+PjyaWghKm+uhgBtPVFJO3sSXSjDlNCPiKeJCzqjrvYSXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ktob5S+q; arc=none smtp.client-ip=74.125.229.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ktob5S+q"
Received: by mail-dy2-f43.google.com with SMTP id 5a478bee46e88-34b3a9cd8edso1067042eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 11:45:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791225914; x=1791830714; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=oKRGgL1d9laQKntKJ5ZCtPSXyeLDiiH4qMSXoJCCJ0Y=;
        b=ktob5S+qXBoaZjJRjkOZIopPZ/AeuYn4NIJ3BjKMQ6L4z5dhODGmWMNsImwQ7wWhou
         YAsUKB+Yck70JIykFYpLcIOKEaRX84NFcofrulbTcKl7E6Z0pnyGKzuMrOuOoLSxxMSG
         FpNc8Nu28eg6qQT16aWxXB9hMBq0raKXZVmR+6NuIY9obMXwLpdqLy6WWGeIuKnIklHe
         QWNvcBhjeSrNvAZF9XoBQ/FpHJqmoIb5uIvb2dQTGY3K4tflHRPf0oY3CFRK5+wTB+FZ
         KM6kihhAwB3VJJTNYslqoxaiUzY0HbhVZJm5XcBIwQGTNg3ETBqtcp6zTV3X9+xRKVQ/
         9ecQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791225914; x=1791830714;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oKRGgL1d9laQKntKJ5ZCtPSXyeLDiiH4qMSXoJCCJ0Y=;
        b=WxIvoYlz2B7/GriamN2IX8ygLP0Eog65QnzMp5JddX4nEE10kW/k/PuJhdfIU/ZtHS
         U9n45LqsKMAl+BkMqdS0YJLnl5T6I1cDPSNoeN6eJfmOm4MQRe32aRQjFNdE4WMx1XIg
         dOPZJYebA+cnqxhkSidHACipu/sze80xkJ6Z8RIBZ1MfTO++vpHyiOirjRV0jaJis4Rt
         +SuU3fTNrKfqfRdqSmybq2oQdAnJE2fIj33ygAy8cGHK4m8yG9RqWPGkTA4muXDnDQ76
         T4rdrLVe3rkJQaGSRLBEPRUyMTgHQiBofJDh1XG4eRu4JkY/fCvaDNi5YLowCfuey+sS
         3afQ==
X-Forwarded-Encrypted: i=1; AKwUvBwJ4xy839Oofk7ld3DXXaFFZfY/OedsjRkt/TfUu6Mm4fpiHzfbnHBPglMlzW8bDCMYrLbjbJetxy1ZlnQ=@vger.kernel.org
X-Gm-Message-State: AFuF++mJEYnCoF1NT3XCZF5dUq19FgZ1sFmw7MUwdWY2aI97h+B3XV/P
	2IT0MDZnqWOar39vJs+B4hda0EC8ZqZeWLi5Y3drkTrkwbKzqjmxV/FA
X-Gm-Gg: AYBFou2zq6UjfNEpPyPK7jM12yQ2ySTjZtEu3oq+eeGop4W/2t8xw11IR1tdl4W99D1
	58V5nmffhFqxp62Uugf4BLlPJDN7bOXRErXbqCqWRARjhsF/DVUE1IrVdLh+ZWpCmF4WScbjGL8
	5vhIpKfQO0UTKd6E9ZlhX1rQmntmwqYkGYmGivJB7ea4fLKNkvnlGqAoyNeiEQpHfD1mFnVrSgI
	+R4LZF9cwEnwFVAJ7PcABunN+n85a59a6BAfFAHO2ig5siuQUSJYQ16zh9eiNYyZdc44jhJ22U/
	gvg1pM9NSzymo7ijfha9/OVK4kjL7tKrssVRdABLgqS0USFaeYEPLXdUf4Ypg5j/Sq7mrqqdWoo
	uYxlfIUwyfJ0URI0A6NOMuma7zHoeM2gegYbRykvE+o+FQoS5H7eUA9Xn/pmHpdTrV+PsCKpz3R
	Bl/b/mDpnGztLRjxrTy4w4Kok1nycvr266akVS6eZw+wWgOM+17Zy+28vK3ZQzdj0V5mcF4ksYf
	IfHGoq7vnqhdTfQ6D0ay3jObtJN
X-Received: by 2002:a05:7301:550e:b0:347:a3d9:dfa3 with SMTP id 5a478bee46e88-351450c21bbmr455348eec.7.1791225913995;
        Mon, 05 Oct 2026 11:45:13 -0700 (PDT)
Received: from inhnjlux1020.ls.ege.ds ([2406:b400:53:bc23:13ce:62d6:5ad0:c521])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-35146a2add7sm191248eec.13.2026.10.05.11.45.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 11:45:12 -0700 (PDT)
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
Subject: [PATCH v4 1/2] dt-bindings: leds: lacie,netxbig-leds: Convert to DT schema
Date: Tue,  6 Oct 2026 00:14:28 +0530
Message-Id: <20261005184428.251868-1-challauday369@gmail.com>
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
Changes since v3:
- Correct patternProperties to use generic led node names
- Rename example device name to leds
- Drop optional subnode properties

Link to v3:https://lore.kernel.org/all/20260901170358.176103-1-challauday369@gmail.com/

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
 .../bindings/leds/lacie,netxbig-leds.yaml     | 136 ++++++++++++++++++
 .../devicetree/bindings/leds/leds-netxbig.txt |  92 ------------
 2 files changed, 136 insertions(+), 92 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/leds/lacie,netxbig-leds.yaml
 delete mode 100644 Documentation/devicetree/bindings/leds/leds-netxbig.txt

diff --git a/Documentation/devicetree/bindings/leds/lacie,netxbig-leds.yaml b/Documentation/devicetree/bindings/leds/lacie,netxbig-leds.yaml
new file mode 100644
index 000000000000..fe47c12044da
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/lacie,netxbig-leds.yaml
@@ -0,0 +1,136 @@
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
+    description:
+      Timer array. Each timer entry is represented by three integers -
+      Mode (gpio-ext bus), delay_on and delay_off.
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+
+patternProperties:
+  "^led-[a-z0-9]+$":
+    type: object
+    $ref: common.yaml#
+    unevaluatedProperties: false
+
+    properties:
+      mode-addr:
+        description: Mode register address on gpio-ext bus.
+        $ref: /schemas/types.yaml#/definitions/uint32
+
+      mode-val:
+        description:
+          Mode to value mapping. Each entry is represented by two integers -
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
+    leds {
+        compatible = "lacie,netxbig-leds";
+
+        gpio-ext = <&netxbig_gpio_ext>;
+
+        timers = <NETXBIG_LED_TIMER1 500 500
+                  NETXBIG_LED_TIMER2 500 1000>;
+
+        led-0 {
+            label = "netxbig:blue:power";
+            mode-addr = <0>;
+            mode-val = <NETXBIG_LED_OFF 0
+                        NETXBIG_LED_ON 1
+                        NETXBIG_LED_TIMER1 3
+                        NETXBIG_LED_TIMER2 7>;
+            bright-addr = <1>;
+            max-brightness = <7>;
+        };
+        led-1 {
+            label = "netxbig:red:power";
+            mode-addr = <0>;
+            mode-val = <NETXBIG_LED_OFF 0
+                        NETXBIG_LED_ON 2
+                        NETXBIG_LED_TIMER1 4>;
+            bright-addr = <1>;
+            max-brightness = <7>;
+        };
+        led-2 {
+            label = "netxbig:blue:sata0";
+            mode-addr = <3>;
+            mode-val = <NETXBIG_LED_OFF 0
+                        NETXBIG_LED_ON 7
+                        NETXBIG_LED_SATA 1
+                        NETXBIG_LED_TIMER1 3>;
+            bright-addr = <2>;
+            max-brightness = <7>;
+        };
+        led-3 {
+            label = "netxbig:red:sata0";
+            mode-addr = <3>;
+            mode-val = <NETXBIG_LED_OFF 0
+                        NETXBIG_LED_ON 2
+                        NETXBIG_LED_TIMER1 4>;
+            bright-addr = <2>;
+            max-brightness = <7>;
+        };
+        led-4 {
+            label = "netxbig:blue:sata1";
+            mode-addr = <4>;
+            mode-val = <NETXBIG_LED_OFF 0
+                        NETXBIG_LED_ON 7
+                        NETXBIG_LED_SATA 1
+                        NETXBIG_LED_TIMER1 3>;
+            bright-addr = <2>;
+            max-brightness = <7>;
+        };
+        led-5 {
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

