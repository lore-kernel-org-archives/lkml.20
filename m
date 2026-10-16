Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5895C4078F6;
	Fri, 16 Oct 2026 10:57:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792148270; cv=none; b=jzVpdvqmaLKqpe1cjDwCXs3O39mvpBMeM+Wwkvx0iqqy1w/OZ99lqA6McpGmRHAGpXQ7fe2N5TeDdyhhK3EupWwNtkq30Zr4Si5JYXG4TSz25+e9D8BsMRMsGC3/gJsoTy9PaGEzhTUybQXoxVq5bgeNp+AY7wrKxhus9O34O0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792148270; c=relaxed/simple;
	bh=JfyxnFFnZK2KCioAETLy7tquK+kDyxo4GNHnHr57raE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fT0mMalTJoFpBkobHutfvqICA8X4IYFBICzCwRqZChvOuLhxb5kjjXwxVE/QQ+ySUbmyeVvovaY37/GJiTdXBFFndavKLDs0mo3yE8mayjZtfzQjIIpsprT9b0Hu/BfEXKNENRrW6RVBDsYv/VH6wyU+h3DD8HDA9/FQR1XpHjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Tj9SP/7B; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Tj9SP/7B"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0BCBFC2BCFD;
	Fri, 16 Oct 2026 10:57:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1792148270;
	bh=JfyxnFFnZK2KCioAETLy7tquK+kDyxo4GNHnHr57raE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Tj9SP/7BRWFR4vQIG4l3Yi1zd4K3Vt8Mx0ZeQqgbWfCAG496ppNN1EYAVhZ9thuhV
	 9ACCf+qXDzD2HFEo0anuzCgFj+NPpwPoSbBYymkyQKM6ZOPxV6GYgXHGl+mEkd39zz
	 kHXSmJXblM/GBS2Gh+uwb78/ltLmetmmaIS2XauDMwA4QFRQ2ztn5u7kDGRwG8FwpU
	 Q1p4i3Ayxa7yeKCp+JZdqPxq6Uoc5EyAlOAlrtoMRN5rVf9mzTv0dek5dHErpuuN3O
	 CA1XqGtv0wNH6i3YENPyr2E1G+/E84RXQUGIw0UPwCNP/MeeUd/jssVdjbJ9jcdYwV
	 ZIRGcdZJNx8CA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE1EDCCA462;
	Fri, 16 Oct 2026 10:57:49 +0000 (UTC)
From: George Neacsu via B4 Relay <devnull+geocausa.gmail.com@kernel.org>
Date: Fri, 16 Oct 2026 11:57:49 +0100
Subject: [PATCH RFC v2 2/4] phy: Add MIPI C-PHY configuration helpers
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-x1e-cphy-rfc-v2-2-377654253193@gmail.com>
References: <20261016-x1e-cphy-rfc-v2-0-377654253193@gmail.com>
In-Reply-To: <20261016-x1e-cphy-rfc-v2-0-377654253193@gmail.com>
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
 linux-kernel@vger.kernel.org, George Neacsu <geocausa@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792148268; l=3198;
 i=geocausa@gmail.com; s=20261015; h=from:subject:message-id;
 bh=QB1gglGzNsXQ0TNRqQoooopMt6sn84f8HGcviHXPMFs=;
 b=CL2zpBWpaF6wUPW0yIED/iA5oKv6Q7iuc1b6VZ/Ct1PvMnez1omuTfHbKiPNoIp9Aua7potDF
 B/KnswxPKTZDyQRuwYjkwx2/lcS2gsKWXYfiGrNpDEFG9g1ABR39L3P
X-Developer-Key: i=geocausa@gmail.com; a=ed25519;
 pk=KyQk/iWbxsikewDBh0SwlHI51RvAqahD3loqmRp9DVI=
X-Endpoint-Received: by B4 Relay for geocausa@gmail.com/20261015 with
 auth_id=1199
X-Original-From: George Neacsu <geocausa@gmail.com>
Reply-To: geocausa@gmail.com

