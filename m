Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 229953F107A
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 23:23:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788218640; cv=none; b=lJX2ZeZTh/ShpbU3rV0sboVcp4AHpFCt/szUifBMnD/195s3g/6tQxDA8iKrk2cJqhJLBPssT52zHGosMA78B23eggUBkrKiKEsEnRqcrKSduZ3KkzeTdpT0rGL4WA9fluS8x9jCa1WlWMMCySE64JB0jgjMGJwGppCMbOBRzq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788218640; c=relaxed/simple;
	bh=HIZOfZztkTOerpbTCbh6mnrcWPp1/knZyXp0t7QNArY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FeyE5TJrLLi7hd2364RXar1dc7BpPKU3a9HWKhv23ZO3bW593FsXf19ExH5q2g9Khle/050oFo9ta2pmNyjagx6T2x1pLdaNWg3+dDjbn8ZUOg5TG08ItHqLow0Ox/bQZwG96AL8Mcm9fwA8gUuGFTfZb19dNJxo60aynxxe27E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RVNAJ9d+; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RVNAJ9d+"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-396555b8c7cso550243a91.3
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 16:23:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788218638; x=1788823438; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t3EuOR9GUslMYy5cLrs5U/qjnYbkc8yoD6yTFWIvT+M=;
        b=RVNAJ9d+5Yfd5wv0q6idwasClhGVkQ5gyA9ildjGSO3eNxJ2stjTIHHEGnz/KNGLiv
         BHxk6Pq6S+pJote1usa3YDh4XVSgSOWboQbRvA0HgxY+mpTyv1sDbWV1h5ZSLW3vc9kE
         uF+l2F+FBMXKdGikAtIfhjfzktysQsUme4tDl45x2toIzn6fu43/n2wxf5jqGLzLPnoz
         RUViaw9XMWJCFnGQI7VUSfb3WbbCD//dCSWugGGzoiXAIHLHSd4xoGfO3v6rPiBNvWOW
         +mf1cNyqAqbCyrKEvxxrwqERL0j+AN6NanZYcXWeFgWZzm0f0C6g6VUHpD/H3XT6XBiw
         Pl7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788218638; x=1788823438;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t3EuOR9GUslMYy5cLrs5U/qjnYbkc8yoD6yTFWIvT+M=;
        b=OUWlAdKiAVW3fK206lT8VUMO7iftWjVrh20nOpAWWTS/VabYbe/v2By4aGxlpiRJuw
         Ldp8jAS8UU7EDt5VgcM3nzxAyf3TTCEUOj1qL/Tu8cXfoxwsfnB7ctboQslnY1Zg2u9V
         U2CuVBMPB1b1M04F6SBFyE3ZcOUeqavz6Bf01bwtXqy3fx5FMVMpIgWyGQIRDqlz/cch
         5BwUjCbRa2QKegOe7IDS9XvLZnGOkGoP/Lxb9k1L2gIEKCX/nl44z4Gx6y+OM1vuc4Xh
         +T/YCjI2m954A0whCE7C59bpAKioUyLOemSmfAp1UKJtvtuGH10KKfEvelpGxsP9GO0j
         uEdA==
X-Forwarded-Encrypted: i=1; AKwUvBy+O+sfjxw2tXraqsi76kxnxE8AQfQx0F4U8ezK28NIKz00JwGO2YE7atA738w+rDWpB5ghc1ypZ/BtakM=@vger.kernel.org
X-Gm-Message-State: AFuF++l6sX/xNO2X/Iga6Q9UwbUHwaIdlmnnz6S4U2ZTS+yjO5RblF1J
	sOoZ3b+R1LR1IYyHLGkAp7neX9P9eN2GyoQPtIhGcWwyYn1bS57mPhMTjExVnw==
X-Gm-Gg: AYBFou1hGo8tZENFDwvzM3XyFDcNosYsIV5g9YPSNXNfV07itIfi8qdk3Q62sUZRJwD
	tpJhYfXIDSP2EHimdGAvL69YhD8zWx7Q4JNN/kTerdXP2709rmtHR6qaTMFkigwMrVQVkpMlS7h
	SELv9ZXbgsgP8hBwRzHSh1CCN6haeQe+lc2nVOm4ghyM4y3GeOMPuHyE5sI9B/r9S2AyggDrU4O
	Wo5ITF4oFmpkomkte027Ik3/Bz3thMKUntHBqWIOBeJ+u4F1NGMCNIRcj9+eG7EmZpijgwl7p4W
	d3jsadGTF8mdph4wLC9QYjC7qvIAbzZgMTMlU8K2UDLekI87C8ww4bsYbxwp/FyFG71gsFuLaGC
	BCdms9pgmLRCsC2i8n+NlhB70E/ccBSnqQcf1Crd2k/yrsEoYzkAfyjdWkwOSymsa9bOst5fu96
	OkqTGhhrPtIryoQWromj6yuwuWClpINhM7TSn1h9NSSg1Ne0wmHP/0jFJzTiMrztobxnjUOG0=
