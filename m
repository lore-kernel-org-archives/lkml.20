Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CEB34D990C;
	Tue,  8 Sep 2026 09:41:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788860516; cv=none; b=GnXx57qTXH/mZ18PSf5xBsPf406YKwNTItG5R2yot4MSZMjsj4dlBbzKBwGQDCgiMqmUvLpdX+gCsEtutPKDofrLpKs6UxInpen9w8F5yFGtbH/XxATRC0dagYfc3GQfqMy1jDIZik1gz1nryOXJqlwXWIrTYL0OZfz/9JTLwvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788860516; c=relaxed/simple;
	bh=O68aPuLj/MRZZZ2bKgri277qxMacJOqxiv0zSOosvfg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ugu+U4dz+2044JGSoENVCb+P+C/XrXzRPx6eh1X9Q21MhCW5oRaNsNBuDssF0czqLXy3oP8+3prSU/tOC/4BzcoJFIA8jPnPXvn0WdMF43hWxOHSAp3NktGgl/7hfO9mImAqx8B0RFTidnlo0+Z21JkHeTxsiEYRwuGPC39cmMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L+hliv6k; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L+hliv6k"
Received: by smtp.kernel.org (Postfix) with ESMTPS id CF719C2BCFC;
	Tue,  8 Sep 2026 09:41:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1788860515;
	bh=O68aPuLj/MRZZZ2bKgri277qxMacJOqxiv0zSOosvfg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=L+hliv6kDHpRn/X2Z5eavYxIaW2hiAH2EDOLOCsGe7Rl8FtlgkyqxIxwK+PVAJStu
	 Yx8FXxRuy6eAbF/CkJst2bSsNH8SnXXbhmD8XGS6SvEUjhMRhxF/Nu1scjp2Nir5qh
	 DOSHb0wVg6Z8W9QzkYWEwKaScc6gig0lWi1yV/sXdJCWoHEgcM1Yr+RBOS5EDzWuKi
	 QWX7blFxaxDh4Yg4QPWWKR2NTpU1QhabMXPJskffcZmyzCIiiQ9kqy77yMDHu6qJ4I
	 T0qAeVkPAL0+9IU9iyBrwrcSnUSq3niKEZLTfY+A7L3LQuAaoxKTuhjBcOgVvvHy13
	 hlCdx/0HZpgJQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6A5FC79FAB;
	Tue,  8 Sep 2026 09:41:55 +0000 (UTC)
From: George Moussalem via B4 Relay <devnull+george.moussalem.outlook.com@kernel.org>
Date: Tue, 08 Sep 2026 13:40:55 +0400
Subject: [PATCH v4 02/13] phy: qualcomm: qcom-uniphy-pcie-28lp: Convert to
 PCIe/USB3 combo PHY driver
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260908-ipq5018-usb3-v4-2-b789702f0695@outlook.com>
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
 linux-usb@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Stanislaw Pal <kuncy7@gmail.com>, 
 George Moussalem <george.moussalem@outlook.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788860512; l=10630;
 i=george.moussalem@outlook.com; s=20250321; h=from:subject:message-id;
 bh=VlrFmI3Rhb8PL7GHLiIwbQZh0DHE3ArWCVg8Q7ElEGg=;
 b=t2FUeJ1P3TI29p6lCx6uxr5CygdRsRZk/HoEzL6VKigQ/BBEKXNn6yWzsH+jzg+wZjncQz/aW
 vtlYDyniftzBf1qFnZD0xCTGgphMpo8lUZkn58BEYONkkM/EQi6lTRz
X-Developer-Key: i=george.moussalem@outlook.com; a=ed25519;
 pk=/PuRTSI9iYiHwcc6Nrde8qF4ZDhJBlUgpHdhsIjnqIk=
X-Endpoint-Received: by B4 Relay for george.moussalem@outlook.com/20250321
 with auth_id=364
X-Original-From: George Moussalem <george.moussalem@outlook.com>
Reply-To: george.moussalem@outlook.com

From: George Moussalem <george.moussalem@outlook.com>

This PHY found in IPQ5332 and IPQ5018 SoCs is actually a multi-purpose
PCIe/USB3 combo PHY. The driver was initially created for PCIe PHY
support only. As such, rename the driver and generalize function and
struct names to reflect that it is a PCIe and USB3 combo PHY driver so
that USB3 support can be added in subsequent patches.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Tested-by: Stanislaw Pal <kuncy7@gmail.com>
Signed-off-by: George Moussalem <george.moussalem@outlook.com>
---
 drivers/phy/qualcomm/Kconfig                       | 24 +++----
 drivers/phy/qualcomm/Makefile                      |  2 +-
 ...cie-28lp.c => phy-qcom-uniphy-pcie-usb3-28lp.c} | 83 +++++++++++-----------
 3 files changed, 53 insertions(+), 56 deletions(-)

