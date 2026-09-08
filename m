Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 614B24EE84B;
	Tue,  8 Sep 2026 09:41:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788860516; cv=none; b=FtYah1LKIxDM4knMIUoDrtzWECL0KoZ1EGJLkPyNGddbEukUe/MEjfULmyGogjykKCAmtmzjNvGyz8R0syVK6cFn6midH4LG+WOrHELKVoN7ZdU6oQKSZLK3ZyAqJz/dshlz0ZaR7D4ipYyLu6sVGPfeKm8JQ3TtflNIy5UU3po=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788860516; c=relaxed/simple;
	bh=p5YHlkuIPNYbVBUZsZU/5N8TqxxBbe/5VAHVVT4DypY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UnkvsfAkxglyr0JFKpI1Nlv9/ZkUHvDF50p95z0CAruCFYoGg9DzfeHVPhqsc8/VIhy/qcw3E+/IA3CU1uwyizaGBm995EbN9xabNXeXeMDRolxpGXJeZF9q9UbjUUiIX/UaGw/rh9NwZTr0Cx2J7wl0777JC5jFslXXUTDhOBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ceP0H/5Z; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ceP0H/5Z"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 274FFC2BCB8;
	Tue,  8 Sep 2026 09:41:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1788860516;
	bh=p5YHlkuIPNYbVBUZsZU/5N8TqxxBbe/5VAHVVT4DypY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=ceP0H/5ZseVQ9i1DbhlTaqkNT7XcFboHICIpULEle+Ut3oRL9ZzAlYEtQzSo2cZRV
	 xdZNcY89CGw/jWkHsL1DmECx6thI1O7Igh8rD/C+h3Iyxy4a9WcWxyHOHk2WQvNpEd
	 I70tequqozLzT8FpBtQJa0GiskLBqlTTLb1xLGk+pqakayaB/isgq7vDMBBdrwO/rc
	 LMCF/0Vbs3ze6gKAL5SquwFEH5keD+zB6jgeiPStJEQK/hxNirfuwczP72f8FrYEy6
	 vvFKDJmYK6LBJx0A3yh6FCTqBLkbasr1NCXBL23uxK8qoVAVmOcyN0IdTSYJLXecLR
	 1gpIO/1IqI/6w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14F21C79FA1;
	Tue,  8 Sep 2026 09:41:56 +0000 (UTC)
From: George Moussalem via B4 Relay <devnull+george.moussalem.outlook.com@kernel.org>
Date: Tue, 08 Sep 2026 13:40:59 +0400
Subject: [PATCH v4 06/13] phy: qualcomm: qcom-uniphy-pcie-usb3-28lp: Use
 bulk reset_control API
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260908-ipq5018-usb3-v4-6-b789702f0695@outlook.com>
References: <20260908-ipq5018-usb3-v4-0-b789702f0695@outlook.com>
In-Reply-To: <20260908-ipq5018-usb3-v4-0-b789702f0695@outlook.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Praveenkumar I <praveenkumar.i@oss.qualcomm.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>, 
 Nitheesh Sekar <quic_nsekar@quicinc.com>, 
 Wesley Cheng <quic_wcheng@quicinc.com>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Varadarajan Narayanan <quic_varada@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-usb@vger.kernel.org, Stanislaw Pal <kuncy7@gmail.com>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>, 
 George Moussalem <george.moussalem@outlook.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788860513; l=3371;
 i=george.moussalem@outlook.com; s=20250321; h=from:subject:message-id;
 bh=h4fXL1CdGlHbqoFCN4A+EVtPpqzGGhM/+y8nDodBIX8=;
 b=0gViUe/rFCZsihT03kxd49W+sZAmyHentB4B+G0DYoO0fScTNT1Ue63HKWRrtxY2DzxJ/M0wm
 qzmjA7TtuJpCljjApss3yfTytaITqfvT6oXYNX1U8T9mxdCcsP/9jUr
X-Developer-Key: i=george.moussalem@outlook.com; a=ed25519;
 pk=/PuRTSI9iYiHwcc6Nrde8qF4ZDhJBlUgpHdhsIjnqIk=
X-Endpoint-Received: by B4 Relay for george.moussalem@outlook.com/20250321
 with auth_id=364
X-Original-From: George Moussalem <george.moussalem@outlook.com>
Reply-To: george.moussalem@outlook.com

