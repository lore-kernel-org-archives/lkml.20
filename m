Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7598B364E89
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 14:46:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788187589; cv=none; b=sIO/uyenLq0dJpFUWkDi95NAVU7SxvwCLcXFbmjnr7I9UlObwYBgP0uzKzR9F9tUn2O8JbEQzBMsbJhw5dbb8J/m2fliuZz8LpdYTwO2Jo3+BcRR+/o64L2vKAqmIhwm+xUpkE/0nUo5+zM/THHqdxJZ+v7nZbo8yWLVzmR6SM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788187589; c=relaxed/simple;
	bh=3wtKqciQeOHcSakXZnMHLLISP+Cf8Obt+lYhptG6Gfw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RVQVcKL6ybTamkT0x63+mS+NfoF4S7z6yyOrhupFpzKQW7D+jWS4YPQxXBcGtJP93PS/FYdQAAGewwkUcs93A5aN9A7dIq8n8OJfZHYwSJZ6Z56mH7/MBSVupgg0XRaFWSLI95XF0ZmBh517Kysr6san5NnG0LSc4efP9IC5ev8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RTznZESZ; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RTznZESZ"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-cb2513ec378so450136a12.3
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 07:46:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788187588; x=1788792388; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y8fnpAA71PpA4geiQW/S84jidbVYovY7D0FubXhURV0=;
        b=RTznZESZT1DSaDYu9tl3nktThzFkVvm92JC3cA2sfwtnLnfjhIyde9xa51xg3zkGnW
         udwfYlTq1frD4yyrXD5htY9dNsBiMk2iyxosXiUvfoGoDJr3fiYJR6sPpOce0BdGdOkP
         8zs1tBgxSU5G78/hMIfp78SMchqRJgxT3yhVUktupl12T2N4cWa9/TOf+2gUwaFG3Hl5
         9qTMdousTfDxsxvf1PBxVcRGuSrwRGUEl5FA9e7Oit051OjFj6Arnz43rINfsn8xZuSV
         rj1mfVVbPHKMJ6UvJSn53dDKI5sTcl2Q2TSMqmCKrjrov+APjNPhZ1XLAVrjrPIqCSWV
         /EvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788187588; x=1788792388;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Y8fnpAA71PpA4geiQW/S84jidbVYovY7D0FubXhURV0=;
        b=hpoLRahU1zASy3ch0TeZHM53lNmKxVr2Lu2LuTojQnVd6TpwiCIl0VFqdzXbBPmwiD
         B4vVIV22e95clt2JY36mNJdfhRIl20JWxvVcAe6NvYmTgf7niWE8M2rDxmb6EWqDpy4p
         EtHV0dkCh+SwYt5YJOA56B6yxr8wUUofNJ3w/RefWH3aOrdRl5gwnyzzwRzWUcXH1etu
         O6bupq73rMLHaqDkZ9TTSzG0rJJ+5fArq56R59qQzaD9OFtaUEugigeaXJCqh+9HaOfV
         vac4BwgjmAUXKMZJUzx0Q2qhlzDCVDHGA/KMZShIA1UUnguXa+ziZ1L9Ua7QGt853EEh
         2xTg==
X-Forwarded-Encrypted: i=1; AKwUvBzSD4DmiAEwDLP94kogyrSCMWg7FDug/rlW07S19SwRnijd5A5yhXGKFzs+i76RKopm/LhA2szijYeFbmM=@vger.kernel.org
X-Gm-Message-State: AFuF++nMXIcH+ZMxwT6A/iJuMhL5CVDTSL2LfRZ4Ikj9IHa0BdXybM12
	16lRaeuzoviUhZQu9NZdlFqYfPgcb5wGnb/kLjMDjTOAQKFP3RjJrKhH
X-Gm-Gg: AYBFou20MSxvtmbRnfaD5iWfmRBVFCNxBwdyy4cwClRbOd0F1cHBxsoUZ1M8skzd3nB
	FttronA2CZQ4+TRg7ETdym6w8nHTRdAsQHM7oQqbCeMmP1L70EVcFKnlBlc5LW32/i8YgxqYEUY
	Ujx4+Evg/EcVoGw+VHvxRbZucimVe3KOD93dMebcR8Zm/waLDt8LVIs5+VuOBhkmKnu41FIBLcU
	pVezFsaybv3QmZ6d7q0mqqc4zlIKWEErhWirChF95Qp/6ecZUIv9pExSM4AMSVF58brdScejpyi
	Shw7/M73EJYS+6XBOEK32ryVRewFadnM1ZD36FQI+NJHSCmBRT+5attgZNBWOWNVBnJUgd6NV8O
	LW3tEKNwTyHLsnjcBMJaniYNAUMPGLR0QC+Z5gA4ZtL6MpT/PGg0QklG/r081zted/pRi6k7Fl9
	s3SVhOnJo8tHSupODNPCSbjRqJGaUIGi5gw/6XJO0lQNQTi5CS/J5mfnIcd0Ea8fxxiXSY7BQ=
X-Received: by 2002:a17:90a:ec85:b0:398:bad2:c0f with SMTP id 98e67ed59e1d1-398bad20e7bmr12372505a91.5.1788187587501;
        Mon, 31 Aug 2026 07:46:27 -0700 (PDT)
