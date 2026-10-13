Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CEBF51FCDB
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 15:19:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791904776; cv=none; b=hdt1bIRhBzmSKeRJaPxziN9OHPjGGsGXujqYJygQDs9/8VxDzJ0yuBF4c74oDfR6DMaouFFEERLA7xNqOkaA3dIFCMNUVzM1/l9hdw+slnQ79Fi5S1sbfmSvyVMD4iOxJhmKAa26GdFy53h/6sOt2IDis9GGWDKRCOuLwFjtVJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791904776; c=relaxed/simple;
	bh=3GiRlMncUkd1rQ7SEVzp5PQ9BqMQh6NkdXJKP5wQ+EU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hdK7Msy2DqMb+EXrPB7fjcTJ7WMWrWKgDo9Uv8egaib7hQLaaA1ALDpKRhaJHhxdERKoTUVvwc3WzNg4aBt91DSxLbMzsQryqNZ5uFUYSKMkC8b2a8HnBCrE2xFYjmyD++c6N3yR1G3BbN0mnv4F8GiTiZfMDYnhnbU+MdYXq3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KXDV65nV; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KXDV65nV"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-cc758830601so1993806a12.2
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 08:19:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791904774; x=1792509574; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4zKtTsd8MzhIo6AyA9SWXa1odPgIA10bRwmVL6OJsGk=;
        b=KXDV65nV9pEDY1d5HEwWy+nnUP088wgiFl9O/Izt+mM4msXGFloQmeZDiU7PCQ7WTZ
         YCU9EE62OReKkWiQ/Cb31mYFgIS1KwU5sBBrLuUDGNosl/gQN88dXBtqJKUv262Edbdv
         wRE8XjDGDspDzm3MX9/xvy/AiK/T8HF9nUPVfFPfvNePZITjt4qoe1/22YSatwYq69bo
         P4aJRgbgGOLnuraBqJovPb5WS1eOQY3ljNVPUJGOIYuxU7Hy77PzxdJ4fj9TajAxCYhs
         QFitQKV5SR9KkOhgQoPVSoJ70anzpz8ebFT5L786hWl0rUY0w/ZxiOvwrAKAH+HLUmxz
         qyAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791904774; x=1792509574;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4zKtTsd8MzhIo6AyA9SWXa1odPgIA10bRwmVL6OJsGk=;
        b=OldF7iy7B8l9e+6KrmJd77s7FheOZM5v0/8QmGuOyVgt8Gh/0CvUm2kVKEM7DZtnTj
         iLf0f9gJRrL9uWmmzmxAlRmQU3H0HJpFjYQ7E3HzGv8KCQ1Pi+SP5UrClxRUENsKNj0b
         iQbWUxpOVYZqYBHA0k7lUXMaQwBQyg1KP15WwdUzqsj4es9ND+gySsetgrzh5xW/WYbv
         olFrX/ZcKd95rFb0otLHcD2/423P74MBntAmVbuhz2Ad6N7iSnbhdnlAYwhjUI0DPwPq
         uEb/KSj6PBpq6XT2pmgmLg1cFVevp057DrOGpA1cJqRwNzFPKzQVsDMpYvoMF5hB1tYr
         UW5w==
X-Forwarded-Encrypted: i=1; AKwUvBxMGxMnhqArCsDNAaPBJ4ee4+Up2IAQABPiKa4jwIuHCCAbmQYWS02OYYkTS+JvEyGH+myxnivGl7o8FVc=@vger.kernel.org
X-Gm-Message-State: AFq9FYIvJL41iQl3sDrrr3R2oF3J7AYd9hEv9MaU1to7hdE5JQdhKopU
	XY9WKO86y224upA6//oV9U1hvOT+btIP67baqzQeQVH5VEjfjEdxW4FG
X-Gm-Gg: AYBFou3loi1yR8MdHohzGpeLGZux9LtBf/ys9PKUv2RCB90kg5A64pfC0do76ULtYJV
	pz+0T/mtJVflFAhryubAQ/QdR/8P41dv7zC8L53SkbzRKEizUbbU+TM47YpLwy5aCN6ayz9ruJj
	ZVCHIAtxOKhYO/fwhosUgJsYljsb27r67pWDsQK1AH1vTda+pgwhQsH9GUuE3hCcEVCfkNc5rlM
	75BajFrXbUyj/ckj5OUoouz+I9A4sbOn2fr0U9jZyt7dEW+4B/9KY0AO+Bm6K981qmmsa0u+m3U
	IcUJQXEdgG3etT41Z/2vcOy/o8K6B/iRwuqHzVJ/nCeweRXCQh5iarGJgcLSbMyqU8WWFaI/5gg
	Wsve8VGjsZmMndWkh+TJ6hbXnR80MrB6NSoLVuT2Ag3qdt8VIgeOvFUpkXZWvrRtL1mDaqq5BVB
	fBbzCRaH4h4zTE7dhPUxlDSrYNH9js3WlQW7FIVbmsVztVn/JYNm/GjZfCuSx888fN8ykE2Bmth
	4rjBuwSy8Zjn66eP0UV6fyKnFAqRb33fL3t2Do=