diff --git a/drivers/phy/qualcomm/Kconfig b/drivers/phy/qualcomm/Kconfig
index d910a5d1a1ac..2db65815b297 100644
--- a/drivers/phy/qualcomm/Kconfig
+++ b/drivers/phy/qualcomm/Kconfig
@@ -155,19 +155,6 @@ config PHY_QCOM_M31_USB
 	  management. This driver is required even for peripheral only or
 	  host only mode configurations.
 
-config PHY_QCOM_UNIPHY_PCIE_28LP
-	bool "PCIE UNIPHY 28LP PHY driver"
-	depends on ARCH_QCOM
-	depends on COMMON_CLK
-	depends on HAS_IOMEM
-	depends on OF
-	select GENERIC_PHY
-	help
-	  Enable this to support the PCIe UNIPHY 28LP phy transceiver that
-	  is used with PCIe controllers on Qualcomm IPQ5332 chips. It
-	  handles PHY initialization, clock management required after
-	  resetting the hardware and power management.
-
 config PHY_QCOM_M31_EUSB
 	tristate "Qualcomm M31 eUSB2 PHY driver support"
 	depends on USB && (ARCH_QCOM || COMPILE_TEST)
@@ -178,6 +165,17 @@ config PHY_QCOM_M31_EUSB
 	  up of the associated USB repeater that is paired with the eUSB2
 	  PHY.
 
+config PHY_QCOM_UNIPHY_PCIE_USB3_28LP
+	bool "Qualcomm IPQ5332 UNIPHY PCIe USB3 28LP PHY driver"
+	depends on OF && (ARCH_QCOM || COMPILE_TEST)
+	select GENERIC_PHY
+	select MFD_SYSCON
+	help
+	  Enable this to support the Qualcomm multi-purpose PCIe/USB3 UNIPHY
+	  transceiver that is used on Qualcomm IPQ5018 and IPQ5332 SoCs with
+	  PCIe and USB controllers. It handles PHY initialization, clock
+	  management required after resetting the hardware and power management.
+
 config PHY_QCOM_USB_HS
 	tristate "Qualcomm USB HS PHY module"
 	depends on USB_ULPI_BUS
diff --git a/drivers/phy/qualcomm/Makefile b/drivers/phy/qualcomm/Makefile
index 8bf887d58ee4..6e2e9737e387 100644
--- a/drivers/phy/qualcomm/Makefile
+++ b/drivers/phy/qualcomm/Makefile
@@ -18,7 +18,7 @@ obj-$(CONFIG_PHY_QCOM_QMP_USB_LEGACY)	+= phy-qcom-qmp-usb-legacy.o
 
 obj-$(CONFIG_PHY_QCOM_QUSB2)		+= phy-qcom-qusb2.o
 obj-$(CONFIG_PHY_QCOM_EUSB2_REPEATER)	+= phy-qcom-eusb2-repeater.o
-obj-$(CONFIG_PHY_QCOM_UNIPHY_PCIE_28LP)	+= phy-qcom-uniphy-pcie-28lp.o
+obj-$(CONFIG_PHY_QCOM_UNIPHY_PCIE_USB3_28LP)	+= phy-qcom-uniphy-pcie-usb3-28lp.o
 obj-$(CONFIG_PHY_QCOM_USB_HS) 		+= phy-qcom-usb-hs.o
 obj-$(CONFIG_PHY_QCOM_USB_HSIC) 	+= phy-qcom-usb-hsic.o
 obj-$(CONFIG_PHY_QCOM_USB_HS_28NM)	+= phy-qcom-usb-hs-28nm.o
diff --git a/drivers/phy/qualcomm/phy-qcom-uniphy-pcie-28lp.c b/drivers/phy/qualcomm/phy-qcom-uniphy-pcie-usb3-28lp.c
similarity index 76%
rename from drivers/phy/qualcomm/phy-qcom-uniphy-pcie-28lp.c
rename to drivers/phy/qualcomm/phy-qcom-uniphy-pcie-usb3-28lp.c
index 324c0a5d658e..53512db90eb3 100644
--- a/drivers/phy/qualcomm/phy-qcom-uniphy-pcie-28lp.c
+++ b/drivers/phy/qualcomm/phy-qcom-uniphy-pcie-usb3-28lp.c
@@ -43,29 +43,29 @@
 #define PHY_CFG_EIOS_DTCT_REG			0x3e4
 #define PHY_CFG_GEN3_ALIGN_HOLDOFF_TIME		0x3e8
 
