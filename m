Received: from mail-pz2-f41.google.com (mail-pz2-f41.google.com [74.125.228.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63F9552ED3A
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 13:46:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790689610; cv=none; b=iWAzBiYgtVEepi6vlYwpldZoMV+EAYJBtBuD3Bb/APm2WbDbCVMvifmPapkumOX9pToPDdAQoRqrgk3PqTX6Aog0jX/AqdIST20GszEmJoatVkJ57b3SOnyxQyXmqqdHqTN2+4ynMC/umzPTT8PS6tjOarwb3+DqmRFh5POxO10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790689610; c=relaxed/simple;
	bh=/Ln9cvecRZsSXp8YZLqsukCjgZVnBHAur/gE3m+Pgi0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=o1aBP9dsJlJBAGUzPfL8Yl00eEFNlUUlpkf5YeRg/cNdPAShnCLCQm6PD9TkAfbBs91Q7c2V+4KLzwb01PcEk3j8DUlTNLC+Su5xA37a64UG+c64LgQPKi/N6GQKUfGQpvRk9qY4+3Ia6j9wPsgej3PSRWJVW7wRlu3MrW7ueIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UiVw+s9V; arc=none smtp.client-ip=74.125.228.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UiVw+s9V"
Received: by mail-pz2-f41.google.com with SMTP id d2e1a72fcca58-86efece610cso2092366b3a.0
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 06:46:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790689607; x=1791294407; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wLSIVEXCZm5JMV1sKmrMWiCu09QUGmTXVwkGOYuvzFg=;
        b=UiVw+s9VRE3QVuqwFq/zRmI6Pu60Q4VDufpxPQ9BZUfaezLda5g6K0/FgauUpvx9g4
         4B6AHniUEw4tTyDG3s3dB4kHQm0RQ6Pon3lWqQbFxAYCbROxsODhPpBw9OGiUZ5eXzpp
         gx3OW8Ywq3KcQQ0N32si7WDHgeV7foqFU3SMsYuylqTrbB11iGx0ICCRiH/ahJz6acNU
         CmZO3a3Qt8mHbHGPVgp0jS3ZY4GONp06q0mnLdldFjYgj9VqLPJkk5cNoAFisLWZ6OXy
         N9kOHiAkZk/FVJHfx3gAualQpshx3cue/v4v/gD3zJ/GBxOJBJnKz/OyQdvnvNCgxGOl
         Kn4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790689607; x=1791294407;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wLSIVEXCZm5JMV1sKmrMWiCu09QUGmTXVwkGOYuvzFg=;
        b=b62ybassf1tst5W/xep3qzZAd62XhHgCSAXOQHH1to2dXleG6236eG/HQhJN8RZ2UK
         cqP6hcyT5QlFxK1/i/qzKNC99QM/AZicjaxWkqgBDk1U6wryQWy3102LRIIkNDkPs3my
         xzkZ1AfjJKLWKE6xF8WZxYxNYJ8u7QnZmV9x0sZm8IHerN4BgPSVLVacd5a3K5tthbIJ
         ms+/ccW+dtKsCk441gDiYVvlLitFVHimMqXrGbe3CqN1xJvUK+uincmSI2OX9IHJi3Ys
         9SVDSHKcNMMsRCUdOVGO+U3P0n8cUfQqLnYCYasKiSIvEuTByHjG3dIZkhWhCmd2zDxU
         gofg==
X-Gm-Message-State: AFuF++lE2F5kCVg0lbEJ/2CV67P/LE7e3NakS2/Y21uluBoJM3IYb3PF
	F2e0BmjNcNS7ZlZ0gFjnC2KQboEHw+UmC0/ARsVOtgZu1v/iEy+kMTGK
X-Gm-Gg: AYBFou2U4Thsid2mHAaxVJtxiYqNqetJmIw+h8OdvesYpiE1qeZL7VnEYMM9PK0Nwq8
	YGEInU2i9IZU73oyWtO41i3xqVKIMCFyN3k1+RA/g1cMeWgq07t0+a6zU7SpOLaEJpEcD4zUyYl
	K8Bh2WCOGQG2kFW1Danp32W77Ve1DEfif7cB5GY+VJLHCr/aC4BJ/thd0sJMWqOExQidJqS8xlY
	M7u1Vdr6T4UFf8zh5YM1j8ijv6q9cekHxaNmgUnkpVv0klBHFeWrDrv2gNdOQ48gV8Yf083b2Qu
	Yqje440nWM8Dm+vQ+kjos8GE3QNebWuxz8Oq93Ll2kz0D+FM93Dixjg+od+PYjcG9XoB43rD7x0
	qnOlxp4SY5Gaexq1lZH/T2v2UIy896fh8hGM98PhGLM05qIDK+TJyXg7xXmegTcr8rp7dnyLpwG
	kr0vzD+3ahhzH4QYboc/kAT+PulcXUIOhvDi0IBB7cX8+AJ+NHHVRoQ1dj75EcB8Fs4s9r6FCQw
	q64bNmdnTkR
X-Received: by 2002:a05:6a00:1746:b0:882:1b4d:1847 with SMTP id d2e1a72fcca58-8821b4d6b44mr6730958b3a.39.1790689606530;
        Tue, 29 Sep 2026 06:46:46 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-885defdd2dcsm944649b3a.1.2026.09.29.06.46.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 06:46:46 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: linux-watchdog@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 6/8] watchdog: core: Cancel timer if cdev_device_add() fails
Date: Tue, 29 Sep 2026 06:46:33 -0700
Message-ID: <20260929134635.2567137-7-linux@roeck-us.net>
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

If misc_register() exposed the device to userspace before cdev_device_add()
is called, a concurrent watchdog_open() could start the watchdog and arm
wd_data->timer as well as the pretimeout timer. Also, if the hardware
watchdog was already running, watchdog_open() expects the device and module
references to have been acquired prior to opening.

If cdev_device_add() then fails, the error path drops the device reference
but fails to stop the watchdog, cancel the timers, and stop the worker,
leaving the watchdog active and timers armed that can later fire and
dereference freed memory. Furthermore, if a concurrent watchdog_open() saw
hw_running == true before cdev_device_add() was called, it skipped taking
its own device reference, allowing put_device() on the error path to free
wd_data while the file descriptor is still open. Similarly, when
unregistering a running watchdog that is not currently open, the extra
hw_running module and device references were never released.

Fix the problem by initializing wd_data and taking the running-watchdog
references before exposing the device via misc_register(), stopping the
watchdog and canceling both the heartbeat and pretimeout timers and
stopping the worker on registration failure, and releasing unclaimed
running-watchdog references on registration failure and unregistration.

Fixes: ee142889e32f ("watchdog: Introduce WDOG_HW_RUNNING flag")
Assisted-by: LLM
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/watchdog/watchdog_dev.c | 91 ++++++++++++++++++++-------------
 1 file changed, 55 insertions(+), 36 deletions(-)

diff --git a/drivers/watchdog/watchdog_dev.c b/drivers/watchdog/watchdog_dev.c
index edf2cccd1c0e..31567ffbfc23 100644
--- a/drivers/watchdog/watchdog_dev.c
+++ b/drivers/watchdog/watchdog_dev.c
@@ -1047,6 +1047,7 @@ static const struct class watchdog_class = {
 static int watchdog_cdev_register(struct watchdog_device *wdd)
 {
 	struct watchdog_core_data *wd_data;
+	bool hw_running;
 	int err;
 
 	wd_data = kzalloc_obj(struct watchdog_core_data);
@@ -1082,46 +1083,10 @@ static int watchdog_cdev_register(struct watchdog_device *wdd)
 		      HRTIMER_MODE_REL_HARD);
 	watchdog_hrtimer_pretimeout_init(wdd);
 
-	if (wdd->id == 0) {
-		old_wd_data = wd_data;
-		watchdog_miscdev.parent = wdd->parent;
-		err = misc_register(&watchdog_miscdev);
-		if (err != 0) {
-			pr_err("%s: cannot register miscdev on minor=%d (err=%d).\n",
-				wdd->info->identity, WATCHDOG_MINOR, err);
-			if (err == -EBUSY)
-				pr_err("%s: a legacy watchdog module is probably present.\n",
-					wdd->info->identity);
-			old_wd_data = NULL;
-			wdd->wd_data = NULL;
-			put_device(&wd_data->dev);
-			return err;
-		}
-	}
-
 	/* Fill in the data structures */
 	cdev_init(&wd_data->cdev, &watchdog_fops);
 	wd_data->cdev.owner = wdd->ops->owner;
 
-	/* Add the device */
-	err = cdev_device_add(&wd_data->cdev, &wd_data->dev);
-	if (err) {
-		pr_err("watchdog%d unable to add device %d:%d\n",
-			wdd->id,  MAJOR(watchdog_devt), wdd->id);
-		if (wdd->id == 0) {
-			misc_deregister(&watchdog_miscdev);
-			mutex_lock(&old_wd_data_lock);
-			old_wd_data = NULL;
-			mutex_unlock(&old_wd_data_lock);
-		}
-		mutex_lock(&wd_data->lock);
-		wd_data->wdd = NULL;
-		wdd->wd_data = NULL;
-		mutex_unlock(&wd_data->lock);
-		put_device(&wd_data->dev);
-		return err;
-	}
-
 	/* Record time of most recent heartbeat as 'just before now'. */
 	wd_data->last_hw_keepalive = ktime_sub(ktime_get(), 1);
 	watchdog_set_open_deadline(wd_data);
@@ -1141,7 +1106,55 @@ static int watchdog_cdev_register(struct watchdog_device *wdd)
 				wdd->id);
 	}
 
