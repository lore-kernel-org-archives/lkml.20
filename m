Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAFF14A5EBC
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 20:20:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792009247; cv=none; b=nHtaGbJpVbCr3xDlsh2S82hBlFbxFnnFnJyxHQRaZZw7wp1bSPmGROx0Vlx+gFmBGfAmmft/B6LkRVGAWN3RvxDbZlveTCgCglkCRJKtGrzaTFyuDmn9NX5JMF8szfRXrj3eeeP3vYvL6EBz/DgiNcBS0b/3AxLKuyAKhcm+Axo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792009247; c=relaxed/simple;
	bh=i5dzCp92HWfpIlS+B+9W9DpfHNCFwTMdICLkNc2zvcM=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=pxMveSVsPXqKTtH+Iuyhi1gMGH6NzkK349tnmWYVXqZ+JVcZM+0ZO9JFJtnUBTkoZWGDc/7iPVffpkhHvoStG2gzIg4M0LHrkaAYgD/0a9z5DW/31ZKCy0/Wio3Z8P6QzTjBaIVQQdEKnHzKqzP5rHAVR0mWmmBeo42cUqoyNAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Hbx+Z50M; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=YMrleEyK; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Hbx+Z50M";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="YMrleEyK"
Date: Wed, 14 Oct 2026 20:20:41 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1792009243;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5cU0+Gb07TWzY1laXBd34Pu3ZldtnsZbc4c6LENwcas=;
	b=Hbx+Z50MzIXtXEDXjiaJ+Q4izWlmL90kUxRaIy7iPwHd0lBQAgH7D/XlIktdxa+HU775sQ
	ZlpBnLOkydfAdvHPm9vYWPxlKJMZo7BpfjglSO0Jf659hCuQA30ks5UVjHYnkDBAY+u7GY
	57PC/S9Dqf/n26RdnL+y5bUNs1WMiryL2JzU3V3v7cCJzQA5uO2giZ6nIXTnoL53dEp1Vq
	zEZtobT8pRxbfahNus+qhIvs3uysgDUYYK9XZBXzl1rAFUSJXre3powAYkfjJ+04Jz39Y1
	eUhnV0Y8ogyK4aP1s0fUYpnadFOViOn0PuBMm/uSCorbslTEapz5NbOPGuO51Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1792009243;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5cU0+Gb07TWzY1laXBd34Pu3ZldtnsZbc4c6LENwcas=;
	b=YMrleEyKb2FGUcfzQu99GVUwGsaIuc4vxvaRBEb5Fs44MQEhWAsywn/kvkDyMFqN7ioRk5
	5MHUXFtcpcwH+2Bg==
From: "clocksource-bot for Luca Leonardo Scorcia" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-kernel@vger.kernel.org
Subject: [clocksource: timers/drivers/next]
 clocksource/drivers/timer-mediatek: Request and enable the bus clock
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
 Daniel Lezcano <daniel.lezcano@kernel.org>, daniel.lezcano@oss.qualcomm.com
In-Reply-To: <20261002072115.169250-4-l.scorcia@gmail.com>
References: <20261002072115.169250-4-l.scorcia@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <179200924156.2666337.1917810470281280243.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the timers/drivers/next branch of c=
locksource:

Commit-ID:     e234d40823808c1727e88a40d8c9ee960de1baed
Gitweb:        https://git.kernel.org/pub/scm/linux/kernel/git/daniel.lezcano=
/linux.git//e234d40823808c1727e88a40d8c9ee960de1baed
Author:        Luca Leonardo Scorcia <l.scorcia@gmail.com>
AuthorDate:    Fri, 02 Oct 2026 09:19:28 +02:00
Committer:     Daniel Lezcano <daniel.lezcano@kernel.org>
CommitterDate: Tue, 13 Oct 2026 13:17:27 +02:00

clocksource/drivers/timer-mediatek: Request and enable the bus clock

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
Signed-off-by: Daniel Lezcano <daniel.lezcano@kernel.org>
Link: https://patch.msgid.link/20261002072115.169250-4-l.scorcia@gmail.com
---
 drivers/clocksource/timer-mediatek.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/clocksource/timer-mediatek.c b/drivers/clocksource/timer=
-mediatek.c
index a9e7ff6..842d6ee 100644
--- a/drivers/clocksource/timer-mediatek.c
+++ b/drivers/clocksource/timer-mediatek.c
@@ -9,6 +9,7 @@
=20
 #define pr_fmt(fmt)	KBUILD_MODNAME ": " fmt
=20
+#include <linux/clk.h>
 #include <linux/clockchips.h>
 #include <linux/clocksource.h>
 #include <linux/interrupt.h>
@@ -283,8 +284,9 @@ static struct timer_of to =3D {
 	},
 };
=20
-static int mtk_syst_init(struct device_node *node)
+static int mtk_syst_init(struct platform_device *pdev)
 {
+	struct device_node *node =3D pdev->dev.of_node;
 	int ret;
=20
 	to.clkevt.features =3D CLOCK_EVT_FEAT_DYNIRQ | CLOCK_EVT_FEAT_ONESHOT;
@@ -305,10 +307,14 @@ static int mtk_syst_init(struct device_node *node)
 	return 0;
 }
=20
-static int __init mtk_gpt_init(struct device_node *node)
+static int mtk_gpt_init(struct platform_device *pdev)
 {
+	struct device_node *node =3D pdev->dev.of_node;
+	struct clk *clk_bus;
 	int ret;
=20
+	clk_bus =3D devm_clk_get_optional_enabled(&pdev->dev, "bus");
+
 	to.clkevt.features =3D CLOCK_EVT_FEAT_PERIODIC | CLOCK_EVT_FEAT_ONESHOT;
 	to.clkevt.set_state_shutdown =3D mtk_gpt_clkevt_shutdown;
 	to.clkevt.set_state_periodic =3D mtk_gpt_clkevt_set_periodic;
@@ -344,11 +350,10 @@ static int __init mtk_gpt_init(struct device_node *node)
=20
 static int mtk_timer_probe(struct platform_device *pdev)
 {
-	int (*timer_init)(struct device_node *node);
-	struct device_node *np =3D pdev->dev.of_node;
+	int (*timer_init)(struct platform_device *pdev);
=20
 	timer_init =3D of_device_get_match_data(&pdev->dev);
-	return timer_init(np);
+	return timer_init(pdev);
 }
=20
 static const struct of_device_id mtk_timer_match_table[] =3D {
