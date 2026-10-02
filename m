Received: from mail-wr2-f34.google.com (mail-wr2-f34.google.com [74.125.225.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80F7C3E2777
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 07:21:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790925701; cv=none; b=ORDk38GuSQceiv9JTo/zi5UGvbV5oljySp8Aq55oN3VHMt+fMaKBN2c6EnDJQ48W2sEjUe5TvIv04wJWgFge/avzmkJJj52jgHaMcMIpNYAAWEQm0d5jY3Hbzv/LPco4VS7VrEl1rtTlahpM/owJd+aatY0Km09HCfBkccNGiGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790925701; c=relaxed/simple;
	bh=rm7uzPDkcLKqr8w3udJ6WGIB9nMIOt1Z58NAzybVYsQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=p3jI8MaSjVE7vmpD2vmM8i7XNcwLWlh9v0KEYaeNUfU/GKw5gEa8QIgtOZTBibJnezZhPR66mPMgglcbyZnfi6BF5RFeXPp9+UwEB2NetjKWdG8kmGTmYYNeXuGuL0Ep6IBdBhgtrtwyGgN8OMXIOOk2ClisW7pNeK+bsBrm2bI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=II98zR8n; arc=none smtp.client-ip=74.125.225.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="II98zR8n"
Received: by mail-wr2-f34.google.com with SMTP id ffacd0b85a97d-48b00a0ac65so1578242f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 00:21:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790925697; x=1791530497; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BiRT4iJ8ATEOAN7haj6uPz4qVcb8QlqeLbjNdcN2pu4=;
        b=II98zR8nWrVwx5b3JWGLpLkU5uhl1QVMfZPa3ToIFaBhEGqXfGp0gOWvO7+bSR7jDS
         OgWkctC/MmvKzRAjpAmtuY6rDmw6pA+Vf9jkMczaWnPMKarUBgHv5cYstIlvVLyhwibk
         rpyQBiCdgu+zpusD20OUPe+hHV5CNnak6jsZR4Z0UqnsRpZCH9IQ8x6a4f79GuIaABCN
         wicuEqnxBbXWF2aGo70Y193hm7cfzQC50OE+zd6pvb0gUhjzA0yMaWnsCXmhUkh8gMiL
         Mu6BwuavEy4JNoS6P+/hY50A4Z42v+mdRmT2PmytMZ4FXk66zBN3UPjlVxMQBz9Sit8w
         nJLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790925697; x=1791530497;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BiRT4iJ8ATEOAN7haj6uPz4qVcb8QlqeLbjNdcN2pu4=;
        b=j96ZQbb1gF6GsOI5R5mA25VvVK+vF52yhGi/bNpiCKiAd+9fyzs8IxEIAb4dPWBtsr
         yltlO0wmSy+gDab55i80ds1vGktN4Ok5dsucQculu/s947YwRYgs9amXTerXeL/zpTOn
         plfJjxRGctxRguxls//L6fkRlVHWT7ZiNpIEF7EhI48mOdY0bWRtrX/L9lhu3g4B+pmJ
         CrpjfIYDUwybrT6LtU35wSEcYjoo1Lv8qrVAEDMj5QIQbIv8L7UofrJdkWNRLwwx/odv
         aX8ko1YmnMEqAk5QmkDkezacyzpnITmfXDCGQrtgrfu3HZsgLHiHhUFfkgP+50fQ40EZ
         o0lQ==
X-Forwarded-Encrypted: i=1; AKwUvBx6aS+X163/pG78CCWekbi3ee37YD+01O77V+qSIeb5+dIe4Rigx0tJuTDw/WlQPt5infELWIfL9wl/YYA=@vger.kernel.org
X-Gm-Message-State: AFq9FYKL4WdXfhFHuDOG5izZi/8xrNOKTB9wnRZTI30APSb3KqO9JhJl
	JAxtWOwI010ay6HrtnMj6q+E6vmeyoNUYSR2CcNVuv6noQm/m9ZGnH4T
X-Gm-Gg: AYBFou0R9TCkKw7g+0zvAtzZUtAWZLkoTrmhAW/edHpWB4Oakl5M8vSll/qgu9ir62O
	Za6T+T8icnBV2m4GHJZhlzTJrtJPlZYU1aDI6S/UdmBgh334zQLUx7sj9uMq0MMMcwpGi1HUslo
	IwfDepczxfWiNk8hvRihRLHRt2COU0bFkDUQ3GJ6kS+IUVoNfLkTr9iZqr1F9s83KD1GIR3Hxkp
	jzwN/hM4ubEOIo9DCYZSKuCS21Sm0gl/HTvi6y906BJe4Lg4VAmoeoK7yDOVulucE0ZfomSIiCw
	wc0OmNQ2+jQOfDtg1m5qhH4mtAg2P7qgbNCtVFxxmsVwkd7nIT6WFl4+stY30eJf7FzM12b4EQN
	2kIfjCdpXzMPh+TSXWigNdNhuyLhRo3I6e1xZVR6nnTyeD2UqDQM603gmuLZuzHhRYm62Xl1z2m
	c5F6GcqOTM8yX5Nnwrm5Em6JhN+/mWdBm7pgk4ZdmqUZjRrTp33B2h9O5tOFCa6QA2kw==
X-Received: by 2002:a05:6000:981:b0:48b:9f7:9359 with SMTP id ffacd0b85a97d-48b12739796mr3125446f8f.16.1790925697499;
        Fri, 02 Oct 2026 00:21:37 -0700 (PDT)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b38104e07sm3564479f8f.31.2026.10.02.00.21.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 00:21:37 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Stanley Chu <stanley.chu@mediatek.com>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 2/3] clocksource/drivers/timer-mediatek: Convert to OF probing
Date: Fri,  2 Oct 2026 09:19:27 +0200
Message-ID: <20261002072115.169250-3-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261002072115.169250-1-l.scorcia@gmail.com>
References: <20261002072115.169250-1-l.scorcia@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

MediaTek APXGPT general purpose timer driver is registered via
TIMER_OF_DECLARE to be loaded early in the boot process. It depends on
a reference 13 MHz clock that is assigned via the clocks property of
its DT node.
On platforms like mt8516/mt8167 this clock is provided by a driver that
is loaded using OF probing and becomes available only later during boot.
This leads to a silent EDEFER error during timer init, which is not
recovered by TIMER_OF_DECLARE and GPT clocks are not registered at all.

Since those clocks are not critical for boot, convert the timer-mediatek
to OF probing and drop the TIMER_OF_DECLARE instructions.

Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
---
 drivers/clocksource/timer-mediatek.c | 36 ++++++++++++++++++++++++----
 1 file changed, 31 insertions(+), 5 deletions(-)

diff --git a/drivers/clocksource/timer-mediatek.c b/drivers/clocksource/timer-mediatek.c
index e20075b09fab..a9e7ff6908a3 100644
--- a/drivers/clocksource/timer-mediatek.c
+++ b/drivers/clocksource/timer-mediatek.c
@@ -13,6 +13,9 @@
 #include <linux/clocksource.h>
 #include <linux/interrupt.h>
 #include <linux/irqreturn.h>
+#include <linux/module.h>
+#include <linux/of_device.h>
+#include <linux/platform_device.h>
 #include <linux/sched_clock.h>
 #include <linux/slab.h>
 #include "timer-of.h"
@@ -215,8 +218,7 @@ static irqreturn_t mtk_gpt_interrupt(int irq, void *dev_id)
 	return IRQ_HANDLED;
 }
 
