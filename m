Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.126.93.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792465784;
	b=b0Smq/5qZpsbnwSRpXwrTqnrMdjlZrChrFpLoeKA4gjXGHPZ/atrrR9Z+afIffGpc1+2
	 o5Mm7WjrK+HloVhaadCMariR1p6ZvldxJyiL3EOmpB5j6gExNgM+IqzhdVIGjgETPYDCH
	 ODYwpiB0/JDBsRuW6uxfg/I2PxOwYoaWpDO2+rbiBAnBkFW8hCMbr/97HLK3ZUgTIoUR5
	 9drEK2CzBHYNvTwIpnhF7+WI0/ZqeYHNf5mbPe+CDOwy8PtiMPYo1RTZ7SGtObqwFlBzc
	 wty+rxd3rbR5smsq5KgAqkN/hQuBESiyy4YSEoXaggbfaUmomTUxuxWBTxux8EA3IuA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792465784;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 X-HM-Tid:X-HM-MType:X-HM-Spam-Status:DKIM-Signature;
	bh=PIme3hcZlC53RfvT2IEjzq2swieDeYbsRW7Jr3b/EnY=;
	b=PQZLjSwrCANQGGbWGjNfjU68R1eN75ZPkcOZSgLhIKsGPCm+l91G6vtSlgc1h5ow85+1
	 CQe9x8XeiTKpXEHV92FMFygm9Z5pdOIB2cfedqFAFKFvw6qdHC0WH5D4/e52Ldqq22OxS
	 484uX6iiz8ZIvwOfh5zRQq10x/m9iBPlfgPNUfEJJAPUUCzbUKCkZPjl6UJbZc7uhyJ/Y
	 zLYf5DCMztQ/kNq5tLrUIRYWTIjxp0eo5iDCR2tmp5b4VCXQtfcT7JL4uMc1slzWLkNLC
	 XfjlGvB38yZIGJHtVPZQV/GEDOykzLB0eBt3x2CgHmjm8tYs5oVDo5tzFkI67CHuC4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rock-chips.com;
	spf=pass smtp.mailfrom=rock-chips.com;
	dkim=pass header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b=L0GRG5h6;
	arc=none smtp.remote-ip=103.126.93.42
