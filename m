Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CDEF533587
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 15:19:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791904749; cv=none; b=LX8JKiTy14ivBiOu9sLm83nWtOguZUQJC26J3U/EN0T4HstmRMJT/fGufPI4GalXj0VEFP0QcUfSKBQqmz871NJAiRpPhtnB4HIf3hUacA04RiD8L489ysQOakYsNmfkQ8MByc3j8YXmqBFCnb5EvzL2PrUiNu4QYQsEkvCsjXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791904749; c=relaxed/simple;
	bh=/KwDlVeusGGxSdrsgZ2Wla7DqEQyrxKB13jqubXMBuc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EGwssq6BB1GxuC0D8sYiU7fjOtR2D/q96tIxI6trsfa0GyiD2LhTCEDvyGcZqX7rG2K7jLDDzu+BvT6WvA4qE3xMHMTtfyQPJxM0zPya70TnwSSuRuPPgA8OuJGKQWBHkNyGbtH2Up4+05sFbuXuwyCkdIgDkXb9epG+KbuYqMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U1l8UGaT; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U1l8UGaT"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-ccca948203aso1147594a12.3
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 08:19:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791904745; x=1792509545; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ORoqp0TiDdQwa9wpTiAA54Y/Pj/AMJOiVqcIlCpQukE=;
        b=U1l8UGaTuiw6tkGPZunS/b+8zfZ8VCepfrZkHpG964Qi7PIrn0jv+ACcKmpCyUi0m5
         69ptvi1w7IZjeV4VfgG7rJZyF75/ZrbsIf2P1ZUzNR+2kGwlvs5ozrHsz7LYBdZIZOeT
         WkQmHx0Eog5vEAGvWgmrW7wqpytVKarD4mYolDP2Mm4KWF3tlY25gFaNwpVS456EzecA
         YbDs1qBDFbt3No3P4/NtmgY1GPpGNSUq1+R5z2cRJ4IWB2OXoW8ajz6mWeUH8YO/fqrm
         VDUK79o7dqUuswee1blWwA5jqGIIPJ6ZembnQevSpbA15RcmxrLEUhMmWAFPE4C0xf8/
         qkKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791904745; x=1792509545;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ORoqp0TiDdQwa9wpTiAA54Y/Pj/AMJOiVqcIlCpQukE=;
        b=dm6j5Bl+8HV1IP/0waWWmnHYlaImXdxDflvCUV9LVhW5X3r4I/1y0QAPcDAVvuwKjn
         1MAF4GbIoqBqb/gjbajAsJrDcKhDdprj4+7IIoxGBwZoEBNAo9j01Oj2d/DRMR0cbDxU
         ppU15+gWBilmHtBR0WA5xkDq3ZTKZ+upKkwFjxPdGzlk6Cjit87i8pKhyf/iBrVmwPSK
         x1X+BxSYex00qpLZ3FhRqDfnWXpd9hxoTGAp48oRAeoF5SsnvYkWjCr1UFA94nVil3qM
         hoh+WMerQS5B5nc5eBpiJqHICVvAD+tg+/04+WymUvzrwjqwOvKZv5s6byNL1c2XoWDe
         Y20Q==
X-Forwarded-Encrypted: i=1; AKwUvBxrQMwii2kAlLzSFIfzoGQv5MF8mW7Mwv1sxSCVB0dCqczUiQ95k994ll4p+2A8is5G+mF3KyNPQeRZMRk=@vger.kernel.org
X-Gm-Message-State: AFq9FYLcZuzhOQBFRbbPSMK3Pe8rA4m+PTFbLm8HNTFzcMhXOuuaBY9R
	pHWphGpNKZNQQVmJUkF2tWYu2gshR0+nFa17aMmoiXwAaEk48k8smA6R
X-Gm-Gg: AYBFou2nV+/9aTfl8JMjBhpfGUcU7XqNL9cLlSO5TfU58yrD6QxRrbCGJa7wb4s3x5B
	LIu5XH2GFkRav6lpbjCys0W4btwN75hqIwSiL66klcuksnoPyuU7ZAjl8IzXR5TxflCfiQq3ngE
	KQvy+Y/y0TxWd3Wz7DW7r6Yf/nYBv0TVQDJkEnBwgzj9/t7SU0+/3xRZrVEPo5/fDbfg/+9mFMO
	T+fQpCfI7iUTCl1c7McpfGLIS2+23675bfJZ8vQc55+ZPhrzhXiDfGs91o2mObfx1socafwSOnI
	pZuda4x24v/MdUiOfQbqK0I6qrNqsjB+qI/RsN82XthH0o+3dqP95Lpa+RmtXBgp/8H9OBK/+aM
	ESNU0ReimHpRj18v3+MtxppW2dlU0zEhiIqgBB8NGS25cPKW4eh3lVgPAb/gatlw5/ul0TTs+Wm
	0Y4GcPbKmtZuVmJwz9+3k82Y9H0Y4uFf/M1JisxW5VJ+6DZPbNb/c+CUibipf5vucc9F+gimW+0
	x326v2XGH2ivzthZxcbNNfu8ZJn
