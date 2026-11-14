Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794621655;
	b=GUF6qrtbUjRWSe3Czh93SDi1ULn5rftw1VQ5fXr0kIEaqZ1+1PEtxCG5TTRbTOrrWSS8
	 qMQy21Usb6zMtyqca/QAFqX9HXezzipw4KhHAfhbegEeoIkNnNg6W222yPbilEaOWzLJo
	 1GJZ1iOyLfGREPe3rfjKrcqRg8an0+8CuFjnwM7BjHdFoxhHYAO7L4peQi3i5fD9LHV3n
	 85O+bnKvGAVEZITqwPJLcHkkPjx5FcOv4Gr1g1J6PGmGyPXvtrtax5uF1JTWsjqsbiy5o
	 wAlb66nFH/Rme1AqH3MNWajcoHdVWcy1LyC0aQ3XyYfeZ8F1mxZU6jG2wdRqAYAva3Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794621655;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=coEnlzSGQu4v5vbNOK2GtmZJ7HbJSBq85wFJcmg6BIo=;
	b=yhHoo9WHD+NgCFDX6IlMf8FZ58mUjwadvzRB2yrN4gI+Jp1ypWbDGpbSCb7SosVsaOXo
	 691g2BetoLVSFVf840fTrx6/AmA06KE0kGVv14/VVSZtXhloqH8qU9xUOfSS+ltMt29tD
	 y/OI+2lWMYjOM/VK7RmH43KhoZwNu5USYXS6mYyqDsqM5VBAdVUhj16RbRGtuX8rqZqgG
	 nPdrVnG1oFYYnbZSoYvfbIBVf8H1IhN/5nPI8KR0s55gMhqTcnQOMVuDo6CoT6o4VPle2
	 /4dah/5ut/hcBfC2rnTs5aqD34ev1WttD07gwgjyDorkqLt9GTL+C8YPv7Bnk6RDz7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=Bom6+kxh;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2F91606A898
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 02:00:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D2F91606A898
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=Bom6+kxh
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1794621651;
	bh=/JqmM3uj+wlrMcqfu78fwLl+OoO1RNMNCLnoQPns4z8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Bom6+kxhJnuMp+OMwqATCanDiDN7bkK92RF5DNB8LuCaVC7cyjVLiaOdzowcGu5xx
	 1L1iW3WvREzz5uq1fDCTC0ONbYths0mkPrOMx6/Q8gi5joYgBwB5vnGirYlTck1FbE
	 87xc8lbGDZdEZA2Vnay+RMzhCV5Yjf3gLujIWb7dtojU+tuj4/EQDrDPpt+lLhLgTK
	 n+gUxwUUa7+mwmoYB5odMorbNeBEXA60l/tW+A0T1LmNP/hSnc45QVZ6pNKotphuE4
	 +/LrtIsDamlsOGsS7Eqw2YmGFbqx7VRLEk3/i9+esA2e7cOUlb67CpOR1Hhf63RML7
	 Q68Zq3S6dlNww==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 150DE17E0F70;
	Sat, 14 Nov 2026 03:00:51 +0100 (CET)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 7B8BC48003A; Sat, 14 Nov 2026 03:00:50 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Sat, 14 Nov 2026 03:00:33 +0100
Subject: [PATCH v17 6/7] phy: rockchip: usbdp: Add USB-C state without DP
 enabled
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261114-b4-rockchip-usbdp-cleanup-part3-v17-6-1af5f566408e@collabora.com>
References: <20261114-b4-rockchip-usbdp-cleanup-part3-v17-0-1af5f566408e@collabora.com>
In-Reply-To: <20261114-b4-rockchip-usbdp-cleanup-part3-v17-0-1af5f566408e@collabora.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Zhang Yubing <yubing.zhang@rock-chips.com>, 
 Frank Wang <frank.wang@rock-chips.com>
Cc: Igor Paunovic <royalnet026@gmail.com>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>, 
 Alexey Charkov <alchark@flipper.net>, 
 Chaoyi Chen <chaoyi.chen@rock-chips.com>, linux-phy@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kernel@collabora.com, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3533;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=/JqmM3uj+wlrMcqfu78fwLl+OoO1RNMNCLnoQPns4z8=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGr3wNJvYyZYeL38XoG0muILNKY1Bzo9VHIZS
 93Y9EwYYMLj6IkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJq98DSAAoJENju1/PI
 O/qaEpUP/2RGOltvV1Ua9jMLbJT48KIKHCW21G6+AuzRfpBoBVBiLWE+ZxEVnDZ1T4RRVyixr9A
 LggcBI/VfPv6CMGCS1YuFcTxMABJsqqndh7B8kK5bzo2NQTRUA04G/av5YdMcVsjdmGzQyY3BaL
 wJpsFojeeuRCLjiDAXhN/mEbl4AEwaxG66TQVJei1H71/3ChAbq+7AS5tE71rC5+IUnuq51l1a3
 OAIq6l9G70dYRDqaUgX0HjjEF9IA4ww+yf6aNlfhIBVFjMvbMRyx/FUuLKDLuwgFDjSCAZUgvVf
 BBkFqr+/KXBjmeRdGFmSgYPZBEoYLHJbcqWKm5fQEtjqFCANEfwKbV6OGM1UO4Kv1zwF2FeW6dU
 JVm87++3qKGsCWfe0aYVCGypQHO0Z4QxoQlOGOjIM7mtziwgfK677vrRcfuTGr9rKjU5LncKgCt
 pHhTTrTbZ4sd52uJMqZMAimOJpJN/LJhAvO0neGy7PAnJs24wRaBD8+D6F4gD9YvIljdxJAKJo5
 XxELS/VX9TMDmoqhtTptC5RdNMS/aUvjGCNdDjppUaWCIvv98LF5BqMjvznZHhIFJTFMal+bo9m
 +hMNwNT7PvKnADV8l3Xx2SR8bCzJhsJmnFKnehSkWuElGjGfNcm5YYuQ+3lXPKGrcXsnEF/lo0a
 aklilNT9+4m77scpkrJElRw==
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
index b79b6db96a0e..553b88c45108 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -583,32 +583,14 @@ static void rk_udphy_dp_lane_enable(struct rk_udphy *udphy, int dp_lanes)
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
@@ -620,12 +602,39 @@ static void rk_udphy_set_typec_state(struct rk_udphy *udphy, unsigned long state
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

