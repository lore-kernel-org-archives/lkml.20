Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2F0C447814;
	Fri, 28 Aug 2026 15:07:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.251.229.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787929675; cv=none; b=fkvkCBi97p2yg8Hsi+69pSnV4ZDbY6yfFdS58VAiqmx/IwLFGnQ1F05kHMwgkxT3iGqJ2d4l3G4leVAb/NL/IEVzi0RBcn2RYam0+uxTdsVd7R1uFwhhtPGAQ94UDnItFVoUGEKvK1Ekbg8ngVO9KTxQ+etmDP9gU72APQbQQLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787929675; c=relaxed/simple;
	bh=NUms34vTt7x3ScWWN/3IEnfMk6KLfOlPqDOhbCTeHXk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=KyX1wFnBG/9Wt5qzpV2Nsb9sEbbcnCHjz84T5HX7N19UCcQWwVOxiQL7hwPkSTa17rG8v6os2viARQAjtCeAOpRsxVa9XvRoPX+m0fEd2BlnXFB7GUfeMesSZOrvhstIdCQYkUElUoNCxTPC93Cpw9cWZvGxnpX4uAIQ8cDbSX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com; spf=pass smtp.mailfrom=nabladev.com; dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b=ZvnBigNI; arc=none smtp.client-ip=178.251.229.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b="ZvnBigNI"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B122811C674;
	Fri, 28 Aug 2026 17:07:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1787929667;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=HnQsGVBcMqLyqgz+EySRMFEgpKMElUcUqyIaY4zbZ+c=;
	b=ZvnBigNITXGrLPmkszcPxDyGZmIMY2osDtwGZJM7W3iYe18RVg7v9aqXihjKYx2OmYxNeN
	LulJLci90sxfxzCE1eAZ18mRoXTH02uMTMnzMQ9lcoYPcvfKY/lDcshK3cLKzfNrIgn0uA
	M4rz79ews4JndIlFWSbk6TxXhUHHm+qK1f+e+1tZ2OxyeUBgmrD/6c2Gp8mqZ2wuHKoXHc
	7IDhncWyQAeg2m3100xkbgM+vah1QRUHTCpyHHrqKoml9EZi1P1RC1M5zwJKib3Xu+LkWb
	/gcJv5RbCLwbhZcDL4CHSNcpzLL+npjyAZuMBTPJgHH3RjqUdJ8Npofs1wfFrg==
From: Marek Vasut <marex@nabladev.com>
To: linux-phy@lists.infradead.org
Cc: Pankaj Dev <pankaj.dev@st.com>,
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
Subject: [PATCH v4 1/2] dt-bindings: phy: Document ST STM32MP25 USB2-FEMTO PHY
Date: Fri, 28 Aug 2026 17:06:56 +0200
Message-ID: <20260828150739.174460-1-marex@nabladev.com>
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

