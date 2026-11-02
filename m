Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793653659;
	b=107w6WRAE0MdqJlPnNXvkort9rvLf8Ir/mKbO6mFqfsS1z2AyEVIgv2RPH6fhTXb0rtn
	 UcuB6EwS/MDaSg0Li3YKwBQ3xh69fb00q67iiDW2+L5gbmlhZWXhPb430yUdRuf9uTVhX
	 sJecwWA2glt7iggUF1bgMSTrUh+/5jzpb0dn/M0th4thF7nLUcoQzVFs8gVKTU5B5B0p6
	 ymkbYjfYJK0g5XZoOFfhaZ85fToXPjoVat+ntuaQVua0Bp2O6CUe9v6NnBXexez5C4TjD
	 kxMtzLBfG6cpwXi1mEuRUuRToGfJNoaATcRa8WZ1Pbt6HKoBnYhXWxb3UpFjiglC84A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793653659;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=aSSDxY+9CyiEWW00k2jnJIS31DCHlCWmIQW8C6STWxc=;
	b=2ZG4I7Tt0YEs9BjeHujyhJmWr4VNfd8AkspVfNn+HLzPM7Paf5sdBgRN5uKFDhfWHJIG
	 ON6P23DOfuTLwxltGZFmZm2lEV4Lm6FIVjx1MqxttFoyKKNtGlMk+DQWKj7YH0BDk1N47
	 dnSh1M7QiPQIstaXM7WxgQm2WTojb08ZifYM663Igg8ze3Y9aSURGmZoQLiLX1skwD94b
	 6bZHrL6c26S5Sed1oah4kQ0d0u1CvICYVj9olb6kXrqwrBDFHudHB5O/wBVxiz+PJaDtI
	 gmdhaGMmiORS4pq7FWM9ZPUp79/F5NB+UHZGY8Txp1hDU9nI96Hoys8waM1WycoAAqg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=Xl56kX5B;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 471BA606D804
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 21:07:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 471BA606D804
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=Xl56kX5B
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48c45111bebso1490763f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 13:07:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793653657; x=1794258457; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aSSDxY+9CyiEWW00k2jnJIS31DCHlCWmIQW8C6STWxc=;
        b=Xl56kX5BcVWqeAIlmfad96f99F/wo4b7MJAwN+QI72NRYb+SjjKVcF/hrUy3sznTnQ
         9g90qrNncmlF8NkXvcuqOWbs8gzhqO3tNvH8aomb9LJMhwF+LRhWQsqgHuwScxvnyS8J
         t09Fv0v6+b9vWq51ip2uMR8NIfB5a4yzlHYIdAp+Nuja+Mpo2rVP3qrLjbwZhsLTGQGh
         2+PCdF6X9SQlaSQFOe+5foFwM/jo+XTdzoCLnQBtyYlu4WnkJJ0MgPEu733Bf1P7RSk/
         5B+pPB3COeFtqQ0VUt/49nxnyt5dmqy9LRZ3Oc4VLEFTQUsI/qyfdOSLw5Jrt4q4eSBU
         5bHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793653657; x=1794258457;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aSSDxY+9CyiEWW00k2jnJIS31DCHlCWmIQW8C6STWxc=;
        b=LPxpJ/l3ZZLuqqZTZb2cNZAUOYeGn9ttNdbqejzx4QlCyXcUBBedmD+cHT0yMojj54
         w0azN/auCcI0Rsd8UCMmN+OmBP8M49ym/ekERr0lciFmKY+cBwQRgBni3B7mztuT4RoJ
         tYzoTA8aqYwqlfjcCL13GPJYITk1+gPX7SPQjXq24B8WrcEKRlNed2zUSRHuLJWjsXu5
         qR0yTbhSSr8InmJ09KnG6s6VBT2Zg+GSN7en7j5T8JQ/C4iieSfytsvVwo/KiN3AHtd8
         C2eJarN1WIrQsodUhsbIse1ZO/7VrsgEtcCB6fgDKrB6RVHqLr5CVDAz81bOTWvFncyu
         ZaJw==
X-Forwarded-Encrypted: i=1; AKwUvBzqZzpWDZ09aHnldRDsIcjTcRsbBI4y2zA6M0It4WGg7n2HoxWmYD2i7SX7MVbcBNlnS+/bGHFyxMqLesE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/0n3/IVsQe7687EKRkW08NxhCLnUL2BgR+hmq4sPFTy3aA0kP1
	3oss6PrmY5whBm3Y2Z46sqftRWmC0zd7WZr58xfNhCKCF2s74w31X68MVYNZVJOIiik=
X-Gm-Gg: AYBFou2gqMU/oQ9UQY98iyJhnT4I52T5EDh8yymSEX69k8aMzKFx4+XPEQdupS0vaef
	LuLLegHcbZoMOqY6ndvhTvxsCyXnj87+MJxFgPaR/pDnJTuN7InfAKoIPoPd/cFLUNJf68l+CPh
	w/Y81BdMA+8ecve7rAUtwimWDK8AOshyYuYYg3uO7oBAHhqHPIqawFmEjwH+N0kFsXu7W0Xv1LU
	/RshMyxowaTH+saoyRNUqfon0mOYNFemJdZtQfVqKkrGJmgZOsP+kfkuo7pFhG/LVpkjNVTCI9b
	hLaLxNvogzTELSf2KlbLkkgJ102QKUAncq3H/TOS9M8MCsMbeZs7C5s+6IRR2gAachTLVbs/Qcl
	tfPzhnC0XAtjxRCQEFm4I+rXlA+shhjNFg72xyCM0542lVGgsN0VoxoeC0tEXrEswrcYEKA6Qu5
	1G94XWrIPFX0I9XTzGbTlpuZErpM7+PrcpHXBnLu3okRGvRzqtV+yvFlDKGpiB5nGh3cYb5fecV
	os3L1zdk4ebmSbcIINM6HX87Xsdo+HuclZD2VHl8L9BKLf/2wya/e/9KqZw3J4g+QMsYWiivBi1
	LDtsVHJbeg8jYUeeSBZkbqNJfMNXZexaWjj8QcjFlgEwYI5IsL8SK7vMO3a2v363cyG8LHC9L3C
	kzwWqVYEBvh3zCZHeb7o=
