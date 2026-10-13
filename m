Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBEFD51D510
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 15:20:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791904856; cv=none; b=VAL5bN7f9HWMO+LzPjNSvcPYeogGGv3HO12izkn5T95uI2zm14TWolfjjYacpVa0MqqiVCOoPH6MQmdWYPgl2eZM9y5zX2N2L0BROHQ79sFFhFF9x3KEc1B9UbDO0lHsiQQKhy0HXiO0xF4ilCypFPoncUFoFMPNlKMjwQ6XwN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791904856; c=relaxed/simple;
	bh=bIMlaZKJMmh45JFMZ81ve33X+tvg39HjaJCqOBTT67g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tOIMNck2A0YS6coRfYG2me26tP40CsmRyMur8FdY31iyNhFH2MPjjGlDorRk59CG0dkIX4bjuKIP2QV1NCxOSvaYFs5oXa+uQFMlhwCkYkD10xFz0X5JSHa5ieVFPNPrfQ6XrzhDCz329CeaIUtEBGfd9+cj55kiOz3GfY6z6zE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F7xXEKah; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F7xXEKah"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-cc758830601so1995055a12.2
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 08:20:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791904854; x=1792509654; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YCl/6qeMZv3v3Pu317P8LnfQYMKKlWKvO4QJGZKNwak=;
        b=F7xXEKahVKC+X6cNSKjDflBu5Oyxgtfy4gAPFtZzqJc/faUo40HAKwa4LWsD+FFP/W
         D70ZJqBoTrmRVSu8h6hfR2idMCsRZqHD9D9iSUPA//kUWTVMv0ncZiBge2EWE7vNSxQe
         9wWsEyYmeNUDMS+LHOtQsvhsW0E0mMOaOH/fl35OYS4ItwAE34PQJTQ9i3sUpOetT6yV
         LAr8vNnWln4Iweizc7ylWdFzjyfxVJK3/02pSgoD23Y7gZcGnfDAkeB0WCYptWkHz/RF
         la7iSH8wNxDtHAal4ZzYpZBG5fmUNPfF4NSqKY17bP+z3p3o7gL1pZyEo4I8Ygt1HOHo
         uXVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791904854; x=1792509654;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YCl/6qeMZv3v3Pu317P8LnfQYMKKlWKvO4QJGZKNwak=;
        b=jW2blQSXCGw593nlC+E7Wi0gze1j/NCpB31IJnkDrpkD//2Q8lrGfQeTQBk23+dTnf
         WE8uRV8om9aH8b69QTOljMUpxSodso4TN5VMKV0ehmNn62kCkF1fydPCSkCTns/4i1Il
         aTvmG6kJU1yhaGIrWe8pC5s9seU8ekzXS0lFoA1cwgYs+qTbEKR3JbUJt1ZDCsWfcvv/
         st/eIXaoioNycJCMjE8dCBmvEgWOZ4/KmxHMRrdKbl3uDo56TbEamIDMhos0sd5dStCC
         tdBo1rMiGHqoEgNiejFSOWZyW5FdRa+QD8unB52oorTp2etVkiJp1oU+9znbL21H7Xvl
         qKOg==
X-Forwarded-Encrypted: i=1; AKwUvBz1Dn7uUjbwO6Z3NhuWahij4g4Vf6zU/RsXRzujw/atJR14PWEypJPjmTB7+SmvRDTWrYChBEqPX5TRTkE=@vger.kernel.org
X-Gm-Message-State: AFq9FYIgeewLi14+AYjLiYrf00351Z15yLzFVn/DBzQqXoRN3OVIQFPj
	CrubOg9JQvReShVSeMymTxXQJPq2tOyQ8aPoG1+fwxZr+b8Z3n8cWbHX
X-Gm-Gg: AYBFou0QDBwpP9gjrXRFClaKhbY/oQ7OopXLdYZmpO99r/l2MmehCn0YQhaYqmwt6VU
	WTQjp4Rd6HGC8FvgMSpMS3E0hDwPU2sWdlfHtabutl6Mztx7gNAuZjyOFAdrJCq5dKAOqr73hJb
	xPqnjSbggsnLk7X31LqAZpib7DBoZR3oYryqAIcLk49AqI9dyJ9FqktGvp7zJ+/WwjuSaeRUD3D
	M3PgtJ9M6vD2l4mSAae6IpaFf1UPEUuGDrOdxHTCnZ3XjjdSciyMW6jS2Wvu0A/1wD8Gmri7QeN
	6E7QN24TRvn7KShShlZEALXg8zKolVYSh44zh/HoldUq9wiirjzt0mwvHiZzhUwWKtoTMhNbkFX
	+LaJfl0TfNwL1Xkgbinmufz3sURNmpeRicqwo9wJk/AykWk3F438KOSiMKQjTaWVCe4j6jVB4td
	lL15F4eSF2NJOYglIu76zktLH0fIhVyYdz+Z3itfa0vJVT91Rg8NMist+cFoDEyle4uuassyNaf
	yR3YO9RD5Pa1wU1JwQnv+tmCSnI
