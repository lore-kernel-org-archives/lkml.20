Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F55553FD3A
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 15:21:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791904883; cv=none; b=HRs+dOXlE7QVoi5o+8UpzNNmK7H+E9Dwtt6n7Fxvx0dYYVsaHDTTTHc9kL8mpLLHU8G5K7irRjrwhQuyHYfMB7yWaJlXJ4fsh8xJRx1Z1XZ8oS/dgDc1ub+LHBBPcYgPloKXuZCJHWvumncGuuuEJVhXDVivh1Ld4oXxUijMArg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791904883; c=relaxed/simple;
	bh=RGrkYZuTtSjsXw16eeH62B1rWTkAboGm/Xac1KF5Lgo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=X+lnoZUZbp7kiWdfDq+lz04w5LP5SwewCjfnowrbLm6Fk58ZOytlA4C72egfQCpD9hSrFJb4iEAjlKbZnbqLv5BXdtdo0d2F6iqqvgJqcRA6xbGlHUShF91RIDxg/q1RuY+QmspYRCRYIWagKYyMcBR085y4XMkyI4bTvTSCNOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XBq0VmNq; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XBq0VmNq"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-cc4e9e56e9aso1056670a12.2
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 08:21:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791904881; x=1792509681; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RhDzmwJCJ52+w45ZL03KR603UOMuV25rBPU/GIg++dM=;
        b=XBq0VmNqqND6KzpAqV3a1yvzz1tXRZMOPZWLVQ7vTG3Zvd+rFGS3CgqBd48VUOYUPK
         ICuNrIb7gqmA6LP3Dq33u48snANUotwwHhcHgeo5q2VJd9IpfRXYGuhs9n0l3ss4SRyd
         9XTRh1q3cYlGQfCvjviYu9KMvyNPq6X9lvMJRbsTsusQdVM8Glk7vKYRW38z97SxlaJ2
         chcUEp5qaaU01+pXnEK7NE/9pEjny65ah4nmAa6INYwkuA8qNd9gAiyAF+J2BNwWgSWm
         S0HOzTzdzVtbnhrC8uDRBoQ8mNrNlT78cGRXOrG1vppeh9mNF8huq2aa6hou/lmwiTwl
         Mpvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791904881; x=1792509681;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RhDzmwJCJ52+w45ZL03KR603UOMuV25rBPU/GIg++dM=;
        b=G7Op+sBAcvp3Snf3tcTGok6RhKziji2fQf2Qfa/yzYhTIfzlOCaoggKmcnMbof7Qzu
         e+bxnLuTTWgWEhlxcOdMySm6QbTMf0JTenDtz8Uqw4sIQGEghxot0lfkQOmX8zmSx7US
         SiqCvygIINAAOeLJjnf69xMH3Bc3O1A4DSqdBY+MEnFndekQAn3tiOWV2tUKKtPal6J/
         b7SjCHftDylqxL5KiXTewWCT3gA7i/1j11yGMscJT89Av3OmNbQZ2tjFW1qHtFSu9SwE
         grYw1FWlJlxWKhCpXqtwM40HhoPCAJvTJs7p9WGmySyfAGQAyBjMqEcuuL/9iT61XfxN
         qFWw==
X-Forwarded-Encrypted: i=1; AKwUvByqDhFN5ye1OLIsOfKxPMObjV2ZxPle8ZvarfKPn6k5h//qPGRYE14rCMhWXIM/N14C+sX57nOfbu7L0vk=@vger.kernel.org
X-Gm-Message-State: AFq9FYJyuA+vPw2b3oVVPQJyiDGovwBlnv7PCKzxo4ZYzC/SXz0/En+o
	ec2f6GcAEB+o0qbT1f/z99Sj+LXBtYDsB2JoZlzheQZX3VSkZvsvIp56
