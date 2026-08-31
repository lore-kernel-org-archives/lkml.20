Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E77043DC84C;
	Mon, 31 Aug 2026 09:31:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788168695; cv=none; b=b0Q6fCMgGLoheVJ/mI1wdIE8CAAQ2e9otQLXWMYmOuaUfqhN2+gcXAUAQr8abMqT7cYffXzYnlRK9Wt4khsCFvEEAy15ricaf3VTHnjzoZ18U6jspVM7mHqSgzUZr2mVMJ6DSQrvGzWjYLTH/hA3FF2jsTQGfSazT7nW6ItC+EA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788168695; c=relaxed/simple;
	bh=L8yVAuZ0p7R3TBgw4ucNT2BmgLAyvMjGHOlC5ZAv9+w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BtGTDzKyIWXSyr7KFaKsgp636R2fR8Lwz50Tv5oiq2fRWwk+uHGoYALMndK1ef5HjxBL0xYy5hIMlFJVvuUPRbK41aNPKwqxNumjjkJyA+RTKhwe4oyhxBZuk+TIvREWZaWF00/15E1yrTtrdLrY4EOY8HKbO348YW9bWR5Juac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kmIcq4xw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kmIcq4xw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFB6D1F000E9;
	Mon, 31 Aug 2026 09:31:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788168693;
	bh=rTa8+V70YLvjFs5QyXjGxohUtO9HmQ9CMMNH0V1H63A=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=kmIcq4xwn4Mwy0UTX9sANvsmihZaeD740cawUoT2cNbmA5FSzYWijLnZiy8zaQ1MS
	 bSdYIDqPWGweTVzAW6cNCn7rAkJ65+HLeSz/r25B4plU7UuyBsZpoCfPeJZmJFSRjA
	 oS5Mfdtu7h/EeHyFGDwa9raCHx1DaJ2k3w6p2xenp88TWJkBK6NN1c+h8TTcFpmbHm
	 ZWK639p/9HwSYw5nW4S6H2bDweFmMory4EQGNIE+nP0fPBRony3xofJ0643RNebKVZ
	 qPEL5GeABDh+QJaadOzFzaCJSJef9BP9EYP7G+xYWKMVf/YQk8Pmlcs39LUdk9bupa
	 uGxOpzMFF+C9Q==
From: Mattijs Korpershoek <mkorpershoek@kernel.org>
Date: Mon, 31 Aug 2026 11:31:22 +0200
Subject: [PATCH v2 2/2] phy: qcom-snps-femto-v2: Add support for SA8255P
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260831-phy-qcom-snps-femto-v2-8255-v2-2-dc6197ffde1b@kernel.org>
References: <20260831-phy-qcom-snps-femto-v2-8255-v2-0-dc6197ffde1b@kernel.org>
In-Reply-To: <20260831-phy-qcom-snps-femto-v2-8255-v2-0-dc6197ffde1b@kernel.org>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Mattijs Korpershoek <mkorpershoek@kernel.org>, 
 Sriram Dash <quic_sriramd@quicinc.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=7802;
 i=mkorpershoek@kernel.org; h=from:subject:message-id;
 bh=+SZdJWp4P9AdsdwcvOOjWhPUODlk+eJzoogJOEbmKUk=;
 b=owEBbQGS/pANAwAKARkNHbRmThk1AcsmYgBqlUntiiMYkvsPFW0sFMvEVlCGgBeTIUqPtMAjv
 rFAwAkCV2qJATMEAAEKAB0WIQQu6UKnth9qvlMTrQAZDR20Zk4ZNQUCapVJ7QAKCRAZDR20Zk4Z
 Ne5ZCACoCFvgXBXlpS3KJKqr1tWznt7AsnM/dyMkHe8ap8NJEX1L+A9WNaIgaFcn+YMJLiJOtCs
 4ry048VzhaTliB4nnHOmBBPTh1RlE7jOVd/Z6OYG2uCMzNAnYDmlr0nk9e7UHdAGOwbyr/3hNtr
 0ytIkb1cy+gWg6jONlvkizdXdGjV9/9LVETMiyPMq0aSN0vhViV+BMQz008BcHfW/fGo7GiqueS
 1AV0aCAyNmF8xSfCtELg5avkY7X2caYXYp+mMJDBi8Tdfk13FOAWQFknulVtp+QiCnr1Gb3PJma
 2MOgBS31FhZOR36yBzje+IEK3UUfK9W36r/Yp9ghkGXyVpQB
X-Developer-Key: i=mkorpershoek@kernel.org; a=openpgp;
 fpr=8234A35B45C0D26B31C1A2DA570338B018144F28

From: Sriram Dash <quic_sriramd@quicinc.com>

The Qualcomm automotive SA8255p SoC relies on firmware to configure
platform resources, including clocks, interconnects and TLMM.
The driver requests resources operations over SCMI using power protocols.

