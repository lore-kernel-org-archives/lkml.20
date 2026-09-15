Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 725E03DA5A7
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 15:06:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789484786; cv=none; b=BNVm0m3iDWYNFh6dFHjL/h3FjTB2TxYw5fs3PWILidqjCQQLJgvEM9OwBJM1GXB3HOIaVMRPbmy8LLBgfjzc76BAbEgEfcyrehleNJUciECC83/wr/hGIi8XjRKrj9cBSpo1rY4CgVhlTSYGAQd7RJAJ5A3FIhaspaSVaAT2VNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789484786; c=relaxed/simple;
	bh=3VCECqA2k6xTSDdA+dQDIssXamdM2G2rU7qCTIr/yAA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Nv0t7U6H8uGVqdf9hb4c5wPIs/NSVqyOvJXXzlEfGutjfvM4bwUFJ7sbaJ1L+0P2Md7rOp5tqi9YJo3LDy86c1y/1aHY9Zlu7k3lPt9PN/Aj7SvyZuy49zKKrv1gxzP+YigfWuyPYMWh+/grSfFL213c7NTSNVavz9XInTQ4EMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=OlMbDor/; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="OlMbDor/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1789484779;
	bh=3VCECqA2k6xTSDdA+dQDIssXamdM2G2rU7qCTIr/yAA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=OlMbDor/N5EKCHNqt8gjiXFg/rIAqcf6eYhQG9dHlYKj/1qy7De0Ua+hVARqkkkEw
	 WY+n7k0M4T7I1qv9AjI8Q+J8ZwfBwyDZbNEQL4gHQF75F1hy6WfkmnQGz42SlzXSkh
	 kzCUprLd1F6Bdg4i5zFkzALl5PD/NPCbanpU6qYBSnj6TLVa9WZ+PGC0IiaDUlebJg
	 PaUggAI/soZlMnDzrBxXrkT2KElpeVjInQiqMJu/x0pcV6XicfyK5n+F7O4BqSU9Z2
	 jWQr9dy6q85lzVz8rPV/W76wsZok038wlth+ja1mNUUDoa8a8h0ikBIa3ySQTL/XVN
	 Uv9ZmcAmdJ14w==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id EEF6317E0D43;
	Tue, 15 Sep 2026 17:06:18 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 6B37B48003D; Tue, 15 Sep 2026 17:06:18 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Tue, 15 Sep 2026 17:06:11 +0200
Subject: [PATCH v15 08/11] phy: rockchip: usbdp: Add some extra debug
 messages
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-rockchip-usbdp-cleanup-part2-v15-8-8d507cb1174f@collabora.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3301;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=3VCECqA2k6xTSDdA+dQDIssXamdM2G2rU7qCTIr/yAA=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGqpXurUvbIMyjX9rhX1LOL2iIJyybyYBzXsb
 CaZ3Fvm6jA2hYkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqqV7qAAoJENju1/PI
 O/qaJhUP/1y3vIvtCyq0W6mzcxf6s2toVgKG8uRavAG/omXoNWm+Zrkj5BZaX9XjaW5QhND80wZ
 8fxqeYFbMa490SSP9LVAG0KOO9/A8fFJsjZOiodgAV+J8B7mpCe3aX6vnLY/8u833a6qHB6m2b4
 NoLvVBw5rnCNd6KRtcgJpHTCgT3AJojFOKXkFWeuQA8sA8UtOF7tYRECplSQrMt+AlS7c4mFonF
 DgQX/SpwpP1vbZtFSakKX+QT6J0bMnolXRKnzC+/gdWUNEIjkvNa7+QV5dKL/jvuoQuHI+g3kGk
 ccSrlZzxcH7lQybYe0cTJSc1b7pWCvvEzSyPTYuC8/5qGwBY/CsvFw5aId04O5BFy0DcgrYhFfE
 3NRY7Zlk4Z3IM4p/slFPj+bHUHmXhkpHS4tKT7NM7RdmY3AwQ2HDWN9GnRRqxvLsMfnLW0xQe7S
 mQG+nwgKgfARc8r2e1IBvfS75PN1zkJIzcYLGHXwSiD4r1jZhmTPoUI22D+RunJ7yb7gTON1e/b
 lMd0ev8fxSbiTNSGAjBt+kgKfdhF7F72OzgkAbguNSt8OhIOSS2lSSDPmVDcAYECKSblwO3Oi2J
 1ibfiVzbogBYzm+Ye31282L4r/ns8IcHyVIb0JcgOe7p3Bas7kSsHNl8QtL1IojOgDow0+sc6HI
 wnlxDyLRfWFFijlqBUiUwRg==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

