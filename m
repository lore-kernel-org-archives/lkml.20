Received: from mail-wr2-f34.google.com (mail-wr2-f34.google.com [74.125.225.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9C1B49E5C6
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 16:52:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790873535; cv=none; b=slMfrfy0vmahiXCJv0ybq5O/1zv0nBUk5G1DP1uzzBYjsM1nysru5sBv4+CQJDOBFw1AXP4fLw4xJ7eVJ0HzJpxkJaFoW+B3zXCrc3yoSt4jvTTP5X5QSPSGBlfKt5bZFAYdf43tGg0IxjkeRJBHSJp4pB2Lt1W/en7qoXs81AU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790873535; c=relaxed/simple;
	bh=S6VN1ivEjsnqdL0+GBtBo5w+y3FRTxaL/3RuWyOjMuk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VT7LPxvOTxZNGN6wf7YnM/UaGjqwmTYxxSqareKe5CdzSDQueMGZ9DYusus86iUTFOIxfbeHhk5wFOELFBeZmMetooqVYh1c3Bl5T3QWkYI2k7lette8sax9lJ71c8JjqsO/PYzZWTgrqJkzJdj7IHIqKciVJ9dVPOWUJSwGn9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BzpN/rmo; arc=none smtp.client-ip=74.125.225.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BzpN/rmo"
Received: by mail-wr2-f34.google.com with SMTP id ffacd0b85a97d-48afd5b1678so1217501f8f.2
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 09:52:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790873528; x=1791478328; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t2gL6Rq6LC2RfmgVFHY4W3DCjCPHLR3TrZ1IA237aSw=;
        b=BzpN/rmozWoFkZGZ2Fs2WL/g89vJuFQijEkRX6CCeQ/Ks+oQwyM0j9p3EmdMO5p2kD
         bC7Mv8510fBetdnRzw7yu/zZ8U39ZNMu7AlF2zE4crcJULDm340hgJjOOM2cgrOrRE5v
         K0djdh4dN2c9aRsVrfq0WFHZmr7nza9hHNKW4neerm+qOc6fEeWCBmPfiRyJ+W92YeEu
         6CUo6Ake9N+jBVMtpgIKxsjoIPfHxYUmIzjKJ5lnCeMnXahCzQv0f/dRq2NJm01lTDzR
         0EHiBt4MHRUDVfMAX4FQUMwArueDjLZqKm6StdRZXrJjlp4KafHcvzkNjC0bl1s+Yk0Y
         XxfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790873528; x=1791478328;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=t2gL6Rq6LC2RfmgVFHY4W3DCjCPHLR3TrZ1IA237aSw=;
        b=Yxs93GExeinQTkAxA06L9kiMN57Jap/SgtkGRa09tA6449Dc+EXMYt/dfrb2SjMup/
         0nLBs3P9XzHxMSUaT+ZsCVR4diIVobiOcpxS+PlJRLWM/xGNsFgcCCl/UTyVT4Ar94WQ
         +eTZiozIos2vXESRdrLre/ikynJKdItOpTz07QPjB7MpA7SnwxmxP6w0rEkPKUYZkdAA
         07H8vZ5MJ7nRQKkCiWIgN2QdtsFBFQq0K+DFb7dcaDxrrW8ajxb8iN3uh675RnE/U9ad
         cjSrUhOv+bLmE496QuVrXwYLq1Sjs2Y14llukNhny87TS5Gjwbu44+IhvogHIVzrST2r
         8WNg==
X-Forwarded-Encrypted: i=1; AKwUvBxNhxVrx10+QBkmTpx7gyI5AlDgV91Z/UcZwN0wHIopBkoTxIXGykk4NPwy4pQ+aikSkpQ7MKfOPLTKQxo=@vger.kernel.org
X-Gm-Message-State: AFuF++kbbIAN/N0SvhGbC6/JGyTRvH64O3QTD31dUoh+K5xO4jxKBajt
	iTSn1xiczY3e2GnRERt9RGNGemwddEVVuvUaxQ7TLGp5Dz/IEFI0N+B9
X-Gm-Gg: AYBFou3i8WDh+vH4JwMPMLXDex2sF37mRVApZ1ldhK+ePU34WHufq/SYnVJ0oVUwKim
	ekh9XHcsptLZ4/9/MOz9GUTFh0c+A5V/jjpVOglH+Ldv8kcjRgFWtXt3OKczDXAFBNNZXD36ay4
	byQ2glAS9wcOy84Qx+b2DtBihLnj3lmQKby72SDkb1jMCJ+zV7qrO700UTpyprLq4mGLg4MhNmJ
	ij2tECZwWZmKCE9wMwR0hLocCbI2/kEcwabfpgx5sHHwxDe4ldgpSgFyNtRoNR9ExJobPsW+TnL
	qXrBIjS0mkKMgakzEesbGUyymansknmL8vrftf5w9jdwIWtEtdb4TCtyEt6oO48iXLRsSECmV/9
	J/rfsMShvGT3vF5/TrAYELfMF1rMht1/l4bKCyHJYwJDShGO1hUS1GjzFnhslP/n1NqxzDnKJ92
	vux+ZuxPRKIjMqdqAH/qXhbrEX7CSdQ7uG4d4EP68t2kaV7ZMvLolFmjFrMx6SWua4p/C51Zldg
	RpkPtMclZ+bZ9sGGLFOjvLMBB5XuNiqKj0KtAd9UDOGfSe0SeTnbR9tRFV+k54DYbHpfQ7edk+K
	LdbLmGRj
X-Received: by 2002:a05:600c:4e8e:b0:49f:ce78:3561 with SMTP id 5b1f17b1804b1-4a02759b360mr3749095e9.18.1790873527643;
        Thu, 01 Oct 2026 09:52:07 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:1be5:ad57:d5e0:f854])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a027ae146csm480985e9.11.2026.10.01.09.52.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 09:52:07 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Guenter Roeck <linux@roeck-us.net>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v8 1/7] clk: renesas: r9a09g077: Add helper to start WDTDCR counter
