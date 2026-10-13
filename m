Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3F6E517BBD
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 15:20:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791904827; cv=none; b=vChu0ABxHEnisBFG27oof+M4ofV/XKW8zpXhxGRfeoDBLmf+lESbQVBxAyaeeyyK+jlwTAQcPWIOws3O2nYjVgYONbDfD2s0SlrktNTANZbP6jl9eY3P3GOpJADMAB7q/CMxyJBGWSQb6Ypw8aB/RDAVpRo+QNtOsyAgxqBcGYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791904827; c=relaxed/simple;
	bh=STkxUI2RN+ZbwY70yQ32iz1xrpQOQXGahLRP2DqchUQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RX+LWRngX7uQbkl7ZQ2JmMtafppejDCrxfjGGcNOw2VZOSKXuown9cz0GMrFo2vudoRaiR6dIsaTLR8MugspFDutuzsaFRZOqth+D4l9SQNlG8jSr7e82JKOpntOxLz5W1omaciv0vC7A4os15b9j1OmdGVACnaA+SPoOM0+R9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eJoL4xc+; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eJoL4xc+"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-8897e83332fso2176495b3a.1
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 08:20:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791904825; x=1792509625; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S8YZz6YHs+YnhWOB98iSQEya+TM/J9HiEFdEjzFss5E=;
        b=eJoL4xc+Lt6NWTOf7kCwe4KlSltXw6XW7+pd7kPcEshMZGiDAmSTgVXc6V31lPQ4AW
         Xg004/FOFQGcMizeavWdvYkxcs5a4AsM2aYW6J5s0Q0gVusoYNm9ilOTffPuC4FSQA+9
         WxkdIg3CHIceuSUP5fe6+J/uJt/FyxxXYwvsaFEp66XSMSavKUhjPNOUKDbMqnas5Uvr
         SIsKV9TVSnSttRuk2Mu5rM0NTuOzAGi7cw9Xoqyja/kjPIDtHAx8D/JIFuxp90/ol8GM
         ABTc9AUnpPd2qGpVsmt0pGRRlgMyJFJ+CH8XfkX7gfT6QZwr1McNdfgEbi8C48FSUS3b
         dElw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791904825; x=1792509625;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=S8YZz6YHs+YnhWOB98iSQEya+TM/J9HiEFdEjzFss5E=;
        b=Gk/txK0tXf0M7e/6xRTSZLCaNydYTsrRxFnc4GK4kIdnyb5JXD8TrgOkqcCWVj6pTp
         w5Ko6lmtHKmVqdrmkWya6acaQ72xaXMGkBoF0SBgl7dCJ+u2//qmeAXXcDdsQsXFywmV
         O0j4y8ApvaFLSkaRGjb5f1yRNYgG6NXDwKXG1Klkt18mvv0gIY8ihYOSHPXcSADQHESj
         K6Ekx15qahnon6bCXIRBhEL+fjNo3st7tbFQfN0RlLiuNV5X8Nm3uJqyA2rRu4BrZ2Qr
         GrmnTlHs+JBNjg8zFIZN8GW9tXkE7esnIV4wEj2hRVw3DviwZmDB27Byl6w9NjJ/Rn7B
         cUCA==
X-Forwarded-Encrypted: i=1; AKwUvBwAmr5dvtjP8ewhZ7QcAFdYNJ8Z8xBJqFcH6x3RXu3sSpCalCcN+n6ctxfUk2K5+xsJ/DIMiq2qfBGIIPo=@vger.kernel.org
X-Gm-Message-State: AFq9FYJWgUYUmAbVSqXI3osmO3h3pUzihhwQocG7CMjF41UUaxPyQG0+
	cvPx5ljZZ2dUe+ieigzlANXJOnpHbZRbTNSI2Zt5LllhaLCD1VWXcNSp
X-Gm-Gg: AYBFou1zF1jQZW7U3PS4eZ5EdDDukohtKgy3gAyNQsZ5D4SwCeyQvZYKdwBjfP4RClV
	Jmk+Y4Jaw1XB9QC9LXU+XQjbEa7jvZ8lj+ZKARkvlw1zju9KUa6b8H1I912Q4g3yrXND+X9qGpZ
	MpfvbtAf4PJeHGqsZjim9WyG1EyTG52raaiETxuUW2DYiwnXCoxlRt3GLOH7Y0B1TDG0ZK9UHgO
	zPzlm/nXRUSvyxJfUeFxm7lMZeJ42cGyXLP42fR4uMZ3Q/b/ffLue7cf9GIr+8ndfEELGaxStD6
	krgB3KFwoTJ5+tEmjTbZFy5xb6AsrGhyQpZN8uD1r/0EUAiK6JcSkJ5+7pJA7rVDEmhDBwEvCYi
	cEBL9G8LW63yiPFQZ20XFnzZUjrVg6Xt4LbQWX5L+Sv97d14kAc4C1vVV1PjZdoM4lAOuZDrsoA
	Pnnx8Z3YFgpPTbtIeemdRWioRQTWE+Y2q1KWPdYJdPvdiVWMEV1YEwS93UTopyNkD1z9YCUhpzc
	EEiPlFinKpUPW3ihaWCtVHyLN7WqIBETlIFTlE=
