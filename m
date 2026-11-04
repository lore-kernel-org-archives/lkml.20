Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793771951;
	b=nW9OQFNcoNi3Rzrvh4QLDNBRkA7Iuw7ff1p3e3c4pwMpwkE/MuU2PKyA7364rjw1Dpbj
	 4O6DETfAEbeORZWvGNcJSxV9P4ZGLD2bcWMiKK94jP3kSKc3mnN/qqP97fjEr613Ip29L
	 TzjhT7KU2jmHTXr0DPCxVJYEFN5h5QAMzGTCKTQQHNLiXNdip7skJEHCE2kNcLrorSv/e
	 Lelh/CBDYx5LHZ9GWTD1bYo1u5G//tuyo8pcXRAE4o9rqaWyGlQPPBQvbLH7Fku+Bfv95
	 KyivUUqWoGDe3cMdGq+WDTVD9quiICtZA0SgS/sDJTvk682dDzo4M8TiOElwbt340PQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793771951;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=2Rp4lizZz5ZPmQTX2hVm2ac2qWYjm/C0ch6Hu7hghw4=;
	b=HU7o0T057GP8rcbdLucqF7Eyl3HTRwUvcn8Q4erC1FSa/cdlmur0P1Bm0x+FKt2/STWp
	 ZEH5cVTf7/gktZqpHfN1OEVqySGPGVGeIvwIn4RpVLkrueS1s3TiY/6wGCs9V0qGbs+/f
	 v9BDmIf6KWz9A9V8JNvh4PXeoguiujROaTl6GCJlgh6zG0DGlxE4Gwynx1BZZM9abtvvb
	 PzW5zmKhLi8n4RmRJnA0SYKxo7pRuwrRc3EayTaeJHGBiwzxtk1e3vBnoDxeASc9Lqmvj
	 TwaYhWz6D6k/ZeUC266BDiJBghX7c8KMCG0977Xd3MnIb5rBWqxRK60shl6/fLwgapA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zJQylyrI;
	arc=none smtp.remote-ip=209.85.216.41
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98E4B606D80C
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 05:59:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 98E4B606D80C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zJQylyrI
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3b08a162d4bso278975a91.3
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 21:59:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793771945; x=1794376745; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2Rp4lizZz5ZPmQTX2hVm2ac2qWYjm/C0ch6Hu7hghw4=;
        b=zJQylyrIaxkJ6qh/3H/fp8MxqtGJ/b8X2+J0P9MIJk71Xfz1vz299bZXbYwzp6c/MV
         d+5X7dTslB2r3icSDTd0zICkWYZJ/YFmLE52MaiHL/RBHNAoM66Efgq/QPYemCyKy1Ao
         F894GPvtqxZYVFnZYLTd4BokScEzWecc4p8n9OKIzLwUfv9QdyFOMUb9CEL64Wj5dzUf
         ZjvBBEb5anuFvYIIxztm8MdAJi9RQIekHlRHrpeW6Sfeo5/kR47lSwf8RX1GrL4GJkYW
         yXY1dX9gDARf33ZA9Pv+gN2yguvFlT2OkuYsfeSOZucvZmED752iWg4ZuazqomnOtWMG
         lX0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793771945; x=1794376745;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2Rp4lizZz5ZPmQTX2hVm2ac2qWYjm/C0ch6Hu7hghw4=;
        b=onk0yWY8PGftyviUVJLW9a8z+kxv4NhzqrUdHB3rsoUNFwBxJGLmrx5WZS5QG8ycef
         Tu4yi8ZQ7D/r2RjMZyVo9xtYbK/Nk+pbpSqGTmFqR7k/2ptWF0Ng7/PddV0py97uNsJy
         1LOwz+BGSSrFHnYLOFzhf603KcFEVQkG9fAeDh9d9k1ac8U+2+6T5sfvz9lO474QD+pD
         MVkQKmKGlTFJjEISR24EHTyU23OILcUTbeFsU3ucaHmm8m0OGPIFd6wUSPsSqpKkt67u
         Z7S24rqTJ++q+lI7yRBmkfXQpz05AJZzHUnRFlPJwD6CVSB6sWm/Awo3f4B8TYZaM1/V
         XcFg==
