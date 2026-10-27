Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793106015;
	b=mdjVGgK2MY0V8sPN0K4koaWPj5KTRyu5KWLt6z+gFv65b319ODPoVmw1HqKwXby+neJR
	 esngnAdB2W3pPQg4sPg+kW5mj/R5TFpZ2wmRO8jOYPoaNVehq8obRE6LNJv+PeB9WTzfo
	 vjO461gjCjAMzBK12Eapo/bvmlsVpX3KeTI48fkbov820LJVVWiCQQMwlHLIsdAgCW7C/
	 a3C8g9rk3tQKEbrbrPVGRauSdn4Pa8auQjIVH4QcCXxMHpDblfCqTxWpABoHzjCr3o9Ie
	 rwyRCYl+npJLIcezRRB/4YEEq9dD5t6EBqBhXg4h4b9z1jscMsQ7Sg6JprURlrN1zQg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793106015;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=gFIh6WeJFW0C7ye5I8pdoHCMTlq6ifigvMfUGvpQv9Q=;
	b=BSx7wZUnZOYTevZvgkv55Gfc8Az1A7X0x4QwaVA0Dzd9lrA2DBS6d1cfqIRkyG9FpKdK
	 dXBVoplFHtvWBqOZ69VSGlkhlSAADSRfLNRjOOf9JoA8thWvuo5YxrfRMN5mMf3avnVYD
	 KuRtwt5l+7Dcffx1PdZYAbaLHnQV59xRUCfonSLEnALz7tzhK89lU+djhuoqKtBCNcnfZ
	 pqiH3eBZOQGvAN3BC5lmVlqFCO8KYCgb+b/JnhpvQEw5akd6BrUhfIbGfQ6tAymmGaU3M
	 gCAdPbxsWV16XQLHRTBUNIFj6zJAIxn9pXRVau1pYrFlwzsOfAuv7wTpGoERD2pfTzA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="ImLS/4H4";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96786606A338;
	Tue, 27 Oct 2026 13:00:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ImLS/4H4
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EEBE81F01829;
	Tue, 27 Oct 2026 13:00:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793106014;
	bh=gFIh6WeJFW0C7ye5I8pdoHCMTlq6ifigvMfUGvpQv9Q=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=ImLS/4H4Ur5BZ0bMRf7FbkfUEg00BJHOQFV+rHX7bW6P67UOIXNNHTKAR3NkOZCo1
	 RCBqbnfJVyztecO1Zh4QKOjiF0NhRT35E+0rV1uEfu53gn5LT/RnHoPm+64qFseFIk
	 CbH9wpLB8F5JrizWfKnEk6fobk6lr258q90rZxoocsBzGq3WegY1znmRykm7au1PB6
	 3eLw69iOmEDo+QprSYRL+wANykwhV2jYS3MiU3DJRiRoNrWarl0Kkqmz2j3ezhtKkc
	 pM1VD2HMhJ4IIMeAsixSrWDpWo6wjDD9Ez+n1pWsDTqHd+cnGvEjnBQ3Hiykn+wKa+
	 urhl1NY/I/Nrg==
From: Mattijs Korpershoek <mkorpershoek@kernel.org>
Date: Tue, 27 Oct 2026 14:00:05 +0100
Subject: [PATCH v4 2/2] phy: qcom-snps-femto-v2: Add support for SA8255P
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261027-phy-qcom-snps-femto-v2-8255-v4-2-874023825a63@kernel.org>
References: <20261027-phy-qcom-snps-femto-v2-8255-v4-0-874023825a63@kernel.org>
In-Reply-To: <20261027-phy-qcom-snps-femto-v2-8255-v4-0-874023825a63@kernel.org>
To: Vinod Koul <vkoul@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Mattijs Korpershoek <mkorpershoek@kernel.org>, 
 Sriram Dash <quic_sriramd@quicinc.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=11533;
 i=mkorpershoek@kernel.org; h=from:subject:message-id;
 bh=oEPftRTHj3yi6CivFVEZiMGgDcs2b82F6luhlAuuqq8=;
 b=owEBbQGS/pANAwAKARkNHbRmThk1AcsmYgBq4KBXgoJIsKin0dLsKXPP7zbOqSNWC1SRAYBIF
 wWZbxudjeaJATMEAAEKAB0WIQQu6UKnth9qvlMTrQAZDR20Zk4ZNQUCauCgVwAKCRAZDR20Zk4Z
 NUlrCADEChif2+ZMuIZnjBrRKzkoc2dFF0G2XnQFCR6h2Eira3/XLDFfJq/NJZO4difcNlkCmx/
 mg/L406imHkVbp4gNG0FvFnJkK+EC0mimp5dtkzNDOfcRVXBIIAE4AHD4as7sfusMgw7JmXAFq5
 nO4Fy9LBspowmsiGKNqLk+tQQdMy/3Mc3xMo5DExVppEHCNiGGYQd323m9C6HoPXaOWf5XbOBa6
 PkVST62ZFnPLu+Ri/rJpJG6Koy2f+mQjOJh6Dbj5+J/Z+n3H0pBJpd3K3A8TX1RjqTklnKO4eIo
 oKaKGuz3tPRBJMXfTKQEGOKfMl0RPqSQDe+vhOje2AVVtKte
