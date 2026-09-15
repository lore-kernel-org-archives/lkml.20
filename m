Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CE3C4A3F08;
	Tue, 15 Sep 2026 13:50:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789480212; cv=none; b=U0q7sFIb4We/BWlOCmP05vd4F5Ebn2GBi85loiZ07U3MO6EvXgwuQYp29kreQWg02K5P99v/kAhWx0Px+MpzIOinDzd8y4bsQ7yI6IgMYfL01a1remEPSnpuOpoXEvcPK4hIhpaQ6nIbm/sp+W6Bu7Ms3FhbDhYQS5TtI/bTrbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789480212; c=relaxed/simple;
	bh=w4qlIQNDkvn6mYAhbX6ekkV61cS1siUZ4+py57NB2Lc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=n4jfsB3IPGHXf0pIkW0uyOqDn1o5pE9wD+R73t4aUdhBo9ox6eqiASU9kAa2Pk/5xyToH8aLJRlrKhU9oh3+mos1D0YFMQkJZWkxp0WTKlD4ILGRJg0SAIAX6WtVpsl6Ve55zxoCzugWyZ4yHAjJ2l0f2MnqF5FwA6BaZB4ZVJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=aAxnPxu1; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="aAxnPxu1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1789480199;
	bh=w4qlIQNDkvn6mYAhbX6ekkV61cS1siUZ4+py57NB2Lc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=aAxnPxu1uhS8qhMGbwVBFT9ZcUqWjFvVUBARB1+xCrDMIJEq67tEhdGjRvVxOVSXw
	 LGo7IIYgTMD6bavprLlqk+cjqLUThX9oszeHPz4DYAA4/RHW6TYKhxlO1jRjHrcvf/
	 2/lixyhwlbVf6mvCrkO0nlYbhY9uwMP7iv6RYshwRPJdUNUynONnjum5wjJdz6x4s0
	 MLFKqIjNJeKodLTJrboqy8GOm9hC3Hm1FyehORByeRJVl6UuhceE30VEEn7NTEHClT
	 M3bo8Fo+5sva7iWG5MB649vIuZpwLpldZwrg13/prpFFzNBEntfTwbYG5JsDwewuEp
	 iW9OSkWPni4Tw==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 296A117E0E95;
	Tue, 15 Sep 2026 15:49:59 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 414A2480061; Tue, 15 Sep 2026 15:49:58 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Tue, 15 Sep 2026 15:50:02 +0200
Subject: [PATCH v15 15/16] phy: rockchip: usbdp: Cleanup DP lane selection
 function
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-rockchip-usbdp-cleanup-v15-15-80e2c11d1ce8@collabora.com>
References: <20260915-rockchip-usbdp-cleanup-v15-0-80e2c11d1ce8@collabora.com>
In-Reply-To: <20260915-rockchip-usbdp-cleanup-v15-0-80e2c11d1ce8@collabora.com>
To: Vinod Koul <vkoul@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Heiko Stuebner <heiko@sntech.de>, Frank Wang <frank.wang@rock-chips.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: Andy Yan <andy.yan@rock-chips.com>, Dmitry Baryshkov <lumag@kernel.org>, 
 Yubing Zhang <yubing.zhang@rock-chips.com>, 
 Alexey Charkov <alchark@flipper.net>, Igor Paunovic <royalnet026@gmail.com>, 
 linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kernel@collabora.com, devicetree@vger.kernel.org, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1958;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=w4qlIQNDkvn6mYAhbX6ekkV61cS1siUZ4+py57NB2Lc=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGqpTQYTtQeglfao+Zjxa2gqbMhBn9TnqMq3E
 R9IvVcmUzLHgokCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqqU0GAAoJENju1/PI
 O/qa5LcQAIO1uZpbSoWO7q7f7IJE763tuDf96iTEpKCoJxRBWQqJpqH4zD48XHdCFZKoIpAT9xR
 OF7kEuu4gUCN4TQL0IqLuj9hPHXKIRHmL0qsaiwe1a8xENL778JOXcAp9SvDv5LVgwd3Uf9QqSK
 1GMh0AvGoyMImCUjVuoBiBCakPsnJlvQh5VQG76PYiJLH2HUtfgcRt0vijwFZ8VAsbZi0R5apdE
 wolr9z87UYglTlwTez8b+HV/FzKndtb+8m2ET3GWvg0MMtGi+QwSfJmffGD8/WSwyY6TPFy97Hl
 52WYnyA3aArtJ/LzJTL3M5m8r+ytsj3GTBHTEwoSgmpy384pEdkMaVrnPV+ZloINc3PTC2VMKmf
 b2xRoUcVnWW+fvCXWnzR84iuIkksY4mRA57UrEBAJhOXVxCQ5sVzoZ+lrBQ2dgHKd+/Y8KTA3ev
 zwdj6aWoC1YCv6CI+iba9G0Pi5GcfW/newLo9RLCWnw8iDjjQ6eMzIaVIJTNSTxGTThyVxi793R
 lCqCwNuqiGlb306yLmCS8715aKhAJtbmjC93pvY1o18KEC4o9Gtqe1BHYjtSDEX81RSkDeOgg0h
 B1NkwcAW1DJWnBWcyGH+iiqAO8edpeE0yBuSMgonOl+ft5UwfXyhQyyIKIgdiLJn3TSv7UbDPji
 B7POmXsmLbiS5vfeFvjAuDQ==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

