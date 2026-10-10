Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7D6321E097
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 14:38:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791643134; cv=none; b=bwMSAKWfrzQKvYhD6S2H7Lqr//IqFhMwQgZ1zsyuAXoN6yIyz4TcxBNeZ/1ooP7xMofrA7N448crQbjK1xC4p8cHxHEoYdgLfc3RtQvhlkqYjqL0KpVfsrKDQwAu8VxAG2nGNwd1Ax55CplcnHgtMfZ8fbJfneRP8gsK0UVxbTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791643134; c=relaxed/simple;
	bh=uAxyCYziBc7ECXg17HgMb5or0IgwW9xJeT069BBS2RQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=e1dsA1y5u93gGAPvnVoG8FPYeGA0Cc44YvBIqV1IuTTz7G7/Oudks6GJ2wvfjuQubWX8oCBCxqOkHsK4EP/TIQEHUC8+rV7dpgAIEZ8254GMczEcoS1zn2tgfo7aIuYKPkjjwvGlD1xmLX0C0u7+68/WoXDQEVEw0HzcCpEvdq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Jjznh8tv; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Jjznh8tv"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3ab41538192so415315a91.0
        for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 07:38:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791643133; x=1792247933; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=T+JT4xkL/rjUHrLyDkr60TIJnL3a1LtABNKb99HH/9k=;
        b=Jjznh8tvf1fZstHheamKFB2a2G1j+4mWqjw8F3wCG1HB6HtoqXS6aofrw3HLWBrwtr
         Rdd8RPTeEHgaQkmONEjv2PW8VmBfUtNGI+SIxLav9Oh/lGUPEANXHugF8yyq6BA+tNKB
         pjPQKMOoYSeVzFHZhGCt7whLJnuXKsHIJ/aKawEir8LrGdU9gX6uOIVbBck6F1PutwgZ
         JKRytEbzzchf0LGD5ZwtXiVzqrFsUVERByKuLu5aq69lCRw81bVLjSFZqaBOD0Ppvgfw
         Ed7xyoBiyydgrTU8CULq62G3/MZUK9rA8CoYw70m6qAhk6E11sUXZGCTS86u1Jng7fmb
         yZDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791643133; x=1792247933;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=T+JT4xkL/rjUHrLyDkr60TIJnL3a1LtABNKb99HH/9k=;
        b=yuFEIbXuBEAsG0kAMqXE+jK7NtHPesEGJuYLKLLMPfdo8+jT+g5FdmNoN0LOCHdlfJ
         YxWCCDoLqwUG6ZA1ciDsS9nSHlcwQQibY1UbnGzkehjw6ITRv9V1kVdUI4AHwn0VFf01
         zEFMmzUvK2GYv9ju0wfpJB9469mjwFysjwx0V2HJ59XSmvAG8xnHsPvHwTQiAOgNr0Ky
         1KulrUi5fHvB3GrwVPT0b1HRGdpBVYruoEuHi/JrnDLZ7AUCnzqAjbnh1fXm/oRTaPD3
         qijjdsnJ5WCcSew6cN8WIH+5bLXGARXqm34v+YLwn3pvxzS21zhiG2pDdXgLC4ln+h6c
         sZkw==
X-Forwarded-Encrypted: i=1; AKwUvByKnp4meQZoGRrQ33A3oOKZLfGz+wLdolkJNrqlqk0MYUdgfiB4p4AjG3MqAQ7NQ8VjjclKn9SZXNAEpnE=@vger.kernel.org
X-Gm-Message-State: AFq9FYKv1bRoE9e5glIdit5lkI1PHjrmki5MtCfopXxedUEX5br0oXDo
	u28kRCWBJ9VSXrHKzbTTQobsQ0q7Xfm3ugnN3EB03LPq0UFKyBMhOso1
