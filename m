Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C115498930
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 12:12:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791547935; cv=none; b=TVpMBq4uvx+rKxGFR3VOtwjSLyMjevPXJ8pSv+7Kjyu9mNpTZ5pR2N/Vv+mSOEKGBNn+jNubmFE2d/Vaa8N3EUHeehmn9jmE9mTdmQrD3SlMbstjgsc1or8xjeiEVbzEy+xisn2ZhbXrOslmyX8fZbySrTD2YHFGN4ZC2eFDn3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791547935; c=relaxed/simple;
	bh=DxUv0mvssxN3iJhOpegrRee7xWpW2o1yHuPk8Cu2DW0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LrWapE3m9MHxa5Xfdq8nF9XfeSWSmZu2oeMK1t9EEbiaNrOP4dcc1TZio7zqPzqh10sbSJRkEcmmoD8t+euoUnZ+jElE8ozUlFgIi4Mkyy+AJ8xKwvxTY58H1iTqaEbHTcRk8iHgxsuwd/eLW/cepIVzlU5/dpNz6wi3XpAtPeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=q7eftOCQ; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="q7eftOCQ"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-868b3248b2cso3357209b3a.1
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 05:12:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791547928; x=1792152728; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gs2kW6mPfU0JJJVaVDYl+M+hweObzydf3vfAXZLYSp8=;
        b=q7eftOCQFL/ND2nrKQhri/Ob2QMezalXYZi2D8cUEmp4yBewe8DzaC2XNFmSFxDi+F
         DlHGJR2oo+ryPD6MyvyR6Dbpfk9WfjdOS1CobbO+w3mCZCKFg5E9GM+EtNhNrqmXvlRQ
         O/WHuqcMP6gotbStQJlOKYlloLhmeUkpUSWNlgK/vBexnsiI+GIQ+qXsT0H7UpUbVLnQ
         kL0fB429qIlcojp9+XkMPI83I6xhmib8EwXDf3YG0HMqMRtMpEuxRje/9HIEE7fxFbaW
         QD/72nXYz3n+7V1RdnQyiHFOm8p8O9eTd6C2PQClEtJZJJ/utNxonz2zLxP9jjUHFeRs
         Dhyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791547928; x=1792152728;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gs2kW6mPfU0JJJVaVDYl+M+hweObzydf3vfAXZLYSp8=;
        b=uKTbynWdvKtA7YbWdcJO4LMiGF8YatTMdCO8iy+n2Hwpk5q9dpdeLFBcczlTvjNyfi
         4UN6hVuQLS1mW6Ta6arbagCTBHIA5lSKUSPcC/E9BPBvVwKe9mGKg26tZP1Jb3W8M+pZ
         fmiTIl4Bg0lRvX1AKapIUSnJFV/eNFjljy0jilTiJnKuTVZkNXYW3drc7cEt5A3V6vii
         6QcaB0gvJ4ggSVnvQ3b1cnrADTd1CKRVm20pi4Pt2dcLzd2G1Po7rrzKFjc2tkocDdSE
         hjLTBFnRSYq/6N5yH3OHNxKVvT+Nr06qhWitgPkpykYzp3BgRHpgzPkYa+2wEGcHK0qh
         c0Jg==
X-Forwarded-Encrypted: i=1; AKwUvBxVSZbrbVCJtX+lecCNXnfC31vA2NXBKBgjzN9tAt078Lyi9EcF3LOdI/J4kuAQUyogdHWPxASFGUP5d0k=@vger.kernel.org
X-Gm-Message-State: AFq9FYIb+YUQtmjbBLi9LF86bUBUHSV8P2X3OFjBfZroWQdAidK4cBXZ
	PeykhFXHqmnY7F3XtOyWOcVN+h4kTANAhtoob4XVfPR2ChhdIKosriX9