Use FIELD_PREP_WM16() helpers to simplify the DP lane selection
logic.

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Tested-by: Igor Paunovic <royalnet026@gmail.com> # Orange Pi 5 Plus
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 28 +++++++---------------------
 1 file changed, 7 insertions(+), 21 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index d95a44835caf..8874f8429a67 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -547,30 +547,16 @@ static void rk_udphy_usb_bvalid_enable(struct rk_udphy *udphy, u8 enable)
 static void rk_udphy_dp_lane_select(struct rk_udphy *udphy)
 {
 	const struct rk_udphy_cfg *cfg = udphy->cfgs;
-	u32 value = 0;
-
-	switch (udphy->dp_lanes) {
-	case 4:
-		value |= 3 << udphy->dp_lane_sel[3] * 2;
-		value |= 2 << udphy->dp_lane_sel[2] * 2;
-		fallthrough;
-
-	case 2:
-		value |= 1 << udphy->dp_lane_sel[1] * 2;
-		fallthrough;
+	u32 value = FIELD_PREP_WM16(DP_LANE_SEL_ALL, 0);
+	int i;
 
-	case 1:
-		value |= 0 << udphy->dp_lane_sel[0] * 2;
-		break;
+	for (i = 0; i < udphy->dp_lanes; i++)
+		value |= field_prep(DP_LANE_SEL_N(udphy->dp_lane_sel[i]), i);
 
-	default:
-		break;
-	}
+	value |= FIELD_PREP_WM16(DP_AUX_DIN_SEL, udphy->dp_aux_din_sel);
+	value |= FIELD_PREP_WM16(DP_AUX_DOUT_SEL, udphy->dp_aux_dout_sel);
 
-	regmap_write(udphy->vogrf, cfg->vogrfcfg[udphy->id].dp_lane_reg,
-		     ((DP_AUX_DIN_SEL | DP_AUX_DOUT_SEL | DP_LANE_SEL_ALL) << 16) |
-		     FIELD_PREP(DP_AUX_DIN_SEL, udphy->dp_aux_din_sel) |
-		     FIELD_PREP(DP_AUX_DOUT_SEL, udphy->dp_aux_dout_sel) | value);
+	regmap_write(udphy->vogrf, cfg->vogrfcfg[udphy->id].dp_lane_reg, value);
 }
 
 static void rk_udphy_dp_lane_enable(struct rk_udphy *udphy, int dp_lanes)

-- 
2.53.0

