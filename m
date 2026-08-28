Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03DDA472F60;
	Fri, 28 Aug 2026 15:09:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.251.229.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787929790; cv=none; b=Rxu1SNYD1itZqLq29v+IJVkfp3r3yn1OAPHzI9kCOG2CYZLRdwTDhv+C+HyCLXj3LeJLt3UUo34yLVjY/athA7FWJtR3BX2UhCxHey0klOIZg6I4wZ6Bsgwsp2Xf5INt0DPL32PYTBoSht2oVPgpkpSsDwgfm43FFPjENDxCgjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787929790; c=relaxed/simple;
	bh=UerTMlWHA/YR2+M3GUt0lCADOLRItod+rivNeJGYyMc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=j6LYk+9E05YJyxZI8f4j2dle88x35xAKIDXhu7PbMxJNVUUp2d1m28Ykr9qdeo5cncJVMTrhXOrkaHRkhcgi9Oi6IZxHTIq+JvBW2BUGZzWw0YeKtohU6ilCUBnmaNUbWCups5MrEqq7aeV8YKOdw82JCqI49ij8GNCwV3AItuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com; spf=pass smtp.mailfrom=nabladev.com; dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b=LHcPtoIv; arc=none smtp.client-ip=178.251.229.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b="LHcPtoIv"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 224CD11BEC6;
	Fri, 28 Aug 2026 17:09:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1787929782;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=ozKD0N8uJ3vLeWvcaalYvsUuvddSsjd8y/LOkYrjclk=;
	b=LHcPtoIvFQUwZDxDylbBKu+LBBvIWMxI9filtuOofEmlLTvVi6pA+8KI6/9CJt17Bcaoof
	tpD0V1D6VQ8XDftoxMAbLvZXvgxcQYRYWzvAW7z0SQkgyJmf5T587LO2K/C2UkNldw3Bl8
	j0Nn0CP3D/VecsXZqxMesVeod/io3Eqyk+oJFjC3VFz4lPHJIhbmysMoXrfnK1GyINzcEp
	lNaTXioOC2YQ7ebp7ZzX6fmr0c5kBST+k5P7XcUidsnHZGK4hUNJjVc4fLWYhFkgtCy0OA
	DpXvxSnJzSA0Dd0yy3M8dYKgeCLsSUFMgMqi9WV7pw0j5afAiJmYxUaxh8JODA==
From: Marek Vasut <marex@nabladev.com>
To: linux-usb@vger.kernel.org
Cc: fabrice.gasnier@foss.st.com,
	Marek Vasut <marex@nabladev.com>,
	Pankaj Dev <pankaj.dev@st.com>,
	=?UTF-8?q?Cl=C3=A9ment=20Le=20Goffic?= <clement.legoffic@foss.st.com>,
	Gatien Chevallier <gatien.chevallier@foss.st.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	devicetree@vger.kernel.org,
	kernel@dh-electronics.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH v4 1/2] dt-bindings: usb: dwc3: Document ST STM32MP2 DWC3 xHCI USB controller
Date: Fri, 28 Aug 2026 17:09:14 +0200
Message-ID: <20260828150937.174735-1-marex@nabladev.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

The ST STM32MP2 SoC contains single instance of DWC3 USB controller with
glue logic wrapper around it controlled by syscon. Document the glue
logic and DWC3 controller.

Co-developed-by: Pankaj Dev <pankaj.dev@st.com>
Signed-off-by: Pankaj Dev <pankaj.dev@st.com>
Co-developed-by: Clément Le Goffic <clement.legoffic@foss.st.com>
Signed-off-by: Clément Le Goffic <clement.legoffic@foss.st.com>
Co-developed-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
Signed-off-by: Marek Vasut <marex@nabladev.com>
---
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Marek Vasut <marex@nabladev.com>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Rob Herring <robh@kernel.org>
Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: devicetree@vger.kernel.org
Cc: kernel@dh-electronics.com
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-stm32@st-md-mailman.stormreply.com
Cc: linux-usb@vger.kernel.org
---
V2: Fix up Sob/Cdb lines
V3: - Document maximum-speed
    - Switch resets to maxItems: 1
    - Drop label from example
    - Use generic over-current-active-low
    - Use ref: snps,dwc3-common.yaml and drop generic dr_mode/maximum-speed/phys/phy-names
V4: - Split this from series arm64: dts: phy: st: usb: Add STM32MP2 USB support
      https://lore.kernel.org/all/20260822074816.548662-1-marex@nabladev.com/
---
 .../bindings/usb/st,stm32mp25-dwc3.yaml       | 97 +++++++++++++++++++
 1 file changed, 97 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/st,stm32mp25-dwc3.yaml

diff --git a/Documentation/devicetree/bindings/usb/st,stm32mp25-dwc3.yaml b/Documentation/devicetree/bindings/usb/st,stm32mp25-dwc3.yaml
new file mode 100644
index 0000000000000..96bd557327252
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/st,stm32mp25-dwc3.yaml
@@ -0,0 +1,97 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/usb/st,stm32mp25-dwc3.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: STMicroelectronics STM32 MPU DWC3 USB SoC controller
+
+description:
+  The STM32 MPU DWC3 USB SoC controller block supports both
+  Host(SS/HS/FS/LS) and Device(SS/HS/FS) mode operation
+
+maintainers:
+  - Fabrice Gasnier <fabrice.gasnier@foss.st.com>
+  - Marek Vasut <marex@nabladev.com>
+
+allOf:
+  - $ref: snps,dwc3-common.yaml#
+
+properties:
+  compatible:
+    const: st,stm32mp25-dwc3
+
+  reg:
+    maxItems: 1
+
+  access-controllers:
+    maxItems: 1
+
+  clocks:
+    minItems: 3
+    maxItems: 3
+
+  clock-names:
+    items:
+      - const: ref
+      - const: bus_early
+      - const: suspend
+
+  interrupts:
+    maxItems: 1
+
+  resets:
+    maxItems: 1
+
+  over-current-active-low:
+    type: boolean
+    description: Over-Current signal polarity is active-low
+
+  st,syscfg:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    description: Phandle to system configuration controller.
+    items:
+      - items:
+          - description: phandle to syscfg
+          - description: USB3DR control offset within syscfg
+
+  st,enable-port-power-control:
+    type: boolean
+    description: Enable Host-Mode Port Power Control (bit-3 of capability param HCCPARAMS)
+
+  st,vbusen-active-low:
+    type: boolean
+    description: VBUS-ENABLE signal polarity is active-low
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - interrupts
+  - phys
+  - phy-names
+  - resets
+  - st,syscfg
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/st,stm32mp25-rcc.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/reset/st,stm32mp25-rcc.h>
+
+    usb@48300000 {
+        compatible = "st,stm32mp25-dwc3";
+        reg = <0x48300000 0x100000>;
+        clocks = <&rcc CK_KER_USB2PHY2>, <&rcc CK_BUS_USB3DR>, <&rcc CK_KER_USB2PHY2>;
+        clock-names = "ref", "bus_early", "suspend";
+        interrupts = <GIC_SPI 228 IRQ_TYPE_LEVEL_HIGH>;
+        phys = <&usb2_phy>, <&usb3_phy>;
+        phy-names = "usb2-phy", "usb3-phy";
+        resets = <&rcc USB3DR_R>;
+        over-current-active-low;
+        st,syscfg = <&syscfg 0x4800>;
+        st,vbusen-active-low;
+    };
-- 
2.53.0

