Received: from sender4-op-o11.zoho.com (sender4-op-o11.zoho.com [136.143.188.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E5623F7A84;
	Wed, 26 Aug 2026 12:39:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787747952; cv=pass; b=ivpgCo1NRdXS2LTJ/14MRYH241vxcgQh2cnMTFIsIl2cGxoKbC+JeKQU3ifq3beY/0QBVP/RmendRgLxcDvL5gRK0RP1TVLvIgb0ZXcydo09cq93+MV8pvQ7pm/UqtLP8REAuSwa7zTebCPA+PnJWKTRJKI1ygn2govy3WbQnQc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787747952; c=relaxed/simple;
	bh=/nCqDhPJaJGK68g1Z14wVj81hJNQzyCXzAX4lDy5cg8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ONtV9CNSPgwb+zVAWY76HZGdW1EEA6H6gd95y0RALrCjTrvWCpb4lO6HJntmLkFRtH4xDIvaLJFyIskCP+MvXXze8mhlNi0HUhA6S6W6/gIomwKLKvhtOtFkjMPkf91GyoO0biO+FkADQ3RmlJ7LvSOIDDRRFyBYygoxRWUciOI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=julien.massot@collabora.com header.b=AIQJqf4Q; arc=pass smtp.client-ip=136.143.188.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=julien.massot@collabora.com header.b="AIQJqf4Q"
ARC-Seal: i=1; a=rsa-sha256; t=1787747932; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=ByEOzvJz0+cY+J20QOmb+TXXI3p1JDkHAuyk6U63St+/IL0L4JmfEZ4ziNwY3bBxfaSQ3uY2KrGI1DwQuDAGf1Ou/pU6Sshh95+rT8RJl/3nlRZk/8yRh2RYtH0hQjroVa2d+WpIbEn+aRhmieZxxUxEYZ/RYCOEufhqnb8QwvU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1787747932; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=gQkt+AxOVU6u5IygNkiSEdsCB3ba9YtCG7UYdDpFwmo=; 
	b=mu1RdgmmWcl5SdrjkPkpLApKyZpv4FPZV+mpfgN9tsg036tVLfy+frZfYo179wpdUWGk9qWgONTfiPzsE50Fb0fpSbHAAA8YHvljA2JYCWddK6syyE5KtXLb8Bsur3MmFijuTxr1WBvZFj0Nvc00xMS6+NFq+5+bhDFHFl5BE88=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=julien.massot@collabora.com;
	dmarc=pass header.from=<julien.massot@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1787747932;
	s=zohomail; d=collabora.com; i=julien.massot@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=gQkt+AxOVU6u5IygNkiSEdsCB3ba9YtCG7UYdDpFwmo=;
	b=AIQJqf4QPRH0VCACXg9NC/nXpzAmws5B/UVx65Z6w2Hq4E6/+hEAkgIJgilYMh90
	F1/o+3vvXlWAGz8JMbYS7yZo3BQHBwmnR2//+efZfxWDfABiZCcL3GKTZTs3VhkHdVp
	YEE2cKDcAXrrBnp2RqFqwFu+7VU8uGsvADBnDBOU=
Received: by mx.zohomail.com with SMTPS id 1787747930692813.6414076114834;
	Wed, 26 Aug 2026 05:38:50 -0700 (PDT)
From: Julien Massot <julien.massot@collabora.com>
Date: Wed, 26 Aug 2026 14:38:36 +0200
Subject: [PATCH 2/2] phy: mediatek: xsphy: add optional repeater support
 for USB2 ports
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260826-mtk-usb2-repeater-usb2-v1-2-e8e48e2fd6d8@collabora.com>
References: <20260826-mtk-usb2-repeater-usb2-v1-0-e8e48e2fd6d8@collabora.com>
In-Reply-To: <20260826-mtk-usb2-repeater-usb2-v1-0-e8e48e2fd6d8@collabora.com>
To: kernel@collabora.com, Chunfeng Yun <chunfeng.yun@mediatek.com>, 
 Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Julien Massot <julien.massot@collabora.com>
X-Mailer: b4 0.14.3
X-ZohoMailClient: External

USB2 PHY port sub-nodes may carry an optional phys property referencing
an external eUSB2 repeater.

Fetch the repeater during probe using devm_of_phy_optional_get(),
initialize and exit it alongside the USB2 PHY, and propagate USB mode
changes to it.

This follows the same pattern used by the Synopsys eUSB2 PHY driver.

Signed-off-by: Julien Massot <julien.massot@collabora.com>
---
 drivers/phy/mediatek/phy-mtk-xsphy.c | 26 ++++++++++++++++++++++++--
 1 file changed, 24 insertions(+), 2 deletions(-)

diff --git a/drivers/phy/mediatek/phy-mtk-xsphy.c b/drivers/phy/mediatek/phy-mtk-xsphy.c
index cc1d66954212..7bc3d6794d7b 100644
--- a/drivers/phy/mediatek/phy-mtk-xsphy.c
+++ b/drivers/phy/mediatek/phy-mtk-xsphy.c
@@ -94,6 +94,7 @@ struct xsphy_instance {
 	struct phy *phy;
 	void __iomem *port_base;
 	struct clk *ref_clk;	/* reference clock of anolog phy */
+	struct phy *repeater;
 	u32 index;
 	u32 type;
 	struct regmap *type_sw;
@@ -391,6 +392,11 @@ static int mtk_phy_init(struct phy *phy)
 
 	switch (inst->type) {
 	case PHY_TYPE_USB2:
+		ret = phy_init(inst->repeater);
+		if (ret) {
+			clk_disable_unprepare(inst->ref_clk);
+			return ret;
+		}
 		u2_phy_instance_init(xsphy, inst);
 		u2_phy_props_set(xsphy, inst);
 		break;
@@ -438,7 +444,11 @@ static int mtk_phy_exit(struct phy *phy)
 {
 	struct xsphy_instance *inst = phy_get_drvdata(phy);
 
+	if (inst->type == PHY_TYPE_USB2)
+		phy_exit(inst->repeater);
+
 	clk_disable_unprepare(inst->ref_clk);
+
 	return 0;
 }
 
@@ -446,9 +456,16 @@ static int mtk_phy_set_mode(struct phy *phy, enum phy_mode mode, int submode)
 {
 	struct xsphy_instance *inst = phy_get_drvdata(phy);
 	struct mtk_xsphy *xsphy = dev_get_drvdata(phy->dev.parent);
+	int ret;
 
-	if (inst->type == PHY_TYPE_USB2)
-		u2_phy_instance_set_mode(xsphy, inst, mode);
+	if (inst->type != PHY_TYPE_USB2)
+		return 0;
+
+	ret = phy_set_mode_ext(inst->repeater, mode, submode);
+	if (ret)
+		return ret;
+
+	u2_phy_instance_set_mode(xsphy, inst, mode);
 
 	return 0;
 }
@@ -590,6 +607,11 @@ static int mtk_xsphy_probe(struct platform_device *pdev)
 		retval = phy_type_syscon_get(inst, child_np);
 		if (retval)
 			return retval;
+
+		inst->repeater = devm_of_phy_optional_get(dev, child_np, NULL);
+		if (IS_ERR(inst->repeater))
+			return dev_err_probe(dev, PTR_ERR(inst->repeater),
+					 "failed to get repeater\n");
 	}
 
 	provider = devm_of_phy_provider_register(dev, mtk_phy_xlate);

-- 
2.55.0

