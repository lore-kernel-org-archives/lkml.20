Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CDDB53D9C0
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 15:20:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791904832; cv=none; b=c3tZ2myeZcmE4gwasp/MIkG+uSjv+ls2y83mo2j+dfqVrbS0YOm8iQ1Q0jwOvl+VMNq4IvSs/GxNeIONO6HmYm+r350/8LM4pFkiqUwtDwNit76KqTeyu51+LbbJfQGC4y/csthiuv1mwVrNrIHjaTyWR98Hg+9YGuuBHhzNk7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791904832; c=relaxed/simple;
	bh=a/9N3ZE90iZLm11kms5O6T/uEQHwZhKl4e+KlyHs0OQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=g3usf80hD+4RnDGUpSBiR5GmWlFMMm56m3cxpcRjfufzwRzG9bU+fUAYzmW2GYR147BGcJmBk0BmZzKWjLsrxAigA7Lo3Tp8UzBmXVL9sIX9r+cUMthX0yBv/Kq6mR4EPwYF9YAYLgG5maujNDg/g5bS0hcJf8L3TpEnhnhBzNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GipfqfCr; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GipfqfCr"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-8819033dbadso1898308b3a.0
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 08:20:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791904831; x=1792509631; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vEXcscvrJtgAmrYVGg0Xg0Qu27fkyZnfR3Z3i2hfldY=;
        b=GipfqfCrmiUbIBJB0tcXltBfzpD7m5Mkr94nbcAs2MFHAMMaiD6o3Iwf3RkmK0cL2u
         uXNGSn560VPVtvXXOKdZGWALWIadviw+gbKauZB/YeWCbkOtdmNrd6dMRfXAVkBiv4R5
         2PVUigxuOSLAyRIjj4AFkX0zvgTUTs5SSPuDofH2sssVVu1UT/B6ScxU9/sVRWF2Kku/
         rL1jng5E53V8BeZKKcoG2DFcPVXWB3tLrWuXtvYHchZO9tIPrb+dmKOK6/iKYF//FII6
         DebPOzTQczF4cRJ13Sn7d/lCg9CGvDYLY5rDzsBSIZHCTe9vuBD8pdU5wiI/GkIoDPMa
         FdUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791904831; x=1792509631;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vEXcscvrJtgAmrYVGg0Xg0Qu27fkyZnfR3Z3i2hfldY=;
        b=ECWgAju9RNpeq555UxrgqdSP+1+sHboEVWjk/NOa538EzaU83UViQnd10dBlFIJa7Z
         4TwdU/ujZsM1sGi6DgKjnyVqQZXL/S+XFHJF6YAGbdTgOYo7cy+DfjhPon2mzhXfHpYB
         mylBzvj6l2gA5BrIw5l5JoiCuDbVR+61tPoiuZmTdROj72foahYfQlbY/fBEYkryvscl
         tbZTxe9jDW3Y6XE/mxahMSKfzvkGC9e7cT9Cx/OBxcqEOJ+LIc8ooh7kW4gODFnUyUhv
         1QQj0u/IuvDQptAKfqHxuFdpwflshTBg2N09huUJlU5ifrKA8pgGraYNeS/o4sUoECFw
         KoMQ==
X-Forwarded-Encrypted: i=1; AKwUvBzvCi4H45ip7MicI02W0VdrFey2qB+UhyY6Hh9oyu3AMHchXGww9gEdxOBYfor83w4Ukp0075/JPAURBtk=@vger.kernel.org
X-Gm-Message-State: AFq9FYIhpSnqiN3HIPeWZ0qtz/ckQXmY45jssfp1WXZpVP697443vhPi
	jK/GVK6iCeqCTLFH43RUfw73qADJ3ouckluU8HKAHRSKZrs8JFk7564B
X-Gm-Gg: AYBFou2EAwW3JYpL+blbS/LExjCVrff77R0dN0k0xHOR6j/mzEud/wRGa8i8r2sDVwD
	bFFFrL67if1wQVsexA3mGSbshWNFN3wCp8swPfYeaK6ndFQ362b4wvSNZNbuHjX5bEt2cA0sQoO
	t11i/FexumDbU77704M3CCCSBXL9ViitHPZMAUm4zlgMlOm3Qbe0GK6lC+gW7hi/5JYiibJXspa
	Lka+E35eA1u5N6qlHZ5g9r2jzlf8tb1I7evf/7ODYVXdu9qAfm+SQBpRHgmD/bxz0aXb2Qxofov
	Dmuzam0D8Xy5ndMq5HYLm7bvZuS5RlhbCguaAuGzBvBsSUr+acdkIjPacfzOnk+Hcv/2+KajE94
	ol3PgpaYLyRMHPi+arZ6j+e5zH3dB6IsLndGrgMcdWw3yxEVin93vbwaCVWcevdOOKqB03TjSiV
	IJ7grFNPMBPfolbQ7IIJgQqYzFS9QaLzDqEM4ZMmu48KQxBH9hfa5vqCdKTD7CzGlpYLelhP4eq
	z5+VtchM/F8sPByq0752YlVz1Et
