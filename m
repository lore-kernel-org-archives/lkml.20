Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=156.224.81.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793342984;
	b=ZLR5acmZGXCBpyeSdOWSC6kqZh0sXukT1ljlBFgHWQfggy1BpaGk6cWslNhRsxXCaR1t
	 GxLQQ+arAcIhV8CJevvqNKZezgKkKnZo8cOsDCex4hY/6ErhnSNxO5eTcq2/UCIcjiTpa
	 4otRi6msShbMA6CNB4sdzdPtnJiR6ykROvjShO3tSEmtpCUbu2+qtFvXgFwdIshpaqZyO
	 tBmytoO4tsJ+Vv/RSILTbaAzdp/9luOI9VhWGOaxH4p508zJhVekgX/m8QdZvNrSdrG1u
	 okyyRqXkf+syJ0JDhZfX+D9cIO4x4ESXPSgJ0ZbxfkUDzyIY+wyQE1pO62VuPaN/QYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793342984;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 X-HM-Tid:X-HM-MType:X-HM-Spam-Status:DKIM-Signature;
	bh=kW+VR5U0b0jOaOOyCPQjLOX5nd6qRJjRAAQ97MnVWxk=;
	b=1IOPr/ZHPtzuvgiP524pFJLlW1GgZQ/9orP+TSEMzhHKmIgjTeE+qk2YAzfQm4KfKw26
	 PQBDOx0SdNkYFoyB6Qhf9hJnlTFLgtwC/eNoSe2nfP4Cbo+RKkzYzJc1AIFVVZR3NA8a1
	 KCAqXwaeqWNQKbfZLzkygrUzUzG2Yj/TXrx4EthG+AR2gPIcjQo8wrPn/FHSok7f0n2mv
	 KwuV6EvsTW4VKJZrUsUEQZzpyLs8vb1e2rk1FFxMitsH8Q4iM2MF2Rz41qlHTxaGBwwuZ
	 6v+Sxgad2945NQvHUUFElQvkfHdzQ5njNwRjzOrVYACz0K50YK6Ven19teoPmaUIzCQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rock-chips.com;
	spf=pass smtp.mailfrom=rock-chips.com;
	dkim=pass header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b=jUjghBRr;
	arc=none smtp.remote-ip=156.224.81.173
Received: from mail-m81173.xmail.ntesmail.com (mail-m81173.xmail.ntesmail.com [156.224.81.173])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3AFA606A329;
	Fri, 30 Oct 2026 06:49:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C3AFA606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b=jUjghBRr
Received: from zyb-HP-ProDesk-680-G2-MT.. (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 52e796957;
	Fri, 30 Oct 2026 14:49:37 +0800 (GMT+08:00)
From: Damon Ding <damon.ding@rock-chips.com>
To: Sandy Huang <hjc@rock-chips.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Andy Yan <andy.yan@rock-chips.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Robert Foss <rfoss@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Dave Jones <s.dave.jones@gmail.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	dri-devel@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org,
	Damon Ding <damon.ding@rock-chips.com>
Subject: [PATCH v4 6/6] arm64: dts: rockchip: rk356x: Add eDP controller and phy nodes
Date: Fri, 30 Oct 2026 14:49:05 +0800
Message-Id: <20261030064905.2248999-7-damon.ding@rock-chips.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261030064905.2248999-1-damon.ding@rock-chips.com>
References: <20261030064905.2248999-1-damon.ding@rock-chips.com>
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
X-HM-Tid: 0aa18b92353103a8kunme14bef9979446
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1kYFggdWUFKV1ktWUFJV1kPCRoVCBIfWUFZGk5JQlYdSk1MSh0aSR
	gYHk9WFRQJFhoXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0
	tIVUpLSEpKQk1VSktLVUpCWQY+
DKIM-Signature: a=rsa-sha256;
	b=jUjghBRrjI6cVIGuqcpihieSTRffFrj0ZNC66Rdp4ikFSh+FmctUCIgnLka750gG/cbFnW2kKlUTDPpB1FkGaRt6idnSy1H16Xsvnydyji640t325qBvRczeT7CcDOddoshuTPsWXSd/w22n+LNQRHlO/KBPOpV+ygupsHTJ8uE=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=kW+VR5U0b0jOaOOyCPQjLOX5nd6qRJjRAAQ97MnVWxk=;
	h=date:mime-version:subject:message-id:from;

Add the eDP PHY GRF (with the eDP PHY child node mapped by its own
register window) and the eDP controller nodes for the RK3568/RK3566
SoCs.

Signed-off-by: Damon Ding <damon.ding@rock-chips.com>

---

Changes in v4:
- Model the PHY node with a reg property under the parent syscon.
---
 arch/arm64/boot/dts/rockchip/rk356x-base.dtsi | 45 +++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi b/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi
index a5832895bd39..7a5168548e55 100644
--- a/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi
@@ -403,6 +403,24 @@ usb2phy1_grf: syscon@fdca8000 {
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
+			clocks = <&pmucru XIN_OSC0_EDPPHY_G>;
+			clock-names = "refclk";
+			#phy-cells = <0>;
+			status = "disabled";
+		};
+	};
+
 	pmucru: clock-controller@fdd00000 {
 		compatible = "rockchip,rk3568-pmucru";
 		reg = <0x0 0xfdd00000 0x0 0x1000>;
@@ -879,6 +897,33 @@ hdmi_out: port@1 {
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

