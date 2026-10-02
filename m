Received: from mail-wr2-f34.google.com (mail-wr2-f34.google.com [74.125.225.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93D53429037
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 07:21:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790925702; cv=none; b=hDwmgQEpJV4bXIuu/F8HNv6eCrqDj4m64HT9xnO0W/5fOPI/woR6+URPw1KLfJzrymx0VmBqoueVedZA2VFf0CXm5ndWT7KSHUdIy8pqzUgqAGlkBuogLuimZ4earsVlPs2cuJzmtCJQ3gORIqXJy9ivAIFSJ5cwbOuV0IrjGRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790925702; c=relaxed/simple;
	bh=e1B44NfTCH0F4oqJpUfmhyo7mQkyATlaZ6kmm/oiW08=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tBUhzme7bcn+nlE72Ic/T8pYPuHN2hFg0AEmpnVC2h5/wzNXEMmgg4FkK58sX4QCCPRbQiS9W9lM21S3CTvs5TV7qcCqVK/fdKh84WNEUguXwbqOKO+4GrVxei/ys+25dup461BOf9c+d5nCPRVTAzvYns5vKhUWSJmuH0G2QMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oxBhsTh9; arc=none smtp.client-ip=74.125.225.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oxBhsTh9"
Received: by mail-wr2-f34.google.com with SMTP id ffacd0b85a97d-48b01c4f4daso2033950f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 00:21:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790925699; x=1791530499; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wUsDqDrhpmZMvn+QumvMUSjkcnQssbcKtOFdPQ7A4VQ=;
        b=oxBhsTh9eiOA3huWK22aXtbDEP3qbGXmIqBRC4DWY5ifTjLghunuGOWjZ+ibTAT4+E
         Jh/hGZTCpdlfvbzfpyROCL17iETCdcrWJmc0UYaArdidd75BfzTNJx781eCiaCZUluF7
         jIUEFbQqm0/QIsOCvwACyeKMtBPjEN+Ek78OzOe4fkCUtfobu8j+O/Fql2vBzfj+yf+J
         6QZPdcWBcFhGg8ZL0UKMnrWqy7CxLeohVobMSy4AL+C/1MWrhyJxK6Ve4fvAJjI+EXvI
         duahPfv+ud7wQ74xc+6La3EbEjrYuIbkPQZp5ZB3ZX6ZkCoLlqOqFKQB3tgWXxNnhiJP
         wjqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790925699; x=1791530499;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wUsDqDrhpmZMvn+QumvMUSjkcnQssbcKtOFdPQ7A4VQ=;
        b=BBdtHqC4gTRk/k+7B667F11Wp+89LwCbk6lFW73jSWo/36rZqMBc7z1hfHYvNrlwCO
         0j4DR9TMqS7wRpp1f4uJorfGZQzW0+XKAvt8Zfw5BWYaZxyx4GFt3EXWbwoox2f9kY0+
         AxmJwNs/PrIRs0Kao3o/49gUzwaJtXjvUM2EQjUnbgEoS1kCxGE10bX4WtQjWk71/rY/
         +qPa9B+z+S9kvNb4NoloEJMbc/JZY4f4bBbOZxCzyMpRgXafx5eGXCeO8bX7dpMHHma5
         X1rak5+RmZ6Rp2n58L5SKvkCv34h2EeZNmUby25lYgFvdC5sGfMxq+llSIByvsbt0Prb
         JReg==
X-Forwarded-Encrypted: i=1; AKwUvBxQ3RH0w/kVqM+zW1nmRLv18lrseIrUGrVgtWoYRPZMVa8LYOf41BggUpbRqgiiALPUCDfWudTgCtn+tC8=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ+SfBq/Pjip9L710y4iqFmjdJBpY1dc4ixPejKi8AyjgbM2Alz
	wHLzFJmZZ2Phq4sOqNCzxYpp8id3RDdWO/+dAZBhVl6gd/gwajn/TNqN
X-Gm-Gg: AYBFou2qv6XXZWU0uHomaP+yWHot6o/zZNvlgP/1pInRt/4JgQzDqpxbl/OLU7u0WXe
	sAds6mfl+p0T0RxJPsq9criVvLltaoHq7511GEKpNSeP5f5wKJ6RkIiOBWxI1aHjW3cy06oGYNw
	76FKJXTth8qCZZzQkd/1b5jUm5i7UtGZEdIIaNBUokmNdtZGG5bU2277vK88W52q097lR4iHFnp
	T8kGUpDLI9A7obBjfS3G/jq8dhCZs0nELbaAOTuwfc9DIlBjI9CqydhB+4UEiKkK2vS64x7gW4z
	gU/r8pNnv220CfhCWiSX9On8o36PJuAQKp7xFXYxGrOzrAciJjiC29Gm2vANwjG7dqVs7wOzug6
	NuSZZPJAg82GW1hOK4FPnjiS1eDaKfnv+KyDoukt+JtRMXYXDSm/8prQAMjF2bZEBAo/9RBPCXd
	KAFLGbjHLfulT5qqWLn/xdji28Qtp2GPny7zj24l5g3m+yUxOfPr7FRhDHdDacmjOq+JE=
X-Received: by 2002:a05:6000:4717:b0:487:7fd:730 with SMTP id ffacd0b85a97d-48b1271cda5mr3160214f8f.13.1790925698787;
        Fri, 02 Oct 2026 00:21:38 -0700 (PDT)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b38104e07sm3564479f8f.31.2026.10.02.00.21.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 00:21:38 -0700 (PDT)
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
Subject: [PATCH 3/3] clocksource/drivers/timer-mediatek: Request and enable the bus clock
Date: Fri,  2 Oct 2026 09:19:28 +0200
Message-ID: <20261002072115.169250-4-l.scorcia@gmail.com>
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

MediaTek APXGPT general purpose timers may optionally depend on a bus
clock. If this clock is not enabled the timers don't actually run. Boot
loaders usually turn it on, but later the kernel turns it off since it's
never requested by any driver.

Some platforms (like mt6735) declare it as a critical clock in their
clock definitions to keep it running, but at least on mt8167 it's not
actually required for a successful boot.

If a bus clock is declared in the device tree, make sure it is enabled
by driver probe and associated to the device.

Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
---
 drivers/clocksource/timer-mediatek.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/clocksource/timer-mediatek.c b/drivers/clocksource/timer-mediatek.c
index a9e7ff6908a3..842d6ee4259e 100644
--- a/drivers/clocksource/timer-mediatek.c
+++ b/drivers/clocksource/timer-mediatek.c
@@ -9,6 +9,7 @@
 
 #define pr_fmt(fmt)	KBUILD_MODNAME ": " fmt
 
+#include <linux/clk.h>
 #include <linux/clockchips.h>
 #include <linux/clocksource.h>
 #include <linux/interrupt.h>
@@ -283,8 +284,9 @@ static struct timer_of to = {
 	},
 };
 
-static int mtk_syst_init(struct device_node *node)
+static int mtk_syst_init(struct platform_device *pdev)
 {
+	struct device_node *node = pdev->dev.of_node;
 	int ret;
 
 	to.clkevt.features = CLOCK_EVT_FEAT_DYNIRQ | CLOCK_EVT_FEAT_ONESHOT;
@@ -305,10 +307,14 @@ static int mtk_syst_init(struct device_node *node)
 	return 0;
 }
 
-static int __init mtk_gpt_init(struct device_node *node)
+static int mtk_gpt_init(struct platform_device *pdev)
 {
+	struct device_node *node = pdev->dev.of_node;
+	struct clk *clk_bus;
 	int ret;
 
+	clk_bus = devm_clk_get_optional_enabled(&pdev->dev, "bus");
+
 	to.clkevt.features = CLOCK_EVT_FEAT_PERIODIC | CLOCK_EVT_FEAT_ONESHOT;
 	to.clkevt.set_state_shutdown = mtk_gpt_clkevt_shutdown;
 	to.clkevt.set_state_periodic = mtk_gpt_clkevt_set_periodic;
@@ -344,11 +350,10 @@ static int __init mtk_gpt_init(struct device_node *node)
 
 static int mtk_timer_probe(struct platform_device *pdev)
 {
-	int (*timer_init)(struct device_node *node);
-	struct device_node *np = pdev->dev.of_node;
+	int (*timer_init)(struct platform_device *pdev);
 
 	timer_init = of_device_get_match_data(&pdev->dev);
-	return timer_init(np);
+	return timer_init(pdev);
 }
 
 static const struct of_device_id mtk_timer_match_table[] = {
-- 
2.43.0

