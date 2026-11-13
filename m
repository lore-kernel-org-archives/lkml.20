Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794605477;
	b=q/n2vusDWB9pOjf4vbZMimkNKsGUwK96FcR9nL4hhd2ayOoO/gJpmjDHP4lA/LtUG/ZN
	 suq1B2Xp7/5Oa+5Q9yXSULP24Jsy7Ye4XVJ1juCRojnBSoNz823GtsaItubjraJanFrTp
	 W5fJ2EKm23GWVY0kxnQK+4rw60j01VNLvpIptWTIBJZQP2j4JCwuq0rQUoSs4Sh39v1Tu
	 WeRCor/hN3/vebI8OJnQ2f4pgfb5bXRb0vgwtPkphFksQ1qQnboPie7o5k9KVUPMb5gIs
	 2IgJmHbMOh+kgODwlI19I6PWSH0g+g1BkYuxIWF2ZRv2D++mahqMpSAtpgXJvYf0+Ig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794605477;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=kMoMcD1Lt/e75Xj6NwZBeN1pbuvertD/cK+qW6+KjfM=;
	b=Rwhj6Rq+j5UEF9noCfGrPl1NNEBOenHbvFNllCm/ZlYP5mAIynHVfJgk2cmhMN9ntqJa
	 NWxXX3s9WwgbRHSxlwB6TRKs4lvOiz35xUDZNIx2Qfc25wfyoldr7SR0Iq2fyLPp1y5q0
	 sDArwRN62PFuWE1YmEe17bH7yZZvRXf4mYjW1Mo9CwaeBfMylD4mrMfFQIqcGJ/dAGyP2
	 yE6VS4mwVyeFtTSatlSqXhoVW5CySI1eTQCaBUoBDIr5MXNhrzkZhKGpTiEqzSXTuuImI
	 WRvmeLx83F0NYco9G946WFTrQsWlmOM5meu8cDS0KSG6oi+QESCegYyyPnmazHuRsLQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=W0icztte;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8492606A881
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 21:31:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D8492606A881
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=W0icztte
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a20bdaf39cso23748635e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 13:31:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794605475; x=1795210275; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kMoMcD1Lt/e75Xj6NwZBeN1pbuvertD/cK+qW6+KjfM=;
        b=W0icztteFaa6NYbT/QAMgfvslUHIGvz9Q9hJaV5MZastAiI+FLdz/e3yH+fhEBn/pc
         xuiBT9kq3STl/OlC3L1g+Bt/1ph1fZrxBZT/9WQ9eLfovE7WrH9tgQu8/d2ix61SlKEx
         ANrZGg28xLox5Feob815ZcshJq6JM5aFXbW1wHezRmb5Os9ZkviBm1TvtgjJIzW1quHQ
         FY7ZPzOF3L7xDjVGcHXCZFMKaK/iKVssyVWFNX/S3ZT6uMO+mb7vsjMYj+DUgk9wmC7d
         xaSnf0QiPf6L5Las0YvQ1K2JQlD5TJOMJe/XcopA9sKocYMqns2USzVGZ1B5wTkKD2y5
         xJUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794605475; x=1795210275;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kMoMcD1Lt/e75Xj6NwZBeN1pbuvertD/cK+qW6+KjfM=;
        b=NF2tlNpuebmXLOcuCRiYVdfa32z58BI62qKLYVmiHPc4ktjC0SvLSX964wtO79qYLu
         eDsdkMcaOzG9aQ7108X7gIfhRloXPaBWuIFZ22PewfC3q5HnRJPUjtgifhM2dmJtCYtZ
         dapO9ebTlODDWFHUsZl0Ip365LyCoOIr8pP0pBtvBqDLCJUp1MdnOHzP74IuojHzdksq
         8ikzrdDfihWnyd/vI+k7bNbUWP5+ze8nQdTBOG3MWZGQ65hbe7srblIcnFbkWpCujhvr
         BDPsjiCGqmKxB54rOvblXoh+Nz7Z0aSYJgbE/dv08GZPKuvyFaXvDRPZy+ZV2n95A7Zm
         EqFA==
