Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A63A377000;
	Fri, 28 Aug 2026 15:57:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.251.229.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787932647; cv=none; b=tDraZqc1UAhuIXiQnlaXe5rIFDGHy8NWV+Uext3dw0C2hZLXl81XldDIBUpgBOqmH40FrJiYIGpUlwT//+i+flW9yNLYE4zclB/v+b8at/x4MtT/s0ese+VGeETFUlsM779g9jXdT7rnP7PIbN3kczlqqUiqOILdEeahHjmmQGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787932647; c=relaxed/simple;
	bh=bZ7Oata/wEg1MFbBOi7pNNTjM0eEXVQY39Mng5oDNWk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IAa6a1mbRUR2PF9pu9YH7cJMcK+st/RHhec/LaukSo+RzGUoHCofSMqxvHBtbeBr7okbqEwzpnye/bzsQ+6cLxliqtAYDmXavrv7S9BDkgQmQcG0MKbNqEN4UNIu7djWeVQqzHpI1n/kyOaOXr7ZjCL+8tB8XmgFRaWqPdL7wSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com; spf=pass smtp.mailfrom=nabladev.com; dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b=V3Ij12UA; arc=none smtp.client-ip=178.251.229.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b="V3Ij12UA"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CD87611D13A;
	Fri, 28 Aug 2026 17:57:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1787932638; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=qEufsN0hdtIhJlCHiUqTZAy2vI/phpQRMuCMN1PnZ7U=;
	b=V3Ij12UA2oe0PBtf/AijFguSHJZwH0/c2qctR31ioABPj59kIpCcEKLbdHKi1LQjGMwogE
	DKCwJk88g/R3G+RibxPtomyQyStPjCVolFiz1yWBhkyaHHSUuncQ2IWyGJ5Y5oPoSnST6x
	Iho9cGCHXo+SpjxnKUJtDaGg/vTNLEqQgF8jiwg07C3cYe6fpePQXvjHZfsJ/PR5l18jVX
	paVG01lc0i4U0QGbwZ1Gr4ZhB4JfsgeEcFEH6HnIyUiyqLxeRLe4XRATLTiU84AQcYp2Ve
	KSBmrygm1mF9ZldWtibZFZDA/SMlaLN35aG1sIyxvDuq0dYYjRGkFSmqLYsS/Q==
From: Marek Vasut <marex@nabladev.com>
To: linux-usb@vger.kernel.org
Cc: fabrice.gasnier@foss.st.com,
	Pankaj Dev <pankaj.dev@st.com>,
	Marek Vasut <marex@nabladev.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Christian Bruel <christian.bruel@foss.st.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Rahul Kumar <rahul.kumar05@st.com>,
	Rob Herring <robh@kernel.org>,
	Rosen Penev <rosenp@gmail.com>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Vinod Koul <vkoul@kernel.org>,
	devicetree@vger.kernel.org,
	kernel@dh-electronics.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH v4 4/4] arm64: dts: st: Add USB nodes on stm32mp251
Date: Fri, 28 Aug 2026 17:55:48 +0200
Message-ID: <20260828155647.353877-5-marex@nabladev.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260828155647.353877-1-marex@nabladev.com>
References: <20260828155647.353877-1-marex@nabladev.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

From: Pankaj Dev <pankaj.dev@st.com>

Add USB controller and PHY nodes to stm32mp251 DT. This includes two
USB 2.0 FEMTO PHYs, USB 2.0 host controller and DWC3 DRD controller
nodes.

Signed-off-by: Pankaj Dev <pankaj.dev@st.com>
Co-developed-by: Marek Vasut <marex@nabladev.com>
Signed-off-by: Marek Vasut <marex@nabladev.com>
---
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Christian Bruel <christian.bruel@foss.st.com>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Pankaj Dev <pankaj.dev@st.com>
Cc: Rahul Kumar <rahul.kumar05@st.com>
Cc: Rob Herring <robh@kernel.org>
Cc: Rosen Penev <rosenp@gmail.com>
Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: Vinod Koul <vkoul@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: kernel@dh-electronics.com
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-phy@lists.infradead.org
Cc: linux-stm32@st-md-mailman.stormreply.com
Cc: linux-usb@vger.kernel.org
---
V2: - Fix up Sob/Cdb lines
    - Move PHY into syscfg subnode
    - Turn st,stm32mp25-syscfg into simple-mfd
    - Use clock-cells = <1> to discern OSC and future PLL clock from the PHY