X-Received: by 2002:a05:6a21:7a97:b0:3de:7854:8567 with SMTP id adf61e73a8af0-3e16bdd231bmr10680868637.12.1791904773761;
        Tue, 13 Oct 2026 08:19:33 -0700 (PDT)
Received: from buffalo-ssd.taila54753.ts.net ([240b:253:4760:f400:1ebf:ceff:fe7f:5e0b])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd3da04596dsm5759888a12.29.2026.10.13.08.19.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 08:19:31 -0700 (PDT)
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
Subject: [PATCH v2 16/35] clk: mediatek: mt2701: Switch to common probe/remove helpers
Date: Wed, 14 Oct 2026 00:17:15 +0900
Message-ID: <20261013151734.3177690-17-akkun11.open@gmail.com>
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

The MT2701 topckgen and pericfg drivers register clock types already
supported by the common helpers, so their custom initialization
routines can be replaced with struct mtk_clk_desc.

The infracfg, apmixedsys, and audsys drivers additionally needed
CPU mux registration, PLL registration, and child-device population,
respectively. With these capabilities now supported by the common
helpers, these drivers can use mtk_clk_simple_probe() and
mtk_clk_simple_remove().

Drop the CLK_OF_DECLARE_DRIVER early init for infracfg; the kernel's
deferred probe mechanism ensures dependent drivers like cpufreq are
initialized correctly.

With the drivers converted to the common probe/remove helpers,
enable module builds by changing their Kconfig entries to "tristate".

Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
---
Changes in v2:
- Improvement of commit messages
---
 drivers/clk/mediatek/Kconfig          |  18 +-
 drivers/clk/mediatek/clk-mt2701-aud.c |  35 +---
 drivers/clk/mediatek/clk-mt2701.c     | 233 ++++++--------------------
 3 files changed, 65 insertions(+), 221 deletions(-)

diff --git a/drivers/clk/mediatek/Kconfig b/drivers/clk/mediatek/Kconfig
index b059d44577f1..486024be26a6 100644
--- a/drivers/clk/mediatek/Kconfig
+++ b/drivers/clk/mediatek/Kconfig
@@ -19,7 +19,7 @@ config COMMON_CLK_MEDIATEK_FHCTL
 	  spread spectrum clocking features.
 
 config COMMON_CLK_MT2701
-	bool "Clock driver for MediaTek MT2701"
+	tristate "Clock driver for MediaTek MT2701"
 	depends on (ARCH_MEDIATEK && ARM) || COMPILE_TEST
 	select COMMON_CLK_MEDIATEK
 	default ARCH_MEDIATEK && ARM
@@ -27,49 +27,49 @@ config COMMON_CLK_MT2701
 	  This driver supports MediaTek MT2701 basic clocks.
 
 config COMMON_CLK_MT2701_MMSYS
-	bool "Clock driver for MediaTek MT2701 mmsys"
+	tristate "Clock driver for MediaTek MT2701 mmsys"
 	depends on COMMON_CLK_MT2701
 	help
 	  This driver supports MediaTek MT2701 mmsys clocks.
 
 config COMMON_CLK_MT2701_IMGSYS
-	bool "Clock driver for MediaTek MT2701 imgsys"
+	tristate "Clock driver for MediaTek MT2701 imgsys"
 	depends on COMMON_CLK_MT2701
 	help
 	  This driver supports MediaTek MT2701 imgsys clocks.
 
 config COMMON_CLK_MT2701_VDECSYS
-	bool "Clock driver for MediaTek MT2701 vdecsys"
+	tristate "Clock driver for MediaTek MT2701 vdecsys"
 	depends on COMMON_CLK_MT2701
 	help
 	  This driver supports MediaTek MT2701 vdecsys clocks.
 
 config COMMON_CLK_MT2701_HIFSYS
