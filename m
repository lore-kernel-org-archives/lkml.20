Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B21763F23D0
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 10:04:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790762694; cv=none; b=bjPn5fcfMkVFJA7eWpiRvUx580lZ+pfApmpzHJWkddV803C8HafP4RPSBGsWf0VWALRggi/y9JPitPt5+Vew6duGdu3EF9ZXz/QAfVJIkn40AwoTWqkPSPEh8wG7iTu1ALbVSEAZt5vCf4ofwejaGaWkUk6e09tJw3MnrsNZjbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790762694; c=relaxed/simple;
	bh=9BuZnoVI7c9BJPfnxoOjG1rmHG+iWvm89EJHZVN1ZeA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=H/bk+894slzfHHmmuBdDKvRR0ixQUD8ZUFc5eidj6rrcBwoNPyfaJMQaq/Xo+sGeVFlZ3iS0J0flkxp1eHTOxORw5NrzVjLGplUlbP9MkbA88rZhuUqeFqEfMdymFeXzI66RI4h556i7/8dbS9EAFl9rxrGVyLO1ENxmwrDs8lc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=NBjULIxA; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="NBjULIxA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1790762687;
	bh=9BuZnoVI7c9BJPfnxoOjG1rmHG+iWvm89EJHZVN1ZeA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=NBjULIxAnKtvjuskbVc8V+6lWvt2459MmoDoaKymygjpSbeaND5BhZ0H3O2wlU5+n
	 IU5S0GnBpvebePGLl+RoKxfjjz5aQO03b/X4xQfQK5COOJXhXkwmHuMFg/58d5T9iw
	 7FwUPJcDnv+TLGAw1h+jG2xanRfd8wHg25aYkhQig6O8IMrfMhTPq/p7zC8iLuAfIc
	 0Kc1Yi2wi1QRrNNmSm5cnAuCzdw/4ie/qhG1S7T+yx4KQfXWvBYKQz4ZnS9pbz29b1
	 KRpJ2rjg9iUBZedVIouFmkqHNv2/Yqeh+6tcuMiivsWQc/5ljPMTq7Xhb/aiHpU6w3
	 TA8xwBxYp7cRg==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id B7B0917E0FBB;
	Wed, 30 Sep 2026 12:04:47 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 1845448003A; Wed, 30 Sep 2026 12:04:47 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Wed, 30 Sep 2026 12:04:36 +0200
Subject: [PATCH v16 7/7] phy: rockchip: usbdp: Add USB-C state without DP
 enabled
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260930-b4-rockchip-usbdp-cleanup-part3-v16-7-bc144f80afc4@collabora.com>
References: <20260930-b4-rockchip-usbdp-cleanup-part3-v16-0-bc144f80afc4@collabora.com>
In-Reply-To: <20260930-b4-rockchip-usbdp-cleanup-part3-v16-0-bc144f80afc4@collabora.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Zhang Yubing <yubing.zhang@rock-chips.com>, 
 Frank Wang <frank.wang@rock-chips.com>
Cc: linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kernel@collabora.com, Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Igor Paunovic <royalnet026@gmail.com>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3533;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=9BuZnoVI7c9BJPfnxoOjG1rmHG+iWvm89EJHZVN1ZeA=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGq83r9xSsr7gn/FCM36kiD8y4zjT18XmDlq0
 9v9gDDoGL6W9IkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqvN6/AAoJENju1/PI
 O/qajXYQAKBtTHin1r2xA3WR59YYB6bZ9VOwmyWaAu3AjSDZGFfG8QY6+LCVZhPA8H/myn9R0XZ
 GkQkECWi70w6cqG1KIGwhhLRxP8JhTzEIr3+0g8kYV0Ia/BkU/4/ZkaDuJMCWOp+YE7GRMIIEZT
 aN55vu3fL6SVBFtMNhs/4qVTuS8HPGCv3cBZNTFtxuYFN7zr/dvK4yP1YAVgoofkJOxElLQSIxp
 gcQ+5DMseukE8ZK7jK4IypNXsLGfleGdyYkWPuOk19yz7x7TZ63gKlzf02AaKRpu0KsdROsNxvl
 iy6jCKbQSB1tTOe8+YOIqM0yUvTOB+UehFhQ0h/bc6n16htjQRRahPb9fBeCBxBqDG84OiI67ij
 SsWvimvTvtRA7z5JmRuUUbsSCd6EzSAWqUn7BWfHdoUaenWRzB28QgC/1WobBPQAANszN5JNNcd
 hVFvr31mLKObkEIRiJ4JHK6pldjt7oC/b51jKpB8eSOo6mgdJgIqBSUnu6JJPVmGbJEFiCgGE7T
 2iGl6Hu8out0Z8CK+YfVaVPSw88KvIgaF8btLUsJqgbVLU8Y8q1iHapThEAyU858hfPaBW8ib8D
 i0Rl5tLqu82Pk5TUh6yKm7ISRnzgB7UnbGjUbRu30tsQXxwH6TkrNbi6veNl1bDl11qxltPcn1i
 1TY9ZyKHDRLRnuxHesuExCQ==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

