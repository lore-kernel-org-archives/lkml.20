Received: from smtpbguseast1.qq.com (smtpbguseast1.qq.com [54.204.34.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9176266B72
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 01:34:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.204.34.129
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789349697; cv=none; b=PLvkOoU7qazR+N+bt/KWGmUkPxWAETmeBamXMUXZPwSViL15WJwIsf4Sr6ogppO1/v9lQa/hIczAjwzssvN5HESZCX3cR9E8x5i/MSONemweeUCNBXczAG3FCBGX2eRIf9B/9Jf/Sq62ZQmxH6Fr/xC8rjqxNd29NQZrCc289A4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789349697; c=relaxed/simple;
	bh=Ffd900KJHpTvxtNoi18pAZ+vvWpl6BZ204optPEhJuQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=S28sFHcDOlm4kcrzbju+hv0PCht1KWwUHxog/atGye37uypV7woyTTfapEImfszmwgepkddJzq4n0Y9KwpD715T+b9+t8q2vfi/2fnK88L1grgCePjfikXdMcjC9UZbnRPr166Zf+0hSCiGO1X46elV6Td2/28KWJgKyMtDKI/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=airkyi.com; spf=pass smtp.mailfrom=airkyi.com; dkim=pass (1024-bit key) header.d=airkyi.com header.i=@airkyi.com header.b=kDKdItZZ; arc=none smtp.client-ip=54.204.34.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=airkyi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=airkyi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=airkyi.com header.i=@airkyi.com header.b="kDKdItZZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
	s=altu2504; t=1789349633;
	bh=bLhZHimfeAemx102sKi3S3oU0Nrf9TQfYCxAQtyW+4U=;
	h=From:To:Subject:Date:Message-Id;
	b=kDKdItZZzKPRq9w3NtMmR1/D0+JwwUafwgiHJhpIu6MxZNlTYRYscK0xoVDwfBuIU
	 jn5UMec3x4IJ6jvW77prHIC6Jy6hT47aITM00jogw9cG37BuboVOtiSiqtFrvNynkL
	 0O4WkQk6awgmiBPJ2baiLoosD17cuNMd/jbH5ZxQ=
X-QQ-mid: esmtpsz11t1789349631t83d0eebd
X-QQ-Originating-IP: UDkduqCMmPjnwTw37M0pn7cnoB9fgqMlUFCVtwTX2S4=
Received: from DESKTOP-8BT1A2O.localdomain ( [61.154.14.86])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 14 Sep 2026 09:33:47 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 6289182345882749368
From: Chaoyi Chen <kernel@airkyi.com>
To: Sandy Huang <hjc@rock-chips.com>,
	=?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
	Andy Yan <andy.yan@rock-chips.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Chaoyi Chen <chaoyi.chen@rock-chips.com>
Subject: [PATCH v5 1/3] drm/rockchip: dsi: Add maximum per lane bit rate calculation
Date: Mon, 14 Sep 2026 09:33:29 +0800
Message-Id: <20260914013331.108-2-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20260914013331.108-1-kernel@airkyi.com>
References: <20260914013331.108-1-kernel@airkyi.com>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:airkyi.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: M3ziZXKDk+iOHFRGvweTdBwdFQUSbUWuTT0Y8fC3DVtF6xFLtZK7bMi3
	1DSXGmn7DXxyiBfjQ/BK7W47UNXyAjiHrsGzGF6PdgubhG16ii/+uFEYbIAj0R7edDHx/i1
	HX87i5WbgEVhWXgiWGkcXZhBTajDpO6V6u70w/RFygweMiJnN+S3g16nGXXnCOMSfHZNbnG
	EUq5tG12EbaIOJL/TuNayzC5JkS9Tuxn4KAWytdMboxQAOfwiVajp32lSuQ3KxYrDuPmUtf
	bdeaZUP+69qHiYadNt953vNGJkc+4iELiHwWVV1t40LMnnq1MIAPbvzW0rWbSdXLu1jkS2S
	uIDMQWhmU+1iakGQm5CuwubQeAfS7avG/FswsP6+qmr6RBd15ZikfeqfL6NR3c+KxU3bAlI
	M8it2GqN1jNKVLH3XMZEOaRzPAEFv8monWdTQG+B6yX5+gABCyKwrT2PnoOtEmIDlvykQmm
	3/CLYCBx2xqxWVKqsK/Y2CBWJER4P+7Znzb8cqOJU/zcYzULyGXsyOkdHjZxyU1feDnK4HO
	MzLDLJI+xqGVHVYqahjOk1igJOU0y0l83yyL/BAT5MOc00rIGIJKYue/KIFM5DdHroXN4WT
	yPRvzm+YjRPY40B3fvG28rt3TDaqmFHvisQWS5OjB9yE9ic3TSQ4Ck0sXQfg4rQ8KILGXe9
	0k+/oAZCHbCejszxDtSqE5nGTTQt5kXioztLoludUrJY7IQwFWQhwOauDGHRT5by2F0cXdz
	1bzzaXR9iT+e0pTcBDbP2qYsPVU3DC92GVtO7hACmA6WTCkthV6Z/1w3qZ4WHMx3+0E3UiO
	v3PuI0lxrguWApRZ9ftAcxtYX+IeMzPaHofBQIYsGEKWbT4jTZIBEhHnFFuC6ceS/X/z4R5
	ZG2xD8vEPsV92e8obsmsKjzFU2iz9DmmbKLbZ1CJ+H43p/eOmfUKXvQrHXUh1xriXjIQrIH
	ER2xS2VO+beCUnC21T7CtIv7rrAp0OchX35dAGqeyPMSBlge3hX6OH8gk6HdqRdmMZTscOg
	31AsZ++A==
X-QQ-XMRINFO: MPJ6Tf5t3I/ylTmHUqvI8+Wpn+Gzalws3A==
X-QQ-RECHKSPAM: 0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

From: Chaoyi Chen <chaoyi.chen@rock-chips.com>

Different chips have varying support for the maximum bit rate per lane.

Add calculation for the maximum per lane bit rate for various chip
platforms.

Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
---
Changes in v5:
- Change the upper bound check for target_mbps from < to <= (sashiko).

(no changes since v4)

Changes in v3:
- Rebase to Linux v7.2

Changes in v2:
- Fix the unit conversion for max_mbps.
- Split the lane rate calculation into a separate patch.
---
 drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c b/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
index 3547d91b25d3..6a476c2c1303 100644
--- a/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
+++ b/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
@@ -268,6 +268,7 @@ struct rockchip_dw_dsi_chip_data {
 
 	unsigned int flags;
 	unsigned int max_data_lanes;
+	unsigned long max_bit_rate_per_lane;
 };
 
 struct dw_mipi_dsi_rockchip {
@@ -565,7 +566,7 @@ dw_mipi_dsi_get_lane_mbps(void *priv_data, const struct drm_display_mode *mode,
 	int bpp;
 	unsigned long mpclk, tmp;
 	unsigned int target_mbps = 1000;
-	unsigned int max_mbps = dppa_map[ARRAY_SIZE(dppa_map) - 1].max_mbps;
+	unsigned int max_mbps;
 	unsigned long best_freq = 0;
 	unsigned long fvco_min, fvco_max, fin, fout;
 	unsigned int min_prediv, max_prediv;
@@ -573,6 +574,7 @@ dw_mipi_dsi_get_lane_mbps(void *priv_data, const struct drm_display_mode *mode,
 	unsigned long _fbdiv, best_fbdiv;
 	unsigned long min_delta = ULONG_MAX;
 
+	max_mbps = dsi->cdata->max_bit_rate_per_lane / USEC_PER_SEC;
 	dsi->format = format;
 	bpp = mipi_dsi_pixel_format_to_bpp(dsi->format);
 	if (bpp < 0) {
@@ -586,7 +588,7 @@ dw_mipi_dsi_get_lane_mbps(void *priv_data, const struct drm_display_mode *mode,
 	if (mpclk) {
 		/* take 1 / 0.8, since mbps must big than bandwidth of RGB */
 		tmp = mpclk * (bpp / lanes) * 10 / 8;
-		if (tmp < max_mbps)
+		if (tmp <= max_mbps)
 			target_mbps = tmp;
 		else
 			DRM_DEV_ERROR(dsi->dev,
@@ -1503,6 +1505,7 @@ static const struct rockchip_dw_dsi_chip_data px30_chip_data[] = {
 						PX30_DSI_FORCETXSTOPMODE), 0),
 
 		.max_data_lanes = 4,
+		.max_bit_rate_per_lane = 1000000000UL,
 	},
 	{ /* sentinel */ }
 };
@@ -1515,6 +1518,7 @@ static const struct rockchip_dw_dsi_chip_data rk3128_chip_data[] = {
 						RK3128_DSI_FORCERXMODE |
 						RK3128_DSI_FORCETXSTOPMODE), 0),
 		.max_data_lanes = 4,
+		.max_bit_rate_per_lane = 1000000000UL,
 	},
 	{ /* sentinel */ }
 };
@@ -1527,6 +1531,7 @@ static const struct rockchip_dw_dsi_chip_data rk3288_chip_data[] = {
 		.lcdsel_lit = FIELD_PREP_WM16_CONST(RK3288_DSI0_LCDC_SEL, 1),
 
 		.max_data_lanes = 4,
+		.max_bit_rate_per_lane = 1500000000UL,
 	},
 	{
 		.reg = 0xff964000,
@@ -1535,6 +1540,7 @@ static const struct rockchip_dw_dsi_chip_data rk3288_chip_data[] = {
 		.lcdsel_lit = FIELD_PREP_WM16_CONST(RK3288_DSI1_LCDC_SEL, 1),
 
 		.max_data_lanes = 4,
+		.max_bit_rate_per_lane = 1500000000UL,
 	},
 	{ /* sentinel */ }
 };
@@ -1547,6 +1553,7 @@ static const struct rockchip_dw_dsi_chip_data rk3368_chip_data[] = {
 						RK3368_DSI_FORCETXSTOPMODE |
 						RK3368_DSI_FORCERXMODE), 0),
 		.max_data_lanes = 4,
+		.max_bit_rate_per_lane = 1500000000UL,
 	},
 	{ /* sentinel */ }
 };