The SCMI power protocol enables or disables resources like clocks,
interconnect paths, and TLMM (GPIOs) using runtime PM framework APIs,
such as resume/suspend, to control power on/off.

Power domain "core" controls the GDSC, resets, and TLMM (GPIOs)
whereas power domain "transfer" controls clocks and interconnects.

In this variant, two disjoint sets of resources are modeled against
the power domain suppliers which can be turned on/off to achieve modeled
device states. Two modeled low power states d1 and d3 are supported.

transition: d0 <--> d3  :: both core and transfer suppliers
transition: d0 <--> d1  :: only transfer supplier

Signed-off-by: Sriram Dash <quic_sriramd@quicinc.com>
Signed-off-by: Mattijs Korpershoek <mkorpershoek@kernel.org>
---
 drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c | 127 ++++++++++++++++++++++++--
 1 file changed, 118 insertions(+), 9 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c b/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c
index 980ad1fb1e2e..9fdf7ae681b6 100644
--- a/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c
+++ b/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c
@@ -12,6 +12,7 @@
 #include <linux/of.h>
 #include <linux/phy/phy.h>
 #include <linux/platform_device.h>
+#include <linux/pm_domain.h>
 #include <linux/regmap.h>
 #include <linux/regulator/consumer.h>
 #include <linux/reset.h>
@@ -95,6 +96,7 @@ struct override_param_map {
 	u8 table_size;
 	u8 reg_offset;
 	u8 param_mask;
+	bool fw_managed;
 };
 
 struct phy_override_seq {
@@ -121,6 +123,7 @@ struct phy_override_seq {
  * @phy_initialized: if PHY has been initialized correctly
  * @mode: contains the current mode the PHY is in
  * @update_seq_cfg: tuning parameters for phy init
+ * @pd_list: list of power domains associated with the device
  */
 struct qcom_snps_hsphy {
 	struct device *dev;
@@ -136,8 +139,81 @@ struct qcom_snps_hsphy {
 	bool phy_initialized;
 	enum phy_mode mode;
 	struct phy_override_seq update_seq_cfg[NUM_HSPHY_TUNING_PARAMS];
+
+	struct dev_pm_domain_list *pd_list;
 };
 
+static void qcom_snps_domain_detach(void *data)
+{
+	struct qcom_snps_hsphy *hsphy = data;
+
+	dev_pm_domain_detach_list(hsphy->pd_list);
+}
+
+static int qcom_snps_domain_attach(struct qcom_snps_hsphy *hsphy)
+{
+	struct dev_pm_domain_attach_data pd_data = {
+		.pd_flags       = PD_FLAG_NO_DEV_LINK,
+		.pd_names       = (const char*[]) { "core", "transfer" },
+		.num_pd_names   = 2,
+	};
+	struct device *dev = hsphy->dev;
+	int ret;
+
+	ret = dev_pm_domain_attach_list(dev, &pd_data, &hsphy->pd_list);
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "domain attach failed\n");
+
+	return 0;
+}
+
+/* d3_to_d0 transition by turning on all the suppliers */
+static int qcom_snps_d3_to_d0(struct qcom_snps_hsphy *hsphy)
+{
+	int ret;
+
+	if (!hsphy->pd_list)
+		return 0;
+
+	ret = pm_runtime_resume_and_get(hsphy->pd_list->pd_devs[0]);
+	if (ret)
+		return ret;
+
+	ret = pm_runtime_resume_and_get(hsphy->pd_list->pd_devs[1]);
+	if (ret)
+		pm_runtime_put_sync(hsphy->pd_list->pd_devs[0]);
+
+	return ret;
+}
+
+/* d0_to_d3 transition by turning off all the suppliers */
+static void qcom_snps_d0_to_d3(struct qcom_snps_hsphy *hsphy)
+{
+	if (!hsphy->pd_list)
+		return;
+
+	pm_runtime_put_sync(hsphy->pd_list->pd_devs[1]);
+	pm_runtime_put_sync(hsphy->pd_list->pd_devs[0]);
+}
+
+/* d1_to_d0 transition by turning on the 'transfer' supplier */
+static int qcom_snps_d1_to_d0(struct qcom_snps_hsphy *hsphy)
+{
+	if (!hsphy->pd_list)
+		return 0;
+
+	return pm_runtime_resume_and_get(hsphy->pd_list->pd_devs[1]);
+}
+
+/* d0_to_d1 transition by turning off the 'transfer' supplier */
+static void qcom_snps_d0_to_d1(struct qcom_snps_hsphy *hsphy)
+{
+	if (!hsphy->pd_list)
+		return;
+
+	pm_runtime_put_sync(hsphy->pd_list->pd_devs[1]);
+}
+
 static int qcom_snps_hsphy_clk_init(struct qcom_snps_hsphy *hsphy)
 {
 	struct device *dev = hsphy->dev;
@@ -196,6 +272,8 @@ static int qcom_snps_hsphy_suspend(struct qcom_snps_hsphy *hsphy)
 					   0, USB2_AUTO_RESUME);
 	}
 
+	qcom_snps_d0_to_d1(hsphy);
+
 	return 0;
 }
 
