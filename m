Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 448BC53ED19
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 15:21:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791904861; cv=none; b=OBKcY2u8/2ARQyLxVDGkkcFjaT9+UXU3TgdYGkbFmlsypK4P8h/k5BZ1U2I6ZLCmjibRicugcExQPth9i31+jnFcET+OEdgVhJnFporfmklQYgLr6g36Y/e+tQ319Pj86GR2hzEDfdiBxn00XHwXvZurhRZbz8VpkjMRxbee2BQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791904861; c=relaxed/simple;
	bh=5bnJMgCu5Tr+71pP/gVP3j4yrqsuM+34hPq97dilqbM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=T2+TH7qlCUPonH+2KGrAePCJ06ubQ6GMQzRn1gE+SAyDaVoncFHOQgRhvOoY4N4shHYahezhpSisfPZ3RlJn1X0P3ffaNrX+ieSHLD2IicVVx6wYqNb6yzCUCUZPk3FWgur/Ks61p4+Fge4B62EGzIdBBphudycdvBlTfqfKwJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cyvyiYCd; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cyvyiYCd"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-cc4ca696de6so1674180a12.2
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 08:21:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791904860; x=1792509660; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=koJzOGNGhGI2FekRZoUPq9jws4eXY5RXfs5BhgV9YaI=;
        b=cyvyiYCdFKUkZHVzOG0D/PblVxiVrH9TpZwhEZKAryCK+GseMv8WArr8Jdlza0V3Gj
         J6ZhozL6iwHmvPmZRuNucDG5UwYxEra+ZhQ/9F6+OdJ7gTdVJiA91qrlb8zk9K6rDN9x
         GKwpkeJ/MDgNiIJO7D0dnmSgUpZKOxel2mj6EaRetHeUT7/KAVCNV4ERRS6pq1ZP3SIs
         ieNoKy7bCRiltXWWRxvGfCpWl6WAuagiGCRCpUB8l+fRiMxDu4XjWqK59Bli/amsUEAI
         Z8/x8LNxEp7qQ+EFeXdgvSSPwwHbOU6zIcZh4f3967qg3In9IuqUiBN4Q7Uur+sa2U+V
         jdCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791904860; x=1792509660;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=koJzOGNGhGI2FekRZoUPq9jws4eXY5RXfs5BhgV9YaI=;
        b=rREH83TD+sP0AVioE4qplvfB+tO74USJSxZeB7UuKMOt3BsuU7iCszV4f8erLdLJrs
         Va1nllRyBlXedknY3I2Cp14b0LPD8jPKi6CAQnGEoRbQAL5h9jP8lfcjkup1ymPloMbT
         TytF6QwYyXA+s8pzS6p7jArhgCvJVFqf/dzsb/IWmp/0qtHsZNakZGLRo1YirjFx4TPM
         oNnemQ1qQZGBlXXj2PGFbibuFyamZcJjqKNWjI8+lMFkbVZaaVHwkJFszUko0+dHaGIx
         50vkocknTmWqykDi6X1+qHxMqBAXDRoJHNH8o1CKE2eNi64Q0tAzGgf7YCeam5gZUH1T
         DROQ==
X-Forwarded-Encrypted: i=1; AKwUvByDGg1q/O4ztadgJzFHH41wa5HQp06wSupRuV9wh1RMU4RPirDApIvWBP28je9vuvs9DB7BMlLCuOzCTqs=@vger.kernel.org
X-Gm-Message-State: AFq9FYKtykCNlAqrvVjj1hYb2e7zw0pHGZCjLyzDWptx6htA1z+rUKkP
	36o5Lc4hTBG/ZipSGMoMG/ILvaLJ/nStxSnanY5QoaFlybmkZTmUqb+p
X-Gm-Gg: AYBFou28W5qWSLTHwmlhHvjYK5PFIsdI7K7j58C9CdcdIeXrM2uaIG5n6E/0wtaYdQv
	DjStDqLIXt+j7m/g3i0Nh9dNpwg+5EURWhW9dfFSFa8BWPSOGAPkTJVl3chQfSrnrUEtsPNfa0c
	d9+FfqvcUbf84JOpz401Vl9EGnmrHhy1LVRpel7wujaWZLSOI2A3cBk8PG60s3CJkVf3oS/vYQj
	uHnwURvbr1Nu1nnjjgBOQ2BGVNlgAPL6Qj1oatp+k0eIfej4BiziYB9zfy+/Yg8vWihCEEdb8GR
	2LaWph/3NyN9oO6i/yFa8em6Tq6pnApS+ClVYFZvT26E/X7lPzANDeu3Y1kyWLlYBTo7SggnWMH
	FKXoQj3+tHLe5qW6R5NQ1yCRIY3jum0OJX0wLZJavbJXDl+V5dDcVBQZfCpT1qyx88w4VIoDniY
	VibhxJZrRHPkSC7dRr/6RhRi3CP+YymSfoh8NCQk5hgRP60/toWu4YIEKV6QrdGyam9VBYlibxc
	ioFV/V2yx3V802EnbNXd2QoCLCYGQ==