@@ -1634,6 +1641,7 @@ static const struct rockchip_dw_dsi_chip_data rk3399_chip_data[] = {
 
 		.flags = DW_MIPI_NEEDS_PHY_CFG_CLK | DW_MIPI_NEEDS_GRF_CLK,
 		.max_data_lanes = 4,
+		.max_bit_rate_per_lane = 1500000000UL,
 	},
 	{
 		.reg = 0xff968000,
@@ -1658,6 +1666,7 @@ static const struct rockchip_dw_dsi_chip_data rk3399_chip_data[] = {
 
 		.flags = DW_MIPI_NEEDS_PHY_CFG_CLK | DW_MIPI_NEEDS_GRF_CLK,
 		.max_data_lanes = 4,
+		.max_bit_rate_per_lane = 1500000000UL,
 
 		.dphy_rx_init = rk3399_dphy_tx1rx1_init,
 		.dphy_rx_power_on = rk3399_dphy_tx1rx1_power_on,
@@ -1674,6 +1683,7 @@ static const struct rockchip_dw_dsi_chip_data rk3506_chip_data[] = {
 			     FIELD_PREP_WM16_CONST(RK3506_DSI_FORCERXMODE, 0) |
 			     FIELD_PREP_WM16_CONST(RK3506_DSI_FORCETXSTOPMODE, 0)),
 		.max_data_lanes = 2,
+		.max_bit_rate_per_lane = 1500000000UL,
 	},
 	{ /* sentinel */ }
 };
