Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BDF5430CDD
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 11:09:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792062576; cv=none; b=mDmMaX8dZhMKdDfeY0fPyEs3giJszZj59dFem5QXlcV5TywPPkD9MxzVACaWAHwMR0c84FRI9yWsX0Is/G72I0wEha3phzNwxP26zs21uPMQTok3AWbyn1u60t93OWWVDEP73xaP2mvQpx5YOqTjJGuBmvO+fM2DK+2HEzzPXbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792062576; c=relaxed/simple;
	bh=pKxqo2a8lR7KI9kYDWC2Cr540MwQu7AcYvHikWXJN0c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iCpXi9tuAclzqPSQEM9sLRt2pIsEYBs4aSwHoDyGZc7kqZhJxc/rnzh9rct6+7b775UIVp+nYT9fjKB0PgPFTr8mc8wq682MnvuZE/ql56hA/OOCWTc7i/vLtLkQJ2DwCxt1U9YAVSQBuYk4YrZl6KewFWRd3+NzzTkjyLvHF+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UGf+5lyK; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UGf+5lyK"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2e8da6ef7ddso13100525ad.3
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 04:09:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792062574; x=1792667374; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3blbaeYggHmVF464JV+Zlli+aD6d3bzh/Mw8o5F5mrY=;
        b=UGf+5lyKOwbTOvhV9L3VUYlXNw1KuVJNBXP7QEsNtQgDosUu2OIb6Z82kT2P0m7kvv
         ZE1c4e0hpWzFwR2EQfdDyKALhlf+zX4Z5I+yoxQ7hcSKJEAuXmx+McZ8X4bsCjxP/Lgs
         LKJvDDUc26UaW6cmxRYIR1vxZmLofGjOzmnr8TRsEtbompvHgjDptIFje/6RrVWI5cG2
         KsCpPosuKXLWRDOqOdRdXQ3AdF34+JXopq5C7IZaJY4EUfVjG+ierJBCQMPgX6UkK2nG
         D+oBMskOepbsqnyY1T7LtonYkuYR4dA8VcC0BHGjP0O0gMcRJoSQF4G6JT0zUQm4RFW5
         GzqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792062574; x=1792667374;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3blbaeYggHmVF464JV+Zlli+aD6d3bzh/Mw8o5F5mrY=;
        b=uYKPgdLdm3X/G3wDKKrzXVJsbvB20R5J8Rj8FfoulK6wIGWFkONfsA8GFm2oZXGL1s
         BmuUgTkgE++DMqlgY3/4xiZEnxvUlOccYdMyahNeCRAH6QgP8Uopc62XLBqoecoHRput
         ElvkH/ZJUbez1Km+FD6YiBJf4uKymAZInSVNv1GM2IbbhpjlKoDXjbbUl/dC2hj4rIMr
         xSk7GTLvG4UAYDwT4F2jRhi7O49t09iO6o6C0GnMpdjdsXdB8dfXTE4Vm50w+FXuiq4x
         rAFgV1J1DUg+QAKEc9ylxmh9DgZd8shBNsCy+nR8MQM1Nqa3ASjTQyB7rmVmSl+nLMoE
         B07w==
X-Forwarded-Encrypted: i=1; AKwUvBx08R3z1PzZAYbu/UaEQqwnA/Hp6VGkmotXxEA02oZWJTP/WpkRrJ7uUvnFPMpUpo4TtGDKuBpYXieWE/o=@vger.kernel.org
X-Gm-Message-State: AFq9FYIAtapNxVV/k3NzGZOe5faMTdHHA/ScnrB6GIuJCCZ4j36SS+Sf
	HS/IUJeUUGEFTiFZ3Bgf9hIVO++JeUXRluxMzayCCMEjI5E3QVTH/o0IavglhVDXvzM=
X-Gm-Gg: AYBFou3VyHl55o3sKLf1zm+seEDTQuFPXSbv1b4txKNLUSe/iiS8T4rQLLZbfHTOM/q
	ibDrf/gojkBXg6ldgPiueHoMIhnj4lGBHHfXqvAGRGaPA+7yWahEdSONycYx7xQD0S8vZpxEx1e
	4HFSiuFlWqRGTV84qLiqYLJdkbjIf4Sx1H3jpDlFj9dCuOZmmREDNSPdmrux7Pgy13Yq2ujDXEC
	IeUhIu/nigk5CjZA58AbmHyXD4iyoXU9CoxvVbiLncrcOFmB6+NjEON0fy2EFxSXl7YJRPBNLfC
	oRKgOSv2E9HI93MZCaHWYpBaxtWM/iEpp9sDpMRGRJs2Lw+VMGJAs4J+BlObXqanDbWDQ+5ICv6
	5duKlGygcx8Y8AUWo9xLjltqh6nzw4llqkUQpe2qepuw0EsXqhNLZjB+DoKh/X9m5zc77ZWx/OU
	ueEOhxkeVOu+D/N2k0YzswFvLBrcFOqUrZO/bNixxjtNvH/iKO+CKxYoNOX+jYwQ2ErwF1bBmDr
	8x5yg==
X-Received: by 2002:a17:902:e892:b0:2e8:21ee:f196 with SMTP id d9443c01a7336-2e842bcd165mr159384125ad.29.1792062574452;
        Thu, 15 Oct 2026 04:09:34 -0700 (PDT)
