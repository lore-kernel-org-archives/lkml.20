Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90CB853F69B
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 15:21:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791904868; cv=none; b=RI8D8+4sHwGIVWtkxrw3qGkO7p9HSQof1KkksPfRin9XyHILsSeeLIXWQjxdwLSxb+U1FNFFkIA5MHXqOosjxqktSdRBKIO7Gjx4s5zzuxcfBxEcX6dvGfLDcfrz4Z6BCuzDznepTMSCXCEa8j31fV+IUWk6OweyQa7dI2L52x8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791904868; c=relaxed/simple;
	bh=BR7edHRIKktOgvenPaafcfvu1PZaA7W/wZqrAl4jurY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IWNxs79E6U8vSzrbSC1lOvTE7boiWmTrJmBuWoYBmd5yFKY87qhQPljGOw2VBT8V9K9Ram0c1ZC0Wn07/M+ITo8E9uL4OPkukfl5QuVS6pMYdd5os8nhduG/ksincljoUFgIGYsn3Z0DzIG1pFPughR2UH2LAqX9F9MzlDDPRGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z4Vcblq8; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z4Vcblq8"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-cc52c1b8286so1786159a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 08:21:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791904865; x=1792509665; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rUsiNYuvTluJUsDcmK/H2FYsH7QlWV0QeAePaJSh4tU=;
        b=Z4Vcblq8QcU3MgZbyEsHaaDiwFHDxFI8FHSCGAoY1PjW5e1WxFgvtixxIZcsjhpfZp
         7jMr/VDCdQ0xMeDXV0/fPLqwvPxp1Mr23wf43A/ndfvB3VJr9qOvBe/jFIMzZDCHw07y
         nLAmhS6vzvK682wOdASinFIkxVDOJ41+d8qsKL2Ff+1GBdLn4Yp/X1IQbFy0gldOHdES
         mdQSTiJ4T+fucY53GYCK4VUcgTvMAr6UZC62oyDu/rFyH7Osw8+gggCowhL7WWoMSfWb
         2R4a7cCjklXYGARG1MDe9riYssJMd3mdZ2E5bU6RS/9b1TWHWjtCEItV2koJ4J2dGuzB
         NeZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791904865; x=1792509665;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rUsiNYuvTluJUsDcmK/H2FYsH7QlWV0QeAePaJSh4tU=;
        b=1EBKW/d4IXuAdZYnKZaYiC3+FpZqTwu+d+TxfKv1IcnIi+Sjqgrppl76YKzYyOCnxf
         9+vyMLuJfpENm7eeqLPm3LG/cEh1/w7/h7kBMtegbj8qjSLCWt55zmi9sX6QkCgtQJy8
         YDn7mrHO4b4KAI0h0HgAIQHND5/2U6ZXl9XOBZK+rLN5gOUdISeGdwiJM37qVCTYWW/V
         F28FYC6gVc7b5fS5rA+3qlbn0mcYNykerhMLq0d1KTJhywrhlEtl9i57MCpBpjr1TEYP
         dV+G6MMKfiXKMBX+azCIob04Cl4QJEjMok4+Es6w2PrJn1rUSCxkyQZIm1dfIqwRzUCn
         p8dA==
X-Forwarded-Encrypted: i=1; AKwUvBzXSWp6HCIA+kGp9KkOxDTOYwZZI29IydnAAsj3jdDRn1AvCKZikb6g5UeR9VGhZCCO4PBv/G8jxz3dscs=@vger.kernel.org
X-Gm-Message-State: AFq9FYKYT9XjERSZPo8nWsWhVlgjXBylmgcXzZPCncO9cifgzf90/h/5
	aeEwmoapoDnFOn063Xc/WnK4u491wiF4ZJjssjEThnkg3N01w63c0HXb