X-Developer-Key: i=mkorpershoek@kernel.org; a=openpgp;
 fpr=8234A35B45C0D26B31C1A2DA570338B018144F28

From: Sriram Dash <quic_sriramd@quicinc.com>

SA8255p platform abstracts resources such as resets, clocks and
regulators in firmware. The SCMI firmware exposes multiple protocols to
control such resources which are identified by protocol_id.

For this USB phy, 2 SCMI protocols are exposed by the firmware:
* power domain management protocol (protocol_id=0x11)
* performance domain management protocol (protocol_id=0x13)

The power domain has 2 indices: 'core' and 'transfer'.
* core controls the regulators, the clocks and the reset
* transfer only controls the clocks

For example, to power on/off the PHY, we should use the 'core' domain.
To disable data transfer and keeping power enabled, we should use the
'transfer' domain.

Add support for the SCMI firmware-managed variant in the driver.

Note: the performance domain (0x13) exposes opaques values (0xa to 0x11)
for which we don't have any information. Since it is not mandatory
for the PHY to be functional, we have ommited it from the driver.

Signed-off-by: Sriram Dash <quic_sriramd@quicinc.com>
Co-developed-by: Mattijs Korpershoek <mkorpershoek@kernel.org>
Signed-off-by: Mattijs Korpershoek <mkorpershoek@kernel.org>
---
 drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c | 253 +++++++++++++++++++++-----
 1 file changed, 204 insertions(+), 49 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c b/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c
index 980ad1fb1e2e..8d17cf093be1 100644
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
@@ -136,8 +139,82 @@ struct qcom_snps_hsphy {
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
+static bool qcom_snps_is_fw_managed(struct qcom_snps_hsphy *hsphy)
+{
+	return hsphy->pd_list != NULL;
+}
+
+static int qcom_snps_pds_enable_all(struct qcom_snps_hsphy *hsphy)
+{
+	int ret;
+
+	if (!qcom_snps_is_fw_managed(hsphy))
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
+static void qcom_snps_pds_disable_all(struct qcom_snps_hsphy *hsphy)
+{
+	if (!qcom_snps_is_fw_managed(hsphy))
+		return;
+
+	pm_runtime_put_sync(hsphy->pd_list->pd_devs[1]);
+	pm_runtime_put_sync(hsphy->pd_list->pd_devs[0]);
+}
+
+static int qcom_snps_pd_enable_transfer(struct qcom_snps_hsphy *hsphy)
+{
+	if (!qcom_snps_is_fw_managed(hsphy))
+		return 0;
+
+	return pm_runtime_resume_and_get(hsphy->pd_list->pd_devs[1]);
+}
+
+static void qcom_snps_pd_disable_transfer(struct qcom_snps_hsphy *hsphy)
+{
+	if (!qcom_snps_is_fw_managed(hsphy))
+		return;
+
+	pm_runtime_put_sync(hsphy->pd_list->pd_devs[1]);
+}
+
 static int qcom_snps_hsphy_clk_init(struct qcom_snps_hsphy *hsphy)
 {
 	struct device *dev = hsphy->dev;
@@ -196,6 +273,8 @@ static int qcom_snps_hsphy_suspend(struct qcom_snps_hsphy *hsphy)
 					   0, USB2_AUTO_RESUME);
 	}
 
+	qcom_snps_pd_disable_transfer(hsphy);
+
 	return 0;
 }
 
@@ -203,7 +282,7 @@ static int qcom_snps_hsphy_resume(struct qcom_snps_hsphy *hsphy)
 {
 	dev_dbg(&hsphy->phy->dev, "Resume QCOM SNPS PHY, mode\n");
 
-	return 0;
+	return qcom_snps_pd_enable_transfer(hsphy);
 }
 
 static int __maybe_unused qcom_snps_hsphy_runtime_suspend(struct device *dev)
@@ -316,6 +395,10 @@ static const struct override_param ls_fs_output_impedance_sc7280[] = {
 	{ 1310, 0 },
 };
 
