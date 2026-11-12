Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794476230;
	b=e95q6aYTvTggs2p5SpnmZQRvK5Zb1v8ez2qKCTnbfKsm8t61i+WMx3Z+Go+AkVgq6XGf
	 MDYcuqYDW0RNjCf28W9iBKpxMT1urHt8eDSSjwt5WFtJTo+uO7o/80Evf9HQ80S1Gwrxy
	 uXdRg6+zG3KQyVUd9zjJ2J+cDPC16PqYGUh6VmTMJCAJZpqprAATpZPcyH8ZjCX80K1Et
	 MaaLcO06Em9j+s/I/1xqW9DUkvG2zuHvi+tSKujf5GXh74SFpZ1gNaQIx9M0P2n6JaEd1
	 UYfIWqNU/oWgwX67e2Lb6pmvBWfdHCijlhNz7DKy0dgFOK8QHeywJOropdbW2W033hQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794476230;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=iyoFmNnYbDPk3oNrYWmtK2x4caK8MQjUWCsqfNokv2w=;
	b=mweNR9TnEOOR8csOj7QpbTD+2qw8ocj0dQc8c+eU63Pzjp8haccmiJcmP1wD7U3mVsoe
	 CZgYDdr3MaFlDGYzGTn9v+gszL4q1eOUSp41Y+TqxIzaoFbpGKyX4JSS3T90Xb2akcCMI
	 Ju2zwR1eRzosIWYBeSgmr50IZuzYhs07TE+omTvD3T9jNsxN3aoWNy1y1IrqylCPhiAYY
	 lZyUJ8wxmxPO6nGK7nuQrVdXyCcNnabkbuk15xT2xJvybdmRXlZv9aMGTIr7eIBOHgPze
	 G5vUcUQLuNPSmdactRYXIPIoQ3deB/jHCZZ6zqYRFOt5dTgdvwdzzU+uY2LehFMNg2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b="cM/5fU3P";
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55F0E606A899
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 09:37:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 55F0E606A899
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=cM/5fU3P
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a215e64962so44290655e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 01:37:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794476229; x=1795081029; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iyoFmNnYbDPk3oNrYWmtK2x4caK8MQjUWCsqfNokv2w=;
        b=cM/5fU3PUqJ0ee0Dyfs1ToNwA/25ojzVM/lCrRTrXeKrA238CXFVEjWG1kKL/33A+G
         wLcE+3HOIx/kMCMxk0iffdnkuQbdXoS9/V5PfViT4T1DhrgO2lYMm1SeGgwbkzOdW4MV
         Sdrr0DKLEgYlP7lumcPzQaB4KTfX7VFghhlkNmrPvUfSbrwdO4bsKL/lgqO1AKa0Fez9
         RWDE0OQCRfJHm+oX8BurxmHFcb72VHjsdyo4sOV0kMSB+5D/wB7e27y8P9Bl11GBJnom
         Qgh336+/PZZ+XymMvjG0BqnRY5z91/vNoITuPK/Rcb73BHXgc61l/25d0nkzULqeUufO
         b64g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794476229; x=1795081029;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iyoFmNnYbDPk3oNrYWmtK2x4caK8MQjUWCsqfNokv2w=;
        b=k/o7wOY9Ipf6FavnDQu8zNWnahlrLXb4fFXCrTSPlSQm8y9JE50rzYmiKJIqVH7AmG
         o2lpqqOfcm+oVXOpN9id3xsxChiFIPOp13t1hUN57FomkO/VeqXpu09KMRSzL6sz1NQT
         +tOe8Vcbn2qz5ezxO2mpQjSMqxnyWJdBPpsiy2/wGnUt9NoryWIKNazMwJCrqf1qtqNM
         ikdL52M+c4deNwx1EnwF8hroENnuqdOBmZ9kS2W8Vr098/N6VPzznRiWDXdXIEvNieVN
         EZSEIrFg8NeHOjyLwmypfZ+EiwZtVoduwKeRLMGsl38h9Cttp+z4sx//QNuFluq1sOEN
         muBQ==
