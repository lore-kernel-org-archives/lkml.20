Received: from mail-pj2-f10.google.com (mail-pj2-f10.google.com [74.125.227.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C63EA3B841F
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 07:48:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791272937; cv=none; b=aXvZf/4F0k30ajhIjr/QFSksrTW0wVkR65PJQndyJhy+IrYrb5nSOG+grSw1Q1oGvH33z5DW0qEm2JkiX5nI1o0BCmp5aPRDuc3wf7I+85PnvlkbAhuRSGw7n5Vfb7TU+lLSxfLLhxVs5fK5RSeHkc1vyiulM5SIMCrUomknMio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791272937; c=relaxed/simple;
	bh=kq0vt9SckJqy94uGlHWiGVuBk0MckU/fwsg6pcjJXHQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DECrgyYW8HjTWLCYpbAq7hofbnlC9CBq7b1nFWbHcRVUZyZJpkw1XnlYrh9H+ljODbtrp27G+XU+Q5X7RvVogaEoaWFl2V/Cig8LZ0UoU++Y+JlF9+JW1NWdoQtjlHQH18VQH7jVrBvGnxsEk0CM/xpjOM0NuK6aG8UXjtjBeYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nbixYdUb; arc=none smtp.client-ip=74.125.227.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nbixYdUb"
Received: by mail-pj2-f10.google.com with SMTP id d9443c01a7336-2df921c1d0eso10945095ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 00:48:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791272935; x=1791877735; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8Rz7MTGiT2Oa/TzTvQEqnIct/KOrKk64RBkMgo9sxQM=;
        b=nbixYdUbXmdqfm1XJJ7y6a3WwTC5dv3Sd9CthlMF2eYmqd6WQxL6f8MMZ/j8qST+jl
         QzNyLnjAJOccQXFjeJ62HspLDB4D5UeC4CC3sZPlKYclLGlzmJWDj91TkdO98nfDgpXx
         grhuQUPvQjUdnd2+buP7D8Bo/XXcGMGJEET8wSskNQjD6bFYKR0wcKInAO2YiwRlN4iT
         8gsgxH8v2U7Mii4cdAziFdSj6ylosMXxP4xUrFd+yXcQkpiYSJ6IFKoOmbtPu4ja4zyQ
         gtmssdAun5qlxUUL8HI5oP8FCho/7Vlj1FzGkkt/OhcV3R9A7dKK5Kmsks8a94o5MOqB
         L6RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791272935; x=1791877735;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8Rz7MTGiT2Oa/TzTvQEqnIct/KOrKk64RBkMgo9sxQM=;
        b=kSkgSKtmnh+iHQ5Rn0kyrduC0MF1M6klpMSLyMi/WgMAgKJZ5ftv+a9J2XOMuf9Mrs
         2Ht5mM0HeZRh/p+RehrF+GCplLkbs64Osk3NXijhkJAwVib+DJpEa9ra+PYtRbtBqws1
         XXtsluYlg3Zd+4Ztzeps00ci2BDb7/uqAbSmRFRtiAGqkZWtfAUUwch/yifyDqSi62ei
         995Ce785l2RPexgVoIU2qh9e9pnhRKpGmZ8l97bULQDfYrr2Jp/fon6BT5WblPNMFtwJ
         pDGppUPg6kMM5i74Lljs2MHB8vCpLYiqpJKM/YbHFnLwpGUWuiNZooboNYHLxCTWvNN3
         ev1A==
X-Forwarded-Encrypted: i=1; AKwUvBx4g9GSvlUq9JhvCv1KlpmYts/FyMzWxsMnLVaeflK9TKKyHy6e/13qcQ7wYg8Q6E+VSFqQ17/4k5n5YCg=@vger.kernel.org
X-Gm-Message-State: AFuF++mFsa6To7us+Lv5r4qzcDJGizIHR3Eti4kSKbVT8jlKQL/VFDa4
	Q4cp1Yu5X9ul0PrjZ+A86TdwxEP8DCqvxp5+kzE5kjf4VLhjZX/UjWzA
X-Gm-Gg: AYBFou0YqXnHy5/J6W299M0YYFwL/sbuvCAfNPmknFKyjrUyMpesV/lZrhxVc/vHTFa
	9aiXJj2qDMmC5dmpsOIzp5F4Uygta1gQCMbjE34EbKDB0gVyxFkhsTd771pCXJ0Fms8h0Gl2yMs
	wm++evRKOt8hGpzoj6NQ3F/isMBTxMYCYeAZldC7kTJ/ynwS3nk/Rrf5AtK6AnqpG5d2QUWriKC
	iStJSjtCDkGMrfR/zoXsoYxGwjepNHNcwIrbZKvdeGyIwLFR7ac48zQ/cC6TV9Be4KPtTZxBh32
	Azx+9n9m7GHnKefyjNamYe+YrxHWdWWuPjwAsFLx30jNclOorwuuJrh3X7+zHg2b5koGLCvb/xk
	KkY9DaJ0erDKQeT0Fzade2LGhKNbBp4lq3FTarbZi58/7ykzfB7gvSoF22NAe/a7s/GPNFMSFyH
	e0fecGsAzt2yBKWfdJSrmOJe7eOSDYgpSyhrvL09kTjwg0Mberik8s6IDxJ8YfUZT+x2rQ
X-Received: by 2002:a05:6a21:6b10:b0:3dd:a195:fa24 with SMTP id adf61e73a8af0-3e0d6d83bccmr8487088637.73.1791272935144;
        Tue, 06 Oct 2026 00:48:55 -0700 (PDT)
Received: from server.lan ([168.138.199.194])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cce6d2406b1sm1998173a12.8.2026.10.06.00.48.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 00:48:53 -0700 (PDT)
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
Subject: [PATCH v12 2/2] phy: rockchip: naneng-combphy: add SGMII MAC selection for RK3568
Date: Tue,  6 Oct 2026 15:47:49 +0800
Message-ID: <20261006074749.2010233-3-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261006074749.2010233-1-coiaprant@gmail.com>
References: <20261006074749.2010233-1-coiaprant@gmail.com>
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

