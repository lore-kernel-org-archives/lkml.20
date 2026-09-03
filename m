Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF9B84B5CDD;
	Thu,  3 Sep 2026 14:26:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788445592; cv=none; b=QRJ0h9wBhdr3nb1LaKjaHiUTzU3Q4c5GrJu/EQeZRkMVzKfnl0lUpzLPv7Gm0d/7z91oKYYGUg/6F6MOwy0QuQQgkhRDH1WYyORDOwFTi03e/vS3/P7pygvEGMalv5//3GHB0qKTmqUS3+VmgeIRXVPejN9uH7+Fp7r/3GXKiCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788445592; c=relaxed/simple;
	bh=lYU+JaKTrxz/zR7uUr+TS+iFPeWmv8zTUgaDNZhq4Ww=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=E3PBCYMqfgMnxb0yBE7+TJi8DDZnE6p/B250yOaqa1M2nzurQoSm9WkJ6ApXNoM0xQHWf0/eKSToTxh2aMq8M++ursECbFY7jnHdcz5qPsBjidJBsDqijMJqqj23qoUojj5K+qX8SRb/lpRWli5xouxJDae7KpyK+VNpa2KQ0uI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VLfuWzI6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VLfuWzI6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5678F1F00ADB;
	Thu,  3 Sep 2026 14:26:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788445568;
	bh=SKbhH/yJev4U5qDLNZLWqB0aqWQtOQabQFXAP6Qz4ZM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=VLfuWzI6M1UuqhSFzrwxPTwogZdJepASYShqF9suC2kJCMxqIMmaNd4qOy3QODtA0
	 N7Evhsuo5dteNxEOvh/1REpp4l6wGpiuswNIWM065A9Q/WkUlOzHs7ucS7jU36gJvp
	 40aq3AXt2BHM681EPP9j7bdwfb0W+nC0CfT3bvainCK8v0IjOqW0UKA3Xq04EZ37bZ
	 zYW4ceYsUS+TtnqrnQ3kojcaXqm8bU/VzMXP5mB/Q7VBp2cJY+lr6bfwcoqhjilOs8
	 VAhGAfEOnKoj/lmb6cjzMuNudQ2ipTx9yXarJuebADtlPjftWirFDx7Q6og4HNf9x2
	 ckcLgl6d7arGQ==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Thu, 03 Sep 2026 16:25:30 +0200
Subject: [PATCH v2 3/5] phy: qcom-qusb2: Remove _SHIFT defines
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260903-topic-8996_61x5_qusb2phy-v2-3-4c3f980a4560@oss.qualcomm.com>
References: <20260903-topic-8996_61x5_qusb2phy-v2-0-4c3f980a4560@oss.qualcomm.com>
In-Reply-To: <20260903-topic-8996_61x5_qusb2phy-v2-0-4c3f980a4560@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Wesley Cheng <quic_wcheng@quicinc.com>, 
 Iskren Chernev <me@iskren.info>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788445548; l=4069;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=4DL9fcjNJk7MXfdTRYqW0Ax5xXaUgoYEFk4XUmKw5UU=;
 b=g89we8bc/8i+YUYaw4/Sk3483pnzT5w6gOwN4vI6135tJvnm4rvE6ejUvo4/zfwraCo173kyS
 736OzQNDRJnAO1J/Pl7HTu170TPorpJdcjnqmoFB2d8FJMDBKN2/7Rh
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

These are unnecessary as they may be inferred from the mask. Drop them.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qusb2.c | 33 +++++++++++++++------------------
 1 file changed, 15 insertions(+), 18 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qusb2.c b/drivers/phy/qualcomm/phy-qcom-qusb2.c
index aac36ed994b1..50c60d56d447 100644
--- a/drivers/phy/qualcomm/phy-qcom-qusb2.c
+++ b/drivers/phy/qualcomm/phy-qcom-qusb2.c
@@ -3,6 +3,7 @@
  * Copyright (c) 2017, 2019, The Linux Foundation. All rights reserved.
  */
 
+#include <linux/bitfield.h>
 #include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/err.h>
@@ -64,26 +65,20 @@
 
 /* QUSB2PHY_IMP_CTRL1 register bits */
 #define IMP_RES_OFFSET_MASK			GENMASK(5, 0)
-#define IMP_RES_OFFSET_SHIFT			0x0
 
 /* QUSB2PHY_PLL_BIAS_CONTROL_2 register bits */
 #define BIAS_CTRL2_RES_OFFSET_MASK		GENMASK(5, 0)
-#define BIAS_CTRL2_RES_OFFSET_SHIFT		0x0
 
 /* QUSB2PHY_CHG_CONTROL_2 register bits */
 #define CHG_CTRL2_OFFSET_MASK			GENMASK(5, 4)