X-Received: by 2002:a05:6a20:1455:b0:3e0:e349:f672 with SMTP id adf61e73a8af0-3e16bf5d17dmr6698639637.82.1791904744725;
        Tue, 13 Oct 2026 08:19:04 -0700 (PDT)
Received: from buffalo-ssd.taila54753.ts.net ([240b:253:4760:f400:1ebf:ceff:fe7f:5e0b])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd3da04596dsm5759888a12.29.2026.10.13.08.18.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 08:19:04 -0700 (PDT)
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
Subject: [PATCH v2 12/35] clk: mediatek: Add cpumux support to common probe/remove helpers
Date: Wed, 14 Oct 2026 00:17:11 +0900
Message-ID: <20261013151734.3177690-13-akkun11.open@gmail.com>
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

Extend __mtk_clk_simple_probe() and __mtk_clk_simple_remove() to
support cpumux clocks. This reduces boilerplate code in drivers for
SoCs that require cpumux registration, such as mt6795-infracfg.

Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
---
No changes in v2.
---
 drivers/clk/mediatek/clk-mtk.c | 18 +++++++++++++++++-
 drivers/clk/mediatek/clk-mtk.h |  2 ++
 2 files changed, 19 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/mediatek/clk-mtk.c b/drivers/clk/mediatek/clk-mtk.c
index 11741cc6ccc7..004098a839b2 100644
--- a/drivers/clk/mediatek/clk-mtk.c
+++ b/drivers/clk/mediatek/clk-mtk.c
@@ -19,6 +19,7 @@
 #include "clk-mtk.h"
 #include "clk-gate.h"
 #include "clk-mux.h"
+#include "clk-cpumux.h"
 
 const struct mtk_gate_regs cg_regs_dummy = { 0, 0, 0 };
 EXPORT_SYMBOL_GPL(cg_regs_dummy);
@@ -513,6 +514,7 @@ static int __mtk_clk_simple_probe(struct platform_device *pdev,
 	num_clks = mcd->num_clks + mcd->num_composite_clks;
 	num_clks += mcd->num_fixed_clks + mcd->num_factor_clks;
 	num_clks += mcd->num_mux_clks + mcd->num_divider_clks;
+	num_clks += mcd->num_cpumuxes;
 
 	clk_data = mtk_alloc_clk_data(num_clks);
 	if (!clk_data) {
@@ -542,6 +544,13 @@ static int __mtk_clk_simple_probe(struct platform_device *pdev,
 			goto unregister_factors;
 	}
 
+	if (mcd->cpumuxes) {
+		r = mtk_clk_register_cpumuxes(&pdev->dev, node, mcd->cpumuxes,
+					      mcd->num_cpumuxes, clk_data);
+		if (r)
+			goto unregister_muxes;
+	}
+
 	if (mcd->composite_clks) {
 		/* We don't check composite_lock because it's optional */
 		r = mtk_clk_register_composites(&pdev->dev,
@@ -549,7 +558,7 @@ static int __mtk_clk_simple_probe(struct platform_device *pdev,
 						mcd->num_composite_clks,
 						base, mcd->clk_lock, clk_data);
 		if (r)
-			goto unregister_muxes;
+			goto unregister_cpumuxes;
 	}
 
 	if (mcd->divider_clks) {
@@ -605,6 +614,10 @@ static int __mtk_clk_simple_probe(struct platform_device *pdev,
 	if (mcd->composite_clks)
 		mtk_clk_unregister_composites(mcd->composite_clks,
 					      mcd->num_composite_clks, clk_data);
+unregister_cpumuxes:
+	if (mcd->cpumuxes)
+		mtk_clk_unregister_cpumuxes(mcd->cpumuxes,
+					    mcd->num_cpumuxes, clk_data);
 unregister_muxes:
 	if (mcd->mux_clks)
 		mtk_clk_unregister_muxes(mcd->mux_clks,
@@ -643,6 +656,9 @@ static void __mtk_clk_simple_remove(struct platform_device *pdev,
 	if (mcd->composite_clks)
 		mtk_clk_unregister_composites(mcd->composite_clks,
 					      mcd->num_composite_clks, clk_data);
+	if (mcd->cpumuxes)
+		mtk_clk_unregister_cpumuxes(mcd->cpumuxes,
+					    mcd->num_cpumuxes, clk_data);
 	if (mcd->mux_clks)
 		mtk_clk_unregister_muxes(mcd->mux_clks,
 					 mcd->num_mux_clks, clk_data);
diff --git a/drivers/clk/mediatek/clk-mtk.h b/drivers/clk/mediatek/clk-mtk.h
index 5417b9264e6d..02fab4b166f2 100644
--- a/drivers/clk/mediatek/clk-mtk.h
+++ b/drivers/clk/mediatek/clk-mtk.h
@@ -252,6 +252,8 @@ struct mtk_clk_desc {
 	size_t num_factor_clks;
 	const struct mtk_mux *mux_clks;
 	size_t num_mux_clks;
+	const struct mtk_composite *cpumuxes;
+	size_t num_cpumuxes;
 	const struct mtk_clk_rst_desc *rst_desc;
 	spinlock_t *clk_lock;
 	bool shared_io;
-- 
2.56.0