Received: from wyb-ms7e59 ([38.55.195.146])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e93f1d1ea6sm17881585ad.8.2026.10.15.04.09.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 04:09:34 -0700 (PDT)
From: wyibo6109@gmail.com
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	linux-input@vger.kernel.org
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yibo Wang <wyibo6109@gmail.com>
Subject: [PATCH v4 1/2] dt-bindings: input: add OnePlus pogo-pin keyboard
Date: Thu, 15 Oct 2026 06:08:58 -0500
Message-ID: <20261015110859.203989-2-wyibo6109@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261015110859.203989-1-wyibo6109@gmail.com>
References: <20261014135251.11234-1-wyibo6109@gmail.com>
 <20261015110859.203989-1-wyibo6109@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Yibo Wang <wyibo6109@gmail.com>

Binding for the OnePlus Pad 3 Pro / Pad 4 and OPPO Pad 5 Pro pogo-pin
smart keyboards, built around a Tinno keyboard MCU and attached to a
tablet UART.  Describes the supply, TX-gate and wake GPIOs, with a
MAINTAINERS entry.

The compatible names the tablet project the pogo port belongs to
(caihong, erhai or iceland), which pins the keyboard generation and
with it the protocol extensions the host may use: the 0x3A general
sub-commands grew over time, from the caihong (sm8650 era) keyboards
with neither wake notification nor backlight, through erhai (sm8750
era, wake notification) to iceland (sm8850 era, keyboard backlight).

The keyboard is a fixed physical device, so the touchpad geometry and
the product names are per-project constants and live in the driver;
the common touchscreen properties (touchscreen-size-x/y,
touchscreen-x-mm/y-mm) remain as an optional override if a variant
ever needs one.

Signed-off-by: Yibo Wang <wyibo6109@gmail.com>
---
 .../bindings/input/oneplus,pogo-keyboard.yaml | 73 +++++++++++++++++++
 MAINTAINERS                                   |  6 ++
 2 files changed, 79 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/input/oneplus,pogo-keyboard.yaml

diff --git a/Documentation/devicetree/bindings/input/oneplus,pogo-keyboard.yaml b/Documentation/devicetree/bindings/input/oneplus,pogo-keyboard.yaml
new file mode 100644
index 000000000..bab9ff3d3
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/oneplus,pogo-keyboard.yaml
@@ -0,0 +1,73 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# Copyright (c) 2026 Yibo Wang <wyibo6109@gmail.com>
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/input/oneplus,pogo-keyboard.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: OnePlus / OPPO Pad pogo-pin smart keyboard
+
+maintainers:
+  - Yibo Wang <wyibo6109@gmail.com>
+
+description: |
+  The OnePlus Pad 3 Pro / Pad 4 and OPPO Pad 5 Pro pogo-pin smart
+  keyboards, built around a Tinno keyboard MCU.  The keyboard is
+  attached to a tablet UART and speaks a framed half-duplex protocol
+  over a shared single wire; host transmission is gated onto the wire
+  by a PMIC GPIO for the duration of a frame.  It provides a keyboard
+  matrix, a touchpad and a keyboard backlight.
+
+allOf:
+  - $ref: /schemas/serial/serial-peripheral-props.yaml#
+  - $ref: /schemas/input/touchscreen/touchscreen.yaml#
+
+properties:
+  compatible:
+    description: |
+      Names the tablet project the pogo port belongs to, which pins the
+      keyboard generation and the protocol extensions the host may
+      use: caihong (sm8650 era) supports neither the wake notification
+      nor a backlight, erhai (sm8750 era) adds the wake notification,
+      iceland (sm8850 era) adds the keyboard backlight.
+    enum:
+      - oneplus,caihong-pogo-keyboard
+      - oneplus,erhai-pogo-keyboard
+      - oneplus,iceland-pogo-keyboard
+
+  power-gpios:
+    description: GPIO enabling the keyboard supply, held high while attached.
+    maxItems: 1
+
+  tx-enable-gpios:
+    description: GPIO gating host TX onto the shared one-wire bus.
+    maxItems: 1
+
+  wake-gpios:
+    description: GPIO signalling attach/detach, also used as the wake line.
+    maxItems: 1
+
+  touchscreen-size-x: true
+  touchscreen-size-y: true
+  touchscreen-x-mm: true
+  touchscreen-y-mm: true
+
+required:
+  - compatible
+  - power-gpios
+  - tx-enable-gpios
+  - wake-gpios
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    keyboard {
+        compatible = "oneplus,iceland-pogo-keyboard";
+        power-gpios = <&pmic_gpios 12 GPIO_ACTIVE_HIGH>;
+        tx-enable-gpios = <&pmic2_gpios 6 GPIO_ACTIVE_HIGH>;
+        wake-gpios = <&tlmm 151 GPIO_ACTIVE_LOW>;
+    };
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index 8014b9f82..9c29eb961 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -20156,6 +20156,12 @@ S:	Maintained
 F:	Documentation/ABI/testing/sysfs-bus-platform-onboard-usb-dev
 F:	drivers/usb/misc/onboard_usb_dev.c
 
+ONEPLUS POGO-PIN KEYBOARD DRIVER
+M:	Yibo Wang <wyibo6109@gmail.com>
+L:	linux-input@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/input/oneplus,pogo-keyboard.yaml
+
 ONENAND FLASH DRIVER
 M:	Kyungmin Park <kyungmin.park@samsung.com>
 L:	linux-mtd@lists.infradead.org
-- 
2.53.0

