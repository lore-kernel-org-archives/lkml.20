Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793771943;
	b=uynyM4T0HHGWGciG9AI6iQoSXkeTHxX83IJiimOL8kvq6su676tDXVHcl7qzTnmEeYX9
	 HWHfd7I/Lsmrhja7+EYDdsAyLDcLwmMsp9RetpqGl9/QWirO7ToXurQbs54fCktoiaRhr
	 UhJDo5TT3LJEvAfIK4V9eYi6X/+F6nIYAMbU1NVOplAoKA48/KRpfw5icScIhmWZKSji0
	 cO6FZEdetEiSrDo0ucbWsr5aj8Ge5q8jFBjqarNNHhJuGsoSRiXVVfwjajPMrQbsNi8hE
	 qE5ForzU2t6UTQ3/xnKYqAHyWxhxtv/uDjLKpgE7Ltc+zgAyZMGMQkRjHDnDvFqfR+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793771943;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=pExYmEdIIPdLsjT97NoDGGge/io4twUE/VxiyujIbn0=;
	b=Ai5TF7EviI8XRLyD9v2AQN/jLXgGcv8kRr61vnelQfPnK8ZR4+k+rsvVESQvno0/yvxq
	 nU39aL4wBf9+vSz66UzTdJqI8L4vYoVBv3AyiVGurvHmUlXH6Zh8cakIvwQOg2JGZy7yX
	 0vaHapgMsS4DugXLkxH1n5Q5G2yPlEnK4LB10vq6eWyUrIQer7Mb4Ud/+6xGaE0CDDO3f
	 nqnQ+ljH6yKpx0cCvCRfSske/p21HJc2IhB5CmfnTOUD0Xdk5xxgZCfsWTKWcDPrKRIZD
	 ST9HX4L7CREzjIam9qrEEmP9YV42wOXJJiiwKO5Ab5uT8bqB+DhjuPB8FoGt9JTIFOA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="nY/jG0of";
	arc=none smtp.remote-ip=209.85.215.182
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1046606A33C
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 05:59:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C1046606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nY/jG0of
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-cd6028ff33fso142649a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 21:59:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793771942; x=1794376742; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pExYmEdIIPdLsjT97NoDGGge/io4twUE/VxiyujIbn0=;
        b=nY/jG0ofkyCD+1il5wmdQz3flThCqp/1PJ9uoPnm+rrNhFaGuhZ7VMKKmRVI7H5CNu
         SToDkLAoBW6x3uQ48wd7NW2wfA2gymuDb4xb/NZh4BcLWfk66vHVDEJuK2v3eAdcYlp9
         slWP0FigYoU4hYQ33xrSs0Po8YA3v1hBitEBzNLYUIpQOOWO5l3KWdLGQIHWtrUWxMAu
         pcMiQA2VcLNFutvpvJRuEx9qMhQgPKM3M06JNYyl/O5H+HqvSObBqEqvLAE1uj/ytQoK
         uNtkXjUc64nO5ArQ3ZgdMc5+XB/ON1wx0h21oWWV8Vz5VbTbQ0FBbRZaaaX8DqpEpaGk
         l50A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793771942; x=1794376742;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pExYmEdIIPdLsjT97NoDGGge/io4twUE/VxiyujIbn0=;
        b=rAepIOdSjqcv6eBhesGWRUhfh8V3LgXoR4fYiy5OhaPakSyjIt5ChHZc+X7yigdlNP
         YApZcG3ehZbpQSYQEU3NUZMc15fNYvqBrdV7oyqt5TwA+AhD3f4EjDjYM37mBX1PDjNV
         J/HzwwBtFH5S2yAqbEg6OxQ1rMFwlfWRPqwarxxfA1eNsGik6nUedMpL2TZ54fTz20ot
         L1A5yvPb8d7jAGZ/P2YuOcBjIshuDoyPG8wA2zJSh6MIIyjghW0t28l5otm5zehOckDQ
         +P36WeZlroOWG7Xklbpv7WCMp38AnwWYcSfzRij7JkTo8hrFbXBkgmvFOyTyW88X8Iqd
         5aNQ==
