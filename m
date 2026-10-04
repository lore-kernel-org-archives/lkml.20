Received: from mail-pz2-f43.google.com (mail-pz2-f43.google.com [74.125.228.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E220C2868B4
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 22:35:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791153346; cv=none; b=SYefMsFFszW1KEYXXC044x7jtHPtFB5b0d6RWnlvtHTSQgy7PoVtrr0cwZx+rlFUgaFS/rUiTEahlQh2iXtn0jOaz7VkerYod+4j8xseiz4SYrCKwj9HjODXZ6x3N/Cyrn60Ov5GxvI9h5RV9G52K9yCq210nGS4WTjOpJ7pNYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791153346; c=relaxed/simple;
	bh=J9w78zrhFqkpHVvzEjo3LdO+FoVSSeCD3EZ3wkGmdg0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kF8OnD+BmTozi8iSZAwknP+8w2ckle28/rVmnu1l+XD8JDis/dHsYN8gso3MePirvKWoXUz4prbeVIgBTYSKMP5UjtIyZZofdbsmzn6QMSnG3Y4AW0+dtaZuOWkrKpnZbmtGlYVRZ0wPVgADPNQiXiRsZt24b+vPiAF1RvKyrcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hy0zuL/l; arc=none smtp.client-ip=74.125.228.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hy0zuL/l"
Received: by mail-pz2-f43.google.com with SMTP id d2e1a72fcca58-8631d0023daso305229b3a.2
        for <linux-kernel@vger.kernel.org>; Sun, 04 Oct 2026 15:35:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791153344; x=1791758144; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=h7iH/zc/L7s70jTWZfc+XAY/y7x81v+rNEqTo4jMzLg=;
        b=hy0zuL/lANi81nqTYHBKO1h2JhszILk2htAaYxs7ljZsUXLRiH0VScAbWUswQJ2ROr
         ScU2MhxafgEtclADE8Opt9xfwzoiFKiXnWsrtFORXOMBviX4MoIcO+PnTscLh6A3yY1u
         5jic0Gh4+RioSDojg0FQktrNPbT7qagsdm25vSInGlklUR4tx+nc1hMmygYzDKBdk2ou
         dbJTp1XcTZVyrXN9/fYfM/U2T1VuUw0MircIej/2fcTeYQ5OxJn2unSC+R42/3cBmSX8
         zUKJFcjATalHwMrbQS4KKOIA1fK4fZtdosm2GnBacPjmdrioylRgQjzKyUGM8AqZyuJA
         WppQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791153344; x=1791758144;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=h7iH/zc/L7s70jTWZfc+XAY/y7x81v+rNEqTo4jMzLg=;
        b=0Xv2HhhOlQFy4xMjO7oFk6K3ckWzQ28qxdtQEPyV8KGlabaslA5CLcsSCsdOtZ/hCq
         PHMWtdRwUqn1p4VZL4fnS49C/6z2OkayiXeU5ODG5C9RmN3+952KS62WLWsJBoo3U6Fy
         VP4aFc+lIM3fCGh3BWUOzjnh1NVIo9wWA0ka23F7ZZrF12NswmmJZW/REKxwo1nGjl1L
         UMhRyc3z8hCwW+MHMbH0Mamx1NSf3iE1Ge4hN0NN2LsP6rjEHY/xpWVvlp0VYztn28ec
         6iCU9GIsrXe2mMi7qMf8/NxlrgS7EOgctQ/MUcgMlOQmDQIUVhlriq00ab6szmWtDvBv
         0lAg==
X-Forwarded-Encrypted: i=1; AKwUvBwY7uaRturABkt3ldJyybfbCVJU3NxNcB11d5KmD6mOK8gM6si1xB/bwARaQKqaG7NF/KYHyzcUKUOVb0c=@vger.kernel.org
X-Gm-Message-State: AFuF++k6cMfgnIbkXmvyo8B3roemJ7YFSD082RwDmBgemtv29RhK73Ec
	HiTbvZVQczlGun4g9EQK1SgwSKev/2Y+w/8a3TnTbPSqNEKuoGqXsUd2
X-Gm-Gg: AYBFou2jv1XXNhm+RUQuuDnRXm19q2dmwxHUX7M1zHyzAX0sOku2uimizXuQM4D424U
	kbwaNMUpgqkKRBeBJK0s4SeHrYNTvst9kQ3d5ukC/BxgsAsy+TzSAbBZH6MVxK3QgVOkSUXd8G2
	8kEt55pKIdLer43W+QTVVQfKxxxBOQ1Tk4JicwLZFK/I9GskEiyIws5wUjlxYIpolJERnDKqYTs
	P5+CSdSDC9Ijr9/LtS30k+1j3p54lMSEa/iyLHqe1j9q4wWFVilpRaNaNwpHf4qng6ZtWLXgTZ7
	Of4bofE8eQ6Nm2Emn9788ppMEH4baGvwJle9vod8ywyan/DCK4WEohS158kOTIzY3ierZtbfKyp
	r3tQla9eJBcln6V7FxGQhwmf267cg5pnvGBcC1rpFGUbQn7O/Z+ND3ats21+8E8yRLiaLU5hsGX
	kCwE/dMNDDmbVCX8QRWP1xAPyOIkZ9VQGXsIZlIZcet0Udlnw0lnMf9oZSrkpaBvy5psIa7OwcA
	hpXfvMIxs06SAKDBKQQb74XuerGTxugzcQlYs6g5Uamsb1H9tOlOQGoUnDtaREHQVq6pINSzwfm
	0E24JKRHCVckgya9qMpBgBsxFpIawOhAJxYEhlmUhIqZKdIU
X-Received: by 2002:a05:6a00:2e18:b0:881:d48e:7138 with SMTP id d2e1a72fcca58-88af2492a51mr8229094b3a.4.1791153344084;
        Sun, 04 Oct 2026 15:35:44 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-88b0968dbebsm2777279b3a.8.2026.10.04.15.35.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 15:35:43 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-rtc@vger.kernel.org
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] rtc: mpc5121: replace in_8/out_8 with generic accessors
Date: Sun,  4 Oct 2026 15:35:40 -0700
Message-ID: <20261004223540.455708-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the PowerPC-specific in_8/out_8, in_be16/out_be16 and
in_be32/out_be32 accessors to the portable ioread8/iowrite8,
ioread16be/iowrite16be and ioread32be/iowrite32be. On PowerPC these
use the same ordered MMIO accessors, so behaviour is unchanged.

With no PowerPC-only accessors left, allow COMPILE_TEST, and add the
HAS_IOMEM dependency the generic accessors need.

Assisted-by: LLM
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/rtc/Kconfig       |  3 +-
 drivers/rtc/rtc-mpc5121.c | 80 +++++++++++++++++++--------------------
 2 files changed, 42 insertions(+), 41 deletions(-)

diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
index 0636b9ead2c2..8c0ac7e7a582 100644
--- a/drivers/rtc/Kconfig
+++ b/drivers/rtc/Kconfig
@@ -1773,7 +1773,8 @@ config RTC_DRV_MC13XXX
 
 config RTC_DRV_MPC5121
 	tristate "Freescale MPC5121 built-in RTC"
-	depends on PPC_MPC512x || PPC_MPC52xx
+	depends on PPC_MPC512x || PPC_MPC52xx || COMPILE_TEST
+	depends on HAS_IOMEM
 	help
 	  If you say yes here you will get support for the
 	  built-in RTC on MPC5121 or on MPC5200.
diff --git a/drivers/rtc/rtc-mpc5121.c b/drivers/rtc/rtc-mpc5121.c
index b90f8337a7e6..c038301fb86b 100644
--- a/drivers/rtc/rtc-mpc5121.c
+++ b/drivers/rtc/rtc-mpc5121.c
@@ -87,15 +87,15 @@ struct mpc5121_rtc_data {
 static void mpc5121_rtc_update_smh(struct mpc5121_rtc_regs __iomem *regs,
 				   struct rtc_time *tm)
 {
-	out_8(&regs->second_set, tm->tm_sec);
-	out_8(&regs->minute_set, tm->tm_min);
-	out_8(&regs->hour_set, tm->tm_hour);
+	iowrite8(tm->tm_sec, &regs->second_set);
+	iowrite8(tm->tm_min, &regs->minute_set);
+	iowrite8(tm->tm_hour, &regs->hour_set);
 
 	/* set time sequence */
-	out_8(&regs->set_time, 0x1);
-	out_8(&regs->set_time, 0x3);
-	out_8(&regs->set_time, 0x1);
-	out_8(&regs->set_time, 0x0);
+	iowrite8(0x1, &regs->set_time);
+	iowrite8(0x3, &regs->set_time);
+	iowrite8(0x1, &regs->set_time);
+	iowrite8(0x0, &regs->set_time);
 }
 
 static int mpc5121_rtc_read_time(struct device *dev, struct rtc_time *tm)
@@ -107,7 +107,7 @@ static int mpc5121_rtc_read_time(struct device *dev, struct rtc_time *tm)
 	/*
 	 * linux time is actual_time plus the offset saved in target_time
 	 */
-	now = in_be32(&regs->actual_time) + in_be32(&regs->target_time);
+	now = ioread32be(&regs->actual_time) + ioread32be(&regs->target_time);
 
 	rtc_time64_to_tm(now, tm);
 
@@ -131,7 +131,7 @@ static int mpc5121_rtc_set_time(struct device *dev, struct rtc_time *tm)
 	 * between it and linux time to the target_time register.
 	 */
 	now = rtc_tm_to_time64(tm);
-	out_be32(&regs->target_time, now - in_be32(&regs->actual_time));
+	iowrite32be(now - ioread32be(&regs->actual_time), &regs->target_time);
 
 	/*
 	 * update second minute hour registers
@@ -148,20 +148,20 @@ static int mpc5200_rtc_read_time(struct device *dev, struct rtc_time *tm)
 	struct mpc5121_rtc_regs __iomem *regs = rtc->regs;
 	int tmp;
 
-	tm->tm_sec = in_8(&regs->second);
-	tm->tm_min = in_8(&regs->minute);
+	tm->tm_sec = ioread8(&regs->second);
+	tm->tm_min = ioread8(&regs->minute);
 
 	/* 12 hour format? */
-	if (in_8(&regs->hour) & 0x20)
-		tm->tm_hour = (in_8(&regs->hour) >> 1) +
-			(in_8(&regs->hour) & 1 ? 12 : 0);
+	if (ioread8(&regs->hour) & 0x20)
+		tm->tm_hour = (ioread8(&regs->hour) >> 1) +
+			(ioread8(&regs->hour) & 1 ? 12 : 0);
 	else
-		tm->tm_hour = in_8(&regs->hour);
+		tm->tm_hour = ioread8(&regs->hour);
 
-	tmp = in_8(&regs->wday_mday);
+	tmp = ioread8(&regs->wday_mday);
 	tm->tm_mday = tmp & 0x1f;
-	tm->tm_mon = in_8(&regs->month) - 1;
-	tm->tm_year = in_be16(&regs->year) - 1900;
+	tm->tm_mon = ioread8(&regs->month) - 1;
+	tm->tm_year = ioread16be(&regs->year) - 1900;
 	tm->tm_wday = (tmp >> 5) % 7;
 	tm->tm_yday = rtc_year_days(tm->tm_mday, tm->tm_mon, tm->tm_year);
 	tm->tm_isdst = 0;
@@ -177,16 +177,16 @@ static int mpc5200_rtc_set_time(struct device *dev, struct rtc_time *tm)
 	mpc5121_rtc_update_smh(regs, tm);
 
 	/* date */
-	out_8(&regs->month_set, tm->tm_mon + 1);
-	out_8(&regs->weekday_set, tm->tm_wday ? tm->tm_wday : 7);
-	out_8(&regs->date_set, tm->tm_mday);
-	out_be16(&regs->year_set, tm->tm_year + 1900);
+	iowrite8(tm->tm_mon + 1, &regs->month_set);
+	iowrite8(tm->tm_wday ? tm->tm_wday : 7, &regs->weekday_set);
+	iowrite8(tm->tm_mday, &regs->date_set);
+	iowrite16be(tm->tm_year + 1900, &regs->year_set);
 
 	/* set date sequence */
-	out_8(&regs->set_date, 0x1);
-	out_8(&regs->set_date, 0x3);
-	out_8(&regs->set_date, 0x1);
-	out_8(&regs->set_date, 0x0);
+	iowrite8(0x1, &regs->set_date);
+	iowrite8(0x3, &regs->set_date);
+	iowrite8(0x1, &regs->set_date);
+	iowrite8(0x0, &regs->set_date);
 
 	return 0;
 }
@@ -198,7 +198,7 @@ static int mpc5121_rtc_read_alarm(struct device *dev, struct rtc_wkalrm *alarm)
 
 	*alarm = rtc->wkalarm;
 
-	alarm->pending = in_8(&regs->alm_status);
+	alarm->pending = ioread8(&regs->alm_status);
 
 	return 0;
 }
