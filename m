Received: from smtpbguseast1.qq.com (smtpbguseast1.qq.com [54.204.34.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF164579812
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 14:07:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.204.34.129
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788962847; cv=none; b=Gswe7o88dzRNgPOfMsGcA5ypb1BiacwpSnnWB9+6WImSw/Vp+vd/cFYZoLRLQXyNzszv0Db37lRQwy82PMm5VlPolwzlR387LXxl17QWXCUzuVkc0Hh9uGUNASh7jjsoINhmRLwurHLzTn/MOw9Yv6SzMJPHu33G4jq6dmCJq40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788962847; c=relaxed/simple;
	bh=w0QtlbTKpWa2vOrkQ4ReD72OhJcbUe7SlfJVrcZKo+s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=r3YvWbBt9TkN5pwjDepYdFbVe43QMw6ie7YAg4GZE4arJJwouWJFE54HKw5V8Q38d6+LVrEkVKlYVFYTP6xn7PTMVp6VhHeRWYANn9A9oZfahHt1SkwomNykITnMpODSNV9CzOKM98Z4VAbaeqoUf8mZe8JXjMBtemfyc7KPx48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=OGdmQCb8; arc=none smtp.client-ip=54.204.34.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="OGdmQCb8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1788962837;
	bh=2lqK4nkUEBzZtoYDgRY3977IcZ7JI7mh3h2ZTDbGxbQ=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=OGdmQCb8Zcq+gPs5q1P2UyWuBjPsySQOBkpfSMag2CUQH579gd3G494Nv2K5j0w38
	 t/ir0yhZqkp9snTfSyuRiAbZliEMCZaHj2oRJJJNYlfTyrnuC5Z20dmfZqQPnjOa4a
	 t73KuOnQwTDxUqO12K8qMxJ8aHW8WMB+dE1AYhCo=
X-QQ-mid: zesmtpsz3t1788962836tdc282f0c
X-QQ-Originating-IP: oMXzk2MIuN6L9wUzy4Z4OAOTi7U5ntfMro+/NaRnODc=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 09 Sep 2026 22:07:13 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 17223578547801668794
EX-QQ-RecipientCnt: 12
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Date: Wed, 09 Sep 2026 22:07:01 +0800
Subject: [PATCH 1/5] clk: spacemit: derive PLL rates from hardware
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260909-spacemit-pll-init-v1-1-b3065ad5a4ac@linux.spacemit.com>
References: <20260909-spacemit-pll-init-v1-0-b3065ad5a4ac@linux.spacemit.com>
In-Reply-To: <20260909-spacemit-pll-init-v1-0-b3065ad5a4ac@linux.spacemit.com>
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Yixun Lan <dlan@kernel.org>, 
 Alex Elder <elder@riscstar.com>, Inochi Amaoto <inochiama@outlook.com>, 
 Haylen Chu <heylenay@4d2.org>
Cc: linux-clk@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5466;
 i=troy.mitchell@linux.spacemit.com; h=from:subject:message-id;
 bh=w0QtlbTKpWa2vOrkQ4ReD72OhJcbUe7SlfJVrcZKo+s=;
 b=owGbwMvMwCU2g/N9w09jE33G02pJDFkLM9jb9i5ds+lqqIZS5O3Qyl6rmKSj7yK4D6TMzZpy8
 hHbkyU6HaUsDGJcDLJiiizdD3i2FfhE2RYIFPrCzGFlAhnCwMUpABOZ9YfhD+fDl3Gr2qVvXf5o
 zLfhBmu7xpv49Wd+VW7QUFb+8+Go61GG/8GyZsKN3rH/3Pb8jvF4ejpjT6RFpJTfg5ym7z8116g
 e5gAA
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=openpgp;
 fpr=3FE5535CF1B0E658E57DB59BAE1C2FBEA7DB42E1
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: MxX5kg4KifQ2NBTFuR5jNMcWHtyiaAkKng7v1d1+09X1ncQjgQcI5qHn
	25BECUDrZ18OkfwW/7Q6jVAhOmKfQynQhFmCSDRB/oI2z2c65RsNw62CG5f2h8yYfzQhN2J
	4DudHEuqhO5FTvUHrClFdWMf7tRskfBzlPN96G0yn7GQGujwBvu0hp7KmiBiBwmbKJdIqu9
	W7V7e3FlP5xAF/D8ibM0V17QfRmORzsgadwiBUIS4gwYgrsQkB0bc0YqPo5TxGMmSkEciXI
	FLzNgt9R/cMvriILcHezNQbuO5rHXs7QYOAAZ6g6K7vyeSvg3eAPS6yh0rDa3T5X1YRE7+k
	3kTw9jfywgdtBazEQhJyi3zdehvtEO/x47ZB5N9XcVtCkj8oPHcbt85pqqY7DgsZh2Iu4tT
	pf74XLpE3OquX+pkeVQXTJH7LtvPe52pUaUtzntotkaiFDm0g9AjZw95grJR60P1WgBrAVr
	nOPJT9pODFzpRrkwJMJuqk2/Iip09MTalStPpe9O8jJN/6rjW+tcAVgTlzGUc3XoXjVwhIh
	tC7P7k0kB2Wgi/ZuxxxV9wzvcHbtZaMD6Wv59Lza3txyu/2FAxs2HFJRCbIDbefI7p86eD8
	UmhQWeWmDtQL4QfIUGAvRO7KYJ5hZtdlLEOh4Sx50B7aobxDERJjp1IOrCzADveMAdz8rXI
	4j59yvn2gcsWu5CzR4p0Dq4bSgJxoHT+KgnQXD5YoQoBMw4PFYRhN/AR07oNFlmDLbAqS/G
	XNTPN211koyLL5PgYR8eoHgm/cYLZ7+hQ+LVz5gEuHIFe6bqtG4HOFMbZsO/kOCdcFxOVKx
	J2Gte4FPzC7SCuclbWmZg1iY96QS9lO98Kg8APe0DsnsIXmkCsgR6J/X0K+31GOV4vqwVHO
	6TzxueFyRkfMZZrwGxek44b1fLr2FMhKQnGdFwcdz+BOS7NW3OGxy37ULfmdldq0ALMFqaL
	1gecikzc+CajRgVpH/sPtWl4u2wsK9vDwn2GxGRXOjVLGmVEqKjPZCBZkNAe4BY/5jJ52hj
	NSmjuKVO+YcxMt8yIQdr0syH+u5yxRSZQAuCUELOGKDLB90EkJ/3NU+iNkm4pAZqHcKHajr
	SPD13hR5FiEVg6ZtlNy0NjkgVlDLr/bZ+XbO/2QmaR83ljBHLqe22UN6wNMiM1o4omXru9w
	EK75Xa6RGTTB55nttetTRviIxWSL/BRAi7gMXMadPjW13yM=
X-QQ-XMRINFO: Mp0Kj//9VHAxzExpfF+O8yhSrljjwrznVg==
X-QQ-RECHKSPAM: 0

Firmware can program valid PLL settings that have no exact register
match in the rate table, even when they produce a listed frequency.
An exact table lookup in recalc_rate() therefore returns zero instead of
the hardware rate.

Replace the register-table lookup with calculations from the K1 PLL and
K3 PLLA register fields, accounting for signed and unsigned fractional
feedback respectively. Return zero for unsupported modes or register
read failures. Rate selection and programming remain table-based.

Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
---
 drivers/clk/spacemit/ccu_pll.c | 100 +++++++++++++++++++++++++++++++++++------
 1 file changed, 86 insertions(+), 14 deletions(-)

diff --git a/drivers/clk/spacemit/ccu_pll.c b/drivers/clk/spacemit/ccu_pll.c
index d4066a0ed4526..c9852fed31017 100644
--- a/drivers/clk/spacemit/ccu_pll.c
+++ b/drivers/clk/spacemit/ccu_pll.c
@@ -4,8 +4,10 @@
  * Copyright (c) 2024-2025 Haylen Chu <heylenay@4d2.org>
  */
 
+#include <linux/bitfield.h>
 #include <linux/clk-provider.h>
 #include <linux/math.h>
+#include <linux/math64.h>
 #include <linux/regmap.h>
 
 #include "ccu_common.h"
@@ -14,12 +16,24 @@
 #define PLL_TIMEOUT_US		3000
 #define PLL_DELAY_US		5
 
+#define PLL_SWCR1_PREDIV	GENMASK(13, 12)
+#define PLL_SWCR1_INTERNAL	BIT(29)
+#define PLL_SWCR3_INT		GENMASK(30, 24)
+#define PLL_SWCR3_FRAC		GENMASK(23, 0)
+
 #define PLL_SWCR3_EN		((u32)BIT(31))
 #define PLL_SWCR3_MASK		GENMASK(30, 0)
 
 #define PLLA_SWCR2_EN		((u32)BIT(16))
 #define PLLA_SWCR2_MASK		GENMASK(15, 8)
 
+#define PLLA_SWCR1_USER_MODE	BIT(25)
+#define PLLA_SWCR1_INT		GENMASK(22, 16)
+#define PLLA_SWCR1_REFSEL	GENMASK(15, 14)
+#define PLLA_SWCR1_FRAC		GENMASK(13, 0)
+#define PLLA_SWCR3_PREDIV	GENMASK(21, 20)
+#define PLL_FRAC_BITS		22
+
 static const struct ccu_pll_rate_tbl *ccu_pll_lookup_best_rate(struct ccu_pll *pll,
 							       unsigned long rate)
 {
@@ -115,17 +129,78 @@ static int ccu_pll_set_rate(struct clk_hw *hw, unsigned long rate,
 	return 0;
 }
 
-static unsigned long ccu_pll_recalc_rate(struct clk_hw *hw,
-					 unsigned long parent_rate)
+static int ccu_pll_get_params(struct ccu_pll *pll,
+			      struct ccu_pll_rate_tbl *params, bool plla)
 {
-	struct ccu_pll *pll = hw_to_ccu_pll(hw);
-	const struct ccu_pll_rate_tbl *entry;
+	struct ccu_common *common = &pll->common;
+	int ret;
+
+	ret = regmap_read(common->regmap, common->reg_swcr1, &params->swcr1);
+	if (ret)
+		return ret;
+	params->swcr2 = 0;
+	if (plla) {
+		ret = regmap_read(common->regmap, common->reg_swcr2, &params->swcr2);
+		if (ret)
+			return ret;
+	}
+	return regmap_read(common->regmap, common->reg_swcr3, &params->swcr3);
+}
+
+static unsigned long ccu_pll_calc_rate(const struct ccu_pll_rate_tbl *params,
+				      unsigned long parent_rate)
+{
+	u32 swcr1 = params->swcr1, swcr3 = params->swcr3, prediv;
+	s64 divider;
+	u64 rate;
+
+	/* The programmed divider is not used in internal configuration mode. */
+	if (swcr1 & PLL_SWCR1_INTERNAL)
+		return 0;
+
+	prediv = FIELD_GET(PLL_SWCR1_PREDIV, swcr1) + 1;
+	divider = (s64)FIELD_GET(PLL_SWCR3_INT, swcr3) << PLL_FRAC_BITS;
+	/* The 24-bit fractional code is signed, with an LSB of 2^-22. */
+	divider += sign_extend32(FIELD_GET(PLL_SWCR3_FRAC, swcr3), 23);
+	if (divider <= 0)
+		return 0;
+
+	/* Fvco = Fref * Npre * (Nint + Nfrac). */
+	rate = (u64)parent_rate * prediv * divider;
+	return DIV_ROUND_CLOSEST_ULL(rate, BIT_ULL(PLL_FRAC_BITS));
+}
+
+static unsigned long ccu_plla_calc_rate(const struct ccu_pll_rate_tbl *params,
+				       unsigned long parent_rate)
+{
+	u32 swcr1 = params->swcr1, swcr2 = params->swcr2;
+	u32 swcr3 = params->swcr3, prediv, frac;
+	u64 divider, rate;
+
+	/* Decode the software-controlled mode described by the PLL calculator. */
+	if (!(swcr1 & PLLA_SWCR1_USER_MODE) ||
+	    (swcr1 & PLLA_SWCR1_REFSEL))
+		return 0;
+
+	prediv = FIELD_GET(PLLA_SWCR3_PREDIV, swcr3) + 1;
+	frac = FIELD_GET(PLLA_SWCR1_FRAC, swcr1) << 8;
+	frac |= FIELD_GET(PLLA_SWCR2_MASK, swcr2);
+	divider = (u64)FIELD_GET(PLLA_SWCR1_INT, swcr1) << PLL_FRAC_BITS;
+	divider += frac;
 
-	entry = ccu_pll_lookup_matched_entry(pll);
+	/* Fvco = Fref * Npre * (Nint + Nfrac), with an unsigned fraction. */
+	rate = (u64)parent_rate * prediv * divider;
+	return DIV_ROUND_CLOSEST_ULL(rate, BIT_ULL(PLL_FRAC_BITS));
+}
 
-	WARN_ON_ONCE(!entry);
+static unsigned long ccu_pll_recalc_rate(struct clk_hw *hw,
+					 unsigned long parent_rate)
+{
+	struct ccu_pll_rate_tbl params;
 
-	return entry ? entry->rate : 0;
+	if (ccu_pll_get_params(hw_to_ccu_pll(hw), &params, false))
+		return 0;
+	return ccu_pll_calc_rate(&params, parent_rate);
 }
 
 static int ccu_pll_determine_rate(struct clk_hw *hw,
@@ -232,14 +307,11 @@ static int ccu_plla_set_rate(struct clk_hw *hw, unsigned long rate,
 static unsigned long ccu_plla_recalc_rate(struct clk_hw *hw,
 					  unsigned long parent_rate)
 {
-	struct ccu_pll *pll = hw_to_ccu_pll(hw);
-	const struct ccu_pll_rate_tbl *entry;
-
-	entry = ccu_plla_lookup_matched_entry(pll);
+	struct ccu_pll_rate_tbl params;
 
-	WARN_ON_ONCE(!entry);
-
-	return entry ? entry->rate : 0;
+	if (ccu_pll_get_params(hw_to_ccu_pll(hw), &params, true))
+		return 0;
+	return ccu_plla_calc_rate(&params, parent_rate);
 }
 
 static int ccu_plla_init(struct clk_hw *hw)

-- 
2.55.0