From: George Neacsu <geocausa@gmail.com>

A CSI-2 receiver knows the link frequency of its transmitter, and by the
V4L2 convention a C-PHY link frequency is half the symbol rate on each
trio. Add helpers so that the receiver and the PHY do not each open-code
that conversion, as phy_mipi_dphy_get_default_config_for_hsclk() does
for D-PHY:

- phy_mipi_cphy_get_default_config_for_link_freq() fills a
  configuration from a link frequency and a trio count;
- phy_mipi_cphy_config_validate() checks for a symbol rate and one to
  three trios;
- phy_mipi_cphy_link_freq() gives the link frequency of a configuration.

They are small enough to be inline, so no new Kconfig symbol is needed.

Suggested-by: Bryan O'Donoghue <bod@kernel.org>
Suggested-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: George Neacsu <geocausa@gmail.com>
---
 include/linux/phy/phy-mipi-cphy.h | 61 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 61 insertions(+)

diff --git a/include/linux/phy/phy-mipi-cphy.h b/include/linux/phy/phy-mipi-cphy.h
index ef6af61de..f6746dcb0 100644
--- a/include/linux/phy/phy-mipi-cphy.h
+++ b/include/linux/phy/phy-mipi-cphy.h
@@ -2,6 +2,10 @@
 #ifndef __PHY_MIPI_CPHY_H_
 #define __PHY_MIPI_CPHY_H_
 
+#include <linux/errno.h>
+
+#define PHY_MIPI_CPHY_MAX_TRIOS		3
+
 /**
  * struct phy_configure_opts_mipi_cphy - MIPI C-PHY configuration set
  *
@@ -24,4 +28,61 @@ struct phy_configure_opts_mipi_cphy {
 	unsigned char		trios;
 };
 
+/**
+ * phy_mipi_cphy_config_validate() - Validate a MIPI C-PHY configuration
+ * @cfg: configuration to check
+ *
+ * Return: 0 if @cfg has a symbol rate and one to three trios, -EINVAL
+ * otherwise.
+ */
+static inline int
+phy_mipi_cphy_config_validate(const struct phy_configure_opts_mipi_cphy *cfg)
+{
+	if (!cfg->symbol_rate)
+		return -EINVAL;
+
+	if (cfg->trios < 1 || cfg->trios > PHY_MIPI_CPHY_MAX_TRIOS)
+		return -EINVAL;
+
+	return 0;
+}
+
+/**
+ * phy_mipi_cphy_get_default_config_for_link_freq() - C-PHY configuration
+ * from a link frequency
+ * @link_freq: link frequency in Hz
+ * @trios: number of active trios
+ * @cfg: configuration to fill
+ *
+ * A C-PHY link frequency is half the symbol rate on each trio, the
+ * convention V4L2 uses for the link frequency of a C-PHY transmitter.
+ *
+ * Return: 0 on success, -EINVAL if the resulting configuration is invalid.
+ */
+static inline int
+phy_mipi_cphy_get_default_config_for_link_freq(unsigned long long link_freq,
+					       unsigned int trios,
+					       struct phy_configure_opts_mipi_cphy *cfg)
+{
+	if (trios > PHY_MIPI_CPHY_MAX_TRIOS)
+		return -EINVAL;
+
+	cfg->symbol_rate = link_freq * 2;
+	cfg->trios = trios;
+
+	return phy_mipi_cphy_config_validate(cfg);
+}
+
+/**
+ * phy_mipi_cphy_link_freq() - Link frequency of a MIPI C-PHY configuration
+ * @cfg: configuration
+ *
+ * Return: the link frequency in Hz, half the symbol rate on each trio.
+ */
+static inline unsigned long long
+phy_mipi_cphy_link_freq(const struct phy_configure_opts_mipi_cphy *cfg)
+{
+	return cfg->symbol_rate / 2;
+}
+
 #endif /* __PHY_MIPI_CPHY_H_ */

-- 
2.53.0