X-Forwarded-Encrypted: i=1; AKwUvBxLBWXCIK3Em0RNSoqdXQSASgu8XiHxmmZPW9fXj3DMX0hsWd9Zua//sIpKKZ8fM77KG0IGle0/1zymKpA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/ML4UD2TMGPLyhG5sybVduR3W9kyyXtAB2gSo/vCY9a1SjhMh9
	uplVoCoR+n6QAECVCSuwnArzgHsj7T8oiuOV3TOUi3PyS4Sduxd0HAiP
X-Gm-Gg: AYBFou15kwYIYbmcciwncy3rpY5FJos3yxZs4lnLRL8Z9kbeUG0E6ohSq1DvBa/XPpT
	Iw+iliYuKHgQ2RX7ZoEalvoKZVn7n0cpGCynZ9IMVV3piqV0lZ2+J2bwJt/cPHsYS/W/RiQnTir
	/gRQBDEspbaD+RWEiz76zh7IVVndMjYAIk07AXp4uZQL4cvDKKDX7k3lEm7TXQngH10B/5jWOAN
	AvO5tBl8xa+AYAWJ2pZbAm6w0Cj8gI0ionAgsOKGF+UST6FSe/E6kROBdDOLdb5yA5Jq6EPdQ7J
	X7HAOjCxIsURCz1Ja1bRxkvsv5WZ5H/ZyPlgHzZkpZNuJI67oiannasZWxVyITaZs0tjh6+SVmA
	9nNTbMHVCvSPfadaceblcIeUgbUjs8kVeAaHliS7m38nOr84m47cSot980/85D5TOVy0JlMwzyR
	x1WQ3DtIlmSHlxPMUjLwI71Jy94EwGDQaZvi8ViYK/JjjoKmPjNP6w3Fk9Ic+DL6n3c9d9nWoME
	aX96CkkH9OZqOtGCD4gF4hAW+yUxhsRvHR3Rp8s2DH83s+YOlIAHqXUnQIs+gu5pWFDrR+c2jSV
	QoS4B+gj4iUX9aPV8lIXuHuA13c2HdBs1biKsBvIDi6Q0Ic3UGxenHUrFbhM58n2kp28twjKR/b
	wBwAN/BJYzjMfkl+guZdYQgTRBoN669hTqxVEL/zZuPNaWtaOcvQsTPmIgrqpIXMvcRsNpKeXWZ
	6bfUs=
X-Received: by 2002:a17:90b:184c:b0:3a6:f1d2:57f3 with SMTP id 98e67ed59e1d1-3ae897d439bmr11767124a91.58.1793771942089;
        Tue, 03 Nov 2026 21:59:02 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c9928c4sm7840110a91.15.2026.11.03.21.59.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 21:59:01 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: linux-mips@vger.kernel.org,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Alban Bedel <albeu@free.fr>,
	Antony Pavlov <antonynpavlov@gmail.com>,
	linux-kernel@vger.kernel.org (open list),
	linux-clk@vger.kernel.org (open list:COMMON CLK FRAMEWORK)
Subject: [PATCH 5/8] clk: ath79: convert to clk_hw based registration
Date: Tue,  3 Nov 2026 21:58:49 -0800
Message-ID: <20261104055852.152340-6-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261104055852.152340-1-rosenp@gmail.com>
References: <20261104055852.152340-1-rosenp@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Register the clocks with the clk_hw API and provide them with
of_clk_add_hw_provider() and of_clk_hw_onecell_get(), instead of the
struct clk based clk_register_*() and of_clk_src_onecell_get().