X-Forwarded-Encrypted: i=1; AL+hErHHVxqpdMKE3qQske7lqzLFxu5kCrNfg27Nro6vFZcdpXfPkFD3CoXZ5sW2xNQP39eVBkHm1v/w56j1mbk=@vger.kernel.org
X-Gm-Message-State: APuU4Z8rMaPuFImdw3QsiF0Oj5vD4SoMXhPk/XlaoG3+exqFr7Kr3EVf
	bQ0idHVtILl9htFKKHiiDTUduayAnYINb293e96jUMsf3a0+Dpyad7iPk3FMwBc8ntE=
X-Gm-Gg: AYBFou0GN4HX+pe5BDTGT7X49C/jA4RzU4o0V5OvG+7CVU2Zg2yePQb4R+sZmII2r8Q
	/z/tja7SvfMZEiTUKYOQo5E1xQyCAdGJE/cPqx3PzMhPdWyIyc2m+yeT27rSvDUXTDKz+6QZafR
	3MFAQCd9HTPq7X3v6OxqB7s926Vg3w8GZwxgojHu4XaHLXE6DKq9dvYBdSfUslxiI5zvAtEcoKB
	HvrWRRcM6ynf29IwwvTzKllLqLHphfiNnxfm1bTK6M4lJjF4XeYUDHheNxsYTkFFTWSs9Yjks85
	QDHijaexS85k0gqq8f4xPf6MUOlSem/FtWhAt/I/qu42FLPJPVToywlSbOWFGxXrAKSS2OlYYa0
	I9KRzHz3jFCixHrdnbfTx0vK7IULY5LbyC/c1lkPZOjyycYu01jI9F+r2Ebg/ZtHQ6qA7MdNvkU
	u4nCTd1/dRn/SOPQV5Xksue8qOuvIq6Bb3n+Q0FgAU0geh5ZwnlbhVeZdj9Mkl39TeOl/6vK/ZT
	Efn8gi32mUks8eoKCfPdNJVZmmpbJ4ZNGjwvolDJWaTxR43kgUfsQbQs6ax6OmNTefUOkzPhEct
	UO3mVGzc4zmqqQXMXPHhXtlNIL5JP+KH1sys9SmBtupx3VLPvEf7TzcK7bBMpfyffflb+c4wFch
	CiN8RCzqYwyOaFlXjtDIMKu5l+w==
X-Received: by 2002:a05:600c:46c9:b0:4a3:d327:6ed with SMTP id 5b1f17b1804b1-4bb55a5fdf6mr84563715e9.17.1794605475200;
        Fri, 13 Nov 2026 13:31:15 -0800 (PST)
