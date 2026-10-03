Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B2D0399D08
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 20:21:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791058919; cv=none; b=SCFYkOft18/A0pXnQwKZYGHmOF0Km5Sge6RgFFYDnbrKzzhn5qKoyHLFgG4ZzLpoO/QlMK/rF2mWBZhksf70QbmGeHKjTUBkyU3ans7GwposkhqhfKoFkGYXJ0NXTtrPOwvY6a0G46SH1HkmosLD6mvxxbNDrYCNM1ouLbcWzLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791058919; c=relaxed/simple;
	bh=ashavTxgOUJZqoPInhEpeZj8vfEg6zTM4bvI0mbKNcU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ahNPYKXvZRViBcbqJtrbHMHkAsDjOyPrwxYWKKMFR+SADSj0lMAZm8VH2EC+1c6G8tmbYCbrCjPV6lshZCyxUnUJWfEmHjTrkq1A8DA+irZvDLVTRDfLxHqNNlYC/hHBkrGvfMUJNLezYI8RJrUjaT+l+9MYAf1Z27LXcvOkeo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YXaninCE; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YXaninCE"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48b03f23305so564942f8f.1
        for <linux-kernel@vger.kernel.org>; Sat, 03 Oct 2026 13:21:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791058915; x=1791663715; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YMS0fznvLZomihe8C/oJh3xR5MqfRPhNrCBOy3H79Y0=;
        b=YXaninCEyJFoYTbARRsXKA5GvtP6ufWjXg3bIjBprDombPYdFnJ3czmj4dD4IeDmRb
         Ty5enD2vJ2zdJ6P6pGBM3AA+LH6KEVCgNcrwYbnAGS9VyOjIcDFauyjdM/dCv/dvGzLG
         QkczVyRhWzPPkeuidzTnSzTssodwxWZCpaHlqSUAhX1ndFLviubDWP3UkgX+LeGCeQUp
         ZoIOb3mTCfqTirN9bN7DBDjL14ni9fUtiJvvkdSPmnuazXY7EAdHChbN7C8wYGnzYW5Y
         i/K2W7ljP/Vju3N/JoQzswh5pIx3SmJSTzYmvM6p99e0AWyJHei02fFHKyCaFpCcaNGl
         INGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791058915; x=1791663715;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YMS0fznvLZomihe8C/oJh3xR5MqfRPhNrCBOy3H79Y0=;
        b=GaW1ttqbXHILCcnLtLJXuVstEu3oXsFkXicF0Ts/7fKOYvuxLzvlwOcvbxLvA2oTEW
         Rvrk6bnlLaSyn1OkIXeeraF6Q2Aq5G0z833aeA4EZFFql8Ul15sSGEgXSyAZx75FP1gD
         lh1DJl9ybFL+5IVZZpElDCxobO+AgUAUxPpXtGiXorxut+6FM3DbCL5ZOKK/BU7bHbY0
         c5YJfdIqBuQppbYc75ixlSRfWUi+4Q+w1wwWdeOaQIwtQ6983lZzjugaDxBi0kyV+tUj
         xRnOWJu7wXK3v5PB2idpZeGWxhidAu/9fnhI/eohFwTAEfvdPAwxWpS/6DOnW2bF7IVE
         JH0A==
X-Forwarded-Encrypted: i=1; AKwUvBxDPn4aQUsKZ1bDyfSylfR6vlpL639anIOgdjYcqIjYHxIUNmWdvMKxOnWV819kxuWIPJF769Zrdg/TL7Q=@vger.kernel.org
X-Gm-Message-State: AFq9FYJaaLY54YtDQSQOu89qddlueuU/EdSNyp8sL2qpcJg6Dk6NYYje
	16xT8xqDLT4FQRCKhQzkxLxsHc2iHY6o2d/7Wa5vtcOqHoIJIbEeYukCRjDEEhmG
X-Gm-Gg: AYBFou0RbAm5V3hKUJg4JLi1JgfDUwmmB+EE4GIiD5KxRP2Ibgw3hFujgrpqGoK6KN+
	NCPDpMArARgi95WKjEwhNKb2M8QMXXpdaaqbtFyonm3ic/xjL5mjirkwf/j0FFGFEiLFlpyg1Nl
	ndgf3ZOOsUN4iqd1MGCligSS4fu0il+Hlx5Gpn4y7T6oYevDUUS3OyFWHrcab6p2/UJX4Xk4EVq
	pWgfU5B13MMHYPk/EpzDH+843dL4VEnRTKcCgwCVz/xN16B7McGYgDVsmxQqG3yfOI9/lzoYNPA
	0BjYL2m9n3Uf06RTOTsn5Y5QzgyaBIUbDfSVP0BebDzFQHAMrF91D+v80TvwFNhUFdLJWI8UoZp
	WZTFEVUE+j29ETKEGUG5pZNJ09Lnz2VlRt30wdkGcbCUEZM8QOCjOt8qair/bYKhUB1Vu8ArXDe
	1anKfBI6rb8mfMcUrWWuG5DFwTKyJ2LRbhydWHmVf9nCA4SxAwzbVqFrH5uuccWe5p/9QM//YFd
	QvQUA==