The AR724x and AR933x CPU, DDR and AHB clocks are fixed factors of the
reference clock, but named their parent "ref". That only works when the
reference clock is registered under that name, as the fallback from the
bootstrap pins is, or a device tree fixed clock whose node happens to be
called "ref". With any other node name, the clocks were orphans and ran
at 0 Hz. Give them the reference clock's clk_hw as the parent instead.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/clk/clk-ath79.c | 68 ++++++++++++++++++++++-------------------
 1 file changed, 36 insertions(+), 32 deletions(-)

diff --git a/drivers/clk/clk-ath79.c b/drivers/clk/clk-ath79.c
index 8279d58be318..3afda29377b5 100644
--- a/drivers/clk/clk-ath79.c
+++ b/drivers/clk/clk-ath79.c
@@ -18,17 +18,14 @@
 #include <linux/clk-provider.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
+#include <linux/slab.h>
 #include <dt-bindings/clock/ath79-clk.h>
 
 #include <asm/div64.h>
 
 #include "clk-ath79.h"
 
-static struct clk *clks[ATH79_CLK_END];
-static struct clk_onecell_data clk_data = {
-	.clks = clks,
-	.clk_num = ARRAY_SIZE(clks),
-};
+static struct clk_hw_onecell_data *clk_data;
 
 static const char * const clk_names[ATH79_CLK_END] = {
 	[ATH79_CLK_CPU] = "cpu",
@@ -44,42 +41,44 @@ static const char * __init ath79_clk_name(int type)
 	return clk_names[type];
 }
 
-static void __init __ath79_set_clk(int type, const char *name, struct clk *clk)
+static void __init __ath79_set_clk(int type, const char *name,
+				   struct clk_hw *hw)
 {
-	if (IS_ERR(clk))
+	if (IS_ERR(hw))
 		panic("failed to allocate %s clock structure", clk_names[type]);
 
-	clks[type] = clk;
-	clk_register_clkdev(clk, name, NULL);
+	clk_data->hws[type] = hw;
+	clk_hw_register_clkdev(hw, name, NULL);
 }
 
-static struct clk * __init ath79_set_clk(int type, unsigned long rate)
+static void __init ath79_set_clk(int type, unsigned long rate)
 {
 	const char *name = ath79_clk_name(type);
-	struct clk *clk;
+	struct clk_hw *hw;
 
-	clk = clk_register_fixed_rate(NULL, name, NULL, 0, rate);
-	__ath79_set_clk(type, name, clk);
-	return clk;
+	hw = clk_hw_register_fixed_rate(NULL, name, NULL, 0, rate);
+	__ath79_set_clk(type, name, hw);
 }
 
-static struct clk * __init ath79_set_ff_clk(int type, const char *parent,
-					    unsigned int mult, unsigned int div)
+/* a clock derived from the reference clock by a fixed factor */
+static void __init ath79_set_ff_clk(int type, unsigned int mult,
+				    unsigned int div)
 {
 	const char *name = ath79_clk_name(type);
-	struct clk *clk;
+	struct clk_hw *hw;
 
-	clk = clk_register_fixed_factor(NULL, name, parent, 0, mult, div);
-	__ath79_set_clk(type, name, clk);
-	return clk;
+	hw = clk_hw_register_fixed_factor_parent_hw(NULL, name,
+						    clk_data->hws[ATH79_CLK_REF],
+						    0, mult, div);
+	__ath79_set_clk(type, name, hw);
 }
 
 static unsigned long __init ath79_get_ref_rate(void)
 {
-	if (!clks[ATH79_CLK_REF])
+	if (!clk_data->hws[ATH79_CLK_REF])
 		panic("ath79: no reference clock");
 
-	return clk_get_rate(clks[ATH79_CLK_REF]);
+	return clk_hw_get_rate(clk_data->hws[ATH79_CLK_REF]);
 }
 
 static void __init ar71xx_clocks_init(void __iomem *pll_base)