+	if (wdd->id == 0) {
+		old_wd_data = wd_data;
+		watchdog_miscdev.parent = wdd->parent;
+		err = misc_register(&watchdog_miscdev);
+		if (err != 0) {
+			pr_err("%s: cannot register miscdev on minor=%d (err=%d).\n",
+				wdd->info->identity, WATCHDOG_MINOR, err);
+			if (err == -EBUSY)
+				pr_err("%s: a legacy watchdog module is probably present.\n",
+					wdd->info->identity);
+			old_wd_data = NULL;
+			goto err_clear;
+		}
+	}
+
+	/* Add the device */
+	err = cdev_device_add(&wd_data->cdev, &wd_data->dev);
+	if (err) {
+		pr_err("watchdog%d unable to add device %d:%d\n",
+			wdd->id,  MAJOR(watchdog_devt), wdd->id);
+		if (wdd->id == 0) {
+			misc_deregister(&watchdog_miscdev);
+			mutex_lock(&old_wd_data_lock);
+			old_wd_data = NULL;
+			mutex_unlock(&old_wd_data_lock);
+		}
+		goto err_clear;
+	}
+
 	return 0;
+
+err_clear:
+	mutex_lock(&wd_data->lock);
+	hw_running = watchdog_hw_running(wdd);
+	if (watchdog_active(wdd))
+		watchdog_stop(wdd);
+	watchdog_hrtimer_pretimeout_stop(wdd);
+	if (hw_running && !test_bit(_WDOG_DEV_OPEN, &wd_data->status)) {
+		module_put(wdd->ops->owner);
+		put_device(&wd_data->dev);
+	}
+	wd_data->wdd = NULL;
+	wdd->wd_data = NULL;
+	mutex_unlock(&wd_data->lock);
+
+	hrtimer_cancel(&wd_data->timer);
+	kthread_cancel_work_sync(&wd_data->work);
+	put_device(&wd_data->dev);
+	return err;
 }
 
 /**
@@ -1154,6 +1167,7 @@ static int watchdog_cdev_register(struct watchdog_device *wdd)
 static void watchdog_cdev_unregister(struct watchdog_device *wdd)
 {
 	struct watchdog_core_data *wd_data = wdd->wd_data;
+	bool hw_running;
 
 	cdev_device_del(&wd_data->cdev, &wd_data->dev);
 	if (wdd->id == 0) {
@@ -1164,6 +1178,7 @@ static void watchdog_cdev_unregister(struct watchdog_device *wdd)
 	}
 
 	mutex_lock(&wd_data->lock);
+	hw_running = watchdog_hw_running(wdd);
 	if (watchdog_active(wdd) &&
 	    test_bit(WDOG_STOP_ON_UNREGISTER, &wdd->status)) {
 		watchdog_stop(wdd);
@@ -1171,6 +1186,10 @@ static void watchdog_cdev_unregister(struct watchdog_device *wdd)
 
 	watchdog_hrtimer_pretimeout_stop(wdd);
 
+	if (hw_running && !test_bit(_WDOG_DEV_OPEN, &wd_data->status)) {
+		module_put(wdd->ops->owner);
+		put_device(&wd_data->dev);
+	}
 	wd_data->wdd = NULL;
 	wdd->wd_data = NULL;
 	mutex_unlock(&wd_data->lock);
-- 
2.45.2

