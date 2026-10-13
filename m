Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D10547A88D
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 15:20:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791904804; cv=none; b=m+nFC9SnlBeUPGySRXVluWULfSRpOUfTc2OhRw660RkpHQ6ejO+OYtEyA2s2ne2WswgVC2Q2FnNMcc3H93PwfDVV9MLLAJ0VyxXXi5wRtsqTzX1WxksxaH14FE9C3IboyAIsqLsvU0RTHjpQIrWQG8EVv5MrsRFNSbkFlRyayQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791904804; c=relaxed/simple;
	bh=lePfT+PYd3syff+qVP7s4Fxu5K7p5xUJLwR1AGJ9efs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=C5PapktXYGKYPIh9FQQEn3LNlvjGAiqPW81JQRfpvvoJH4O6CzsAo9UveAExiygknCA8VuqxxaSbmTfjkeEU+sJ63kL9lbC4xWGNPlIrod67RCvqAkOkH/zWkNv/YTTj3wfqKpiPAbPWXl5Y6railJSzjJOtv4SEMWBLFAbFQu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W2IkaW9p; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W2IkaW9p"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-cd6028ff33fso1051734a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 08:20:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791904803; x=1792509603; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hUpTUbfD+2scLh9HkHFYG3goitYB98PYr2syh1m4TII=;
        b=W2IkaW9pQ/cxLtZKnPQNazQ1eTOomhEB5iXmVvNpoTzK5RjZ7fwSBkbIp6U5GF9aPA
         C02bfcCE7+qx9KXvZGK/V5YgVVwUVax61R1bXzjomedbKsS9BQ0lJCZXIUsLLwiB+Dz2
         RohZM0iH6rXTql7H24O2aF0o4lryleb0jd6yB33FkL/Qnob9dHz7ewGYkeuHXZEz7M1f
         1lt5eiMWuvBEpmcqRNPc8TwbwBXZNGyuiXmWLxVNvSmepHjmS28xVkzjNyGS1Etgmy/o
         2XILegxuMYE4YLUj5TrRWXAyzsebhOw+a5RCpVzEQKiJH2IrF738SOYSJnhjFfBWS4rd
         owsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791904803; x=1792509603;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hUpTUbfD+2scLh9HkHFYG3goitYB98PYr2syh1m4TII=;
        b=zlwffD2C1fCNzJTPYkr0PlvQcra4JHJjhung5HeDN04hadt2k2ZEAaxiWyjzW3BbPI
         6svS0oPVbdpzxmGxejHozQKWVs+E7n15Ep1gQRNyTtL/Q3K/8MUb/YYICre2dFYoSuxE
         dd1qNiRwz2Or/dgqfQuUmWPq+uHEA1Nj2zvBjVpFrR1G8QU5fhbs76rOXtXVBmJI490h
         9gCOkD6qL2RXMMW7dOog8Pv2pyyH1bZ/9OQ6P5SUQAlGVNe8zGB1vNBYlehh5Ncd3jyF
         47bJc6VyGaAicwhIp6xSKo/Gd1TrS+EbvVmSQg2syk/eMRHTjk1uXihfI5HBtAJiAjiy
         PlBQ==
X-Forwarded-Encrypted: i=1; AKwUvBwTRwirEauAnfclZtXbIPjOWJ+bGzRQqbH9VhI6YyEoyMEqMV57gASuI8pErzpTmIfkkn4WhHu4+lxAtr4=@vger.kernel.org
X-Gm-Message-State: AFq9FYJmV6QJlHGLSP8w8uEvmU4ZcY6bB9i+zRmDdeN5uNvtIPoX5uVU
	obeQ329fyqkWtRWYeTPpGuRu/liSLazPc9CDNxHtqLwdrT6GBYu7gZJQ
X-Gm-Gg: AYBFou1gMwj7jJ9D/bL1BF9e4M8lvn7IrLkfYV53h83ZBcc6j2L3FMesLGPeo5RGsEU
	b1z0HmsXIy4I6E6+BoAnirz7P+6i6XhklBKzYihp4cOCdBTrSl6J3YuDKMRLI2HeG5QrVJUUr+h
	+n504K6oIBHGzzY9sK3EusrB+XfACoFFLb9D2OyFoHYI1YOxbqtggJP/ycRoPtjV2J7ySrCNvyD
	YZ2IMPryjfKonqBQ584bZStvgg16tv+PMNxaqrYikvKsVgw8VjXcRZX1W03CjzYqedmH2/Funsa
	O3g3EtURxHLY6jgxfJOl3/fBPiz3o3HaiSE897do5VQhF4BRQEvhUXbr09+tDc+BtH7yGOOW/Vn
	hcMphcCtpTKHtm2IlWLb58KXFcRl7Leu7+wtk+kc5YTQihHRvw6gcxfo/MRGP38mTfDntNmi0mZ
	RzGxNXUYMzmHT/kKhGZCHNdsViKqVR6JQaIcOrB/hTHDq5cYSU5HtLZ9zwzma9R7Vy1yc6wQ5GM
	9ogwC6SHf5tzAdryncW4i3WEChm
