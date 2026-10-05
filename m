Received: from mail-pj2-f11.google.com (mail-pj2-f11.google.com [74.125.227.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85B50434406
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 22:40:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791240054; cv=none; b=IMGHev2Mdd+/sBac7NzjK6QFpZD/oNz8IPlHUi4RU6mEzon6JZqrtvPsgPOgH7/n4OmhhID1iNJ+wTODHrlY9e34/8O3gMGxV+yEji0guQCeA8yvXuobSntjMk69pvrSW+kz4NNOa6Ek4Na4TpdvdGYHOJ8XaXyfUfOcohZkMhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791240054; c=relaxed/simple;
	bh=EAepGZi5JJgVl5A2Zgbnsm82y7MavVep4jBcaMjh1U4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=n1/KP/DeeZzxAWr3Oo6mYRio27xHze1Lq89u//NXnuwHUNGokgGDPUPlKV3knH2wcmApz0imzmuCllY5hZysr6W6bK6txTaPRmXojHx8WMuU1HYtG0Nxd46PIRjd9mwcMF7AHEeIpiydfOvlqDs5moWeULYMOLDN/u7hKQhgkO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BsBO70I1; arc=none smtp.client-ip=74.125.227.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BsBO70I1"
Received: by mail-pj2-f11.google.com with SMTP id 98e67ed59e1d1-398a0a87595so1450068a91.1
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 15:40:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791240047; x=1791844847; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IeBd/f+KYPaUD3mTxXbAK7RiokjVClr9ke91eN5DQPw=;
        b=BsBO70I1RqrhnXeNwZRsH2G7LscW9tmceTEhks8FzZSeSvxeuXqQWTuAw07qDAwuN4
         NaeQE5JBdHnb8SHszF+vRloH9oWTHtsAetdifi4Jj6jcRjUmyfGD82bDzXRvFy1bm+fK
         EVMH6W00Cj7yk/uNlrEgvAdByon0F3NgM6p5egd1MN/8OA32F32BTCVKfUnAgzCbyWf/
         3L1ky+22JRZ3Zrrn/rm9ih0gZiwwTBTTwgDPiFjODShb+pKuIMvP498HhAnM4cP1nTEX
         om8BQOz4giDCREp0OtiKmkpejMjTHGmRdFnUrAGi9EO+c34GtdnTqywnTEANUus5NDeV
         ZTSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791240047; x=1791844847;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IeBd/f+KYPaUD3mTxXbAK7RiokjVClr9ke91eN5DQPw=;
        b=C56UR2pzneWj8eytWhB7cD52ovFo1FoGs41XddT/AIwiPl1yGdq9dK7RfOqg1RJMEv
         zzx+DRDFuiUhx5pUZWC3LhjxPM7W8wz+z6+qOQ7tTqUr6WJraIpPSmSne/ewIA9jVGbX
         2Lf2iRGGLuMMMEk5gVMa9Qsk/WxJdnRpAqDkFTAzY3Q95IUNkHhsm/RlhgzSrk1HNDZk
         2ykg/oJRMXMtcU+tnIA8kB2Kc5TYGSIFzVzo6Sr5d15QUSvsxw4VgSuUdvxwV9ds4Z7l
         TchH8cn0oQGWmz/+k2eAlgMTGlPLrVv6U87RUbCjH/e5Nq9lOcy3jE8obuzIihhv7KkD
         f1SA==
X-Forwarded-Encrypted: i=1; AKwUvBwmYdHc59SNpcOB8g8zYFw2o4Mzu38W0SwTTYJ5k4h9iXhM2ehGeYJDv5wKvO/c3jFjdqzZR6uYtEl2TgA=@vger.kernel.org
X-Gm-Message-State: AFq9FYJLaCc+vqUQDEmRNEVQ7uLkcAGPXrz+1JbPZ4bVC+P4AZ6b7XBm
	esNjilugTOwRmtt2Z8JYlTKd1ZjfZMZkVl2rkShxG3BYyuQw2X2MQKkf
X-Gm-Gg: AYBFou1UeLTzWjZtVmBzRYvGnvKu+ceQqHg/FWpCRJJXrYWtOa68znnRWqHTnNMS2NO
	gyDAfRa0hiHW+WemICOj83KLFIMNbFZVbcNOrqWw7Aj/pHp9z0Oxg+CDVSNrQsKlesgmYLvodjv
	lcJZdUJsfEJt7T+bPCEh+oUm6u716n1gSo6Fx2T3/EG292ljDHUIE6KUVGnrOL5prFMq8Qq7je7
	bHD0setQMoTIAXqf700Pe6lAQaBHL7AEDWabPn3e1uDyoKm2qr5ptFjF9Bb0H9esEY7xwnGd0mk
	9wfGEfXP8B8CylwlEbrQPAksKRxg3hBw5bELf6bQQ9Svxk0faLEgE/9XrPiwSgta1FFmSy3bxy0
	2w4gg7CzXESDcMbaRgxsoXvXC3U8wevOW2jDY0iYtJuOPFgVYEhOWOCQ7i0n5LoYOACtBvKSvoU
	qdpieOqHFDtkoerigbGHPRukZlkUWuZ/aGE+5OeIyScT/d1sdlbwOfwhjwgFXWRDckyso/UXbcm
	/suu7I=
X-Received: by 2002:a17:90b:2886:b0:3a8:2c7e:8986 with SMTP id 98e67ed59e1d1-3a82c7e90c0mr2473707a91.17.1791240046758;
        Mon, 05 Oct 2026 15:40:46 -0700 (PDT)
Received: from server.lan ([168.138.199.194])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a853e66d7fsm1496243a91.5.2026.10.05.15.40.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 15:40:46 -0700 (PDT)
From: Coia Prant <coiaprant@gmail.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Lin <shawn.lin@rock-chips.com>,
	David Heidelberg <david@ixit.cz>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Coia Prant <coiaprant@gmail.com>
Subject: [PATCH v10 2/2] arm64: dts: rockchip: rk3568-photonicat: enable SGMII LAN port
Date: Tue,  6 Oct 2026 06:40:08 +0800
Message-ID: <20261005224008.1140250-3-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261005224008.1140250-1-coiaprant@gmail.com>
References: <20261005224008.1140250-1-coiaprant@gmail.com>
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

