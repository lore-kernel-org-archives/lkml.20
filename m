Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99A5348EBF1
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 17:35:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791912934; cv=none; b=ROUoGp1CkPYTGJg3/uo5z9XQSxvMK9Dt29fvyUUIYpKafaZowD/n31bI5FVtHSGMTpMn5Zry1uAfxstshIt+cMj7tLL3Z5zdZlwbZmOR4st20jSZxzYsUKHZ4pwNZ+9lkThXd896PYEzjqn8Wf7hO2vNtYMnXbaxWJZ3CcTbA6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791912934; c=relaxed/simple;
	bh=0ir6EEm9FNQCLp9OUbkjQzJH24SRp6mnaINdn/CT2yM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZeZjKHpiI9BOtAzO5z4PAcNc6sOofKh0wznTbE5ywbFHCAJsMOztP5bHWji6K0gVaR9g2q/BJ/oF+sFis23qu++DrTKhTAGbR4UtaKXFP6gKwZjXNpmqnApzd/YFtR99D/aPvGWTnM+Y3XhCbA/ZjZ6F6Bo8saWySBe78TkBfic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aVt2NfHt; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aVt2NfHt"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a02667ccebso23449235e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 10:35:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791912931; x=1792517731; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y460qay5LS+R/33REWXsFlmhxRCfcVfcAqdFzdNEv44=;
        b=aVt2NfHtP6jHB+WKrB7b+cZ/rrzgNrGpYjHqoGs1BQdg+0mXKgJRpf2ACXyyN7JJwh
         kvYeG6XV+LGF7LcVFJOKLcGzhyHLPd2kSt5CDFD0g/s2IFv6kwuffltnZxln9wHPo+jf
         x75omabmofoH9f/bkENX4SnegJE76RWNkbZiksRtMWV8OJQy8Q2gzkMkyja7MbQvKu3/
         HHrjRbFQKhRcm7ilBZz9vptGa5+6Bd7VWDx6PzIJe1/aLZQpyIUWAcHm2/ib8VEpElI0
         ozbZXnZ2rzWjDJSiCWttNmyGw8R1+SC+0hDj/wNe1EklyBjZsQkrucWR84Z4RS3kmQBj
         roiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791912931; x=1792517731;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Y460qay5LS+R/33REWXsFlmhxRCfcVfcAqdFzdNEv44=;
        b=BLtiEDJsI180x47EOuhnuo0X07SIwNzovDiFex3yjL5Ytp40xF5SDOaIEnOEiV3zHb
         0DYHzwvX9Q51YLUKskTmMWeqJ3w9Uwxw1Wi0rF/BfpMBfjW0Oy1FGGW0S4ZsoHC4MPDv
         snzzNIpZL+n59vyFo3gh3uRbBth4YnhAbNrlLAybdZZTHgErq/7AvrtRBnlSChSi2vml
         LC9t6vJelyteOZx+Bz+cyqniteuJD8+nwu+MJdE4SQcYAjiHPTC4YKzDsrYH6UWA7+hJ
         QgZitMXrt9kHq1bF8cvocSQu3JpIiCSBF1qLvcJFfRLZzeR6/W/mE1VW5ojYRwxjMQWw
         d7Fg==
X-Forwarded-Encrypted: i=1; AKwUvBwxgg8arGW/sH/Ya0NwtD845ZplNoPbh0EXR/teVBXJt1B8ECG21r+4LbG1n3FFlf3SNleuopixZuH2ZrI=@vger.kernel.org
X-Gm-Message-State: AFq9FYLvjLx+gRXthp15PcG168p6pvpttlicL2glOw17QI9gcT6WmDDz
	9gj0QGXdPfy+pMZX41Bs1+UMUPvO9VcLqjDyaTePwZj8buSP923o01Uz
X-Gm-Gg: AYBFou0jkKKUV8jGp3ry076BUa7rh4sSiozg536GUB9S/d300jeN0AU2P0oGYOj2Uie
	SrGilRaloPcWwqfxX6pDn5J5EGLM9rIc/VOf4a5rWAxWf2y1z1e1xh3uo/Lpz6zdRL0jl3k6Pmy
	pWjZz1D7GMyp3f7pm5I54DDkF2TrmnABnkC05l0oC3VLGOo47EUaQtJhsgu9Wckoxq7CYbwg2hS
	k9Yeom7M4Y2pc6VtHG97/uQoPAg5qjW+jxkAgETHcUnIM6Z7TZ9xq007KdOim//PLCRRE3NTO5g
	JY0vyu3wRH9WwzGf3qVOfVCjmyP5aS92/kBZew8Fh6SgwK5jyMlAeAbCa7z3A1cP7C0v8odNyPr
	ghT185XZ2SFk/rUxYaJwpebjusaIWAWNDQzue7zTR51JXg21NQdj/2loV/BR3Zp+5T2IMfMGh1D
	I6HLSwaKCMtb+ETz8Nk9BaLIc4Y3yWRAXb96PHHhbuZnWpxVhB6LjsatlfnRJUq8CHnHDnCgzeB
	d4s1o1djRgWm8QqWCWz8KCzo8JJYA==