Received: from [10.60.78.252] ([2409:40c2:5009:b339:5edc:6eb2:1ff7:f053])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-142e0bf8a13sm43217279c88.0.2026.08.31.07.46.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 07:46:26 -0700 (PDT)
From: Bhargav Joshi <j.bhargav.u@gmail.com>
Date: Mon, 31 Aug 2026 20:15:35 +0530
Subject: [PATCH v3 2/2] dt-bindings: mfd: ti,keystone-devctrl: Convert to
 DT schema
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260831-ti-keystone-devctrl-v3-2-0614fceba0f1@gmail.com>
References: <20260831-ti-keystone-devctrl-v3-0-0614fceba0f1@gmail.com>
In-Reply-To: <20260831-ti-keystone-devctrl-v3-0-0614fceba0f1@gmail.com>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Ivan Khoronzhuk <ivan.khoronzhuk@ti.com>, Nishanth Menon <nm@ti.com>, 
 Santosh Shilimkar <ssantosh@kernel.org>
Cc: mfd@lists.linux.dev, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, goledhruva@gmail.com, m-chawdhry@ti.com, 
 daniel.baluta@gmail.com, simona.toaca@nxp.com, j.bhargav.u@gmail.com, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788187552; l=4030;
 i=j.bhargav.u@gmail.com; h=from:subject:message-id;
 bh=3wtKqciQeOHcSakXZnMHLLISP+Cf8Obt+lYhptG6Gfw=;
 b=v4RdH5dbhuk9pP0rKYU9cicQ5Fllo/lac5Te5KW3tVVt/p0onHxeydqFkXSfhebx8aILFsc/Y
 ZB4HqXMtPa3AkHP7BDPKIX467EW/bn1Q+iBNPz1UA3+Sl7VtCWLo2+q
X-Developer-Key: i=j.bhargav.u@gmail.com; a=ed25519;
 pk=IqNDwUZKECEA+n8wXctFLBbYL9NhFstZNbOznm/nX1k=

Convert the Texas Instruments Keystone Device State Control binding from
legacy text format to DT schema.

During the conversion, the following updates were made:
- Add "simple-mfd" to compatibles matching existing dts usage.
- Add required bus properties #address-cells, #size-cells, and ranges
  which were missing in text binding.
- Document child nodes gpio, interrupt-controller, and reset-controller.

Signed-off-by: Bhargav Joshi <j.bhargav.u@gmail.com>
---
 .../bindings/mfd/ti,keystone-devctrl.yaml          | 84 ++++++++++++++++++++++
 .../bindings/mfd/ti-keystone-devctrl.txt           | 19 -----
 2 files changed, 84 insertions(+), 19 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/ti,keystone-devctrl.yaml b/Documentation/devicetree/bindings/mfd/ti,keystone-devctrl.yaml
new file mode 100644
index 000000000000..dd73b62357ca
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/ti,keystone-devctrl.yaml
@@ -0,0 +1,84 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mfd/ti,keystone-devctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Texas Instruments Keystone Device State Control
+
+maintainers:
+  - Ivan Khoronzhuk <ivan.khoronzhuk@ti.com>
+
+description:
+  The Keystone II devices have a set of registers that are used to control the
+  status of its peripherals. This node is intended to allow access to this
+  functionality.
+
+properties:
+  compatible:
+    items:
+      - const: ti,keystone-devctrl
+      - const: syscon
+      - const: simple-mfd
+
+  reg:
+    maxItems: 1
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 1
+
+  ranges: true
+
+patternProperties:
+  "^gpio@[0-9a-f]+$":
+    type: object
+    description: Keystone DSP GPIO controller
+
+  "^interrupt-controller@[0-9a-f]+$":
+    type: object
+    description: Keystone DSP to ARM interrupt controller
+
+  "^reset-controller@[0-9a-f]+$":
+    type: object
+    description: Keystone reset controller
+
+required:
+  - compatible
+  - reg
+  - "#address-cells"
+  - "#size-cells"
+  - ranges
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    device-state-control@2620000 {
+        compatible = "ti,keystone-devctrl", "syscon", "simple-mfd";
+        reg = <0x02620000 0x1000>;
+        #address-cells = <1>;
+        #size-cells = <1>;
+        ranges = <0x0 0x02620000 0x1000>;
+
+        interrupt-controller@2a0 {
+            compatible = "ti,keystone-irq";
+            reg = <0x2a0 0x4>;
+            interrupts = <GIC_SPI 4 IRQ_TYPE_EDGE_RISING>;
+            interrupt-controller;
+            #interrupt-cells = <1>;
+            ti,syscon-dev = <&devctrl 0x2a0>;
+        };
+
+        reset-controller@328 {
+            compatible = "ti,keystone-reset";
+            reg = <0x328 0x10>;
+            ti,syscon-pll = <&pllctrl 0xe4>;
+            ti,syscon-dev = <&devctrl 0x328>;
+            ti,wdt-list = <0>;
+        };
+    };
diff --git a/Documentation/devicetree/bindings/mfd/ti-keystone-devctrl.txt b/Documentation/devicetree/bindings/mfd/ti-keystone-devctrl.txt
deleted file mode 100644
index 71a1f5963936..000000000000
--- a/Documentation/devicetree/bindings/mfd/ti-keystone-devctrl.txt
+++ /dev/null
@@ -1,19 +0,0 @@
-* Device tree bindings for Texas Instruments keystone device state control
-
-The Keystone II devices have a set of registers that are used to control
-the status of its peripherals. This node is intended to allow access to
-this functionality.
-
-Required properties:
-
-- compatible:		"ti,keystone-devctrl", "syscon"
-
-- reg:			contains offset/length value for device state control
-			registers space.
-
-Example:
-
-devctrl: device-state-control@02620000 {
-	compatible = "ti,keystone-devctrl", "syscon";
-	reg = <0x02620000 0x1000>;
-};

-- 
2.55.0