X-Received: by 2002:a17:90b:5288:b0:381:bcfb:e710 with SMTP id 98e67ed59e1d1-398babbaa1bmr16637563a91.3.1788218637567;
        Mon, 31 Aug 2026 16:23:57 -0700 (PDT)
Received: from [10.60.78.252] ([2409:40c2:5002:4362:354a:8f21:7ceb:c8a6])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3990d75fc49sm1963213a91.12.2026.08.31.16.23.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 16:23:57 -0700 (PDT)
From: Bhargav Joshi <j.bhargav.u@gmail.com>
Date: Tue, 01 Sep 2026 04:53:05 +0530
Subject: [PATCH v3 1/6] dt-bindings: dma: ti,cppi41: Convert to DT schema
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260901-ti-am33-usb-v3-1-5e15c617d2e9@gmail.com>
References: <20260901-ti-am33-usb-v3-0-5e15c617d2e9@gmail.com>
In-Reply-To: <20260901-ti-am33-usb-v3-0-5e15c617d2e9@gmail.com>
To: Vignesh Raghavendra <vigneshr@ti.com>, Vinod Koul <vkoul@kernel.org>, 
 Frank Li <Frank.Li@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Andrzej Siewior <bigeasy@linutronix.de>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, 
 Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>, 
 Ravi B <ravibabu@ti.com>, Kumar Gupta <ajay.gupta@ti.com>, 
 Manivannan Sadhasivam <mani@kernel.org>, Bin Liu <b-liu@ti.com>
Cc: dmaengine@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
 linux-phy@lists.infradead.org, linux-omap@vger.kernel.org, 
 goledhruva@gmail.com, m-chawdhry@ti.com, daniel.baluta@gmail.com, 
 simona.toaca@nxp.com, j.bhargav.u@gmail.com
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788218595; l=5496;
 i=j.bhargav.u@gmail.com; h=from:subject:message-id;
 bh=HIZOfZztkTOerpbTCbh6mnrcWPp1/knZyXp0t7QNArY=;
 b=JXYLTjSgWVbdPooDMpJ/A4F3QlYlYjO7N0T4XSe0L+hgJAlH064Ttg3iMKDCGtIF2aOqfjK7t
 vNvl8IiNelaAeL+PHj8zJxwwAdETjJ3vAHpVCEfkmYdpfSkxF+XmX5n
X-Developer-Key: i=j.bhargav.u@gmail.com; a=ed25519;
 pk=IqNDwUZKECEA+n8wXctFLBbYL9NhFstZNbOznm/nX1k=

Convert TI CPPI 4.1 DMA controller text bindings to DT schema. Add
ti,am3359-cppi41 and ti,da830-cppi41 into single schema since they share
the same hardware IP block and driver. Add undocumented #dma-requests
and power-domains properties to match existing DTS usage.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Bhargav Joshi <j.bhargav.u@gmail.com>
---
 .../devicetree/bindings/dma/ti/ti,cppi41.yaml      | 109 +++++++++++++++++++++
 .../devicetree/bindings/usb/am33xx-usb.txt         |  14 ---
 .../devicetree/bindings/usb/da8xx-usb.txt          |  12 ---
 3 files changed, 109 insertions(+), 26 deletions(-)