X-Received: by 2002:a05:6000:22c6:b0:48c:466e:9d06 with SMTP id ffacd0b85a97d-48c47fe73eemr6546300f8f.20.1791058915157;
        Sat, 03 Oct 2026 13:21:55 -0700 (PDT)
Received: from localhost.localdomain ([94.252.75.11])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48b380facfesm15083316f8f.23.2026.10.03.13.21.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 13:21:54 -0700 (PDT)
From: Oleg Keri <okerixx@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v5 1/3] dt-bindings: embedded-controller: add Lenovo Yoga Slim 7x Gen 11 EC
Date: Sat,  3 Oct 2026 22:21:41 +0200
Message-ID: <20261003202143.4697-2-okerixx@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261003202143.4697-1-okerixx@gmail.com>
References: <20261003202143.4697-1-okerixx@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the Compal embedded controller found on the Lenovo Yoga Slim 7x
Gen 11, a Qualcomm Snapdragon X2 Elite (glymur) laptop. It sits on I2C at
address 0x70 and is distinct from the Qualcomm reference EC that the
reference designs place at 0x76.

Signed-off-by: Oleg Keri <okerixx@gmail.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../lenovo,yoga-slim7x-gen11-ec.yaml          | 56 +++++++++++++++++++
 MAINTAINERS                                   |  8 +++
 2 files changed, 64 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/embedded-controller/lenovo,yoga-slim7x-gen11-ec.yaml

diff --git a/Documentation/devicetree/bindings/embedded-controller/lenovo,yoga-slim7x-gen11-ec.yaml b/Documentation/devicetree/bindings/embedded-controller/lenovo,yoga-slim7x-gen11-ec.yaml
new file mode 100644
index 000000000000..37337de86b0b
--- /dev/null
+++ b/Documentation/devicetree/bindings/embedded-controller/lenovo,yoga-slim7x-gen11-ec.yaml
@@ -0,0 +1,56 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/embedded-controller/lenovo,yoga-slim7x-gen11-ec.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Lenovo Yoga Slim 7x Gen 11 Embedded Controller
+
+maintainers:
+  - Oleg Keri <okerixx@gmail.com>
+
+description:
+  The Lenovo Yoga Slim 7x Gen 11, a Qualcomm Snapdragon X2 Elite (glymur)
+  laptop, has a Compal embedded controller on I2C. It reports board
+  thermistors, battery cell voltages and CPU fan speed, and drives the
+  keyboard backlight.
+
+  This controller is not the Qualcomm reference EC that the Snapdragon
+  reference designs place at address 0x76; it speaks a different command
+  set and answers at 0x70.
+
+properties:
+  compatible:
+    const: lenovo,yoga-slim7x-gen11-ec
+
+  reg:
+    const: 0x70
+
+  interrupts:
+    maxItems: 1
+    description:
+      The controller pulses this line while it has events queued.
+
+required:
+  - compatible
+  - reg
+  - interrupts
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        embedded-controller@70 {
+            compatible = "lenovo,yoga-slim7x-gen11-ec";
+            reg = <0x70>;
+
+            interrupts-extended = <&tlmm 66 IRQ_TYPE_EDGE_FALLING>;
+        };
+    };
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index 5c57cbb68060..0bc10ee20cf8 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15063,6 +15063,14 @@ S:	Maintained
 F:	Documentation/ABI/testing/sysfs-driver-lenovo-yb9-kbdock
 F:	drivers/platform/x86/lenovo/yb9-kbdock.c
 
+LENOVO YOGA SLIM 7X GEN 11 EMBEDDED CONTROLLER DRIVER
+M:	Oleg Keri <okerixx@gmail.com>
+L:	linux-arm-msm@vger.kernel.org
+S:	Maintained
+F:	Documentation/ABI/testing/sysfs-driver-lenovo-yoga-slim7x-gen11-ec
+F:	Documentation/devicetree/bindings/embedded-controller/lenovo,yoga-slim7x-gen11-ec.yaml
+F:	drivers/platform/arm64/lenovo-yoga-slim7x-gen11-ec.c
+
 LETSKETCH HID TABLET DRIVER
 M:	Hans de Goede <hansg@kernel.org>
 L:	linux-input@vger.kernel.org
-- 
2.55.0

