Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 777BF47AF69
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 15:20:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791904816; cv=none; b=lhywlmRkfLp9e2dGaV0fRCA7GVQnMupOG8mVJrykS1WwMpWfRteh8Wgl3aaNOXyZfnwuJ5gpNA+9WOSMxThk4mXaGoqel8NKHuTKComZATt/aFIx7HEGcCH9bEwccz58Eq00PLg+1oqKrGyKVvMxtNh2XtUMVkM0rQ1nP1+3D1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791904816; c=relaxed/simple;
	bh=7k8eZsjUuCczF29ZvqH1ym77REu94Pv9qu1kpkRSAUU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OS2lUp7H0aDktbBxtUse1KTi8ivZ4XoE7H3uK6O3YzDTb+EmvBtY9bG55go7i0LnvuObvOWhzhgufzbD4MdEYbVrRnBCf++toWGrsc06lGBRjRQiiEwBUlQK7Q98mGm433ztz/4kduYg4MIK44AhCksjexvoPFGQBD+l8CSDgAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dsWInEQp; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dsWInEQp"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-cc1cf287ef8so1663094a12.3
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 08:20:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791904814; x=1792509614; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eNskGVCiRsgKaHbOLvQq8UPjRNKhURtaGmxGS4VhhxA=;
        b=dsWInEQpQF9CsTuD/2XTaAi4PLC4aNVhbjv+OX5FANrFhZoX/lAMcJ8W8elwVFLQWQ
         gOPHuJ74Yije92ZS0rh4YoL7w3FjFPV8MHPijn/+KjK1e0UtTCYPE9ktHLPRI9eYoLdV
         DQxtw//KHSt1FZ9nhgS5djSSHPbNiFWakrNzxA5bKpnIVwnDr6/VB0O/ors0Of0lXvk/
         5fL/zc7iA57sLeCUQknODESpaVtZxiQi9ot/MhrBCkg0daHjQIELl44QSHcJ0znVVYKj
         arnAO2h7rFnpW8TGxXKpOMPEZJOj3u9ce/6op/Wu6LxMRqLgmv1BF5IPuh9K/iG/SQ+M
         1faA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791904814; x=1792509614;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=eNskGVCiRsgKaHbOLvQq8UPjRNKhURtaGmxGS4VhhxA=;
        b=CZUDtTZLYYPaA7KJOMgsG3zK6SCK13bHfOoxKysKMH25byb6XWz6XSkMdISD/movcl
         hv4sbIC4IlEY+gaeYSQmxj0Spgg1p/Fz8kHA7LM/hd6kvrbgFr0aW1uAE/cviw6NvJZe
         xTd8mFk3j8ONMb11tdacGEo5EjJ1wL6CftAxSr/CfCXYCiKMJ8OQTnI0L7Hj48LC4LvI
         dnLgSJuny6HxcgSatBlqCfR12KBIKxZ7WR9zEbQRuelCpdisuLsq16QXGz5udz+rDKAD
         CSXYyfagkVe2lMYUoSTg+pXjF34LyrwCNJMo0cF13OpYVtqQUaj9Hn8HtLJw8axxK14z
         p7ow==
X-Forwarded-Encrypted: i=1; AKwUvBzCO79F0KbWKr1b4ftLsX3qQ39eFIdQTS39IvcW32IjCo/IWww050+oHQeDkFNo7tDk0nbn81ii5Wng52E=@vger.kernel.org
X-Gm-Message-State: AFq9FYJU4A53bxpM5aSHWrJVxz1+77ePBXpdQQ19mrVxj0vCYqjK6y1S
	1/xao9go6oKix7u9TkdYWlcKjKYiID7n8jNKFx794a6CR9R2aBttZmMb
X-Gm-Gg: AYBFou1A9DY7AE518mSUmeMpx1/RhmiFhGtnMM3mIT8IUQqQrnQg8PItZ1p9+t7IzAR
	OftNU7PZ5C1iyTlFFAvUaIHnNvgz8bZmuchwL0YA1gg6vplVRY3N4rCXCEm/LthC5bN8KcOxBSO
	CqLPyYMZ7q+6P6TYx8EwozZAS34ePNI6tvYFiMb05B7uXZFqHrLRhs9s7NmNWeevDrGNBj6PFQ7
	y8KKm76X9fCDUwZ6MhSElJQIVlpC8eVYVTWYxybRcMtfTmcDB9IMa2NKkEc7lKPo3Xu7t55bXPM
	AdhjZP4eS0HgKBrHBwhfvR6qJw+TyEfr+BOnqEk2D8zE/zzlspxrAXiUKUbvmzbojJyNkcqy5ov
	CU8QOb9YG3QHn4MSDciJ73bbYrbOBCui+nHx0OLoZL7lrI6ReXBfvWYdig9VQGCZ6X4nbe6yneG
	fm+oZ0VeSannRyJE0DLf1LJ7kRgNnU/+eHRSRHedKRvEJk2cXr933YKx2evhAvpKu4zd9DHD6Cd
	T7QOGQ+47rUeSK84qbznQl36TRS