-enum qcom_uniphy_pcie_type {
+enum qcom_uniphy_type {
 	PHY_TYPE_PCIE = 1,
 	PHY_TYPE_PCIE_GEN2,
 	PHY_TYPE_PCIE_GEN3,
 };
 
-struct qcom_uniphy_pcie_regs {
+struct qcom_uniphy_regs {
 	u32 offset;
 	u32 val;
 };
 
-struct qcom_uniphy_pcie_data {
+struct qcom_uniphy_data {
 	int lane_offset; /* offset between the lane register bases */
 	u32 phy_type;
-	const struct qcom_uniphy_pcie_regs *init_seq;
+	const struct qcom_uniphy_regs *init_seq;
 	u32 init_seq_num;
 	u32 pipe_clk_rate;
 };
 
-struct qcom_uniphy_pcie {
+struct qcom_uniphy {
 	struct phy phy;
 	struct device *dev;
-	const struct qcom_uniphy_pcie_data *data;
+	const struct qcom_uniphy_data *data;
 	struct clk_bulk_data *clks;
 	int num_clks;
 	struct reset_control *resets;
@@ -73,9 +73,9 @@ struct qcom_uniphy_pcie {
 	int lanes;
 };
 
-#define phy_to_dw_phy(x)	container_of((x), struct qca_uni_pcie_phy, phy)
+#define phy_to_dw_phy(x)	container_of((x), struct qcom_uniphy, phy)
 
-static const struct qcom_uniphy_pcie_regs ipq5018_regs[] = {
+static const struct qcom_uniphy_regs ipq5018_pcie_regs[] = {
 	{
 		.offset = SSCG_CTRL_REG_4,
 		.val = 0x1cb9,
@@ -109,7 +109,7 @@ static const struct qcom_uniphy_pcie_regs ipq5018_regs[] = {
 	},
 };
 
-static const struct qcom_uniphy_pcie_regs ipq5332_regs[] = {
+static const struct qcom_uniphy_regs ipq5332_pcie_regs[] = {
 	{
 		.offset = PHY_CFG_PLLCFG,
 		.val = 0x30,
@@ -122,26 +122,26 @@ static const struct qcom_uniphy_pcie_regs ipq5332_regs[] = {
 	},
 };
 
-static const struct qcom_uniphy_pcie_data ipq5018_data = {
+static const struct qcom_uniphy_data ipq5018_pcie_data = {
 	.lane_offset	= 0x800,
 	.phy_type	= PHY_TYPE_PCIE_GEN2,
-	.init_seq	= ipq5018_regs,
-	.init_seq_num	= ARRAY_SIZE(ipq5018_regs),
+	.init_seq	= ipq5018_pcie_regs,
+	.init_seq_num	= ARRAY_SIZE(ipq5018_pcie_regs),
 	.pipe_clk_rate	= 125 * MEGA,
 };
 
-static const struct qcom_uniphy_pcie_data ipq5332_data = {
+static const struct qcom_uniphy_data ipq5332_pcie_data = {
 	.lane_offset	= 0x800,
 	.phy_type	= PHY_TYPE_PCIE_GEN3,
-	.init_seq	= ipq5332_regs,
-	.init_seq_num	= ARRAY_SIZE(ipq5332_regs),
+	.init_seq	= ipq5332_pcie_regs,
+	.init_seq_num	= ARRAY_SIZE(ipq5332_pcie_regs),
 	.pipe_clk_rate	= 250 * MEGA,
 };
 
-static void qcom_uniphy_pcie_init(struct qcom_uniphy_pcie *phy)
+static void qcom_uniphy_pcie_usb3_init(struct qcom_uniphy *phy)
 {
-	const struct qcom_uniphy_pcie_data *data = phy->data;
-	const struct qcom_uniphy_pcie_regs *init_seq;
+	const struct qcom_uniphy_data *data = phy->data;
+	const struct qcom_uniphy_regs *init_seq;
 	void __iomem *base = phy->base;
 	int lane, i;
 
@@ -157,7 +157,7 @@ static void qcom_uniphy_pcie_init(struct qcom_uniphy_pcie *phy)
 
 static int qcom_uniphy_pcie_power_off(struct phy *x)
 {
-	struct qcom_uniphy_pcie *phy = phy_get_drvdata(x);
+	struct qcom_uniphy *phy = phy_get_drvdata(x);
 
 	clk_bulk_disable_unprepare(phy->num_clks, phy->clks);
 
@@ -166,7 +166,7 @@ static int qcom_uniphy_pcie_power_off(struct phy *x)
 
 static int qcom_uniphy_pcie_power_on(struct phy *x)
 {
-	struct qcom_uniphy_pcie *phy = phy_get_drvdata(x);
+	struct qcom_uniphy *phy = phy_get_drvdata(x);
 	int ret;
 
 	ret = reset_control_assert(phy->resets);
@@ -193,13 +193,13 @@ static int qcom_uniphy_pcie_power_on(struct phy *x)
 
 	usleep_range(CLK_EN_DELAY_MIN_US, CLK_EN_DELAY_MAX_US);
 
-	qcom_uniphy_pcie_init(phy);
+	qcom_uniphy_pcie_usb3_init(phy);
 
 	return 0;
 }
 
-static inline int qcom_uniphy_pcie_get_resources(struct platform_device *pdev,
-						 struct qcom_uniphy_pcie *phy)
+static inline int qcom_uniphy_pcie_usb3_get_resources(struct platform_device *pdev,
+						      struct qcom_uniphy *phy)
 {
 	struct resource *res;
 
@@ -236,9 +236,9 @@ static inline int qcom_uniphy_pcie_get_resources(struct platform_device *pdev,
  *    clk  |   +-------+   |                   +-----+
  *         +---------------+
  */
-static inline int phy_pipe_clk_register(struct qcom_uniphy_pcie *phy, int id)
+static inline int phy_pipe_clk_register(struct qcom_uniphy *phy, int id)
 {
-	const struct qcom_uniphy_pcie_data *data = phy->data;
+	const struct qcom_uniphy_data *data = phy->data;
 	struct clk_hw *hw;
 	char name[64];
 
@@ -252,30 +252,29 @@ static inline int phy_pipe_clk_register(struct qcom_uniphy_pcie *phy, int id)
 	return devm_of_clk_add_hw_provider(phy->dev, of_clk_hw_simple_get, hw);
 }
 
-static const struct of_device_id qcom_uniphy_pcie_id_table[] = {
+static const struct of_device_id qcom_uniphy_pcie_usb3_id_table[] = {
 	{
 		.compatible = "qcom,ipq5018-uniphy-pcie-phy",
-		.data = &ipq5018_data,
+		.data = &ipq5018_pcie_data,
 	}, {
 		.compatible = "qcom,ipq5332-uniphy-pcie-phy",
-		.data = &ipq5332_data,
-	}, {
-		/* Sentinel */
+		.data = &ipq5332_pcie_data,
 	},
+	{ },
 };
-MODULE_DEVICE_TABLE(of, qcom_uniphy_pcie_id_table);
+MODULE_DEVICE_TABLE(of, qcom_uniphy_pcie_usb3_id_table);
 
-static const struct phy_ops pcie_ops = {
+static const struct phy_ops qcom_uniphy_pcie_ops = {
 	.power_on	= qcom_uniphy_pcie_power_on,
 	.power_off	= qcom_uniphy_pcie_power_off,
 	.owner          = THIS_MODULE,
 };
 
-static int qcom_uniphy_pcie_probe(struct platform_device *pdev)
+static int qcom_uniphy_pcie_usb3_probe(struct platform_device *pdev)
 {
 	struct phy_provider *phy_provider;
 	struct device *dev = &pdev->dev;
-	struct qcom_uniphy_pcie *phy;
+	struct qcom_uniphy *phy;
 	struct phy *generic_phy;
 	int ret;
 
@@ -294,12 +293,12 @@ static int qcom_uniphy_pcie_probe(struct platform_device *pdev)
 	if (ret)
 		return dev_err_probe(dev, ret, "Couldn't read num-lanes\n");
 
-	ret = qcom_uniphy_pcie_get_resources(pdev, phy);
+	ret = qcom_uniphy_pcie_usb3_get_resources(pdev, phy);
 	if (ret < 0)
 		return dev_err_probe(&pdev->dev, ret,
 				     "failed to get resources: %d\n", ret);
 
-	generic_phy = devm_phy_create(phy->dev, NULL, &pcie_ops);
+	generic_phy = devm_phy_create(phy->dev, NULL, &qcom_uniphy_pcie_ops);
 	if (IS_ERR(generic_phy))
 		return PTR_ERR(generic_phy);
 
@@ -317,15 +316,15 @@ static int qcom_uniphy_pcie_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static struct platform_driver qcom_uniphy_pcie_driver = {
-	.probe		= qcom_uniphy_pcie_probe,
+static struct platform_driver qcom_uniphy_pcie_usb3_driver = {
+	.probe		= qcom_uniphy_pcie_usb3_probe,
 	.driver		= {
-		.name	= "qcom-uniphy-pcie",
-		.of_match_table = qcom_uniphy_pcie_id_table,
+		.name	= "qcom-uniphy-pcie-usb3-28lp",
+		.of_match_table = qcom_uniphy_pcie_usb3_id_table,
 	},
 };
 
-module_platform_driver(qcom_uniphy_pcie_driver);
+module_platform_driver(qcom_uniphy_pcie_usb3_driver);
 
-MODULE_DESCRIPTION("PCIE QCOM UNIPHY driver");
+MODULE_DESCRIPTION("Qualcomm IPQ5332 UNIPHY PCIe USB3 28LP PHY driver");
 MODULE_LICENSE("GPL");

-- 
2.53.0


