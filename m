Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72532466B5E;
	Wed,  2 Sep 2026 14:13:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.251.229.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788358411; cv=none; b=Rb1wL3Z/VnK4bzdsXNL3Gvw+9zV3qpJc4Gg2GHHXqRUd+e8ZeVl/EoAhk/tt3kXKj3svaKo1UXl/3gPbh8Rtd2agMnM8fHVTluW1Oits/FUpOQ7UgrtrYXnqlW+o4ALSchq/ULx4+rY7c9Cn7XvghhDSApQ7hcVoQbBUFj7rWkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788358411; c=relaxed/simple;
	bh=Mqot337cJnJKKAtreAwTSrt4VWnpkkN6lFNzXZMsAlM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=cpEuQ4sNTMjuv2WAHbhfSo9+HtE16cOMqF5fau5e7VQy5ZBtM+dk/FXj/6Vf2y8tCo1Ri7/TcbDwVKerI/C/vBeBnMw0N7GsPJwQgWaLmaYQV0rCTJhY3WMAduHUYUy/d1bmWgmwAJI6gIPSjR0XvqsrZ0Lz7Ece92eAa/MqPu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com; spf=pass smtp.mailfrom=nabladev.com; dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b=cqIENlVq; arc=none smtp.client-ip=178.251.229.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b="cqIENlVq"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 26D1511BB09;
	Wed, 02 Sep 2026 16:13:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1788358401;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=5YogQB6SySQ6aAk/WCOW5RxdsBzeZ+b+tzLvpdAkOkQ=;
	b=cqIENlVqirvUqfu3sa9gEzGPy9IuHNLsFOxB1X0ScF+P9r/15lI6WkBtCpbeJ4W+dSyN6J
	HvoC8ggeu/IDJITA2mErtPkk7ZdtSBh4GoooilITGh6X/RHm9767RplejnJIBOrF4r2wB4
	ymL0Cc8bq7Bkpat3WfpbiZR1jq4s0+ZcxVrhWbyc24AyaBL5E5aHjRl1saq1a35NUD1c6p
	dy5ezy71X34MbkKA/D56GWjZ7FUumCI4ksw6X7iJPs7ANsLWAzq6Q1l8zkq7rzFDfGH0+R
	IUn5wNx7RXqsP8/UoiBkEAuqFQk5yPNlCpL5+51vElPUPBVjJSdkiIZbvD21cw==
From: Marek Vasut <marex@nabladev.com>
To: linux-phy@lists.infradead.org
Cc: Pankaj Dev <pankaj.dev@st.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Rahul Kumar <rahul.kumar05@st.com>,
	Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
	=?UTF-8?q?Cl=C3=A9ment=20Le=20Goffic?= <clement.legoffic@foss.st.com>,
	Marek Vasut <marex@nabladev.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Christian Bruel <christian.bruel@foss.st.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Patrice Chotard <patrice.chotard@foss.st.com>,
	Rob Herring <robh@kernel.org>,
	Rosen Penev <rosenp@gmail.com>,
	Vinod Koul <vkoul@kernel.org>,
	devicetree@vger.kernel.org,
	kernel@dh-electronics.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH v5 1/2] dt-bindings: phy: Document ST STM32MP25 USB2-FEMTO PHY
Date: Wed,  2 Sep 2026 16:13:02 +0200
Message-ID: <20260902141312.649406-1-marex@nabladev.com>
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

From: Pankaj Dev <pankaj.dev@st.com>

Document USB2 PHY for STM32MP25 USB2 controllers, which includes the
USB2.0 host-only controller and USB 2.0 part of the DWC3 controller.
Two such PHYs in total are present in STM32MP25 SoC, they both are
slightly different, therefore they use different compatible string
to discern them.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Pankaj Dev <pankaj.dev@st.com>
Co-developed-by: Rahul Kumar <rahul.kumar05@st.com>
Signed-off-by: Rahul Kumar <rahul.kumar05@st.com>
Co-developed-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Co-developed-by: Clément Le Goffic <clement.legoffic@foss.st.com>
Signed-off-by: Clément Le Goffic <clement.legoffic@foss.st.com>
Co-developed-by: Marek Vasut <marex@nabladev.com>
Signed-off-by: Marek Vasut <marex@nabladev.com>
---
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Christian Bruel <christian.bruel@foss.st.com>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Manivannan Sadhasivam <mani@kernel.org>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Pankaj Dev <pankaj.dev@st.com>
Cc: Patrice Chotard <patrice.chotard@foss.st.com>
Cc: Rahul Kumar <rahul.kumar05@st.com>
Cc: Rob Herring <robh@kernel.org>
Cc: Rosen Penev <rosenp@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: kernel@dh-electronics.com
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-phy@lists.infradead.org
Cc: linux-stm32@st-md-mailman.stormreply.com
---
V2: - Fix up Sob/Cdb lines
    - Fix up compatible string in example
    - Use additionalProperties: false
    - Expand description:
    - Use clock-cells = <1> to discern OSC and future PLL clock from the PHY
V3: - Move clock-cells next to PHY cells
    - Fix the bindings
    - Fix up Sob/Cdb lines further
V4: - Reorder the properties: list, put #...cells at the end, reg after compatible
    - Split this from series arm64: dts: phy: st: usb: Add STM32MP2 USB support
      https://lore.kernel.org/all/20260822074816.548662-1-marex@nabladev.com/
V5: Add RB from Krzysztof
---
 .../bindings/phy/st,stm32-usb2phy.yaml        | 68 +++++++++++++++++++
 1 file changed, 68 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/st,stm32-usb2phy.yaml

diff --git a/Documentation/devicetree/bindings/phy/st,stm32-usb2phy.yaml b/Documentation/devicetree/bindings/phy/st,stm32-usb2phy.yaml
new file mode 100644
index 0000000000000..c76e94c044e67
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/st,stm32-usb2phy.yaml
@@ -0,0 +1,68 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/st,stm32-usb2phy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: STMicroelectronics STM32 MPU High-Speed USB PHY
+
+description:
+  USB2 PHY block in STM32 is attached to USB 2.0 Host controller and
+  USB 2.0 side of DWC3 DRD controller, and provides the USB LS/FS/HS
+  connectivity. Both PHYs are the FEMTO-PHY, but their configuration
+  bits in the system control register are different for each variant.
+
+maintainers:
+  - Fabrice Gasnier <fabrice.gasnier@foss.st.com>
+  - Marek Vasut <marex@nabladev.com>
+  - Pankaj Dev <pankaj.dev@st.com>
+
+properties:
+  compatible:
+    enum:
+      - st,stm32mp25-usb2phy1
+      - st,stm32mp25-usb2phy2
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  resets:
+    maxItems: 1
+
+  vdd33-supply:
+    description: Phandle to regulator providing 3V3 power supply to the USB2 HS PHY
+
+  "#clock-cells":
+    const: 1
+
+  "#phy-cells":
+    const: 0
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - resets
+  - vdd33-supply
+  - "#clock-cells"
+  - "#phy-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/st,stm32mp25-rcc.h>
+    #include <dt-bindings/reset/st,stm32mp25-rcc.h>
+
+    usb-phy@2400 {
+        compatible = "st,stm32mp25-usb2phy1";
+        reg = <0x2400 0x24>;
+        #phy-cells = <0>;
+        #clock-cells = <1>;
+        clocks = <&rcc CK_KER_USB2PHY1>;
+        resets = <&rcc USB2PHY1_R>;
+        vdd33-supply = <&vdd33usb>;
+    };
-- 
2.53.0

