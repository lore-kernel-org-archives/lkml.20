Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ED223DA7C6
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 15:06:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789484783; cv=none; b=TjPde1TUU2EttxYHUDFXI/4VUq1fbx5y4XdeFLXd2xJK6BHUDsJX/QSu0tbtlLf7sTpdtvwue4UDRX47tJLyXnVVQuQp/e02SisbIamerBKGpgkYGEWG2xFCM1dQVdXpuUYiVREny0ZyxplSNVqQseAH9H+98ezUK6RT0KONMlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789484783; c=relaxed/simple;
	bh=T/O/y40l4OvjR7/IWyTPneK/pahaizerNwZ71+yNOZM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oD7K1wgHJabMsBmjldJR7ckI4E66D2YamywXm8bTzMR8CPGTkQmzvYN7HKf7JrvaFR9T0ikkhZzaVx+qEjn/RA52SrZANzHKeZpKv0KTol3gbJg8zlJaVIBoTku1BLV5eCfpmYLhtHpgBUgz0vi1913Ou4hs4BvmNePhn/sZadk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=nwzgb/dm; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="nwzgb/dm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1789484778;
	bh=T/O/y40l4OvjR7/IWyTPneK/pahaizerNwZ71+yNOZM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=nwzgb/dmrNgmbwEf+liKQCN9vDHeJV6OxQms+UMCAUxfjjCqmQHLjTkkW8ky7e+bi
	 81z1KphxNhPxyq8N2VgfqtyQ9qGLbDQQkqEsCAR4oERdo3Cnb9VQdGc10cuO9tqqYq
	 n3bAv46g2jNH1zjx+OTiwQ0RommQ/MR/00WAxV8dOUBfD6K30JIp094MI2zY70/UMN
	 IPyz57mtS+DkEwpwhhR6AaG6qEVt94uiCVWUJxJwB7Leo9z99bXGpc6jfgcgLSIZeB
	 KnzjUJQsASBoW0aEMDPRmKPXUo423Gv9eAujjzxQtJVtKZI/SKsOIOM36f6Esnb62c
	 jnbJAcnhvNl4A==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 950CE17E005A;
	Tue, 15 Sep 2026 17:06:18 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 5F209480029; Tue, 15 Sep 2026 17:06:18 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Tue, 15 Sep 2026 17:06:04 +0200
Subject: [PATCH v15 01/11] phy: rockchip: usbdp: Drop DP HPD handling
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-rockchip-usbdp-cleanup-part2-v15-1-8d507cb1174f@collabora.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5925;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=T/O/y40l4OvjR7/IWyTPneK/pahaizerNwZ71+yNOZM=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGqpXum9kixylWlkHUFtZbGwfMJVKXFV6RdK6
 Jg2iraPb+3XFIkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqqV7pAAoJENju1/PI
 O/qaxcYP/RtZTwjP2MjCNbTlqi0zschkWczstGYQteQopq46qymO/SXExVhZnDjd/SsdR4pCUys
 52npyHJAw8O84QixyY7XZyVNJ8HVeb6xXWoaiSykXzttI2i061ESCTiexn7jB0pXkeqUc+T6WYc
 pfkZBcu+t2DNZRWb/GLoP+XyfT870QVRif3NiFgWls+PCHxkKzTUJZ1xean7D6N19AbFa0SFqwT
 Ueg0CufAeZFocAIdGklOK6D1pNuwAjkQH65US+UVKDUXuf6pKWyxRMp+7LeyRtA3Ba+8FqoIRgC
 9SAUiY01+t6d9xLwrUpRc/h26Y8LrsMoLPB/XNF1ChyXjsuxLVJaGfobHKumI/dB2J58mlwkybg
 jmLYze6sIBVuvdaA60YbgrD7GcITmxLSToWitscMFhY/j9z5BSu12sRpsr3iWuKS1j1u5nvu1vG
 rkDEsr0ypUSA/a3U4WomJIpTYbzwBkZr6+oSDmsZ1M+Ekg0Gguqh4MYyflwkwTHB7J+PydozDxt
 +3AnhgjUmBAn5iss8zIzAN/Z3HBCoGqSkkAfdrbPRY3scBulwAocjSbayI+3U1LxdMqTPsTRs36
 VqeypZFTVidAAcY3PB9/ANQ9c6LH0jmc5gZZyRDhbp+7TYKrOwKIPH2rQcydz/99K9W/tlxHFyU
 E3yRRuBvkqEHr3HSpQlwwvQ==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

