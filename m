Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 315D83B38A4;
	Thu, 24 Sep 2026 09:39:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790242755; cv=none; b=HKW9uJtHxnX2c7/hWvxWXMHEjeIsrpi1xDw3awfBTfd1UCykYiSTi+SiMTZujT247UPPw6C2IZCA8miOpCO/Jfnv0EXBvArlsleKlSv+o16PFWUxWfT9eH25Z4PldAN4zTOsX1sYumAnoQvSyF6A3I/aAUapHRHLRw502lBez8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790242755; c=relaxed/simple;
	bh=LhBf7uyvNWdc+1o7fNc8Pq/2LIhba4ntyJokJmrlauQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=S/zi5OY3LX5WafnAwzyyTWJeVWadpNC8wDhy5aMl9VxDJ3G7ZwbuL0k1X5ljGDkeN1SARyazU5joyD9qeAaQYTBQnX0HC2vDpeWrTtk7hVwWKAPf/i+0kLem2U6SUmZA4D72UGB2ab+8NSXHuVbz97V62YfY/XqsD0QCyRMPkbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y8+ag2xy; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y8+ag2xy"
Received: by smtp.kernel.org (Postfix) with ESMTPS id DC637C2BCFC;
	Thu, 24 Sep 2026 09:39:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790242754;
	bh=LhBf7uyvNWdc+1o7fNc8Pq/2LIhba4ntyJokJmrlauQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Y8+ag2xyT5Ik8isUvlaiIiyKJSkZT0+eqaNL1mM3Qtssv3moeUVT2C4lQzA3GrHln
	 hUTzDnRjuLRA1wogT4C1gtUgtzjCq5pHPGOSJi6xQl5ncuS+RBFUy6uYNVX72cjDx2
	 lnFzk0RyloAXZuCItTrVurAQwz7DrIRiUgW3Wkc05MYfeXLQeZzWYiDFEA4sRA/f5N
	 rov6D2t5FakG1w8vI0aSelqJe7YJvNSi5l6ID5xMoqCHhcP4I8gGyp5lrxC3Voj5r/
	 H4cftD+PjiwbDr6KYd1l2KzUDWs4dQmhxNH5HmKlcU7nOAx+vbAIPWoNpnQY7a5EPm
	 WkSfObHaL04wA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C30D7C98317;
	Thu, 24 Sep 2026 09:39:14 +0000 (UTC)
From: Roman Vivchar via B4 Relay <devnull+rva333.protonmail.com@kernel.org>
Date: Thu, 24 Sep 2026 12:38:31 +0300
Subject: [PATCH v3 2/3] soc: mediatek: pwrap: use correct log level
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-6572-pwrap-v3-2-64769b6446ac@protonmail.com>
References: <20260924-6572-pwrap-v3-0-64769b6446ac@protonmail.com>
In-Reply-To: <20260924-6572-pwrap-v3-0-64769b6446ac@protonmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Flora Fu <flora.fu@mediatek.com>, Alexandre Mergnat <amergnat@baylibre.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Roman Vivchar <rva333@protonmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790242752; l=3556;
 i=rva333@protonmail.com; s=20260510; h=from:subject:message-id;
 bh=aBJoby976DV0fnBJYf0Tm1Mpi+SpQNQMduSmydmf8uw=;
 b=+Mav+ZxvifWc322AWdI4+wK84IHSoI7II6Bl7jqFWPZXNysQtvF403/OX3jbztBCHnqn28Ygg
 w+lmcis1De/CssAl3Xuk5jDsaGY550GRtlLD2oRihXOQtjKHZsV7in0
X-Developer-Key: i=rva333@protonmail.com; a=ed25519;
 pk=zww/nWjBGoQ4POXCG0BV6fx2iuXK6jx77rsKPA5YK5Y=
X-Endpoint-Received: by B4 Relay for rva333@protonmail.com/20260510 with
 auth_id=777
X-Original-From: Roman Vivchar <rva333@protonmail.com>
Reply-To: rva333@protonmail.com

From: Roman Vivchar <rva333@protonmail.com>

Error paths should be dev_err, not dev_dbg. Replace all dev_dbg in error
branches to have the correct log level. Also simplify dev_err and return
with dev_err_probe.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Roman Vivchar <rva333@protonmail.com>
---
 drivers/soc/mediatek/mtk-pmic-wrap.c | 45 ++++++++++++++----------------------
 1 file changed, 17 insertions(+), 28 deletions(-)

