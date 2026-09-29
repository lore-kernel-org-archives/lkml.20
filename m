Received: from mail-pj2-f40.google.com (mail-pj2-f40.google.com [74.125.227.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF67E52E072
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 13:46:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790689606; cv=none; b=WU/N4RzD7Vn8XArAtKbaIm88xqlMUC2rnXFXCwVnALuMYZxSXQaWcfCoRxWGBp+5AH4gJrwTuQruGHrrgZqtlEo2a9XOJf3cSt9KJnuQLryJoyWuhv2iZ8RUI6i6kXgwuoeBRK1KyicAaBgBHRRXmBd678NnBEME2p7zt1PMsos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790689606; c=relaxed/simple;
	bh=O0jSxHp3ZniF2Dgeh2TZRtCl+aZXMHqxbUHCN2wil/Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QugikFN+dWnHSv+251ZuRScpzCDBNU8sIiq07b9s9FqXnN2WAnTZ/PCa2IAlpzpy1i6pIeKrPRqTww7PkVruMx9Cv2p8yOfMLeTi4HzpvRoHaT9IkmAhsi0Q6Nnx9N0ZkBT64oz+HGT8CKhYGQpmPD2+/6s841GeYkeVQ4+CY3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F3i5/99x; arc=none smtp.client-ip=74.125.227.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F3i5/99x"
Received: by mail-pj2-f40.google.com with SMTP id 98e67ed59e1d1-3a0f64df6a6so1385466a91.3
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 06:46:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790689604; x=1791294404; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ekAPfquzfkAkJNZNNr6C59y2Oc/63/KuxH6jYM91CyM=;
        b=F3i5/99xec69Oib7aetizCI/uc4JOTm8l1l+yNqJ9KB9MTww+9cBsnhzxbSLjnojwA
         zieUcCtvTkH6F6kgxMN3ravZFQlxEfptdCPD78sf2XrqeQwGLR2akOgnaMzZjwYE4uAM
         PEMdzcF3Ve5vR2VICtV61K/MBv3umFjpvGzAz0IzIz97Er1e3wcg8MvQIdYRE+P+4Dk/
         Y68WDNzN52nYldvE/8BTtNpBQalTgCVpIoxVrkvOGzOKhM01AtuA+OUyK3TPySuYqGnX
         9Xx2Vbt885WE2nHrdbDdc7wkCRGQS4+dCdxCGUUbu3VOXVMVpSVKTibXvXaHtlNvrUXQ
         dG0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790689604; x=1791294404;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ekAPfquzfkAkJNZNNr6C59y2Oc/63/KuxH6jYM91CyM=;
        b=o77TS29/4uHmiShvrsU0mBt1utRLnOxHcn9L7p0j5QXOwzG315oQCRfBbRt1yQc86+
         212ipZCxHc/UANgsi5f9u6ZZMiu9ShnS6ujiO8wh8xjl+dCwwqQOrpz4TSs0I7yfVkBB
         lZQ1m0uogv5gl6XIhS7Qt4WcpYG29uJOwiCWRrz9AOxZx52lU3qwLxmMgRFeJL7f9gzu
         ZHlLRfmLZzqp0L0PVQieBiNVkulFdwAVBsrjWprb6K60ymjeQcOP1Vo186ul9xJt2KTJ
         AJsbboJ0C+bymIyoGYDkTHYP3dtCgB4KOTSP+A9oBKGTs2FA7BbjojE2W8NX/z3LqT+S
         m1PA==
X-Gm-Message-State: AFq9FYKGqi32CQUwIB5ZwEeFn/XWx0EN6qERfW4BMOIe6ettH8S9+JNL
	ckmZUik0YNfIzet8a2gElPN2xxoM93i6A6LPf3kjK9hIxArPu7AKgXB2
X-Gm-Gg: AYBFou0xTdYU3zw8hGrvVx4N6kl6wT0oOofPUnuF1csmw30wjixxecu6Xn6B867bQAt
	YQ2c/ladwJxu+LcQWxHisEIcloejltl/mPvBj6d7fXjJuUFqRETWVg8bnVoaJTiZQulbwXd5UYu
	yEvW3ZpYrnr3emj6Wy5GW9z8TWQoAmJnZGKqliuXGW8FAzLKYX+P8f0glR+H4+NNRO2lHJ522g6
	yRkyoMEdy95Lv7s1/dTpDHsQc79PQY3YSONZ4fjuwD+4t0eH3xG0+qZvo3YdYwzq8Qj4VRu+P6G
	8YyUfLw6IypyamPNjBeGzXDS+qu4A7RQcSSbFBanWAmcSQibrwf1dGKmVFbmOingAM+oP7Sz4kH
	B8MSWgPDyeyvoOSSRQRXF3FILxPyYSs2CRA9N7MPL15p1VTP1DPV3kUUUl/i4H71l+esQx9LCXb
	5wbkFrr+YkmoaDl7Q21UzJfpY1YhkyF4kJpGX4LejCPpwWEJ4IRC9qN0/zTIAPAe0OzgO9ggqzK
	Vl2pOpxzT8P
X-Received: by 2002:a17:90a:902:b0:3a0:d9ae:4f3c with SMTP id 98e67ed59e1d1-3a0d9aef037mr5681677a91.18.1790689604078;
        Tue, 29 Sep 2026 06:46:44 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a498057a62sm5929869a91.13.2026.09.29.06.46.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 06:46:43 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: linux-watchdog@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 4/8] watchdog: core: Stop pretimeout hrtimer on suspend
Date: Tue, 29 Sep 2026 06:46:31 -0700
Message-ID: <20260929134635.2567137-5-linux@roeck-us.net>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260929134635.2567137-1-linux@roeck-us.net>
References: <20260929134635.2567137-1-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

During system suspend, watchdog_dev_suspend() pings the watchdog (which
restarts the software pretimeout hrtimer) and stops the keepalive ping
worker, but fails to stop the pretimeout hrtimer. Because
CLOCK_MONOTONIC continues ticking until the system fully suspends, a
suspend process taking longer than the configured pretimeout will
trigger a spurious pretimeout event.

Stop the pretimeout hrtimer in watchdog_dev_suspend(), prevent
watchdog_hrtimer_pretimeout_start() from starting it while the watchdog
is suspended, and restart it in watchdog_dev_resume() if the hardware
watchdog is running.

Fixes: 60bcd91aafd2 ("watchdog: introduce watchdog_dev_suspend/resume")
Assisted-by: LLM
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/watchdog/watchdog_dev.c                | 3 +++
 drivers/watchdog/watchdog_hrtimer_pretimeout.c | 3 ++-
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/watchdog/watchdog_dev.c b/drivers/watchdog/watchdog_dev.c
index e38f1ef8e683..af756ee228b2 100644
--- a/drivers/watchdog/watchdog_dev.c
+++ b/drivers/watchdog/watchdog_dev.c
@@ -1334,6 +1334,7 @@ int watchdog_dev_suspend(struct watchdog_device *wdd)
 	 * suspended
 	 */
 	hrtimer_cancel(&wd_data->timer);
+	watchdog_hrtimer_pretimeout_stop(wdd);
 	kthread_cancel_work_sync(&wd_data->work);
 
 	return 0;
@@ -1355,6 +1356,8 @@ int watchdog_dev_resume(struct watchdog_device *wdd)
 	clear_bit(_WDOG_SUSPENDED, &wd_data->status);
 	if (watchdog_worker_should_ping(wd_data))
 		ret = __watchdog_ping(wd_data->wdd);
+	if (watchdog_hw_running(wdd) && !ret)
+		watchdog_hrtimer_pretimeout_start(wdd);
 	mutex_unlock(&wd_data->lock);
 
 	return ret;
diff --git a/drivers/watchdog/watchdog_hrtimer_pretimeout.c b/drivers/watchdog/watchdog_hrtimer_pretimeout.c
index 49a05ea60c97..5c88e6467994 100644
--- a/drivers/watchdog/watchdog_hrtimer_pretimeout.c
+++ b/drivers/watchdog/watchdog_hrtimer_pretimeout.c
@@ -31,7 +31,8 @@ void watchdog_hrtimer_pretimeout_start(struct watchdog_device *wdd)
 {
 	if (!(wdd->info->options & WDIOF_PRETIMEOUT) &&
 	    wdd->pretimeout &&
-	    !watchdog_pretimeout_invalid(wdd, wdd->pretimeout))
+	    !watchdog_pretimeout_invalid(wdd, wdd->pretimeout) &&
+	    !test_bit(_WDOG_SUSPENDED, &wdd->wd_data->status))
 		hrtimer_start(&wdd->wd_data->pretimeout_timer,
 			      ktime_set(wdd->timeout - wdd->pretimeout, 0),
 			      HRTIMER_MODE_REL);
-- 
2.45.2