Received: from mail-m9342.xmail.ntesmail.com (mail-m9342.xmail.ntesmail.com [103.126.93.42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 579A160A3816;
	Tue, 20 Oct 2026 03:09:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 579A160A3816
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b=L0GRG5h6
Received: from zyb-HP-ProDesk-680-G2-MT.. (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 51a4ceebc;
	Tue, 20 Oct 2026 11:09:33 +0800 (GMT+08:00)
From: Damon Ding <damon.ding@rock-chips.com>
To: Sandy Huang <hjc@rock-chips.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Andy Yan <andy.yan@rock-chips.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Robert Foss <rfoss@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Dave Jones <s.dave.jones@gmail.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	dri-devel@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org,
	Damon Ding <damon.ding@rock-chips.com>
Subject: [PATCH v3 5/6] drm/rockchip: analogix_dp: Add support for RK3568
Date: Tue, 20 Oct 2026 11:09:15 +0800
Message-Id: <20261020030916.3223833-6-damon.ding@rock-chips.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261020030916.3223833-1-damon.ding@rock-chips.com>
References: <20261020030916.3223833-1-damon.ding@rock-chips.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa15749229303a8kunmfd20f05334c78f
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkaTkpJVkwaTx9JGhlOQ0tJT1YVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSE
	pKQk1VSktLVUpCWQY+
DKIM-Signature: a=rsa-sha256;
	b=L0GRG5h6UBqPdZoOzncwl9bjfmfKLEpR1+D+v0ATg2rRCRzOYAsoMajwTwPFcDze9GhuUM8Cfm3eVmf/8jkO0WdlJTL/KbOZVUkRxJZVN7GHDvUcSnacoAgcs6xPEvd6+70VvHa7gY1RKFmKhEJhy9fZyT+2nED3ieHLyNipHs0=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=PIme3hcZlC53RfvT2IEjzq2swieDeYbsRW7Jr3b/EnY=;
	h=date:mime-version:subject:message-id:from;

The RK3568 eDP controller does not require any GRF configurations,
so make the "rockchip,grf" property optional.  Also enable the
optional avdd-0v9 and avdd-1v8 supplies which power the eDP PHY.

Add the "rockchip,rk3568-edp" compatible along with its chip data;
the register base in the chip data is used to match the platform
device memory resource.

Signed-off-by: Damon Ding <damon.ding@rock-chips.com>

---

Changes in v2:
- Fail the probe when the chip data requires GRF configurations while
  the "rockchip,grf" property is missing.(Sashiko)
---
 .../gpu/drm/rockchip/analogix_dp-rockchip.c   | 24 ++++++++++++++++++-
 1 file changed, 23 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
index ccdd4b9ecdb8..38c78360842f 100644
--- a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
+++ b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
@@ -320,12 +320,17 @@ static int rockchip_dp_of_probe(struct rockchip_dp_device *dp)
 	struct device *dev = dp->dev;
 	struct device_node *np = dev->of_node;
 	struct clk *clk;
+	int ret;
 
-	dp->grf = syscon_regmap_lookup_by_phandle(np, "rockchip,grf");
+	dp->grf = syscon_regmap_lookup_by_phandle_optional(np, "rockchip,grf");
 	if (IS_ERR(dp->grf))
 		return dev_err_probe(dev, PTR_ERR(dp->grf),
 				     "failed to get rockchip,grf property\n");
 
+	if (!dp->grf && (dp->data->lcdc_sel.valid || dp->data->edp_mode.valid))
+		return dev_err_probe(dev, -EINVAL,
+				     "missing the required rockchip,grf property\n");
+
 	dp->grfclk = devm_clk_get_optional(dev, "grf");
 	if (IS_ERR(dp->grfclk))
 		return dev_err_probe(dev, PTR_ERR(dp->grfclk),
@@ -351,6 +356,14 @@ static int rockchip_dp_of_probe(struct rockchip_dp_device *dp)
 		return dev_err_probe(dev, PTR_ERR(dp->apbrst),
 				     "failed to get apb reset control\n");
 
+	ret = devm_regulator_get_enable_optional(dev, "avdd-0v9");
+	if (ret && ret != -ENODEV)
+		return dev_err_probe(dev, ret, "failed to enable avdd-0v9\n");
+
+	ret = devm_regulator_get_enable_optional(dev, "avdd-1v8");
+	if (ret && ret != -ENODEV)
+		return dev_err_probe(dev, ret, "failed to enable avdd-1v8\n");
+
 	return 0;
 }
 
@@ -530,6 +543,14 @@ static const struct rockchip_dp_chip_data rk3288_dp[] = {
 	{ /* sentinel */ }
 };
 
+static const struct rockchip_dp_chip_data rk3568_edp[] = {
+	{
+		.chip_type = RK3568_EDP,
+		.reg = 0xfe0c0000,
+	},
+	{ /* sentinel */ }
+};
+
 static const struct rockchip_dp_chip_data rk3576_edp[] = {
 	{
 		.chip_type = RK3576_EDP,
@@ -555,6 +576,7 @@ static const struct rockchip_dp_chip_data rk3588_edp[] = {
 static const struct of_device_id rockchip_dp_dt_ids[] = {
 	{.compatible = "rockchip,rk3288-dp", .data = &rk3288_dp },
 	{.compatible = "rockchip,rk3399-edp", .data = &rk3399_edp },
+	{.compatible = "rockchip,rk3568-edp", .data = &rk3568_edp },
 	{.compatible = "rockchip,rk3576-edp", .data = &rk3576_edp },
 	{.compatible = "rockchip,rk3588-edp", .data = &rk3588_edp },
 	{}
-- 
2.34.1