From: George Moussalem <george.moussalem@outlook.com>

Switch to using bulk reset_control functions to prepare the driver for
managing multiple resets, acquiring reset controls by name, and
uniformly storing resets in the private data structure to enable support
for future combo PHY functionality requiring multiple resets.

Tested-by: Stanislaw Pal <kuncy7@gmail.com>
Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Signed-off-by: George Moussalem <george.moussalem@outlook.com>
---
 .../phy/qualcomm/phy-qcom-uniphy-pcie-usb3-28lp.c  | 31 ++++++++++++++++------
 1 file changed, 23 insertions(+), 8 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-uniphy-pcie-usb3-28lp.c b/drivers/phy/qualcomm/phy-qcom-uniphy-pcie-usb3-28lp.c
index c12de5549652..0a50eb44c0ce 100644
--- a/drivers/phy/qualcomm/phy-qcom-uniphy-pcie-usb3-28lp.c
+++ b/drivers/phy/qualcomm/phy-qcom-uniphy-pcie-usb3-28lp.c
@@ -67,7 +67,8 @@ struct qcom_uniphy {
 	const struct qcom_uniphy_data *data;
 	struct clk_bulk_data *clks;
 	int num_clks;
-	struct reset_control *resets;
+	struct reset_control_bulk_data *resets;
+	int num_resets;
 	void __iomem *base;
 	int lanes;
 };
@@ -136,7 +137,7 @@ static int qcom_uniphy_pcie_power_off(struct phy *x)
 
 	clk_bulk_disable_unprepare(phy->num_clks, phy->clks);
 
-	return reset_control_assert(phy->resets);
+	return reset_control_bulk_assert(phy->num_resets, phy->resets);
 }
 
 static int qcom_uniphy_pcie_power_on(struct phy *x)
@@ -144,7 +145,7 @@ static int qcom_uniphy_pcie_power_on(struct phy *x)
 	struct qcom_uniphy *phy = phy_get_drvdata(x);
 	int ret;
 
-	ret = reset_control_assert(phy->resets);
+	ret = reset_control_bulk_assert(phy->num_resets, phy->resets);
 	if (ret) {
 		dev_err(phy->dev, "reset assert failed (%d)\n", ret);
 		return ret;
@@ -152,7 +153,7 @@ static int qcom_uniphy_pcie_power_on(struct phy *x)
 
 	usleep_range(RST_ASSERT_DELAY_MIN_US, RST_ASSERT_DELAY_MAX_US);
 
-	ret = reset_control_deassert(phy->resets);
+	ret = reset_control_bulk_deassert(phy->num_resets, phy->resets);
 	if (ret) {
 		dev_err(phy->dev, "reset deassert failed (%d)\n", ret);
 		return ret;
@@ -176,19 +177,33 @@ static int qcom_uniphy_pcie_power_on(struct phy *x)
 static inline int qcom_uniphy_pcie_usb3_get_resources(struct platform_device *pdev,
 						      struct qcom_uniphy *phy)
 {
+	struct device *dev = phy->dev;
 	struct resource *res;
+	int i, count, ret;
 
 	phy->base = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
 	if (IS_ERR(phy->base))
 		return PTR_ERR(phy->base);
 
-	phy->num_clks = devm_clk_bulk_get_all(phy->dev, &phy->clks);
+	phy->num_clks = devm_clk_bulk_get_all(dev, &phy->clks);
 	if (phy->num_clks < 0)
 		return phy->num_clks;
 
-	phy->resets = devm_reset_control_array_get_exclusive(phy->dev);
-	if (IS_ERR(phy->resets))
-		return PTR_ERR(phy->resets);
+	count = of_count_phandle_with_args(dev->of_node, "resets", "#reset-cells");
+	if (count < 0)
+		return count;
+
+	phy->resets = devm_kcalloc(dev, count, sizeof(*phy->resets), GFP_KERNEL);
+	if (!phy->resets)
+		return -ENOMEM;
+
+	for (i = 0; i < count; i++) {
+		phy->resets[i].rstc = devm_reset_control_get_exclusive_by_index(dev, i);
+		if (IS_ERR(phy->resets[i].rstc))
+			return PTR_ERR(phy->resets[i].rstc);
+	}
+
+	phy->num_resets = count;
 
 	return 0;
 }

-- 
2.53.0


