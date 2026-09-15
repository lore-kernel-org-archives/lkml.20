Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AB3D3DB62E
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 15:06:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789484782; cv=none; b=s7RXbexGsar21Dw6usATlU6Rb3S+3Hl6tp3DX4bHsySCVMhpLzVFoJcwndOdSn2VlyIUawrKZH8sJrT+tqSIm2+633+GIA4VdzRSNbSDokXM4clGYDOVcBMhwcwIPUDR0VPhrD5luzfpmXUtrVQl8/JfRbM/YGcB55BTeYgHHvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789484782; c=relaxed/simple;
	bh=xWOZIz9WSUhLjBYsv6AkugFXIXpASrJ7YH862/vRHwI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Yf3tRnOvfOkmou6oiYVDwZ8QS2z8Vvx2msd5JxlDj3+anKcgqcCH3pOlVWnVt9219jxkArZxcd9KWO7a+BjibQxvZoCCvYCcVYlOr+PllNRgxtxYn2b00xFB86ZsddY6Ce3KIMdxzkCRa5RrErZuUuQih4anHCQIV+YMqx+2Go0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=NsWtqok7; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="NsWtqok7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1789484778;
	bh=xWOZIz9WSUhLjBYsv6AkugFXIXpASrJ7YH862/vRHwI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=NsWtqok7OIvqJhETVLpGUtUt9pXgY/3MC1yfRNLjeXKB0QrhEIoSxrR4fCl/RhuL5
	 cMjxmbg5PKb+UKYEBS+0VXfBp6PN9sdxotXBKxpiEvtiOZVAqU7ip5YCqZdneN5jG4
	 nvsVU6W8An79ymhsKaSJ4oS5sd96NegEYBUYPk0d8RgarazFJ8UpYHShthCBkUJcCi
	 yJi3Ei6cInrlr16wRK1CY5BPaIxE8tm/HW3bCxTdFL4OQhF37aPbmML53J61W8q9x6
	 naElGKcnRDw++vSuOVfSCCMn7T1gGXssKejZbEGHlid7CpVJtXq0Lrw59djIKaFRSQ
	 swnjmCTN/wJJg==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A056217E090C;
	Tue, 15 Sep 2026 17:06:18 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 64629480031; Tue, 15 Sep 2026 17:06:18 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Tue, 15 Sep 2026 17:06:07 +0200
Subject: [PATCH v15 04/11] phy: rockchip: usbdp: Factor out lane_mux_sel
 setup
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-rockchip-usbdp-cleanup-part2-v15-4-8d507cb1174f@collabora.com>
References: <20260915-rockchip-usbdp-cleanup-part2-v15-0-8d507cb1174f@collabora.com>
In-Reply-To: <20260915-rockchip-usbdp-cleanup-part2-v15-0-8d507cb1174f@collabora.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Zhang Yubing <yubing.zhang@rock-chips.com>, 
 Frank Wang <frank.wang@rock-chips.com>
Cc: linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kernel@collabora.com, Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Igor Paunovic <royalnet026@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4649;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=xWOZIz9WSUhLjBYsv6AkugFXIXpASrJ7YH862/vRHwI=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGqpXuoQiwfZlfIqn6Dg0xpcyts0Z614HPXjz
 el21LiN6n78FokCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqqV7qAAoJENju1/PI
 O/qaAwIP/iIvARM5eDLOjPhxPPBQbcPUU+UHY871DMd+MDL3eCbpCIa96Vwu5fLpopX4qS+n901
 yTEBNbjxvJ1i5qjYwc90xlmrNQHbGmldGtjt+kxQXrPtIdYM+gOS6A7Bo9blYOXhvAs2ibqyDRo
 Qs6O4RqBINOUISoNrGHvHsqVHO06iIFhnEeAGw5YeuySATPBgjfM7ccEnTULSmbN386qFOEOTHC
 LW04HuKd+/R6CAVwuMYd5N1/gQ8j3gtxs9GWcu8dcTY6uMitR7oB+Vr29z9aOI0s0VcbtOG0b64
 YyobVV3I8WxFzAk0zCH4OPebZMMzGSYYNI3OWcePaU9Lk7K3ulwCvLyNkTnZKjKnkYMtfjDrUxi
 SONjhg4a9JRoF8QLYvZFnayoKk7Hz23bgP7OA58PMpbExf0CD6O+urP+fO4mIx3AoqBCyWETu7l
 O6r/pfyEPBfp4SnVGTwXbS2W+V7798JfPlj2h7UONNmaa6t1VaHlDimvFG2encldSSV5Xm9P8ta
 0vFTB6fq0r459bOergYbsUH14tWD6OLUnXtwGf7oDKhaJKe16K2sjYoE6UlBALwMtO2nWGYG0Rl
 mQl0uL0ikrcwobb12ToQporw/uTNxdcKk1Qt6csfVsm8BAtxbkqTi0th0b6m4A/aStT24Lryf6X
 3YNoq/Yi6c14QoAJUCnw/8g==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

