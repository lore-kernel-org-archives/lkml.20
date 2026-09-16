Received: from va-2-16.ptr.blmpb.com (va-2-16.ptr.blmpb.com [209.127.231.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10E5137C908
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 02:20:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.127.231.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789611637; cv=none; b=Rj58SGastp6M5MgZYPH1hiX2chfBwyKQh985PzU2aqtZulRWCJuX2UEP0i5hCK+yKeWiXUQhFwZ6imqckCyA7c+q7qLuiKUJCq/jnLe/Svbw1gdzHqBBsfYnXsZEFlkB2i5jVgqL6pd2Q9QhgatEmUNhu+FGfPozU4R20RoTmNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789611637; c=relaxed/simple;
	bh=8kWsfvkyvhV104ITNeH/Fh1fDCcX6OdfZ06BqDoNoIo=;
	h=Mime-Version:Cc:From:Message-Id:Content-Type:To:Subject:Date:
	 References:In-Reply-To; b=dqdTfeNJ4CDNcPzOOgEQ2IJguwCzKAn2SJD4P+u4PSQug1VmnJXcYMK23Wh3l6QSa05ZVQn4licNfXCDOhRK4KhVI3WGgC2cPXbYgP7/BpEgVDOK3UpAeEiQLAAqkJ6xeo7yWSlqmgF4S6PsnKphikWJ1LcxNpFKisov9LORQV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bedmex.com; spf=none smtp.mailfrom=bedmex.com; dkim=pass (2048-bit key) header.d=bedmex-com.20200927.dkim.feishu.cn header.i=@bedmex-com.20200927.dkim.feishu.cn header.b=SEem00pg; arc=none smtp.client-ip=209.127.231.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bedmex.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bedmex.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bedmex-com.20200927.dkim.feishu.cn header.i=@bedmex-com.20200927.dkim.feishu.cn header.b="SEem00pg"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=bedmex-com.20200927.dkim.feishu.cn; t=1789611624;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=/ijL8TbZ6QRAV8M0Mh8w1uQRFFCioTjBpSOLAWpXmV0=;
 b=SEem00pguABdRSb516GEE1ByZN38VNAeU/wsDB62zVfbMGGdND7JOYJGY0HDKPr4+s3O77
 X9HGAT0dtvFE15AKpAdrEBGoD90GJxmnjZj3sf+vcvpFllFm4Pg4zA02QoNLZ73CK06lqv
 9x39w17/Btji+MCJHSllOlUGVeljWGOw34iy0QPBuypfApDckLB7vgNV6KRCaz5ePwmm/7
 N9sMYctsnrTaGHSRpDgjogWRIwAEffIrYv1njQ1zB7RiCK53Q9H3PpQEYGfyJhhKxbuDGW
 NQfuDaYgqVmTWlpLzHmzvcz3zpA+lpoYIYeRCrWWXviQx1wYSNdKFMpvnKWs9g==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Lms-Return-Path: <lba+26aab4e66+012f3e+vger.kernel.org+yanli.yang@bedmex.com>
Cc: <marcel@holtmann.org>, <luiz.dentz@gmail.com>, 
	<devicetree@vger.kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>, 
	<conor+dt@kernel.org>, <linux-kernel@vger.kernel.org>, 
	<zhirunliu@aicsemi.com>, <dijiaxu@aicsemi.com>, <chunqiuliu@aicsemi.com>, 
	<liheng.wei@bedmex.com>, <yanli.yang@bedmex.com>
X-Original-From: Yanli Yang <yanli.yang@bedmex.com>
Content-Transfer-Encoding: 7bit
From: "Yanli Yang" <yanli.yang@bedmex.com>
Message-Id: <576ee8b117196c67797588987c10aada174e3d45.1789546358.git.yanli.yang@bedmex.com>
Content-Type: text/plain; charset=UTF-8
Received: from [127.0.1.1] ([36.141.79.164]) by smtp.feishu.cn with ESMTPS; Thu, 17 Sep 2026 10:20:21 +0800
To: <linux-bluetooth@vger.kernel.org>
Subject: [RFC PATCH bluetooth-next 2/3] dt-bindings: net: bluetooth: Add AIC8800D80
Date: Wed, 16 Sep 2026 16:12:37 +0800
References: <cover.1789546358.git.yanli.yang@bedmex.com>
In-Reply-To: <cover.1789546358.git.yanli.yang@bedmex.com>

Describe the AIC8800D80 Bluetooth SDIO firmware-loading function and
UART HCI interface. Link the UART node to its SDIO firmware provider
with the aic,firmware-sdio phandle.

The UART interface uses H4 at 1500000 baud with hardware flow control.
Include an example showing both nodes and their association.
Signed-off-by: Zhirun Liu <zhirunliu@aicsemi.com>
Signed-off-by: Dijia Xu <dijiaxu@aicsemi.com>
Signed-off-by: Chunqiu Liu <chunqiuliu@aicsemi.com>
Signed-off-by: Liheng Wei <liheng.wei@bedmex.com>
Signed-off-by: Yanli Yang <yanli.yang@bedmex.com>
---
 .../net/bluetooth/aic,aic8800d80-bt.yaml      | 87 +++++++++++++++++++
 1 file changed, 87 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/bluetooth/aic,aic8800d80-bt.yaml

diff --git a/Documentation/devicetree/bindings/net/bluetooth/aic,aic8800d80-bt.yaml b/Documentation/devicetree/bindings/net/bluetooth/aic,aic8800d80-bt.yaml
new file mode 100644
index 000000000000..6fabb226cf15
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/bluetooth/aic,aic8800d80-bt.yaml
@@ -0,0 +1,87 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/bluetooth/aic,aic8800d80-bt.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: AIC AIC8800D80 Bluetooth
+
+maintainers:
+  - Zhirun Liu <zhirunliu@aicsemi.com>
+  - Dijia Xu <dijiaxu@aicsemi.com>
+  - Chunqiu Liu <chunqiuliu@aicsemi.com>
+  - Liheng Wei <liheng.wei@bedmex.com>
+  - Yanli Yang <yanli.yang@bedmex.com>
+
+description:
+  The AIC8800D80 is a Wi-Fi and Bluetooth combination chip. The Bluetooth
+  firmware is loaded through SDIO function 1, while Bluetooth HCI traffic uses
+  the H4 protocol over a UART interface with hardware flow control.
+
+properties:
+  compatible:
+    enum:
+      - aic,aic8800d80-bt
+      - aic,aic8800d80-bt-sdio
+
+  reg:
+    maxItems: 1
+
+  max-speed: true
+
+  aic,firmware-sdio:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      Phandle to the SDIO function used to load the Bluetooth firmware.
+
+required:
+  - compatible
+
+allOf:
+  - $ref: bluetooth-controller.yaml#
+  - if:
+      properties:
+        compatible:
+          const: aic,aic8800d80-bt-sdio
+    then:
+      properties:
+        reg:
+          const: 1
+        max-speed: false
+        aic,firmware-sdio: false
+      required:
+        - reg
+    else:
+      properties:
+        reg: false
+        max-speed:
+          const: 1500000
+      required:
+        - max-speed
+        - aic,firmware-sdio
+      allOf:
+        - $ref: /schemas/serial/serial-peripheral-props.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    mmc {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        bt_sdio: bluetooth@1 {
+            compatible = "aic,aic8800d80-bt-sdio";
+            reg = <1>;
+        };
+    };
+
+    serial {
+        uart-has-rtscts;
+
+        bluetooth {
+            compatible = "aic,aic8800d80-bt";
+            max-speed = <1500000>;
+            aic,firmware-sdio = <&bt_sdio>;
+        };
+    };
-- 
2.34.1