X-Received: by 2002:a05:6000:46c5:b0:48e:5db7:fd6c with SMTP id ffacd0b85a97d-48e6e2bde59mr15156967f8f.4.1793653656732;
        Mon, 02 Nov 2026 13:07:36 -0800 (PST)
Received: from [127.0.0.1] (host-95-246-144-141.retail.telecomitalia.it. [95.246.144.141])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b8a7d1sm21765308f8f.38.2026.11.02.13.07.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 13:07:35 -0800 (PST)
From: Carlo Caione <ccaione@baylibre.com>
Date: Mon, 02 Nov 2026 22:07:21 +0100
Subject: [PATCH 2/2] clk: divider: test: Add tests for rates above 4.29 GHz
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
Message-Id: <20261102-upstream-clk-divider-large-rates-v1-2-eb17035bfad2@baylibre.com>
References: <20261102-upstream-clk-divider-large-rates-v1-0-eb17035bfad2@baylibre.com>
In-Reply-To: <20261102-upstream-clk-divider-large-rates-v1-0-eb17035bfad2@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Brian Norris <computersforpeace@gmail.com>
Cc: Brian Norris <briannorris@chromium.org>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 David Laight <david.laight.linux@gmail.com>, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Stephen Boyd <sboyd@codeaurora.org>, 
 Carlo Caione <ccaione@baylibre.com>
X-Mailer: b4 0.16.0

On 64-bit platforms, the divider truncated rates above 4.29 GHz when
computing a divisor.

Add tests rounding and setting such rates on a divider with a 6 GHz
parent, one for each divisor computation. They are skipped on 32-bit
platforms, where rates cannot exceed 4.29 GHz.

Signed-off-by: Carlo Caione <ccaione@baylibre.com>
---
 drivers/clk/clk-divider_test.c | 117 ++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 115 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/clk-divider_test.c b/drivers/clk/clk-divider_test.c
index 8ee1614128d0..fc96ac07ecff 100644
--- a/drivers/clk/clk-divider_test.c
+++ b/drivers/clk/clk-divider_test.c
@@ -1,16 +1,19 @@
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
 
 KUNIT_DEFINE_ACTION_WRAPPER(clk_hw_unregister_fixed_rate_wrapper,
 			    clk_hw_unregister_fixed_rate, struct clk_hw *);
@@ -147,7 +150,117 @@ static struct kunit_suite clk_divider_bestdiv_test_suite = {
 	.test_cases = clk_divider_bestdiv_test_cases,
 };
 
-kunit_test_suite(clk_divider_bestdiv_test_suite);
+/*
+ * Register a 6 GHz fixed-rate parent and a 3-bit divider (/1 to /8) using
+ * @fake_reg as its register.
+ */
+static struct clk_hw *clk_divider_large_rate_init(struct kunit *test,
+						  u32 *fake_reg,
+						  unsigned long flags,
+						  u8 div_flags)
+{
+	struct clk_hw *parent_hw, *div_hw;
+
+	if (BITS_PER_LONG < 64)
+		kunit_skip(test, "rates above 4.29 GHz need a 64-bit unsigned long");
+
+	parent_hw = clk_hw_register_fixed_rate(NULL, "large-rate-parent",
+					       NULL, 0, PARENT_RATE_6GHZ);
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
+	div_hw = clk_divider_large_rate_init(test, fake_reg, 0, 0);
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
+	div_hw = clk_divider_large_rate_init(test, fake_reg, 0,
+					     CLK_DIVIDER_ROUND_CLOSEST);
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
+	div_hw = clk_divider_large_rate_init(test, fake_reg,
+					     CLK_SET_RATE_PARENT, 0);
+	clk = clk_hw_get_clk_kunit(test, div_hw, NULL);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, clk);
+
+	KUNIT_ASSERT_EQ(test, clk_set_rate(clk, PARENT_RATE_6GHZ), 0);
+	KUNIT_EXPECT_EQ(test, clk_get_rate(clk), PARENT_RATE_6GHZ);
+	KUNIT_EXPECT_EQ(test, *fake_reg, 0);
+}
+
+static struct kunit_case clk_divider_large_rate_test_cases[] = {
+	KUNIT_CASE(clk_divider_large_rate_round_up),
+	KUNIT_CASE(clk_divider_large_rate_round_closest),
+	KUNIT_CASE(clk_divider_large_rate_set_rate),
+	{}
+};
+
+static struct kunit_suite clk_divider_large_rate_test_suite = {
+	.name = "clk_divider_large_rate",
+	.test_cases = clk_divider_large_rate_test_cases,
+};
+
+kunit_test_suites(&clk_divider_bestdiv_test_suite,
+		  &clk_divider_large_rate_test_suite);
 
 MODULE_DESCRIPTION("KUnit tests for clk divider");
 MODULE_LICENSE("GPL");

-- 
2.56.0