X-Gm-Gg: AYBFou07NBRihm1S8UFSUMHOjC0kIIca3fbFM7+cI9Zpx4V39iLsr5ushZhLc1HV7DK
	+35FuAtPWkfdJoqW1AtZvgLeryNZ2+BAwtVU5XqfGvr/KtGZTylfQ8/50Hx1ebogGwIge62wPMD
	aC2D5nmaY0KKVcLobQfRh3bmOJTPDqWu0DHo6mEF4K+BmZkQunPMwYKxLkFy/EPILi9mn8in2Xc
	OCPmDQbTIaqbXzOTDHRkH4iI8szgLqOURyjSZCqXjvVr1b2hFBFgIQuk3gnIQ89VkydKQiRM/Mn
	nqV0quqOAv59sjNYx950DqEeMBGZAaXF586yfLRjW9JZFat8lkSQZSrsAXyelF22JMCqYod+ISy
	cLM39CmMYaAA45wNlEGPDza+MKIG3NphQkzwkzgmM3ukPZTtVLymjbyyP3LXX++Xb+W/e17kHXL
	e4p7O18WNtnPRRJcJPx7SbNuQWzLyD8+rYxrzwcqFDYlvbeuSn5rvITqGiSBlToN372kw=
X-Received: by 2002:a17:90b:1dd0:b0:3ab:1ad0:db41 with SMTP id 98e67ed59e1d1-3ab3a9a4f3bmr4425257a91.62.1791643133000;
        Sat, 10 Oct 2026 07:38:53 -0700 (PDT)
Received: from wyb-ms7e59 ([38.55.195.146])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab38f2f866sm10821859a91.10.2026.10.10.07.38.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 07:38:52 -0700 (PDT)
From: wyibo6109@gmail.com
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	linux-input@vger.kernel.org
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yibo Wang <wyibo6109@gmail.com>
Subject: [PATCH v2 1/2] dt-bindings: input: add OnePlus pogo-pin keyboard
Date: Sat, 10 Oct 2026 09:38:35 -0500
Message-ID: <20261010143836.173883-2-wyibo6109@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261010143836.173883-1-wyibo6109@gmail.com>
References: <20261009122046.551915-1-wyibo6109@gmail.com>
 <20261010143836.173883-1-wyibo6109@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Yibo Wang <wyibo6109@gmail.com>

Binding for the Tinno keyboard MCU used by the OnePlus Pad 3 Pro /
Pad 4 and OPPO Pad 5 Pro smart keyboards, attached to a tablet UART.
Describes the supply, TX-gate and wake GPIOs, with a MAINTAINERS entry.

The touchpad is described through the common touchscreen properties
(touchscreen-size-x/y, touchscreen-x-mm/y-mm): the MCU protocol has no
way to query the touchpad geometry and the same MCU is shipped in
keyboards with different touchpad matrices.

Signed-off-by: Yibo Wang <wyibo6109@gmail.com>
---
 .../bindings/input/oneplus,pogo-keyboard.yaml | 66 +++++++++++++++++++
 MAINTAINERS                                   |  6 ++
 2 files changed, 72 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/input/oneplus,pogo-keyboard.yaml

diff --git a/Documentation/devicetree/bindings/input/oneplus,pogo-keyboard.yaml b/Documentation/devicetree/bindings/input/oneplus,pogo-keyboard.yaml
new file mode 100644
index 000000000..9055ececc
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/oneplus,pogo-keyboard.yaml
@@ -0,0 +1,66 @@
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
+  The Tinno keyboard MCU used by the OnePlus Pad 3 Pro / Pad 4 and OPPO
+  Pad 5 Pro smart keyboards.  It is attached to a tablet UART and speaks
+  a framed half-duplex protocol over a shared single wire; host
+  transmission is gated onto the wire by a PMIC GPIO for the duration of
+  a frame.  The device provides a keyboard matrix, a touchpad and a
+  keyboard backlight.
+
+allOf:
+  - $ref: /schemas/serial/serial-peripheral-props.yaml#
+  - $ref: /schemas/input/touchscreen/touchscreen.yaml#
+
+properties:
+  compatible:
+    const: oneplus,pogo-keyboard
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
+        compatible = "oneplus,pogo-keyboard";
+        power-gpios = <&pmic_gpios 12 GPIO_ACTIVE_HIGH>;
+        tx-enable-gpios = <&pmic2_gpios 6 GPIO_ACTIVE_HIGH>;
+        wake-gpios = <&tlmm 151 GPIO_ACTIVE_LOW>;
+        touchscreen-size-x = <2561>;
+        touchscreen-size-y = <1441>;
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