X-Forwarded-Encrypted: i=1; AL+hErGRBdUqkcF3XaX2HwafHtrGDxNVv+DtegIryu2FNcaAy7cAMuP+oEfgPmGEY8qWUjyZa/Iynt9g7S0w0pY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/5O1u4d3Yjij5WpwfKiTMnL4K9DVS/sO35RZrX5giUUYhbmN0N
	IV5n5ZxuEk9F4lAWj9JA80SBpEjkGq2IkCRlHXuQxi4144uf5J9nCQ4MwXd+Y3D22WI=
X-Gm-Gg: AYBFou2vh9ebsDpasqOayEfUIWMbBe9SsKQH1JV2u+1Cr6l64GkOWVknjzQ59Yr6zT2
	s9wPTrtNVYrn/HiFILLxtcLelsdbQ+g0g9voHDNHJn/DoHrm41Up2VsAe4b540XGvSCpCoxNC7h
	y2HV7+i7g/yAY9knwW1vWfyDW9fMR94pObxD+izyBHryHGkqZ7bNyqI0L0eWuLFxzZ2qWOAqs6a
	eSJMp5x5CIRPyCqu4nHQTI14QR1b65stvNn5Wu1QxxQfN4mxzCjua1GWApIpeF3NMRhBsb6ropk
	E8bSfK621aJe1rN+E0fpeKt/bMIrZ6LEUg4NHwLYKVPf7DEW7hrAEzoFeJvmgTioiCbHiDoTDMy
	A9VM21NkaIcGnR3AKDtBzmEBMkTuqbHK4HBtMOlXAdxPn8MxolAfad5VOOlJWFN55JsLK0BCD+T
	UAQGmsCVcOJ6r1d5IfPuELyiZTGkNEro8hBeI7RaL0wUfEPAiGILet1TmBoIV1MftgyCGhdKg5b
	cR/P5oLQ9fTqIeZ2yJmpxrVnnlPo43P3g9WTlQH4zLZzMqmOubyFoz2ydMMHNQb2O6xqFekYYVz
	GN5CEWCOeB61oQ4hjF43MshXmmgakjyioHJ5OkUg/lB41sbuWcnire0MQ6xIvaISwLXKLfAKXda
	TQ6/j1mVIYDhlv7kb7D8HRqLKGqtm+SKoheW1m4vs9WBe7w==
X-Received: by 2002:a05:600c:3103:b0:4a1:e00b:a10b with SMTP id 5b1f17b1804b1-4ba09364007mr87667585e9.7.1794476228638;
        Thu, 12 Nov 2026 01:37:08 -0800 (PST)
Received: from macbook.homenet.telecomitalia.it (host-95-246-144-141.retail.telecomitalia.it. [95.246.144.141])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba08de826asm85413905e9.0.2026.11.12.01.37.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 01:37:08 -0800 (PST)
From: Carlo Caione <ccaione@baylibre.com>
Date: Thu, 12 Nov 2026 10:37:01 +0100
Subject: [PATCH v2 3/3] clk: divider: test: Add tests for rates above 4.29
 GHz
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
Message-Id: <20261112-upstream-clk-divider-large-rates-v2-3-18f3bb888b0c@baylibre.com>
References: <20261112-upstream-clk-divider-large-rates-v2-0-18f3bb888b0c@baylibre.com>
In-Reply-To: <20261112-upstream-clk-divider-large-rates-v2-0-18f3bb888b0c@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Brian Norris <computersforpeace@gmail.com>, 
 Maxime Coquelin <maxime.coquelin@st.com>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Michael Turquette <mturquette@linaro.org>
Cc: Stephen Boyd <sboyd@codeaurora.org>, 
 David Laight <david.laight.linux@gmail.com>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Carlo Caione <ccaione@baylibre.com>
X-Mailer: b4 0.16.0

On 64-bit platforms, the divider truncated rates above 4.29 GHz when
computing a divisor.

