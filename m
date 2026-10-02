Received: from mail-4318.protonmail.ch (mail-4318.protonmail.ch [185.70.43.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EC5B4EFFAF;
	Fri,  2 Oct 2026 15:43:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790955788; cv=none; b=pG5uTPnDVWOoUs+FP2gwx888DpGfC+JypitkXZZuq9ynt8iZgQ0vJmYi1YjG0ZpEZxYbIcsB09iXfaM7NKoCCL//7QVyyhoQcOc9tWrzxrM77LT+nFUIziNDC/SUxbG+kbMm1Lw+CZuiKVg6SDgOXkh9EGpKb54r74ZDsPyUnQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790955788; c=relaxed/simple;
	bh=QLHPXGnyW0YJfr5p9mWujy7JUre9E5Q4+Id3qD6/5dg=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NEKENFWFFdhofh+zeg4V+tfty2jjrj/ZCJ4yfbd2k7RxU//3S2kYdxlrW2HCEvKfZNlwegdxdTJc/SLo035d/GiKnZRGmv1WEqjY8wiqTIX/tQB85R1W5fqnTCO5zhah527w+4yKHbrfur3uwq+5xmdVXnMfzkYIzwHo+jSFh4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ironrobin.net; spf=pass smtp.mailfrom=ironrobin.net; dkim=pass (2048-bit key) header.d=ironrobin.net header.i=@ironrobin.net header.b=lqWnNcBi; arc=none smtp.client-ip=185.70.43.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ironrobin.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ironrobin.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ironrobin.net header.i=@ironrobin.net header.b="lqWnNcBi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ironrobin.net;
	s=protonmail3; t=1790955782; x=1791214982;
	bh=ymTjs/zUV0M33JdBWsgsfL2uizg3ZGZsejyQCjKyuEA=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=lqWnNcBia0UqCztARH/f30yzE6cFSIYE1vBwzzsOCCAFWKt4/oHgcYPFCNGixa942
	 9ZRaG5rWceCFh+hiyyayH4z10wixMKlaEZDGD3VoeBt9Yw5LU1caC3d/A2WBdfFZSH
	 LDzxSbcRHX7iUj0N22P3qqO1eezQGsvsMlUXjnMmBq1sZzdaaSFpefuA0ahVthXj9W
	 279EwrJRMfM6PrpdpS3r3brrxQwiUXd8Nn1agxg3jhHgP7ZXkRaZiHf7jQpAiqrrhS
	 a5BeleJPP9S+TlvyK7HWtFzzgx0F6ogGDWInpAA5pN6tSQqU5FS1heUjZFm+k26G2U
	 FBhut65L+uIgA==
Date: Fri, 02 Oct 2026 15:42:56 +0000
To: Hans de Goede <hansg@kernel.org>, =?utf-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
From: Alex Robinson <alex@ironrobin.net>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, Steev Klimaszewski <threeway@gmail.com>, platform-driver-x86@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v5 1/3] dt-bindings: embedded-controller: Add Lenovo ThinkPad X13s EC
Message-ID: <20261002154231.31376-2-alex@ironrobin.net>
In-Reply-To: <20261002154231.31376-1-alex@ironrobin.net>
References: <20261002154231.31376-1-alex@ironrobin.net>
Feedback-ID: 54785507:user:proton
X-Pm-Message-ID: 28bb44a1edca35dd8d36ee596b400e19ad66c899
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

The ThinkPad X13s EC uses a command transport similar to the T14s EC,
but has different keyboard-backlight, event and power-management
interfaces.

Add a separate binding to describe the X13s EC.

Assisted-by: LLM
Signed-off-by: Alex Robinson <alex@ironrobin.net>

---
diff --git a/Documentation/devicetree/bindings/embedded-controller/lenovo,t=
hinkpad-x13s-ec.yaml b/Documentation/devicetree/bindings/embedded-controlle=
r/lenovo,thinkpad-x13s-ec.yaml
new file mode 100644
--- /dev/null
+++ b/Documentation/devicetree/bindings/embedded-controller/lenovo,thinkpad=
-x13s-ec.yaml
@@ -0,0 +1,65 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/embedded-controller/lenovo,thinkpad-x13=
s-ec.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Lenovo ThinkPad X13s Embedded Controller
+
+maintainers:
+  - Alex Robinson <alex@ironrobin.net>
+
+description:
+  The Lenovo ThinkPad X13s has an I2C-connected embedded controller (EC)
+  providing keyboard backlight control and event notifications. In additio=
n
+  to its event interrupt, the EC has a separate host-controlled power-stat=
e
+  input used during transitions between normal operation and low power.
+
+properties:
+  compatible:
+    const: lenovo,thinkpad-x13s-ec
+
+  reg:
+    const: 0x28
+
+  interrupts:
+    maxItems: 1
+
+  power-state-gpios:
+    maxItems: 1
+    description:
+      GPIO connected to the EC power-state input, driven by the host.
+      The signal is high during normal operation and low in the low-power
+      state. It is used together with I2C power-state commands, rather tha=
n
+      as a power-supply enable or reset signal. The GPIO is active high.
+
+  wakeup-source: true
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - power-state-gpios
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    i2c {
+        #address-cells =3D <1>;
+        #size-cells =3D <0>;
+
+        embedded-controller@28 {
+            compatible =3D "lenovo,thinkpad-x13s-ec";
+            reg =3D <0x28>;
+            interrupts-extended =3D <&gpio 1 IRQ_TYPE_EDGE_FALLING>;
+            power-state-gpios =3D <&gpio 2 GPIO_ACTIVE_HIGH>;
+            pinctrl-0 =3D <&ec_int_n>, <&ec_power_state>;
+            pinctrl-names =3D "default";
+            wakeup-source;
+        };
+    };
+...