@@ -212,10 +212,10 @@ static int mpc5121_rtc_set_alarm(struct device *dev, struct rtc_wkalrm *alarm)
 	alarm->time.tm_mon = -1;
 	alarm->time.tm_year = -1;
 
-	out_8(&regs->alm_min_set, alarm->time.tm_min);
-	out_8(&regs->alm_hour_set, alarm->time.tm_hour);
+	iowrite8(alarm->time.tm_min, &regs->alm_min_set);
+	iowrite8(alarm->time.tm_hour, &regs->alm_hour_set);
 
-	out_8(&regs->alm_enable, alarm->enabled);
+	iowrite8(alarm->enabled, &regs->alm_enable);
 
 	rtc->wkalarm = *alarm;
 	return 0;
@@ -226,10 +226,10 @@ static irqreturn_t mpc5121_rtc_handler(int irq, void *dev)
 	struct mpc5121_rtc_data *rtc = dev_get_drvdata((struct device *)dev);
 	struct mpc5121_rtc_regs __iomem *regs = rtc->regs;
 
-	if (in_8(&regs->int_alm)) {
+	if (ioread8(&regs->int_alm)) {
 		/* acknowledge and clear status */
-		out_8(&regs->int_alm, 1);
-		out_8(&regs->alm_status, 1);
+		iowrite8(1, &regs->int_alm);
+		iowrite8(1, &regs->alm_status);
 
 		rtc_update_irq(rtc->rtc, 1, RTC_IRQF | RTC_AF);
 		return IRQ_HANDLED;
@@ -243,9 +243,9 @@ static irqreturn_t mpc5121_rtc_handler_upd(int irq, void *dev)
 	struct mpc5121_rtc_data *rtc = dev_get_drvdata((struct device *)dev);
 	struct mpc5121_rtc_regs __iomem *regs = rtc->regs;
 
-	if (in_8(&regs->int_sec) && (in_8(&regs->int_enable) & 0x1)) {
+	if (ioread8(&regs->int_sec) && (ioread8(&regs->int_enable) & 0x1)) {
 		/* acknowledge */
-		out_8(&regs->int_sec, 1);
+		iowrite8(1, &regs->int_sec);
 
 		rtc_update_irq(rtc->rtc, 1, RTC_IRQF | RTC_UF);
 		return IRQ_HANDLED;
@@ -266,7 +266,7 @@ static int mpc5121_rtc_alarm_irq_enable(struct device *dev,
 	else
 		val = 0;
 
-	out_8(&regs->alm_enable, val);
+	iowrite8(val, &regs->alm_enable);
 	rtc->wkalarm.enabled = val;
 
 	return 0;
@@ -340,11 +340,11 @@ static int mpc5121_rtc_probe(struct platform_device *op)
 
 	if (of_device_is_compatible(op->dev.of_node, "fsl,mpc5121-rtc")) {
 		u32 ka;
-		ka = in_be32(&rtc->regs->keep_alive);
+		ka = ioread32be(&rtc->regs->keep_alive);
 		if (ka & 0x02) {
 			dev_warn(&op->dev,
 				"mpc5121-rtc: Battery or oscillator failure!\n");
-			out_be32(&rtc->regs->keep_alive, ka);
+			iowrite32be(ka, &rtc->regs->keep_alive);
 		}
 		rtc->rtc->ops = &mpc5121_rtc_ops;
 		/*
@@ -376,8 +376,8 @@ static void mpc5121_rtc_remove(struct platform_device *op)
 	struct mpc5121_rtc_regs __iomem *regs = rtc->regs;
 
 	/* disable interrupt, so there are no nasty surprises */
-	out_8(&regs->alm_enable, 0);
-	out_8(&regs->int_enable, in_8(&regs->int_enable) & ~0x1);
+	iowrite8(0, &regs->alm_enable);
+	iowrite8(ioread8(&regs->int_enable) & ~0x1, &regs->int_enable);
 
 	irq_dispose_mapping(rtc->irq);
 	irq_dispose_mapping(rtc->irq_periodic);
-- 
2.56.0

