Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794033072;
	b=ek9zL3VqCFWti8dyJY+xCHpDHAh1qM/rFuZYKG+NHuTai8OqMOhRMwO76ab88EMBV5rQ
	 T9+ahPgYW/s0qdcUtUSm/JDS3MCn9jESXXy6DC+xNhZQxsvCWnENsfNvNjnfoyiBgVfE1
	 tCMiQgJl5XTbYGmAQ450cxDsc9ZwZ6j6XU3RF9EL3jH1enWJEDvTTZJqWfNbkz3p1SIGI
	 /loVVo4lzIWlKaPCAoOkyr0zsRXsvETzFVy6kO96oKsXJk5EjqrU/lNmxOlOqi/5kbVnq
	 PHopjFx0ZKHEvN15VupycSS48aW3JdhJ+DfAy7zzhG6mXBtHBtXhcnIV4XfQC/HjJaQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794033072;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=OcclpOoyR9VbzHL5lXvcmBGzh1lq20n1nrPwq5+OX9o=;
	b=HSoMZySSSLV2eAjkYxX/dsHbPGekFZopmE74EsJQWR3BHxZPBn1bU50djZBBO9Zx97n8
	 Z0KPS4HMNEbz/fOR3gIxcpUdMpbcrf26jikUBUt9V8hS21TmBxRwD5XiGGGABJY7T+SHA
	 C2fnGJjCP+nYdnAkRQrGgjXsFargN0dJJsLkaTPECJLHVKTHKjXCkHsTUldEfMMPf5tAf
	 sEyGk9eOiaDaNqCSY7cNjfD+JRzsB4OHRK9PBiDDPXhDTlWu5bLuWj9RLbd4ABFKCjEB0
	 1vbIRrBvePABVadmYhT0+EA296QzNsX9r7jc3u3ddo9oW/W6Npjr5f2VmSOj9OR1gcw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZYI+R8wK;
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05A40606A326
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 06:31:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 05A40606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZYI+R8wK
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-36ff9c9da34so1778684eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 22:31:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794033071; x=1794637871; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=OcclpOoyR9VbzHL5lXvcmBGzh1lq20n1nrPwq5+OX9o=;
        b=ZYI+R8wK5I1Y3OH9QuK415gbEyaFx5Z8BY5+x5BSZeL82bX19jJR6vtzgwmKF2xc4/
         OuIeOmziZ3r8oVwuSdsCzXiI3CXVW8jfWU0lHT1fxEfjKWSwxp8f2kBqDjTu+l5FnL2Q
         kq5t2A/BWCGD3/h8qJZCuqbtiZ8kFUK3x6f15VqRVK0JoPCLzZOL4NIlrCNVCqBaE8v5
         VyArRGf9EuyzLn2a+PinCdNbWy85Ul79UeUBe0Xh56TC4RXVoaqs92G77WfD4574mJYi
         8dpPydxCpgD/CigqjvIFn4j2HDvMwrZIUAEE75KyOBWrnfvvlOQDDJsQkYO8W2GGN8Tb
         zIkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794033071; x=1794637871;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OcclpOoyR9VbzHL5lXvcmBGzh1lq20n1nrPwq5+OX9o=;
        b=BOKeVPxcqA0Y87xtMPzltgI1J2y1BRhKF6jG1x8GgMJ38Twqw6KrH2K4XnisArdt2w
         BB369KOayQ03rtFMAzdYr6/bmilpy4RSX6l6Jpf90+EYC+CcMZelcTXGmRM/xwDiCFe1
         paz2TXBnDBoXEYvQnOK3NKPM47qcXyD1Jlz3oIKl5jeckqw7o8msFKFESc5gSMT0FALu
         C9eVEDUl4fb1G/2ZvwnmqTCQddCXidhh7AeB4NLUQE2I9N0Gftf3EcnGLey3g47HO9uZ
         P8vcPhoCCqmpQoaHT1GGR5m4FWkdmNS5Jxej+P3cgTPpORe+KndqfxhJ5opOjmMt0ALq
         qW1A==
