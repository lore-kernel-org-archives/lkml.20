Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61DBD471D01
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 15:19:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791904752; cv=none; b=Fy1CZWu9moaZn+ItTw5QQGpt/jUqBzN+Btj4N32pAkVrJnjcrimQizklOcTA/vMNTUdQj2BRYRwyZgjDLB1aXQ7ve7dAw9OGphn69++76l3g/7LGZfgGQdjt9FaRd7CdFJe/o0R5EIThjiJ6LTqizDXm1AHPaJR32d8Uj+pVnw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791904752; c=relaxed/simple;
	bh=uvr/aNm7qTviBqDZOiXgdASosjAnwdP7ntJtolZ7TnA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YcLDDPRGlmE32hnxBcIbwERtCOAUhKhc11ZYLa20wTcVx/KK3pP2Z2j2rBCrqF3Md5oJOpdbbBp1h6kNgFHGI9HV6lS+eEv+LI7kct5KsJgi0WR8KTah1FAG5Brf7hTawyv70rjgt0UVXAOr56sPauIgaS7NrE5Rx4q6VoKgLFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sH/15U5K; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sH/15U5K"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3a8af3a704fso1522177a91.2
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 08:19:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791904751; x=1792509551; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8VV+eqtGB9isPBsiHWAzEEpBfNpeGwRF5PnvhKsaB4c=;
        b=sH/15U5K6l+FZSdvGzFM2Jnsny9Pk2dh5pBUXJax93GYMJjRIEIO5skDNAQAH3BKNI
         i2tlcCmNQzaS2j3Y5lOt+ioyv6hYvxk8qbef0ukqj9kKtGAlKgIlBTlUlaHEjhaCytT8
         60fraB2qULAXV1jw/bDcVrZRNYvU22AGx8Que3+h1bUYN8kYUvB6Lnue8cs7FSfwDgzX
         VTRAbg2TbMMWgmJmiqYnnkM9p+uH6hpDC/KdfUtsb/iJn1rHvcim7cKYEGy4WfPGWkFO
         sJINDOt/xo4PmqumU1hhrXMY8V2A2Y3e0tyjiEIoPzu+hvTAYZRvW9m/C7hHTQfARCgE
         g/PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791904751; x=1792509551;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8VV+eqtGB9isPBsiHWAzEEpBfNpeGwRF5PnvhKsaB4c=;
        b=v8Lva3wzwALTc7u3pQf4Yf9Bv/Q+dQMbEMOaeKqZJrIX+FTZ4r5+7RLQAtn9Y15ll6
         uuBIDywWs0FqzrsSzvbDplg+TzLJge8T5VJCWUpESUK4K/yMZa3EJm/YPsd69+3TMWzT
         z+oyNnkxA8ucBfdlP5qpH/zVyoOfiW/Aa7aWesvkpkyzxjvyb8V5EgIHecsYyxfkmHvc
         9P0Vm58GfY55aDFxQNnURA1Wb4PrAQ+34v1AzNZbW5AlvMtz0Ux7EHhuhvxp+5zh4w4t
         nax5cuBElC/DSvLMBEvraeNlIt2UpolPNWrt+DAUC8/ZotbaW3H+oCaE6uMau8Cj6Ebg
         nkPA==
X-Forwarded-Encrypted: i=1; AKwUvBwpW2xf4yD2mAiQdo2HtfEIkJd++/j8k+I5xh9Xf9Ra1ttHDTOlkan4FZ9ZSmQ1CBUnCsO7H4kQA8N0nLo=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ08lw3QNQ8Jpi5OtylFhw7CAgxM+p19ACN0XSZEfJySufKHb4T
	fIJHxzlvbu7v9JJwDzGNbpgUaeRwUwHU56hQkLX2Sk1zuLhrlZuB3Pgb
X-Gm-Gg: AYBFou3FgRq+NpA36FDHdKb/HCQ/YIL031WVX5luO4lFwG5KW025WtEPhSzWzYD6kSs
	NsEeflOlM3kkGh3Jd8GrZ2BzqOmoTeG7UtZbk/kAZEYOTdhz+WQZ+c8EOyXetBkGJHQcI/jAgry
	S4IC5jw3FCC26rugtJOE5OQnlusMWZH2HOTMk28fdfZFMAodQVbMjdroq1qipdubV6eo4aOAhGg
	3NkOgUMpLQXjxPxsJTzz5DyIH6SR8opg6wFyAGTLrThKuiWRFXnBwpbu5ieknxlPjjRIGufnmkb
	tehkuU8+54pOSoi0eIDFuDxmm0laFrGs0i4PQ9IsTwwjzzkIsy+AdanBBy4z1RJpxl27rjhc+N1
	9aOFpiXHzxzfQo4Oqag8IvkqM64LjTt5GrEHMqoR4AnfKR7nkt8+scbwEwddiCS05cZ4NhCwlbK
	KuyM2LBZYpuqjnmufu+XELR5s0K8v7KH+T2qXOr6chS5/pM2Ib8bbbM2Lo8+SaxbvFKNTyJYL8z
	c6bUnTJJCvjlShjZ2MbYgM96IIkUQ==
