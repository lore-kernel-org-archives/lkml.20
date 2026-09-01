Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 879B644A3F4
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 19:57:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788292648; cv=none; b=HdOevfwOO6hD3oiTb/qwCQ1ZNe0N09eUMtwSoIf+e+R2VkLQAAbjFPy/KkvVPRYAg78GDmWvVitIzG1XnvhMRrdd/IO8IAJxoZ/e59G6TnB1hVZ4x0jvtxtUWYj6+ESr0u24SQ0K5jZheuClBcY31aHpDMxz6INyp7Jj2JH4sug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788292648; c=relaxed/simple;
	bh=4lP0oLI8PNKCXZUuWv4Wfm8oJux9jtJXdUCFqHxCj9c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cAlCRt7A9xF4G4sTaen5cfoNXYQu+fPEtiPxLrEdPpKfsjmfqekAQR+vP3aGVw3HVLWKeuIeFzp1T1oJdta6umeWk3DBCz8XK0rfe+PAiFs07BhNGCdcPBnVENHVmbzz13LfP9sV5LzkUFGnE9AT/GC78Ue+oDKUtnYruk0HGT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=VD77AgkL; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="VD77AgkL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1788292644;
	bh=4lP0oLI8PNKCXZUuWv4Wfm8oJux9jtJXdUCFqHxCj9c=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=VD77AgkLO3N+rBCDKILwJT5zdr3N8Kx5DlgfAo7s3wk6Xms4WM1LhZGcHKaOfVpJ4
	 tejKkjfkD7zMWNSC97ZIQIUuaL1+ka3VAKhtKmSfy8oVnzpqIG91KAy0SwyBpWnKqI
	 doEmiDBUYUPObmPTSOgPDx0N+phyX6BXPXpwXaFJRiEyxQRbjwUo1eLEJHakZu0+pi
	 WleV4dBV3lZP+2u59VpYuIR+AoMcbDsecRvUDflIFZEYjcX8wwM6Qw/GlP/sQEzorU
	 ZkuZev4lxYmYNaABksOkPao2M/FHrQ10JvDlxJqQsrkFB6k/sHgVHQAvAkH6suCW3z
	 ki+k26F+s0T3g==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 98ACD17E0934;
	Tue, 01 Sep 2026 21:57:24 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Tue, 01 Sep 2026 22:55:14 +0300
Subject: [PATCH v2 2/3] phy: rockchip: samsung-hdptx: Handle PHY config
 after module reload
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260901-hdptx-ffe-v2-2-3a5922c76fc5@collabora.com>
References: <20260901-hdptx-ffe-v2-0-3a5922c76fc5@collabora.com>
In-Reply-To: <20260901-hdptx-ffe-v2-0-3a5922c76fc5@collabora.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>
Cc: kernel@collabora.com, linux-phy@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org
X-Mailer: b4 0.15.2

The pll_config_dirty mechanism introduced in commit aec3e4ce25da ("phy:
rockchip: samsung-hdptx: Handle uncommitted PHY config changes")
invalidates the clock rate in determine_rate() by resetting req->rate to
zero, ensuring CCF will invoke set_rate() to program pending PLL
configuration changes into hardware.

However, after a module reload cycle the PHY PLL clock gets
re-registered with CCF, which causes the framework's cached rate to also
be zero.  Setting req->rate to zero then has no effect, since CCF sees
no difference between the requested and current rates and skips calling
set_rate(), leaving the PLL unconfigured.

Address this by first computing the actual target rate from the HDMI
link configuration, and only then invalidating it when it matches the
CCF cached rate.

Fixes: aec3e4ce25da ("phy: rockchip: samsung-hdptx: Handle uncommitted PHY config changes")
Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c b/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
index 24ed0d7eb6f8..b03042ec9a84 100644
--- a/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
+++ b/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
@@ -2346,14 +2346,16 @@ static int rk_hdptx_phy_clk_determine_rate(struct clk_hw *hw,
 	 * to ensure rk_hdptx_phy_clk_set_rate() will be always invoked.
 	 * Otherwise, restrict the rate according to the PHY link setup.
 	 */
-	if (hdptx->pll_config_dirty)
-		req->rate = 0;
-	else if (hdptx->hdmi_cfg.mode == PHY_HDMI_MODE_FRL)
+
+	if (hdptx->hdmi_cfg.mode == PHY_HDMI_MODE_FRL)
 		req->rate = hdptx->hdmi_cfg.rate;
 	else
 		req->rate = DIV_ROUND_CLOSEST_ULL(hdptx->hdmi_cfg.rate * 8,
 						  hdptx->hdmi_cfg.bpc);
 
+	if (hdptx->pll_config_dirty && req->rate == clk_hw_get_rate(hw))
+		req->rate = 0;
+
 	return 0;
 }
 

-- 
2.55.0