Avoid describing the USB+DP lane_mux_sel logic twice by introducing
a helper function to reduce code duplication.

Tested-by: Igor Paunovic <royalnet026@gmail.com> # Orange Pi 5 Plus
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 81 +++++++++++++++----------------
 1 file changed, 40 insertions(+), 41 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index 9a4ead585151..4a073301067f 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -581,6 +581,42 @@ static void rk_udphy_mode_set(struct rk_udphy *udphy, u8 mode)
 	udphy->mode = mode;
 }
 
+static void rk_udphy_set_typec_state(struct rk_udphy *udphy, unsigned long state)
+{
+	u8 mode;
+
+	switch (state) {
+	case TYPEC_DP_STATE_C:
+	case TYPEC_DP_STATE_E:
+		udphy->lane_mux_sel[0] = PHY_LANE_MUX_DP;
+		udphy->lane_mux_sel[1] = PHY_LANE_MUX_DP;
+		udphy->lane_mux_sel[2] = PHY_LANE_MUX_DP;
+		udphy->lane_mux_sel[3] = PHY_LANE_MUX_DP;
+		mode = UDPHY_MODE_DP;
+		udphy->dp_lanes = 4;
+		break;
+
+	case TYPEC_DP_STATE_D:
+	default:
+		if (udphy->flip) {
+			udphy->lane_mux_sel[0] = PHY_LANE_MUX_DP;
+			udphy->lane_mux_sel[1] = PHY_LANE_MUX_DP;
+			udphy->lane_mux_sel[2] = PHY_LANE_MUX_USB;
+			udphy->lane_mux_sel[3] = PHY_LANE_MUX_USB;
+		} else {
+			udphy->lane_mux_sel[0] = PHY_LANE_MUX_USB;
+			udphy->lane_mux_sel[1] = PHY_LANE_MUX_USB;
+			udphy->lane_mux_sel[2] = PHY_LANE_MUX_DP;
+			udphy->lane_mux_sel[3] = PHY_LANE_MUX_DP;
+		}
+		mode = UDPHY_MODE_DP_USB;
+		udphy->dp_lanes = 2;
+		break;
+	}
+
+	rk_udphy_mode_set(udphy, mode);
+}
+
 static void rk_udphy_set_typec_default_mapping(struct rk_udphy *udphy)
 {
 	if (udphy->flip) {
@@ -588,10 +624,6 @@ static void rk_udphy_set_typec_default_mapping(struct rk_udphy *udphy)
 		udphy->dp_lane_sel[1] = 1;
 		udphy->dp_lane_sel[2] = 3;
 		udphy->dp_lane_sel[3] = 2;
-		udphy->lane_mux_sel[0] = PHY_LANE_MUX_DP;
-		udphy->lane_mux_sel[1] = PHY_LANE_MUX_DP;
-		udphy->lane_mux_sel[2] = PHY_LANE_MUX_USB;
-		udphy->lane_mux_sel[3] = PHY_LANE_MUX_USB;
 		udphy->dp_aux_dout_sel = PHY_AUX_DP_DATA_POL_INVERT;
 		udphy->dp_aux_din_sel = PHY_AUX_DP_DATA_POL_INVERT;
 		gpiod_set_value_cansleep(udphy->sbu1_dc_gpio, 1);
@@ -601,18 +633,14 @@ static void rk_udphy_set_typec_default_mapping(struct rk_udphy *udphy)
 		udphy->dp_lane_sel[1] = 3;
 		udphy->dp_lane_sel[2] = 1;
 		udphy->dp_lane_sel[3] = 0;
-		udphy->lane_mux_sel[0] = PHY_LANE_MUX_USB;
-		udphy->lane_mux_sel[1] = PHY_LANE_MUX_USB;
-		udphy->lane_mux_sel[2] = PHY_LANE_MUX_DP;
-		udphy->lane_mux_sel[3] = PHY_LANE_MUX_DP;
 		udphy->dp_aux_dout_sel = PHY_AUX_DP_DATA_POL_NORMAL;
 		udphy->dp_aux_din_sel = PHY_AUX_DP_DATA_POL_NORMAL;
 		gpiod_set_value_cansleep(udphy->sbu1_dc_gpio, 0);
 		gpiod_set_value_cansleep(udphy->sbu2_dc_gpio, 1);
 	}
 
-	rk_udphy_mode_set(udphy, UDPHY_MODE_DP_USB);
-	udphy->dp_lanes = 2;
+	/* default to USB3 + DP as 4 lane USB is not supported */
+	rk_udphy_set_typec_state(udphy, TYPEC_DP_STATE_D);
 }
 
 static int rk_udphy_orien_sw_set(struct typec_switch_dev *sw,
@@ -1268,7 +1296,6 @@ static int rk_udphy_typec_mux_set(struct typec_mux_dev *mux,
 				  struct typec_mux_state *state)
 {
 	struct rk_udphy *udphy = typec_mux_get_drvdata(mux);
-	u8 mode;
 
 	/*
 	 * Ignore mux events not involving DP AltMode, because
@@ -1280,38 +1307,10 @@ static int rk_udphy_typec_mux_set(struct typec_mux_dev *mux,
 
 	mutex_lock(&udphy->mutex);
 
-	switch (state->mode) {
-	case TYPEC_DP_STATE_C:
-	case TYPEC_DP_STATE_E:
-		udphy->lane_mux_sel[0] = PHY_LANE_MUX_DP;
-		udphy->lane_mux_sel[1] = PHY_LANE_MUX_DP;
-		udphy->lane_mux_sel[2] = PHY_LANE_MUX_DP;
-		udphy->lane_mux_sel[3] = PHY_LANE_MUX_DP;
-		mode = UDPHY_MODE_DP;
-		udphy->dp_lanes = 4;
-		break;
-
-	case TYPEC_DP_STATE_D:
-	default:
-		if (udphy->flip) {
-			udphy->lane_mux_sel[0] = PHY_LANE_MUX_DP;
-			udphy->lane_mux_sel[1] = PHY_LANE_MUX_DP;
-			udphy->lane_mux_sel[2] = PHY_LANE_MUX_USB;
-			udphy->lane_mux_sel[3] = PHY_LANE_MUX_USB;
-		} else {
-			udphy->lane_mux_sel[0] = PHY_LANE_MUX_USB;
-			udphy->lane_mux_sel[1] = PHY_LANE_MUX_USB;
-			udphy->lane_mux_sel[2] = PHY_LANE_MUX_DP;
-			udphy->lane_mux_sel[3] = PHY_LANE_MUX_DP;
-		}
-		mode = UDPHY_MODE_DP_USB;
-		udphy->dp_lanes = 2;
-		break;
-	}
-
-	rk_udphy_mode_set(udphy, mode);
+	rk_udphy_set_typec_state(udphy, state->mode);
 
 	mutex_unlock(&udphy->mutex);
+
 	return 0;
 }
 

-- 
2.53.0

