Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F52551588E
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 15:20:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791904821; cv=none; b=jQfGp2mFTSupm1LI8b7H66LFSIUwJeVTMFYp7SfNo4thpIRz8S3c8nmF8RJg8ltVEMKwRFhxk2xlUzYNN4lb3YauDOEAswkbGs8ZES7YCHYr5oRtoeC5bEyaqLzt2KbzmLYjFvgZgYBLn+8obFxbzab7tcdFkz9XGvK+wS+GedU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791904821; c=relaxed/simple;
	bh=VN12ykLqBN9JH+2uAL3k0pwco9y0vp+p+RMNa9Nkl9E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=k9+VIeY+RDQKu4W8GHyuwKHZvmfqYbQv0+NZ89ZDLObT8OhKN4PkZT6rjYMaVPBS/eiI0YWkdrvgKHhqm9V6tQ5OocApthtCBLsXGibHyEpKSgTscLNg4cCiwOzEyW5IvdcafywOLSmc9Pr20pC/D9bvIhk46m/4x17cDeXrowE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BJRQFFQ3; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BJRQFFQ3"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-cd5cd8d89a7so1124936a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 08:20:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791904819; x=1792509619; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=V11FgU5Hk2iknPklJqDL6cWLAqsnrkzvHZD63RZ0N2Y=;
        b=BJRQFFQ30Gg0cmcIRl3yeI2EZWbM1pdVAl947Fn09f76E2PVquuHC0BwljORsUEPPC
         5Bo6PV6tcXKj3aXeuNM2btynhtrlwpETVynO7buuWP1VeLaSeu6UFFzsNBiebDR+pzMw
         WRJvtJY5lNSdvSTdxkfMvzfdR/0IantDfKkGNnoLGBCbyNZKqcDinaJIUau3dRka5pzz
         MdUUaDbrq/dX+s7s3/fNS3ryuiHMGBSYtlXEG3hqO3zMuS3/Cvyc+JNx/W7CzRZe/3HH
         DuaYas3GMBATYW2NEF1xp+BOelhnY6e43E6fZ5KHU9yUndPoFL8qIlr0+WMC9gYQGmKN
         YdIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791904819; x=1792509619;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=V11FgU5Hk2iknPklJqDL6cWLAqsnrkzvHZD63RZ0N2Y=;
        b=cmDf/wijheuA1vMYAmSMNBPX3VVV9q+M0t2uE2kgg+nTLt5Rt7QLfuD3LCBKClr9jr
         U9unh/HBaQrBI9oKDT7DcUYjnB23UI0lheqH4UtHMBIjvAnjkdKzPQ32yZhmgo4I2jfj
         0sEiGWRascfH89gj5uwRGXHVAgUEB7fwfUExJY7PhHHTU6uCUR86Pt0smVD5b+W+FWhA
         27zKkIaSZxjcq+t51w24tpZtmcy5H7q8fAmpaAI5mvKcvWblVl9AHzrK5Kzur5gffhoV
         x9blAJcMpJc7sBwBP1cvNIXWbu0PbqFL26PmBbdRwzQWE0aWFrz0mhp/IirpOY8P0d1+
         O2yQ==
X-Forwarded-Encrypted: i=1; AKwUvBzgmVO1piK3V4CcblMj3NW6zoWVwQnZMrvES5Zb1oBW2XDE8yRLS98P6Rj/4holey1IQgYXU21aTj5H6Nw=@vger.kernel.org
X-Gm-Message-State: AFq9FYKts3ZhAatXCKTdh6GZioISumWOoXjVfGVm0VLUHgmV2PEwQFt+
	Gt/+DUv+n3P9Te85iVCL+EVvbR4PXbpy6zbZ0kLCxqpNEddJJ3b+jT0j
