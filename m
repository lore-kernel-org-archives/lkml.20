Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76CF937F339;
	Wed, 23 Sep 2026 02:53:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790132044; cv=none; b=nSqFUdNt/VbCTGLHoo0PPrG5672wTcniwzthEyHr3g/s0ZgcGYUas+FFKObNyjgUJ0Xg/OqZiu/cCMwSV5cL9oRU8O+baHs6SlczxCShQ3mxlUCIw6xltwd5XPYw7ULsaMQYZWAoOb6zbSTpxnFQdoMZcZlUy39ifRUPe0yBW0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790132044; c=relaxed/simple;
	bh=K8FSXkSALMuprxIe0+Nl5a83riGgO2JaaHzP74HMnPU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rWg7+NtuCGw+CS4c2TkTW78/lGAAuWhVbEkMqpKOPjyZLrqblCx5MC8Ayv01kfhlLVv/uvlpfZ4SJETnIuuhblW/K1ICYw/tc4soOliGDAJtkzpK1f+2XCZ0Zc6XQawTjifcJUHmrL8BgrGKyKPkUE1Fx2VVNTbE1PzbzB22UUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=ZYPzt2SO; arc=none smtp.client-ip=117.135.210.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="ZYPzt2SO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=d7
	BPEJDhjZ2IMmndPKduh3yZ01YEY2DvwVys02/p6aI=; b=ZYPzt2SOEfjlCPQufz
	EzdJAFMqa1aBDgNFkAixTCkkbJ3W/RjEAqJmnC0mr2meKJVxy8Ocf/4hHCxuvyQB
	1zbsjxBaXSGUrpn2H9zqFEYAb8l9pVfTtorWqDA4QbOoRxQ/gRx4rePULZYJyT6k
	srdIMYm9Su0EpRdOuUuIpP/Z0=
Received: from chaosheng-ASUS-TUF-Gaming-F16-FX607JV-FX607JV.lan (unknown [])
	by gzsmtp3 (Coremail) with SMTP id PigvCgCXfaoYP7Nq_o2oAw--.5342S2;
	Wed, 23 Sep 2026 10:53:13 +0800 (CST)
From: Quchaosheng <quchaosheng000406@163.com>
To: Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Chris Zhong <zyw@rock-chips.com>,
	Zhang Qing <zhangqing@rock-chips.com>,
	mfd@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	quchaosheng000406@163.com
Subject: [PATCH] dt-bindings: mfd: convert rk805 pinctrl to DT schema
Date: Wed, 23 Sep 2026 10:53:02 +0800
Message-ID: <20260923025302.374919-1-quchaosheng000406@163.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PigvCgCXfaoYP7Nq_o2oAw--.5342S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxGr18ZryDAF1rCryfZryrZwb_yoW7Gr48pF
	ZxAFnxJrn2gF4Uu3y8t3W8Cw1Sgan7Ar4UC3Wj9ryxXa1jyr1Dtr13Kw1rZr98GrW8Za4Y
	vF1DWr98XwnrCw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pREoGPUUUUU=
X-CM-SenderInfo: xtxfxtprvkv0bjqqikiqw6il2tof0z/xtbC-xld0mqzPxndRQAA3O

pinctrl-rk805.txt describes the pinmux controller that is part of the
Rockchip RK805 PMIC. The PMIC itself is already described by
rockchip,rk805.yaml, so the pinmux part belongs there as well: the
pinctrl node is a child of the PMIC node, not a separate device.

Fold the pinmux description into rockchip,rk805.yaml and drop the
standalone text binding.

While doing so, add the missing '-pins$' child node schema. The
rockchip,rk805.yaml schema ends with 'additionalProperties: false' but did
not describe the pin configuration child nodes at all, so a valid pinmux
node like the one shown in pinctrl-rk805.txt was rejected:

    pmic@18 (rockchip,rk805): 'rk805-default-pins' does not match any of
    the regexes: '^pinctrl-[0-9]+$'

The RK805 exposes two output-only GPIOs. Encode this as an enum on the
'pins' property so that a typo such as "gpio2" is caught.

Assisted-by: LLM
Signed-off-by: Quchaosheng <quchaosheng000406@163.com>
---
 .../bindings/mfd/rockchip,rk805.yaml          | 33 +++++++++-
 .../bindings/pinctrl/pinctrl-rk805.txt        | 63 -------------------
 2 files changed, 32 insertions(+), 64 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/pinctrl/pinctrl-rk805.txt

