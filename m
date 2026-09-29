Received: from mail-pz2-f40.google.com (mail-pz2-f40.google.com [74.125.228.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7A6637F32C
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 13:46:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.40
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790689605; cv=none; b=nAKITlF0lkiuEmspOwf0PmEbj9aogkILYvgcP3H33Z7wxSUXd6gY+ppFtKfnmuGCTvm9cv5PvzJKlVHU89FmwLJNxbiNMITB6n5IM5aFqFB8X4w3AhfSTQUzwhxLVJ500eAfIt181DQHKpNqikeBOtc/JtNF/rmaXJ43ulrzSuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790689605; c=relaxed/simple;
	bh=0dytRZajgSOEjIh4weHzKNsPpCIiC3HcEOUFL0v/yGY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Aiic7Y3vH4pWWgsYVEWP5CFL4WKH44h2bSod115gxOJ0OHXC7pfOPspLnbYWGu4kCPQCDT28OOXalUjD7PEYNP9cEsk+Znpt9FkPIce11GuElz0PxbCi+J0zHDM3TdUx4vY5cG4YysY/Kl6kJo47Q0fT7rKNET+jn3oQJcsLiv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P8W/BAcd; arc=none smtp.client-ip=74.125.228.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P8W/BAcd"
Received: by mail-pz2-f40.google.com with SMTP id d2e1a72fcca58-8804b59404aso1995094b3a.3
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 06:46:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790689603; x=1791294403; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7dlySU0mSke1lLfdzma52B3EyPDabqEAbPN4ka/R5Ug=;
        b=P8W/BAcdDkVY6DGpz4mIYzK+upaixnnqyItQ+IwfqXpvIvFNM2cMOxdeyh2Fupta6+
         kkqcbGrmAsHfYOAWPPqNym3i35Kx7wIT4293AY/XtHphdrd3ndYKtRg+Y8KWu2deTXng
         8n/LYwGzaxKUdKD3f9R9DCvh7zMbKuVUxX4tezh/aDjox5fwhZY9bnnsKkBAzCLj0xsO
         hil1pTWtm82O7B3gKzgmX37zy3nRvYOjTgpD3VUcAdm1jN0mMlywx5SLQTFWHmZ/J9/F
         Y9s+vgDaFjhjxef1ZlKCUrq9d92YfxkFjsRGLvHWx8Xy2uv3TmmNOljYOY5kBlFLHpPA
         ZElw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790689603; x=1791294403;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7dlySU0mSke1lLfdzma52B3EyPDabqEAbPN4ka/R5Ug=;
        b=EOtiz8S1WO5BwTLak2FKWrXkE6RbpfRjWM9aHTWuKl348EnZTyVTNpoOVyFmr5Zru9
         PwuJPsfjGq6nIvVU8Ye/tA77CoToygyrFpwHO1UUMU+EOJR3bOQVw4IjXm2UK6gbHq1z
         UcjCycudIlwOWJPzwuy6xcR3Uopu29iioa5V+9+EGTARA0Qy8zryibvt3NAdgt2D2wj5
         rm5kDJwTQxniLrCX24VUszHst5YqNJcIIXedCnhtFREJNmilrum9f2g+2ZW6p2dFR2hM
         qk8IOFo6tBRrGpMrOn+fiiGg+zCvv3XlPlnc/vCD51NPO+JAQg6m4qah1b83c5pDGpZn
         o7vw==
X-Gm-Message-State: AFuF++lT4JkplJHs+kUzYQV5pCg+Fov8UldVP1h8fMYS1uu+tMkG9SXx
	EiHWY1dH7T/s7XnKwdkl8bddiCD2+yfgekcfxI+UUPQF4OYBOHSjfasvDcbVSDvL
X-Gm-Gg: AYBFou2eg/shwv7znaa53VTAfHWJ41TxyjErPNL8R+2h2a0fhoL7x9M8vlnYVb8NYql
	gCt71LaOXT9tpkqmExqiDQv69SUGPL2llN/wzwA939I0F15YyS01JJZYALI8/HPL1MVH6icqQP4
	RFPvVETy9OdnsRWaa2w6HeQ0gik9unmqtxcnVH3cDRffYkspqnRkwLeahzFXBEK1s53RuZvMxO3
	2AIEV5MhVgH2kehUZNUpYSJ178dEEXqLphAf1b1UKuuRi7+CpwD2b26xHUe/5RQSAD8NuNkTt7g
	N5W68FIlVjQnPnDVniyMdCRjh97/swafQHntIziUd2m5RyjW5FK4tnISyc7qfabeTAyLsgKz9YE
	uavbPgsjdMXIOESshk5Sf9kFoQl6aM9U+1MWAEuy8VaSHyyIxUA4jhKb5b0CsfvrzTYdrY/62hv
	3UTyIoVuerE6MaVT/rNsUBnKv+4UmC3YuUJJ74x540FrRQVgDiMMtOkLuE1iJOtNuF3JnEdomyJ
	LcrYnSKCi9/eg==
X-Received: by 2002:a05:6a20:b40a:b0:3dd:a197:736b with SMTP id adf61e73a8af0-3de0e916abcmr14823301637.68.1790689602363;
        Tue, 29 Sep 2026 06:46:42 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-885e24eb8e4sm959867b3a.50.2026.09.29.06.46.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 06:46:41 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: linux-watchdog@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 3/8] watchdog: core: Prevent ping worker from re-arming timer on suspend
Date: Tue, 29 Sep 2026 06:46:30 -0700
Message-ID: <20260929134635.2567137-4-linux@roeck-us.net>
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

In watchdog_dev_suspend(), hrtimer_cancel() is called before
kthread_cancel_work_sync(). If the timer expired just before
hrtimer_cancel() and queued watchdog_ping_work(), the worker can run
and acquire wd_data->lock while kthread_cancel_work_sync() waits for it
to finish. Because no state flag indicates that the watchdog is
suspended, watchdog_worker_should_ping() returns true and
__watchdog_ping() re-arms wd_data->timer while the device is suspended.

Add a _WDOG_SUSPENDED internal status bit to wd_data->status, set it
under wd_data->lock in watchdog_dev_suspend(), clear it under
wd_data->lock in watchdog_dev_resume(), and check it in
watchdog_worker_should_ping(), watchdog_need_worker(), and
__watchdog_ping() so the timer cannot be armed while suspended.

Fixes: 60bcd91aafd2 ("watchdog: introduce watchdog_dev_suspend/resume")
Assisted-by: LLM
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/watchdog/watchdog_core.h |  1 +
 drivers/watchdog/watchdog_dev.c  | 15 +++++++++++----
 2 files changed, 12 insertions(+), 4 deletions(-)

diff --git a/drivers/watchdog/watchdog_core.h b/drivers/watchdog/watchdog_core.h
index ab825d9f9248..c6df5a584357 100644
--- a/drivers/watchdog/watchdog_core.h
+++ b/drivers/watchdog/watchdog_core.h
@@ -60,6 +60,7 @@ struct watchdog_core_data {
 #define _WDOG_DEV_OPEN		0	/* Opened ? */
 #define _WDOG_ALLOW_RELEASE	1	/* Did we receive the magic char ? */
 #define _WDOG_KEEPALIVE		2	/* Did we receive a keepalive ? */
+#define _WDOG_SUSPENDED		3	/* Suspended ? */
 };
 
 /*
diff --git a/drivers/watchdog/watchdog_dev.c b/drivers/watchdog/watchdog_dev.c
index 50224877ff49..e38f1ef8e683 100644
--- a/drivers/watchdog/watchdog_dev.c
+++ b/drivers/watchdog/watchdog_dev.c
@@ -81,6 +81,9 @@ static inline bool watchdog_need_worker(struct watchdog_device *wdd)
 	unsigned int hm = wdd->max_hw_heartbeat_ms;
 	unsigned int t = wdd->timeout * 1000;
 
+	if (test_bit(_WDOG_SUSPENDED, &wdd->wd_data->status))
+		return false;
+
 	/*
 	 * A worker to generate heartbeat requests is needed if all of the
 	 * following conditions are true.
@@ -154,9 +157,10 @@ static int __watchdog_ping(struct watchdog_device *wdd)
 	now = ktime_get();
 
 	if (ktime_after(earliest_keepalive, now)) {
-		hrtimer_start(&wd_data->timer,
-			      ktime_sub(earliest_keepalive, now),
-			      HRTIMER_MODE_REL_HARD);
+		if (!test_bit(_WDOG_SUSPENDED, &wd_data->status))
+			hrtimer_start(&wd_data->timer,
+				      ktime_sub(earliest_keepalive, now),
+				      HRTIMER_MODE_REL_HARD);
 		return 0;
 	}
 
@@ -207,7 +211,7 @@ static bool watchdog_worker_should_ping(struct watchdog_core_data *wd_data)
 {
 	struct watchdog_device *wdd = wd_data->wdd;
 
-	if (!wdd)
+	if (!wdd || test_bit(_WDOG_SUSPENDED, &wd_data->status))
 		return false;
 
 	if (watchdog_active(wdd))
@@ -1318,6 +1322,8 @@ int watchdog_dev_suspend(struct watchdog_device *wdd)
 	mutex_lock(&wd_data->lock);
 	if (watchdog_worker_should_ping(wd_data))
 		ret = __watchdog_ping(wd_data->wdd);
+	if (!ret)
+		set_bit(_WDOG_SUSPENDED, &wd_data->status);
 	mutex_unlock(&wd_data->lock);
 
 	if (ret)
@@ -1346,6 +1352,7 @@ int watchdog_dev_resume(struct watchdog_device *wdd)
 	 * ping worker if needed.
 	 */
 	mutex_lock(&wd_data->lock);
+	clear_bit(_WDOG_SUSPENDED, &wd_data->status);
 	if (watchdog_worker_should_ping(wd_data))
 		ret = __watchdog_ping(wd_data->wdd);
 	mutex_unlock(&wd_data->lock);
-- 
2.45.2

