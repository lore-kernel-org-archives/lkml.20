Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26B0351CF70
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 15:20:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791904850; cv=none; b=V+Kb9590jLZghxdCTIXpYove+C/iJcExdf0jjYKtTBzLvbErTvin9apAMqAJVbQ7RBb9O7taf8NUD/r97fMl69bXGsgFN4wXwDhegpzHpztiDuqe2pJUy+vO3nJ0vW3XhnZT8NHX9rFnKVp3gCA2ZeIhsG4vnfPeTr1KKHG8WaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791904850; c=relaxed/simple;
	bh=9YwEdKipf9B3ZtPw6zfZ3Z7LzX8IoFKBjKpsnUn7e2s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fM+uJ2PKQc+ze2L5JzhR172TtxVuB2uBa2VHE15kuV2AxaGnKDuqjJj77w9CDGYn9zZsQEqAK7o4jBd6E9YFzTq7sCkxo4thQlP7fRYhbXy+rr6CH3ak7FOdUs+o0dyG9G0fRmicbgNdUQobabz1IPFLSCyvuOa3T1ukkyXgED0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UPlgGftR; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UPlgGftR"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-cc4aa18f9afso1235599a12.3
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 08:20:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791904848; x=1792509648; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XdtbiphqaOoVk0Woyal1YTwVA1Q4Y7nI29mQ+zlJgS8=;
        b=UPlgGftRYsvIZdBVrPZ5r/00e8hJnJrQwVg9o2XxWSAZFHUSQQ9GHhdzvwnzNO6GDx
         hdh9on1Js8CBo/L/stIRuf8YwDaJ6cNxK6lhCCQrd/OsXTPrxSeYIGi15ehYBR73eWOP
         RCfJ1IOypr8g0DzAzRGyfmXtHWpkFScYXnDaCskoUG7Qs5P4iLB6tHa/BrK/e5dzkGpX
         ogAk4MVG1c35G1tR0UplMZgMoVv0URwom5PljwfCNJBf61pfLTmZDb1wHAo4m4aPEa5O
         7pqNAmr0iJTzwKagkZSb+RNAV/ksQ1KwgIsrwQ+w8cU7+cVVcy4Jvk7w84PVD0Nm9ogZ
         angA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791904848; x=1792509648;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XdtbiphqaOoVk0Woyal1YTwVA1Q4Y7nI29mQ+zlJgS8=;
        b=ZfwxQ8kCv6v03wLsydzqZyA/KIlAhVoQtnMhCJPq930/iseFRWJAbNTlDqUHK4UYAu
         jAE519frgxtTixu5KCfhbs95GH2VJ35emMSqYqjIl/9UR2Us1f7e/vkpFberCG/xtOu2
         4GwcU+QMQvr01YUUdmEJnMT7KM8+gWSFW9mH5O/V9IwncWV7kh1HPeGFtCtgx0zclHaA
         VIvZna8mI4kqITirQCQav1AVcezZFZwUVwyFaDYY/f5V1CP3wyen41RxZvMG47mVyZhz
         hICiA2cJQrMeACt1WkqjgnljWIJz7Cxi59Bzb9K/QAwIZ6LS/zl2FA9+CkbYBcn3USZb
         H2cg==
X-Forwarded-Encrypted: i=1; AKwUvBw6VAVqZ3yjPPwtEi8AlL1LZMVsRYiGTIerOaXLTycTgn1Yaq5yizOmrNWZT3SmGtbKCT2NcniZYzlG9Cc=@vger.kernel.org
X-Gm-Message-State: AFq9FYLN9pPG8doEPpzVvoOOfybgxPg3SllVV2k56SKcMcWe9Z4jtBV/
	Aany2p3bpjxQ03VKCLNVJM2yguKyvEGgdTDwyGYeZ57UQ8y31PpZOpn9