@@ -203,7 +281,7 @@ static int qcom_snps_hsphy_resume(struct qcom_snps_hsphy *hsphy)
 {
 	dev_dbg(&hsphy->phy->dev, "Resume QCOM SNPS PHY, mode\n");
 
-	return 0;
+	return qcom_snps_d1_to_d0(hsphy);
 }
 
 static int __maybe_unused qcom_snps_hsphy_runtime_suspend(struct device *dev)
@@ -316,6 +394,10 @@ static const struct override_param ls_fs_output_impedance_sc7280[] = {
 	{ 1310, 0 },
 };
 
+static const struct override_param_map sa8255p_snps_hs_phy = {
+	.fw_managed = true,
+};
+
 static const struct override_param_map sc7280_snps_7nm_phy[] = {
 	{
 		"qcom,hs-disconnect-bp",
@@ -390,9 +472,15 @@ static int qcom_snps_hsphy_init(struct phy *phy)
 
 	dev_vdbg(&phy->dev, "%s(): Initializing SNPS HS phy\n", __func__);
 
+	ret = qcom_snps_d3_to_d0(hsphy);
+	if (ret < 0) {
+		dev_err(hsphy->dev, "Failed to transition to d0 state\n");
+		return ret;
+	}
+
 	ret = regulator_bulk_enable(ARRAY_SIZE(hsphy->vregs), hsphy->vregs);
 	if (ret)
-		return ret;
+		goto transition_to_d3;
 
 	ret = clk_bulk_prepare_enable(hsphy->num_clks, hsphy->clks);
 	if (ret) {
@@ -472,6 +560,8 @@ static int qcom_snps_hsphy_init(struct phy *phy)
 	clk_bulk_disable_unprepare(hsphy->num_clks, hsphy->clks);
 poweroff_phy:
 	regulator_bulk_disable(ARRAY_SIZE(hsphy->vregs), hsphy->vregs);
+transition_to_d3:
+	qcom_snps_d0_to_d3(hsphy);
 
 	return ret;
 }
@@ -485,6 +575,8 @@ static int qcom_snps_hsphy_exit(struct phy *phy)
 	regulator_bulk_disable(ARRAY_SIZE(hsphy->vregs), hsphy->vregs);
 	hsphy->phy_initialized = false;
 
+	qcom_snps_d0_to_d3(hsphy);
+
 	return 0;
 }
 
@@ -496,6 +588,10 @@ static const struct phy_ops qcom_snps_hsphy_gen_ops = {
 };
 
 static const struct of_device_id qcom_snps_hsphy_of_match_table[] = {
+	{
+		.compatible	= "qcom,sa8255p-usb-hs-phy",
+		.data		= &sa8255p_snps_hs_phy,
+	},
 	{ .compatible	= "qcom,sm8150-usb-hs-phy", },
 	{ .compatible	= "qcom,usb-snps-hs-5nm-phy", },
 	{
@@ -565,6 +661,7 @@ static int qcom_snps_hsphy_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct qcom_snps_hsphy *hsphy;
+	const struct override_param_map *cfg;
 	struct phy_provider *phy_provider;
 	struct phy *generic_phy;
 	int ret, i;
@@ -580,14 +677,26 @@ static int qcom_snps_hsphy_probe(struct platform_device *pdev)
 	if (IS_ERR(hsphy->base))
 		return PTR_ERR(hsphy->base);
 
-	ret = qcom_snps_hsphy_clk_init(hsphy);
-	if (ret)
-		return dev_err_probe(dev, ret, "failed to initialize clocks\n");
+	cfg = of_device_get_match_data(dev);
+
+	if (cfg && cfg->fw_managed) {
+		ret = qcom_snps_domain_attach(hsphy);
+		if (ret)
+			return ret;
+
+		ret = devm_add_action_or_reset(dev, qcom_snps_domain_detach, hsphy);
+		if (ret)
+			return ret;
+	} else {
+		ret = qcom_snps_hsphy_clk_init(hsphy);
+		if (ret)
+			return dev_err_probe(dev, ret, "failed to initialize clocks\n");
 
-	hsphy->phy_reset = devm_reset_control_get_exclusive(&pdev->dev, NULL);
-	if (IS_ERR(hsphy->phy_reset)) {
-		dev_err(dev, "failed to get phy core reset\n");
-		return PTR_ERR(hsphy->phy_reset);
+		hsphy->phy_reset = devm_reset_control_get_exclusive(&pdev->dev, NULL);
+		if (IS_ERR(hsphy->phy_reset)) {
+			dev_err(dev, "failed to get phy core reset\n");
+			return PTR_ERR(hsphy->phy_reset);
+		}
 	}
 
 	num = ARRAY_SIZE(hsphy->vregs);

-- 
2.55.0