diff --git a/Documentation/devicetree/bindings/mfd/rockchip,rk805.yaml b/Documentation/devicetree/bindings/mfd/rockchip,rk805.yaml
index da2391530c16..fdc34e0902d9 100644
--- a/Documentation/devicetree/bindings/mfd/rockchip,rk805.yaml
+++ b/Documentation/devicetree/bindings/mfd/rockchip,rk805.yaml
@@ -86,6 +86,31 @@ properties:
         unevaluatedProperties: false
     unevaluatedProperties: false
 
+patternProperties:
+  '-pins$':
+    type: object
+    description:
+      The RK805 has two output-only GPIOs which can be muxed to the GPIO
+      function and driven low or high at boot.
+    additionalProperties: false
+
+    properties:
+      pins:
+        description:
+          List of GPIO pins to configure.
+        items:
+          enum: [gpio0, gpio1]
+        minItems: 1
+        maxItems: 2
+
+      function:
+        description:
+          The RK805 only supports the GPIO function.
+        enum: [gpio]
+
+      output-low: true
+      output-high: true
+
 allOf:
   - if:
       properties:
@@ -125,7 +150,7 @@ examples:
             interrupt-parent = <&gpio2>;
             interrupts = <RK_PA6 IRQ_TYPE_LEVEL_LOW>;
             pinctrl-names = "default";
-            pinctrl-0 = <&pmic_int_l>;
+            pinctrl-0 = <&pmic_int_l>, <&rk805_default>;
             rockchip,system-power-controller;
             wakeup-source;
             #clock-cells = <0>;
@@ -137,6 +162,12 @@ examples:
             vcc5-supply = <&vcc_io>;
             vcc6-supply = <&vcc_io>;
 
+            rk805_default: rk805-default-pins {
+                pins = "gpio0", "gpio1";
+                function = "gpio";
+                output-high;
+            };
+
             regulators {
                 vdd_logic: DCDC_REG1 {
                     regulator-name = "vdd_logic";
diff --git a/Documentation/devicetree/bindings/pinctrl/pinctrl-rk805.txt b/Documentation/devicetree/bindings/pinctrl/pinctrl-rk805.txt
deleted file mode 100644
index 6ad49e51c72e..000000000000
--- a/Documentation/devicetree/bindings/pinctrl/pinctrl-rk805.txt
+++ /dev/null
@@ -1,63 +0,0 @@
-Pincontrol driver for RK805 Power management IC.
-
-RK805 has 2 pins which can be configured as GPIO output only.
-
-Please refer file <devicetree/bindings/pinctrl/pinctrl-bindings.txt>
-for details of the common pinctrl bindings used by client devices,
-including the meaning of the phrase "pin configuration node".
-
-Optional Pinmux properties:
---------------------------
-Following properties are required if default setting of pins are required
-at boot.
-- pinctrl-names: A pinctrl state named per <pinctrl-bindings.txt>.
-- pinctrl[0...n]: Properties to contain the phandle for pinctrl states per
-		<pinctrl-bindings.txt>.
-
-The pin configurations are defined as child of the pinctrl states node. Each
-sub-node have following properties:
-
-Required properties:
-------------------
-- #gpio-cells: Should be two. The first cell is the pin number and the
-  second is the GPIO flags.
-
-- gpio-controller: Marks the device node as a GPIO controller.
-
-- pins: List of pins. Valid values of pins properties are: gpio0, gpio1.
-
-First 2 properties must be added in the RK805 PMIC node, documented in
-Documentation/devicetree/bindings/mfd/rockchip,rk808.yaml
-
-Optional properties:
--------------------
-Following are optional properties defined as pinmux DT binding document
-<pinctrl-bindings.txt>. Absence of properties will leave the configuration
-on default.
-	function,
-	output-low,
-	output-high.
-
-Valid values for function properties are: gpio.
-
-There are also not customised properties for any GPIO.
-
-Example:
---------
-rk805: rk805@18 {
-	compatible = "rockchip,rk805";
-	...
-	gpio-controller;
-	#gpio-cells = <2>;
-
-	pinctrl-names = "default";
-	pinctrl-0 = <&pmic_int_l>, <&rk805_default>;
-
-	rk805_default: pinmux {
-		gpio01 {
-			pins = "gpio0", "gpio1";
-			function = "gpio";
-			output-high;
-		};
-	};
-};
-- 
2.43.0