X-Received: by 2002:a05:6a20:db0c:b0:3de:4976:a0fe with SMTP id adf61e73a8af0-3e16beec8b6mr11313108637.64.1791904859502;
        Tue, 13 Oct 2026 08:20:59 -0700 (PDT)
Received: from buffalo-ssd.taila54753.ts.net ([240b:253:4760:f400:1ebf:ceff:fe7f:5e0b])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd3da04596dsm5759888a12.29.2026.10.13.08.20.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 08:20:58 -0700 (PDT)
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
Subject: [PATCH v2 31/35] clk: mediatek: mt8188-apmixedsys: Switch to common probe/remove helpers
Date: Wed, 14 Oct 2026 00:17:30 +0900
Message-ID: <20261013151734.3177690-32-akkun11.open@gmail.com>
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

The MT8188 apmixedsys driver previously needed custom probe/remove
callbacks to register and unregister PLLs. With PLL support now
available in the common helpers, the driver can use
mtk_clk_simple_probe() and mtk_clk_simple_remove().

Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
---
Changes in v2:
- Improvement of commit messages
---
 drivers/clk/mediatek/clk-mt8188-apmixedsys.c | 60 ++++----------------
 1 file changed, 10 insertions(+), 50 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mt8188-apmixedsys.c b/drivers/clk/mediatek/clk-mt8188-apmixedsys.c
index 48a2f61d4b77..3937d93cac34 100644
--- a/drivers/clk/mediatek/clk-mt8188-apmixedsys.c
+++ b/drivers/clk/mediatek/clk-mt8188-apmixedsys.c
@@ -89,62 +89,22 @@ static const struct mtk_pll_data plls[] = {
 	    0, 0, 22, 0x0344, 24, 0, 0, 0, 0x0344, 0, 0, 0, 9),
 };
 
+static const struct mtk_clk_desc apmixed_desc = {
+	.plls = plls,
+	.num_plls = ARRAY_SIZE(plls),
+	.clks = apmixed_clks,
+	.num_clks = ARRAY_SIZE(apmixed_clks),
+};
+
 static const struct of_device_id of_match_clk_mt8188_apmixed[] = {
-	{ .compatible = "mediatek,mt8188-apmixedsys" },
+	{ .compatible = "mediatek,mt8188-apmixedsys", .data = &apmixed_desc },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, of_match_clk_mt8188_apmixed);
 
-static int clk_mt8188_apmixed_probe(struct platform_device *pdev)
-{
-	struct clk_hw_onecell_data *clk_data;
-	struct device_node *node = pdev->dev.of_node;
-	int r;
-
-	clk_data = mtk_alloc_clk_data(CLK_APMIXED_NR_CLK);
-	if (!clk_data)
-		return -ENOMEM;
-
-	r = mtk_clk_register_plls(&pdev->dev, plls, ARRAY_SIZE(plls), clk_data);
-	if (r)
-		goto free_apmixed_data;
-
-	r = mtk_clk_register_gates(&pdev->dev, node, apmixed_clks,
-				   ARRAY_SIZE(apmixed_clks), clk_data);
-	if (r)
-		goto unregister_plls;
-
-	r = of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
-	if (r)
-		goto unregister_gates;
-
-	platform_set_drvdata(pdev, clk_data);
-
-	return 0;
-
-unregister_gates:
-	mtk_clk_unregister_gates(apmixed_clks, ARRAY_SIZE(apmixed_clks), clk_data);
-unregister_plls:
-	mtk_clk_unregister_plls(plls, ARRAY_SIZE(plls), clk_data);
-free_apmixed_data:
-	mtk_free_clk_data(clk_data);
-	return r;
-}
-
-static void clk_mt8188_apmixed_remove(struct platform_device *pdev)
-{
-	struct device_node *node = pdev->dev.of_node;
-	struct clk_hw_onecell_data *clk_data = platform_get_drvdata(pdev);
-
-	of_clk_del_provider(node);
-	mtk_clk_unregister_gates(apmixed_clks, ARRAY_SIZE(apmixed_clks), clk_data);
-	mtk_clk_unregister_plls(plls, ARRAY_SIZE(plls), clk_data);
-	mtk_free_clk_data(clk_data);
-}
-
 static struct platform_driver clk_mt8188_apmixed_drv = {
-	.probe = clk_mt8188_apmixed_probe,
-	.remove = clk_mt8188_apmixed_remove,
+	.probe = mtk_clk_simple_probe,
+	.remove = mtk_clk_simple_remove,
 	.driver = {
 		.name = "clk-mt8188-apmixed",
 		.of_match_table = of_match_clk_mt8188_apmixed,
-- 
2.56.0