V3: - Describe OHCI clock as the CMN clock
    - Fix up Sob/Cdb lines further
V4: - Cover USB2PHY2 SYSCFG_USB2PHY2TRIM2CR in reg property
    - Undo simple-mfd conversion of syscfg node
    - Split this from series arm64: dts: phy: st: usb: Add STM32MP2 USB support
      https://lore.kernel.org/all/20260822074816.548662-1-marex@nabladev.com/
---
 arch/arm64/boot/dts/st/stm32mp251.dtsi | 63 ++++++++++++++++++++++++++
 1 file changed, 63 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp251.dtsi b/arch/arm64/boot/dts/st/stm32mp251.dtsi
index 6e985f115b195..2a42f58dcb751 100644
--- a/arch/arm64/boot/dts/st/stm32mp251.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp251.dtsi
@@ -1746,6 +1746,47 @@ stmmac_axi_config_1: stmmac-axi-config {
 				};
 			};
 
+			usbh_ohci: usb@482e0000 {
+				compatible = "st,stm32mp25-ohci", "generic-ohci";
+				reg = <0x482e0000 0x1000>;
+				access-controllers = <&rifsc 63>;
+				clocks = <&usb2_phy1 1>, <&rcc CK_BUS_USB2OHCI>;
+				interrupts = <GIC_SPI 140 IRQ_TYPE_LEVEL_HIGH>;
+				phys = <&usb2_phy1>;
+				phy-names = "usb";
+				resets = <&rcc USBH_R>;
+				status = "disabled";
+			};
+
+			usbh_ehci: usb@482f0000 {
+				compatible = "st,stm32mp25-ehci", "generic-ehci";
+				reg = <0x482f0000 0x1000>;
+				access-controllers = <&rifsc 63>;
+				clocks = <&usb2_phy1 0>, <&rcc CK_BUS_USB2EHCI>;
+				companion = <&usbh_ohci>;
+				interrupts = <GIC_SPI 139 IRQ_TYPE_LEVEL_HIGH>;
+				phys = <&usb2_phy1>;
+				phy-names = "usb";
+				resets = <&rcc USBH_R>;
+				status = "disabled";
+			};
+
+			usb3dr: usb@48300000 {
+				compatible = "st,stm32mp25-dwc3";
+				reg = <0x48300000 0x100000>;
+				access-controllers = <&rifsc 66>;
+				clocks = <&rcc CK_KER_USB2PHY2>,
+					 <&rcc CK_BUS_USB3DR>,
+					 <&rcc CK_KER_USB2PHY2>;
+				clock-names = "ref", "bus_early", "suspend";
+				interrupts = <GIC_SPI 228 IRQ_TYPE_LEVEL_HIGH>;
+				phys = <&usb2_phy2>, <&combophy PHY_TYPE_USB3>;
+				phy-names = "usb2-phy", "usb3-phy";
+				resets = <&rcc USB3DR_R>;
+				st,syscfg = <&syscfg 0x4800>;
+				status = "disabled";
+			};
+
 			pcie_ep: pcie-ep@48400000 {
 				compatible = "st,stm32mp25-pcie-ep";
 				reg = <0x48400000 0x100000>,
@@ -2005,6 +2046,28 @@ syscfg: syscon@44230000 {
 			compatible = "st,stm32mp25-syscfg", "syscon";
 			reg = <0x44230000 0x10000>;
 			#clock-cells = <0>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			usb2_phy1: phy@2400 {
+				compatible = "st,stm32mp25-usb2phy1";
+				reg = <0x2400 0x24>;
+				#phy-cells = <0>;
+				#clock-cells = <1>;
+				clocks = <&rcc CK_KER_USB2PHY1>;
+				resets = <&rcc USB2PHY1_R>;
+				status = "disabled";
+			};
+
+			usb2_phy2: phy@2800 {
+				compatible = "st,stm32mp25-usb2phy2";
+				reg = <0x2800 0x10>;
+				#phy-cells = <0>;
+				#clock-cells = <1>;
+				clocks = <&rcc CK_KER_USB2PHY2EN>;
+				resets = <&rcc USB2PHY2_R>;
+				status = "disabled";
+			};
 		};
 
 		pinctrl: pinctrl@44240000 {
-- 
2.53.0

