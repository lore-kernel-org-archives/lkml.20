Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794927219;
	b=5hUvXcHXX58rjzYzLxZWlULQmkkH8FIiSvQq08TZ/EhRv3B57MNzwD0r/vro+xgmZ/LJ
	 dOPMxkH2DRU46WhgCiHL4J8lfxvIO0mrs7GzUO0FhlpRRJSiLqeCBvdbwigTn8MYfJr6r
	 nomccJNdicYw028J2DqySJRnadULPvS/qiDqtw7QbhCewudyvc+dgpEORwyKGzlHovdfE
	 RMFlPKHn5XW0QQrD4xG/umwxYQEaoIbTf9hrBUZup+cR50kyK2WD6EHwXulHMw6OUx/du
	 5tNSti6ExQHWzMcJT8p3RoZVl84/FenejcHytV+4FTCzB8YTPWqwsn2jKxhFiTkphPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794927219;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Ji5dmOGNAnAODAW0ROWats0oqO4n06TBqSd0YPOj2Tc=;
	b=bTeHqW4ahMKspP96JWYq8PdMIso6mmy9m4rc1WcyZ/tnpz0M77jJC6SYXkJGcfpe/80o
	 9S//B/HXoxLFE8kL/wTISFUj4wd6dFcmUgPyuNAKAg/js3r66J94DMiZd8HaY9Qo1Fr/c
	 op7WSC1l3gTJ13nXsPRuy+rS6syw/yO9x+RKKcmmKh2bMJSrdEpwNuM2wVWYj3nuLGUDr
	 0FL/34jXGHeHryzM7Qfd85TkM07Fp3ecHVcFOfEpr/P/VV7L4df5tKXC0Qw52UZtMOYqL
	 bYefzy/Y0GMmkBpz4NFN52NYa+J3pu4vAQa6pLxXAWyT3LVJ4eNJDuj5p4r0ffspLhg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UOaOdSNE;
	arc=none smtp.remote-ip=209.85.214.171
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADFDF606A335
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 14:53:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ADFDF606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UOaOdSNE
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2efef1516b5so1679635ad.3
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 06:53:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794927218; x=1795532018; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ji5dmOGNAnAODAW0ROWats0oqO4n06TBqSd0YPOj2Tc=;
        b=UOaOdSNEDPzwKswibDqadUr7H5tNKhoihyUcBZqvCA0eThpzAd3uAkozvLkxyi4hNL
         tkQSkRolpThhjcCAckgYfBRcE3FBrANXv6XXUIBGlpmPuNmoSBsrBcceYXw8h41Q6shv
         yBJ3sRQx3maVFHiLv/5yQ9AcMF71+6poyQ3IkbEqy51W10R21yBR7PNcw5EYbMbdmXMk
         dJEx08mhRduNBpcK7wR/o+kXpxztpJOOMfiXriLFEAmWQb4VQ7fyuYp40XhCI1Qyo77p
         96ybB1rSrTddEkAXJ+7fz4q2O05s/QgKSQ80GfldeGFxXIB5SYT1akubImj+Mt8mP+6N
         cv+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794927218; x=1795532018;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ji5dmOGNAnAODAW0ROWats0oqO4n06TBqSd0YPOj2Tc=;
        b=kUqsYsvsB3RckOb5cMfbUFvB5C9ucgraZ83GSL57ozoz7d4X2DpNXGGfaMvGM8si1R
         mfg7A3GVSbkI1+lfaJqK5eWSYx6CmZO0FU+10Zw4rrn8ZMLvboKu+lLgfw1bnNFU6gq2
         q9+ov+QESyVJvKEQRPKboa4+1KVTmc1XqrHx3sQM2tN8HnJvOCyGwu6XseZQgbBEDuHW
         xSPMPJUHAiXU6FiUKmVp/CYBC8tS+R+Sh9pv9e+oX7MKR7G+sXKxuBdqRbuK/yJK+HMS
         rROJGA9Pfn1DjxUwMUz6FreFs6Wz/WjeV+FU8w4A8aPSF0S/yWOJntPyIOWWZxj41GUp
         JQBA==
