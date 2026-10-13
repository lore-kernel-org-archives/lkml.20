Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2501A51C077
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 15:19:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791904769; cv=none; b=KzOCx7lh5jlaFjJ9MK+l+q8vwMfmeok69NaDJwfjXkFiq6eT1LcEha19+guB2LPhMh9SzKP0ynfc8+EO5f86b9RM9Vo9Lwl1C+ExjrnrCqHG2H6Fku1Z3fP41+FRA2/2zX8Cmes0zlJtC3JohXbiOzFik988gwa3a6FzegpFTxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791904769; c=relaxed/simple;
	bh=sMirbfhiLSvYjiyh4iWEJLEzRfVAW8F0zU0QeZSvtsE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AvP3K97p9FJI0vh1r+MIPKffjpowX6zIL7hdUkqv7ExkC0P7BQo9kt6FXIGPfpe+rEsT0FPce9tSKot9hMqChTlpzltzgBwAJ0X09VSFZIKgeMaGwZmsqCa4NJjaACJE1CDl+WvTnJE85mN5W8YlAeDExpP/293T/Hq3hTuYyJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D4j6VtqI; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D4j6VtqI"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-88bd2b44f3aso1454598b3a.0
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 08:19:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791904766; x=1792509566; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cGzT5/jTF65aiyHnTqzngY4HAwKOHWD3aDXsWBDpp8I=;
        b=D4j6VtqIwhR6+V8hJQGhkg0GKHF+TLZBtgA7hQLtvZw6GKy7K686wOafPDmyg/Y6ka
         qH8AMAqoPAhYFI//YyaNsi7eVM6dn7ktXR13g9/mJHQi3d7HkEIOxmVUXiveQfQlOY/Q
         Lk5/yaCswI6oXdXKmaKyXrgNhXpnIE+ILXgKeEUJt0j/OBn5Sw8A9KXRwm8uAJ4q2k8Q
         xLMklHJKKz0nwKexRAHF1DIV8eXc3Zztudbf72Ml54uX6JaGsnz1JHFOfUENu8CmhJVS
         wqTa3e1+glHobGD+s6LxjzCNq2fPq4SNk1rkozwV7aM/GiH6p7p5fVDDTuTvbTEqS98s
         JZgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791904766; x=1792509566;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cGzT5/jTF65aiyHnTqzngY4HAwKOHWD3aDXsWBDpp8I=;
        b=vEtDNizdYoXggT1xoP4cEAeUhy/sTiH1OhNL4bL2yzyqTzLXSejrFyHR7YeQDZx+BV
         XwwJAjNYtUNfvs/W4dRWK+Xq+TNf+k6OvlHPuWeWoFAJ9XG2pm4mM7+NLCqRRaC1fsy3
         PmGqkQXh6nE4O9iPPrvF2XaTnTuA04oozX7W7TL25S4wcrJ7seVBNh4Ter8jGYxblZyj
         ygfz44f5WReKI2NXyoQOddKKRPnemDu6e4dbbMNs4+Cj/uFSa9rnnEd8tnFhZlW/KDhx
         188spkECM3uVsoNQxne7gj1vireF6B6LO55Pvji0/LVZ3E6xg8Edox5sHmYM7MDjoAbK
         ZbPQ==
X-Forwarded-Encrypted: i=1; AKwUvByGwXBSMxbZXb4o8QhUwWtAnWO2E+A353FNRGXy1WTNrqDkAS+znBi2i62DXfJnb9doLtoz8e/Md3B2Re4=@vger.kernel.org
X-Gm-Message-State: AFq9FYKcwzzu0yZCFqBIAYYuviaKIEyEeO3rhWenvcNSyAimv/kMlVSr
	8wwVNWhd/uIow7uEkmC5a7DBCRx4iJ27V2CVuoeGUn3bUv1ajVeiNWnS
X-Gm-Gg: AYBFou0Hr6mNEXw1fN2IEG94k7jn3ZoCkMCZ6F+e8XmYlbZWxCavu3nbfCZLp9U3zIR
	/vZnh1zguOSRcPPS1GXbyFHvo7ow8387wGaNQHQ5CUCbRUA1nDS76hXcz/GUQNAYc7R55CGYYES
	G2gnaTxBwxfJIprseb2uHkJAuli6cV3uSQoM+m6DtF+2Mg6W+kwhnHZWd1ChjF1nXql2fFuJhlv
	o2gM46GwNUvPaVZqwN/grmPqaMC5jP0m6zy1ZA5Hh0uAB64mesLebyUi/epL3oqrQ1Rco2V57pk
	SmCF1QXJmdKOgsfJLvnTmblxlmGSBjO1cjx2KCWNUDN8sdplNv6B8JF+IWo2chxJDVg3NjMofRj
	GGoAys7Kq7jfPwkcZGj8UgGuLw6RPP/AENFWBDDkJkYmQ+7gXsoKLHPkGSHNu+/aFGAVn7O0BPj
	WwqwmPDJwkeIaFW19Rb1pdilJROW/pmwfedPWqbDLdL+WTe+g6YxBCP51kZPGKeq6u+vfCm2Hjj
	vC5xE8BmdiF8NwTTN657jPP5XFT
X-Received: by 2002:a05:6a21:4014:b0:3de:61f3:33f8 with SMTP id adf61e73a8af0-3e1d2702722mr364903637.43.1791904766472;
        Tue, 13 Oct 2026 08:19:26 -0700 (PDT)
