Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40D5B37C91A;
	Thu,  3 Sep 2026 07:45:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788421504; cv=none; b=FX4itBxbPNFvYgJAfl01aB7y31ao//oNiFRAYY6LUCui2JTzLQs4I0a9qXms6FGoXHxwcx5WU4eWavPo2mp9/6RlmedgOCup9rBtp5FdG03UNCqgU7UTxDis6/79tbYWTMkodFEOi3FS7C6yERKuD7gaVm86M1sPTu+oRyx7JkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788421504; c=relaxed/simple;
	bh=kS9hBvEnub4T8BBVzWvcNqVlbIGs4T0V19rdUI622ho=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ewXo5RPZ60WIsyKfRlhZNtroUR/04KPS2v3Lh4Jwp4kHLNAPtRYBqXzzHwPPLvsbe1iy9KDF3O3lzthCudwmmklmXwcQ+wsNIRVzheT9VaXg+QnvBruPiLMcxKTtF/HF5Na8Q3wUaerYFwnCHZkKBGrberv4JHflLLjsZqjdDZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oiV5P7RF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oiV5P7RF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FA501F00A3A;
	Thu,  3 Sep 2026 07:45:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788421502;
	bh=jTVsXyCyd/ITERAQodc/uN9iLucTh/CC3iRqkUE9r4Y=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=oiV5P7RFriDM4AK6IcTIyNfxj42vzYdqfWSpq5SWf91E5KpDJBPZ9o5uVA2EziyTs
	 4kiyVbvWCjERhwEGo1PHSNopyCt/80anI17liGQyP93Pad4mNdupvsONX1Vf0y8b8R
	 MAO1jyLYZKY8578v8xoT1Z5PwX9xvesrbniEiSG2iTi1lCLl/XfYbIA545TjK8VrUq
	 WqZqUuaVwgAezQTStQxIaIKxKzfmkznUULs0h61Sph/sxlHf8W52kJp1t4SEkVpgX0
	 bID2V5EgFX2/a/dp6tYvD7JwuLeIBxc2I+kEbEHf008+dnY2y3sykCVzm6RVN9bYxN
	 c2ZlnpqQjnNCg==
From: Mattijs Korpershoek <mkorpershoek@kernel.org>
Date: Thu, 03 Sep 2026 09:44:48 +0200
Subject: [PATCH v5 2/2] phy: qcom: qmp-usb: Add support for SA8255P
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260903-phy-qcom-qmp-usb-8255-v5-2-e251e22b341e@kernel.org>
References: <20260903-phy-qcom-qmp-usb-8255-v5-0-e251e22b341e@kernel.org>
In-Reply-To: <20260903-phy-qcom-qmp-usb-8255-v5-0-e251e22b341e@kernel.org>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Maxime Ripard <mripard@kernel.org>, linux-arm-msm@vger.kernel.org, 
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Mattijs Korpershoek <mkorpershoek@kernel.org>, 
 Sriram Dash <quic_sriramd@quicinc.com>, 
 Shazad Hussain <quic_shazhuss@quicinc.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=9977;
 i=mkorpershoek@kernel.org; h=from:subject:message-id;
 bh=TF5/Okug9K3vpQ6CRVYqAgk/thHNSNOiZPwXOyJ1KZw=;
 b=owEBbQGS/pANAwAKARkNHbRmThk1AcsmYgBqmSV2FxdSes3DqLAWwWw5adZX6WR86WeQRJOZU
 ALA6ZpX17SJATMEAAEKAB0WIQQu6UKnth9qvlMTrQAZDR20Zk4ZNQUCapkldgAKCRAZDR20Zk4Z
 NQ9eB/9Mq/NmU9RnXUf8ZWPn1S8w471AFeZ7jtsL2W+9w3sbRhFjj+yJifnVPIfHgPeg5v4KKPQ
 lQJY6Ny1QHmMFPpr3LphodLytQ8PKhwqec/+vD8A6d4VSjw3CKqfpwsAtq7k+YFeFzHFbs8JNtm
 UIkyRNd6SX0NYSoph4QZrBfUpqjUArPf+yB11vCSAn5PQfvWAFHaCegWXr6s8Q6AHtxhplePQir
 EoiYSQASywicKXFpdPFI0I2Rz1pWFkb5FZgWv3YLWoKagROcs0wh/Ntp791eAPHK9z7dFIJ+dcT
 cmRSKMYO9ds73vkYUaSqe6+8U7WbWSWdmVUMiNjGsy14ROyd
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
Signed-off-by: Shazad Hussain <quic_shazhuss@quicinc.com>
Signed-off-by: Mattijs Korpershoek <mkorpershoek@kernel.org>
---
 drivers/phy/qualcomm/phy-qcom-qmp-usb.c | 182 ++++++++++++++++++++++++++++----
 1 file changed, 160 insertions(+), 22 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-usb.c b/drivers/phy/qualcomm/phy-qcom-qmp-usb.c
