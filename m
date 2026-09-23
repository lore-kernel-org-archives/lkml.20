Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF13644682F;
	Wed, 23 Sep 2026 07:44:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790149486; cv=none; b=pv3cI/IlsCnPM2j+MFxB3VwDDREANURQBk1HjefjtTBQQ0AYPkMjVvGQc05nxmRYu6Uz0zlk2tZ8ahHEy6weMNK/1sq16RlvgR6wqVF9kiAvdP5T2gPxlAWMhVXfH6pM8CzIjVr/RbozSKBRqo0W9305dftM7zqI03zUVjTWdW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790149486; c=relaxed/simple;
	bh=/2gTemkZVCx765RzD8+vg/si9R+RsMdUhgwTOizrnsU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=opvMqTPeFkDe7GEw9lmzGJV9tFAwT2h+xu1ZlOgoJpC3bgE8Y+cJmbS0f4/ZIrnWwfFP4vAhfNo/vFt4QtB5lP5bnEisJpwxU/1vvA8Gcrt/8xBsktFKtAV+Os1bL3gvdlRzPCoGSVyQ0JeSv4GEJSXr1Sy4n3VS16+95fbvo6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=Krr3MOtI; arc=none smtp.client-ip=220.197.31.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="Krr3MOtI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=QZ
	2CklEPM41fBCBH4wMrs2bqusIBHz8n45dNOsqwuuM=; b=Krr3MOtISiN8CanmkK
	MogyM2xLXQg8yg6bMaaBnZRMlfvyT8Gbf4Ff9krgL4Eot0MQT7kVDnstiTF4jz4l
	9brbj4QCrPuZ7+DV+oQE1cLn+eNaTyuGLpTcapDE/zGzAmr9ofi+fcuNMhBpVrYl
	ZoWDctCWf5w9iivdb0/hrBET8=
Received: from chaosheng-ASUS-TUF-Gaming-F16-FX607JV-FX607JV.lan (unknown [])
	by gzsmtp5 (Coremail) with SMTP id QCgvCgB3eHMzg7NqoFfKAw--.49100S2;
	Wed, 23 Sep 2026 15:43:49 +0800 (CST)
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
Subject: [PATCH] dt-bindings: mfd: rockchip,rk805: Convert pinctrl to DT schema
Date: Wed, 23 Sep 2026 15:43:37 +0800
Message-ID: <20260923074337.575122-1-quchaosheng000406@163.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:QCgvCgB3eHMzg7NqoFfKAw--.49100S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxuw47tr47AF45GF47CF4fAFb_yoWfGr47pF
	ZxAF4fJrn2gF43uw48tw18Cw1fuan7Ar4UC3WUKryIqan8uryjyr13Kw1rZFyDGFW0va4a
	vr15Wr98XwnrC3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0JUj2NZUUUUU=
X-CM-SenderInfo: xtxfxtprvkv0bjqqikiqw6il2tof0z/xtbC5BZ16mqzgzZcmwAA3G

pinctrl-rk805.txt describes the pinmux controller that is part of the
Rockchip RK805 PMIC. The PMIC itself is already described by
rockchip,rk805.yaml, so the pinmux part belongs there as well: the
pinctrl node is a child of the PMIC node, not a separate device.

Fold the pinmux description into rockchip,rk805.yaml and drop the
standalone text binding.

While doing so, add the missing child node schema. The rockchip,rk805.yaml
schema ends with 'additionalProperties: false' but did not describe the pin
configuration child nodes at all, so a valid pinmux node like the one shown
in pinctrl-rk805.txt was rejected:

    pmic@18 (rockchip,rk805): 'rk805-default-pins' does not match any of
    the regexes: '^pinctrl-[0-9]+$'

The pin configuration nodes require 'pins'; without it a node that names
no pin is accepted silently, while the text binding it replaces listed
'pins' as required. The RK805 exposes two output-only GPIOs, so 'pins' is
an enum of gpio0 and gpio1 and a typo such as "gpio2" is caught.

The nodes may be direct children of the PMIC, or sit one level deeper
inside a "pinmux" grouping node, which is the layout the example of the
text binding used. pinctrl-bindings.txt allows the configuration nodes to
be grandchildren of the pin controller, and the driver reaches both
layouts: pinconf_generic_dt_node_to_map() parses the referenced node and
then walks its children. The example shows both.

The example also regains the gpio-controller and #gpio-cells lines that the
example of the text binding had.