X-Gm-Gg: AYBFou02JcDDZPhIpYvXKeuHNrSjOaXibobSzTn+ZZJYzH61H5kuzZ/JhYFbPS6jW40
	e6WKNyHTF5Uv1oglDkMYf4dVdZ4850AoXJ+7bshA5QNYYWRwGnD8MKUoPfqd/MZEWT7dlkj7XQQ
	Jg6zLxukWxAkct+qyHbbTaJeCCjypNy6B9u0Blpsdv8K9RFV+iq0Zdsn7j8tdkXb4/tVQu8lwrE
	RhTU1CS3uHpS4dbSQwQDbGGorvV91ZVFrgoWPEhdLlNmKFnMhUPCsL8xRa3gOHTQoWreHjp+v7Q
	4tXZBJqpwJmTLeHjvGknJXsjXl0dewNehtGZlu1JIZz7dPOsy1rr3ASJe07ov+wRCOxuBV0Yt3z
	OZrZeWhIKbsEpCarOUg1FVuCH/uQ7QZVy+HUjnMmCl7s8FKfxEdRM16JFFTwSUzuKEeBmsQR2UI
	1H0R9y49xyEZNMAEGp9kmERKx0bYatN9uyR2PVmlhpjiAABhi9tNymuj6FXHRGgAqMhkDHRS71h
	Ci+Rl1bLxYsSjnsZrZ9oZzSYyOf
X-Received: by 2002:a05:6a20:4304:b0:3e1:1dcd:388d with SMTP id adf61e73a8af0-3e165054d74mr9519388637.40.1791904864753;
        Tue, 13 Oct 2026 08:21:04 -0700 (PDT)
Received: from buffalo-ssd.taila54753.ts.net ([240b:253:4760:f400:1ebf:ceff:fe7f:5e0b])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd3da04596dsm5759888a12.29.2026.10.13.08.20.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 08:21:04 -0700 (PDT)
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
Subject: [PATCH v2 32/35] clk: mediatek: mt8192: Switch to common probe/remove helpers
Date: Wed, 14 Oct 2026 00:17:31 +0900
Message-ID: <20261013151734.3177690-33-akkun11.open@gmail.com>
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

The MT8192 apmixedsys driver previously needed custom probe/remove
callbacks to configure FHCTL and register FHCTL clocks. With FHCTL
support now available in the common helpers, the driver can use
mtk_clk_simple_probe() and mtk_clk_simple_remove().

The audsys driver can also use the common helpers, which now
support populating child devices.

Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
---
Changes in v2:
- Improvement of commit messages
---
 drivers/clk/mediatek/clk-mt8192-apmixedsys.c | 69 ++++----------------
 drivers/clk/mediatek/clk-mt8192-aud.c        | 26 +-------
 2 files changed, 16 insertions(+), 79 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mt8192-apmixedsys.c b/drivers/clk/mediatek/clk-mt8192-apmixedsys.c
index e6ac40e2f12d..92593370f23b 100644
--- a/drivers/clk/mediatek/clk-mt8192-apmixedsys.c
+++ b/drivers/clk/mediatek/clk-mt8192-apmixedsys.c
@@ -143,72 +143,29 @@ static struct mtk_pllfh_data pllfhs[] = {
 	FH(CLK_APMIXED_TVDPLL, FH_TVDPLL, 0x154),
 };
 
+static const struct mtk_clk_desc apmixed_desc = {
+	.clks = apmixed_clks,
+	.num_clks = ARRAY_SIZE(apmixed_clks),
+	.plls = plls,
+	.num_plls = ARRAY_SIZE(plls),
+	.fhctl_node = "mediatek,mt8192-fhctl",
+	.pllfhs = pllfhs,
+	.num_pllfhs = ARRAY_SIZE(pllfhs),
+};
+
 static const struct of_device_id of_match_clk_mt8192_apmixed[] = {
-	{ .compatible = "mediatek,mt8192-apmixedsys" },
+	{ .compatible = "mediatek,mt8192-apmixedsys", .data = &apmixed_desc },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, of_match_clk_mt8192_apmixed);
 