@@ -128,9 +127,9 @@ static void __init ar724x_clocks_init(void __iomem *pll_base)
 	ddr_div = FIELD_GET(AR724X_DDR_DIV, pll) + 1;
 	ahb_div = (FIELD_GET(AR724X_AHB_DIV, pll) + 1) * 2;
 
-	ath79_set_ff_clk(ATH79_CLK_CPU, "ref", mult, div);
-	ath79_set_ff_clk(ATH79_CLK_DDR, "ref", mult, div * ddr_div);
-	ath79_set_ff_clk(ATH79_CLK_AHB, "ref", mult, div * ahb_div);
+	ath79_set_ff_clk(ATH79_CLK_CPU, mult, div);
+	ath79_set_ff_clk(ATH79_CLK_DDR, mult, div * ddr_div);
+	ath79_set_ff_clk(ATH79_CLK_AHB, mult, div * ahb_div);
 }
 
 static void __init ar933x_clocks_init(void __iomem *pll_base)
@@ -175,11 +174,11 @@ static void __init ar933x_clocks_init(void __iomem *pll_base)
 		ahb_div = FIELD_GET(AR933X_PLL_CLOCK_CTRL_AHB_DIV, clock_ctrl) + 1;
 	}
 
-	ath79_set_ff_clk(ATH79_CLK_CPU, "ref", ninit_mul,
+	ath79_set_ff_clk(ATH79_CLK_CPU, ninit_mul,
 			 ref_div * out_div * cpu_div);
-	ath79_set_ff_clk(ATH79_CLK_DDR, "ref", ninit_mul,
+	ath79_set_ff_clk(ATH79_CLK_DDR, ninit_mul,
 			 ref_div * out_div * ddr_div);
-	ath79_set_ff_clk(ATH79_CLK_AHB, "ref", ninit_mul,
+	ath79_set_ff_clk(ATH79_CLK_AHB, ninit_mul,
 			 ref_div * out_div * ahb_div);
 }
 
@@ -504,6 +503,11 @@ static void __init ath79_clocks_init_dt(struct device_node *np)
 	struct clk *ref_clk;
 	void __iomem *pll_base;
 
+	clk_data = kzalloc_flex(*clk_data, hws, ATH79_CLK_END);
+	if (!clk_data)
+		panic("ath79: can't allocate the clock data");
+	clk_data->num = ATH79_CLK_END;
+
 	/*
 	 * The board's crystal. Without a rate in the device tree, the arch
 	 * code registers it from the bootstrap pins.
@@ -512,7 +516,7 @@ static void __init ath79_clocks_init_dt(struct device_node *np)
 	if (IS_ERR(ref_clk))
 		ref_clk = clk_get_sys(NULL, "ref");
 	if (!IS_ERR(ref_clk))
-		clks[ATH79_CLK_REF] = ref_clk;
+		clk_data->hws[ATH79_CLK_REF] = __clk_get_hw(ref_clk);
 
 	pll_base = of_iomap(np, 0);
 	if (!pll_base) {
@@ -536,10 +540,10 @@ static void __init ath79_clocks_init_dt(struct device_node *np)
 	else if (of_device_is_compatible(np, "qca,qca9560-pll"))
 		qca956x_clocks_init(pll_base);
 
-	if (!clks[ATH79_CLK_MDIO])
-		clks[ATH79_CLK_MDIO] = clks[ATH79_CLK_REF];
+	if (!clk_data->hws[ATH79_CLK_MDIO])
+		clk_data->hws[ATH79_CLK_MDIO] = clk_data->hws[ATH79_CLK_REF];
 
-	if (of_clk_add_provider(np, of_clk_src_onecell_get, &clk_data)) {
+	if (of_clk_add_hw_provider(np, of_clk_hw_onecell_get, clk_data)) {
 		pr_err("%pOF: could not register clk provider\n", np);
 		goto err_iounmap;
 	}
-- 
2.56.0