@@ -1687,6 +1697,7 @@ static const struct rockchip_dw_dsi_chip_data rk3568_chip_data[] = {
 			     FIELD_PREP_WM16_CONST(RK3568_DSI0_TURNDISABLE, 0) |
 			     FIELD_PREP_WM16_CONST(RK3568_DSI0_FORCERXMODE, 0)),
 		.max_data_lanes = 4,
+		.max_bit_rate_per_lane = 1200000000UL,
 	},
 	{
 		.reg = 0xfe070000,
@@ -1696,6 +1707,7 @@ static const struct rockchip_dw_dsi_chip_data rk3568_chip_data[] = {
 			     FIELD_PREP_WM16_CONST(RK3568_DSI1_TURNDISABLE, 0) |
 			     FIELD_PREP_WM16_CONST(RK3568_DSI1_FORCERXMODE, 0)),
 		.max_data_lanes = 4,
+		.max_bit_rate_per_lane = 1200000000UL,
 	},
 	{ /* sentinel */ }
 };
@@ -1708,6 +1720,7 @@ static const struct rockchip_dw_dsi_chip_data rv1126_chip_data[] = {
 			     FIELD_PREP_WM16_CONST(RV1126_DSI_FORCERXMODE, 0) |
 			     FIELD_PREP_WM16_CONST(RV1126_DSI_FORCETXSTOPMODE, 0)),
 		.max_data_lanes = 4,
+		.max_bit_rate_per_lane = 1000000000UL,
 	},
 	{ /* sentinel */ }
 };
-- 
2.53.0