Date: Thu,  1 Oct 2026 17:51:55 +0100
Message-ID: <20261001165201.763882-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261001165201.763882-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20261001165201.763882-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

The WDTDCRm registers are not suitable for access through the SYSC regmap
from atomic or panic context, as regmap locking can deadlock when another
CPU holding the lock has already stopped.

Add a lockless helper to clear WDTDCRm.WDTSTOPCTRL and start the watchdog
counter using the existing SYSC register accessors.

Export the helper in the RZT2H_CPG namespace for use by the watchdog
driver.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v7->v8:
- No change

v6->v7:
- New patch
---
 drivers/clk/renesas/r9a09g077-cpg.c | 35 ++++++++++++++++++++++++-----
 include/linux/clk/renesas.h         |  6 +++++
 2 files changed, 35 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/renesas/r9a09g077-cpg.c b/drivers/clk/renesas/r9a09g077-cpg.c
index 5a0e7df1eb06..90f0c373976f 100644
--- a/drivers/clk/renesas/r9a09g077-cpg.c
+++ b/drivers/clk/renesas/r9a09g077-cpg.c
@@ -12,6 +12,7 @@
 #include <linux/clk-provider.h>
 #include <linux/clk/renesas.h>
 #include <linux/device.h>
+#include <linux/export.h>
 #include <linux/init.h>
 #include <linux/io.h>
 #include <linux/iopoll.h>
@@ -103,10 +104,17 @@ MODULE_IMPORT_NS("RZV2H_CPG");
 #define RZT2H_SYSC_BLOCK(x)		FIELD_GET(RZT2H_SYSC_BLOCK_MASK, x)
 #define RZT2H_SYSC_REG_OFFSET(x)	FIELD_GET(RZT2H_SYSC_OFFSET_MASK, x)
 
+/* WDT Debug Control Registers (WDTDCRm), in the block 1 SYSC region */
+#define RZT2H_WDTDCR(n)			(RZT2H_SYSC_BLOCK_MASK | (0x5100 + (n) * 4))
+#define RZT2H_WDTDCR_WDTSTOPCTRL	BIT(0)
+#define RZT2H_WDT_MAX_INSTANCES		6
+
 struct r9a09g077_sysc_reg {
 	void __iomem *base[2];
 };
 