The driver currently only differs between 4 lanes DP mode or combined DP
+ USB3 mode. This makes sense from a lane routing point of view, as the
hardware only has 2 lanes of USB3.

But adding a separate state for USB-only helps with power management,
since we always power up all PHY parts according to the current hardware
setup to avoid data stream interruptions. Even if some lanes are muxed
to the DP controller there is no need to keep the DP side enabled if
something without DP AltMode is plugged into USB-C.

This potentially triggers some more USB reconnections during the PD
AltMode negotiation when switching from USB-only to combined USB+DP
mode. This should be fine, as the cable is freshly plugged at this
point.

Tested-by: Igor Paunovic <royalnet026@gmail.com> # Orange Pi 5 Plus
Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 57 ++++++++++++++++++-------------
 1 file changed, 33 insertions(+), 24 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index ca01c1112c0f..f95c3216364f 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -579,32 +579,14 @@ static void rk_udphy_dp_lane_enable(struct rk_udphy *udphy, int dp_lanes)
 				   CMN_DP_CMN_RSTN, FIELD_PREP(CMN_DP_CMN_RSTN, 0x0));
 }
 
-static void rk_udphy_mode_set(struct rk_udphy *udphy, u8 hw_mode)
+static void rk_udphy_set_lane_mux(struct rk_udphy *udphy)
 {
-	if (udphy->hw_mode == hw_mode)
-		return;
-
-	udphy->phy_needs_reinit = true;
-	udphy->hw_mode = hw_mode;
-}
-
-static void rk_udphy_set_typec_state(struct rk_udphy *udphy, unsigned long state)
-{
-	u8 hw_mode;
-
-	switch (state) {
-	case TYPEC_DP_STATE_C:
-	case TYPEC_DP_STATE_E:
+	if (udphy->dp_lanes == 4) {
 		udphy->lane_mux_sel[0] = PHY_LANE_MUX_DP;
 		udphy->lane_mux_sel[1] = PHY_LANE_MUX_DP;
 		udphy->lane_mux_sel[2] = PHY_LANE_MUX_DP;
 		udphy->lane_mux_sel[3] = PHY_LANE_MUX_DP;
-		hw_mode = UDPHY_MODE_DP;
-		udphy->dp_lanes = 4;
-		break;
-
-	case TYPEC_DP_STATE_D:
-	default:
+	} else {
 		if (udphy->flip) {
 			udphy->lane_mux_sel[0] = PHY_LANE_MUX_DP;
 			udphy->lane_mux_sel[1] = PHY_LANE_MUX_DP;
@@ -616,12 +598,39 @@ static void rk_udphy_set_typec_state(struct rk_udphy *udphy, unsigned long state
 			udphy->lane_mux_sel[2] = PHY_LANE_MUX_DP;
 			udphy->lane_mux_sel[3] = PHY_LANE_MUX_DP;
 		}
-		hw_mode = UDPHY_MODE_DP_USB;
-		udphy->dp_lanes = 2;
+	}
+}
+
+static void rk_udphy_mode_set(struct rk_udphy *udphy, u8 hw_mode, u8 dp_lanes)
+{
+	if (udphy->hw_mode == hw_mode && udphy->dp_lanes == dp_lanes)
+		return;
+
+	udphy->phy_needs_reinit = true;
+	udphy->hw_mode = hw_mode;
+	udphy->dp_lanes = dp_lanes;
+}
+
+static void rk_udphy_set_typec_state(struct rk_udphy *udphy, unsigned long state)
+{
+	switch (state) {
+	case TYPEC_DP_STATE_C:
+	case TYPEC_DP_STATE_E:
+		rk_udphy_mode_set(udphy, UDPHY_MODE_DP, 4);
+		break;
+
+	case TYPEC_DP_STATE_D:
+		rk_udphy_mode_set(udphy, UDPHY_MODE_DP_USB, 2);
+		break;
+
+	case TYPEC_STATE_SAFE:
+	case TYPEC_STATE_USB:
+	default:
+		rk_udphy_mode_set(udphy, UDPHY_MODE_USB, 0);
 		break;
 	}
 
-	rk_udphy_mode_set(udphy, hw_mode);
+	rk_udphy_set_lane_mux(udphy);
 }
 
 static void rk_udphy_set_typec_default_mapping(struct rk_udphy *udphy)

-- 
2.53.0

