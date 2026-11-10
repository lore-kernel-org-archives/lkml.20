Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=156.224.82.27
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794296752;
	b=ra+VU6J3GUVT+vNUqcG0nKNBcywj24sbwu+bjEg4t65l7yOnJ89IV5EWfGrkYSqwX3CY
	 ekdJ61LpW1Di+ORf5Jl6jAFLCkOFWt8CDKJSeTelKgjhYIBJ9kCG6RPSf9uNA63u5EeQM
	 /n9gPxybp3Noh2RDd7Y3aeWXO7Jztng3zJkYVdR2bmkfT1pZQzVQRpRw967zJ7cX7A7zx
	 cVZTDpz2dOvVLgR+xrIwTIACPF0gDSx3/XQ3WKjSOKkyeDBTfoxLaLDkNNba8Lfrx9w1M
	 DlTA54H7raHasDCcGUacBWlsh1jQH3+wKozWjoUDxuKarMCm1jG19EJgKcs7/kOcSQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794296752;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 X-HM-Tid:X-HM-MType:X-HM-Spam-Status:DKIM-Signature;
	bh=KKnJ9j2I4wwMNUFVM40Ukd6sfFrm3+y8FEhOVW263CY=;
	b=mdFbTEfY1Uv973QBbbeEjpctdVmqPfxDv5EoulUHyFMsSPepqRNJUcdZy9IK4XZKKZnD
	 ei7hTOD9YZJvMA4j1z7rJM5+lm2c24Dm04B6T5WqUZRbAD+sOl3IfH6pTb80GdvTIyVdE
	 I3+n1xCGCvIdJidf00DBDWprk2GioyTJhiljWd30CpXY34prFExWuhFcHBhVIeK6bsVPU
	 kIGGQACePoC+HmI9/WZE8WigpWsAgw4wREKDQnkNtcSDYdNflR1PKVIPQlO5kPzW2YTf5
	 JW96WDKPeILAvEiNZIidQOig7Xj+w9a29aOceC67Sq3qwb08HlpaVI1xl70Xe0wMP7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rock-chips.com;
	spf=pass smtp.mailfrom=rock-chips.com;
	dkim=pass header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b="CqVUt/EA";
	arc=none smtp.remote-ip=156.224.82.27
Received: from mail-m8227.xmail.ntesmail.com (mail-m8227.xmail.ntesmail.com [156.224.82.27])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9365660A2615;
	Tue, 10 Nov 2026 07:45:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9365660A2615
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b=CqVUt/EA
Received: from zyb-HP-ProDesk-680-G2-MT.. (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 542170afb;
	Tue, 10 Nov 2026 15:45:41 +0800 (GMT+08:00)
From: Damon Ding <damon.ding@rock-chips.com>
To: Vinod Koul <vkoul@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Dave Jones <s.dave.jones@gmail.com>,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Damon Ding <damon.ding@rock-chips.com>
Subject: [PATCH v5 3/3] arm64: dts: rockchip: rk356x: Add eDP controller and phy nodes
Date: Tue, 10 Nov 2026 15:45:33 +0800
Message-Id: <20261110074533.4052196-4-damon.ding@rock-chips.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261110074533.4052196-1-damon.ding@rock-chips.com>
References: <20261110074533.4052196-1-damon.ding@rock-chips.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa1c46b7ef103a8kunm3f9229952eb2ef
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkZSEkYVkwYT0IfHUtKTUNMH1YVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSU
	JDQ0xVSktLVUtZBg++
DKIM-Signature: a=rsa-sha256;
	b=CqVUt/EAklDkxLi1y7T45Zklx7jb2xZHZPAsF9ek4ovXHNZFUS/v38TnVmDLMOpkZgu2bQa+uPregpeLvrAsFzLi0LQC/9VzgdtQkurHa5ixb1xx7RAQPbg5BEiLZafyQ5nk7HjUaOzm9RI6Q+QzJ9Ag3BFAf2v2JdXHbqOdJXo=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=KKnJ9j2I4wwMNUFVM40Ukd6sfFrm3+y8FEhOVW263CY=;
	h=date:mime-version:subject:message-id:from;

Add the eDP PHY GRF (with the eDP PHY child node mapped by its own
register window) and the eDP controller nodes for the RK3568/RK3566
SoCs.

Signed-off-by: Damon Ding <damon.ding@rock-chips.com>

---

Changes in v4:
- Model the PHY node with a reg property under the parent syscon.

Changes in v5:
- Move the APB clock (PCLK_EDPPHY_GRF) from the parent syscon node to
  the PHY node, matching the updated binding and driver. (Sashiko)
- Rename the PHY reference clock to "ref", matching the binding.
---
 arch/arm64/boot/dts/rockchip/rk356x-base.dtsi | 45 +++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi b/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi
index 1a4562df20ee..e3f370cad5d5 100644
--- a/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi
@@ -402,6 +402,24 @@ usb2phy1_grf: syscon@fdca8000 {
 		reg = <0x0 0xfdca8000 0x0 0x8000>;
 	};
 
+	edp_phy_grf: syscon@fdcb0000 {
+		compatible = "rockchip,rk3568-edp-phy-grf", "syscon", "simple-mfd";
+		reg = <0x0 0xfdcb0000 0x0 0x8000>;
+		clocks = <&cru PCLK_EDPPHY_GRF>;
+		ranges = <0x0 0x0 0xfdcb0000 0x100>;
+		#address-cells = <1>;
+		#size-cells = <1>;
+
+		edp_phy: phy@0 {
+			compatible = "rockchip,rk3568-edp-phy";
+			reg = <0x0 0x100>;
+			clocks = <&pmucru XIN_OSC0_EDPPHY_G>, <&cru PCLK_EDPPHY_GRF>;
+			clock-names = "ref", "apb";
+			#phy-cells = <0>;
+			status = "disabled";
+		};
+	};
+
 	pmucru: clock-controller@fdd00000 {
 		compatible = "rockchip,rk3568-pmucru";
 		reg = <0x0 0xfdd00000 0x0 0x1000>;
@@ -878,6 +896,33 @@ hdmi_out: port@1 {
 		};
 	};
 
+	edp: edp@fe0c0000 {
+		compatible = "rockchip,rk3568-edp";
+		reg = <0x0 0xfe0c0000 0x0 0x10000>;
+		clocks = <&pmucru XIN_OSC0_EDPPHY_G>, <&cru PCLK_EDP_CTRL>, <&cru HCLK_VO>;
+		clock-names = "dp", "pclk", "hclk";
+		interrupts = <GIC_SPI 18 IRQ_TYPE_LEVEL_HIGH>;
+		phys = <&edp_phy>;
+		phy-names = "dp";
+		power-domains = <&power RK3568_PD_VO>;
+		resets = <&cru SRST_EDP_24M>, <&cru SRST_P_EDP_CTRL>;
+		reset-names = "dp", "apb";
+		status = "disabled";
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			edp_in: port@0 {
+				reg = <0>;
+			};
+
+			edp_out: port@1 {
+				reg = <1>;
+			};
+		};
+	};
+
 	qos_gpu: qos@fe128000 {
 		compatible = "rockchip,rk3568-qos", "syscon";
 		reg = <0x0 0xfe128000 0x0 0x20>;
-- 
2.34.1

