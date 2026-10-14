Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C9B54A688F
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 20:20:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792009247; cv=none; b=OBr+jH8BlkKWgMspgZYoybyxOPpmeGS5b1H5kdR6hiN2YqcjwPlvIYp+ezBWMGTVxW2VT+Da000SkL6WBLwEyzeJkxzjX28cfctnSZJ7AzADc0fZZistG4D1j42LniKA1Wdp5e814X79sLXEDbu1K6BZG0M69c9P27fvbIK0BN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792009247; c=relaxed/simple;
	bh=R/1VOonW9CxrbCHK2l5vNlMRiZnLqPSoZAL/jNq3zI0=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=hRKVownkkVzHInjRuhkf8M1bETsvVNOBJiFCR02QqrsKUS4IBgvpu7xgpXzV+Js2A7ks8i/b6IizAe4XIy59ZW5eOqQC1pgBD+ZXf7JvpBj/kcJ28Wn+zVgV3cunUof9blF9UHU6rUQQq2rdvcan7tvh5QJ/UQGWWqFLS4mOzHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Z8HpU6t/; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=8CKp6nFS; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Z8HpU6t/";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="8CKp6nFS"
Date: Wed, 14 Oct 2026 20:20:43 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1792009244;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qAm6NJHbv1XnYwEoe6LmnflleYnSn2d4hX/i4UpPne0=;
	b=Z8HpU6t/e39pIHnDWPAYW2Qd55ZU/DCL8lgYNn8w81C5MJGzoHP3lCTRX6IaOpPJMxucFN
	AShcoei+s+fceTu/mSpSUvk300frzImcBsxdkeLAphH3Mi/e1Z8PMxLlcI5XJ9F8fof8/p
	iCUm/MBsXTdIGLvfRcCtxA8vjIiJD+hcTmnTVg/95lsDABHryIS9cqP7QuRR4gE6BUmeJW
	y1Li/sRiqMeFUlWkFGXy+bfzMus/LYfWtYyPvp0HpSNjXQIp+CAh+K/kDCyyoITh1/NDFh
	GL1pfpXUZxnyx7qtuAE7zpJwdbe04bA6hIT8lY9eX2Tb1ZUVR5sh5zszQ1HKAA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1792009244;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qAm6NJHbv1XnYwEoe6LmnflleYnSn2d4hX/i4UpPne0=;
	b=8CKp6nFSfYO6x1MKmB2w4h+lQ2VBgrYzf/zF18ofvU8cgsEHuAxc4g5aNG0kCKLnLfysq3
	k9COgn/BaSc+I5Ag==
From: "clocksource-bot for Luca Leonardo Scorcia" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-kernel@vger.kernel.org
Subject: [clocksource: timers/drivers/next]
 clocksource/drivers/timer-mediatek: Convert to OF probing
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
 Daniel Lezcano <daniel.lezcano@kernel.org>, daniel.lezcano@oss.qualcomm.com
In-Reply-To: <20261002072115.169250-3-l.scorcia@gmail.com>
References: <20261002072115.169250-3-l.scorcia@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <179200924309.2666337.4672948620593798518.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the timers/drivers/next branch of c=
locksource:

Commit-ID:     7a097aba725501c399b5e93d0199aa3a2f6e9c88
Gitweb:        https://git.kernel.org/pub/scm/linux/kernel/git/daniel.lezcano=
/linux.git//7a097aba725501c399b5e93d0199aa3a2f6e9c88
Author:        Luca Leonardo Scorcia <l.scorcia@gmail.com>
AuthorDate:    Fri, 02 Oct 2026 09:19:27 +02:00
Committer:     Daniel Lezcano <daniel.lezcano@kernel.org>
CommitterDate: Tue, 13 Oct 2026 13:17:20 +02:00

clocksource/drivers/timer-mediatek: Convert to OF probing

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
Signed-off-by: Daniel Lezcano <daniel.lezcano@kernel.org>
Link: https://patch.msgid.link/20261002072115.169250-3-l.scorcia@gmail.com
---
 drivers/clocksource/timer-mediatek.c | 36 +++++++++++++++++++++++----
 1 file changed, 31 insertions(+), 5 deletions(-)

diff --git a/drivers/clocksource/timer-mediatek.c b/drivers/clocksource/timer=
-mediatek.c
index e20075b..a9e7ff6 100644
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
@@ -215,8 +218,7 @@ static irqreturn_t mtk_gpt_interrupt(int irq, void *dev_i=
d)
 	return IRQ_HANDLED;
 }
=20
-static void
-__init mtk_gpt_setup(struct timer_of *to, u8 timer, u8 option)
+static void mtk_gpt_setup(struct timer_of *to, u8 timer, u8 option)
 {
 	writel(GPT_CTRL_CLEAR | GPT_CTRL_DISABLE,
 	       timer_of_base(to) + GPT_CTRL_REG(timer));
@@ -281,7 +283,7 @@ static struct timer_of to =3D {
 	},
 };
=20
-static int __init mtk_syst_init(struct device_node *node)
+static int mtk_syst_init(struct device_node *node)
 {
 	int ret;
=20
@@ -339,5 +341,29 @@ static int __init mtk_gpt_init(struct device_node *node)
=20
 	return 0;
 }
-TIMER_OF_DECLARE(mtk_mt6577, "mediatek,mt6577-timer", mtk_gpt_init);
-TIMER_OF_DECLARE(mtk_mt6765, "mediatek,mt6765-timer", mtk_syst_init);
+
+static int mtk_timer_probe(struct platform_device *pdev)
+{
+	int (*timer_init)(struct device_node *node);
+	struct device_node *np =3D pdev->dev.of_node;
+
+	timer_init =3D of_device_get_match_data(&pdev->dev);
+	return timer_init(np);
+}
+
+static const struct of_device_id mtk_timer_match_table[] =3D {
+	{ .compatible =3D "mediatek,mt6577-timer", .data =3D mtk_gpt_init },
+	{ .compatible =3D "mediatek,mt6765-timer", .data =3D mtk_syst_init },
+	{ /* sentinel */ }
+};
+
+static struct platform_driver mtk_timer_driver =3D {
+	.probe =3D mtk_timer_probe,
+	.driver =3D {
+		.name =3D "mediatek-timer",
+		.of_match_table =3D mtk_timer_match_table,
+	},
+};
+module_platform_driver(mtk_timer_driver);
+
+MODULE_DESCRIPTION("MediaTek Timer driver");
