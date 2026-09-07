Received: from mail-pj2-f10.google.com (mail-pj2-f10.google.com [74.125.227.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C06446C825
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 15:38:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788795541; cv=none; b=J7+Hov696Np4o/l2+L4ZMDxUOCkN/qsZyL/1Ai9HLgvHwUH41WIcjxSRgVstgpZfccUpIkR8FGbex8Aok0GaiBcBxjYuwhUKjaSTV4Y8oLAcGNmb9pV4vyVU0Mo2uEOe6dPWSxqRuL08hNF9rODo11dYsXffTB8Y8gUb3a0HMv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788795541; c=relaxed/simple;
	bh=puR3hcsKpnP6vV5Zl58WDpiYi4UfmWoBZ4wnS5ijiiI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=B1hadBmta7+M8Zxg9c8512k1AZrRpcqnoYwADXlwSth2Gk9lplhOu2x19qT2rFCnQkvGhA+iLASsNPOHfEfHWHqOl/LWBtCv5Goq0eRKdk/f5y1Dxcm2oIBHgbhRq+cFWUu4prLYDE83kZ/pVUhIJ9DYbC3qF2v9FzuLXA+5U08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UI3O3T4i; arc=none smtp.client-ip=74.125.227.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UI3O3T4i"
Received: by mail-pj2-f10.google.com with SMTP id 98e67ed59e1d1-39641d0dba5so2300779a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 08:38:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788795538; x=1789400338; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F3aEYb5uf8Ywd6IPUhePKv9EQrcFVFS6EHQyfufoEjE=;
        b=UI3O3T4iGzvEB0cILW/TGWfjP1gZkN+8K9avsCp2k3PxlaL87Z0sXRCcyjATTVGV2M
         D25350fBCJ0qbmnqsn9ioibB0qbFi61Ly6ahxG+2m3Iw2stOhk5ptmJBqykA495Rt4TS
         M2shMkaDqhbGsqBi8hKQZo9TQ3x/FOt7eQ/rIvKy2yUGUYvc8gxzBDThx9avhpaj2jpb
         dArJVJfwa0jmjjxoeLyCzm/fK0Ovv4f58kseyr432H12HAXVooZY7/TzN912ws5nS3Hc
         MQjk5Grp5T1b67B23yxKqUI7IYuMj2/Azjj1fZVFTpDWraEvVti+EYuIqD45tpaiGRvB
         qVVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788795538; x=1789400338;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=F3aEYb5uf8Ywd6IPUhePKv9EQrcFVFS6EHQyfufoEjE=;
        b=hgqRBs7sPHcwnim5AhVs2Me0ISaPcCjIWW6LyODXpvXRLWk9l3msX5diuoKkWAu+Mn
         eVHoIijJDnEQxYT+dM7RtfLyQcrF7zF8fgWR7sS0nJ2Bas0rpSTfMSnoskzgxhRTstHI
         sMx/nz4TEG17s25p+GPmtYP90XExRxVNtkZlQoMweuPJHugy2VgsH8T94R4tbRJ+2KHx
         VQVT9UgOYKdoijPEU1fPT7uyllqPzxXJUkNHiOEp5UNTSgXQlCXtb+Y1LXtCx6u4oKNj
         E51tWQBh4UqCjcht7I+xgRBPksC2jlKMukEEMTrmZ9lfhNsXaI1bIkY1vONR4sKdNnYs
         KRVA==
X-Forwarded-Encrypted: i=1; AKwUvBzjJp5wUujCLXTAEZu0vJD8TVD58iMdx1Yk2pIgbOFX20IwNLHaB552TFDXr5hZMbMs9INA5lIF40fvc/8=@vger.kernel.org
X-Gm-Message-State: AFuF++mTW0Egq1ap3PB4av5t+ymBUcEZAf0QgnTzN9ZIWgxtH+MablHZ
	Hy5tS9fjylVsmjCnwgvfI3roiVICCihlTMKPdVnRK8ZTfP/T1arRUYTL
X-Gm-Gg: AYBFou0OxDF2OYAaCP+R1+64Qp9Rj6e3+PLQLVYq/Gj6V+UnKd12ZGgbNm8EssWKurM
	vmaIwLI39xmvPFwafCwdT7Zt1Y/41giBDaD1Her1w5m/6cCvc901ooCYZvoTVAG4axCOsq14+ej
	wVyGDVEDlAl5VAxgB/OvdjDqvEioNDEwEWYfCpBh0tiLINMRL10643Hz62Yx9N0kP/tEuSx1A2U
	i7nLbWwtSo4vbgxkwJqqmCTB16cKleLnNJ+WGK8e90oHMlCaH9l8s5Q5iNMw41+Cf02dX/6IhJ1
	SRLCQ7362Yjc/gdNz3a9P2A8kB3JRh8W00rWJb8YZTaTP5mFiEpaeQ2mMv6/mDCG42VpIuW4Ac8
	pwKnNVE6sLEJwNvfuWeuO6pbcb3E2Z4/iErATW9RRgazzHghIj4p9rpzloGQvyhLl4DK5mlZlCe
	LSR0SkJXvkGxMIsBxx5WhdagmLdZLg1soCOgMz3rQ8K4DXVRWnfdGg0KPjflsD
X-Received: by 2002:a17:90b:5106:b0:37f:c22a:c188 with SMTP id 98e67ed59e1d1-39b260feb03mr34662494a91.4.1788795538351;
        Mon, 07 Sep 2026 08:38:58 -0700 (PDT)
Received: from server.lan ([150.230.217.250])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b260fdf9asm21690121a91.9.2026.09.07.08.38.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 08:38:57 -0700 (PDT)
From: Coia Prant <coiaprant@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Vinod Koul <vkoul@kernel.org>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Romain Gantois <romain.gantois@bootlin.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Coia Prant <coiaprant@gmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Russell King <linux@armlinux.org.uk>,
	Shawn Lin <shawn.lin@rock-chips.com>,
	David Heidelberg <david@ixit.cz>,
	netdev@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH net-next v4 03/10] phy: rockchip: naneng-combphy: add SGMII MAC selection for RK3568
Date: Mon,  7 Sep 2026 23:37:06 +0800
Message-ID: <20260907153713.2572547-5-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260907153713.2572547-2-coiaprant@gmail.com>
References: <20260907153713.2572547-2-coiaprant@gmail.com>
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

The hardware reset value is GMAC1 (1). If the property is set to 0,
the driver routes SGMII to GMAC0; if set to 1 (or omitted), it
remains at GMAC1.

This is necessary for boards such as the Ariaboard Photonicat, which
uses the SGMII interface connected to GMAC0.

Link: https://dl.radxa.com/rock3/docs/hw/datasheet/Rockchip%20RK3568%20TRM%20Part1%20V1.1-20210301.pdf (Page 229)
Signed-off-by: Coia Prant <coiaprant@gmail.com>
---
 drivers/phy/rockchip/phy-rockchip-naneng-combphy.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/phy/rockchip/phy-rockchip-naneng-combphy.c b/drivers/phy/rockchip/phy-rockchip-naneng-combphy.c
index 7843356a4dd47..919bb97a4b182 100644
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
+					priv->sgmii_mac_sel > 0);
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