-#define CHG_CTRL2_OFFSET_SHIFT			0x4
 
 /* QUSB2PHY_PORT_TUNE1 register bits */
 #define HSTX_TRIM_MASK				GENMASK(7, 4)
-#define HSTX_TRIM_SHIFT				0x4
 #define PREEMPH_WIDTH_HALF_BIT			BIT(2)
 #define PREEMPHASIS_EN_MASK			GENMASK(1, 0)
-#define PREEMPHASIS_EN_SHIFT			0x0
 
 /* QUSB2PHY_PORT_TUNE2 register bits */
 #define HSDISC_TRIM_MASK			GENMASK(1, 0)
-#define HSDISC_TRIM_SHIFT			0x0
 
 #define QUSB2PHY_PLL_ANALOG_CONTROLS_TWO	0x04
 #define QUSB2PHY_PLL_CLOCK_INVERTERS		0x18c
@@ -545,28 +540,28 @@ static void qusb2_phy_override_phy_params(struct qusb2_phy *qphy)
 
 	if (or->imp_res_offset.override)
 		qusb2_write_mask(qphy->base, QUSB2PHY_IMP_CTRL1,
-		or->imp_res_offset.value << IMP_RES_OFFSET_SHIFT,
-			     IMP_RES_OFFSET_MASK);
+				 FIELD_PREP(IMP_RES_OFFSET_MASK, or->imp_res_offset.value),
+				 IMP_RES_OFFSET_MASK);
 
 	if (or->bias_ctrl.override)
 		qusb2_write_mask(qphy->base, QUSB2PHY_PLL_BIAS_CONTROL_2,
-		or->bias_ctrl.value << BIAS_CTRL2_RES_OFFSET_SHIFT,
-			   BIAS_CTRL2_RES_OFFSET_MASK);
+				 FIELD_PREP(BIAS_CTRL2_RES_OFFSET_MASK, or->bias_ctrl.value),
+				 BIAS_CTRL2_RES_OFFSET_MASK);
 
 	if (or->charge_ctrl.override)
 		qusb2_write_mask(qphy->base, QUSB2PHY_CHG_CTRL2,
-		or->charge_ctrl.value << CHG_CTRL2_OFFSET_SHIFT,
-			     CHG_CTRL2_OFFSET_MASK);
+				 FIELD_PREP(CHG_CTRL2_OFFSET_MASK, or->charge_ctrl.value),
+				 CHG_CTRL2_OFFSET_MASK);
 
 	if (or->hstx_trim.override)
 		qusb2_write_mask(qphy->base, cfg->regs[QUSB2PHY_PORT_TUNE1],
-		or->hstx_trim.value << HSTX_TRIM_SHIFT,
+				 FIELD_PREP(HSTX_TRIM_MASK, or->hstx_trim.value),
 				 HSTX_TRIM_MASK);
 
 	if (or->preemphasis.override)
 		qusb2_write_mask(qphy->base, cfg->regs[QUSB2PHY_PORT_TUNE1],
-		or->preemphasis.value << PREEMPHASIS_EN_SHIFT,
-				PREEMPHASIS_EN_MASK);
+				 FIELD_PREP(PREEMPHASIS_EN_MASK, or->preemphasis.value),
+				 PREEMPHASIS_EN_MASK);
 
 	if (or->preemphasis_width.override) {
 		if (or->preemphasis_width.value ==
@@ -582,7 +577,7 @@ static void qusb2_phy_override_phy_params(struct qusb2_phy *qphy)
 
 	if (or->hsdisc_trim.override)
 		qusb2_write_mask(qphy->base, cfg->regs[QUSB2PHY_PORT_TUNE2],
-		or->hsdisc_trim.value << HSDISC_TRIM_SHIFT,
+				 FIELD_PREP(HSDISC_TRIM_MASK, or->hsdisc_trim.value),
 				 HSDISC_TRIM_MASK);
 }
 
@@ -623,10 +618,12 @@ static void qusb2_phy_set_tune2_param(struct qusb2_phy *qphy)
 	/* Fused TUNE1/2 value is the higher nibble only */
 	if (cfg->update_tune1_with_efuse)
 		qusb2_write_mask(qphy->base, cfg->regs[QUSB2PHY_PORT_TUNE1],
-				 hstx_trim << HSTX_TRIM_SHIFT, HSTX_TRIM_MASK);
+				 FIELD_PREP(HSTX_TRIM_MASK, hstx_trim),
+				 HSTX_TRIM_MASK);
 	else
 		qusb2_write_mask(qphy->base, cfg->regs[QUSB2PHY_PORT_TUNE2],
-				 hstx_trim << HSTX_TRIM_SHIFT, HSTX_TRIM_MASK);
+				 FIELD_PREP(HSTX_TRIM_MASK, hstx_trim),
+				 HSTX_TRIM_MASK);
 }
 
 static int qusb2_phy_set_mode(struct phy *phy,

-- 
2.55.0