diff --git a/Documentation/devicetree/bindings/dma/ti/ti,cppi41.yaml b/Documentation/devicetree/bindings/dma/ti/ti,cppi41.yaml
new file mode 100644
index 000000000000..a8c28e8ada07
--- /dev/null
+++ b/Documentation/devicetree/bindings/dma/ti/ti,cppi41.yaml
@@ -0,0 +1,109 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/dma/ti/ti,cppi41.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: TI CPPI41 DMA Controller
+
+maintainers:
+  - Sebastian Andrzej Siewior <bigeasy@linutronix.de>
+
+properties:
+  compatible:
+    enum:
+      - ti,am3359-cppi41
+      - ti,da830-cppi41
+
+  reg:
+    minItems: 3
+    maxItems: 4
+
+  reg-names:
+    minItems: 3
+    maxItems: 4
+
+  interrupts:
+    maxItems: 1
+
+  interrupt-names:
+    const: glue
+
+  "#dma-cells":
+    const: 2
+
+  dma-channels:
+    description: Number of DMA channels supported.
+    $ref: /schemas/types.yaml#/definitions/uint32
+
+  dma-requests:
+    description: Number of DMA requests supported.
+    $ref: /schemas/types.yaml#/definitions/uint32
+
+  power-domains:
+    maxItems: 1
+
+  "#dma-channels":
+    description: Deprecated, use dma-channels instead.
+    deprecated: true
+
+  "#dma-requests":
+    description: Deprecated, use dma-requests instead.
+    deprecated: true
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - "#dma-cells"
+  - dma-channels
+
+allOf:
+  - $ref: /schemas/dma/dma-controller.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: ti,am3359-cppi41
+    then:
+      properties:
+        reg:
+          minItems: 4
+        reg-names:
+          items:
+            - const: glue
+            - const: controller
+            - const: scheduler
+            - const: queuemgr
+        power-domains: false
+      required:
+        - interrupt-names
+        - interrupts
+        - dma-requests
+    else:
+      properties:
+        reg:
+          maxItems: 3
+        reg-names:
+          items:
+            - const: controller
+            - const: scheduler
+            - const: queuemgr
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    dma-controller@7402000 {
+        compatible = "ti,am3359-cppi41";
+        reg = <0x47400000 0x1000>,
+              <0x47402000 0x1000>,
+              <0x47403000 0x1000>,
+              <0x47404000 0x4000>;
+        reg-names = "glue", "controller", "scheduler", "queuemgr";
+        interrupts = <17>;
+        interrupt-names = "glue";
+        #dma-cells = <2>;
+        dma-channels = <30>;
+        dma-requests = <256>;
+    };
diff --git a/Documentation/devicetree/bindings/usb/am33xx-usb.txt b/Documentation/devicetree/bindings/usb/am33xx-usb.txt
index 654ffc62d013..8431de346129 100644
--- a/Documentation/devicetree/bindings/usb/am33xx-usb.txt
+++ b/Documentation/devicetree/bindings/usb/am33xx-usb.txt
@@ -51,20 +51,6 @@ USB
 The controller should have an "usb" alias numbered properly in the alias
 node.
 
-DMA
-~~~
-- compatible: ti,am3359-cppi41
-- reg: offset and length of the following register spaces: USBSS, USB
-  CPPI DMA Controller, USB CPPI DMA Scheduler, USB Queue Manager
-- reg-names: glue, controller, scheduler, queuemgr
-- #dma-cells: should be set to 2. The first number represents the
-  endpoint number (0 … 14 for endpoints 1 … 15 on instance 0 and 15 … 29
-  for endpoints 1 … 15 on instance 1). The second number is 0 for RX and
-  1 for TX transfers.
-- dma-channels: should be set to 30 representing the 15 endpoints for
-  each USB instance.
-- #dma-channels: deprecated
-
 Example:
 ~~~~~~~~
 The following example contains all the nodes as used on am335x-evm:
diff --git a/Documentation/devicetree/bindings/usb/da8xx-usb.txt b/Documentation/devicetree/bindings/usb/da8xx-usb.txt
index fb2027a7d80d..00320d92d3bb 100644
--- a/Documentation/devicetree/bindings/usb/da8xx-usb.txt
+++ b/Documentation/devicetree/bindings/usb/da8xx-usb.txt
@@ -27,18 +27,6 @@ Optional properties:
 ~~~~~~~~~~~~~~~~~~~~
  - vbus-supply: Phandle to a regulator providing the USB bus power.
 
-DMA
-~~~
-- compatible: ti,da830-cppi41
-- reg: offset and length of the following register spaces: CPPI DMA Controller,
-  CPPI DMA Scheduler, Queue Manager
-- reg-names: "controller", "scheduler", "queuemgr"
-- #dma-cells: should be set to 2. The first number represents the
-  channel number (0 … 3 for endpoints 1 … 4).
-  The second number is 0 for RX and 1 for TX transfers.
-- dma-channels: should be set to 4 representing the 4 endpoints.
-- #dma-channels: deprecated
-
 Example:
 	usb_phy: usb-phy {
 		compatible = "ti,da830-usb-phy";

-- 
2.55.0

