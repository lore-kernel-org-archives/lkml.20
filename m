Received: from smtpbguseast3.qq.com (smtpbguseast3.qq.com [54.243.244.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DB3557C73A
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 14:07:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.243.244.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788962849; cv=none; b=L8H+7e0kekQfuZdjgqeULf1jHjXBg3SI72kw9LmeHRuF4tv/E1f0KYotBSqUo4gkRxVPiklygHICzd7bVYwh9OJsJy+RLmrZtDQA0zmkTvbEojBEtTB3svFy+dhMDe1tjOMsnD8+Bj7D/hIrAcpAWiEj9pYbFLiGgPR2yxtz5YQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788962849; c=relaxed/simple;
	bh=vxttLKkfUwd27JQRHStfdT7Y0lW42eEikPZgsnpxuJo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WGoyTpgUtyRGIWDrm2BdptBPtl6RGwh6DXmiWffKD2tnqSxbfvBNqZrJB30ewHmj5X+/6oUWOU5NBffGS5gPOOKf/vI41rrrf/JVc7hPsiY7w3J9OZqRuJ/n6gCyS9lz3s1eaFZo+XWtd19sgKVjGDPksKlgSzQdcGX6bYvfKsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=E8rASIgU; arc=none smtp.client-ip=54.243.244.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="E8rASIgU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1788962841;
	bh=nKAq6RetJp6ZFR2CRDPWMZ27CnaeKTaTs4jXaZMXCHY=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=E8rASIgU50HOpuIwBjkaKV351rZOPPo2u4zDPt32mPksLIeiu8rWN+uDIOIC8MXfD
	 zjjvP36dRU06hNp2u1pu2QPrg2LqDRWP5Eib8JyqNIbPLaE5C/G8Ge5taEIgiuhzNP
	 Nraa8vlq31y85O7JZNMoCqW5/cFurxag92LoJYsU=
X-QQ-mid: esmtpsz11t1788962840tc0335ed2
X-QQ-Originating-IP: AgpmG5w8G+w7oi58LYPI+uQCHoCX373EEv/NMTsxbek=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 09 Sep 2026 22:07:17 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 7195780411193005217
EX-QQ-RecipientCnt: 12
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Date: Wed, 09 Sep 2026 22:07:02 +0800
Subject: [PATCH 2/5] clk: spacemit: make MIX rate selection consistent
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260909-spacemit-pll-init-v1-2-b3065ad5a4ac@linux.spacemit.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3117;
 i=troy.mitchell@linux.spacemit.com; h=from:subject:message-id;
 bh=vxttLKkfUwd27JQRHStfdT7Y0lW42eEikPZgsnpxuJo=;
 b=owGbwMvMwCU2g/N9w09jE33G02pJDFkLMzjinlz8Xrvua+CsDF8X54L1XMcWLS51+5MvauSbY
 rG4wqSgo5SFQYyLQVZMkaX7Ac+2Ap8o2wKBQl+YOaxMIEMYuDgFYCLWFxj+Z1xWOjtp++QX31J6
 vzTOXmu35MP3jIwZ/C+MFW6JXS4SbWT4K5FqvJp15uINP6pven1Pcj60OWIPQ2bDsxULfu6dem6
 FLxcA
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=openpgp;
 fpr=3FE5535CF1B0E658E57DB59BAE1C2FBEA7DB42E1
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: OXnZbW5+Xs4aTlR5s/s3h18p6Fz1lbpFssNrg9cBa7S79elqE7pOhzE0
	yLdSiY5bHOOaKa1iaDZq9+61jdPUOqXC4I57BgQDLc78JwINh9bhhXzL1ro9L3bHao0+37b
	jhYLEAWmQ1DAlHytV7PphRkoi7dWxe/86LXU2ZDKNEjtLXYNyjJAQnKZ0UDIiZCxjZxmp2x
	ksJRLmmuep1yjjfpKwLmOC9vyL2QXRRA/W0QekJr94Lo223PrjAoG24ptScnizUjn71Qwe+
	20coQrCQSvxFuML1sFvM498cr3nEU67ZU65bsn7DytKR84fOLd7RJXAxfqpJWghoNBuFm2z
	tb9dXBmo8P29ev5RHlWTKOwonvUJx2oMtrgf+6vm/xG7FIes1R8km30EG0k70BEEF/p1Z70
	aZ/MOxd4dDXkzGOOgahuUxYoQX+PeNzbienUpWO/IFFL0qIDsmg0gQpUx3C1QM+V8/OOnpd
	SoGYHISbjlmDRvHMmH0MZOLue6jP+RUnsxlagrSHTqTiB6ZZFIlt3Jk7H7hHCObmR0NtcZl
	P0sXeNIvtJQ5sxbX2GxMWJvMUfoNKbJLfJdmJlvJExyY2tEp7lqm+xzePNGl+xfK1Xqpms8
	GtcVfZ7x5Y90lpO+BvpFzO2uY5GwIqkmirelyAlFpu03N4fCocRuQE+y60TJorgykBtHs/B
	VnGowOMKCNByz2KTeo67OPhovUwOiwYGl2VSG5CrfM3HRqUlZN+Ex5UxEoWDNHE5J21zI4J
	jxA+a+g5R68Btc8yit1X7eP8XdnUc6HcZ2VfXdEQthihGm4spYud3bqb3OZDCLgmTLQSOl/
	Yd7cEg04P5Qh2oxxH3RmF5LdQC96eBlexw+5wAyx/kcDcffVG1AV2PJQeBI97I0FN/FzKny
	Af9zGm/abmtA4RqesGNGrsGKxDoj+ShNEo0sMZYO7Ywi6zasJCCAoPfpagINBRbFkP5GjKi
	ZnN2jXzIQMSf9xDdlo8tUFzspiX/o6id8Xc7EbgVUARWlDGTrkwBKwa2cGCjXhA9HeNdKhk
	IFc8UA9kf8e+8WgLByDHjQ0vRVvs1asyVQp5QrN/l+Lz4AoVJa+4njXlQbqvcim+WZFUW0J
	GUTAqok8w9l9lcuM3qcd3tHTJYb1mcTkTMzTQhLXDKN4v8apsiHo+JlcNBies2m19vJ5Juv
	1jmdZoaLMmX1KMY=
X-QQ-XMRINFO: NS+P29fieYNwqS3WCnRCOn9D1NpZuCnCRA==
X-QQ-RECHKSPAM: 0

CCF passes the selected parent's rate to set_rate(). Searching other
parents at that point can produce a divider for a different source,
making the programmed rate disagree with CCF's selection.

Restrict divider selection to the supplied parent rate and use the same
rounding as divider_recalc_rate(). Track the best error separately so
low-rate requests do not leave the initial zero-Hz candidate selected.
Skip zero-rate parents and have determine_rate() reject requests when no
usable parent exists.

Fixes: 1b72c59db0ad ("clk: spacemit: Add clock support for SpacemiT K1 SoC")
Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
---
 drivers/clk/spacemit/ccu_mix.c | 27 +++++++++++++++++++++------
 1 file changed, 21 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/spacemit/ccu_mix.c b/drivers/clk/spacemit/ccu_mix.c
index a8b407049bf4d..da3c5685d4f65 100644
--- a/drivers/clk/spacemit/ccu_mix.c
+++ b/drivers/clk/spacemit/ccu_mix.c
@@ -107,22 +107,27 @@ ccu_mix_calc_best_rate(struct clk_hw *hw, unsigned long rate,
 	struct ccu_mix *mix = hw_to_ccu_mix(hw);
 	unsigned int parent_num = clk_hw_get_num_parents(hw);
 	struct ccu_div_config *div = &mix->div;
-	u32 div_max = 1 << div->width;
 	unsigned long best_rate = 0;
+	unsigned long best_delta = ULONG_MAX;
 
 	for (int i = 0; i < parent_num; i++) {
 		struct clk_hw *parent = clk_hw_get_parent_by_index(hw, i);
 		unsigned long parent_rate;
+		u32 div_max = 1 << div->width;
 
 		if (!parent)
 			continue;
 
 		parent_rate = clk_hw_get_rate(parent);
+		if (!parent_rate)
+			continue;
 
 		for (int j = 1; j <= div_max; j++) {
-			unsigned long tmp = DIV_ROUND_CLOSEST_ULL(parent_rate, j);
+			unsigned long tmp = DIV_ROUND_UP_ULL(parent_rate, j);
+			unsigned long delta = abs_diff(tmp, rate);
 
-			if (abs(tmp - rate) < abs(best_rate - rate)) {
+			if (delta < best_delta) {
+				best_delta = delta;
 				best_rate = tmp;
 
 				if (div_val)
@@ -146,7 +151,7 @@ static int ccu_mix_determine_rate(struct clk_hw *hw,
 					   &req->best_parent_hw,
 					   &req->best_parent_rate,
 					   NULL);
-	return 0;
+	return req->rate ? 0 : -EINVAL;
 }
 
 static int ccu_mix_set_rate(struct clk_hw *hw, unsigned long rate,
@@ -155,9 +160,19 @@ static int ccu_mix_set_rate(struct clk_hw *hw, unsigned long rate,
 	struct ccu_mix *mix = hw_to_ccu_mix(hw);
 	struct ccu_common *common = &mix->common;
 	struct ccu_div_config *div = &mix->div;
-	u32 current_div, target_div, mask;
+	u32 current_div, target_div = 0, mask;
+	unsigned long best_delta = ULONG_MAX;
+
+	/* set_rate must use the parent selected by CCF, not search other parents. */
+	for (u32 i = 1; i <= BIT(div->width); i++) {
+		unsigned long divided = DIV_ROUND_UP_ULL(parent_rate, i);
+		unsigned long delta = abs_diff(divided, rate);
 
-	ccu_mix_calc_best_rate(hw, rate, NULL, NULL, &target_div);
+		if (delta < best_delta) {
+			best_delta = delta;
+			target_div = i - 1;
+		}
+	}
 
 	current_div = ccu_read(common, ctrl) >> div->shift;
 	current_div &= (1 << div->width) - 1;

-- 
2.55.0