Received: from buffalo-ssd.taila54753.ts.net ([240b:253:4760:f400:1ebf:ceff:fe7f:5e0b])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd3da04596dsm5759888a12.29.2026.10.13.08.19.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 08:19:23 -0700 (PDT)
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
Subject: [PATCH v2 15/35] clk: mediatek: Add FHCTL support to common probe/remove helpers
Date: Wed, 14 Oct 2026 00:17:14 +0900
Message-ID: <20261013151734.3177690-16-akkun11.open@gmail.com>
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
support FHCTL.
This reduces boilerplate code in apmixedsys drivers with FHCTL support.

Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
---
Changes in v2:
- Handle PLL registration and unregistration correctly when
  CONFIG_COMMON_CLK_MEDIATEK_FHCTL is disabled.
- Use "FHCTL" insted of "pllfh" in the commit message.
---
 drivers/clk/mediatek/clk-mtk.c | 43 ++++++++++++++++++++++++++++++----
 drivers/clk/mediatek/clk-mtk.h |  6 +++++
 2 files changed, 44 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mtk.c b/drivers/clk/mediatek/clk-mtk.c
index 1172e76516c0..8fa81a8671ad 100644
--- a/drivers/clk/mediatek/clk-mtk.c
+++ b/drivers/clk/mediatek/clk-mtk.c
@@ -23,6 +23,10 @@
 #include "clk-cpumux.h"
 #include "clk-pll.h"
 
+#if IS_ENABLED(CONFIG_COMMON_CLK_MEDIATEK_FHCTL)
+#include "clk-fhctl.h"
+#endif
+
 const struct mtk_gate_regs cg_regs_dummy = { 0, 0, 0 };
 EXPORT_SYMBOL_GPL(cg_regs_dummy);
 
@@ -525,8 +529,18 @@ static int __mtk_clk_simple_probe(struct platform_device *pdev,
 	}
 
 	if (mcd->plls) {
-		r = mtk_clk_register_plls(&pdev->dev, mcd->plls,
+#if IS_ENABLED(CONFIG_COMMON_CLK_MEDIATEK_FHCTL)
+		if (mcd->fhctl_node) {
+			fhctl_parse_dt(mcd->fhctl_node, mcd->pllfhs,
+				       mcd->num_pllfhs);
+			r = mtk_clk_register_pllfhs(&pdev->dev, mcd->plls,
+						    mcd->num_plls, mcd->pllfhs,
+						    mcd->num_pllfhs, clk_data);
+		} else
+#endif
+			r = mtk_clk_register_plls(&pdev->dev, mcd->plls,
 					  mcd->num_plls, clk_data);
+
 		if (r)
 			goto free_data;
 	}
@@ -652,8 +666,17 @@ static int __mtk_clk_simple_probe(struct platform_device *pdev,
 		mtk_clk_unregister_fixed_clks(mcd->fixed_clks,
 					      mcd->num_fixed_clks, clk_data);
 unregister_plls:
-	if (mcd->plls)
-		mtk_clk_unregister_plls(mcd->plls, mcd->num_plls, clk_data);
+	if (mcd->plls) {
+#if IS_ENABLED(CONFIG_COMMON_CLK_MEDIATEK_FHCTL)
+		if (mcd->fhctl_node)
+			mtk_clk_unregister_pllfhs(mcd->plls, mcd->num_plls,
+						  mcd->pllfhs, mcd->num_pllfhs,
+						  clk_data);
+		else
+#endif
+			mtk_clk_unregister_plls(mcd->plls, mcd->num_plls,
+						clk_data);
+	}
 free_data:
 	mtk_free_clk_data(clk_data);
 free_base:
@@ -695,8 +718,18 @@ static void __mtk_clk_simple_remove(struct platform_device *pdev,
 	if (mcd->fixed_clks)
 		mtk_clk_unregister_fixed_clks(mcd->fixed_clks,
 					      mcd->num_fixed_clks, clk_data);
-	if (mcd->plls)
-		mtk_clk_unregister_plls(mcd->plls, mcd->num_plls, clk_data);
+	if (mcd->plls) {
+#if IS_ENABLED(CONFIG_COMMON_CLK_MEDIATEK_FHCTL)
+		if (mcd->fhctl_node)
+			mtk_clk_unregister_pllfhs(mcd->plls, mcd->num_plls,
+						  mcd->pllfhs, mcd->num_pllfhs,
+						  clk_data);
+		else
+#endif
+			mtk_clk_unregister_plls(mcd->plls, mcd->num_plls,
+						clk_data);
+	}
+
 	mtk_free_clk_data(clk_data);
 }
 
diff --git a/drivers/clk/mediatek/clk-mtk.h b/drivers/clk/mediatek/clk-mtk.h
index 11939e3e0b38..4e959ec68da0 100644
--- a/drivers/clk/mediatek/clk-mtk.h
+++ b/drivers/clk/mediatek/clk-mtk.h
@@ -15,6 +15,8 @@
 
 #include "reset.h"
 
+#include "clk-fhctl.h"
+
 #define MAX_MUX_GATE_BIT	31
 #define INVALID_MUX_GATE_BIT	(MAX_MUX_GATE_BIT + 1)
 
@@ -266,6 +268,10 @@ struct mtk_clk_desc {
 
 	bool need_runtime_pm;
 	bool populate_children;
+
+	const u8 *fhctl_node;
+	struct mtk_pllfh_data *pllfhs;
+	size_t num_pllfhs;
 };
 
 int mtk_clk_pdev_probe(struct platform_device *pdev);
-- 
2.56.0

