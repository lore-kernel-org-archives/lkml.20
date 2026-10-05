Received: from mail-pj2-f4.google.com (mail-pj2-f4.google.com [74.125.227.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 369EA392829
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 22:13:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.132
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791238386; cv=none; b=dzw+E9AQ3R+kIeb8vw7tYcLuv5+CyIhU2viQA4ZHQDG2k98ntkSrRumuOgySddpk9Xk76iYKhB9xjtJlmeCLomJXbgj55gvUWc7hgAfr2PtslHrSlvAYjbjqmQT5tTdrnytwuDLe6LvIIMX+9NXV1ON2LcJWUfsOWN/gYuwzEmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791238386; c=relaxed/simple;
	bh=kq0vt9SckJqy94uGlHWiGVuBk0MckU/fwsg6pcjJXHQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nNjbvAWEXAuCxhI9pXfGt3u3c2b5aJ9GEWzL1HcZZd5PXPZQHWDimimm1jNu7ntFder3Y2W+XH7YW1C3TpQ/PvByxQ58Q5VDRYIQ9oMQDqVobUr/T//idIDN9ojd2uhoVdXTDysxQB4OEsrcNfvSzFiQ5/7tHyfYwCunKOO+SH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lLptAn5P; arc=none smtp.client-ip=74.125.227.132
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lLptAn5P"
Received: by mail-pj2-f4.google.com with SMTP id 98e67ed59e1d1-3a81335d55aso572445a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 15:13:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791238384; x=1791843184; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8Rz7MTGiT2Oa/TzTvQEqnIct/KOrKk64RBkMgo9sxQM=;
        b=lLptAn5Pcjj9URwE1uWBtGs0NYBT07WAywcAYGcKBtkVZWt1AWdiTuB/r+hYKKAKc+
         Yezxf4ESqw28fo9vyOHz9B+QuDJXi7TVucgiPujBUTD5lnrsSzQkkmDlsw3NmsLVmi6I
         u8QXkl4NDASXHHCyigGcP3g23hXgZtpnpAgqf3ZG7hLgyqM+UfEWc5rkWVOqCzEokP+9
         yb9XroGU2UlhifOvAgOYjiOD1h7jO1m9D74Mb4yTC8F6F+gAxFzxglAo360QpjnZPFTM
         nGfEZ8H3Buq5qDi1gj6fqzvFcH6VyHfSqjd/dvrk1lvaqeGPqCUocLHGTdEpnR3AKihD
         Nt5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791238384; x=1791843184;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8Rz7MTGiT2Oa/TzTvQEqnIct/KOrKk64RBkMgo9sxQM=;
        b=LhVL/X3k9F+VSKXthQsNf9t5iZKaXx5Won9FhoqNV3Tfi0CDdSSPy3YnXvK97O7Irt
         v7Ffp7a/DKtJ/iPJu4llYL71xC/T0kGvlycHDOf0Na0pJe5v9yPNo3a0QgwP68GCZ/kj
         rqV4MM5dzXHzkoYH2o+ypgTDWvIe3U1zAvVIAIElUKWogoq0AJzMuMUyUL6gYsu4Ld4m
         uyfZMzv1lZLtcU3TbPkzKWzUVp1vxyirdZnRN6D4UAGGrZJL/E9CaM4heN1+RJry/Dze
         Z3kY6wfjRh+1bOzO1UURtffOEX0w8i9u2tTfMRbRUlzcgdFWLQWg/rEJRuZSLUXANxvx
         jBKg==
X-Forwarded-Encrypted: i=1; AKwUvBwxdeD6t4lyTyLUwlRpgHeReMtHfdKkmWWi/W70f6ldHJXWIPNuy1w9mhJMoxdgch60OV65BHdcPrzCqLk=@vger.kernel.org
X-Gm-Message-State: AFq9FYKafSVK06zWerJm59U9rixWsO+ETjF+GeqYlWKmPZZzeWf1j1EL
	fCYKr0BTE2PSzueXyeUB+CaytmCMBmNmq9k3zGQMkzftAqzo3RIAzAjKsUAG5hzjbqIwfA==
X-Gm-Gg: AYBFou3VOzklusLJQw1FUp47a8gZJ1UjRwx2X+UgBHySrkN63OaU7e5Ut7ZWY3h8PYM
	hnnl7iRf8pOpGhEk0avf7+Kd9Uj3xAGvJ11jUexPAoDA8XFi3qXa1GaLXsgNansQsKWCevy+8IY
	DNqzv3bvitB5ufnJ4esTXazJXpIyTB7wRcmomCc1JMTgEbs2xTBwVcPRYH/UvIPeRC9ZVwGIAik
	cIXqkDfx6R1LxcK8OEvM89qcHavmcc2F9YQPte7dmaI08PikXnNKeiNH78JzHnoEQJJsiKtAdhj
	FWw1kYkgiycLhLFJONx28+dB5AsAE3hjVyKBXf+9G7aMUxKrhB1ZEjuwHl2cEXqg1+Cxl2OZQi6
	eG5CSPjeuFzebwfZnFtQXcWHC7okp76p+7s+NN79krWW2pSsAd/21i0LPS6GZl3lUiK4ACmujog
	IJiSRA371Rn1fyimjkI8/HNNpc3FGVbnCz/QOAzXU6jyjC+kqv+EZA0A+6qwqrD5mFpfqw
X-Received: by 2002:a17:90b:4ac3:b0:3a0:a781:2c39 with SMTP id 98e67ed59e1d1-3a6ce3a978dmr10937659a91.7.1791238384372;
        Mon, 05 Oct 2026 15:13:04 -0700 (PDT)
Received: from server.lan ([168.138.199.194])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a8533aba95sm1719425a91.2.2026.10.05.15.12.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 15:13:03 -0700 (PDT)
From: Coia Prant <coiaprant@gmail.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Coia Prant <coiaprant@gmail.com>
Subject: [PATCH v10 2/2] phy: rockchip: naneng-combphy: add SGMII MAC selection for RK3568
Date: Tue,  6 Oct 2026 06:12:29 +0800
Message-ID: <20261005221229.1095843-3-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261005221229.1095843-1-coiaprant@gmail.com>
References: <20261005221229.1095843-1-coiaprant@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On RK3568, the SGMII interface can be routed to either GMAC0 or
GMAC1 via the GRF register pipe_sgmii_mac_sel.

Add support for this selection by introducing
the "rockchip,sgmii-mac-sel" DT property.

From the RK3568 TRM (Part1, Page 229), the PIPE_GRF_XPCS_CON0
bit 1 (pipe_sgmii_mac_sel) is defined as:

    0: SGMII routed to GMAC0
    1: SGMII routed to GMAC1

The hardware reset value is 1 (GMAC1). If the property is set to 0,
the driver routes SGMII to GMAC0; if set to 1 (or omitted), it
remains at GMAC1.

This is necessary for boards such as the Ariaboard Photonicat, which
uses the SGMII interface connected to GMAC0.

Out-of-range values are rejected by dtschema, so the driver does not
duplicate the range check.

Link: https://dl.radxa.com/rock3/docs/hw/datasheet/Rockchip%20RK3568%20TRM%20Part1%20V1.1-20210301.pdf (Page 229)
Signed-off-by: Coia Prant <coiaprant@gmail.com>
---
 drivers/phy/rockchip/phy-rockchip-naneng-combphy.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/phy/rockchip/phy-rockchip-naneng-combphy.c b/drivers/phy/rockchip/phy-rockchip-naneng-combphy.c
index 7843356a4dd47..7b867e7520064 100644
--- a/drivers/phy/rockchip/phy-rockchip-naneng-combphy.c
+++ b/drivers/phy/rockchip/phy-rockchip-naneng-combphy.c
@@ -186,6 +186,7 @@ struct rockchip_combphy_grfcfg {
 	struct combphy_reg pipe_xpcs_phy_ready;
 	struct combphy_reg pipe_pcie1l0_sel;
 	struct combphy_reg pipe_pcie1l1_sel;
+	struct combphy_reg pipe_sgmii_mac_sel;
 	struct combphy_reg u3otg0_port_en;
 	struct combphy_reg u3otg1_port_en;
 };
@@ -212,6 +213,7 @@ struct rockchip_combphy_priv {
 	bool enable_ssc;
 	bool ext_refclk;
 	struct clk *refclk;
+	u32 sgmii_mac_sel;
 };
 
 static void rockchip_combphy_updatel(struct rockchip_combphy_priv *priv,
@@ -375,6 +377,9 @@ static int rockchip_combphy_parse_dt(struct device *dev, struct rockchip_combphy
 
 	priv->ext_refclk = device_property_present(dev, "rockchip,ext-refclk");
 
+	priv->sgmii_mac_sel = 1;
+	device_property_read_u32(dev, "rockchip,sgmii-mac-sel", &priv->sgmii_mac_sel);
+
 	priv->phy_rst = devm_reset_control_get_exclusive(dev, "phy");
 	/* fallback to old behaviour */
 	if (PTR_ERR(priv->phy_rst) == -ENOENT)
@@ -873,6 +878,8 @@ static int rk3568_combphy_cfg(struct rockchip_combphy_priv *priv)
 		break;
 
 	case PHY_TYPE_SGMII:
+		rockchip_combphy_param_write(priv->pipe_grf, &cfg->pipe_sgmii_mac_sel,
+					     priv->sgmii_mac_sel > 0);
 		rockchip_combphy_param_write(priv->pipe_grf, &cfg->pipe_xpcs_phy_ready, true);
 		rockchip_combphy_param_write(priv->phy_grf, &cfg->pipe_phymode_sel, true);
 		rockchip_combphy_param_write(priv->phy_grf, &cfg->pipe_sel_qsgmii, true);
@@ -984,6 +991,7 @@ static const struct rockchip_combphy_grfcfg rk3568_combphy_grfcfgs = {
 	.con3_for_sata		= { 0x000c, 15, 0, 0x00, 0x4407 },
 	/* pipe-grf */
 	.pipe_con0_for_sata	= { 0x0000, 15, 0, 0x00, 0x2220 },
+	.pipe_sgmii_mac_sel	= { 0x0040, 1, 1, 0x00, 0x01 },
 	.pipe_xpcs_phy_ready	= { 0x0040, 2, 2, 0x00, 0x01 },
 	.u3otg0_port_en		= { 0x0104, 15, 0, 0x0181, 0x1100 },
 	.u3otg1_port_en		= { 0x0144, 15, 0, 0x0181, 0x1100 },
-- 
2.47.3