Drop the HPD handling logic from the USBDP PHY. The registers involved
require the display controller power domain being enabled and thus the
HPD signal should be handled by the displayport controller itself.
Apart from that the HPD handling as it is done here is incorrect and
misses hotplug events happening after the USB-C connector (e.g. when
a USB-C to HDMI adapter is involved and the HDMI cable is replugged).

Proper USB-C DP HPD support requires some restructuring of the DP
controller driver, which will happen independent of this patch. The
mainline kernel does not yet support USB-C DP AltMode on RK3588 and
RK3576, so it is fine to drop this code without adding the counterpart
in the DRM in an atomic change.

Tested-by: Igor Paunovic <royalnet026@gmail.com> # Orange Pi 5 Plus
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 85 ++++---------------------------
 1 file changed, 9 insertions(+), 76 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index fa8324879a97..03a276c08fa8 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -127,7 +127,6 @@ struct rk_udphy_grf_cfg {
 
 struct rk_udphy_vogrf_cfg {
 	/* vo-grf */
-	struct rk_udphy_grf_reg hpd_trigger;
 	u32 dp_lane_reg;
 };
 
@@ -185,14 +184,11 @@ struct rk_udphy {
 	u32 dp_lane_sel[4];
 	u32 dp_aux_dout_sel;
 	u32 dp_aux_din_sel;
-	bool dp_sink_hpd_sel;
-	bool dp_sink_hpd_cfg;
 	unsigned int link_rate;
 	unsigned int lanes;
 	u8 bw;
 	int id;
 
-	bool dp_in_use;
 	int dp_lanes;
 
 	/* PHY const config */
@@ -576,19 +572,6 @@ static void rk_udphy_dp_lane_enable(struct rk_udphy *udphy, int dp_lanes)
 				   CMN_DP_CMN_RSTN, FIELD_PREP(CMN_DP_CMN_RSTN, 0x0));
 }
 
-static void rk_udphy_dp_hpd_event_trigger(struct rk_udphy *udphy, bool hpd)
-{
-	const struct rk_udphy_cfg *cfg = udphy->cfgs;
-
-	udphy->dp_sink_hpd_sel = true;
-	udphy->dp_sink_hpd_cfg = hpd;
-
-	if (!udphy->dp_in_use)
-		return;
-
-	rk_udphy_grfreg_write(udphy->vogrf, &cfg->vogrfcfg[udphy->id].hpd_trigger, hpd);
-}
-
 static void rk_udphy_mode_set(struct rk_udphy *udphy, u8 mode)
 {
 	if (udphy->mode == mode)
@@ -999,29 +982,6 @@ static void rk_udphy_power_off(struct rk_udphy *udphy, u8 mode)
 		rk_udphy_disable(udphy);
 }
 
