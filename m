Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FEDD3876A0;
	Fri, 16 Oct 2026 14:56:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792162572; cv=none; b=Cit7KRoCTSCfjQQWmCzictqwVVrdDP7Iv7Xt7cTpGTHnMQSiJGQggAy4nhPyfJnYvHc0OePTNiIIgDLtZfc9Ktc8tmfj7He0TIn/PzjqCwpTjzynmvnqJsM+FhfSy3N4c2bsg1o1C3OYQLPea5dRftcGsJDgMRKylxTfgbfpTbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792162572; c=relaxed/simple;
	bh=ctStdelPIUVc7VW6eWcZJlQ+36ihtcbruWdKm/IRbJ0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mt8X2CZc1Bnv1pIYXkcRgyB6t1Jj2yeDdf30LerphdJm8SC+PDsAMcbo/1U1PlNgyIXch+NI9aazIbG23FW6z/jID1BnVog1mYqHFshTBIOOeUREJKnJpYb7X0J9jD2zB4fcEGUk7RiXj+5FJaFWjG+XTDsQLPTJaOuc+P7+s4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hItC4af0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hItC4af0"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5BB07C2BCFC;
	Fri, 16 Oct 2026 14:56:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1792162572;
	bh=ctStdelPIUVc7VW6eWcZJlQ+36ihtcbruWdKm/IRbJ0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=hItC4af0oSg/HMj79OqJkifEghupwcEX4yyPuxe92oeLpStZnLBz0XtnHZ47XsHoH
	 Ujr622b5JOUWv5SYSCJ5emp8MgmvsHgomXQ6tKOjAnKclzm4elfKbjqRuyNvEAFZjY
	 eTokADNfACz/8ccWAuwnT9+ezRcFfYlnTQCLnWzcEwyllA+Na+fZwekcQpWxohnEHY
	 M8v9ymvKNgVB+pf/oLMoOmDi8G69+Dwxh+UFOJY4iGTZ6HpzQEnaVU1rmMACOCasHN
	 fvp8a5RRVXRFbJyJu+ORWcMJzauK/Ap23EH8QIxXWMHE+onOccJw8BoxpmAJuUNLdD
	 mSpaFTEkOHR2g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38F0BCC6B38;
	Fri, 16 Oct 2026 14:56:12 +0000 (UTC)
From: George Neacsu via B4 Relay <devnull+geocausa.gmail.com@kernel.org>
Date: Fri, 16 Oct 2026 15:56:11 +0100
Subject: [PATCH v3 1/6] phy: Add MIPI C-PHY mode and configuration options
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-x1e-cphy-rfc-v3-1-40a346a72153@gmail.com>
References: <20261016-x1e-cphy-rfc-v3-0-40a346a72153@gmail.com>
In-Reply-To: <20261016-x1e-cphy-rfc-v3-0-40a346a72153@gmail.com>
To: Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
 David Heidelberg <david@ixit.cz>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>, 
 Vikram Sharma <vikram.sharma@oss.qualcomm.com>, 
 Suresh Vankadara <svankada@qti.qualcomm.com>, tjose@qti.qualcomm.com, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, linux-phy@lists.infradead.org, 
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 George Neacsu <geocausa@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792162570; l=2907;
 i=geocausa@gmail.com; s=20261015; h=from:subject:message-id;
 bh=36uZ+JScSYFLwexM/kC6X4AHkDlZ/9zLHIZ2E9kp+04=;
 b=R3n9/fFP8SEKy/tEs43CfcYQIzGpRgt3AwVdDMRQLH8c8JT8ATg3b6NnKTNhQffP8hftvk43w
 Dr68UEtadiCAG10tfOVlY/eM2WDrkmt3CoSXXxcZZ8sSLIs9EIG39a+
X-Developer-Key: i=geocausa@gmail.com; a=ed25519;
 pk=KyQk/iWbxsikewDBh0SwlHI51RvAqahD3loqmRp9DVI=