It's useful to log PHY reinit to ease debugging issues around
USB-C hotplugging.

Tested-by: Igor Paunovic <royalnet026@gmail.com> # Orange Pi 5 Plus
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 23 +++++++++++++++++++++--
 1 file changed, 21 insertions(+), 2 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index 2888a0a97088..23cfb9bbd334 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -23,6 +23,7 @@
 #include <linux/property.h>
 #include <linux/regmap.h>
 #include <linux/reset.h>
+#include <linux/string_choices.h>
 #include <linux/usb/ch9.h>
 #include <linux/usb/typec_dp.h>
 #include <linux/usb/typec_mux.h>
@@ -461,6 +462,8 @@ static int rk_udphy_reset_deassert(struct rk_udphy *udphy, char *name)
 			return reset_control_deassert(list[idx].rstc);
 	}
 
+	dev_err(udphy->dev, "failed to de-assert missing reset line: %s\n", name);
+
 	return -EINVAL;
 }
 
@@ -487,6 +490,8 @@ static void rk_udphy_u3_port_disable(struct rk_udphy *udphy, u8 disable)
 	const struct rk_udphy_cfg *cfg = udphy->cfgs;
 	const struct rk_udphy_grf_reg *preg;
 
+	dev_dbg(udphy->dev, "USB3 port %s\n", str_on_off(!disable));
+
 	preg = udphy->id ? &cfg->grfcfg.usb3otg1_cfg : &cfg->grfcfg.usb3otg0_cfg;
 	rk_udphy_grfreg_write(udphy->usbgrf, preg, disable);
 }
@@ -661,8 +666,10 @@ static int rk_udphy_orien_sw_set(struct typec_switch_dev *sw,
 		return 0;
 	}
 
-	if (udphy->flip != flipped)
+	if (udphy->flip != flipped) {
+		dev_dbg(udphy->dev, "cable orientation changed, PHY re-init required.\n");
 		udphy->phy_needs_reinit = true;
+	}
 
 	udphy->flip = flipped;
 	rk_udphy_set_typec_default_mapping(udphy);
@@ -780,6 +787,11 @@ static int rk_udphy_init(struct rk_udphy *udphy)
 	const struct rk_udphy_cfg *cfg = udphy->cfgs;
 	int ret;
 
+	dev_dbg(udphy->dev, "reinit PHY with USB3=%s and DP=%s (%u lanes) flipped=%s\n",
+		str_on_off(udphy->mode & UDPHY_MODE_USB),
+		str_on_off(udphy->mode & UDPHY_MODE_DP),
+		udphy->dp_lanes, str_yes_no(udphy->flip));
+
 	rk_udphy_reset_assert_all(udphy);
 	usleep_range(10000, 11000);
 
@@ -850,6 +862,8 @@ static int rk_udphy_setup(struct rk_udphy *udphy)
 {
 	int ret;
 
+	dev_dbg(udphy->dev, "enable PHY\n");
+
 	ret = clk_bulk_prepare_enable(udphy->num_clks, udphy->clks);
 	if (ret) {
 		dev_err(udphy->dev, "failed to enable clk\n");
@@ -868,6 +882,7 @@ static int rk_udphy_setup(struct rk_udphy *udphy)
 
 static void rk_udphy_disable(struct rk_udphy *udphy)
 {
+	dev_dbg(udphy->dev, "disable PHY\n");
 	clk_bulk_disable_unprepare(udphy->num_clks, udphy->clks);
 	rk_udphy_reset_assert_all(udphy);
 }
@@ -1307,8 +1322,12 @@ static int rk_udphy_typec_mux_set(struct typec_mux_dev *mux,
 	struct rk_udphy *udphy = typec_mux_get_drvdata(mux);
 
 	/* Ignore mux events not involving USB or DP */
-	if (!rk_udphy_is_supported_mode(state))
+	if (!rk_udphy_is_supported_mode(state)) {
+		dev_dbg(udphy->dev, "ignore mux event with mode=%lu\n", state->mode);
 		return 0;
+	}
+
+	dev_dbg(udphy->dev, "new mode: %lu\n", state->mode);
 
 	guard(mutex)(&udphy->mutex);
 

-- 
2.53.0

