Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30F6436194C;
	Thu, 10 Sep 2026 05:23:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.251.229.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789017835; cv=none; b=iz+7LdhVrl30YoznPZs0E6hFYtk2ESe/pbREBsq9jtgiZHUbFKpq1DbJhkuQVLBlqQdAwiRusJMXPH4Ww/gmza8u6XlFeD5rQ8TYmi+xW8zFJXypPwdTePJ+C/XnUvnZK3vNbiKQQko37ReXbDtKvMqnJEewJXNVqA/oEbsBeNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789017835; c=relaxed/simple;
	bh=0RQiQz22JROngEAnOqm1wdk9Vp5k4PRL7lP++Q8gPrA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=jksxIw/TIpiBM6IyCV9MHU60IT3q5LdzBBLjETGWbDCmxNdhXF97L7yo36bznKxDMAUeSUHNFYM9rCdqZ4ULnFlV2qOdhOLqZs1vJpXpEeLrLY4CNzn12Q9RMcDHo1wWjpqeQk351DLWNx1mQrwBlYT91SuZ1avDmcshZvBX5VM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com; spf=pass smtp.mailfrom=nabladev.com; dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b=Cmm5mRcJ; arc=none smtp.client-ip=178.251.229.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b="Cmm5mRcJ"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 595D51029BB;
	Thu, 10 Sep 2026 07:23:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1789017826;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=AkrUoyd0rKa+tTVoyNIa2h+axR97xJ+HeRyCUQvO/vs=;
	b=Cmm5mRcJT4Y+m3CBIe+AnYgQHg+ZufLrSzjYO+V/qKf7YwZeGNfdgSINu6xKyHxOzq8vGB
	bFB6Z8qIn/DbSiUs0nZ5wmiXQiSy9fKvQ62z9PEmgxoU5PPNhGR0lxD0y2gfseywkV+Io9
	Eh6x7/KIksHzFEduYXeYFL2dQ6UeXqn0NLs9J76TvCeGYuU495APwCKeTm4IN+CZSXxD1n
	hXakJSFYqbitaW/3lZeq3j+6YRR344bnVmajEyNYjwWla4vhdwu8aAWE900uWlsXnOf/tt
	5pzFNfvE0e4VUXIewbJuXzLyDjrwSLJEuJNnHAm6URjPpfY/xXwectdDD6CbOg==
From: Marek Vasut <marex@nabladev.com>
To: linux-usb@vger.kernel.org
Cc: Marek Vasut <marex@nabladev.com>,
	Pankaj Dev <pankaj.dev@st.com>,
	=?UTF-8?q?Cl=C3=A9ment=20Le=20Goffic?= <clement.legoffic@foss.st.com>,
	Gatien Chevallier <gatien.chevallier@foss.st.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
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
Subject: [PATCH v5 1/2] dt-bindings: usb: dwc3: Document ST STM32MP2 DWC3 xHCI USB controller
Date: Thu, 10 Sep 2026 07:22:40 +0200
Message-ID: <20260910052340.246717-1-marex@nabladev.com>
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
V5: No change
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