X-Received: by 2002:a05:6a20:734d:b0:3dd:d887:3e28 with SMTP id adf61e73a8af0-3e16bf4e824mr10572171637.74.1791904830571;
        Tue, 13 Oct 2026 08:20:30 -0700 (PDT)
Received: from buffalo-ssd.taila54753.ts.net ([240b:253:4760:f400:1ebf:ceff:fe7f:5e0b])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd3da04596dsm5759888a12.29.2026.10.13.08.20.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 08:20:29 -0700 (PDT)
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
Subject: [PATCH v2 26/35] clk: mediatek: mt8135-apmixedsys: Switch to common probe/remove helpers
Date: Wed, 14 Oct 2026 00:17:25 +0900
Message-ID: <20261013151734.3177690-27-akkun11.open@gmail.com>
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

The MT8135 apmixedsys driver previously needed custom probe/remove
callbacks to register and unregister PLLs. With PLL support now
available in the common helpers, the driver can use
mtk_clk_simple_probe() and mtk_clk_simple_remove().

Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
---
Changes in v2:
- Improvement of commit messages
---
 drivers/clk/mediatek/clk-mt8135-apmixedsys.c | 50 +++-----------------
 1 file changed, 7 insertions(+), 43 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mt8135-apmixedsys.c b/drivers/clk/mediatek/clk-mt8135-apmixedsys.c
index e3b7dc13b458..fe868417de48 100644
--- a/drivers/clk/mediatek/clk-mt8135-apmixedsys.c
+++ b/drivers/clk/mediatek/clk-mt8135-apmixedsys.c
@@ -47,56 +47,20 @@ static const struct mtk_pll_data plls[] = {
 	PLL(CLK_APMIXED_VDECPLL, "vdecpll", 0x304, 0x31c, 0x80000000, 0, 21, 0x2b0, 6, 0x0, 0x308, 0),
 };
 
-static int clk_mt8135_apmixed_probe(struct platform_device *pdev)
-{
-	struct clk_hw_onecell_data *clk_data;
-	struct device_node *node = pdev->dev.of_node;
-	int ret;
-
-	clk_data = mtk_alloc_clk_data(CLK_APMIXED_NR_CLK);
-	if (!clk_data)
-		return -ENOMEM;
-
-	ret = mtk_clk_register_plls(&pdev->dev, plls, ARRAY_SIZE(plls),
-				    clk_data);
-	if (ret)
-		goto free_clk_data;
-
-	ret = of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
-	if (ret)
-		goto unregister_plls;
-
-	platform_set_drvdata(pdev, clk_data);
-
-	return 0;
-
-unregister_plls:
-	mtk_clk_unregister_plls(plls, ARRAY_SIZE(plls), clk_data);
-free_clk_data:
-	mtk_free_clk_data(clk_data);
-
-	return ret;
-}
-
-static void clk_mt8135_apmixed_remove(struct platform_device *pdev)
-{
-	struct device_node *node = pdev->dev.of_node;
-	struct clk_hw_onecell_data *clk_data = platform_get_drvdata(pdev);
-
-	of_clk_del_provider(node);
-	mtk_clk_unregister_plls(plls, ARRAY_SIZE(plls), clk_data);
-	mtk_free_clk_data(clk_data);
-}
+static const struct mtk_clk_desc apmixed_desc = {
+	.plls = plls,
+	.num_plls = ARRAY_SIZE(plls),
+};
 
 static const struct of_device_id of_match_clk_mt8135_apmixed[] = {
-	{ .compatible = "mediatek,mt8135-apmixedsys" },
+	{ .compatible = "mediatek,mt8135-apmixedsys", .data = &apmixed_desc },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, of_match_clk_mt8135_apmixed);
 
 static struct platform_driver clk_mt8135_apmixed_drv = {
-	.probe = clk_mt8135_apmixed_probe,
-	.remove = clk_mt8135_apmixed_remove,
+	.probe = mtk_clk_simple_probe,
+	.remove = mtk_clk_simple_remove,
 	.driver = {
 		.name = "clk-mt8135-apmixed",
 		.of_match_table = of_match_clk_mt8135_apmixed,
-- 
2.56.0