index b0790bcf0bc8..c18680b60803 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-usb.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-usb.c
@@ -15,6 +15,7 @@
 #include <linux/of_address.h>
 #include <linux/phy/phy.h>
 #include <linux/platform_device.h>
+#include <linux/pm_domain.h>
 #include <linux/regulator/consumer.h>
 #include <linux/reset.h>
 #include <linux/slab.h>
@@ -1411,6 +1412,9 @@ struct qmp_phy_cfg {
 
 	/* Offset from PCS to PCS_USB region */
 	unsigned int pcs_usb_offset;
+
+	/* true, if the device resources are fw managed */
+	bool fw_managed;
 };
 
 struct qmp_usb {
@@ -1439,6 +1443,8 @@ struct qmp_usb {
 	struct phy *phy;
 
 	struct clk_fixed_rate pipe_clk_fixed;
+
+	struct dev_pm_domain_list *pd_list;
 };
 
 static inline void qphy_setbits(void __iomem *base, u32 offset, u32 val)
@@ -1633,6 +1639,25 @@ static const struct qmp_phy_cfg qdu1000_usb3_uniphy_cfg = {
 	.has_pwrdn_delay	= true,
 };
 
+static const struct qmp_phy_cfg sa8255p_usb3_uniphy_cfg = {
+	.offsets		= &qmp_usb_offsets_v5,
+
+	.serdes_tbl		= sc8280xp_usb3_uniphy_serdes_tbl,
+	.serdes_tbl_num		= ARRAY_SIZE(sc8280xp_usb3_uniphy_serdes_tbl),
+	.tx_tbl			= sc8280xp_usb3_uniphy_tx_tbl,
+	.tx_tbl_num		= ARRAY_SIZE(sc8280xp_usb3_uniphy_tx_tbl),
+	.rx_tbl			= sc8280xp_usb3_uniphy_rx_tbl,
+	.rx_tbl_num		= ARRAY_SIZE(sc8280xp_usb3_uniphy_rx_tbl),
+	.pcs_tbl		= sa8775p_usb3_uniphy_pcs_tbl,
+	.pcs_tbl_num		= ARRAY_SIZE(sa8775p_usb3_uniphy_pcs_tbl),
+	.pcs_usb_tbl		= sa8775p_usb3_uniphy_pcs_usb_tbl,
+	.pcs_usb_tbl_num	= ARRAY_SIZE(sa8775p_usb3_uniphy_pcs_usb_tbl),
+	.vreg_list		= NULL,
+	.num_vregs		= 0, /* Regulators are handled by the firmware */
+	.regs			= qmp_v5_usb3phy_regs_layout,
+	.fw_managed		= true,
+};
+
 static const struct qmp_phy_cfg sa8775p_usb3_uniphy_cfg = {
 	.offsets		= &qmp_usb_offsets_v5,
 
@@ -1867,6 +1892,77 @@ static const struct qmp_phy_cfg glymur_usb3_uniphy_cfg = {
 	.regs			= qmp_v7_usb3phy_regs_layout,
 };
 
+static int qmp_usb_domain_attach(struct qmp_usb *qmp)
+{
+	struct dev_pm_domain_attach_data pd_data = {
+		.pd_flags       = PD_FLAG_NO_DEV_LINK,
+		.pd_names       = (const char *[]) { "core", "transfer" },
+		.num_pd_names   = 2,
+	};
+	struct device *dev = qmp->dev;
+	int ret;
+
+	ret = dev_pm_domain_attach_list(dev, &pd_data, &qmp->pd_list);
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "domain attach failed\n");
+
+	return 0;
+}
+
+static void qmp_usb_domain_detach(void *data)
+{
+	struct qmp_usb *qmp = data;
+
+	dev_pm_domain_detach_list(qmp->pd_list);
+}
+
+/* d3_to_d0 transition by turning on all the suppliers */
+static int qmp_usb_d3_to_d0(struct qmp_usb *qmp)
+{
+	int ret;
+
+	if (!qmp->pd_list)
+		return 0;
+
+	ret = pm_runtime_resume_and_get(qmp->pd_list->pd_devs[0]);
+	if (ret)
+		return ret;
+
+	ret = pm_runtime_resume_and_get(qmp->pd_list->pd_devs[1]);
+	if (ret)
+		pm_runtime_put_sync(qmp->pd_list->pd_devs[0]);
+
+	return ret;
+}
+
+/* d0_to_d3 transition by turning off all the suppliers */
+static void qmp_usb_d0_to_d3(struct qmp_usb *qmp)
+{
+	if (!qmp->pd_list)
+		return;
+
+	pm_runtime_put_sync(qmp->pd_list->pd_devs[1]);
+	pm_runtime_put_sync(qmp->pd_list->pd_devs[0]);
+}
+
+/* d1_to_d0 transition by turning on the 'transfer' supplier */
+static int qmp_usb_d1_to_d0(struct qmp_usb *qmp)
+{
+	if (!qmp->pd_list)
+		return 0;
+
+	return pm_runtime_resume_and_get(qmp->pd_list->pd_devs[1]);
+}
+
+/* d0_to_d1 transition by turning off the 'transfer' supplier */
+static void qmp_usb_d0_to_d1(struct qmp_usb *qmp)
+{
+	if (!qmp->pd_list)
+		return;
+
+	pm_runtime_put_sync(qmp->pd_list->pd_devs[1]);
+}
+
 static int qmp_usb_serdes_init(struct qmp_usb *qmp)
 {
 	const struct qmp_phy_cfg *cfg = qmp->cfg;
@@ -1886,10 +1982,16 @@ static int qmp_usb_init(struct phy *phy)
 	void __iomem *pcs = qmp->pcs;
 	int ret;
 
+	ret = qmp_usb_d3_to_d0(qmp);
+	if (ret < 0) {
+		dev_err(qmp->dev, "Failed to transition to d0 state\n");
+		return ret;
+	}
+
 	ret = regulator_bulk_enable(cfg->num_vregs, qmp->vregs);
 	if (ret) {
 		dev_err(qmp->dev, "failed to enable regulators, err=%d\n", ret);
-		return ret;
+		goto err_transition_to_d3;
 	}
 
 	ret = reset_control_bulk_assert(qmp->num_resets, qmp->resets);
@@ -1916,6 +2018,8 @@ static int qmp_usb_init(struct phy *phy)
 	reset_control_bulk_assert(qmp->num_resets, qmp->resets);
 err_disable_regulators:
 	regulator_bulk_disable(cfg->num_vregs, qmp->vregs);
+err_transition_to_d3:
+	qmp_usb_d0_to_d3(qmp);
 
 	return ret;
 }
@@ -1931,6 +2035,8 @@ static int qmp_usb_exit(struct phy *phy)
 
 	regulator_bulk_disable(cfg->num_vregs, qmp->vregs);
 
+	qmp_usb_d0_to_d3(qmp);
+
 	return 0;
 }
 
