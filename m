Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 601913BF662;
	Mon, 31 Aug 2026 23:18:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.251.229.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788218325; cv=none; b=JVLW86b3rgGEssXooyrEr6Xn7O7JBZ/Uza168xvVzXyUsgt9sRpivxzJfB1V2Os+Bt37IK1TA9R1fDe3UQ+mTa24EqFbH/0sfjTwG10LwsrG+cJhUoGXqMBBc3RybBJ9UPIOCgqc8swwLtWZdn3yldRjkcUKoFBIVSpAqzKZMos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788218325; c=relaxed/simple;
	bh=cZZROp1r3vOHrGqwDxyBXGFZhzw/eolxa99321KV3mk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oQAh/b6PTBRELfp02wx6xRYDfK/Y0XHHGlGjMRkFIcITYHCyVemvB9dTWu49CHa0f74gGovCZSYdG8RqrJxxOtPMXzgL4yaHpW7r0n1wM03mIl77rplwOEhYL+CUacTykLpVvjXvRGcXXUmMgLnQ1aYwWg6vnrooflOoDTA48ns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com; spf=pass smtp.mailfrom=nabladev.com; dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b=FtTbrli0; arc=none smtp.client-ip=178.251.229.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b="FtTbrli0"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A283411CD77;
	Tue, 01 Sep 2026 01:18:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1788218317; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=oUD827lYf3OZWVzfzJ3t/yax28+D50HigXswzFTcsLQ=;
	b=FtTbrli0TjEHvrJWvOq7VoAqZxU6T6qDLr6cBA4PPCSZ1ruJfSSH3jWWlst+1SDmw61Q1M
	E9NaH7omLm5GnrPz9kbG84zOKJlOYmd/NJAmXaZMCcpuPN4zxKnBEXMzLKE1rw3tcS2Sip
	938Jgn3x2tdMkUt1g5UKXSTnyOAYeymQE1PlDQMPvoURYYBnsmpA5GvDg33prwFZ5Q2n5B
	ICrUJWUT3jKe5FmIcNa2SROrGUjouknYqx8BLIx4G1gR+w5SzPKKkBqQbHq5SNyv5YYsI2
	hCEy/Ih0lHzgYG1KKMvGv2CJqny/+4V9sfgycvyAIZZM7Zj9ZYJlZDkZuPFJlA==
From: Marek Vasut <marex@nabladev.com>
To: linux-usb@vger.kernel.org
Cc: fabrice.gasnier@foss.st.com,
	Marek Vasut <marex@nabladev.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Francois Choleau <francois.choleau@st.com>,
	Christian Bruel <christian.bruel@foss.st.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Pankaj Dev <pankaj.dev@st.com>,
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
Subject: [PATCH v5 3/4] arm64: dts: st: Add USB nodes on stm32mp231
Date: Tue,  1 Sep 2026 01:17:34 +0200
Message-ID: <20260831231814.137120-4-marex@nabladev.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260831231814.137120-1-marex@nabladev.com>
References: <20260831231814.137120-1-marex@nabladev.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Add USB controller and PHY nodes to stm32mp231 DT. This includes two
USB 2.0 FEMTO PHYs, USB 2.0 host controller and DWC3 DRD controller
nodes.

Co-developed-by: Alexandre Torgue <alexandre.torgue@foss.st.com>
Signed-off-by: Alexandre Torgue <alexandre.torgue@foss.st.com>
Co-developed-by: Francois Choleau <francois.choleau@st.com>
Signed-off-by: Francois Choleau <francois.choleau@st.com>
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
    - Turn st,stm32mp23-syscfg into simple-mfd
    - Use clock-cells = <1> to discern OSC and future PLL clock from the PHY
V3: - Drop combophy which is not present on MP23
    - Describe OHCI clock as the CMN clock
V4: - Cover USB2PHY2 SYSCFG_USB2PHY2TRIM2CR in reg property
    - Undo simple-mfd conversion of syscfg node
    - Split this from series arm64: dts: phy: st: usb: Add STM32MP2 USB support
      https://lore.kernel.org/all/20260822074816.548662-1-marex@nabladev.com/
V5: No change
---
 arch/arm64/boot/dts/st/stm32mp231.dtsi | 64 ++++++++++++++++++++++++++
 1 file changed, 64 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp231.dtsi b/arch/arm64/boot/dts/st/stm32mp231.dtsi
index 4505fc0e3b537..127d25f0b9c9c 100644
--- a/arch/arm64/boot/dts/st/stm32mp231.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp231.dtsi
@@ -862,6 +862,48 @@ stmmac_axi_config_1: stmmac-axi-config {
 					snps,wr_osr_lmt = <0x7>;
 				};
 			};
+
+			usbh_ohci: usb@482e0000 {
+				compatible = "st,stm32mp23-ohci", "generic-ohci";
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
+				compatible = "st,stm32mp23-ehci", "generic-ehci";
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
+				maximum-speed = "high-speed";
+				phys = <&usb2_phy2>;
+				phy-names = "usb2-phy";
+				resets = <&rcc USB3DR_R>;
+				st,syscfg = <&syscfg 0x4800>;
+				status = "disabled";
+			};
 		};
 
 		bsec: efuse@44000000 {
@@ -1065,6 +1107,28 @@ syscfg: syscon@44230000 {
 			compatible = "st,stm32mp23-syscfg", "syscon";
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