Add tests rounding and setting such rates on a divider with a 6 GHz
parent, one for each divisor computation, and rounding the maximum rate
(ULONG_MAX). They are skipped on 32-bit platforms, where rates cannot
exceed 4.29 GHz. Also test round-closest dividers above their parent
rate.

Signed-off-by: Carlo Caione <ccaione@baylibre.com>
---
 drivers/clk/clk-divider_test.c | 244 ++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 242 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/clk-divider_test.c b/drivers/clk/clk-divider_test.c
index 8ee1614128d0..734cbdad55dd 100644
--- a/drivers/clk/clk-divider_test.c
+++ b/drivers/clk/clk-divider_test.c
@@ -1,16 +1,20 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
- * KUnit tests for clk_divider_bestdiv()
+ * KUnit tests for clk divider
  */
+#include <kunit/clk.h>
 #include <kunit/test.h>
 #include <linux/clk.h>
 #include <linux/clk-provider.h>
+#include <linux/io.h>
 #include <linux/limits.h>
 #include <linux/units.h>
 
 #define PARENT_RATE_1GHZ	GIGA
 #define PARENT_RATE_2GHZ	(2 * GIGA)
 #define PARENT_RATE_4GHZ	(4 * GIGA)
+#define PARENT_RATE_6GHZ	(6 * GIGA)
+#define PARENT_RATE_10GHZ	(10 * GIGA)
 
 KUNIT_DEFINE_ACTION_WRAPPER(clk_hw_unregister_fixed_rate_wrapper,
 			    clk_hw_unregister_fixed_rate, struct clk_hw *);
@@ -147,7 +151,243 @@ static struct kunit_suite clk_divider_bestdiv_test_suite = {
 	.test_cases = clk_divider_bestdiv_test_cases,
 };
 