@@ -2119,6 +2225,8 @@ static int __maybe_unused qmp_usb_runtime_suspend(struct device *dev)
 	clk_disable_unprepare(qmp->pipe_clk);
 	clk_bulk_disable_unprepare(qmp->num_clks, qmp->clks);
 
+	qmp_usb_d0_to_d1(qmp);
+
 	return 0;
 }
 
@@ -2134,14 +2242,23 @@ static int __maybe_unused qmp_usb_runtime_resume(struct device *dev)
 		return 0;
 	}
 
+	ret = qmp_usb_d1_to_d0(qmp);
+	if (ret < 0) {
+		dev_err(qmp->dev, "Failed to transition to d0 state\n");
+		return ret;
+	}
+
 	ret = clk_bulk_prepare_enable(qmp->num_clks, qmp->clks);
-	if (ret)
+	if (ret) {
+		qmp_usb_d0_to_d1(qmp);
 		return ret;
+	}
 
 	ret = clk_prepare_enable(qmp->pipe_clk);
 	if (ret) {
 		dev_err(dev, "pipe_clk enable failed, err=%d\n", ret);
 		clk_bulk_disable_unprepare(qmp->num_clks, qmp->clks);
+		qmp_usb_d0_to_d1(qmp);
 		return ret;
 	}
 
@@ -2321,10 +2438,12 @@ static int qmp_usb_parse_dt_legacy(struct qmp_usb *qmp, struct device_node *np)
 		qmp->pcs_misc = NULL;
 	}
 