X-Received: by 2002:a05:6a20:549d:b0:3df:f4a5:dca7 with SMTP id adf61e73a8af0-3e16bd88afdmr13497701637.16.1791904813806;
        Tue, 13 Oct 2026 08:20:13 -0700 (PDT)
Received: from buffalo-ssd.taila54753.ts.net ([240b:253:4760:f400:1ebf:ceff:fe7f:5e0b])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd3da04596dsm5759888a12.29.2026.10.13.08.20.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 08:20:13 -0700 (PDT)
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
Subject: [PATCH v2 23/35] clk: mediatek: mt7981-apmixed: Switch to common probe/remove helpers
Date: Wed, 14 Oct 2026 00:17:22 +0900
Message-ID: <20261013151734.3177690-24-akkun11.open@gmail.com>
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

The MT7981 apmixedsys driver used a custom probe to register PLLs but
had no remove callback. With PLL registration and unregistration
handled by the common helpers,
the driver can use mtk_clk_simple_probe() and mtk_clk_simple_remove().

Switch to module_platform_driver() and change the Kconfig
setting to "tristate" to support module builds and ensure
that registered clocks are unregistered on module removal.

Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
---
Changes in v2:
- Improvement of commit messages
---
 drivers/clk/mediatek/Kconfig              |  2 +-
 drivers/clk/mediatek/clk-mt7981-apmixed.c | 37 ++++++-----------------
 2 files changed, 10 insertions(+), 29 deletions(-)

diff --git a/drivers/clk/mediatek/Kconfig b/drivers/clk/mediatek/Kconfig
index be522c43fa42..54ecf2692607 100644
--- a/drivers/clk/mediatek/Kconfig
+++ b/drivers/clk/mediatek/Kconfig
@@ -427,7 +427,7 @@ config COMMON_CLK_MT7629_HIFSYS
 	  to PCI-E and USB.
 
 config COMMON_CLK_MT7981
-	bool "Clock driver for MediaTek MT7981"
+	tristate "Clock driver for MediaTek MT7981"
 	depends on ARCH_MEDIATEK || COMPILE_TEST
 	select COMMON_CLK_MEDIATEK
 	default ARCH_MEDIATEK
diff --git a/drivers/clk/mediatek/clk-mt7981-apmixed.c b/drivers/clk/mediatek/clk-mt7981-apmixed.c
index 851d0bc7840a..810395aff253 100644
--- a/drivers/clk/mediatek/clk-mt7981-apmixed.c
+++ b/drivers/clk/mediatek/clk-mt7981-apmixed.c
@@ -59,45 +59,26 @@ static const struct mtk_pll_data plls[] = {
 	    0x0278, 4, 0, 0x027C, 0),
 };
 
+static const struct mtk_clk_desc apmixed_desc = {
+	.plls = plls,
+	.num_plls = ARRAY_SIZE(plls),
+};
+
 static const struct of_device_id of_match_clk_mt7981_apmixed[] = {
-	{ .compatible = "mediatek,mt7981-apmixedsys", },
+	{ .compatible = "mediatek,mt7981-apmixedsys", .data = &apmixed_desc },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, of_match_clk_mt7981_apmixed);
 
-static int clk_mt7981_apmixed_probe(struct platform_device *pdev)
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
 static struct platform_driver clk_mt7981_apmixed_drv = {
-	.probe = clk_mt7981_apmixed_probe,
+	.probe = mtk_clk_simple_probe,
+	.remove = mtk_clk_simple_remove,
 	.driver = {
 		.name = "clk-mt7981-apmixed",
 		.of_match_table = of_match_clk_mt7981_apmixed,
 	},
 };
-builtin_platform_driver(clk_mt7981_apmixed_drv);
+module_platform_driver(clk_mt7981_apmixed_drv);
 
 MODULE_DESCRIPTION("MediaTek MT7981 apmixedsys clocks driver");
 MODULE_LICENSE("GPL");
-- 
2.56.0

