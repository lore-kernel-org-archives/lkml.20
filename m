Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794838548;
	b=VEhD6uIM0NusP3kBgrkQhcUNztwzrgRnUUcUaHKOYyyPSHN1mVd+/Y1//R4ZhCM0Roa+
	 1ZgNqw38OMcobNIFQqHMcLOfPc+Kh9u4kW5KkEl7FEqK7vTkRc0hFfw1ml/gSMYB74lqN
	 6IRxEHArXfzsbtYtP5Sn4TZWbqP1tY5FJNGvSUusQBRjbWiSR00k0fSfSPB4E6BRvayDN
	 UwBsQ0n/wDSQ5OBWp3Ffteoat7WPDc1O8fR/ap3MDM2MbQVkvk76ig6Bq+jFs/BCv8Mk3
	 zvxx2KNXc+Hu6xcJ6zqvgGM6BedX+NhTydH1rd0GK+xta5UvVPd1T/Rxbw2J9IbNThg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794838548;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=A3XeEqkaktNVQ51Yi0Y1kI4qohFni5uS6O7rkj9mTrM=;
	b=Lx6kVjWb/54XIOeR5giV4Yf2mVKnUJxV/ODmUjPuxIopdHYPyqEn4RS8r8CjnxqzF6c+
	 PydauzGR0kyxhC38M2t0YuW8EQuvMQ7Zrid8XddWicwm8x70h5gzSJz7g6uVBZS3zlMiz
	 n5fklcmXkUgjwQZadla0ae1dKqwA6eXaN/8WdgHC+8Ow+x6js14JA9DnlxQwx83jd9yoW
	 RudPIMt01is79XJ7US7Q9tOVRjaOW6iUUV5jMFsT+UUfrRTrT9vwqnUje6LFJ+6kfHk25
	 NNGNPwAcBfMqGE1WjzDbxCSqqqCALDqS/0nHhmzpW8wO3xuunAiJEU3FtBIJZFNT3EA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="bpPmJV/6";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8707606A890;
	Mon, 16 Nov 2026 14:15:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bpPmJV/6
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C136E1F000CA;
	Mon, 16 Nov 2026 14:15:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794838548;
	bh=A3XeEqkaktNVQ51Yi0Y1kI4qohFni5uS6O7rkj9mTrM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=bpPmJV/6+5iIIHaLH+cDa4neTY7WoEcq6D0g/jARxCM1h23PxuXhq2Jxrz8WBTp3J
	 1iSHvrPN340gh3f3CZy4gImAIDa9Ilf0eXcyqEwl8IryjtDTP8ACvV6g1wPncZ4ykI
	 lmnX6vyrayFR42nPYTa9pW2fyVsEZegNuS+XmGmCKSubLjxcL8Ed2menO3Ukiykjoq
	 1E9/JVnX5EDRCfrysbifqRwdEL10Ng4ika5oFfCkfXWwkso/2I8CeIhp6RWSYjDQmI
	 xHmAFVHCKrWXGhur9bCudeNlawezBINo/J10/3Q2fF4xca8Mv/lJdlLD2+vw88EMvC
	 wx7geXmBdk91w==
From: Jisheng Zhang <jszhang@kernel.org>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 8/8] arm64: dts: synaptics: Enable Ethernet on SL2619 RDK
Date: Mon, 16 Nov 2026 21:54:42 +0800
Message-ID: <20261116135442.4827-9-jszhang@kernel.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261116135442.4827-1-jszhang@kernel.org>
References: <20261116135442.4827-1-jszhang@kernel.org>
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

The SL2619 RDK uses the second MAC with an external RGMII PHY at MDIO
address 2. Enable the MAC, its pin configuration and the shared MDIO
selector. Describe the PHY reset GPIO and timing on the demultiplexed
bus selecting the second MDIO master.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 arch/arm64/boot/dts/synaptics/sl2619-rdk.dts | 77 ++++++++++++++++++++
 1 file changed, 77 insertions(+)

diff --git a/arch/arm64/boot/dts/synaptics/sl2619-rdk.dts b/arch/arm64/boot/dts/synaptics/sl2619-rdk.dts
index 58901ac2a050..d10811e8436a 100644
--- a/arch/arm64/boot/dts/synaptics/sl2619-rdk.dts
+++ b/arch/arm64/boot/dts/synaptics/sl2619-rdk.dts
@@ -13,4 +13,81 @@
 / {
 	model = "Synaptics SL2619 RDK";
 	compatible = "syna,sl2619-rdk", "syna,sl2619";
+
+	aliases {
+		ethernet0 = &ethernet1;
+		ethernet1 = &ethernet0;
+	};
+
+	mdio-demux {
+		compatible = "mdio-demux";
+		mdio-parent-bus = <&mdio1>;
+		mux-controls = <&mux1 0>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		mdio@1 {
+			reg = <0x1>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			ethernet_phy1: ethernet-phy@2 {
+				compatible = "ethernet-phy-id001c.c916";
+				reg = <2>;
+				pinctrl-0 = <&eth1_phy_rst_pmux>;
+				pinctrl-names = "default";
+				realtek,clkout-disable;
+				reset-assert-us = <20000>;
+				reset-deassert-us = <100000>;
+				reset-gpios = <&portf 3 GPIO_ACTIVE_HIGH>;
+			};
+		};
+	};
+};
+
+&sm_pinctrl {
+	eth1_phy_rst_pmux: eth1_phy_rst-pmux {
+		groups = "SM_GPIO35";
+		function = "gpio";
+	};
+};
+
+&pinctrl {
+	eth_mdio_pmux: eth-mdio-pmux {
+		groups = "GPIO31", "GPIO32";
+		function = "rgmii";
+		drive-strength = <7>;
+	};
+
+	eth1_tx_pmux: eth1_tx-pmux {
+		groups = "GPIO48", "GPIO49", "GPIO50", "GPIO51", "GPIO57", "GPIO58";
+		function = "rgmii2";
+		drive-strength = <10>;
+		input-disable;
+		bias-disable;
+	};
+
+	eth1_rx_pmux: eth1_rx-pmux {
+		groups = "GPIO52", "GPIO53", "GPIO54", "GPIO55", "GPIO56", "GPIO59";
+		function = "rgmii2";
+		drive-strength = <7>;
+	};
+};
+
+&mux1 {
+	status = "okay";
+};
+
+&ethernet1 {
+	status = "okay";
+	pinctrl-0 = <&eth_mdio_pmux>, <&eth1_tx_pmux>, <&eth1_rx_pmux>;
+	pinctrl-names = "default";
+	phy-handle = <&ethernet_phy1>;
+	phy-mode = "rgmii-id";
+
+	mdio1: mdio {
+		compatible = "snps,dwmac-mdio";
+		#address-cells = <1>;
+		#size-cells = <0>;
+	};
 };
-- 
2.55.0