Reported-by: Sashiko <sashiko-bot@kernel.org>
Link: https://sashiko.dev/#/patchset/20260923034245.396417-1-quchaosheng000406@163.com?part=1
Link: https://sashiko.dev/#/patchset/20260923062746.516666-1-quchaosheng000406@163.com?part=1
Assisted-by: LLM
Signed-off-by: Quchaosheng <quchaosheng000406@163.com>
---
Changes in v4:
- Describe the pin configuration nodes both as direct children and inside a
  "pinmux" grouping node. Only the flat form was described, so the layout
  used by the example of the text binding this replaces was still rejected:

    pmic@18 (rockchip,rk805): 'pinmux' does not match any of the regexes:
      '-pins$', '^pinctrl-[0-9]+$'

  The nodes are now one definition referenced from both places, and the
  example shows the flat node and a "pinmux" node holding one.
- Name the binding in the summary. dt-bindings: mfd: <binding>: is the form
  Documentation/devicetree/bindings/submitting-patches.rst asks for on
  conversions, and 364 of the 385 dt-bindings: mfd: commits in the tree name
  a binding there.

Changes in v3:
- Capitalize the summary phrase. dt-bindings: mfd: titles are capitalized
  after the subsystem prefix (Add 61, Convert 20 against convert 6).
- Add gpio-controller and #gpio-cells to the example, which the text
  binding's example had and the conversion dropped.
- gpio-controller and #gpio-cells are deliberately *not* added to the
  required list. rv1108-evb, rv1108-elgin-r1 and rk3328-a1 do not set
  them, so requiring them breaks three in-tree boards:

    rv1108-evb.dtb: pmic@18 (rockchip,rk805): 'gpio-controller' is a required property

  No rk8xx PMIC schema requires the pair, and gpio.yaml already enforces
  that they appear together ("'#gpio-cells' is a dependency of
  'gpio-controller'"). The pinctrl driver calls devm_gpiochip_add_data()
  unconditionally, so the property is not what makes the GPIO controller
  work either.

Changes in v2:
- Require 'pins' in the pin configuration nodes. Without it a node that
  names no pin passes validation, while the text binding listed 'pins'
  as required.
---
 .../bindings/mfd/rockchip,rk805.yaml          | 65 ++++++++++++++++++-
 .../bindings/pinctrl/pinctrl-rk805.txt        | 63 ------------------
 2 files changed, 64 insertions(+), 64 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/pinctrl/pinctrl-rk805.txt

diff --git a/Documentation/devicetree/bindings/mfd/rockchip,rk805.yaml b/Documentation/devicetree/bindings/mfd/rockchip,rk805.yaml
index da2391530c16..aafc80212c48 100644
--- a/Documentation/devicetree/bindings/mfd/rockchip,rk805.yaml
+++ b/Documentation/devicetree/bindings/mfd/rockchip,rk805.yaml
@@ -77,6 +77,21 @@ properties:
     description:
       The input supply for LDO_REG3.
 
+  # pinctrl-bindings.txt allows the pin configuration nodes to be grandchildren
+  # of the pin controller, and the text binding this replaces used that layout:
+  # a "pinmux" node holding the nodes that carry "pins". The driver reaches both
+  # layouts, because pinconf_generic_dt_node_to_map() parses the referenced node
+  # and then walks its children.
+  pinmux:
+    type: object
+    additionalProperties: false
+    patternProperties:
+      '^.+$':
+        if:
+          type: object
+        then:
+          $ref: '#/$defs/rk805-pin-config'
+
   regulators:
     type: object
     patternProperties:
@@ -86,6 +101,38 @@ properties:
         unevaluatedProperties: false
     unevaluatedProperties: false
 
+$defs:
+  rk805-pin-config:
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
+    required:
+      - pins
+
+patternProperties:
+  '-pins$':
+    $ref: '#/$defs/rk805-pin-config'
+
 allOf:
   - if:
       properties:
@@ -125,9 +172,11 @@ examples:
             interrupt-parent = <&gpio2>;
             interrupts = <RK_PA6 IRQ_TYPE_LEVEL_LOW>;
             pinctrl-names = "default";
-            pinctrl-0 = <&pmic_int_l>;
+            pinctrl-0 = <&pmic_int_l>, <&rk805_default>, <&rk805_grouped>;
             rockchip,system-power-controller;
             wakeup-source;
+            gpio-controller;
+            #gpio-cells = <2>;
             #clock-cells = <0>;
 
             vcc1-supply = <&vcc_sys>;
@@ -137,6 +186,20 @@ examples:
             vcc5-supply = <&vcc_io>;
             vcc6-supply = <&vcc_io>;
 
+            rk805_default: rk805-default-pins {
+                pins = "gpio0";
+                function = "gpio";
+                output-high;
+            };
+
+            rk805_grouped: pinmux {
+                gpio01 {
+                    pins = "gpio1";
+                    function = "gpio";
+                    output-low;
+                };
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