-	bool "Clock driver for MediaTek MT2701 hifsys"
+	tristate "Clock driver for MediaTek MT2701 hifsys"
 	depends on COMMON_CLK_MT2701
 	help
 	  This driver supports MediaTek MT2701 hifsys clocks.
 
 config COMMON_CLK_MT2701_ETHSYS
-	bool "Clock driver for MediaTek MT2701 ethsys"
+	tristate "Clock driver for MediaTek MT2701 ethsys"
 	depends on COMMON_CLK_MT2701
 	help
 	  This driver supports MediaTek MT2701 ethsys clocks.
 
 config COMMON_CLK_MT2701_BDPSYS
-	bool "Clock driver for MediaTek MT2701 bdpsys"
+	tristate "Clock driver for MediaTek MT2701 bdpsys"
 	depends on COMMON_CLK_MT2701
 	help
 	  This driver supports MediaTek MT2701 bdpsys clocks.
 
 config COMMON_CLK_MT2701_AUDSYS
-	bool "Clock driver for Mediatek MT2701 audsys"
+	tristate "Clock driver for Mediatek MT2701 audsys"
 	depends on COMMON_CLK_MT2701
 	help
 	  This driver supports Mediatek MT2701 audsys clocks.
 
 config COMMON_CLK_MT2701_G3DSYS
-	bool "Clock driver for MediaTek MT2701 g3dsys"
+	tristate "Clock driver for MediaTek MT2701 g3dsys"
 	depends on COMMON_CLK_MT2701
 	help
 	  This driver supports MediaTek MT2701 g3dsys clocks.