X-Forwarded-Encrypted: i=1; AKwUvBzy5+hts6ZqFJi4MCBBnl9tKSqwV2BnPiVSsvicUyHenq6uap0ygQlgal5CeVtVYwVXyHIPUYYngLV3TM4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/tl4tbNgFlwz78J2MQh4FbdiEfn7LIex92EGDC1A3wUvOKyFdx
	i7nTgKRZvL24WrnaDjDDSk5ffI3yQP6+y7bb7o7y8tG5D8o+Rztk1O0J
X-Gm-Gg: AYBFou0wDaSe2NGY21+JQyqpMCXZHgq95bUX1Z07sdirqZWcgjavzSrPdI+dIu6Eyz8
	HOpXANORauO0Jj/8UKkh5uPD0HuLIlAbl4uHZ/yq2r8U8Edmr9XlVnrUpcdU21C95A35chcCpkn
	evGeS04gaarkSLC7hTtRdN3/Gv2FyjomLR76X1JH+Au1o/M68jq2F2fF7s+Z8+b0mIsjSeYQCWN
	Vxg/tIdQ2I2L9ZbujH7jiKW/mn7n9glu9UOVzcFnkmSvQFDKlJYJl7ye6r645qdTJG0nnKS+ROr
	bfjxAFFr69h3irVb/c82RSMT5Zzo22SIPSKZnDP10HoCD24WpC+6DEsVyES36zKL06fbqmLwU7w
	3VekuzO6FMXUBIQdVqBae/XFyM6x7UlyF1ZzunRPCL8OBu6FLFqUmS+J1o6nt+rN//Cv6drhn8U
	zx281w0WHmIrT7XOD2lujowI2LYrIIUlfTnR40L4lq2eQynqwBTYlVYEE81c6Q0DiLIGgX+SAwR
	GC5NzVICi/lAeZ1lpvMWwf/MU3h/V8OqS5iH0I0PodePTAw92/jiFfkJXMK2YPbm4WljwTcE69Z
	l4dIvGcqVR09lcCFX34D8KTsNlc2u1dfMRQuGhciJXptKQdmIfYuMpwuEdpjhfQ2K/DKTMcQfVq
	leWKB2beOvVZCc1ZXGJyVJtsBnLacHVb+Oy/KxVOSQHdy1uw+hixCFCsSLggTgl6U6l9mAdf3Cz
	nAlQ==
X-Received: by 2002:a17:90b:2247:b0:3ac:7c4d:8be6 with SMTP id 98e67ed59e1d1-3ae89836523mr12002205a91.40.1793771944775;
        Tue, 03 Nov 2026 21:59:04 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c9928c4sm7840110a91.15.2026.11.03.21.59.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 21:59:04 -0800 (PST)
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
Subject: [PATCH 7/8] clk: ath79: give each compatible its own init function
Date: Tue,  3 Nov 2026 21:58:51 -0800
Message-ID: <20261104055852.152340-8-rosenp@gmail.com>
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

Every compatible already has its own CLK_OF_DECLARE(), yet they all
shared one init function, which then matched the compatible again to
pick the SoC code. Have each CLK_OF_DECLARE() call a small wrapper
that passes the SoC init function to the common code instead.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/clk/clk-ath79.c | 72 +++++++++++++++++++++++++++--------------
 1 file changed, 47 insertions(+), 25 deletions(-)

diff --git a/drivers/clk/clk-ath79.c b/drivers/clk/clk-ath79.c
index 768c9e410b59..8086b4f6378c 100644
--- a/drivers/clk/clk-ath79.c
+++ b/drivers/clk/clk-ath79.c
@@ -504,11 +504,12 @@ static int __init qca956x_clocks_init(void __iomem *pll_base)
 	return ath79_set_clks(cpu_rate, ddr_rate, ahb_rate);
 }
 
-static void __init ath79_clocks_init_dt(struct device_node *np)
+static void __init ath79_clocks_init_dt(struct device_node *np,
+					int (*soc_init)(void __iomem *pll_base))
 {
 	struct clk *ref_clk;
 	void __iomem *pll_base;
-	int ret = -ENODEV;
+	int ret;
 
 	clk_data = kzalloc_flex(*clk_data, hws, ATH79_CLK_END);
 	if (!clk_data)
@@ -534,21 +535,7 @@ static void __init ath79_clocks_init_dt(struct device_node *np)
 		goto err_clk;
 	}
 