-kunit_test_suite(clk_divider_bestdiv_test_suite);
+/*
+ * Register a fixed-rate parent at @parent_rate and a 3-bit divider (/1 to
+ * /8) using @fake_reg as its register.
+ */
+static struct clk_hw *clk_divider_large_rate_init(struct kunit *test,
+						  u32 *fake_reg,
+						  unsigned long parent_rate,
+						  unsigned long flags,
+						  u8 div_flags)
+{
+	struct clk_hw *parent_hw, *div_hw;
+
+	if (BITS_PER_LONG < 64)
+		kunit_skip(test, "rates above 4.29 GHz need a 64-bit unsigned long");
+
+	parent_hw = clk_hw_register_fixed_rate(NULL, "large-rate-parent",
+					       NULL, 0, parent_rate);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, parent_hw);
+	KUNIT_ASSERT_EQ(test, 0,
+			kunit_add_action_or_reset(test, clk_hw_unregister_fixed_rate_wrapper,
+						  parent_hw));
+
+	div_hw = clk_hw_register_divider(NULL, "large-rate-div",
+					 "large-rate-parent", flags,
+					 (void __iomem __force *)fake_reg,
+					 0, 3, div_flags, NULL);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, div_hw);
+	KUNIT_ASSERT_EQ(test, 0,
+			kunit_add_action_or_reset(test, clk_hw_unregister_divider_wrapper,
+						  div_hw));
+
+	return div_hw;
+}
+
+/*
+ * Test that rounding a rate above 4.29 GHz computes the divisor from the
+ * full rate: the parent rate needs /1.
+ */
+static void clk_divider_large_rate_round_up(struct kunit *test)
+{
+	struct clk_hw *div_hw;
+	u32 *fake_reg;
+
+	fake_reg = kunit_kzalloc(test, sizeof(*fake_reg), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, fake_reg);
+
+	div_hw = clk_divider_large_rate_init(test, fake_reg, PARENT_RATE_6GHZ,
+					     0, 0);
+
+	KUNIT_EXPECT_EQ(test, clk_hw_round_rate(div_hw, PARENT_RATE_6GHZ),
+			PARENT_RATE_6GHZ);
+}
+
+/*
+ * Same with CLK_DIVIDER_ROUND_CLOSEST: 4.4 GHz is closer to 3 GHz (/2) than
+ * to 6 GHz (/1).
+ */
+static void clk_divider_large_rate_round_closest(struct kunit *test)
+{
+	struct clk_hw *div_hw;
+	u32 *fake_reg;
+
+	fake_reg = kunit_kzalloc(test, sizeof(*fake_reg), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, fake_reg);
+
+	div_hw = clk_divider_large_rate_init(test, fake_reg, PARENT_RATE_6GHZ,
+					     0, CLK_DIVIDER_ROUND_CLOSEST);
+
+	KUNIT_EXPECT_EQ(test, clk_hw_round_rate(div_hw, 4400 * MEGA),
+			PARENT_RATE_6GHZ / 2);
+}
+
+/*
+ * Test that setting a rate above 4.29 GHz programs the right divisor.
+ * With CLK_SET_RATE_PARENT the rounding searches the parent rates and
+ * finds /1, so this only checks the set_rate path.
+ */
+static void clk_divider_large_rate_set_rate(struct kunit *test)
+{
+	struct clk_hw *div_hw;
+	struct clk *clk;
+	u32 *fake_reg;
+
+	fake_reg = kunit_kzalloc(test, sizeof(*fake_reg), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, fake_reg);
+
+	/* Start from /2 */
+	writel(1, (void __iomem __force *)fake_reg);
+
+	div_hw = clk_divider_large_rate_init(test, fake_reg, PARENT_RATE_6GHZ,
+					     CLK_SET_RATE_PARENT, 0);
+	clk = clk_hw_get_clk_kunit(test, div_hw, NULL);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, clk);
+
+	KUNIT_ASSERT_EQ(test, clk_set_rate(clk, PARENT_RATE_6GHZ), 0);
+	KUNIT_EXPECT_EQ(test, clk_get_rate(clk), PARENT_RATE_6GHZ);
+	KUNIT_EXPECT_EQ(test, *fake_reg, 0);
+}
+
+/*
+ * Round ULONG_MAX, the usual way to ask for the maximum rate, on a divider
+ * with a @parent_rate parent: it must return the parent rate.
+ */
+static void clk_divider_large_rate_check_max(struct kunit *test,
+					     unsigned long parent_rate,
+					     u8 div_flags)
+{
+	struct clk_hw *div_hw;
+	u32 *fake_reg;
+
+	fake_reg = kunit_kzalloc(test, sizeof(*fake_reg), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, fake_reg);
+
+	div_hw = clk_divider_large_rate_init(test, fake_reg, parent_rate, 0,
+					     div_flags);
+
+	KUNIT_EXPECT_EQ(test, clk_hw_round_rate(div_hw, ULONG_MAX), parent_rate);
+}
+
+static void clk_divider_large_rate_round_max(struct kunit *test)
+{
+	clk_divider_large_rate_check_max(test, PARENT_RATE_6GHZ, 0);
+}
+
+/* Same with a parent more than twice the 32-bit limit */
+static void clk_divider_large_rate_round_max_10ghz(struct kunit *test)
+{
+	clk_divider_large_rate_check_max(test, PARENT_RATE_10GHZ, 0);
+}
+
+/* Same with CLK_DIVIDER_ROUND_CLOSEST */
+static void clk_divider_large_rate_round_max_closest(struct kunit *test)
+{
+	clk_divider_large_rate_check_max(test, PARENT_RATE_6GHZ,
+					 CLK_DIVIDER_ROUND_CLOSEST);
+}
+
+/* Same with CLK_DIVIDER_POWER_OF_TWO and a 1 GHz parent */
+static void clk_divider_large_rate_round_max_pow2(struct kunit *test)
+{
+	clk_divider_large_rate_check_max(test, PARENT_RATE_1GHZ,
+					 CLK_DIVIDER_POWER_OF_TWO);
+}
+
+static struct kunit_case clk_divider_large_rate_test_cases[] = {
+	KUNIT_CASE(clk_divider_large_rate_round_up),
+	KUNIT_CASE(clk_divider_large_rate_round_closest),
+	KUNIT_CASE(clk_divider_large_rate_set_rate),
+	KUNIT_CASE(clk_divider_large_rate_round_max),
+	KUNIT_CASE(clk_divider_large_rate_round_max_10ghz),
+	KUNIT_CASE(clk_divider_large_rate_round_max_closest),
+	KUNIT_CASE(clk_divider_large_rate_round_max_pow2),
+	{}
+};
+
+static struct kunit_suite clk_divider_large_rate_test_suite = {
+	.name = "clk_divider_large_rate",
+	.test_cases = clk_divider_large_rate_test_cases,
+};
+
+/*
+ * Register a 1 GHz fixed-rate parent and a round-closest 3-bit divider using
+ * @fake_reg as its register and @table, if not NULL, as its divider table.
+ */
+static struct clk_hw *clk_divider_above_parent_init(struct kunit *test,
+						    u32 *fake_reg,
+						    const struct clk_div_table *table)
+{
+	struct clk_hw *parent_hw, *div_hw;
+
+	parent_hw = clk_hw_register_fixed_rate(NULL, "above-parent-parent",
+					       NULL, 0, PARENT_RATE_1GHZ);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, parent_hw);
+	KUNIT_ASSERT_EQ(test, 0,
+			kunit_add_action_or_reset(test, clk_hw_unregister_fixed_rate_wrapper,
+						  parent_hw));
+
+	div_hw = clk_hw_register_divider_table(NULL, "above-parent-div",
+					       "above-parent-parent", 0,
+					       (void __iomem __force *)fake_reg,
+					       0, 3, CLK_DIVIDER_ROUND_CLOSEST,
+					       table, NULL);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, div_hw);
+	KUNIT_ASSERT_EQ(test, 0,
+			kunit_add_action_or_reset(test, clk_hw_unregister_divider_wrapper,
+						  div_hw));
+
+	return div_hw;
+}
+
+/*
+ * Test that a round-closest divider asked for more than its parent rate
+ * picks its smallest divider: /1.
+ */
+static void clk_divider_above_parent_round_closest(struct kunit *test)
+{
+	struct clk_hw *div_hw;
+	u32 *fake_reg;
+
+	fake_reg = kunit_kzalloc(test, sizeof(*fake_reg), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, fake_reg);
+
+	div_hw = clk_divider_above_parent_init(test, fake_reg, NULL);
+
+	KUNIT_EXPECT_EQ(test, clk_hw_round_rate(div_hw, PARENT_RATE_2GHZ),
+			PARENT_RATE_1GHZ);
+}
+
+/* Same with a divider table, whose smallest divider is /2 */
+static void clk_divider_above_parent_round_closest_table(struct kunit *test)
+{
+	struct clk_hw *div_hw;
+	u32 *fake_reg;
+
+	fake_reg = kunit_kzalloc(test, sizeof(*fake_reg), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, fake_reg);
+
+	div_hw = clk_divider_above_parent_init(test, fake_reg, bestdiv_table);
+
+	KUNIT_EXPECT_EQ(test, clk_hw_round_rate(div_hw, PARENT_RATE_2GHZ),
+			PARENT_RATE_1GHZ / 2);
+}
+
+static struct kunit_case clk_divider_above_parent_test_cases[] = {
+	KUNIT_CASE(clk_divider_above_parent_round_closest),
+	KUNIT_CASE(clk_divider_above_parent_round_closest_table),
+	{}
+};
+
+static struct kunit_suite clk_divider_above_parent_test_suite = {
+	.name = "clk_divider_above_parent",
+	.test_cases = clk_divider_above_parent_test_cases,
+};
+
+kunit_test_suites(&clk_divider_bestdiv_test_suite,
+		  &clk_divider_large_rate_test_suite,
+		  &clk_divider_above_parent_test_suite);
 
 MODULE_DESCRIPTION("KUnit tests for clk divider");
 MODULE_LICENSE("GPL");

-- 
2.56.0