X-Gm-Gg: AYBFou2rtpfQd6/jePdD2OswG5zjlAV1cZXfuDWba297Tfks8AUvD23MF+4MyuA5ydq
	FWzb/Y7WxMGz5PDqkYBIJkFJhlMNi/Kj0tVR7lWDWDQgm1Z88wJ6G9taUW895DrofaSzitU9i1q
	iurAHWk3JUcCikBseVnI+2XdlQUkMPCViO/13xVVDwzcHS0WwgjR0w3gbWsK+Xlve/4WjQ3gfer
	3k94KCtSFCmg0KdBDYK7Hfoi8pyKX0YI+AOyQDRuq79Xq/vF9t7/6eQCj8AJM0X8DQyth9sWaOC
	IXtYb6uIflMMkO05PCKAfM6l4Ro2vi6Qrq12YLzTFCVGalaa1iPcmxS+A+mCsK7T8784YNOQb7D
	vlpcWZ86ul3F8F4gVCXSKvQlIP3fJfyiYNAT3xKdxGkdQOyHDXu05mhTaDqWEfd7KsTJwbO174/
	oHKMXsXcffIfWvNYN5YC3C5QpgnWLox6C1HfrBct/fDD6y2aRsMA7eQLaud+Ek1nvkKzcEDqWOr
	x+T29nBNci4k2BX/pPpE8stNcqD
X-Received: by 2002:a17:90b:2687:b0:3ab:22fe:b13a with SMTP id 98e67ed59e1d1-3ab3a79a2efmr11338174a91.40.1791904880877;
        Tue, 13 Oct 2026 08:21:20 -0700 (PDT)
Received: from buffalo-ssd.taila54753.ts.net ([240b:253:4760:f400:1ebf:ceff:fe7f:5e0b])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd3da04596dsm5759888a12.29.2026.10.13.08.21.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 08:21:20 -0700 (PDT)
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
Subject: [PATCH v2 35/35] clk: mediatek: mt8516-apmixedsys: Switch to common probe/remove helpers
Date: Wed, 14 Oct 2026 00:17:34 +0900
Message-ID: <20261013151734.3177690-36-akkun11.open@gmail.com>
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

The MT8516 apmixedsys driver used a custom probe to register PLLs but
had no remove callback. With PLL registration and unregistration
handled by the common helpers,
the driver can use mtk_clk_simple_probe() and mtk_clk_simple_remove().

Switch to module_platform_driver() to support module unloading and
ensure that registered clocks are unregistered on removal.

Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
---
Changes in v2:
- Improvement of commit messages
---
 drivers/clk/mediatek/clk-mt8516-apmixedsys.c | 42 ++++----------------
 1 file changed, 8 insertions(+), 34 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mt8516-apmixedsys.c b/drivers/clk/mediatek/clk-mt8516-apmixedsys.c
index 2a6206cae2f0..2fb09e7acde7 100644
--- a/drivers/clk/mediatek/clk-mt8516-apmixedsys.c
+++ b/drivers/clk/mediatek/clk-mt8516-apmixedsys.c
@@ -71,52 +71,26 @@ static const struct mtk_pll_data plls[] = {
 	    31, 0x01A0, 1, 0x01B4, 0x01A4, 0),
 };
 
-static int clk_mt8516_apmixed_probe(struct platform_device *pdev)
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
-	ret = of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
-	if (ret)
-		goto unregister_plls;
-
-	return 0;
-
-unregister_plls:
-	mtk_clk_unregister_plls(plls, ARRAY_SIZE(plls), clk_data);
-
-	return ret;
-}
+static const struct mtk_clk_desc apmixed_desc = {
+	.plls = plls,
+	.num_plls = ARRAY_SIZE(plls),
+};
 
 static const struct of_device_id of_match_clk_mt8516_apmixed[] = {
-	{ .compatible = "mediatek,mt8516-apmixedsys" },
+	{ .compatible = "mediatek,mt8516-apmixedsys", .data = &apmixed_desc },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, of_match_clk_mt8516_apmixed);
 
 static struct platform_driver clk_mt8516_apmixed_drv = {
-	.probe = clk_mt8516_apmixed_probe,
+	.probe = mtk_clk_simple_probe,
+	.remove = mtk_clk_simple_remove,
 	.driver = {
 		.name = "clk-mt8516-apmixed",
 		.of_match_table = of_match_clk_mt8516_apmixed,
 	},
 };
-builtin_platform_driver(clk_mt8516_apmixed_drv)
+module_platform_driver(clk_mt8516_apmixed_drv)
 
 MODULE_DESCRIPTION("MediaTek MT8516 apmixedsys clocks driver");
 MODULE_LICENSE("GPL");
-- 
2.56.0

