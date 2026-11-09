Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794226100;
	b=gRvge5ngNQThh2+38VXqB0ot21uGAvKYboPectailUJbJyD6SmdMilp6tkqMAwYbAGyw
	 5N3t1BkEDbKdQv4tG9ZeMCJdO0d0YeGzLgrqwVCa3kt8Wo2hq8vXD/x3ro1zliG94R9/S
	 RkDMpnO82kOPHOsHIGbMIHIx3RQmx9Wqp74BSjp7P1AEdJmgepOukpnVtWWxR5RWf8kAp
	 OELf9gM6lVFALWbOXrhgm2HhlJAUF3YzXztCo3FcrpUYVJESOnesSMyuTMELvRlLB2Nrs
	 VAW8MLGoGKpCXK08sM9rNPgsgikalpLHRmcQYIJVHZKtu+jPmp0dpyzxzBbBfz5rQ7g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794226100;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=q8x7zVGGkfSdWA+EkndmqEqSgl70Bo/p7FSSNehigJg=;
	b=4ZGH/l8w1p81UjbDuscRQ4itO8u9ObtLwJhfk4fwBCZ10nvtu4aEavrzuV/sAd9b+Glx
	 3KJzMfMVf/jh/ryiRlJk4mFpO30Fsej4nJIyVoaJtSH5wEDGC+xZC6ykQTBI61mBXmnV2
	 u05m34p4O6UXAy1bKuC86o1M4HDvavzDAnTvQFLU4qNnMxp56uWnKkTIGuRjGWQZpAX7v
	 65fsZ4tBv9HrgHEtTPHKS6FpiNq7DjrHZmPPXTPGLgELdetKy456Y4uABLkDy3FsPPkDz
	 xkH/H+WdG+T7MgwSRQ8AzVn12QqmfmWmGnIsJSTn/n90kNW0LEDIdwdS2hQi08aX1eg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=EnupwC5s;
	arc=none smtp.remote-ip=74.125.82.44
Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B1F5606A321
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 12:08:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5B1F5606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=EnupwC5s
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-1b3a05f8b5bso1195337c88.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 04:08:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794226098; x=1794830898; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=q8x7zVGGkfSdWA+EkndmqEqSgl70Bo/p7FSSNehigJg=;
        b=EnupwC5swvuo5sJrJActcmI7J62yE6t8sZNBuZNDrQE95d1pf4R6nr1qfg9EZEp4MZ
         qR3oRM6oXwcAS6wwsUjeRFWYFEBb3JR5xItxfhWsCYa5rzl66Pv7D5joo4oStYpQ9Zyf
         /KB7J996nIjHZFCreHLTLFQ81qdRuKa5uNtcQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794226098; x=1794830898;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=q8x7zVGGkfSdWA+EkndmqEqSgl70Bo/p7FSSNehigJg=;
        b=rCRMynlLds8ezMSmsTg+HAgOXURz4MBObJ52/s/ndz0eivSGDQA1e2ku7YIP8VabUR
         rZf+fNBo+MKbnN9UFt9Eg8A4GQJ785wI/8eVNNIJ+ywz4hn0NFFGiLwtMwNxVlau3mZd
         w/LJga8L7/zI/X8jComhb/hqfLFquS4o/CyWuqEPizaUyCGJUwt3elhLQtE4ZTWn/pIq
         rpuhfH8N5NZtDMw17vWCcPg2+ADU++Q4PUTO84c5Thdy2YHDRplkEGwakzDYlzMrubA7
         xzUTnnpC4MnMw4nDsQ0+am9dfdbLCw7Ey0wyKgEut9Iq6rpbqzkvGaN/xXe/lwY8UWAB
         fvSA==
X-Forwarded-Encrypted: i=1; AL+hErH2s3IEPUmqtU64Aq5sJvfc9GoiGOrxjJ6mrIFwSHK62opQ5eepcprHIMxvxCqbzAGigP2ypRDMLOwEvJo=@vger.kernel.org
X-Gm-Message-State: APuU4Z/VBZwW4a4EDYbJd2gPCP057K0HP31FBI0kDRiJtXJtDhwtVP04
	Rf9Gn/zaJsVLSP2KHM6ywK54COx2j9xzli8GCDwqgyTUQ6cB/v71YpJZCLHCcIlEtg==
X-Gm-Gg: AYBFou1+c7WeFHHT1ZWVSUqGYcpyTvni1S9eKNQYTK9a/ccT5Sf9hFdY3/e3SP/PWCm
	4jHuxoCzmqsIabPFoLhTKqopUwXZsnUpY2VCvQRdu1coSu596Li2bjGVqYZFWiMb0yULwbGH8Zd
	OAM4j2ra6bPCJeWRUVanMELqxyZi4feuIYKCUEa4+wEo8zzBDAJFyk8Kwqt9q+QKgVrH/7wQLgS
	r6SP4jG1maCNNjmslUrtDuBPc21PceTSHXyW0qct4jzcShLVF8tAme3sqqtUFpUsF+UmnlkYrbZ
	+Qs0JaQgpR7Sys35cluB4zHhNxVNjtzxHjz4v6tBqBnE0Bbxf1WHUP7LaYmx/Jlkx0DU6gj7A/X
	7O9N6O66Z6sYRZm1idz369L/wBE349fu2JYMEYZOhAUhnpJWIa/4q7QatOJ34w7BUByoYBVMJpu
	OmMWTq6CR4Eyl+r/fpcWCQ0BDNQ5LFyJuC/CnqzciOgenHUGGjvaAmwVxJqUEzCyK1mudfw8+7w
	in5tGHiNRX8Qxez7jayJgwaVfjw2HnAwtORxE/jTebLHRoN9WVLU4L8JuXEqYg/zgb+jvXlNMAo
	DR2jlA0y9LwoRq5Pqbf5XYP/hjrr1xDzO1V++rpePMmH2P29yPTNT/rRA6wQ3YcaRf+mY/uiePZ
	PUtSuMA==
