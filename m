Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=156.224.81.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792465785;
	b=ntjk9Je2YErz+NFM7vf3qmsrNfdhwzy6pRf+OXaPnoqD6oWVqtIHjyZpEprqz4FwJlOp
	 a2C1phNnyB1nXefElStGIuPOYEpuu/9NlWq0eBbUq/C0An210N+TTToZpE9Glj4yJb221
	 WvNJszgaMcl7sGkz0a3sPGLN9y6AkKW6utE6Ul0Yf6+riA22w1auljycJNK1ajRY9JAaz
	 U2RAEmDh5tzQYNJlZ2kdjEShSvaPpT8j3IGkz8CaiotJdZF7MCu/heuAoHiR1iH8RdLrN
	 ndluEvL83uGp9J8Nh1YnQjp3+y3cUmKVu9G+6MC7FK+m523gQCuS/wEyWx/aRbc9fng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792465785;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 X-HM-Tid:X-HM-MType:X-HM-Spam-Status:DKIM-Signature;
	bh=u0DlQ/xf40TjrEq/cqhW2BlOW/2RL9CDbLOchel23Qo=;
	b=RSI3/JaCFaUBUYL9JAQgOLHX92XUFtjxxSQvx6IftUXLwnlFbzO/tQk4gKitwGpkgpaH
	 2FBUyBKfAaLwiJ71jtAwJAeAtBHMUmrGn63NXbBb/YEdjv/uaGzP+EuDtV4SG1kFXGFQn
	 hKw9JqDVaRn7ou1K2Zvhkny35YN/0/ivoDXBIFRgz3Ce6kKsFbabSFYjE9Im0IMVj7paw
	 Lcuga/k+XRF/3zJ4OyvRb+fTcgAR5wUnAfKWvG+Xi9gN12SZBDq0z4SK0ixE3JvrnL+vb
	 Qwjw4RVAETMKDMo6lVqLtnLU9nf6t8oRDTpfHeTrT3lAR2nuQ/m0m5KmMqqBAMS/+LA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rock-chips.com;
	spf=pass smtp.mailfrom=rock-chips.com;
	dkim=pass header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b=G7DlvJYr;
	arc=none smtp.remote-ip=156.224.81.178
Received: from mail-m81178.xmail.ntesmail.com (mail-m81178.xmail.ntesmail.com [156.224.81.178])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D50160A381D;
	Tue, 20 Oct 2026 03:09:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4D50160A381D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b=G7DlvJYr
Received: from zyb-HP-ProDesk-680-G2-MT.. (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 51a4ceeca;
	Tue, 20 Oct 2026 11:09:34 +0800 (GMT+08:00)
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
Subject: [PATCH v3 6/6] arm64: dts: rockchip: rk356x: Add eDP controller and phy nodes
Date: Tue, 20 Oct 2026 11:09:16 +0800
Message-Id: <20261020030916.3223833-7-damon.ding@rock-chips.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261020030916.3223833-1-damon.ding@rock-chips.com>
References: <20261020030916.3223833-1-damon.ding@rock-chips.com>
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
X-HM-Tid: 0aa1574928bd03a8kunmfd20f05334c79f
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkZTE1MVk1JQkhOTkgdTR0YHlYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSE
	pKQk1VSktLVUpCWQY+
DKIM-Signature: a=rsa-sha256;
	b=G7DlvJYrfGrAhvmueIh8D0TEaFHxbqq6XOFV8J75E6UXw4244+55jV4RTpF8i37nU3SjiIWluQDnk5Ec5FdGp6UcygHEcU6jHZYnO7eWpteuieB1plhq4g9hLi2qDrhsUga6GuPOnD76vqmN1VRe8YwjfJxt9cC86lBaKTH5WWM=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=u0DlQ/xf40TjrEq/cqhW2BlOW/2RL9CDbLOchel23Qo=;
	h=date:mime-version:subject:message-id:from;

Add the eDP PHY GRF (with the eDP PHY child node) and the eDP
controller nodes for the RK3568/RK3566 SoCs.

Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
---
 arch/arm64/boot/dts/rockchip/rk356x-base.dtsi | 41 +++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi b/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi
index a5832895bd39..3b60e4355ad8 100644
--- a/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi
@@ -403,6 +403,20 @@ usb2phy1_grf: syscon@fdca8000 {
 		reg = <0x0 0xfdca8000 0x0 0x8000>;
 	};
 
+	edp_phy_grf: syscon@fdcb0000 {
+		compatible = "rockchip,rk3568-edp-phy-grf", "syscon", "simple-mfd";
+		reg = <0x0 0xfdcb0000 0x0 0x100>;
+		clocks = <&cru PCLK_EDPPHY_GRF>;
+
+		edp_phy: edp-phy {
+			compatible = "rockchip,rk3568-edp-phy";
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
@@ -879,6 +893,33 @@ hdmi_out: port@1 {
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