X-Gm-Gg: AYBFou1bz5KiMnMXVnegJCnyi1/Rhmc9ujItSAmU9dnIJgrJXvzybXxLP9ea6Dkkb79
	opfjuw0uTbr0+BVZ4HUV+GbekE8M6Af7kypiHBlSJZdQSza5Dp6gKb1540I7xcRClZq9CUXqS7u
	x5vb3dY4HtRQ/LnUmvAkAPym31li0XdM9kUaL6Oiy5CASksG8VB1Is0Lk4fCeLqqUOCLh8OPVyV
	JgVMjhxVZmaaStfYqvYOirKGkNBgjP3c/YLTg1tP0vA8TUwZUGX9CZWIcfspMAMKhf7Ln1BWUzr
	90ev0TOeyZ7VQpwwF/Uu2euaTP5EYy4SupHkrQK2d51Y4SY4PG66pvnLrVdhKKHxcpXBUejOwiE
	V9jLxTv9Ry7ZSb8zXh8BqCT0F5JGWY3l2HMX/bAJmgpUISvsJA7U8Or2IK7VOtbmJM73uUg3e4j
	pzoXP1UD/wABFzMNgNgSs9yP0YZvTc8TpDS6yfwvlRUWyeUy7+wU3PS7dAw6N77wKx1xufpASuW
	V3exkCyDfPCyDluHqZQ5ovIlvMU
X-Received: by 2002:a05:6a20:eed0:20b0:3e1:7fd5:cba1 with SMTP id adf61e73a8af0-3e17fd5d0edmr5812678637.43.1791904848262;
        Tue, 13 Oct 2026 08:20:48 -0700 (PDT)
Received: from buffalo-ssd.taila54753.ts.net ([240b:253:4760:f400:1ebf:ceff:fe7f:5e0b])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd3da04596dsm5759888a12.29.2026.10.13.08.20.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 08:20:46 -0700 (PDT)
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
Subject: [PATCH v2 29/35] clk: mediatek: mt8183: Switch to common probe/remove helpers
Date: Wed, 14 Oct 2026 00:17:28 +0900
Message-ID: <20261013151734.3177690-30-akkun11.open@gmail.com>
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

The MT8183 apmixedsys driver used a custom probe to register PLLs and
gates but had no remove callback. The audiosys driver used custom
probe/remove callbacks to populate and depopulate child devices.

With PLL registration and child-device population supported by the
common helpers, both drivers can use
mtk_clk_simple_probe() and mtk_clk_simple_remove().

Switch the apmixedsys driver to module_platform_driver() so its clocks
are properly unregistered on module removal.

Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
---
Changes in v2:
- Improvement of commit messages
---
 drivers/clk/mediatek/clk-mt8183-apmixedsys.c | 51 ++++----------------
 drivers/clk/mediatek/clk-mt8183-audio.c      | 26 ++--------
 2 files changed, 13 insertions(+), 64 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mt8183-apmixedsys.c b/drivers/clk/mediatek/clk-mt8183-apmixedsys.c
index 6242d4f5376e..deb96537a3ab 100644
--- a/drivers/clk/mediatek/clk-mt8183-apmixedsys.c
+++ b/drivers/clk/mediatek/clk-mt8183-apmixedsys.c
@@ -139,59 +139,28 @@ static const struct mtk_pll_data plls[] = {
 	    0, 0, 32, 8, 0x02B4, 1, 0x02BC, 0x0014, 1, 0x02B8, 0, 0x02B4),
 };
 