diff --git a/drivers/clk/mediatek/clk-mt2701-aud.c b/drivers/clk/mediatek/clk-mt2701-aud.c
index e103121cf58e..533d35614661 100644
--- a/drivers/clk/mediatek/clk-mt2701-aud.c
+++ b/drivers/clk/mediatek/clk-mt2701-aud.c
@@ -128,6 +128,7 @@ static const struct mtk_gate audio_clks[] = {
 static const struct mtk_clk_desc audio_desc = {
 	.clks = audio_clks,
 	.num_clks = ARRAY_SIZE(audio_clks),
+	.populate_children = true,
 };
 
 static const struct of_device_id of_match_clk_mt2701_aud[] = {
@@ -136,39 +137,9 @@ static const struct of_device_id of_match_clk_mt2701_aud[] = {
 };
 MODULE_DEVICE_TABLE(of, of_match_clk_mt2701_aud);
 
-static int clk_mt2701_aud_probe(struct platform_device *pdev)
-{
-	int r;
-
-	r = mtk_clk_simple_probe(pdev);
-	if (r) {
-		dev_err(&pdev->dev,
-			"could not register clock provider: %s: %d\n",
-			pdev->name, r);
-
-		return r;
-	}
-
-	r = devm_of_platform_populate(&pdev->dev);
-	if (r)
-		goto err_plat_populate;
-
-	return 0;
-
-err_plat_populate:
-	mtk_clk_simple_remove(pdev);
-	return r;
-}
-
-static void clk_mt2701_aud_remove(struct platform_device *pdev)
-{
-	of_platform_depopulate(&pdev->dev);
-	mtk_clk_simple_remove(pdev);
-}
-
 static struct platform_driver clk_mt2701_aud_drv = {
-	.probe = clk_mt2701_aud_probe,
-	.remove = clk_mt2701_aud_remove,
+	.probe = mtk_clk_simple_probe,
+	.remove = mtk_clk_simple_remove,
 	.driver = {
 		.name = "clk-mt2701-aud",
 		.of_match_table = of_match_clk_mt2701_aud,
diff --git a/drivers/clk/mediatek/clk-mt2701.c b/drivers/clk/mediatek/clk-mt2701.c
index 710c4f2f9f30..5ea0c4acaf1b 100644
--- a/drivers/clk/mediatek/clk-mt2701.c
+++ b/drivers/clk/mediatek/clk-mt2701.c
@@ -6,6 +6,7 @@
 
 #include <linux/clk-provider.h>
 #include <linux/platform_device.h>
+#include <linux/module.h>
 
 #include "clk-cpumux.h"
 #include "clk-gate.h"
@@ -655,38 +656,19 @@ static const struct mtk_gate top_clks[] = {
 		28),
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
-	mtk_clk_register_fixed_clks(top_fixed_clks, ARRAY_SIZE(top_fixed_clks),
-								clk_data);
-
-	mtk_clk_register_factors(top_fixed_divs, ARRAY_SIZE(top_fixed_divs),
-								clk_data);
-
-	mtk_clk_register_composites(&pdev->dev, top_muxes,
-				    ARRAY_SIZE(top_muxes), base,
-				    &mt2701_clk_lock, clk_data);
-
-	mtk_clk_register_dividers(&pdev->dev, top_adj_divs, ARRAY_SIZE(top_adj_divs),
-				base, &mt2701_clk_lock, clk_data);
-
-	mtk_clk_register_gates(&pdev->dev, node, top_clks,
-			       ARRAY_SIZE(top_clks), clk_data);
-
-	return of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
-}
+static const struct mtk_clk_desc topck_desc = {
+	.clks = top_clks,
+	.num_clks = ARRAY_SIZE(top_clks),
+	.fixed_clks = top_fixed_clks,
+	.num_fixed_clks = ARRAY_SIZE(top_fixed_clks),
+	.factor_clks = top_fixed_divs,
+	.num_factor_clks = ARRAY_SIZE(top_fixed_divs),
+	.composite_clks = top_muxes,
+	.num_composite_clks = ARRAY_SIZE(top_muxes),
+	.divider_clks = top_adj_divs,
+	.num_divider_clks = ARRAY_SIZE(top_adj_divs),
+	.clk_lock = &mt2701_clk_lock,
+};
 
 static const struct mtk_gate_regs infra_cg_regs = {
 	.set_ofs = 0x0040,
@@ -725,81 +707,21 @@ static const struct mtk_fixed_factor infra_fixed_divs[] = {
 static u16 infrasys_rst_ofs[] = { 0x30, 0x34, };
 static u16 pericfg_rst_ofs[] = { 0x0, 0x4, };
 
-static const struct mtk_clk_rst_desc clk_rst_desc[] = {
-	/* infrasys */
-	{
-		.version = MTK_RST_SIMPLE,
-		.rst_bank_ofs = infrasys_rst_ofs,
-		.rst_bank_nr = ARRAY_SIZE(infrasys_rst_ofs),
-	},
-	/* pericfg */
-	{
-		.version = MTK_RST_SIMPLE,
-		.rst_bank_ofs = pericfg_rst_ofs,
-		.rst_bank_nr = ARRAY_SIZE(pericfg_rst_ofs),
-	},
+static const struct mtk_clk_rst_desc infra_rst_desc = {
+	.version = MTK_RST_SIMPLE,
+	.rst_bank_ofs = infrasys_rst_ofs,
+	.rst_bank_nr = ARRAY_SIZE(infrasys_rst_ofs),
 };
 
-static struct clk_hw_onecell_data *infra_clk_data;
-
-static void __init mtk_infrasys_init_early(struct device_node *node)
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
-						infra_clk_data);
-
-	mtk_clk_register_cpumuxes(NULL, node, cpu_muxes, ARRAY_SIZE(cpu_muxes),
-				  infra_clk_data);
-
-	r = of_clk_add_hw_provider(node, of_clk_hw_onecell_get,
-				   infra_clk_data);
-	if (r)
-		pr_err("%s(): could not register clock provider: %d\n",
-			__func__, r);
-}
-CLK_OF_DECLARE_DRIVER(mtk_infra, "mediatek,mt2701-infracfg",
-			mtk_infrasys_init_early);
-
-static int mtk_infrasys_init(struct platform_device *pdev)
-{
-	int r, i;
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
-						infra_clk_data);
-
-	r = of_clk_add_hw_provider(node, of_clk_hw_onecell_get,
-				   infra_clk_data);
-	if (r)
-		return r;
-
-	mtk_register_reset_controller_with_dev(&pdev->dev, &clk_rst_desc[0]);
-
-	return 0;
-}
+static const struct mtk_clk_desc infracfg_desc = {
+	.clks = infra_clks,
+	.num_clks = ARRAY_SIZE(infra_clks),
+	.factor_clks = infra_fixed_divs,
+	.num_factor_clks = ARRAY_SIZE(infra_fixed_divs),
+	.cpumuxes = cpu_muxes,
+	.num_cpumuxes = ARRAY_SIZE(cpu_muxes),
+	.rst_desc = &infra_rst_desc,
+};
 
 static const struct mtk_gate_regs peri0_cg_regs = {
 	.set_ofs = 0x0008,
@@ -883,36 +805,20 @@ static const struct mtk_composite peri_muxs[] = {
 		0x40c, 3, 1),
 };
 
-static int mtk_pericfg_init(struct platform_device *pdev)
-{
-	struct clk_hw_onecell_data *clk_data;
-	void __iomem *base;
-	int r;
-	struct device_node *node = pdev->dev.of_node;
-
-	base = devm_platform_ioremap_resource(pdev, 0);
-	if (IS_ERR(base))
-		return PTR_ERR(base);
-
-	clk_data = mtk_alloc_clk_data(CLK_PERI_NR);
-	if (!clk_data)
-		return -ENOMEM;
-
-	mtk_clk_register_gates(&pdev->dev, node, peri_clks,
-			       ARRAY_SIZE(peri_clks), clk_data);
-
-	mtk_clk_register_composites(&pdev->dev, peri_muxs,
-				    ARRAY_SIZE(peri_muxs), base,
-				    &mt2701_clk_lock, clk_data);
-
-	r = of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
-	if (r)
-		return r;
-
-	mtk_register_reset_controller_with_dev(&pdev->dev, &clk_rst_desc[1]);
+static const struct mtk_clk_rst_desc peri_rst_desc = {
+	.version = MTK_RST_SIMPLE,
+	.rst_bank_ofs = pericfg_rst_ofs,
+	.rst_bank_nr = ARRAY_SIZE(pericfg_rst_ofs),
+};
 
-	return 0;
-}
+static const struct mtk_clk_desc pericfg_desc = {
+	.clks = peri_clks,
+	.num_clks = ARRAY_SIZE(peri_clks),
+	.composite_clks = peri_muxs,
+	.num_composite_clks = ARRAY_SIZE(peri_muxs),
+	.rst_desc = &peri_rst_desc,
+	.clk_lock = &mt2701_clk_lock,
+};
 
 #define MT8590_PLL_FMAX		(2000 * MHZ)
 #define CON0_MT8590_RST_BAR	BIT(27)
@@ -968,74 +874,41 @@ static const struct mtk_fixed_factor apmixed_fixed_divs[] = {
 	FACTOR(CLK_APMIXED_HDMI_REF, "hdmi_ref", "tvdpll", 1, 1),
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
-	mtk_clk_register_plls(&pdev->dev, apmixed_plls, ARRAY_SIZE(apmixed_plls),
-								clk_data);
-	mtk_clk_register_factors(apmixed_fixed_divs, ARRAY_SIZE(apmixed_fixed_divs),
-								clk_data);
-
-	return of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
-}
+static const struct mtk_clk_desc apmixedsys_desc = {
+	.plls = apmixed_plls,
+	.num_plls = ARRAY_SIZE(apmixed_plls),
+	.factor_clks = apmixed_fixed_divs,
+	.num_factor_clks = ARRAY_SIZE(apmixed_fixed_divs),
+};
 
 static const struct of_device_id of_match_clk_mt2701[] = {
 	{
 		.compatible = "mediatek,mt2701-topckgen",
-		.data = mtk_topckgen_init,
+		.data = &topck_desc,
 	}, {
 		.compatible = "mediatek,mt2701-infracfg",
-		.data = mtk_infrasys_init,
+		.data = &infracfg_desc,
 	}, {
 		.compatible = "mediatek,mt2701-pericfg",
-		.data = mtk_pericfg_init,
+		.data = &pericfg_desc,
 	}, {
 		.compatible = "mediatek,mt2701-apmixedsys",
-		.data = mtk_apmixedsys_init,
+		.data = &apmixedsys_desc,
 	}, {
 		/* sentinel */
 	}
 };
 MODULE_DEVICE_TABLE(of, of_match_clk_mt2701);
 
-static int clk_mt2701_probe(struct platform_device *pdev)
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
 static struct platform_driver clk_mt2701_drv = {
-	.probe = clk_mt2701_probe,
 	.driver = {
 		.name = "clk-mt2701",
 		.of_match_table = of_match_clk_mt2701,
 	},
+	.probe = mtk_clk_simple_probe,
+	.remove = mtk_clk_simple_remove,
 };
-
-static int __init clk_mt2701_init(void)
-{
-	return platform_driver_register(&clk_mt2701_drv);
-}
-
-arch_initcall(clk_mt2701_init);
+module_platform_driver(clk_mt2701_drv);
 
 MODULE_DESCRIPTION("MediaTek MT2701 main clocks driver");
 MODULE_LICENSE("GPL");
-- 
2.56.0

