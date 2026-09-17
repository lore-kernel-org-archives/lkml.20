Received: from mail-pj2-f5.google.com (mail-pj2-f5.google.com [74.125.227.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B8A840EB8D
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 20:48:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789678115; cv=none; b=SUHgWG6tJ0jiHmQaVAam4pwgCn+2ny++6Nx/LRFjr7SyJv2A6Pcf2pXIy+BY2+Dnv7SsQNYsT2gkfOsctpzYvtyL4Md0rTwSoBDvxJ/p4JByuOXZd5MF+38MLtDGx5idF8/PuRradQib2vXdBs/2TM1UVfsAo6der3RjVK5kTz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789678115; c=relaxed/simple;
	bh=EAepGZi5JJgVl5A2Zgbnsm82y7MavVep4jBcaMjh1U4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PsRfnSi/u/v67e9FwuCnhauv7pNd0jbK7HIGaADU5h1DyLqvwiaeqIPcyEm1E5eRkszs3+9QpIMEqQBV+UCOvlssoDFvc9MNFC67uYhV9OLUnuGD4/2evyKTPRqbrZmh7ZJq6wUcXVE8qj++ReRL3AofTucMylYpN6dVAbM8nhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cSxTfRF5; arc=none smtp.client-ip=74.125.227.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cSxTfRF5"
Received: by mail-pj2-f5.google.com with SMTP id 98e67ed59e1d1-3965683e9e9so54645a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 13:48:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789678113; x=1790282913; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IeBd/f+KYPaUD3mTxXbAK7RiokjVClr9ke91eN5DQPw=;
        b=cSxTfRF5jJcK/iay2vCUdb+L70rSeSPe+vbur13dQSQ3oKnU43EpF/gGMiGA/ZFfJM
         t2yF3ZRkFkaYYDmZbwxz7OjvkO0DpcE4K61KOJ2x/mb9zsKgr5RgqpMeTC16JcbEYbtB
         cjk3qbL09xvFSfzMSAV32ytV8vhXtz3YVN6skZcXVqqvaNHFmum+Ph/Uyi0BiZA2pFQk
         NufLHAzKW91/Myts2TXWw9+yZZZ4BGDeu/qjyeu0kxZTcHo18IMrcMIjAY/TDAo3Hf59
         6WVmDPXpdHmu488ihmbvVf7UZElUscxetKstqyfN+UpGKxeNzOGc5Qh3YQQ9Kv/RFUxU
         xu+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789678113; x=1790282913;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IeBd/f+KYPaUD3mTxXbAK7RiokjVClr9ke91eN5DQPw=;
        b=txQTTJgidOMC5p6nOb4KTH9raZUALLd2X8eadbIQg3DYPSbDYv9YOwHJGATQn+TIa+
         +HNfqwMmeJiMxYrmgVPZpkaa79P/l9Uq87AlaI8oIuMEgwPJLv0pSYU3C+hH9TrRyugB
         mQR6B0+5hdcRIKQsDYrWuVxwho6dn/FN+MFQBBF+HoBVa0U6ubl7gMnLmdLFsBcyIMfH
         Sl0qbdvGTjJEBDloF3hV55P6n42SVv5DhM4zkc2i+G3zYeB13WuO+s1/NduC7R97JLS3
         oVzA0uXf91hEsAQoES1eitd/qQrWVwMW74yvuECOLhR78rOTlNQrMnwv+B+kw8Nb+EdV
         G+gg==
X-Forwarded-Encrypted: i=1; AKwUvBzIrumskOSxFOa4ap9kldw/9loz5OuarHf0k7UcGcRxDkHeaAzMFqR32I03iaremaoNpqI+ohzVgmPGtnA=@vger.kernel.org
X-Gm-Message-State: AFuF++lgn/OxqB0QC8DvhVEQAqYpJv7wOK7GWCUOuq+Owzr3b92BLb56
	PxSWZWdfm+wfhs/83/Fh09BAL9fp1TATF8VPIPt7EWHRtEqkrYvHl8po
X-Gm-Gg: AYBFou38blto0fc9BA9pG+S8hRl08ZXfzD8LWFWl1/526ee8tpNZYWo/fo0P93fjJlw
	SAA0q8HAUmBDd9GniaMJ1+u1gxunsbkCokiakqZRdXT3xuWqobNa9l3dSGKwjhrJvEpjKFp0+B+
	PC3OF0GeFPQMYYlzagJEYF43xOixtj9EAmuFSwp//k4znioiinoJ13NpbNDMDa/HMVcNLlh1cDf
	bZUfGe0Qq/ku7y+uSa5Rr90TIhDKLzKBi/diCBDjzzuKKBmOHHuee25sKs7pp7//EpYLfAMOvbk
	sg9ZlBNyoVcSiYjqVnvaGiK917vAzUWeV4qLpSDGZgOiXyFveVity3aYt8ISDhubISkw1XsWH+L
	JN/mCE3Y3e5xE3xDZF7x62ilPT64KJyk+F08RF3l6BUPzZp7GRDxrqD5oWhzIHJg+rwXDlPbOwc
	5erVQgEN6TzTP8dQskMctwyXzqzpg4BH+h+6lbxH5RIoCchSNufqQsS4DB8SupUspXLW0vqQ==
X-Received: by 2002:a17:90b:548d:b0:39e:4c7e:f040 with SMTP id 98e67ed59e1d1-39e54f889a8mr664123a91.29.1789678112838;
        Thu, 17 Sep 2026 13:48:32 -0700 (PDT)
Received: from server.lan ([168.138.199.194])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e50a4bc22sm1232196a91.17.2026.09.17.13.48.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 13:48:32 -0700 (PDT)
From: Coia Prant <coiaprant@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Vinod Koul <vkoul@kernel.org>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Romain Gantois <romain.gantois@bootlin.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Coia Prant <coiaprant@gmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Russell King <linux@armlinux.org.uk>,
	Shawn Lin <shawn.lin@rock-chips.com>,
	David Heidelberg <david@ixit.cz>,
	netdev@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH net-next v7 10/11] arm64: dts: rockchip: rk3568-photonicat: enable SGMII LAN port
Date: Fri, 18 Sep 2026 04:46:21 +0800
Message-ID: <20260917204624.2427486-11-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260917204624.2427486-1-coiaprant@gmail.com>
References: <20260917204624.2427486-1-coiaprant@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Ariaboard Photonicat has a Motorcomm YT8521SC Gigabit Ethernet PHY
connected to GMAC0 via XPCS SGMII.  Enable the necessary nodes to make
this port functional.

Add rockchip,sgmii-mac-sel = <0> to the already enabled combphy2,
to route the SGMII interface to GMAC0.  RK3568 has three Combo PHYs
that can carry SGMII; which one is wired to the XPCS is a board-level
choice, and Photonicat uses combphy2.

Enable the xpcs node and its port 0 sub-node, referencing combphy2
as the SerDes PHY.

Add the mdio0 node with the YT8521SC PHY at address 3, including its
reset GPIO and LED configuration.  Also add LED configuration for the
existing RGMII PHY on mdio1 for consistency.

Signed-off-by: Coia Prant <coiaprant@gmail.com>
---
 .../boot/dts/rockchip/rk3568-photonicat.dts   | 74 ++++++++++++++++++-
 1 file changed, 72 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3568-photonicat.dts b/arch/arm64/boot/dts/rockchip/rk3568-photonicat.dts
index 58c1052ba8ef3..fdaa4a2a4328b 100644
--- a/arch/arm64/boot/dts/rockchip/rk3568-photonicat.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3568-photonicat.dts
@@ -3,6 +3,7 @@
 /dts-v1/;
 
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/leds/common.h>
 #include <dt-bindings/pinctrl/rockchip.h>
 #include <dt-bindings/soc/rockchip,vop2.h>
 #include "rk3568.dtsi"
@@ -241,6 +242,7 @@ &combphy1 {
 };
 
 &combphy2 {
+	rockchip,sgmii-mac-sel = <0>;
 	status = "okay";
 };
 
@@ -260,9 +262,18 @@ &cpu3 {
 	cpu-supply = <&vdd_cpu>;
 };
 
-/* Motorcomm YT8521SC LAN port (require SGMII) */
+/* Motorcomm YT8521SC LAN port */
 &gmac0 {
-	status = "disabled";
+	assigned-clocks = <&cru SCLK_GMAC0_RX_TX>;
+	assigned-clock-parents = <&clk_gmac0_xpcs_mii>;
+	managed = "in-band-status";
+	pcs-handle = <&xpcs_mii0>;
+	phy-handle = <&sgmii_phy>;
+	phy-mode = "sgmii";
+	phy-supply = <&vcc_3v3>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&gmac0_miim>;
+	status = "okay";
 };
 
 /* Motorcomm YT8521SC WAN port */
@@ -341,6 +352,36 @@ &i2s0_8ch {
 	status = "okay";
 };
 
+&mdio0 {
+	sgmii_phy: ethernet-phy@3 {
+		compatible = "ethernet-phy-ieee802.3-c22";
+		reg = <0x3>;
+		max-speed = <1000>;
+		reset-assert-us = <20000>;
+		reset-deassert-us = <100000>;
+		reset-gpios = <&gpio3 RK_PC6 GPIO_ACTIVE_LOW>;
+
+		leds {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			led@1 {
+				reg = <1>;
+				color = <LED_COLOR_ID_AMBER>;
+				function = LED_FUNCTION_LAN;
+				default-state = "keep";
+			};
+
+			led@2 {
+				reg = <2>;
+				color = <LED_COLOR_ID_GREEN>;
+				function = LED_FUNCTION_LAN;
+				default-state = "keep";
+			};
+		};
+	};
+};
+
 &mdio1 {
 	rgmii_phy: ethernet-phy@3 {
 		compatible = "ethernet-phy-ieee802.3-c22";
@@ -350,6 +391,25 @@ rgmii_phy: ethernet-phy@3 {
 		reset-gpios = <&gpio4 RK_PC0 GPIO_ACTIVE_LOW>;
 		rx-internal-delay-ps = <1500>;
 		tx-internal-delay-ps = <1500>;
+
+		leds {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			led@1 {
+				reg = <1>;
+				color = <LED_COLOR_ID_AMBER>;
+				function = LED_FUNCTION_WAN;
+				default-state = "keep";
+			};
+
+			led@2 {
+				reg = <2>;
+				color = <LED_COLOR_ID_GREEN>;
+				function = LED_FUNCTION_WAN;
+				default-state = "keep";
+			};
+		};
 	};
 };
 
@@ -586,3 +646,13 @@ &xin32k {
 	pinctrl-names = "default";
 	pinctrl-0 = <&clk32k_out1>;
 };
+
+&xpcs {
+	phys = <&combphy2 PHY_TYPE_SGMII>;
+	phy-names = "serdes";
+	status = "okay";
+};
+
+&xpcs_mii0 {
+	status = "okay";
+};
-- 
2.47.3