X-Received: by 2002:a05:6372:a759:10b0:3e1:703b:2fdb with SMTP id adf61e73a8af0-3e1703b3d81mr6678938637.37.1791904802652;
        Tue, 13 Oct 2026 08:20:02 -0700 (PDT)
Received: from buffalo-ssd.taila54753.ts.net ([240b:253:4760:f400:1ebf:ceff:fe7f:5e0b])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd3da04596dsm5759888a12.29.2026.10.13.08.19.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 08:20:02 -0700 (PDT)
From: Akari Tsuyukusa <akkun11.open@gmail.com>
To: Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Yassine Oudjana <y.oudjana@protonmail.com>,
	Richard Cochran <richardcochran@gmail.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Kees Cook <kees@kernel.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	Haotian Zhang <vulab@iscas.ac.cn>,
	Miles Chen <miles.chen@mediatek.com>,
	Sam Shih <sam.shih@mediatek.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Chun-Jie Chen <chun-jie.chen@mediatek.com>,
	Laura Nao <laura.nao@collabora.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>,
	linux-clk@vger.kernel.org (open list:COMMON CLK FRAMEWORK),
	linux-kernel@vger.kernel.org (open list),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	Akari Tsuyukusa <akkun11.open@gmail.com>
Subject: [PATCH v2 21/35] clk: mediatek: mt6797: Switch to common probe/remove helpers
Date: Wed, 14 Oct 2026 00:17:20 +0900
Message-ID: <20261013151734.3177690-22-akkun11.open@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261013151734.3177690-1-akkun11.open@gmail.com>
References: <20261013151734.3177690-1-akkun11.open@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The MT6797 topckgen and infracfg drivers use clock types already
supported by the common helpers. The apmixedsys driver can also use
them now that PLL registration and unregistration are supported.

Drop the CLK_OF_DECLARE_DRIVER early init for infracfg; the kernel's
deferred probe mechanism ensures dependent drivers like cpufreq are
initialized correctly.

Enable module builds by changing the Kconfig setting to "tristate".

Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
---
Changes in v2:
- Improvement of commit messages
---
 drivers/clk/mediatek/Kconfig      |   2 +-
 drivers/clk/mediatek/clk-mt6797.c | 140 +++++-------------------------
 2 files changed, 24 insertions(+), 118 deletions(-)

diff --git a/drivers/clk/mediatek/Kconfig b/drivers/clk/mediatek/Kconfig
index 486024be26a6..be522c43fa42 100644
--- a/drivers/clk/mediatek/Kconfig
+++ b/drivers/clk/mediatek/Kconfig
@@ -342,7 +342,7 @@ config COMMON_CLK_MT6795_VENCSYS
 	  This driver supports MediaTek MT6795 vencsys clocks.
 
 config COMMON_CLK_MT6797
-	bool "Clock driver for MediaTek MT6797"
+	tristate "Clock driver for MediaTek MT6797"
 	depends on (ARCH_MEDIATEK && ARM64) || COMPILE_TEST
 	select COMMON_CLK_MEDIATEK
 	default ARCH_MEDIATEK && ARM64
diff --git a/drivers/clk/mediatek/clk-mt6797.c b/drivers/clk/mediatek/clk-mt6797.c
index ebf850ac57f5..1934420375e8 100644
--- a/drivers/clk/mediatek/clk-mt6797.c
+++ b/drivers/clk/mediatek/clk-mt6797.c
@@ -379,29 +379,13 @@ static const struct mtk_composite top_muxes[] = {
 	    0x0104, 1, 2),
 };
 