X-Endpoint-Received: by B4 Relay for geocausa@gmail.com/20261015 with
 auth_id=1199
X-Original-From: George Neacsu <geocausa@gmail.com>
Reply-To: geocausa@gmail.com

From: George Neacsu <geocausa@gmail.com>

The generic PHY framework has a mode and configuration options for MIPI
D-PHY but none for C-PHY, so a CSI-2 receiver has no way to ask a PHY
that does both for C-PHY. Add PHY_MODE_MIPI_CPHY and struct
phy_configure_opts_mipi_cphy. The options are the two values a receiver
knows: the symbol rate on each trio and the number of trios.

The first user is the Qualcomm CSI2 PHY, whose X1E80100 instances carry
the C-PHY front camera of the Surface Pro 11.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: George Neacsu <geocausa@gmail.com>
---
 include/linux/phy/phy-mipi-cphy.h | 29 +++++++++++++++++++++++++++++
 include/linux/phy/phy.h           |  5 +++++
 2 files changed, 34 insertions(+)

diff --git a/include/linux/phy/phy-mipi-cphy.h b/include/linux/phy/phy-mipi-cphy.h
new file mode 100644
index 0000000000..9b748d577b
--- /dev/null
+++ b/include/linux/phy/phy-mipi-cphy.h
@@ -0,0 +1,29 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef __PHY_MIPI_CPHY_H_
+#define __PHY_MIPI_CPHY_H_
+
+#include <linux/types.h>
+
+/**
+ * struct phy_configure_opts_mipi_cphy - MIPI C-PHY configuration set
+ *
+ * This structure is used to represent the configuration state of a
+ * MIPI C-PHY phy.
+ */
+struct phy_configure_opts_mipi_cphy {
+	/**
+	 * @symbol_rate:
+	 *
+	 * Symbol rate on each trio, in symbols per second.
+	 */
+	u64			symbol_rate;
+
+	/**
+	 * @trios:
+	 *
+	 * Number of active trios.
+	 */
+	u8			trios;
+};
+
+#endif /* __PHY_MIPI_CPHY_H_ */
diff --git a/include/linux/phy/phy.h b/include/linux/phy/phy.h
index c480d6cb42..f123378340 100644
--- a/include/linux/phy/phy.h
+++ b/include/linux/phy/phy.h
@@ -19,6 +19,7 @@
 #include <linux/phy/phy-dp.h>
 #include <linux/phy/phy-hdmi.h>
 #include <linux/phy/phy-lvds.h>
+#include <linux/phy/phy-mipi-cphy.h>
 #include <linux/phy/phy-mipi-dphy.h>
 #include <linux/phy/phy-thunderbolt.h>
 
@@ -42,6 +43,7 @@ enum phy_mode {
 	PHY_MODE_PCIE,
 	PHY_MODE_ETHERNET,
 	PHY_MODE_MIPI_DPHY,
+	PHY_MODE_MIPI_CPHY,
 	PHY_MODE_SATA,
 	PHY_MODE_LVDS,
 	PHY_MODE_DP,
@@ -69,6 +71,8 @@ union phy_notify {
  *
  * @mipi_dphy:	Configuration set applicable for phys supporting
  *		the MIPI_DPHY phy mode.
+ * @mipi_cphy:	Configuration set applicable for phys supporting
+ *		the MIPI_CPHY phy mode.
  * @dp:		Configuration set applicable for phys supporting
  *		the DisplayPort protocol.
  * @lvds:	Configuration set applicable for phys supporting
@@ -78,6 +82,7 @@ union phy_notify {
  */
 union phy_configure_opts {
 	struct phy_configure_opts_mipi_dphy	mipi_dphy;
+	struct phy_configure_opts_mipi_cphy	mipi_cphy;
 	struct phy_configure_opts_dp		dp;
 	struct phy_configure_opts_lvds		lvds;
 	struct phy_configure_opts_hdmi		hdmi;

-- 
2.53.0