X-Gm-Gg: AYBFou1OUmu7Yz8vTSqedyTQrK/i6nkIcpiPyJS+rHHO314CXexiggU7FuvnmuVDvkV
	wGRtvVc0qs2B4AdZIPc8xNT4jTcfAwLpja8Tq29LfibTeprhKHtEw99ZnaNm6pK34ZnZPFsh9jA
	tbwimvNaKFRURzVJ0P1PYrxlHR1dgTeED1dUZi0/BcG2/SDxw7vWC3iQ5YTOMo3ls+m+49wmlTw
	2Wld/geLLY3yGKJBb02BkFI1qggavQ+zZwM9mgrRbt1OXzTUdGe6QUMP1/S7S8NhcSMHITr17iY
	zpUicaPf7xItMXdL9biWg3HoLEfxFLe+aRdUq5hpVBz9kkgntDdBIMSrK/lCneolBBZrDrpRBha
	cQYhNDX1QUnDpWDYUuKkx6BkJYaPhRi+R6g1NZUzC1whuqsz5hqPbRr/M2HE0bDESggHImcSh4b
	Qk2rrjO8Wp7jNVpmKVDvbhxUcJ4+bLVfs4Iz6ulv1F0zEIURzO7efgyj8WtSCNfHMzPrHYBnNZN
	NtfUXqqZ5GW2oQsRwGKaaweHeSPYg==
X-Received: by 2002:a05:6a21:e58c:b0:3e1:485a:8e72 with SMTP id adf61e73a8af0-3e16bb0d1e7mr10165482637.1.1791904819285;
        Tue, 13 Oct 2026 08:20:19 -0700 (PDT)
Received: from buffalo-ssd.taila54753.ts.net ([240b:253:4760:f400:1ebf:ceff:fe7f:5e0b])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd3da04596dsm5759888a12.29.2026.10.13.08.20.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 08:20:18 -0700 (PDT)
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
Subject: [PATCH v2 24/35] clk: mediatek: mt7986-apmixed: Switch to common probe/remove helpers
Date: Wed, 14 Oct 2026 00:17:23 +0900
Message-ID: <20261013151734.3177690-25-akkun11.open@gmail.com>
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

The MT7986 apmixedsys driver used a custom probe to register PLLs but
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
 drivers/clk/mediatek/clk-mt7986-apmixed.c | 37 ++++++-----------------
 1 file changed, 9 insertions(+), 28 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mt7986-apmixed.c b/drivers/clk/mediatek/clk-mt7986-apmixed.c
index af3e002bbfb7..6df3e9555e4e 100644
--- a/drivers/clk/mediatek/clk-mt7986-apmixed.c
+++ b/drivers/clk/mediatek/clk-mt7986-apmixed.c
@@ -57,45 +57,26 @@ static const struct mtk_pll_data plls[] = {
 	    0x0278, 4, 0, 0x027c, 0),
 };
 
+static const struct mtk_clk_desc apmixed_desc = {
+	.plls = plls,
+	.num_plls = ARRAY_SIZE(plls),
+};
+
 static const struct of_device_id of_match_clk_mt7986_apmixed[] = {
-	{ .compatible = "mediatek,mt7986-apmixedsys", },
+	{ .compatible = "mediatek,mt7986-apmixedsys", .data = &apmixed_desc },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, of_match_clk_mt7986_apmixed);
 
-static int clk_mt7986_apmixed_probe(struct platform_device *pdev)
-{
-	struct clk_hw_onecell_data *clk_data;
-	struct device_node *node = pdev->dev.of_node;
-	int r;
-
-	clk_data = mtk_alloc_clk_data(ARRAY_SIZE(plls));
-	if (!clk_data)
-		return -ENOMEM;
-
-	mtk_clk_register_plls(&pdev->dev, plls, ARRAY_SIZE(plls), clk_data);
-
-	r = of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
-	if (r) {
-		pr_err("%s(): could not register clock provider: %d\n",
-		       __func__, r);
-		goto free_apmixed_data;
-	}
-	return r;
-
-free_apmixed_data:
-	mtk_free_clk_data(clk_data);
-	return r;
-}
-
 static struct platform_driver clk_mt7986_apmixed_drv = {
-	.probe = clk_mt7986_apmixed_probe,
+	.probe = mtk_clk_simple_probe,
+	.remove = mtk_clk_simple_remove,
 	.driver = {
 		.name = "clk-mt7986-apmixed",
 		.of_match_table = of_match_clk_mt7986_apmixed,
 	},
 };
-builtin_platform_driver(clk_mt7986_apmixed_drv);
+module_platform_driver(clk_mt7986_apmixed_drv);
 
 MODULE_DESCRIPTION("MediaTek MT7986 apmixedsys clocks driver");
 MODULE_LICENSE("GPL");
-- 
2.56.0