-	qmp->pipe_clk = devm_get_clk_from_child(dev, np, NULL);
-	if (IS_ERR(qmp->pipe_clk)) {
-		return dev_err_probe(dev, PTR_ERR(qmp->pipe_clk),
-				     "failed to get pipe clock\n");
+	if (!qmp->cfg->fw_managed) {
+		qmp->pipe_clk = devm_get_clk_from_child(dev, np, NULL);
+		if (IS_ERR(qmp->pipe_clk)) {
+			return dev_err_probe(dev, PTR_ERR(qmp->pipe_clk),
+					     "failed to get pipe clock\n");
+		}
 	}
 
 	ret = devm_clk_bulk_get_all(qmp->dev, &qmp->clks);
@@ -2333,10 +2452,12 @@ static int qmp_usb_parse_dt_legacy(struct qmp_usb *qmp, struct device_node *np)
 
 	qmp->num_clks = ret;
 
-	ret = qmp_usb_reset_init(qmp, usb3phy_legacy_reset_l,
-				 ARRAY_SIZE(usb3phy_legacy_reset_l));
-	if (ret)
-		return ret;
+	if (!qmp->cfg->fw_managed) {
+		ret = qmp_usb_reset_init(qmp, usb3phy_legacy_reset_l,
+					 ARRAY_SIZE(usb3phy_legacy_reset_l));
+		if (ret)
+			return ret;
+	}
 
 	return 0;
 }
@@ -2370,17 +2491,19 @@ static int qmp_usb_parse_dt(struct qmp_usb *qmp)
 	if (ret)
 		return ret;
 
-	qmp->pipe_clk = devm_clk_get(dev, "pipe");
-	if (IS_ERR(qmp->pipe_clk)) {
-		return dev_err_probe(dev, PTR_ERR(qmp->pipe_clk),
-				     "failed to get pipe clock\n");
+	if (!qmp->cfg->fw_managed) {
+		qmp->pipe_clk = devm_clk_get(dev, "pipe");
+		if (IS_ERR(qmp->pipe_clk)) {
+			return dev_err_probe(dev, PTR_ERR(qmp->pipe_clk),
+					     "failed to get pipe clock\n");
+		}
+
+		ret = qmp_usb_reset_init(qmp, usb3phy_reset_l,
+					 ARRAY_SIZE(usb3phy_reset_l));
+		if (ret)
+			return ret;
 	}
 
-	ret = qmp_usb_reset_init(qmp, usb3phy_reset_l,
-				 ARRAY_SIZE(usb3phy_reset_l));
-	if (ret)
-		return ret;
-
 	return 0;
 }
 
@@ -2403,6 +2526,16 @@ static int qmp_usb_probe(struct platform_device *pdev)
 	if (!qmp->cfg)
 		return -EINVAL;
 
+	if (qmp->cfg->fw_managed) {
+		ret = qmp_usb_domain_attach(qmp);
+		if (ret)
+			return ret;
+
+		ret = devm_add_action_or_reset(dev, qmp_usb_domain_detach, qmp);
+		if (ret)
+			return ret;
+	}
+
 	ret = devm_regulator_bulk_get_const(dev, qmp->cfg->num_vregs,
 					qmp->cfg->vreg_list, &qmp->vregs);
 	if (ret)
@@ -2435,9 +2568,11 @@ static int qmp_usb_probe(struct platform_device *pdev)
 	 */
 	pm_runtime_forbid(dev);
 
-	ret = phy_pipe_clk_register(qmp, np);
-	if (ret)
-		goto err_pm_put;
+	if (!qmp->cfg->fw_managed) {
+		ret = phy_pipe_clk_register(qmp, np);
+		if (ret)
+			goto err_pm_put;
+	}
 
 	qmp->phy = devm_phy_create(dev, np, &qmp_usb_phy_ops);
 	if (IS_ERR(qmp->phy)) {
@@ -2492,6 +2627,9 @@ static const struct of_device_id qmp_usb_of_match_table[] = {
 	}, {
 		.compatible = "qcom,qdu1000-qmp-usb3-uni-phy",
 		.data = &qdu1000_usb3_uniphy_cfg,
+	}, {
+		.compatible = "qcom,sa8255p-qmp-usb3-uni-phy",
+		.data = &sa8255p_usb3_uniphy_cfg,
 	}, {
 		.compatible = "qcom,sa8775p-qmp-usb3-uni-phy",
 		.data = &sa8775p_usb3_uniphy_cfg,

-- 
2.55.0