X-Received: by 2002:a05:600c:64c8:b0:49d:1df6:2592 with SMTP id 5b1f17b1804b1-4a18e4c41b0mr240687655e9.21.1791912930626;
        Tue, 13 Oct 2026 10:35:30 -0700 (PDT)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18ca51465sm284127195e9.4.2026.10.13.10.35.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 10:35:30 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Sebastian Reichel <sre@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Ion Agorria <ion@agorria.com>,
	=?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
	Florian Krischer <florian.krischer@fkr.dev>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org,
	mfd@lists.linux.dev,
	linux-leds@vger.kernel.org,
	linux-pm@vger.kernel.org
Subject: [PATCH v11 1/7] dt-bindings: embedded-controller: document ASUS Transformer EC
Date: Tue, 13 Oct 2026 20:34:57 +0300
Message-ID: <20261013173504.451391-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261013173504.451391-1-clamor95@gmail.com>
References: <20261013173504.451391-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document embedded controller used in ASUS Transformer device series.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../asus,tf201-ec-pad.yaml                    | 119 ++++++++++++++++++
 1 file changed, 119 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/embedded-controller/asus,tf201-ec-pad.yaml

diff --git a/Documentation/devicetree/bindings/embedded-controller/asus,tf201-ec-pad.yaml b/Documentation/devicetree/bindings/embedded-controller/asus,tf201-ec-pad.yaml
new file mode 100644
index 0000000000000..60b6375864aaf
--- /dev/null
+++ b/Documentation/devicetree/bindings/embedded-controller/asus,tf201-ec-pad.yaml
@@ -0,0 +1,119 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/embedded-controller/asus,tf201-ec-pad.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ASUS Transformer's Embedded Controller
+
+description:
+  Several Nuvoton based Embedded Controllers attached to an I2C bus,
+  running a custom ASUS firmware, specific to the ASUS Transformer
+  device series.
+
+maintainers:
+  - Svyatoslav Ryhel <clamor95@gmail.com>
+
+properties:
+  compatible:
+    description:
+      The 'pad' suffix is used for the controller within the tablet, while
+      the 'dock' suffix refers to the controller in the mobile dock keyboard.
+    oneOf:
+      - enum:
+          - asus,sl101-ec-dock
+          - asus,tf101-ec-dock
+          - asus,tf201-ec-pad
+          - asus,tf600t-ec-dock
+          - asus,tf600t-ec-pad
+
+      - items:
+          - enum:
+              - asus,tf101g-ec-dock
+              - asus,tf201-ec-dock
+              - asus,tf300t-ec-dock
+              - asus,tf300tg-ec-dock
+              - asus,tf300tl-ec-dock
+              - asus,tf700t-ec-dock
+          - const: asus,tf101-ec-dock
+
+      - items:
+          - enum:
+              - asus,tf300t-ec-pad
+              - asus,tf300tg-ec-pad
+              - asus,tf300tl-ec-pad
+              - asus,tf700t-ec-pad
+          - const: asus,tf201-ec-pad
+
+      - items:
+          - enum:
+              - asus,tf701t-ec-dock
+          - const: asus,tf600t-ec-dock
+
+      - items:
+          - enum:
+              - asus,p1801-t-ec-pad
+              - asus,tf701t-ec-pad
+          - const: asus,tf600t-ec-pad
+
+  reg:
+    description:
+      The ASUS Transformer EC has a main I2C address and an associated
+      DockRAM device, which provides power-related functions for the
+      embedded controller. Both addresses are required for operation.
+    minItems: 2
+
+  reg-names:
+    items:
+      - const: ec
+      - const: dockram
+
+  interrupts:
+    maxItems: 1
+
+  request-gpios:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - reg-names
+
+allOf:
+  - $ref: /schemas/power/supply/power-supply.yaml
+  - if:
+      properties:
+        compatible:
+          not:
+            contains:
+              const: asus,tf600t-ec-dock
+    then:
+      required:
+        - interrupts
+        - request-gpios
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    i2c {
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      embedded-controller@19 {
+        compatible = "asus,tf201-ec-dock", "asus,tf101-ec-dock";
+        reg = <0x19>, <0x1b>;
+        reg-names = "ec", "dockram";
+
+        interrupt-parent = <&gpio>;
+        interrupts = <151 IRQ_TYPE_LEVEL_LOW>;
+
+        request-gpios = <&gpio 134 GPIO_ACTIVE_LOW>;
+
+        monitored-battery = <&dock_battery>;
+      };
+    };
+...
-- 
2.53.0