X-Forwarded-Encrypted: i=1; AL+hErEwMGmtk25u4V4o+QYdbCcPXCQ99ULGIAUEedgurvRpQscEYe5A8rb+qY8toC1jjlluk/ayq8h7cLjbpsE=@vger.kernel.org
X-Gm-Message-State: APuU4Z9JeYL5gj7B4T4Fu66YWQ50i7NEWGqUPRwY/Mr5ehr6/vEY2XAH
	H6x49Llf0ykgvGs57spXTvM3yvyuaax4seBLSY7uy7DodiNteV/MGZw+
X-Gm-Gg: AYBFou2XejhT4KK//l4KyKocDbx0OgJ2IQFi3PNoJf8jS2bnyO50LcMjivTteWZfGFZ
	l72AONtxHgvMwXbST5OhtynGxgD5zU50fQ65z9K5TPoLivGYQKA/jG43rvFm8HMAjlBwO+E1GCc
	NRYb9KBTMytqccilGWCGDwM1bcAu9ifJWeuQzFlY6LQIMylgjIhz8LVgO1b8X8JFEGH2AUqi0RV
	KYU5zPg6+sk5ssXF2UE1sijJIbBEqvLAO6rHfQyOEK60cfauDUJQryyWe4CBek01KX1E4Rs3y56
	FWECMOJ/5Zz/5l/vKYt1O4658GVJZ0OyHMyxToSZTxXnMXnu4LjqYCwddv/lx8i0IZ+W2NYbQvG
	uapfaLSOFxvno7dTMr9gZ0droInyMPuQeGneMsjNQHGr5jaFnlSqXsYpIdsZqjWRvLAIklmT5Kv
	G/NrabxNVH4p6ASWcQQNKO3Ch6cZcFuyfOjUtCFxXx8M0J0H0M7iz3+vWjVqrRAu2kcHAM2DS1N
	4C31n8m0kVpkWedSGmskGU9VBHNpw9CQMAU5RwMVga5zqXT7dcGlxzKRwaAa+xgKawk0uL4yH1R
	TvFhcskUtAZ0Gn7yoF/hXVxtjlAX2ym1Mi2HN/zU1EIM3YziWVNE+g==
X-Received: by 2002:a05:7301:fc0c:b0:369:9af5:7bc9 with SMTP id 5a478bee46e88-36f75f25cecmr6718753eec.23.1794033070720;
        Fri, 06 Nov 2026 22:31:10 -0800 (PST)
Received: from LAPTOP-LJ15R92N.localdomain ([49.43.7.133])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36faa6a649csm12405728eec.26.2026.11.06.22.31.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 22:31:10 -0800 (PST)
From: Akshat Rawat <akshatrawat095@gmail.com>
To: wim@linux-watchdog.org,
	linux@roeck-us.net
Cc: linux-watchdog@vger.kernel.org,
	linux-omap@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Akshat Rawat <akshatrawat095@gmail.com>
Subject: [PATCH] watchdog: omap_wdt: use guard(mutex) to simplify locking
Date: Sat,  7 Nov 2026 06:31:50 +0000
Message-ID: <20261107063151.441-1-akshatrawat095@gmail.com>
X-Mailer: git-send-email 2.53.0
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

Replace manual mutex_lock() and mutex_unlock() calls with the modern
guard(mutex) constructor from <linux/cleanup.h>.

In each function, the mutex is held across the entire function scope.
Using guard(mutex) eliminates manual unlock boilerplate and guarantees
that the lock is released upon function exit.

Signed-off-by: Akshat Rawat <akshatrawat095@gmail.com>
---
 drivers/watchdog/omap_wdt.c | 24 +++++++++---------------
 1 file changed, 9 insertions(+), 15 deletions(-)

diff --git a/drivers/watchdog/omap_wdt.c b/drivers/watchdog/omap_wdt.c
index 2a6de73e6f0b..956d9513a81c 100644
--- a/drivers/watchdog/omap_wdt.c
+++ b/drivers/watchdog/omap_wdt.c
@@ -27,6 +27,7 @@
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
 
 #include <linux/module.h>