diff --git a/drivers/soc/mediatek/mtk-pmic-wrap.c b/drivers/soc/mediatek/mtk-pmic-wrap.c
index 0bcd85826375..a4b10b0a97cb 100644
--- a/drivers/soc/mediatek/mtk-pmic-wrap.c
+++ b/drivers/soc/mediatek/mtk-pmic-wrap.c
@@ -2475,10 +2475,9 @@ static int pwrap_probe(struct platform_device *pdev)
 	if (np->child)
 		of_slave_id = of_match_node(of_slave_match_tbl, np->child);
 
-	if (!of_slave_id) {
-		dev_dbg(&pdev->dev, "slave pmic should be defined in dts\n");
-		return -EINVAL;
-	}
+	if (!of_slave_id)
+		return dev_err_probe(&pdev->dev, -EINVAL,
+				     "slave pmic should be defined in dts\n");
 
 	wrp = devm_kzalloc(&pdev->dev, sizeof(*wrp), GFP_KERNEL);
 	if (!wrp)
@@ -2496,11 +2495,9 @@ static int pwrap_probe(struct platform_device *pdev)
 
 	if (HAS_CAP(wrp->master->caps, PWRAP_CAP_RESET)) {
 		wrp->rstc = devm_reset_control_get(wrp->dev, "pwrap");
-		if (IS_ERR(wrp->rstc)) {
-			ret = PTR_ERR(wrp->rstc);
-			dev_dbg(wrp->dev, "cannot get pwrap reset: %d\n", ret);
-			return ret;
-		}
+		if (IS_ERR(wrp->rstc))
+			return dev_err_probe(wrp->dev, PTR_ERR(wrp->rstc),
+					     "cannot get pwrap reset\n");
 	}
 
 	if (HAS_CAP(wrp->master->caps, PWRAP_CAP_BRIDGE)) {
@@ -2510,12 +2507,9 @@ static int pwrap_probe(struct platform_device *pdev)
 
 		wrp->rstc_bridge = devm_reset_control_get(wrp->dev,
 							  "pwrap-bridge");
-		if (IS_ERR(wrp->rstc_bridge)) {
-			ret = PTR_ERR(wrp->rstc_bridge);
-			dev_dbg(wrp->dev,
-				"cannot get pwrap-bridge reset: %d\n", ret);
-			return ret;
-		}
+		if (IS_ERR(wrp->rstc_bridge))
+			return dev_err_probe(wrp->dev, PTR_ERR(wrp->rstc_bridge),
+					     "cannot get pwrap-bridge reset\n");
 	}
 
 	ret = devm_clk_bulk_get_all_enabled(wrp->dev, &clk);
@@ -2535,10 +2529,8 @@ static int pwrap_probe(struct platform_device *pdev)
 	 */
 	if (!pwrap_readl(wrp, PWRAP_INIT_DONE2)) {
 		ret = pwrap_init(wrp);
-		if (ret) {
-			dev_dbg(wrp->dev, "init failed with %d\n", ret);
-			return ret;
-		}
+		if (ret)
+			return dev_err_probe(wrp->dev, ret, "init failed\n");
 	}
 
 	if (HAS_CAP(wrp->master->caps, PWRAP_CAP_ARB))
@@ -2548,10 +2540,9 @@ static int pwrap_probe(struct platform_device *pdev)
 	else
 		mask_done = PWRAP_STATE_INIT_DONE0;
 
-	if (!(pwrap_readl(wrp, PWRAP_WACS2_RDATA) & mask_done)) {
-		dev_dbg(wrp->dev, "initialization isn't finished\n");
-		return -ENODEV;
-	}
+	if (!(pwrap_readl(wrp, PWRAP_WACS2_RDATA) & mask_done))
+		return dev_err_probe(wrp->dev, -ENODEV,
+				     "initialization isn't finished\n");
 
 	/* Initialize watchdog, may not be done by the bootloader */
 	if (!HAS_CAP(wrp->master->caps, PWRAP_CAP_ARB))
@@ -2593,11 +2584,9 @@ static int pwrap_probe(struct platform_device *pdev)
 		return PTR_ERR(wrp->regmap);
 
 	ret = of_platform_populate(np, NULL, NULL, wrp->dev);
-	if (ret) {
-		dev_dbg(wrp->dev, "failed to create child devices at %pOF\n",
-				np);
-		return ret;
-	}
+	if (ret)
+		return dev_err_probe(wrp->dev, ret,
+				     "failed to create child devices at %pOF\n", np);
 
 	return 0;
 }

-- 
2.55.0