Received: from z13-ek5.local ([151.40.161.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c609c8a77sm7447727f8f.49.2026.11.13.13.31.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 13:31:14 -0800 (PST)
From: Ettore Chimenti <ettore.chimenti@linaro.org>
Date: Fri, 13 Nov 2026 22:30:47 +0100
Subject: [PATCH v3 1/4] clk: ti: fapll: remove ti_dt_clk_name helper
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
Message-Id: <20261113-patch-ektor5-dm8168-clk-v3-1-a42cd1edc5f3@linaro.org>
References: <20261113-patch-ektor5-dm8168-clk-v3-0-a42cd1edc5f3@linaro.org>
In-Reply-To: <20261113-patch-ektor5-dm8168-clk-v3-0-a42cd1edc5f3@linaro.org>
To: Tero Kristo <kristo@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Tony Lindgren <tony@atomide.com>, 
 Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, 
 Roger Quadros <rogerq@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 Andrew Goodbody <andrew.goodbody@linaro.org>, 
 Rouven Czerwinski <rouven.czerwinski@linaro.org>
Cc: linux-omap@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Ettore Chimenti <ettore.chimenti@linaro.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794605472; l=2570;
 i=ettore.chimenti@linaro.org; s=20261014; h=from:subject:message-id;
 bh=FcaXkSbmbLoEIeujNjI02i1V62uXoYWuhvh7robgIBw=;
 b=yLzZpIemdaez6TzWeagpbhxQd2QIPUczwuLxkq3FTp3SnHfFkFs2ln3YalKRTVg4zPqtLR4Zq
 gaAXhu0n3+tB3801Yk1hXh8pMvLRuRWqQDG22Hw4QL2NW+kQgCF34IM
X-Developer-Key: i=ettore.chimenti@linaro.org; a=ed25519;
 pk=wCaUblFVaqhuBTQt/hAtysafsAaEsqj/yOD9SPlz6NM=

From: Rouven Czerwinski <rouven.czerwinski@linaro.org>

The fapll driver uses multiple `clock-output-names`, so we cannot use the
DT helper in this driver because that would assign the first clock
output name as the parent name. Otherwise, the clock hierarchy would
look like this:

        main_pll_clk1       <--- main PLL should be parent of other PLLs.
           sysclk1_ck
           main_pll_clk7
                    ...
           main_pll_clk6
                    ...
           main_pll_clk5
                    ...
           main_pll_clk4
                    ...

Reverting to not using `ti_dt_clk_name()` solves this problem, assigning
the correct parent.  This change do not affect other SoCs as the only
consumer is DM816x.

Fixes: 9e56a7d4263c ("clk: ti: Update pll and clockdomain clocks to use ti_dt_clk_name()")
Signed-off-by: Rouven Czerwinski <rouven.czerwinski@linaro.org>
Tested-by: Andrew Goodbody <andrew.goodbody@linaro.org>
Signed-off-by: Ettore Chimenti <ettore.chimenti@linaro.org>
---
 drivers/clk/ti/fapll.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/clk/ti/fapll.c b/drivers/clk/ti/fapll.c
index e54b1df3436e..ae2f6fed10f6 100644
--- a/drivers/clk/ti/fapll.c
+++ b/drivers/clk/ti/fapll.c
@@ -10,8 +10,6 @@
 #include <linux/of_address.h>
 #include <linux/clk/ti.h>
 
-#include "clock.h"
-
 /* FAPLL Control Register PLL_CTRL */
 #define FAPLL_MAIN_MULT_N_SHIFT	16
 #define FAPLL_MAIN_DIV_P_SHIFT	8
@@ -541,7 +539,6 @@ static void __init ti_fapll_setup(struct device_node *node)
 	struct clk_init_data *init = NULL;
 	const char *parent_name[2];
 	struct clk *pll_clk;
-	const char *name;
 	int i;
 
 	fd = kzalloc_obj(*fd);
@@ -559,8 +556,7 @@ static void __init ti_fapll_setup(struct device_node *node)
 		goto free;
 
 	init->ops = &ti_fapll_ops;
-	name = ti_dt_clk_name(node);
-	init->name = name;
+	init->name = node->name;
 
 	init->num_parents = of_clk_get_parent_count(node);
 	if (init->num_parents != 2) {
@@ -592,7 +588,7 @@ static void __init ti_fapll_setup(struct device_node *node)
 	if (fapll_is_ddr_pll(fd->base))
 		fd->bypass_bit_inverted = true;
 
-	fd->name = name;
+	fd->name = node->name;
 	fd->hw.init = init;
 
 	/* Register the parent PLL */
@@ -639,7 +635,7 @@ static void __init ti_fapll_setup(struct device_node *node)
 				freq = NULL;
 		}
 		synth_clk = ti_fapll_synth_setup(fd, freq, div, output_instance,
-						 output_name, name, pll_clk);
+						 output_name, node->name, pll_clk);
 		if (IS_ERR(synth_clk))
 			continue;
 

-- 
2.56.1

