Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2031338B7A6
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 08:08:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791014920; cv=none; b=uozzbuIs3RdQPrTPSUFuI6gPjsIp+ojYeUsNuVlYPkqQwnFGDp0RMPE/CeEnaJl6/pST19s+L9BRRqbsh8vO0nmz7mC9v0A+f1Ymz5pwSEmVLqvBWKeMGMDkJOJrgzh1Ld/T5vPDpB85uSvYrZuPnpkdrw0Q5lclSxW78iENEDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791014920; c=relaxed/simple;
	bh=KnlzZ5f49c3Tnyzj7Da8HaDeDFJgz7lrVHQ2YiRkJ4Q=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=k+tf1vM7eG0csPMvem57gWGAd96lI6sGGIIYgnK7EKCcn9LGpWEA+z32nhaomTmpqdFo+dJSR9Ho4QhcUz4MPdsHGK7rFdanCO9h6K40N8NooL5QMTaEWizJ//q/9yhswTDQYdXu+Od2pMqdxmEWywimlpoWNUDQNVMWHkP792A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=baV1Jq9C; arc=none smtp.client-ip=117.135.210.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="baV1Jq9C"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=Tr
	qS3azplz90zxRWlSu/z1oTJZBW4BvXXC4oCO67bzw=; b=baV1Jq9CWx121uYJYa
	rXih7RtCqJSvPXiHSMgPkQMT07L1cPC+51tP5V++YLpkfj2hI1n5eLL0zzoMIJzH
	LT1gGCjf9rf7ar3G0JqTzFFNP8P/RjcHDHkRzMXDVW4c3jWrpUAXtgJ9Dxj4TPga
	pqgOrSpdzeaC9uds77/pzOUh0=
Received: from pc.localdomain (unknown [])
	by gzga-smtp-mtada-g1-3 (Coremail) with SMTP id _____wDnT6Xut8BqBAyaCQ--.49624S2;
	Sat, 03 Oct 2026 16:08:15 +0800 (CST)
From: Jiale Yao <yaojiale02@163.com>
To: Daniel Lezcano <daniel.lezcano@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Neha Malcom Francis <n-francis@ti.com>,
	Gokul Praveen <g-praveen@ti.com>,
	linux-kernel@vger.kernel.org
Cc: Jiale Yao <yaojiale02@163.com>
Subject: [PATCH] clocksource/drivers/timer-ti-dm: handle runtime resume failure
Date: Sat,  3 Oct 2026 16:08:11 +0800
Message-Id: <20261003080812.429386-1-yaojiale02@163.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wDnT6Xut8BqBAyaCQ--.49624S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7Ww48ZryUZr4rAFyUKF1rWFg_yoW8Xry3pr
	Wvk3W7Kry0va1Utr4vyF1DXFyfu34UtFy3GrZ7J34avrnxAr1I9ayUXFyjva13CF95Ar12
	qF48Zw45uFWjvw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pi89NxUUUUU=
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbC7w-zLmrAt+9LVwAA3T

omap_dm_timer_write_counter() accesses timer registers and updates the
saved counter value after requesting a runtime PM reference. If runtime
resume fails, the timer remains inaccessible and no reference is
acquired, but the function still writes the register, drops a
reference, updates the cached value, and reports success.

Check the return value and propagate an error before touching the timer
state.

Fixes: 0494fc345b37 ("clocksource/drivers/timer-ti-dm : Capture functionality for OMAP DM timer")
Signed-off-by: Jiale Yao <yaojiale02@163.com>
---
 drivers/clocksource/timer-ti-dm.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/clocksource/timer-ti-dm.c b/drivers/clocksource/timer-ti-dm.c
index 6787acac9a43..399321ea7915 100644
--- a/drivers/clocksource/timer-ti-dm.c
+++ b/drivers/clocksource/timer-ti-dm.c
@@ -1095,6 +1095,7 @@ static int omap_dm_timer_write_counter(struct omap_dm_timer *cookie, unsigned in
 {
 	struct dmtimer *timer;
 	struct device *dev;
+	int ret;
 
 	timer = to_dmtimer(cookie);
 	if (unlikely(!timer)) {
@@ -1104,7 +1105,10 @@ static int omap_dm_timer_write_counter(struct omap_dm_timer *cookie, unsigned in
 
 	dev = &timer->pdev->dev;
 
-	pm_runtime_resume_and_get(dev);
+	ret = pm_runtime_resume_and_get(dev);
+	if (ret < 0)
+		return ret;
+
 	dmtimer_write(timer, OMAP_TIMER_COUNTER_REG, value);
 	pm_runtime_put_sync(dev);
 
-- 
2.34.1