X-Gm-Gg: AYBFou1VcXeokw1TpXgKaqzm/sIdVVgsNOrVN5a1zqD5zZaImwVCUMKomid5mKH4jpI
	AQzvYFIXXDul20wg/C3aIBF/vDjAp+hixG3Y63aNxo/PnpymmpLOIUIThIAVcAqWCI3mFjcMvwx
	Pp/pkFR32ymy+4nkX6SN46nFqnOr/mZAbPQvHURPbz2khpAcf8y821jKUAJ/2Nu4zLEG9/hrmIi
	twAVDXr/uSg2TaIDXGiJicAl4DDKGlNjh4e0lPMngsCajnGKg5Do1Zp4O8gsLgNjpGYG/9YEOFW
	XZZHzLz7lGPO/hQVXvqJ6BSCjisE1iBHPpx3STLwsVIjoqgU3O3d1z0CWiRh+GTaX7KC8r/q+gP
	D4t7o/Jkl3JvYXf62jDthQn5PRJUqxl20r/FVBInJc9v7NGLIWTF0J+b2NJ2zNXD94/Q0ePTxHe
	pNzXF0Fk/STyu+D2E4vk1+nft/5L3ERoudLQYDuUjo3GwxYOR6C/dBkISbTkkv7rv63clV+GCHL
	z8=
X-Received: by 2002:a05:6a00:f94:b0:880:74b9:dd07 with SMTP id d2e1a72fcca58-897c8d80f39mr1466367b3a.57.1791547928207;
        Fri, 09 Oct 2026 05:12:08 -0700 (PDT)
Received: from wyb-ms7e59 ([38.55.195.146])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-896c3eca287sm786243b3a.37.2026.10.09.05.12.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 05:12:07 -0700 (PDT)
From: Yibo Wang <wyibo6109@gmail.com>
X-Google-Original-From: Yibo Wang <2024312277@stu.hit.edu.cn>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	linux-input@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yibo Wang <wyibo6109@gmail.com>
Subject: [PATCH 1/2] dt-bindings: input: add OnePlus pogo-pin keyboard binding
Date: Fri,  9 Oct 2026 07:11:42 -0500
Message-ID: <20261009121143.550498-2-2024312277@stu.hit.edu.cn>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261009121143.550498-1-2024312277@stu.hit.edu.cn>
References: <20261009121143.550498-1-2024312277@stu.hit.edu.cn>
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
Describes the supply, TX-gate and wake GPIOs and the touchpad
geometry properties, with a MAINTAINERS entry.

Signed-off-by: Yibo Wang <wyibo6109@gmail.com>
---
 .../bindings/input/oneplus,pogo-keyboard.yaml | 81 +++++++++++++++++++
 MAINTAINERS                                   |  7 ++
 2 files changed, 88 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/input/oneplus,pogo-keyboard.yaml

diff --git a/Documentation/devicetree/bindings/input/oneplus,pogo-keyboard.yaml b/Documentation/devicetree/bindings/input/oneplus,pogo-keyboard.yaml
new file mode 100644
index 000000000..849558458
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/oneplus,pogo-keyboard.yaml
@@ -0,0 +1,81 @@
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
+  touchpad-xy-max:
+    description: Touchpad maximum X and Y coordinates in units.
+    items:
+      - description: maximum X
+      - description: maximum Y
+    minItems: 2
+    maxItems: 2
+
+  touchpad-xy-resolution:
+    description: Touchpad X and Y resolution in units per millimetre.
+    items:
+      - description: X resolution
+      - description: Y resolution
+    minItems: 2
+    maxItems: 2
+
+required:
+  - compatible
+  - power-gpios
+  - tx-enable-gpios
+  - wake-gpios
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    serial {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        keyboard {
+            compatible = "oneplus,pogo-keyboard";
+            power-gpios = <&pmic_gpios 12 GPIO_ACTIVE_HIGH>;
+            tx-enable-gpios = <&pmic2_gpios 6 GPIO_ACTIVE_HIGH>;
+            wake-gpios = <&tlmm 151 GPIO_ACTIVE_LOW>;
+            touchpad-xy-max = <2560 1440>;
+            touchpad-xy-resolution = <24 25>;
+        };
+    };
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index 8014b9f82..e978a26c1 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -20149,6 +20149,13 @@ S:	Maintained
 T:	git git://linuxtv.org/media.git
 F:	drivers/media/i2c/ov9734.c
 
+ONEPLUS POGO-PIN KEYBOARD DRIVER
+M:	Yibo Wang <wyibo6109@gmail.com>
+L:	linux-input@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/input/oneplus,pogo-keyboard.yaml
+F:	drivers/input/keyboard/oneplus-pogo-kbd.c
+
 ONBOARD USB HUB DRIVER
 M:	Matthias Kaehlcke <mka@chromium.org>
 L:	linux-usb@vger.kernel.org
-- 
2.53.0