X-Forwarded-Encrypted: i=1; AL+hErGHIO7MJ8P+mOJ63MOxvvdQBwKPGTLO1P/nhMj48DEKzT5lcq4jhXzPCvnjekoU01YtcSNr01huGHRvAKM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+/BXAhA16fe5L/tKgcDGbkXZ0QIAZZx6pRz4/m6D4zzLcUTnSy
	u3FefIEfzI/rrZOfPO6LF/WvEhR/KUPVAvxVf3XMTiGtzGeppLrVvVra
X-Gm-Gg: AZFdTZfefv8geUcxgeCuSomabbxN9FitgGv+e1mvtIf83UWzSMh1ETp6n0HCIL5uGsX
	80lcYCFQqIRU1qI1OdvpcH2MMrDUTPAL5GgACpke+vTt6mWfH5HkqD2xMKQE3Wl/+lxIl4rRBds
	iDsNFgTl9wYf1oo3sA/MtmIeNgLkueZflbNnVjG6uglU6XMUB1qRlMziOa+Q/UhiTy98y3UvQB+
	w1LQJlAtAIyMh2AvNBH5ZjInHTvLDLfWIN7xD5M6UYPmPSnAAf1U7uQmN/QE9vC6gsNEsKSzDkb
	wfGCDWZvejmVZM/dQUOlJeGz/4X1LDRlPYhFUyvWVd6u6zwgeIo2WPbOR/oVAllqztvxQ9ckYE4
	ZD09ruJ+K8sUGanKkrvmrYH0EbfFG4t3AQ0gVzi9Wsc04G+VyR76DjntGYuJVAmnkpPJKMrEi2g
	P8HFCP2KS3tsRL/+nAiOl3DLAJoyEIZTnJYXC7naZnnUHJJ2kPkrazhbJOwEs6tyoRNuw+Ru7F+
	phN+L38WIcIMoE5CUDL8zUEV1fMuRLCFQLGEGv/mROciRhwKhs8F2jdVVWAiTHxsb6X9pz6cyhQ
	7Pvw+1WRHOWyiR6g4hzXu4336z7Z1FdEJIZEDSyotlo4RlbVns+hs3+qHmO4D9tz8uCKf7WYTA/
	9qj1eS+24x/GNPeee+dITZA8Fhqy79EOt2fAe2Sd/
X-Received: by 2002:a17:903:1b46:b0:2e9:660a:7944 with SMTP id d9443c01a7336-2ee0df11a51mr140279215ad.58.1794927217892;
        Tue, 17 Nov 2026 06:53:37 -0800 (PST)
Received: from lwq-System-Product-Name.. ([2602:feda:30:cafe:ec49:29ac:0:f6])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2efd7a88a55sm17545035ad.65.2026.11.17.06.53.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 06:53:37 -0800 (PST)
From: Yaohan Li <shunsheng1218@gmail.com>
To: rafael@kernel.org,
	daniel.lezcano@kernel.org
Cc: rui.zhang@intel.com,
	lukasz.luba@arm.com,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] thermal: db8500: register the zone before requesting the interrupts
Date: Tue, 17 Nov 2026 22:53:31 +0800
Message-Id: <20261117145331.1092458-1-shunsheng1218@gmail.com>
X-Mailer: git-send-email 2.34.1
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

Both threaded handlers call thermal_zone_device_update(th->tz, ...), but
the thermal zone is registered last, after both
devm_request_threaded_irq() calls.

That leaves two windows.  During probe an interrupt can be served while
th->tz is still NULL or holds an error pointer.  On removal devres runs
in reverse order, so the zone is unregistered and freed before the two
IRQs are released, and a handler that the hardirq has already woken can
then operate on a freed thermal_zone_device.