X-Received: by 2002:a05:701b:270c:b0:14a:8cff:fbb8 with SMTP id a92af1059eb24-1b39fea8a78mr6100575c88.28.1794226098355;
        Mon, 09 Nov 2026 04:08:18 -0800 (PST)
Received: from localhost ([2a00:79e0:203d:7:24d0:a2cf:66c5:ef86])
        by smtp.gmail.com with UTF8SMTPSA id a92af1059eb24-1b3755e936bsm16025308c88.6.2026.11.09.04.08.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 04:08:17 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Daniel Lezcano <daniel.lezcano@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	Ryan Brue <ryanbrue.dev@gmail.com>,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] clocksource/drivers/timer-mediatek: Don't override the arch timer sched_clock
Date: Mon,  9 Nov 2026 20:07:56 +0800
Message-ID: <20261109120757.847266-1-wenst@chromium.org>
X-Mailer: git-send-email 2.56.0.455.g6c5a503b38-goog
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since the driver was converted to a platform driver, the GPT probes
late, after the architected timer has registered itself as sched_clock.
sched_clock_register() only refuses counters with a lower rate, and
sched_clock has no notion of priority, so the 32-bit GPT counter, which
runs at the same 13 MHz as the arch timer on MT8173, replaces the 56-bit
arch timer counter as sched_clock:

  sched_clock: 56 bits at 13MHz, resolution 76ns, wraps every 4398046511101ns
  ...
  sched_clock: 32 bits at 13MHz, resolution 76ns, wraps every 165191050201ns

Before the conversion, both drivers used TIMER_OF_DECLARE and
timer-mediatek.o is linked before arm_arch_timer.o, so the arch timer
registered last and won.

The narrower GPT counter wraps more often and is slower to read over
MMIO than the arch timer system register. Doing the switch at runtime
also runs enable_sched_clock_irqtime(), which may sleep, with interrupts
disabled, causing a splat.

Other drivers worked around the same problem in the same way, see

  commit 37b8b003c483 ("clocksource/drivers/sun4i-timer: Only register a sched_clock on sun4i and sun5i")
  commit 10720e120e2b ("clocksource/drivers/imx-tpm: Exclude sched clock for ARM64")

Only register the GPT as sched_clock if the ARM architected timer is not
present. This currently includes MT6572, MT6580, MT6582, and MT6592, as
seen in their respective .dtsi files. This follows the example of
sun4i-timer.

The analysis of the boot log and git history, and drafting of this
change, were done with an AI agent. The agent originally proposed using
arch_timer_get_rate(), which was replaced by the author.

Manually tested on a MT8173 Hana (Telesu).

Fixes: 7a097aba7255 ("clocksource/drivers/timer-mediatek: Convert to OF probing")
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---

For the ARMv7 SoCs such as the MT2701, MT8127, and MT8135, the firmware
has to correctly set the arch timer frequency, as their device trees do
not have the clock-frequency property.

OTOH we could let sched_clock_register() reject replacing the current
counter if the new one runs at the same rate. But that would be a
separate discussion: if more drivers are converted to standard platform
drivers, then the probe order is no longer easily known like before
by the link order.

The splat is a separate issue that I already reported [1].

[1] https://lore.kernel.org/all/20261109095036.GA722431@google.com/
---
 drivers/clocksource/timer-mediatek.c | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/drivers/clocksource/timer-mediatek.c b/drivers/clocksource/timer-mediatek.c
index 1b2cbcc2795a..ef67cc783635 100644
--- a/drivers/clocksource/timer-mediatek.c
+++ b/drivers/clocksource/timer-mediatek.c
@@ -15,6 +15,7 @@
 #include <linux/interrupt.h>
 #include <linux/irqreturn.h>
 #include <linux/module.h>
+#include <linux/of.h>
 #include <linux/of_device.h>
 #include <linux/platform_device.h>
 #include <linux/sched_clock.h>
@@ -334,8 +335,20 @@ static int mtk_gpt_init(struct platform_device *pdev)
 	clocksource_mmio_init(timer_of_base(&to) + GPT_CNT_REG(TIMER_CLK_SRC),
 			      node->name, timer_of_rate(&to), 300, 32,
 			      clocksource_mmio_readl_up);
-	gpt_sched_reg = timer_of_base(&to) + GPT_CNT_REG(TIMER_CLK_SRC);
-	sched_clock_register(mtk_gpt_read_sched_clock, 32, timer_of_rate(&to));
+
+	/*
+	 * sched_clock has no priorities; a counter with the same rate
+	 * replaces the current one. Only these SoCs lack the ARM architected
+	 * timer, which is otherwise the better sched_clock.
+	 */
+	if (of_machine_is_compatible("mediatek,mt6572") ||
+	    of_machine_is_compatible("mediatek,mt6580") ||
+	    of_machine_is_compatible("mediatek,mt6582") ||
+	    of_machine_is_compatible("mediatek,mt6592")) {
+		gpt_sched_reg = timer_of_base(&to) + GPT_CNT_REG(TIMER_CLK_SRC);
+		sched_clock_register(mtk_gpt_read_sched_clock, 32,
+				     timer_of_rate(&to));
+	}
 
 	/* Configure clock event */
 	mtk_gpt_setup(&to, TIMER_CLK_EVT, GPT_CTRL_OP_REPEAT);
-- 
2.56.0.455.g6c5a503b38-goog