-static void
-__init mtk_gpt_setup(struct timer_of *to, u8 timer, u8 option)
+static void mtk_gpt_setup(struct timer_of *to, u8 timer, u8 option)
 {
 	writel(GPT_CTRL_CLEAR | GPT_CTRL_DISABLE,
 	       timer_of_base(to) + GPT_CTRL_REG(timer));
@@ -281,7 +283,7 @@ static struct timer_of to = {
 	},
 };
 
-static int __init mtk_syst_init(struct device_node *node)
+static int mtk_syst_init(struct device_node *node)
 {
 	int ret;
 
@@ -339,5 +341,29 @@ static int __init mtk_gpt_init(struct device_node *node)
 
 	return 0;
 }
-TIMER_OF_DECLARE(mtk_mt6577, "mediatek,mt6577-timer", mtk_gpt_init);
-TIMER_OF_DECLARE(mtk_mt6765, "mediatek,mt6765-timer", mtk_syst_init);
+
+static int mtk_timer_probe(struct platform_device *pdev)
+{
+	int (*timer_init)(struct device_node *node);
+	struct device_node *np = pdev->dev.of_node;
+
+	timer_init = of_device_get_match_data(&pdev->dev);
+	return timer_init(np);
+}
+
+static const struct of_device_id mtk_timer_match_table[] = {
+	{ .compatible = "mediatek,mt6577-timer", .data = mtk_gpt_init },
+	{ .compatible = "mediatek,mt6765-timer", .data = mtk_syst_init },
+	{ /* sentinel */ }
+};
+
+static struct platform_driver mtk_timer_driver = {
+	.probe = mtk_timer_probe,
+	.driver = {
+		.name = "mediatek-timer",
+		.of_match_table = mtk_timer_match_table,
+	},
+};
+module_platform_driver(mtk_timer_driver);
+
+MODULE_DESCRIPTION("MediaTek Timer driver");
-- 
2.43.0

