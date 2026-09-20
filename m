Received: from mail-pz2-f7.google.com (mail-pz2-f7.google.com [74.125.228.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 790543290A6
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 17:03:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789923814; cv=none; b=VMpXtxFl1uT1IDJekYQ/4jf7OuvzDJs+KF+7XuHOlDUMBJYTM5C+FUVHXs9MramrmWk0umZrMOsVyah6wVvwN35MgGPoll4OLHSp0Dw4MoYHfO9v+UTmsK5zfOS9ojMbf+u9WCf927oyqn8jrIBTVOFXp4KxJJz15nfhNmOD6W4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789923814; c=relaxed/simple;
	bh=EAepGZi5JJgVl5A2Zgbnsm82y7MavVep4jBcaMjh1U4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OpyMpqTQl/Kcvh7wuCVsJS8EKppGMNguCtif6q1gJkKJrd2bUcwMQZeQWnDjUrrXu235mltSX4mfEx0eLURbcMHQrquiVufsKyZ99WRKDZ+iPC6BrJIlAzbI8LcOeFv8sDw8qDc7cNpb5i8gR/P+H4bY7S15UHTCi411ITSaJro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DEeHu+cp; arc=none smtp.client-ip=74.125.228.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DEeHu+cp"
Received: by mail-pz2-f7.google.com with SMTP id 41be03b00d2f7-cc53988d9f3so1289285a12.0
        for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 10:03:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789923813; x=1790528613; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IeBd/f+KYPaUD3mTxXbAK7RiokjVClr9ke91eN5DQPw=;
        b=DEeHu+cpy5beil1S+Ko63U916fwBjBrWM56/6cyAWi6weAsCQ4Iwq7U8rx/5GLOSWD
         TiYVu7/nCpVaoNdsgvg7f5GVImMw8yF1F+J3QkmALnz0tAeCsRCXUHVpr+S2fEnyn8/v
         m/1FzuBwMdT7kQdomeExCNaRZDnyi9Ub0tdZQgGS40/Wdmz8/TAo3lGVN0jNPXeetYqS
         FOx9ImNt1lhCj+1LBzmeOCZhaxyPR7EmcMAmFZkzPVNsBcjlBeeLn50T7r/moj2NqQbo
         7cl0PgrkFhMDSguQPfH2+G0/zfNFRnrvUmDhROl+4km6InqRo+8rajg8JIoNHwC8y0qC
         5zpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789923813; x=1790528613;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IeBd/f+KYPaUD3mTxXbAK7RiokjVClr9ke91eN5DQPw=;
        b=oN/qb/XAtwj6FdvG4coA36fTVO6H6kSNsWmZJL2Hl52mAhxFMky8erxUph5bjBvOfh
         K6rhZ/Qqn6ZNm8ZKK8boaPPXw9SM+vlVePXPhoMFoZmb+Guy5PBFWW3yEkDLYYsSVGYH
         7oR8ghkcYLazKbIwgIt8ZH+/01pRRgnmKsVSCKCNDGLW/ALiLDv4sASOmPIoVfNOUHi1
         307rbddNFbsHe9QKuEaIYC2vJNS2l2ZfrvTU9A8ICufRM/EUp5rGmb10f8ZqEnpJW/28
         tVFggfadBJjT85b9qgdZ8kmbHYa7kjLCnwTvmskvDtDGuSTfFVjcsggY+ArtDCNsGmhv
         +soA==
X-Forwarded-Encrypted: i=1; AKwUvBxDug/q9XUhaNasQdr03c6UwmmrtPj8BnrIL8eNeDhem2WXWC714MRnFY2koR72tjX2QWq/SCA+QzwXOVY=@vger.kernel.org
X-Gm-Message-State: AFuF++kXvxxQ03pX/cCAdJjil566Sx937KIxj0Yzlx4JbBiNHX2k4abQ
	8tl0Q76RrANwUvD7IKdi/UWckGVKhOUi+ohwqUX6j2C/gj1u1x7sD6uf
X-Gm-Gg: AYBFou2o+Gmk1u/eFtOWv5wfeJC9NH+bff24vamXR9h6jvAD5bm5eWWcmu5r/kIDAsb
	2nqhOasYj6eLArODvf4h5tvkfEkRrPoRByG1nEsTBTbdqENSkybzGF+fc+REaQt/mLUYKwzdUYS
	Q+Xj2gQwLD4YNPWnFBY6bOCaE2X8J2d/VI6xZ9yNYZh2CznzByRvUl/5wyhavTmHou+ugBuUC3z
	D+3P+4+PtI/V54YQEjSEbwwZh6X0HEM/7uT6y3qzngcfJSzr4L7opnT5nP4PShbxhHHZdZSWtqX
	e/+g746pyPdQMS/Ln6y9DTmj6lRDwF40g6pCEuQOB9nTEHQlBLfnuCZpX8wqs893RaDaefhyz7e
	IOU23SHG8t+rskEt/TH22r8TOHo5R2CHjAifMksMb6FOxEsqmQlGVQxIory37yZUO/51fZ/ZlBS
	4+g8op7XKI2lJeHEgBlSbL9IEpZ3fraRlJ6GUGMHWXZbxSJvhcTNhz7g84T1u3z3seNeFkDQ==
X-Received: by 2002:a05:6a00:1249:b0:878:3783:8a83 with SMTP id d2e1a72fcca58-87837839389mr5176719b3a.53.1789923812897;
        Sun, 20 Sep 2026 10:03:32 -0700 (PDT)
Received: from server.lan ([168.138.199.194])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-877a9d07425sm2140646b3a.42.2026.09.20.10.03.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 10:03:32 -0700 (PDT)
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
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH net-next v9 10/11] arm64: dts: rockchip: rk3568-photonicat: enable SGMII LAN port
Date: Mon, 21 Sep 2026 01:01:14 +0800
Message-ID: <20260920170116.3624104-11-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260920170116.3624104-1-coiaprant@gmail.com>
References: <20260920170116.3624104-1-coiaprant@gmail.com>
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

