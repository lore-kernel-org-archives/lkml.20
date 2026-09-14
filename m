Received: from mail-oi2-f13.google.com (mail-oi2-f13.google.com [74.125.231.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2EC844781F
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 12:36:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789389379; cv=none; b=sniwEwuZmTPSe/z8xiVpyWdGQfo7JA8oGr7S25NtK9UQgXFgbVWJ+kTB4nIWDKPCb5LjEXW9wrfL1NMf/TDK7xUgPl6hnbHeM80n/fnZArB7yIqT1qSwi8FZeu9Fye9eMZa+i+mRwIBqr1ts5CPBFrE07kDVMibJ8PuaE0XlCns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789389379; c=relaxed/simple;
	bh=aLewbFs8FlsksoxGpUNdIM/fU4VhPzZwmbdBRBeVyRs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=AL8aLri21EXbxSU8qB104ffzEdNWbL0DBi0WgnzY815XZ29Lf4R1jNxcWhdg1t4qxlQ+w66VIwERu9OBzZgHW1CP0/e9WBiRW/7yYyV8u+HlFhsQu+2PmiQy/UlMtCN/tkQZwqA0E5kbmWK6MIa1lD4e1l1A8+WpqKrrk4eaZSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sZpiDfYa; arc=none smtp.client-ip=74.125.231.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sZpiDfYa"
Received: by mail-oi2-f13.google.com with SMTP id 5614622812f47-4c2c08ff3f8so1117188b6e.1
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 05:36:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789389376; x=1789994176; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=YavU6eZ3BhhanoEPKol5pZZFs/bg8KvofxNp5pSA/U4=;
        b=sZpiDfYa7lYQuSGZr0q9aErXy5zvwyWYkKlBRzgfMGd03tbqo4G5r5iErnEFTVWEf0
         8d/UQ2Sygls59rz+LCpsoXSNDqH4V+G3wU8YM6nmTUm5b5rZWQgL+CR0adP3fcL4rf+C
         9ycJ+PnkUo82oNkgIgy2NMyT5cDjiNxpko14CU9/7vaIfYszkUN6srOVtq2bh4Y5Tps/
         I1wusHxJC2FiI8b1H8vZe7M9WI6+blOk//FfsZd9Fx+ydHewUzuuX01EsQzjtIdfAtxl
         EghFTMHJFQ9gzSyEzymwPKFol6s/NK2haDV3iQkMdSft6o+XHjoiP2h1ugCG1P0S5CBG
         PREA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789389376; x=1789994176;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YavU6eZ3BhhanoEPKol5pZZFs/bg8KvofxNp5pSA/U4=;
        b=itCeK8/airHiVTkFHiZjsr6I4UzbdA221PqkvqfxaAv/3swVRtF4wZnhcc4cfXzTSz
         z7scD7qEUeP7etZZ0Cyx7g+LlRAOS71WcmUiXtehWg7xf402tEbPHtZJKdQ/UAn0EbaR
         KqDyK5RgFvFUxZB/qmio/pJiPleaFMcMAfq962hx8g6r+0F5JmHsTZvV0Q8+WZ16oi40
         b26ZR30nle2xyRZ8sIwVk0KjC337VSWf4112LHqje4k7Ab39pldTcLvIvHSaOzksdEP9
         PQQPg8X5zbPs8c0jVdw+KxED2U2Zadsg19WhxASflYqK6vPWxFFlSaOxWnwkzfrXDLIR
         0vJA==
X-Forwarded-Encrypted: i=1; AKwUvBx3NyqbNT9IbUIZxom5yjCWKCeYVp3EvDviMX4yqczAEzx1ATC+nHQ8hdQgofh+JiF76C7D6romNT7B7ec=@vger.kernel.org
X-Gm-Message-State: AFuF++l+NYVeyW1zzdAy97j08VoCZL7+YMI6mgEV0NGQ3L8vz526mlHw
	5rA3Op14nR//nFrnZSsw4GdGgwNR/CeI691thoihNeLg4r+CSVICBcs8qvniDQ==
X-Gm-Gg: AYBFou16U/5253R5Y57mtcL2TdVtFXUvhxfzfr5X7/R02f0SrNRWBtw5zuWAwF/zAH2
	g5IGRxmTB6nmWY7hPRRrJAzIhmNWEwP/gojbyvTk23DpAND0coIz759PvotA2aLVlEazRNscn9s
	XzfMHYf1cfu3VhlLSQehIPKefZtPVr8ZxTcMhvNMo89gVzvQq4QS0X1Oue9ts/DMwjD5RJgbdT9
	AqMUx+kO9hGciFGxNRxpmjAK3U8eUOLAdjIIo3sByUtBlCVLLhBS0bJrTuVJZMWyeKmns31WXND
	pBIR6fVFUgu29ZuImi7HhwcVH2JnvwZmc7qlgXZrshXUF/KdSAz+N6m3EYxXyvBlDnRAZq/7Csd
	ib0Y71lWUh+ridPSBhxOZot2kIKSU23Cvyaaanjv1HA76jYbruaga1Kz0XYogdQpOv/LMYhNbwo
	G+cRGiaXZqcbmxXgHCldBtGIbhsQT1aIAPq8SWBZ5rS32Cf2vnriKIL5BItRsaEXSlzy1TQkMJd
	Dwsbxgy3fwsRwih
X-Received: by 2002:a05:6808:6d97:b0:4b3:1a95:4160 with SMTP id 5614622812f47-4c7b3ed4b22mr1318687b6e.18.1789389376449;
        Mon, 14 Sep 2026 05:36:16 -0700 (PDT)
Received: from SGN-LDSENG.tasernet.com ([2405:4800:5cc3:11a:1ac0:4dff:fe8b:4a69])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4c3315b19afsm10256886b6e.10.2026.09.14.05.36.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 05:36:16 -0700 (PDT)
From: Cong Nguyen <congnt264@gmail.com>
To: Wim Van Sebroeck <wim@linux-watchdog.org>
Cc: Guenter Roeck <linux@roeck-us.net>,
	linux-watchdog@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] watchdog: shwdt: register device only after full driver init
Date: Mon, 14 Sep 2026 19:36:09 +0700
Message-Id: <20260914123609.2186477-1-congnt264@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

sh_wdt_probe() calls watchdog_register_device() -- exposing
/dev/watchdogN -- before timer_setup() and pm_runtime_enable() run. A
start command landing in that window calls mod_timer() on an
uninitialized timer (NULL ->function) and resumes via
pm_runtime_get_sync() before PM is enabled.

Move timer_setup() and pm_runtime_enable() before the register call,
matching the order already used by rzg2l_wdt.c/rzv2h_wdt.c. Add
pm_runtime_disable() on the now-possible post-enable register-failure
path.

Fixes: 8f5585ec3d17 ("watchdog: shwdt: driver model conversion.")
Assisted-by: Claude:claude-opus-4
Signed-off-by: Cong Nguyen <congnt264@gmail.com>
---
 drivers/watchdog/shwdt.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/watchdog/shwdt.c b/drivers/watchdog/shwdt.c
index 719f100aae60..c22b8e760476 100644
--- a/drivers/watchdog/shwdt.c
+++ b/drivers/watchdog/shwdt.c
@@ -263,19 +263,20 @@ static int sh_wdt_probe(struct platform_device *pdev)
 	dev_info(&pdev->dev, "configured with heartbeat=%d sec (nowayout=%d)\n",
 		 sh_wdt_dev.timeout, nowayout);
 
+	timer_setup(&wdt->timer, sh_wdt_ping, 0);
+	wdt->timer.expires	= next_ping_period(clock_division_ratio);
+
+	pm_runtime_enable(&pdev->dev);
+
 	rc = watchdog_register_device(&sh_wdt_dev);
 	if (unlikely(rc)) {
 		dev_err(&pdev->dev, "Can't register watchdog (err=%d)\n", rc);
+		pm_runtime_disable(&pdev->dev);
 		return rc;
 	}
 
-	timer_setup(&wdt->timer, sh_wdt_ping, 0);
-	wdt->timer.expires	= next_ping_period(clock_division_ratio);
-
 	dev_info(&pdev->dev, "initialized.\n");
 
-	pm_runtime_enable(&pdev->dev);
-
 	return 0;
 }
 
-- 
2.25.1