Register the zone first and request the interrupts afterwards, so devres
releases the IRQs before the zone.

Stopping the PRCMU measurement from .remove() would not be enough on its
own: db8500_thermal_update_config(), which both handlers call, stops the
sensing and starts it again, so a handler still running when .remove()
returns restarts it.  Register the stop as a devres action placed between
the zone and the interrupts instead.  It then runs after both handlers
have been released and before the zone goes away, and it also covers a
probe failure past that point.

Signed-off-by: Yaohan Li <shunsheng1218@gmail.com>
---
Prepared against v7.4-rc1-1969-g666539eecdf4.

AI assistance: the analysis, the change and its review notes were
prepared with Claude (Anthropic) as a coding assistant.  The author
reviewed the reasoning and takes responsibility for the content.

This revision registers the thermal zone before the interrupts and puts
the PRCMU stop into a devres action placed between them, so devres
releases both handlers first, then stops the measurement, then
unregisters the zone.  A stop issued from .remove() alone would be
undone by a handler still running db8500_thermal_update_config(), which
stops the sensing and starts it again.

Testing: compiled for ARCH=arm with u8500_defconfig (gcc 11.4,
arm-linux-gnueabi).  No Ux500 hardware was available, so neither the
normal removal nor the second-IRQ-failure path was exercised.
---
 drivers/thermal/db8500_thermal.c | 30 ++++++++++++++++++++++--------
 1 file changed, 22 insertions(+), 8 deletions(-)

diff --git a/drivers/thermal/db8500_thermal.c b/drivers/thermal/db8500_thermal.c
index 48981247763f..b8f75838cc4d 100644
--- a/drivers/thermal/db8500_thermal.c
+++ b/drivers/thermal/db8500_thermal.c
@@ -148,6 +148,11 @@ static irqreturn_t prcmu_high_irq_handler(int irq, void *irq_data)
 	return IRQ_HANDLED;
 }
 
+static void db8500_thermal_stop_action(void *data)
+{
+	db8500_prcmu_stop_temp_sense();
+}
+
 static int db8500_thermal_probe(struct platform_device *pdev)
 {
 	struct db8500_thermal_zone *th = NULL;
@@ -160,6 +165,23 @@ static int db8500_thermal_probe(struct platform_device *pdev)
 
 	th->dev = dev;
 
+	/* register of thermal sensor and get info from DT */
+	th->tz = devm_thermal_of_zone_register(dev, 0, th, &thdev_ops);
+	if (IS_ERR(th->tz)) {
+		dev_err(dev, "register thermal zone sensor failed\n");
+		return PTR_ERR(th->tz);
+	}
+	dev_info(dev, "thermal zone sensor registered\n");
+
+	/*
+	 * Registered after the zone and before the interrupts, so devres runs
+	 * it after both handlers have been released: a handler cannot restart
+	 * the measurement behind our back.
+	 */
+	ret = devm_add_action_or_reset(dev, db8500_thermal_stop_action, th);
+	if (ret)
+		return ret;
+
 	low_irq = platform_get_irq_byname(pdev, "IRQ_HOTMON_LOW");
 	if (low_irq < 0)
 		return low_irq;
@@ -180,14 +202,6 @@ static int db8500_thermal_probe(struct platform_device *pdev)
 	if (ret < 0)
 		return ret;
 
-	/* register of thermal sensor and get info from DT */
-	th->tz = devm_thermal_of_zone_register(dev, 0, th, &thdev_ops);
-	if (IS_ERR(th->tz)) {
-		dev_err(dev, "register thermal zone sensor failed\n");
-		return PTR_ERR(th->tz);
-	}
-	dev_info(dev, "thermal zone sensor registered\n");
-
 	/* Start measuring at the lowest point */
 	db8500_thermal_update_config(th, 0, PRCMU_DEFAULT_LOW_TEMP,
 				     db8500_thermal_points[0]);
-- 
2.34.1