-static int clk_mt8192_apmixed_probe(struct platform_device *pdev)
-{
-	struct clk_hw_onecell_data *clk_data;
-	struct device_node *node = pdev->dev.of_node;
-	const u8 *fhctl_node = "mediatek,mt8192-fhctl";
-	int r;
-
-	clk_data = mtk_alloc_clk_data(CLK_APMIXED_NR_CLK);
-	if (!clk_data)
-		return -ENOMEM;
-
-	fhctl_parse_dt(fhctl_node, pllfhs, ARRAY_SIZE(pllfhs));
-
-	r = mtk_clk_register_pllfhs(&pdev->dev, plls, ARRAY_SIZE(plls),
-				    pllfhs, ARRAY_SIZE(pllfhs), clk_data);
-	if (r)
-		goto free_clk_data;
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
-	return r;
-
-unregister_gates:
-	mtk_clk_unregister_gates(apmixed_clks, ARRAY_SIZE(apmixed_clks), clk_data);
-unregister_plls:
-	mtk_clk_unregister_pllfhs(plls, ARRAY_SIZE(plls), pllfhs,
-				  ARRAY_SIZE(pllfhs), clk_data);
-free_clk_data:
-	mtk_free_clk_data(clk_data);
-	return r;
-}
-
-static void clk_mt8192_apmixed_remove(struct platform_device *pdev)
-{
-	struct device_node *node = pdev->dev.of_node;
-	struct clk_hw_onecell_data *clk_data = platform_get_drvdata(pdev);
-
-	of_clk_del_provider(node);
-	mtk_clk_unregister_gates(apmixed_clks, ARRAY_SIZE(apmixed_clks), clk_data);
-	mtk_clk_unregister_pllfhs(plls, ARRAY_SIZE(plls), pllfhs,
-				  ARRAY_SIZE(pllfhs), clk_data);
-	mtk_free_clk_data(clk_data);
-}
-
 static struct platform_driver clk_mt8192_apmixed_drv = {
 	.driver = {
 		.name = "clk-mt8192-apmixed",
 		.of_match_table = of_match_clk_mt8192_apmixed,
 	},
-	.probe = clk_mt8192_apmixed_probe,
-	.remove = clk_mt8192_apmixed_remove,
+	.probe = mtk_clk_simple_probe,
+	.remove = mtk_clk_simple_remove,
 };
 module_platform_driver(clk_mt8192_apmixed_drv);
 MODULE_DESCRIPTION("MediaTek MT8192 apmixed clocks driver");
diff --git a/drivers/clk/mediatek/clk-mt8192-aud.c b/drivers/clk/mediatek/clk-mt8192-aud.c
index f3ebf8713fbb..8625f656a2e4 100644
--- a/drivers/clk/mediatek/clk-mt8192-aud.c
+++ b/drivers/clk/mediatek/clk-mt8192-aud.c
@@ -80,29 +80,9 @@ static const struct mtk_gate aud_clks[] = {
 static const struct mtk_clk_desc aud_desc = {
 	.clks = aud_clks,
 	.num_clks = ARRAY_SIZE(aud_clks),
+	.populate_children = true,
 };
 
-static int clk_mt8192_aud_probe(struct platform_device *pdev)
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
-static void clk_mt8192_aud_remove(struct platform_device *pdev)
-{
-	of_platform_depopulate(&pdev->dev);
-	mtk_clk_simple_remove(pdev);
-}
-
 static const struct of_device_id of_match_clk_mt8192_aud[] = {
 	{ .compatible = "mediatek,mt8192-audsys", .data = &aud_desc },
 	{ /* sentinel */ }
@@ -110,8 +90,8 @@ static const struct of_device_id of_match_clk_mt8192_aud[] = {
 MODULE_DEVICE_TABLE(of, of_match_clk_mt8192_aud);
 
 static struct platform_driver clk_mt8192_aud_drv = {
-	.probe = clk_mt8192_aud_probe,
-	.remove = clk_mt8192_aud_remove,
+	.probe = mtk_clk_simple_probe,
+	.remove = mtk_clk_simple_remove,
 	.driver = {
 		.name = "clk-mt8192-aud",
 		.of_match_table = of_match_clk_mt8192_aud,
-- 
2.56.0