-	if (of_device_is_compatible(np, "qca,ar7100-pll"))
-		ret = ar71xx_clocks_init(pll_base);
-	else if (of_device_is_compatible(np, "qca,ar7240-pll") ||
-		 of_device_is_compatible(np, "qca,ar9130-pll"))
-		ret = ar724x_clocks_init(pll_base);
-	else if (of_device_is_compatible(np, "qca,ar9330-pll"))
-		ret = ar933x_clocks_init(pll_base);
-	else if (of_device_is_compatible(np, "qca,ar9340-pll"))
-		ret = ar934x_clocks_init(pll_base);
-	else if (of_device_is_compatible(np, "qca,qca9530-pll"))
-		ret = qca953x_clocks_init(pll_base);
-	else if (of_device_is_compatible(np, "qca,qca9550-pll"))
-		ret = qca955x_clocks_init(pll_base);
-	else if (of_device_is_compatible(np, "qca,qca9560-pll"))
-		ret = qca956x_clocks_init(pll_base);
+	ret = soc_init(pll_base);
 
 	/* the rates are fixed, so the registers aren't needed any more */
 	iounmap(pll_base);
@@ -578,11 +565,46 @@ static void __init ath79_clocks_init_dt(struct device_node *np)
 	clk_data = NULL;
 }
 
-CLK_OF_DECLARE(ar7100_clk, "qca,ar7100-pll", ath79_clocks_init_dt);
-CLK_OF_DECLARE(ar7240_clk, "qca,ar7240-pll", ath79_clocks_init_dt);
-CLK_OF_DECLARE(ar9130_clk, "qca,ar9130-pll", ath79_clocks_init_dt);
-CLK_OF_DECLARE(ar9330_clk, "qca,ar9330-pll", ath79_clocks_init_dt);
-CLK_OF_DECLARE(ar9340_clk, "qca,ar9340-pll", ath79_clocks_init_dt);
-CLK_OF_DECLARE(ar9530_clk, "qca,qca9530-pll", ath79_clocks_init_dt);
-CLK_OF_DECLARE(ar9550_clk, "qca,qca9550-pll", ath79_clocks_init_dt);
-CLK_OF_DECLARE(ar9560_clk, "qca,qca9560-pll", ath79_clocks_init_dt);
+static void __init ar71xx_clocks_init_dt(struct device_node *np)
+{
+	ath79_clocks_init_dt(np, ar71xx_clocks_init);
+}
+
+static void __init ar724x_clocks_init_dt(struct device_node *np)
+{
+	ath79_clocks_init_dt(np, ar724x_clocks_init);
+}
+
+static void __init ar933x_clocks_init_dt(struct device_node *np)
+{
+	ath79_clocks_init_dt(np, ar933x_clocks_init);
+}
+
+static void __init ar934x_clocks_init_dt(struct device_node *np)
+{
+	ath79_clocks_init_dt(np, ar934x_clocks_init);
+}
+
+static void __init qca953x_clocks_init_dt(struct device_node *np)
+{
+	ath79_clocks_init_dt(np, qca953x_clocks_init);
+}
+
+static void __init qca955x_clocks_init_dt(struct device_node *np)
+{
+	ath79_clocks_init_dt(np, qca955x_clocks_init);
+}
+
+static void __init qca956x_clocks_init_dt(struct device_node *np)
+{
+	ath79_clocks_init_dt(np, qca956x_clocks_init);
+}
+
+CLK_OF_DECLARE(ar7100_clk, "qca,ar7100-pll", ar71xx_clocks_init_dt);
+CLK_OF_DECLARE(ar7240_clk, "qca,ar7240-pll", ar724x_clocks_init_dt);
+CLK_OF_DECLARE(ar9130_clk, "qca,ar9130-pll", ar724x_clocks_init_dt);
+CLK_OF_DECLARE(ar9330_clk, "qca,ar9330-pll", ar933x_clocks_init_dt);
+CLK_OF_DECLARE(ar9340_clk, "qca,ar9340-pll", ar934x_clocks_init_dt);
+CLK_OF_DECLARE(ar9530_clk, "qca,qca9530-pll", qca953x_clocks_init_dt);
+CLK_OF_DECLARE(ar9550_clk, "qca,qca9550-pll", qca955x_clocks_init_dt);
+CLK_OF_DECLARE(ar9560_clk, "qca,qca9560-pll", qca956x_clocks_init_dt);
-- 
2.56.0

