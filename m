Received: from mail-pz2-f9.google.com (mail-pz2-f9.google.com [74.125.228.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA6DE4A092B
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 16:28:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791304111; cv=none; b=EOVJpYFXOmWKCDLRMvdbYKjZpyAtWr6efW35zwycxEul0pS8EHY6/rk1fcDLCow0xNscIcXKwbmmTPqx8Qg7+QZJaNiA4D4u37dAWmgzpJGcYjWSJ6Aizdiwq90ekV0pTutNXbK+IY5TgK9S8SlmH+MPGtC0hbNFsoiJ8DHtoXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791304111; c=relaxed/simple;
	bh=KC4pnJETRVb2so59kpli9CAMHz7ARuXXj2dpj3aHMAg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oo81euaotoztacCUfbSlO+aPJeZsbGaWaQ3g00aZWCCGFTlAajRD56GhynXmGF0M1VvtauIblU3pcjjoQzietBxLKuRWP2DpIVg7llSai1rKpL1q95/F0KNexYW19/H6tzZ+S51jBZLmKKirKSj5LGRUHztz9lseKUJAVXxZ9HM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rjhyt4yf; arc=none smtp.client-ip=74.125.228.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rjhyt4yf"
Received: by mail-pz2-f9.google.com with SMTP id 41be03b00d2f7-cc1631a57d2so425981a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 09:28:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791304109; x=1791908909; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C5GHjzqrk28FffPt6wY8dDf5xP519k7dLJfQtCczhyU=;
        b=rjhyt4yfF+r3Sz2j5yIcgGGSLulHcmRI/NVV++dr3YsxOl5sAcJnSQ5UIRnpASOmJe
         WSwjluMoJtGUWTeHNMBD9bZFkPBsSBZsZMBqS83EL7tmCWxrOXbl2WSnTO0ZeqsJqbtN
         GWUNE5y2cOhP+L6FYt4X3a9BX7cVpWK6VWCDZ8YZoym7NR2hgXJGhTn/pnQHQgorm8FG
         8SV5s1epcxm/HXZqsozZdHljD9zovkeGIFRBkmcRZsrtxBVwBEusWPbNlSgcHxu2DYvN
         prX+/sFzRYODsdaMqgmnlEUaUQiXepRUyy+5BEVg8YA7gviQQ55I/NduVOJScp3tc+qt
         fFZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791304109; x=1791908909;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=C5GHjzqrk28FffPt6wY8dDf5xP519k7dLJfQtCczhyU=;
        b=kS7g8aWi2PazGh7KQqrG6wHrGwDFz/dGjxnSQXprUancTfB9MQRl0FNY4kqqHZ1rd0
         mf3m9A6Dld34y2wg9I2WJu/ENR2aPkWFMgJhzCqfO7eucoAfeLD1kfB5JbvZlog0GceP
         iq3YoBW4lPWhDmybhHwtqDORvDJHCHEnFCatgC494BrULJJ9wudmkZ0jJiDpI2d5BGvd
         uFyuS+o2faXP37lHS+zGk7tZJkl7piZ3sJX8vJz4BvGnwpVDDVHetJ0UxWKYUJ3SHFY/
         OkBXd0OHMawuVlF9tC69Z4R9EANYLnc5OiLzjTIZyLmDpf9PaVs+dYgUKQWL52N9euPG
         C7HQ==
X-Forwarded-Encrypted: i=1; AKwUvBxhV9EpWjzBHZiUS+S3z3H9rBV/FEXDjVIgeYmn3VBCeD42O4GmjM2hV0Y1Ehn09IWDlrSQxe3QtjTh9jU=@vger.kernel.org
X-Gm-Message-State: AFuF++nRSZ7+c/6RWz9HDX63LRtNdqFkzulTyiKI8DQ3c0XZ6UxN4eqf
	AZefb8TcBbBaoktMKUYd52MLSvNIn4e46IYpqww7oVf30Mw82NGV68ae
X-Gm-Gg: AYBFou1ebd9+sqRnwSm5xCm86PqiLPQZgwVkE+K/Y1LSK9xekVpgPj8CP8oKQk4p6FZ
	0RRVALKamRiH78zAsdEAv3a/zhsJVr6WHpA4vuUM2JCvBhiS6ZIPeZypenW7wOWxvW5zXlmoL1H
	jUef+ElNGJRJ7aXXRmU5EaJufGmW3dzeO6jqwntldFSev6Bfdi78j7g4jROtV4ywEmLFt9TIpf7
	RSBwMCSuIGTI9bOo817e2z4PbEyp8Eji06L8NrIXuTkwnpwJpoxz/wpQhZgCtyv/1x321C/IPrr
	RclVgiDQfBFo2IrjZTGcGIcEswXgJrUjrxzOSisK8CN3SOyMTQKtDT/JwF5YROaqfrTvUUoJjQw
	Tq4iH/pyy0QYR7hofsHLcg9M0jPdcl1hVUgz3ZQ5249xPUivz7Y7qIDNpO7jD2KFi+fxxhhDSPs
	YfHhP6Hi+w6DYJ8+zcRKwCuetNeXhpship6D5TLPoR8jr5hSBIRQO5xWwPAE0AxxBR3UKB
X-Received: by 2002:a05:6a00:f87:b0:880:e0f8:2d9d with SMTP id d2e1a72fcca58-890df9992dbmr1806155b3a.55.1791304108962;
        Tue, 06 Oct 2026 09:28:28 -0700 (PDT)
Received: from server.lan ([168.138.199.194])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89188a0d603sm259898b3a.19.2026.10.06.09.28.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 09:28:28 -0700 (PDT)
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
Subject: [PATCH v13 2/2] phy: rockchip: naneng-combphy: add SGMII MAC selection for RK3568
Date: Wed,  7 Oct 2026 00:28:06 +0800
Message-ID: <20261006162807.2843858-3-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261006162807.2843858-1-coiaprant@gmail.com>
References: <20261006162807.2843858-1-coiaprant@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On RK3568, the SGMII interface can be routed to either GMAC0 or
GMAC1 via the GRF register pipe_sgmii_mac_sel.

Add support for this selection by introducing the
"rockchip,sgmii-mac-sel" DT property.

From the RK3568 TRM (Part1, Page 229), the PIPE_GRF_XPCS_CON0
bit 1 (pipe_sgmii_mac_sel) is defined as:

    0: SGMII routed to GMAC0
    1: SGMII routed to GMAC1

The hardware reset value is 1 (GMAC1). If the property is set to 0,
the driver routes SGMII to GMAC0; if set to 1, it routes to GMAC1.
If the property is absent, the driver leaves the routing unchanged,
so the effective value is whatever the bootloader or hardware reset
left.

The driver validates the value and rejects anything other than 0 or 1.

This is necessary for boards such as the Ariaboard Photonicat, which
uses the SGMII interface connected to GMAC0.

Link: https://dl.radxa.com/rock3/docs/hw/datasheet/Rockchip%20RK3568%20TRM%20Part1%20V1.1-20210301.pdf (Page 229)
Signed-off-by: Coia Prant <coiaprant@gmail.com>
---
 .../rockchip/phy-rockchip-naneng-combphy.c    | 42 +++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/drivers/phy/rockchip/phy-rockchip-naneng-combphy.c b/drivers/phy/rockchip/phy-rockchip-naneng-combphy.c
index 7843356a4dd47..f76b48009673d 100644
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
@@ -212,6 +213,8 @@ struct rockchip_combphy_priv {
 	bool enable_ssc;
 	bool ext_refclk;
 	struct clk *refclk;
+	bool sgmii_mac_sel_present;
+	u32 sgmii_mac_sel;
 };
 
 static void rockchip_combphy_updatel(struct rockchip_combphy_priv *priv,
@@ -341,6 +344,7 @@ static struct phy *rockchip_combphy_xlate(struct device *dev, const struct of_ph
 static int rockchip_combphy_parse_dt(struct device *dev, struct rockchip_combphy_priv *priv)
 {
 	int i;
+	int ret;
 
 	priv->num_clks = devm_clk_bulk_get_all(dev, &priv->clks);
 	if (priv->num_clks < 1)
@@ -375,6 +379,16 @@ static int rockchip_combphy_parse_dt(struct device *dev, struct rockchip_combphy
 
 	priv->ext_refclk = device_property_present(dev, "rockchip,ext-refclk");
 
+	if (device_property_present(dev, "rockchip,sgmii-mac-sel")) {
+		ret = device_property_read_u32(dev, "rockchip,sgmii-mac-sel", &priv->sgmii_mac_sel);
+		if (ret) {
+			dev_err(dev, "failed to read sgmii-mac-sel property\n");
+			return ret;
+		}
+
+		priv->sgmii_mac_sel_present = true;
+	}
+
 	priv->phy_rst = devm_reset_control_get_exclusive(dev, "phy");
 	/* fallback to old behaviour */
 	if (PTR_ERR(priv->phy_rst) == -ENOENT)
@@ -803,11 +817,34 @@ static const struct rockchip_combphy_cfg rk3562_combphy_cfgs = {
 	.combphy_cfg	= rk3562_combphy_cfg,
 };
 
+static int rk3568_combphy_select_sgmii_mac(struct rockchip_combphy_priv *priv)
+{
+	const struct rockchip_combphy_grfcfg *cfg = priv->cfg->grfcfg;
+
+	if (!priv->sgmii_mac_sel_present)
+		return 0;
+
+	switch (priv->sgmii_mac_sel) {
+	case 0:
+		rockchip_combphy_param_write(priv->pipe_grf, &cfg->pipe_sgmii_mac_sel, false);
+		break;
+	case 1:
+		rockchip_combphy_param_write(priv->pipe_grf, &cfg->pipe_sgmii_mac_sel, true);
+		break;
+	default:
+		dev_err(priv->dev, "invalid sgmii-mac-sel value %u\n", priv->sgmii_mac_sel);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
 static int rk3568_combphy_cfg(struct rockchip_combphy_priv *priv)
 {
 	const struct rockchip_combphy_grfcfg *cfg = priv->cfg->grfcfg;
 	unsigned long rate;
 	u32 val;
+	int ret;
 
 	switch (priv->type) {
 	case PHY_TYPE_PCIE:
@@ -873,6 +910,10 @@ static int rk3568_combphy_cfg(struct rockchip_combphy_priv *priv)
 		break;
 
 	case PHY_TYPE_SGMII:
+		ret = rk3568_combphy_select_sgmii_mac(priv);
+		if (ret)
+			return ret;
+
 		rockchip_combphy_param_write(priv->pipe_grf, &cfg->pipe_xpcs_phy_ready, true);
 		rockchip_combphy_param_write(priv->phy_grf, &cfg->pipe_phymode_sel, true);
 		rockchip_combphy_param_write(priv->phy_grf, &cfg->pipe_sel_qsgmii, true);
@@ -984,6 +1025,7 @@ static const struct rockchip_combphy_grfcfg rk3568_combphy_grfcfgs = {
 	.con3_for_sata		= { 0x000c, 15, 0, 0x00, 0x4407 },
 	/* pipe-grf */
 	.pipe_con0_for_sata	= { 0x0000, 15, 0, 0x00, 0x2220 },
+	.pipe_sgmii_mac_sel	= { 0x0040, 1, 1, 0x00, 0x01 },
 	.pipe_xpcs_phy_ready	= { 0x0040, 2, 2, 0x00, 0x01 },
 	.u3otg0_port_en		= { 0x0104, 15, 0, 0x0181, 0x1100 },
 	.u3otg1_port_en		= { 0x0144, 15, 0, 0x0181, 0x1100 },
-- 
2.47.3

