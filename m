Received: from smtpbgjp3.qq.com (smtpbgjp3.qq.com [54.92.39.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A84CC57982B
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 14:07:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.92.39.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788962860; cv=none; b=m7nN/1zEZZW3HqDAGQxwmlcymLnfjRGfaglxQ7hyYFvfD9GrtLkGw8hVv0IX8m69NJ3YDpRjRO18Ozy6zk1nBEhAn/L3DLA9mWOUfSprewenBDeYAYVXruB8uq64emHAABgx3vjc3S6mp2N062eaQV3UhLc9AVZ0aTMasUHGP1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788962860; c=relaxed/simple;
	bh=HcMGpQWFpVaKN+ZuQCSNEuXR6Mis65bMQ5jbV2jMtaI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LFNVitPAuD1IU+aqpWqw+2VgMZ04GppKpXobpg59KHftG/7MlMzMq447OYKDSjY7dkNOcpA9ATizp/LMaHEdWf7kQhgLuZdvASjntpkmfdSGcLDVWd4X+GvdR9PffMoZC4NzLfhsQ6SOgkWTXQNbHlTeaVKzmoupj9Ap5n/7HJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=UtdXWV24; arc=none smtp.client-ip=54.92.39.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="UtdXWV24"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1788962850;
	bh=GrJe/zGuOLChEqPY2kuCKE1B/uVgBajiPVFz4of7w88=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=UtdXWV24lcSG7Rm2odP/Inu4wkWc/kqK0MmS17X3k/IF5INiWSN7oqIfzqQSBBCC1
	 wc5FrPPVK9B/QMTwKTx0OGwmBIlL2cHkn/s2fXnHrD9uFsR0/YPvr+v1kBn0+r5IVR
	 zfU84xKTa/RlTt+YGS2PmTAe4h/6yb9L/pP3+/qM=
X-QQ-mid: zesmtpsz9t1788962849t68360cbb
X-QQ-Originating-IP: sLsoD0HDmN9VygtU83mXe6+BU5Tsu8vKAe2RTOBchSU=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 09 Sep 2026 22:07:26 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 8200674829812587946
EX-QQ-RecipientCnt: 12
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Date: Wed, 09 Sep 2026 22:07:04 +0800
Subject: [PATCH 4/5] clk: spacemit: reject rate changes to running firmware
 PLLs
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260909-spacemit-pll-init-v1-4-b3065ad5a4ac@linux.spacemit.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6831;
 i=troy.mitchell@linux.spacemit.com; h=from:subject:message-id;
 bh=HcMGpQWFpVaKN+ZuQCSNEuXR6Mis65bMQ5jbV2jMtaI=;
 b=owGbwMvMwCU2g/N9w09jE33G02pJDFkLM7iyma+a6QW+OX3FSd/C/ITI7E4VrjTBulW9Fw8eU
 dhwc21PRykLgxgXg6yYIkv3A55tBT5RtgUChb4wc1iZQIYwcHEKwEQsbRgZplZNLpqx2vrxtj2N
 XL0XixmCVbxC6neeNGTlUuedtSMwheEPXxBfXrVr+IeSyy88n96Y/eBW3eydn6IOn1ggu3VR/Ro
 tHgA=
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=openpgp;
 fpr=3FE5535CF1B0E658E57DB59BAE1C2FBEA7DB42E1
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: NOt1V41YjURb6VK9dmN4/++zlfvQ7L4e8Spnev7LS9OcsVgg+2GhJ/b2
	F23C91MCE4+iQqtHkwoo1VWulMvBEjt+FMeAoSDbwTELRRPY0ffXWegjEHQNytPYKru/Di0
	OlgAHFHms55SRmKMCikYSwNyH2pXyjP98J65TIb3nts6lZ4dIjwwV3/B1GzUGesk07T80y/
	eb5btvB4hJMF4fK/UmIwxfEnSSOimJTlhjnD7L0MxSEpNXqk6byFOFiiVj4JdIga6w2Yj7B
	ot8w8/wmt70kjoZFSajm7F3G5sce8xqU3D6VRH6kxxfMYgeSgVbqqWYwN0ZMZqWPy7UQjJx
	J7Xdf4wR/pug9B4Ct3S7AnJnUPByXHzhn04003a/7WxYxK/K2FwI6UHInmGhWRNstLn53vD
	Apt1W54bvV3VlqDN8I0hk/sQ9j+FnH8vLFDVHM6iYjKjF/I3Owvzq4P63T7GVJeBj0NJw0V
	VsDFN6EPT/RrY+ARGwXpTYq3in0knQwrwgQiOmNBl2+Ahq8V7vQjbUPxuOoBvVQrSwJ3BG4
	vLmp/xFC3HqpPZfsMvYbaAVGI85wsZxTB736zxsFA4bUzZihA1cYD78tFFWX+Nf267f+onZ
	hP6rs7hgGSRQ38aRGlTAWUYtpXMPmJ3JJWkBrTi668d75qqmiXlqKSh0mOLzbhNF3FBKh9O
	o1EjTL9ywCnXd0F9NcGcUYUwi4ufML9DJW5clWiEA8DcUOsqmQofeX/ebC3ccWFEQQQeFSj
	ZPUDERnMn1wt84AAlf+9jEyOKYyXkPAtzRvNNxhbwaj5kTYTJbAzJZZjAmAFh/FsIQUYahp
	aSq+U1e4bEz53/tPeM9WAkDUHRpU66qED3xcZUDxTMF4J5EZVCjEKFRivnO7Pflx5XYlld2
	V8/dl88ZuDkN5+/DIoYXeWMC7W6a57sHAIqun/uFzZRKvAZ44+fuU189TGfaSOBEUCMWjMT
	Ctd2pT1DWOX+PAIbn3DE9XJdCveMWx0V3213hgpE8ekfpBBV86m9WB2/GTT9LCa7pSchoce
	q+uoteRIa1UmlZv0oKpP6O2JHjyXEVwsopf2BlXIaALjBzTfZvH+pEFMODy6i9KDPzOpYYD
	RAK21Og6oxM/ighu/S/fjZ5HR5xhGLOC7qH5pMX7k3zgvX8gRZ03NLG2yIzLQYTeG+6TXys
	2haISA5jwsSjVduimEdV+wL1ow==
X-QQ-XMRINFO: MSVp+SPm3vtSI1QTLgDHQqIV1w2oNKDqfg==
X-QQ-RECHKSPAM: 0

CLK_SET_RATE_GATE only protects clocks prepared through CCF. A PLL left
running by firmware can have a zero prepare count, so this flag alone
cannot prevent set_rate() from reprogramming a live PLL.

Check the hardware state and reject set_rate() while either the enable
or lock bit is set on K1 PLLs and K3 PLLAs. Propagate register read/write
failures and reject rate requests with no table candidate. Callers must
still move consumers away and stop the PLL before changing its rate.

Fixes: 1b72c59db0ad ("clk: spacemit: Add clock support for SpacemiT K1 SoC")
Fixes: 3a086236c600 ("clk: spacemit: ccu_pll: add plla type clock")
Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
---
 drivers/clk/spacemit/ccu_pll.c | 92 +++++++++++++++++++++++++++++++++---------
 1 file changed, 72 insertions(+), 20 deletions(-)

diff --git a/drivers/clk/spacemit/ccu_pll.c b/drivers/clk/spacemit/ccu_pll.c
index c9852fed31017..2573b8396cefa 100644
--- a/drivers/clk/spacemit/ccu_pll.c
+++ b/drivers/clk/spacemit/ccu_pll.c
@@ -38,9 +38,9 @@ static const struct ccu_pll_rate_tbl *ccu_pll_lookup_best_rate(struct ccu_pll *p
 							       unsigned long rate)
 {
 	struct ccu_pll_config *config = &pll->config;
-	const struct ccu_pll_rate_tbl *best_entry;
+	const struct ccu_pll_rate_tbl *best_entry = NULL;
 	unsigned long best_delta = ULONG_MAX;
-	int i;
+	u32 i;
 
 	for (i = 0; i < config->tbl_num; i++) {
 		const struct ccu_pll_rate_tbl *entry = &config->rate_tbl[i];
@@ -75,19 +75,25 @@ static const struct ccu_pll_rate_tbl *ccu_pll_lookup_matched_entry(struct ccu_pl
 	return NULL;
 }
 
-static void ccu_pll_update_param(struct ccu_pll *pll, const struct ccu_pll_rate_tbl *entry)
+static int ccu_pll_update_param(struct ccu_pll *pll, const struct ccu_pll_rate_tbl *entry)
 {
 	struct ccu_common *common = &pll->common;
+	int ret;
 
-	regmap_write(common->regmap, common->reg_swcr1, entry->swcr1);
-	ccu_update(common, swcr3, PLL_SWCR3_MASK, entry->swcr3);
+	ret = regmap_write(common->regmap, common->reg_swcr1, entry->swcr1);
+	if (ret)
+		return ret;
+	return ccu_update(common, swcr3, PLL_SWCR3_MASK, entry->swcr3);
 }
 
 static int ccu_pll_is_enabled(struct clk_hw *hw)
 {
 	struct ccu_common *common = hw_to_ccu_common(hw);
+	u32 val;
+	int ret;
 
-	return ccu_read(common, swcr3) & PLL_SWCR3_EN;
+	ret = regmap_read(common->regmap, common->reg_swcr3, &val);
+	return ret ? ret : !!(val & PLL_SWCR3_EN);
 }
 
 static int ccu_pll_enable(struct clk_hw *hw)
@@ -95,8 +101,11 @@ static int ccu_pll_enable(struct clk_hw *hw)
 	struct ccu_pll *pll = hw_to_ccu_pll(hw);
 	struct ccu_common *common = &pll->common;
 	unsigned int tmp;
+	int ret;
 
-	ccu_update(common, swcr3, PLL_SWCR3_EN, PLL_SWCR3_EN);
+	ret = ccu_update(common, swcr3, PLL_SWCR3_EN, PLL_SWCR3_EN);
+	if (ret)
+		return ret;
 
 	/* check lock status */
 	return regmap_read_poll_timeout_atomic(common->lock_regmap,
@@ -113,6 +122,17 @@ static void ccu_pll_disable(struct clk_hw *hw)
 	ccu_update(common, swcr3, PLL_SWCR3_EN, 0);
 }
 
+static int ccu_pll_check_stopped(struct ccu_pll *pll)
+{
+	u32 val;
+	int ret;
+
+	ret = regmap_read(pll->common.lock_regmap, pll->config.reg_lock, &val);
+	if (ret)
+		return ret;
+	return val & pll->config.mask_lock ? -EBUSY : 0;
+}
+
 /*
  * PLLs must be gated before changing rate, which is ensured by
  * flag CLK_SET_RATE_GATE.
@@ -122,11 +142,20 @@ static int ccu_pll_set_rate(struct clk_hw *hw, unsigned long rate,
 {
 	struct ccu_pll *pll = hw_to_ccu_pll(hw);
 	const struct ccu_pll_rate_tbl *entry;
+	int ret;
 
-	entry = ccu_pll_lookup_best_rate(pll, rate);
-	ccu_pll_update_param(pll, entry);
+	/* CLK_SET_RATE_GATE does not account for firmware-only users. */
+	ret = ccu_pll_is_enabled(hw);
+	if (ret)
+		return ret < 0 ? ret : -EBUSY;
+	ret = ccu_pll_check_stopped(pll);
+	if (ret)
+		return ret;
 
-	return 0;
+	entry = ccu_pll_lookup_best_rate(pll, rate);
+	if (!entry)
+		return -EINVAL;
+	return ccu_pll_update_param(pll, entry);
 }
 
 static int ccu_pll_get_params(struct ccu_pll *pll,
@@ -207,8 +236,12 @@ static int ccu_pll_determine_rate(struct clk_hw *hw,
 				  struct clk_rate_request *req)
 {
 	struct ccu_pll *pll = hw_to_ccu_pll(hw);
+	const struct ccu_pll_rate_tbl *entry;
 
-	req->rate = ccu_pll_lookup_best_rate(pll, req->rate)->rate;
+	entry = ccu_pll_lookup_best_rate(pll, req->rate);
+	if (!entry)
+		return -EINVAL;
+	req->rate = entry->rate;
 
 	return 0;
 }
@@ -249,20 +282,28 @@ static const struct ccu_pll_rate_tbl *ccu_plla_lookup_matched_entry(struct ccu_p
 	return NULL;
 }
 
-static void ccu_plla_update_param(struct ccu_pll *pll, const struct ccu_pll_rate_tbl *entry)
+static int ccu_plla_update_param(struct ccu_pll *pll, const struct ccu_pll_rate_tbl *entry)
 {
 	struct ccu_common *common = &pll->common;
+	int ret;
 
-	regmap_write(common->regmap, common->reg_swcr1, entry->swcr1);
-	regmap_write(common->regmap, common->reg_swcr3, entry->swcr3);
-	ccu_update(common, swcr2, PLLA_SWCR2_MASK, entry->swcr2);
+	ret = regmap_write(common->regmap, common->reg_swcr1, entry->swcr1);
+	if (ret)
+		return ret;
+	ret = regmap_write(common->regmap, common->reg_swcr3, entry->swcr3);
+	if (ret)
+		return ret;
+	return ccu_update(common, swcr2, PLLA_SWCR2_MASK, entry->swcr2);
 }
 
 static int ccu_plla_is_enabled(struct clk_hw *hw)
 {
 	struct ccu_common *common = hw_to_ccu_common(hw);
+	u32 val;
+	int ret;
 
-	return ccu_read(common, swcr2) & PLLA_SWCR2_EN;
+	ret = regmap_read(common->regmap, common->reg_swcr2, &val);
+	return ret ? ret : !!(val & PLLA_SWCR2_EN);
 }
 
 static int ccu_plla_enable(struct clk_hw *hw)
@@ -270,8 +311,11 @@ static int ccu_plla_enable(struct clk_hw *hw)
 	struct ccu_pll *pll = hw_to_ccu_pll(hw);
 	struct ccu_common *common = &pll->common;
 	unsigned int tmp;
+	int ret;
 
-	ccu_update(common, swcr2, PLLA_SWCR2_EN, PLLA_SWCR2_EN);
+	ret = ccu_update(common, swcr2, PLLA_SWCR2_EN, PLLA_SWCR2_EN);
+	if (ret)
+		return ret;
 
 	/* check lock status */
 	return regmap_read_poll_timeout_atomic(common->lock_regmap,
@@ -297,11 +341,19 @@ static int ccu_plla_set_rate(struct clk_hw *hw, unsigned long rate,
 {
 	struct ccu_pll *pll = hw_to_ccu_pll(hw);
 	const struct ccu_pll_rate_tbl *entry;
+	int ret;
 
-	entry = ccu_pll_lookup_best_rate(pll, rate);
-	ccu_plla_update_param(pll, entry);
+	ret = ccu_plla_is_enabled(hw);
+	if (ret)
+		return ret < 0 ? ret : -EBUSY;
+	ret = ccu_pll_check_stopped(pll);
+	if (ret)
+		return ret;
 
-	return 0;
+	entry = ccu_pll_lookup_best_rate(pll, rate);
+	if (!entry)
+		return -EINVAL;
+	return ccu_plla_update_param(pll, entry);
 }
 
 static unsigned long ccu_plla_recalc_rate(struct clk_hw *hw,

-- 
2.55.0