X-Received: by 2002:a05:6a21:4ea5:b0:3e0:c2ce:3f71 with SMTP id adf61e73a8af0-3e16be71fe1mr9198126637.37.1791904825086;
        Tue, 13 Oct 2026 08:20:25 -0700 (PDT)
Received: from buffalo-ssd.taila54753.ts.net ([240b:253:4760:f400:1ebf:ceff:fe7f:5e0b])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd3da04596dsm5759888a12.29.2026.10.13.08.20.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 08:20:24 -0700 (PDT)
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
Subject: [PATCH v2 25/35] clk: mediatek: mt7988-apmixed: Switch to common probe/remove helpers
Date: Wed, 14 Oct 2026 00:17:24 +0900
Message-ID: <20261013151734.3177690-26-akkun11.open@gmail.com>
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

The MT7988 apmixedsys driver used a custom probe to register PLLs but
had no remove callback. With PLL registration and unregistration
handled by the common helpers,
the driver can use mtk_clk_simple_probe() and mtk_clk_simple_remove().

Switch to module_platform_driver() to support module unloading
and ensure that registered clocks are unregistered on removal.

Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
---
Changes in v2:
- Improvement of commit messages
---
 drivers/clk/mediatek/clk-mt7988-apmixed.c | 39 ++++++-----------------
 1 file changed, 9 insertions(+), 30 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mt7988-apmixed.c b/drivers/clk/mediatek/clk-mt7988-apmixed.c
index 24f4e7b87a31..f7bb00e7d17a 100644
--- a/drivers/clk/mediatek/clk-mt7988-apmixed.c
+++ b/drivers/clk/mediatek/clk-mt7988-apmixed.c
@@ -71,47 +71,26 @@ static const struct mtk_pll_data plls[] = {
 	    0, 0x0318, 0, 0x0314),
 };
 
+static const struct mtk_clk_desc apmixed_desc = {
+	.plls = plls,
+	.num_plls = ARRAY_SIZE(plls),
+};
+
 static const struct of_device_id of_match_clk_mt7988_apmixed[] = {
-	{ .compatible = "mediatek,mt7988-apmixedsys" },
+	{ .compatible = "mediatek,mt7988-apmixedsys", .data = &apmixed_desc },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, of_match_clk_mt7988_apmixed);
 
-static int clk_mt7988_apmixed_probe(struct platform_device *pdev)
-{
-	struct clk_hw_onecell_data *clk_data;
-	struct device_node *node = pdev->dev.of_node;
-	int r;
-
-	clk_data = mtk_alloc_clk_data(ARRAY_SIZE(plls));
-	if (!clk_data)
-		return -ENOMEM;
-
-	r = mtk_clk_register_plls(&pdev->dev, plls, ARRAY_SIZE(plls), clk_data);
-	if (r)
-		goto free_apmixed_data;
-
-	r = of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
-	if (r)
-		goto unregister_plls;
-
-	return r;
-
-unregister_plls:
-	mtk_clk_unregister_plls(plls, ARRAY_SIZE(plls), clk_data);
-free_apmixed_data:
-	mtk_free_clk_data(clk_data);
-	return r;
-}
-
 static struct platform_driver clk_mt7988_apmixed_drv = {
-	.probe = clk_mt7988_apmixed_probe,
+	.probe = mtk_clk_simple_probe,
+	.remove = mtk_clk_simple_remove,
 	.driver = {
 		.name = "clk-mt7988-apmixed",
 		.of_match_table = of_match_clk_mt7988_apmixed,
 	},
 };
-builtin_platform_driver(clk_mt7988_apmixed_drv);
+module_platform_driver(clk_mt7988_apmixed_drv);
 
 MODULE_DESCRIPTION("MediaTek MT7988 apmixedsys clocks driver");
 MODULE_LICENSE("GPL");
-- 
2.56.0

