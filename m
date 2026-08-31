Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D8EF408623
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 23:38:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788219528; cv=none; b=JxMUZU3D+lGog3APKT4Cps3kho33xUSxzyot50+n2ywRecGlzZhHkz9QXylDTDJkVToJ6qvXI5S0h/Ryd4f36QtiPTvcKJzaGdmW+XLXW7E5t4l/Q3BjFcWM6ZJ5xBPv3bYUiKKRzB748VIvXW5T7zgdLHx4jTWfD/QA39xPgl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788219528; c=relaxed/simple;
	bh=8CDwIcw9Cwa7xa/xb0sjU9AEZPy8+v5Rr1k2WHBl6B8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DhThgaH72QQGqIISRgvLN4nw0ObvhAqWR3RSTU/+T3RIA8wT0w+YE4YVjFmvtYSguYhPPlaXKW950QqA7qgL6Yy6Hoe5boSs7d1T67Ht/w5/XGMCJ6K1lI+jvyqklHo166tuKvV2naV1+twRmEaGaJwVYFWbV5z/TB3AXPupUTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MJ/9WwEn; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MJ/9WwEn"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-c9d290216d0so645590a12.3
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 16:38:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788219527; x=1788824327; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=shThNVvHvcCvkYDrxu1ymT+FnDuu2k7qfXr77Zt+pxI=;
        b=MJ/9WwEnmn0IIPstXrg2HYZ1XmblzdrJlq0sCbcMlJRIqyOdzbW6W8rgy5ns/tR26w
         ZvsQ5Tirm9/JNMtXLBIgZxarb7EzAI6/5OBWqtCJ5f0WME7DTueUWxVcozbw/NvhWXaa
         N0fF1f0vlE4GpJT+Rnk1B6D66vSTSVE2xocewKRAHHa2Hg/ie3LNV8cVjlLuwDVi0YOV
         EPGJN+bBhxTdCPxz+MW7elPyPLB0VtWQHW7giX55hRpiqsN/A4bp19bjTwp0CG3j/414
         rlxgxU+XEg0lTY/qHWxpWarzGizRlKeo9B/wK/SC9Yc7+GzX2np1WHgg9e28lKX7br8l
         htEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788219527; x=1788824327;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=shThNVvHvcCvkYDrxu1ymT+FnDuu2k7qfXr77Zt+pxI=;
        b=RFYoYwzXJthxqwBzGX+4RLo9ZKvQrHIK9NWf25wHkImlqpM75Ji4r8/W2h3GQo1mNv
         jAZYNTH3SKgF8QVRLEhNnpTS2PLhK2nOYa56RMNy9uTL3HeIC7BWyKQpIF5vIwmggNcD
         LgHfyAe8QRfu80b9KxCSRebALxq7N4l8EHbYntFvQX+guV10gfXdFXWXbpdgYsLl3Jsc
         LOFBI+aaaynUA/wL3gocE5Tkh+JyFR+GFxY8WB2VhdXrvjEK6cusyE9q985gHH+ceNVx
         fMKXnAcX7wdcZtTn4WR0zid1ACoWpiq/zjJUFVOsg4r+nlujsJqjLqc2KPnjRulR9+ct
         HLqg==
X-Forwarded-Encrypted: i=1; AKwUvByaj/7xsR6gbYQtyfufEcKHnxbbJJEIRmbaUyTvbIdfK5s0oViBG+eBGDoy0uDAHiNqYQpbfoDXKQTUjD8=@vger.kernel.org
X-Gm-Message-State: AFuF++kzUfN5sIoDc34VPzIrAHNkS1tFmfHdA3IrdJOZwFyRaL3EOm5x
	t5azGZ/T0OKPgEZhxPkEdlGLsjjnu0Mp30U8sfoSRKxUUCNG+WCcKxJZ
X-Gm-Gg: AYBFou21dzo1XL0oCMvXqUpwWgg6quXo1TAGYf6CEUj/IC1Jlj2yYlCCtfTXoEqlpzs
	n10EmcbRnJQtzi1L+Ini6MSIZAee2J6n5xTVhuqC2oLMqFbY4V/cHIYC9BeSR1zH0DiNaaRcJFo
	4qi2f9E/o8w6uDZR3SZIiwrQd271FqvKV1YoP2VkOPcSVt1EHCdXphbKPI5AfBnCXPoaKt3QprG
	gQk7Z71HLFyNx6+6/AURnIZDMuzamr5zexoedpPjMEKDvIm0zTf4+oDrFDzuBciIiRYSzrdXjfz
	frcbIoEUvN2CQrytTx4rlpl+1Jm67fGu7GA7/0gXlvAdVIs2tCqOA14+Ci4mM8aDErqE5Gxod54
	dXlR+ngoFGUhgXF60+m4roF074wprTVqhTRxYRKv4UoYXqcLWmlyfPdYHycae3bsVsV10WZvjP8
	/5cb0QF9ydhGkewOfjXR1XpXAVT48tgn5k7KulH34Xl0vckfCrH40tKR6zmqD3WEt0ayNUB+zbv
	uI+gQSHWA==
X-Received: by 2002:a17:90b:17cd:b0:390:af7c:fe5e with SMTP id 98e67ed59e1d1-398bab29b39mr14687470a91.2.1788219526679;
        Mon, 31 Aug 2026 16:38:46 -0700 (PDT)
Received: from [10.60.78.252] ([2409:40c2:5002:4362:354a:8f21:7ceb:c8a6])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3990c40d0c9sm2143682a91.7.2026.08.31.16.38.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 16:38:46 -0700 (PDT)
From: Bhargav Joshi <j.bhargav.u@gmail.com>
Date: Tue, 01 Sep 2026 05:08:13 +0530
Subject: [PATCH v4 2/2] dt-bindings: mfd: ti,keystone-devctrl: Convert to
 DT schema
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260901-ti-keystone-devctrl-v4-2-2922f2a44792@gmail.com>
References: <20260901-ti-keystone-devctrl-v4-0-2922f2a44792@gmail.com>
In-Reply-To: <20260901-ti-keystone-devctrl-v4-0-2922f2a44792@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788219500; l=4141;
 i=j.bhargav.u@gmail.com; h=from:subject:message-id;
 bh=8CDwIcw9Cwa7xa/xb0sjU9AEZPy8+v5Rr1k2WHBl6B8=;
 b=RtlS7lipVVDU7Yzpx9NBd0BOlUuy+8xcgvjciTvzjXfiuS1dupEJC1duo8n5rtoNPopwOZ/sS
 DgTXTYQZVE6Aj+gvomsw9VBPHnR99qUXpaDoybfoXdf845nyA0Maj+g
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
 .../bindings/mfd/ti,keystone-devctrl.yaml          | 90 ++++++++++++++++++++++
 .../bindings/mfd/ti-keystone-devctrl.txt           | 19 -----
 2 files changed, 90 insertions(+), 19 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/ti,keystone-devctrl.yaml b/Documentation/devicetree/bindings/mfd/ti,keystone-devctrl.yaml
new file mode 100644
index 000000000000..564dfc8a731f
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/ti,keystone-devctrl.yaml
@@ -0,0 +1,90 @@
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
+    required:
+      - compatible
+
+  "^interrupt-controller@[0-9a-f]+$":
+    type: object
+    description: Keystone DSP to ARM interrupt controller
+    required:
+      - compatible
+
+  "^reset-controller@[0-9a-f]+$":
+    type: object
+    description: Keystone reset controller
+    required:
+      - compatible
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

