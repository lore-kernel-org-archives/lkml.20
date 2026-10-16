Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4CAF44E038;
	Fri, 16 Oct 2026 14:56:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792162572; cv=none; b=DIQbvw3Q8yGAVI3Tb7EpRn75QsWg9GBSDjeA5SM1Bj6itmoRAuZ+98POahO1uhP4DkTwNlz0F+eCFfDFAYXCt2BTkYvzG0EitcvAuYzyP5jj/1o2dMBsP466ipiV9jSzTwNl37saBK22ZEO7+qrXSwLdtBaKTcwv5FDoCe510fQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792162572; c=relaxed/simple;
	bh=f3VI0IWsreuS0SKtsaqT2R9eaPScD411XLSj9mh5T24=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=loNY3hJwdyYoX8pw44C8lbwf5xxWUchd3Sh7nzl5TlYIEoWAcuWaKFgBahPpsibcBbYFNAadS2RX27C7NWkEc9yHIrz2CkgsDWP4cN9vgPXFQhnnrA8nF2Mye7gIif7nLoSHOSDf5UjK23XGi/wyYqbwhA0CG7H3NXMoN3BH09U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DvO11NW+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DvO11NW+"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 74040C2BCF4;
	Fri, 16 Oct 2026 14:56:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1792162572;
	bh=f3VI0IWsreuS0SKtsaqT2R9eaPScD411XLSj9mh5T24=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=DvO11NW+wKvu8+R6+5oYQbjtjoT0+EEk/mvhNkXCg54EQo4iA8Gzm5Rk7Sb8zK7K7
	 q+N0BmYnpvoZtPIWW0PuCaR8mtXsHQnKPz3aL2gu8Qzd0DjEhBgsZVuHygdbPGbR5E
	 jIVrCd7eXdXo6898CQJUNUiKENi0P6KQEbhY6xF78zXQ8rQoKVngjIKfXtrUoyK6uo
	 LIBVhOhjaJycMq5B02om7kJe58gqoDDENESCIvwIgc5pJ2GYO6iqpNujoV+ZbRMUhJ
	 YjI55Evbez+IZ6wChh6OLAYH8Or9ashqgvR7BOUNZtieiBqDEnRGJLgD4f8tsn9qvC
	 pvFR3SIZxb0GA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58F3BCCA462;
	Fri, 16 Oct 2026 14:56:12 +0000 (UTC)
From: George Neacsu via B4 Relay <devnull+geocausa.gmail.com@kernel.org>
Date: Fri, 16 Oct 2026 15:56:12 +0100
Subject: [PATCH v3 2/6] phy: Add MIPI C-PHY configuration helpers
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-x1e-cphy-rfc-v3-2-40a346a72153@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792162570; l=3247;
 i=geocausa@gmail.com; s=20261015; h=from:subject:message-id;
 bh=oJIZmb5EbeE8l200gX3BwDF2KFgLiUAiv5ow1JJLKdU=;
 b=nWkNKyiE4u4PC0mjrHQeWwEGDHo3uoi48oQ4efl/w+zjSTE3qvz96TEGe3Ew6JKfPIEnG0Vr0
 fqds9NMjATlAbm0NOqwQeBGL+4DtSL7Rtw6/SsMO/alW8BB0roRC65i
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
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: George Neacsu <geocausa@gmail.com>
---
 include/linux/phy/phy-mipi-cphy.h | 60 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 60 insertions(+)

diff --git a/include/linux/phy/phy-mipi-cphy.h b/include/linux/phy/phy-mipi-cphy.h
index 9b748d577b..adc2dcbd2e 100644
--- a/include/linux/phy/phy-mipi-cphy.h
+++ b/include/linux/phy/phy-mipi-cphy.h
@@ -2,8 +2,11 @@
 #ifndef __PHY_MIPI_CPHY_H_
 #define __PHY_MIPI_CPHY_H_
 
+#include <linux/errno.h>
 #include <linux/types.h>
 
+#define PHY_MIPI_CPHY_MAX_TRIOS		3
+
 /**
  * struct phy_configure_opts_mipi_cphy - MIPI C-PHY configuration set
  *
@@ -26,4 +29,61 @@ struct phy_configure_opts_mipi_cphy {
 	u8			trios;
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
+phy_mipi_cphy_get_default_config_for_link_freq(u64 link_freq,
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
+static inline u64
+phy_mipi_cphy_link_freq(const struct phy_configure_opts_mipi_cphy *cfg)
+{
+	return cfg->symbol_rate / 2;
+}
+
 #endif /* __PHY_MIPI_CPHY_H_ */

-- 
2.53.0