+static struct r9a09g077_sysc_reg *r9a09g077_sysc_regs;
+
 enum rzt2h_clk_types {
 	CLK_TYPE_RZT2H_DIV = CLK_TYPE_CUSTOM,	/* Clock with divider */
 	CLK_TYPE_RZT2H_MUX,			/* Clock with clock source selector */
@@ -963,10 +971,25 @@ static bool r9a09g077_writeable_readable_sysc(struct device *dev, unsigned int r
 	}
 }
 
+void rzt2h_cpg_wdtdcr_count_start(unsigned int wdt_index)
+{
+	struct r9a09g077_sysc_reg *sysc = r9a09g077_sysc_regs;
+	unsigned int reg, val;
+
+	/* Sanity check: ensure sysc is initialized and wdt_index is valid */
+	if (!sysc || wdt_index >= RZT2H_WDT_MAX_INSTANCES)
+		return;
+
+	reg = RZT2H_WDTDCR(wdt_index);
+	r9a09g077_regmap_read(sysc, reg, &val);
+	val &= ~RZT2H_WDTDCR_WDTSTOPCTRL;
+	r9a09g077_regmap_write(sysc, reg, val);
+}
+EXPORT_SYMBOL_NS_GPL(rzt2h_cpg_wdtdcr_count_start, "RZT2H_CPG");
+
 static int r9a09g077_post_init(struct device *dev, struct cpg_mssr_pub *pub)
 {
 	struct regmap_config *regmap_cfg __free(kfree) = kzalloc_obj(*regmap_cfg);
-	struct r9a09g077_sysc_reg *sysc_reg;
 	struct regmap *regmap;
 	struct resource res;
 	int ret;
@@ -991,13 +1014,13 @@ static int r9a09g077_post_init(struct device *dev, struct cpg_mssr_pub *pub)
 	if (!regmap_cfg)
 		return -ENOMEM;
 
-	sysc_reg = devm_kzalloc(dev, sizeof(*sysc_reg), GFP_KERNEL);
-	if (!sysc_reg)
+	r9a09g077_sysc_regs = devm_kzalloc(dev, sizeof(*r9a09g077_sysc_regs), GFP_KERNEL);
+	if (!r9a09g077_sysc_regs)
 		return -ENOMEM;
 
 	/* Only allow access in the SYSC regions */
-	sysc_reg->base[0] = pub->base0 + RZT2H_SYSC_OFFSET;
-	sysc_reg->base[1] = pub->base1 + RZT2H_SYSC_OFFSET;
+	r9a09g077_sysc_regs->base[0] = pub->base0 + RZT2H_SYSC_OFFSET;
+	r9a09g077_sysc_regs->base[1] = pub->base1 + RZT2H_SYSC_OFFSET;
 
 	regmap_cfg->name = "rzt2h_sysc";
 	regmap_cfg->reg_bits = 32;
@@ -1008,7 +1031,7 @@ static int r9a09g077_post_init(struct device *dev, struct cpg_mssr_pub *pub)
 	regmap_cfg->readable_reg = r9a09g077_writeable_readable_sysc;
 	regmap_cfg->writeable_reg = r9a09g077_writeable_readable_sysc;
 
-	regmap = devm_regmap_init(dev, &r9a09g077_sys_regmap_bus, sysc_reg, regmap_cfg);
+	regmap = devm_regmap_init(dev, &r9a09g077_sys_regmap_bus, r9a09g077_sysc_regs, regmap_cfg);
 	if (IS_ERR(regmap))
 		return PTR_ERR(regmap);
 
diff --git a/include/linux/clk/renesas.h b/include/linux/clk/renesas.h
index c9495558cd5c..1e171db25eb7 100644
--- a/include/linux/clk/renesas.h
+++ b/include/linux/clk/renesas.h
@@ -216,4 +216,10 @@ static inline bool rzv2h_cpg_get_pll_divs_pars(const struct rzv2h_pll_limits *li
 #define rzv2h_get_pll_pars	rzv2h_cpg_get_pll_pars
 #define rzv2h_get_pll_divs_pars	rzv2h_cpg_get_pll_divs_pars
 
+#if defined(CONFIG_CLK_R9A09G077) || defined(CONFIG_CLK_R9A09G087)
+void rzt2h_cpg_wdtdcr_count_start(unsigned int wdt_index);
+#else
+static inline void rzt2h_cpg_wdtdcr_count_start(unsigned int wdt_index) { }
+#endif
+
 #endif
-- 
2.55.0