+#include <linux/cleanup.h>
 #include <linux/types.h>
 #include <linux/kernel.h>
 #include <linux/mm.h>
@@ -133,7 +134,7 @@ static int omap_wdt_start(struct watchdog_device *wdog)
 	struct omap_wdt_dev *wdev = to_omap_wdt_dev(wdog);
 	void __iomem *base = wdev->base;
 
-	mutex_lock(&wdev->lock);
+	guard(mutex)(&wdev->lock);
 
 	wdev->omap_wdt_users = true;
 
@@ -158,8 +159,6 @@ static int omap_wdt_start(struct watchdog_device *wdog)
 	omap_wdt_reload(wdev); /* trigger loading of new timeout value */
 	omap_wdt_enable(wdev);
 
-	mutex_unlock(&wdev->lock);
-
 	return 0;
 }
 
@@ -167,11 +166,11 @@ static int omap_wdt_stop(struct watchdog_device *wdog)
 {
 	struct omap_wdt_dev *wdev = to_omap_wdt_dev(wdog);
 
-	mutex_lock(&wdev->lock);
+	guard(mutex)(&wdev->lock);
 	omap_wdt_disable(wdev);
 	pm_runtime_put_sync(wdev->dev);
 	wdev->omap_wdt_users = false;
-	mutex_unlock(&wdev->lock);
+
 	return 0;
 }
 
@@ -179,9 +178,8 @@ static int omap_wdt_ping(struct watchdog_device *wdog)
 {
 	struct omap_wdt_dev *wdev = to_omap_wdt_dev(wdog);
 
-	mutex_lock(&wdev->lock);
+	guard(mutex)(&wdev->lock);
 	omap_wdt_reload(wdev);
-	mutex_unlock(&wdev->lock);
 
 	return 0;
 }
@@ -191,13 +189,12 @@ static int omap_wdt_set_timeout(struct watchdog_device *wdog,
 {
 	struct omap_wdt_dev *wdev = to_omap_wdt_dev(wdog);
 
-	mutex_lock(&wdev->lock);
+	guard(mutex)(&wdev->lock);
 	omap_wdt_disable(wdev);
 	omap_wdt_set_timer(wdev, timeout);
 	omap_wdt_enable(wdev);
 	omap_wdt_reload(wdev);
 	wdog->timeout = timeout;
-	mutex_unlock(&wdev->lock);
 
 	return 0;
 }
@@ -298,12 +295,11 @@ static void omap_wdt_shutdown(struct platform_device *pdev)
 {
 	struct omap_wdt_dev *wdev = platform_get_drvdata(pdev);
 
-	mutex_lock(&wdev->lock);
+	guard(mutex)(&wdev->lock);
 	if (wdev->omap_wdt_users) {
 		omap_wdt_disable(wdev);
 		pm_runtime_put_sync(wdev->dev);
 	}
-	mutex_unlock(&wdev->lock);
 }
 
 static void omap_wdt_remove(struct platform_device *pdev)
@@ -324,12 +320,11 @@ static int omap_wdt_suspend(struct platform_device *pdev, pm_message_t state)
 {
 	struct omap_wdt_dev *wdev = platform_get_drvdata(pdev);
 
-	mutex_lock(&wdev->lock);
+	guard(mutex)(&wdev->lock);
 	if (wdev->omap_wdt_users) {
 		omap_wdt_disable(wdev);
 		pm_runtime_put_sync(wdev->dev);
 	}
-	mutex_unlock(&wdev->lock);
 
 	return 0;
 }
@@ -338,13 +333,12 @@ static int omap_wdt_resume(struct platform_device *pdev)
 {
 	struct omap_wdt_dev *wdev = platform_get_drvdata(pdev);
 
-	mutex_lock(&wdev->lock);
+	guard(mutex)(&wdev->lock);
 	if (wdev->omap_wdt_users) {
 		pm_runtime_get_sync(wdev->dev);
 		omap_wdt_enable(wdev);
 		omap_wdt_reload(wdev);
 	}
-	mutex_unlock(&wdev->lock);
 
 	return 0;
 }
-- 
2.56.0.windows.4

