Received: from mail-pz2-f9.google.com (mail-pz2-f9.google.com [74.125.228.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A03C93F54D8
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 12:53:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789822387; cv=none; b=sRn5A1KyTJjnbAhZw7BWKm60CmpApBkiRtpkTQ1cF3mIyfp6VSymyiQGpNruGgd8+9/WM5RvROvihPYg/HyVAo86Z35/K4SOOrc37n4tbxET1zUyhIsecY1K3VNs1ZOkz8jBTfh5Ts701i/hQiQL9VpZFJr0DR36I2l6GBrxafw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789822387; c=relaxed/simple;
	bh=EAepGZi5JJgVl5A2Zgbnsm82y7MavVep4jBcaMjh1U4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YOZQtEHMgYj3FxUnnXpyog0Gj+CPbCUOIkszQ2ofAZvXCq67naTjZ4cs9W3GDrlwk0PvhVuwAif/IK09IVmJU3x5zfyO31kpTZYEZ4ThZMDoM5oHGLko6yJ/nsMdLZzDqr0YHeoVuSE86nEpbqR4hpSW1sPlfAjeXX323w0DOjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iNTUAlhM; arc=none smtp.client-ip=74.125.228.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iNTUAlhM"
Received: by mail-pz2-f9.google.com with SMTP id 41be03b00d2f7-cc1631a57d2so1062789a12.0
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 05:53:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789822385; x=1790427185; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IeBd/f+KYPaUD3mTxXbAK7RiokjVClr9ke91eN5DQPw=;
        b=iNTUAlhM4nSG8YEkhJl+X5ybUY+4FfQv6D/GYvvGVKqVfzWaTCdPBZphfQekWE/OHx
         /JtwL5AUObcXh08mpvWlC/WBYMnONfvdWxCAdBjziY+bvgaCI/Yf9/bKLGncGiqAyjuE
         NAJccxScHc0V0fJQfNMN3QWfDgp9ntdkq8Ujnkg+1v6HSU8m/NLo0P5oIMoykPxM4UvL
         M2QRotA529V1OMcaANfPYD/dJShhtkumnScNMTF2zTaF+0UTF9DLaiWZ2xveosvLD5Lj
         ePQWyiYlo+zbQceDYfhAskwaqUO7oOBgU+uG5wNDXIbz4BOtr117o+GOiNvjwlPItptH
         bUvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789822385; x=1790427185;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IeBd/f+KYPaUD3mTxXbAK7RiokjVClr9ke91eN5DQPw=;
        b=hm9TOow7EtLT8Eujf7YQRuGPgW+deGVR/n2BMJ8CeRYzJqhJ83ObXvphm+f1T+ZTUT
         HOfCzFV6jD4iyofRFSeC0qu9tcWtSJvvKHBJOsPp5FT8q+rDgYPlO1AODa0qq34SXcaL
         KobaPvP6MP5OMeCVUsT6GfT4JUFpp5/JoATkElO1mkQ0a/IRBFvP7BZY3hTBChX6JNT4
         4Xl2HFw24UxLEGqYFjmoYt0cIgtb4bRqxNx/IbWWwCcZp6EGf31SzkrMtPq/Jj+5GsRf
         Ms5MW1ssndkjAgLUzfwZys90G6e3cH4JSIXgsep1OYvkWTwXc+8TVwl6e6XyqfgHxaPQ
         xC2w==
X-Forwarded-Encrypted: i=1; AKwUvByW5essLF9cXs67kRVorGURNyNb1x5GFlnUB36IMife8J19Gj85Vu6hcMfbfgmAa4nYfp5fQppPei65g+g=@vger.kernel.org
X-Gm-Message-State: AFuF++n8ZjVsL0y2K8zxLZ1su7BEhF6gUuxhpvSD7y8iRs/863BNNHOg
	oaVicUD19gOGA83KDD1QD/1GEGDVo1/nuBOMePYVVG/e4m7loeYSIqq3
X-Gm-Gg: AYBFou1CncQzuBGEthjeYN4CJUYuy6k8W+P6StynPT1pcN6HM5jVLSi5buQIqJbmhI2
	DCbbn7uuUQYfRm7B0fEAaDpL78PN9mQ7xR1I0dT+iuoIvz0n8LD9A2ZCQwYffypfM2AA4ra/th8
	pxPSDlREYr2EgTbqR5L7yKjv//YGaZilezovv5HGKhvkIavXaKsruzjm/nbE/TIh+L8X1YWbfCg
	zkZQYNVaRggOSsofpERq41HFhTqnSUX3btqcGr1atEPtAz3dBE03b0eyMXWXaIMAWJLIPzgxUzm
	eAPfYRSqa5Y1xr6lqzMtMaTY2fmb8/5Qj1OS4wsjZ5LcNlyfDKiPA0Hd3slRPR/MM4AYoECRIm+
	YMKu/pYcJfvC+2sk8Sah22Dp57yLz1hwPScUUyrnG9D24Dmr92MCX8HAEFLDdWiX0bYGI0D/MK5
	SFvHYMKFORsfDbNJTNsG7shz3ubD1lZ3V7XEwv8vbD3sr0vAk18X5lPBOM3LyuvepxZPGSSgc=
X-Received: by 2002:aa7:88d0:0:b0:878:3538:8f80 with SMTP id d2e1a72fcca58-87835389b2bmr1364047b3a.46.1789822384851;
        Sat, 19 Sep 2026 05:53:04 -0700 (PDT)
Received: from server.lan ([168.138.199.194])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-877aa0026b2sm991805b3a.44.2026.09.19.05.52.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 05:53:03 -0700 (PDT)
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
Subject: [PATCH net-next v8 10/11] arm64: dts: rockchip: rk3568-photonicat: enable SGMII LAN port
Date: Sat, 19 Sep 2026 20:51:17 +0800
Message-ID: <20260919125119.2107089-11-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260919125119.2107089-1-coiaprant@gmail.com>
References: <20260919125119.2107089-1-coiaprant@gmail.com>
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