-static int clk_mt8183_apmixed_probe(struct platform_device *pdev)
-{
-	void __iomem *base;
-	struct clk_hw_onecell_data *clk_data;
-	struct device_node *node = pdev->dev.of_node;
-	struct device *dev = &pdev->dev;
-	int ret;
-
-	base = devm_platform_ioremap_resource(pdev, 0);
-	if (IS_ERR(base))
-		return PTR_ERR(base);
-
-	clk_data = mtk_devm_alloc_clk_data(dev, CLK_APMIXED_NR_CLK);
-	if (!clk_data)
-		return -ENOMEM;
-
-	ret = mtk_clk_register_plls(dev, plls, ARRAY_SIZE(plls), clk_data);
-	if (ret)
-		return ret;
-
-	ret = mtk_clk_register_gates(&pdev->dev, node, apmixed_clks,
-				     ARRAY_SIZE(apmixed_clks), clk_data);
-	if (ret)
-		goto unregister_plls;
-
-	ret = of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
-	if (ret)
-		goto unregister_gates;
-
-	return 0;
-
-unregister_gates:
-	mtk_clk_unregister_gates(apmixed_clks, ARRAY_SIZE(apmixed_clks), clk_data);
-unregister_plls:
-	mtk_clk_unregister_plls(plls, ARRAY_SIZE(plls), clk_data);
-
-	return ret;
-}
+static const struct mtk_clk_desc apmixed_desc = {
+	.plls = plls,
+	.num_plls = ARRAY_SIZE(plls),
+	.clks = apmixed_clks,
+	.num_clks = ARRAY_SIZE(apmixed_clks),
+};
 
 static const struct of_device_id of_match_clk_mt8183_apmixed[] = {
-	{ .compatible = "mediatek,mt8183-apmixedsys" },
+	{ .compatible = "mediatek,mt8183-apmixedsys", .data = &apmixed_desc },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, of_match_clk_mt8183_apmixed);
 
 static struct platform_driver clk_mt8183_apmixed_drv = {
-	.probe = clk_mt8183_apmixed_probe,
+	.probe = mtk_clk_simple_probe,
+	.remove = mtk_clk_simple_remove,
 	.driver = {
 		.name = "clk-mt8183-apmixed",
 		.of_match_table = of_match_clk_mt8183_apmixed,
 	},
 };
-builtin_platform_driver(clk_mt8183_apmixed_drv)
+module_platform_driver(clk_mt8183_apmixed_drv)
 
 MODULE_DESCRIPTION("MediaTek MT8183 apmixedsys clocks driver");
 MODULE_LICENSE("GPL");
diff --git a/drivers/clk/mediatek/clk-mt8183-audio.c b/drivers/clk/mediatek/clk-mt8183-audio.c
index 011d329ad30e..0a53b0408dcc 100644
--- a/drivers/clk/mediatek/clk-mt8183-audio.c
+++ b/drivers/clk/mediatek/clk-mt8183-audio.c
@@ -70,29 +70,9 @@ static const struct mtk_gate audio_clks[] = {
 static const struct mtk_clk_desc audio_desc = {
 	.clks = audio_clks,
 	.num_clks = ARRAY_SIZE(audio_clks),
+	.populate_children = true,
 };
 
-static int clk_mt8183_audio_probe(struct platform_device *pdev)
-{
-	int r;
-
-	r = mtk_clk_simple_probe(pdev);
-	if (r)
-		return r;
-
-	r = devm_of_platform_populate(&pdev->dev);
-	if (r)
-		mtk_clk_simple_remove(pdev);
-
-	return r;
-}
-
-static void clk_mt8183_audio_remove(struct platform_device *pdev)
-{
-	of_platform_depopulate(&pdev->dev);
-	mtk_clk_simple_remove(pdev);
-}
-
 static const struct of_device_id of_match_clk_mt8183_audio[] = {
 	{ .compatible = "mediatek,mt8183-audiosys", .data = &audio_desc },
 	{ /* sentinel */ }
@@ -100,8 +80,8 @@ static const struct of_device_id of_match_clk_mt8183_audio[] = {
 MODULE_DEVICE_TABLE(of, of_match_clk_mt8183_audio);
 
 static struct platform_driver clk_mt8183_audio_drv = {
-	.probe = clk_mt8183_audio_probe,
-	.remove = clk_mt8183_audio_remove,
+	.probe = mtk_clk_simple_probe,
+	.remove = mtk_clk_simple_remove,
 	.driver = {
 		.name = "clk-mt8183-audio",
 		.of_match_table = of_match_clk_mt8183_audio,
-- 
2.56.0