+static const struct override_param_map sa8255p_snps_hs_phy = {
+	.fw_managed = true,
+};
+
 static const struct override_param_map sc7280_snps_7nm_phy[] = {
 	{
 		"qcom,hs-disconnect-bp",
@@ -383,36 +466,9 @@ static const struct override_param_map sc7280_snps_7nm_phy[] = {
 	{},
 };
 
-static int qcom_snps_hsphy_init(struct phy *phy)
+static void qcom_snps_hsphy_configure(struct qcom_snps_hsphy *hsphy)
 {
-	struct qcom_snps_hsphy *hsphy = phy_get_drvdata(phy);
-	int ret, i;
-
-	dev_vdbg(&phy->dev, "%s(): Initializing SNPS HS phy\n", __func__);
-
-	ret = regulator_bulk_enable(ARRAY_SIZE(hsphy->vregs), hsphy->vregs);
-	if (ret)
-		return ret;
-
-	ret = clk_bulk_prepare_enable(hsphy->num_clks, hsphy->clks);
-	if (ret) {
-		dev_err(&phy->dev, "failed to enable clocks, %d\n", ret);
-		goto poweroff_phy;
-	}
-
-	ret = reset_control_assert(hsphy->phy_reset);
-	if (ret) {
-		dev_err(&phy->dev, "failed to assert phy_reset, %d\n", ret);
-		goto disable_clks;
-	}
-
-	usleep_range(100, 150);
-
-	ret = reset_control_deassert(hsphy->phy_reset);
-	if (ret) {
-		dev_err(&phy->dev, "failed to de-assert phy_reset, %d\n", ret);
-		goto disable_clks;
-	}
+	int i;
 
 	qcom_snps_hsphy_write_mask(hsphy->base, USB2_PHY_USB_PHY_CFG0,
 					UTMI_PHY_CMN_CTRL_OVERRIDE_EN,
@@ -463,7 +519,40 @@ static int qcom_snps_hsphy_init(struct phy *phy)
 
 	qcom_snps_hsphy_write_mask(hsphy->base, USB2_PHY_USB_PHY_CFG0,
 					UTMI_PHY_CMN_CTRL_OVERRIDE_EN, 0);
+}
+
+static int qcom_snps_hsphy_init(struct phy *phy)
+{
+	struct qcom_snps_hsphy *hsphy = phy_get_drvdata(phy);
+	int ret;
+
+	dev_vdbg(&phy->dev, "%s(): Initializing SNPS HS phy\n", __func__);
+
+	ret = regulator_bulk_enable(ARRAY_SIZE(hsphy->vregs), hsphy->vregs);
+	if (ret)
+		return ret;
+
+	ret = clk_bulk_prepare_enable(hsphy->num_clks, hsphy->clks);
+	if (ret) {
+		dev_err(&phy->dev, "failed to enable clocks, %d\n", ret);
+		goto poweroff_phy;
+	}
+
+	ret = reset_control_assert(hsphy->phy_reset);
+	if (ret) {
+		dev_err(&phy->dev, "failed to assert phy_reset, %d\n", ret);
+		goto disable_clks;
+	}
 
+	usleep_range(100, 150);
+
+	ret = reset_control_deassert(hsphy->phy_reset);
+	if (ret) {
+		dev_err(&phy->dev, "failed to de-assert phy_reset, %d\n", ret);
+		goto disable_clks;
+	}
+
+	qcom_snps_hsphy_configure(hsphy);
 	hsphy->phy_initialized = true;
 
 	return 0;
@@ -495,7 +584,46 @@ static const struct phy_ops qcom_snps_hsphy_gen_ops = {
 	.owner		= THIS_MODULE,
 };
 
+
+static int qcom_snps_hsphy_fw_managed_init(struct phy *phy)
+{
+	struct qcom_snps_hsphy *hsphy = phy_get_drvdata(phy);
+	int ret;
+
+	ret = qcom_snps_pds_enable_all(hsphy);
+	if (ret) {
+		dev_err(hsphy->dev, "failed to enable pds, %d\n", ret);
+		return ret;
+	}
+
+	qcom_snps_hsphy_configure(hsphy);
+	hsphy->phy_initialized = true;
+
+	return 0;
+}
+
+static int qcom_snps_hsphy_fw_managed_exit(struct phy *phy)
+{
+	struct qcom_snps_hsphy *hsphy = phy_get_drvdata(phy);
+
+	qcom_snps_pds_disable_all(hsphy);
+	hsphy->phy_initialized = false;
+
+	return 0;
+}
+
+static const struct phy_ops qcom_snps_hsphy_fw_managed_ops = {
+	.init		= qcom_snps_hsphy_fw_managed_init,
+	.exit		= qcom_snps_hsphy_fw_managed_exit,
+	.set_mode	= qcom_snps_hsphy_set_mode,
+	.owner		= THIS_MODULE,
+};
+
 static const struct of_device_id qcom_snps_hsphy_of_match_table[] = {
+	{
+		.compatible	= "qcom,sa8255p-usb-hs-phy",
+		.data		= &sa8255p_snps_hs_phy,
+	},
 	{ .compatible	= "qcom,sm8150-usb-hs-phy", },
 	{ .compatible	= "qcom,usb-snps-hs-5nm-phy", },
 	{
@@ -561,14 +689,42 @@ static void qcom_snps_hsphy_read_override_param_seq(struct device *dev)
 	}
 }
 
+static int qcom_snps_hsphy_init_resources(struct qcom_snps_hsphy *hsphy)
+{
+	struct device *dev = hsphy->dev;
+	int ret, i, num;
+
+	ret = qcom_snps_hsphy_clk_init(hsphy);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to initialize clocks\n");
+
+	hsphy->phy_reset = devm_reset_control_get_exclusive(dev, NULL);
+	if (IS_ERR(hsphy->phy_reset)) {
+		dev_err(dev, "failed to get phy core reset\n");
+		return PTR_ERR(hsphy->phy_reset);
+	}
+
+	num = ARRAY_SIZE(hsphy->vregs);
+	for (i = 0; i < num; i++)
+		hsphy->vregs[i].supply = qcom_snps_hsphy_vreg_names[i];
+
+	ret = devm_regulator_bulk_get(dev, num, hsphy->vregs);
+	if (ret)
+		return dev_err_probe(dev, ret,
+				"failed to get regulator supplies\n");
+
+	return 0;
+}
+
 static int qcom_snps_hsphy_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct qcom_snps_hsphy *hsphy;
+	const struct override_param_map *cfg;
 	struct phy_provider *phy_provider;
+	const struct phy_ops *phy_ops;
 	struct phy *generic_phy;
-	int ret, i;
-	int num;
+	int ret;
 
 	hsphy = devm_kzalloc(dev, sizeof(*hsphy), GFP_KERNEL);
 	if (!hsphy)
@@ -580,24 +736,23 @@ static int qcom_snps_hsphy_probe(struct platform_device *pdev)
 	if (IS_ERR(hsphy->base))
 		return PTR_ERR(hsphy->base);
 
-	ret = qcom_snps_hsphy_clk_init(hsphy);
-	if (ret)
-		return dev_err_probe(dev, ret, "failed to initialize clocks\n");
-
-	hsphy->phy_reset = devm_reset_control_get_exclusive(&pdev->dev, NULL);
-	if (IS_ERR(hsphy->phy_reset)) {
-		dev_err(dev, "failed to get phy core reset\n");
-		return PTR_ERR(hsphy->phy_reset);
-	}
+	cfg = of_device_get_match_data(dev);
 
-	num = ARRAY_SIZE(hsphy->vregs);
-	for (i = 0; i < num; i++)
-		hsphy->vregs[i].supply = qcom_snps_hsphy_vreg_names[i];
+	if (cfg && cfg->fw_managed) {
+		phy_ops = &qcom_snps_hsphy_fw_managed_ops;
+		ret = qcom_snps_domain_attach(hsphy);
+		if (ret)
+			return ret;
 
-	ret = devm_regulator_bulk_get(dev, num, hsphy->vregs);
-	if (ret)
-		return dev_err_probe(dev, ret,
-				     "failed to get regulator supplies\n");
+		ret = devm_add_action_or_reset(dev, qcom_snps_domain_detach, hsphy);
+		if (ret)
+			return ret;
+	} else {
+		phy_ops = &qcom_snps_hsphy_gen_ops;
+		ret = qcom_snps_hsphy_init_resources(hsphy);
+		if (ret)
+			return ret;
+	}
 
 	/*
 	 * Enable runtime PM before creating the PHY, phy_create() only enables
@@ -617,7 +772,7 @@ static int qcom_snps_hsphy_probe(struct platform_device *pdev)
 	 */
 	pm_runtime_forbid(dev);
 
-	generic_phy = devm_phy_create(dev, NULL, &qcom_snps_hsphy_gen_ops);
+	generic_phy = devm_phy_create(dev, NULL, phy_ops);
 	if (IS_ERR(generic_phy)) {
 		ret = PTR_ERR(generic_phy);
 		dev_err(dev, "failed to create phy, %d\n", ret);

-- 
2.56.0