X-Received: by 2002:a17:90b:1d4f:b0:3a4:a592:4cfa with SMTP id 98e67ed59e1d1-3ab3a79d9f8mr10541804a91.45.1791904750446;
        Tue, 13 Oct 2026 08:19:10 -0700 (PDT)
Received: from buffalo-ssd.taila54753.ts.net ([240b:253:4760:f400:1ebf:ceff:fe7f:5e0b])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd3da04596dsm5759888a12.29.2026.10.13.08.19.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 08:19:09 -0700 (PDT)
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
Subject: [PATCH v2 13/35] clk: mediatek: Add PLL support to common probe/remove helpers
Date: Wed, 14 Oct 2026 00:17:12 +0900
Message-ID: <20261013151734.3177690-14-akkun11.open@gmail.com>
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
support PLLs. This reduces boilerplate code in apmixedsys drivers.

Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
---
No changes in v2.
---
 drivers/clk/mediatek/clk-mtk.c | 19 ++++++++++++++++---
 drivers/clk/mediatek/clk-mtk.h |  3 +++
 2 files changed, 19 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mtk.c b/drivers/clk/mediatek/clk-mtk.c
index 004098a839b2..e06cd40d995a 100644
--- a/drivers/clk/mediatek/clk-mtk.c
+++ b/drivers/clk/mediatek/clk-mtk.c
@@ -20,6 +20,7 @@
 #include "clk-gate.h"
 #include "clk-mux.h"
 #include "clk-cpumux.h"
+#include "clk-pll.h"
 
 const struct mtk_gate_regs cg_regs_dummy = { 0, 0, 0 };
 EXPORT_SYMBOL_GPL(cg_regs_dummy);
@@ -486,7 +487,7 @@ static int __mtk_clk_simple_probe(struct platform_device *pdev,
 	}
 
 	/* Composite and divider clocks needs us to pass iomem pointer */
-	if (mcd->composite_clks || mcd->divider_clks) {
+	if (mcd->composite_clks || mcd->divider_clks || mcd->plls) {
 		if (!mcd->shared_io)
 			base = devm_platform_ioremap_resource(pdev, 0);
 		else
@@ -514,7 +515,7 @@ static int __mtk_clk_simple_probe(struct platform_device *pdev,
 	num_clks = mcd->num_clks + mcd->num_composite_clks;
 	num_clks += mcd->num_fixed_clks + mcd->num_factor_clks;
 	num_clks += mcd->num_mux_clks + mcd->num_divider_clks;
-	num_clks += mcd->num_cpumuxes;
+	num_clks += mcd->num_cpumuxes + mcd->num_plls;
 
 	clk_data = mtk_alloc_clk_data(num_clks);
 	if (!clk_data) {
@@ -522,11 +523,18 @@ static int __mtk_clk_simple_probe(struct platform_device *pdev,
 		goto free_base;
 	}
 
+	if (mcd->plls) {
+		r = mtk_clk_register_plls(&pdev->dev, mcd->plls,
+					  mcd->num_plls, clk_data);
+		if (r)
+			goto free_data;
+	}
+
 	if (mcd->fixed_clks) {
 		r = mtk_clk_register_fixed_clks(mcd->fixed_clks,
 						mcd->num_fixed_clks, clk_data);
 		if (r)
-			goto free_data;
+			goto unregister_plls;
 	}
 
 	if (mcd->factor_clks) {
@@ -630,6 +638,9 @@ static int __mtk_clk_simple_probe(struct platform_device *pdev,
 	if (mcd->fixed_clks)
 		mtk_clk_unregister_fixed_clks(mcd->fixed_clks,
 					      mcd->num_fixed_clks, clk_data);
+unregister_plls:
+	if (mcd->plls)
+		mtk_clk_unregister_plls(mcd->plls, mcd->num_plls, clk_data);
 free_data:
 	mtk_free_clk_data(clk_data);
 free_base:
@@ -668,6 +679,8 @@ static void __mtk_clk_simple_remove(struct platform_device *pdev,
 	if (mcd->fixed_clks)
 		mtk_clk_unregister_fixed_clks(mcd->fixed_clks,
 					      mcd->num_fixed_clks, clk_data);
+	if (mcd->plls)
+		mtk_clk_unregister_plls(mcd->plls, mcd->num_plls, clk_data);
 	mtk_free_clk_data(clk_data);
 }
 
diff --git a/drivers/clk/mediatek/clk-mtk.h b/drivers/clk/mediatek/clk-mtk.h
index 02fab4b166f2..b6504b3e77ed 100644
--- a/drivers/clk/mediatek/clk-mtk.h
+++ b/drivers/clk/mediatek/clk-mtk.h
@@ -23,6 +23,7 @@
 #define MTK_WAIT_HWV_DONE_US	30
 
 struct platform_device;
+struct mtk_pll_data;
 
 /*
  * We need the clock IDs to start from zero but to maintain devicetree
@@ -254,6 +255,8 @@ struct mtk_clk_desc {
 	size_t num_mux_clks;
 	const struct mtk_composite *cpumuxes;
 	size_t num_cpumuxes;
+	const struct mtk_pll_data *plls;
+	size_t num_plls;
 	const struct mtk_clk_rst_desc *rst_desc;
 	spinlock_t *clk_lock;
 	bool shared_io;
-- 
2.56.0