-static int rk_udphy_dp_phy_init(struct phy *phy)
-{
-	struct rk_udphy *udphy = phy_get_drvdata(phy);
-
-	mutex_lock(&udphy->mutex);
-
-	udphy->dp_in_use = true;
-
-	mutex_unlock(&udphy->mutex);
-
-	return 0;
-}
-
-static int rk_udphy_dp_phy_exit(struct phy *phy)
-{
-	struct rk_udphy *udphy = phy_get_drvdata(phy);
-
-	mutex_lock(&udphy->mutex);
-	udphy->dp_in_use = false;
-	mutex_unlock(&udphy->mutex);
-	return 0;
-}
-
 static int rk_udphy_dp_phy_power_on(struct phy *phy)
 {
 	struct rk_udphy *udphy = phy_get_drvdata(phy);
@@ -1253,8 +1213,6 @@ static int rk_udphy_dp_phy_configure(struct phy *phy,
 }
 
 static const struct phy_ops rk_udphy_dp_phy_ops = {
-	.init		= rk_udphy_dp_phy_init,
-	.exit		= rk_udphy_dp_phy_exit,
 	.power_on	= rk_udphy_dp_phy_power_on,
 	.power_off	= rk_udphy_dp_phy_power_off,
 	.configure	= rk_udphy_dp_phy_configure,
@@ -1308,6 +1266,14 @@ static int rk_udphy_typec_mux_set(struct typec_mux_dev *mux,
 	struct rk_udphy *udphy = typec_mux_get_drvdata(mux);
 	u8 mode;
 
+	/*
+	 * Ignore mux events not involving DP AltMode, because
+	 * the mode field is being reused, e.g. state->mode == 4
+	 * could be either TYPEC_MODE_USB4 or TYPEC_DP_STATE_C.
+	 */
+	if (!state->alt || state->alt->svid != USB_TYPEC_DP_SID)
+		return 0;
+
 	mutex_lock(&udphy->mutex);
 
 	switch (state->mode) {
@@ -1339,22 +1305,7 @@ static int rk_udphy_typec_mux_set(struct typec_mux_dev *mux,
 		break;
 	}
 
-	if (state->alt && state->alt->svid == USB_TYPEC_DP_SID) {
-		struct typec_displayport_data *data = state->data;
-
-		if (!data) {
-			rk_udphy_dp_hpd_event_trigger(udphy, false);
-		} else if (data->status & DP_STATUS_IRQ_HPD) {
-			rk_udphy_dp_hpd_event_trigger(udphy, false);
-			usleep_range(750, 800);
-			rk_udphy_dp_hpd_event_trigger(udphy, true);
-		} else if (data->status & DP_STATUS_HPD_STATE) {
-			rk_udphy_mode_set(udphy, mode);
-			rk_udphy_dp_hpd_event_trigger(udphy, true);
-		} else {
-			rk_udphy_dp_hpd_event_trigger(udphy, false);
-		}
-	}
+	rk_udphy_mode_set(udphy, mode);
 
 	mutex_unlock(&udphy->mutex);
 	return 0;
@@ -1509,20 +1460,6 @@ static int rk_udphy_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int __maybe_unused rk_udphy_resume(struct device *dev)
-{
-	struct rk_udphy *udphy = dev_get_drvdata(dev);
-
-	if (udphy->dp_sink_hpd_sel)
-		rk_udphy_dp_hpd_event_trigger(udphy, udphy->dp_sink_hpd_cfg);
-
-	return 0;
-}
-
-static const struct dev_pm_ops rk_udphy_pm_ops = {
-	SET_LATE_SYSTEM_SLEEP_PM_OPS(NULL, rk_udphy_resume)
-};
-
 static const char * const rk_udphy_rst_list[] = {
 	"init", "cmn", "lane", "pcs_apb", "pma_apb"
 };
@@ -1546,7 +1483,6 @@ static const struct rk_udphy_cfg rk3576_udphy_cfgs = {
 	},
 	.vogrfcfg = {
 		{
-			.hpd_trigger	= RK_UDPHY_GEN_GRF_REG(0x0000, 11, 10, 1, 3),
 			.dp_lane_reg    = 0x0000,
 		},
 	},
@@ -1587,11 +1523,9 @@ static const struct rk_udphy_cfg rk3588_udphy_cfgs = {
 	},
 	.vogrfcfg = {
 		{
-			.hpd_trigger	= RK_UDPHY_GEN_GRF_REG(0x0000, 11, 10, 1, 3),
 			.dp_lane_reg	= 0x0000,
 		},
 		{
-			.hpd_trigger	= RK_UDPHY_GEN_GRF_REG(0x0008, 11, 10, 1, 3),
 			.dp_lane_reg	= 0x0008,
 		},
 	},
@@ -1627,7 +1561,6 @@ static struct platform_driver rk_udphy_driver = {
 	.driver		= {
 		.name	= "rockchip-usbdp-phy",
 		.of_match_table = rk_udphy_dt_match,
-		.pm = &rk_udphy_pm_ops,
 	},
 };
 module_platform_driver(rk_udphy_driver);

-- 
2.53.0