X-Received: by 2002:a05:6a21:a346:b0:3e1:bc0e:196c with SMTP id adf61e73a8af0-3e1d253c104mr365944637.37.1791904853915;
        Tue, 13 Oct 2026 08:20:53 -0700 (PDT)
Received: from buffalo-ssd.taila54753.ts.net ([240b:253:4760:f400:1ebf:ceff:fe7f:5e0b])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd3da04596dsm5759888a12.29.2026.10.13.08.20.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 08:20:53 -0700 (PDT)
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
Subject: [PATCH v2 30/35] clk: mediatek: mt8186-apmixedsys: Switch to common probe/remove helpers
Date: Wed, 14 Oct 2026 00:17:29 +0900
Message-ID: <20261013151734.3177690-31-akkun11.open@gmail.com>
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

The MT8186 apmixedsys driver previously needed custom probe/remove
callbacks to configure FHCTL for PLL frequency hopping and
register/unregister the affected PLL clocks. With PLL and FHCTL support
now available in the common helpers, the driver can use
mtk_clk_simple_probe() and mtk_clk_simple_remove().

Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
---
Changes in v2:
- Improvement of commit messages
---
 drivers/clk/mediatek/clk-mt8186-apmixedsys.c | 59 ++++----------------
 1 file changed, 11 insertions(+), 48 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mt8186-apmixedsys.c b/drivers/clk/mediatek/clk-mt8186-apmixedsys.c
index d35dd2632e43..b674b1e581a5 100644
--- a/drivers/clk/mediatek/clk-mt8186-apmixedsys.c
+++ b/drivers/clk/mediatek/clk-mt8186-apmixedsys.c
@@ -132,60 +132,23 @@ static struct mtk_pllfh_data pllfhs[] = {
 	FH(CLK_APMIXED_MSDCPLL, FH_MSDCPLL, 0x0118),
 };
 
+static const struct mtk_clk_desc apmixed_desc = {
+	.plls = plls,
+	.num_plls = ARRAY_SIZE(plls),
+	.fhctl_node = "mediatek,mt8186-fhctl",
+	.pllfhs = pllfhs,
+	.num_pllfhs = ARRAY_SIZE(pllfhs),
+};
+
 static const struct of_device_id of_match_clk_mt8186_apmixed[] = {
-	{ .compatible = "mediatek,mt8186-apmixedsys", },
+	{ .compatible = "mediatek,mt8186-apmixedsys", .data = &apmixed_desc },
 	{}
 };
 MODULE_DEVICE_TABLE(of, of_match_clk_mt8186_apmixed);
 
-static int clk_mt8186_apmixed_probe(struct platform_device *pdev)
-{
-	struct clk_hw_onecell_data *clk_data;
-	struct device_node *node = pdev->dev.of_node;
-	const u8 *fhctl_node = "mediatek,mt8186-fhctl";
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
-		goto free_apmixed_data;
-
-	r = of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
-	if (r)
-		goto unregister_plls;
-
-	platform_set_drvdata(pdev, clk_data);
-
-	return r;
-
-unregister_plls:
-	mtk_clk_unregister_pllfhs(plls, ARRAY_SIZE(plls), pllfhs,
-				  ARRAY_SIZE(pllfhs), clk_data);
-free_apmixed_data:
-	mtk_free_clk_data(clk_data);
-	return r;
-}
-
-static void clk_mt8186_apmixed_remove(struct platform_device *pdev)
-{
-	struct device_node *node = pdev->dev.of_node;
-	struct clk_hw_onecell_data *clk_data = platform_get_drvdata(pdev);
-
-	of_clk_del_provider(node);
-	mtk_clk_unregister_pllfhs(plls, ARRAY_SIZE(plls), pllfhs,
-				  ARRAY_SIZE(pllfhs), clk_data);
-	mtk_free_clk_data(clk_data);
-}
-
 static struct platform_driver clk_mt8186_apmixed_drv = {
-	.probe = clk_mt8186_apmixed_probe,
-	.remove = clk_mt8186_apmixed_remove,
+	.probe = mtk_clk_simple_probe,
+	.remove = mtk_clk_simple_remove,
 	.driver = {
 		.name = "clk-mt8186-apmixed",
 		.of_match_table = of_match_clk_mt8186_apmixed,
-- 
2.56.0