-static int mtk_topckgen_init(struct platform_device *pdev)
-{
-	struct clk_hw_onecell_data *clk_data;
-	void __iomem *base;
-	struct device_node *node = pdev->dev.of_node;
-
-	base = devm_platform_ioremap_resource(pdev, 0);
-	if (IS_ERR(base))
-		return PTR_ERR(base);
-
-	clk_data = mtk_alloc_clk_data(CLK_TOP_NR);
-	if (!clk_data)
-		return -ENOMEM;
-
-	mtk_clk_register_factors(top_fixed_divs, ARRAY_SIZE(top_fixed_divs),
-				 clk_data);
-
-	mtk_clk_register_composites(&pdev->dev, top_muxes,
-				    ARRAY_SIZE(top_muxes), base,
-				    &mt6797_clk_lock, clk_data);
-
-	return of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
-}
+static const struct mtk_clk_desc topckgen_desc = {
+	.factor_clks = top_fixed_divs,
+	.num_factor_clks = ARRAY_SIZE(top_fixed_divs),
+	.composite_clks = top_muxes,
+	.num_composite_clks = ARRAY_SIZE(top_muxes),
+	.clk_lock = &mt6797_clk_lock,
+};
 
 static const struct mtk_gate_regs infra0_cg_regs = {
 	.set_ofs = 0x0080,
@@ -539,58 +523,12 @@ static const struct mtk_fixed_factor infra_fixed_divs[] = {
 	FACTOR(CLK_INFRA_13M, "clk13m", "clk26m", 1, 2),
 };
 
-static struct clk_hw_onecell_data *infra_clk_data;
-
-static void mtk_infrasys_init_early(struct device_node *node)
-{
-	int r, i;
-
-	if (!infra_clk_data) {
-		infra_clk_data = mtk_alloc_clk_data(CLK_INFRA_NR);
-		if (!infra_clk_data)
-			return;
-
-		for (i = 0; i < CLK_INFRA_NR; i++)
-			infra_clk_data->hws[i] = ERR_PTR(-EPROBE_DEFER);
-	}
-
-	mtk_clk_register_factors(infra_fixed_divs, ARRAY_SIZE(infra_fixed_divs),
-				 infra_clk_data);
-
-	r = of_clk_add_hw_provider(node, of_clk_hw_onecell_get,
-				   infra_clk_data);
-	if (r)
-		pr_err("%s(): could not register clock provider: %d\n",
-		       __func__, r);
-}
-
-CLK_OF_DECLARE_DRIVER(mtk_infra, "mediatek,mt6797-infracfg",
-		      mtk_infrasys_init_early);
-
-static int mtk_infrasys_init(struct platform_device *pdev)
-{
-	int i;
-	struct device_node *node = pdev->dev.of_node;
-
-	if (!infra_clk_data) {
-		infra_clk_data = mtk_alloc_clk_data(CLK_INFRA_NR);
-		if (!infra_clk_data)
-			return -ENOMEM;
-	} else {
-		for (i = 0; i < CLK_INFRA_NR; i++) {
-			if (infra_clk_data->hws[i] == ERR_PTR(-EPROBE_DEFER))
-				infra_clk_data->hws[i] = ERR_PTR(-ENOENT);
-		}
-	}
-
-	mtk_clk_register_gates(&pdev->dev, node, infra_clks,
-			       ARRAY_SIZE(infra_clks), infra_clk_data);
-	mtk_clk_register_factors(infra_fixed_divs, ARRAY_SIZE(infra_fixed_divs),
-				 infra_clk_data);
-
-	return of_clk_add_hw_provider(node, of_clk_hw_onecell_get,
-				      infra_clk_data);
-}
+static const struct mtk_clk_desc infracfg_desc = {
+	.clks = infra_clks,
+	.num_clks = ARRAY_SIZE(infra_clks),
+	.factor_clks = infra_fixed_divs,
+	.num_factor_clks = ARRAY_SIZE(infra_fixed_divs),
+};
 
 #define MT6797_PLL_FMAX		(3000UL * MHZ)
 
@@ -646,68 +584,36 @@ static const struct mtk_pll_data plls[] = {
 	    0x2B4, 4, 0x2BC, 0x2B8, 0),
 };
 
-static int mtk_apmixedsys_init(struct platform_device *pdev)
-{
-	struct clk_hw_onecell_data *clk_data;
-	struct device_node *node = pdev->dev.of_node;
-
-	clk_data = mtk_alloc_clk_data(CLK_APMIXED_NR);
-	if (!clk_data)
-		return -ENOMEM;
-
-	mtk_clk_register_plls(&pdev->dev, plls, ARRAY_SIZE(plls), clk_data);
-
-	return of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
-}
+static const struct mtk_clk_desc apmixedsys_desc = {
+	.plls = plls,
+	.num_plls = ARRAY_SIZE(plls),
+};
 
 static const struct of_device_id of_match_clk_mt6797[] = {
 	{
 		.compatible = "mediatek,mt6797-topckgen",
-		.data = mtk_topckgen_init,
+		.data = &topckgen_desc,
 	}, {
 		.compatible = "mediatek,mt6797-infracfg",
-		.data = mtk_infrasys_init,
+		.data = &infracfg_desc,
 	}, {
 		.compatible = "mediatek,mt6797-apmixedsys",
-		.data = mtk_apmixedsys_init,
+		.data = &apmixedsys_desc,
 	}, {
 		/* sentinel */
 	}
 };
 MODULE_DEVICE_TABLE(of, of_match_clk_mt6797);
 
-static int clk_mt6797_probe(struct platform_device *pdev)
-{
-	int (*clk_init)(struct platform_device *);
-	int r;
-
-	clk_init = of_device_get_match_data(&pdev->dev);
-	if (!clk_init)
-		return -EINVAL;
-
-	r = clk_init(pdev);
-	if (r)
-		dev_err(&pdev->dev,
-			"could not register clock provider: %s: %d\n",
-			pdev->name, r);
-
-	return r;
-}
-
 static struct platform_driver clk_mt6797_drv = {
-	.probe = clk_mt6797_probe,
+	.probe = mtk_clk_simple_probe,
+	.remove = mtk_clk_simple_remove,
 	.driver = {
 		.name = "clk-mt6797",
 		.of_match_table = of_match_clk_mt6797,
 	},
 };
-
-static int __init clk_mt6797_init(void)
-{
-	return platform_driver_register(&clk_mt6797_drv);
-}
-
-arch_initcall(clk_mt6797_init);
+module_platform_driver(clk_mt6797_drv);
 
 MODULE_DESCRIPTION("MediaTek MT6797 main clocks driver");
 MODULE_LICENSE("GPL");
-- 
2.56.0

