Received: from mail-dy2-f34.google.com (mail-dy2-f34.google.com [74.125.229.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6353C55C320
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 18:47:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790707668; cv=none; b=P7Zgwx30vpWScj1zC2PzQJMX11aH0b/nO/lMJZKp0xOb/RxGTH+I5WlMhP78TwRXA8tsmUOVW2Y/F+N/kFfP8sTl8BAx3uWaLh/NDHjNlUVaIX3HP6+AgR085sAwvOfyEzs6RKz9WLq69dmTIvCt3CU1Gg611rLSNMwNE4WZqCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790707668; c=relaxed/simple;
	bh=yiXw4ZAJ6K1lX1vgZJkcyMAh2ZgU2cmsfxm8gSeEMjE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UBrrmP6xk7HRMZ6UF2EzaVQ9fWdhiEnPZpNAdXDcy3p9rU7VNmafx+nS2v7bR7Du0m9DUaJjaFBdZs3/P5MIe4uuf9ZVbNrK2xOYVsj600t+76Z31HltwkxJxXSnvAc5IZ2+Q9Qs5q1dOZp0CzyQ4qmyNHft3oPV4TJzC38cr7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=AtVYQWnu; arc=none smtp.client-ip=74.125.229.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="AtVYQWnu"
Received: by mail-dy2-f34.google.com with SMTP id 5a478bee46e88-33be7dfcfc1so5902901eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 11:47:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1790707666; x=1791312466; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZgozAJoGL7V7A8Vx0dGILM7Wft28EEkHkLDt/QHtR3E=;
        b=AtVYQWnu6+kD4AbR1SWhUXu/kYtodlAWsshkkR4zQQU2Ut8DFA/HICPJ6+mCgREoCN
         qA48HK7ofCiCfb/PSF5tgB6pAH4VS2NePyCwLaECc6zcPqV0opBer77TwBrVpXMYE2M8
         Ai22DpElWex6zMmXHp9GBtr5rwjP5MNVSMJaU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790707666; x=1791312466;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZgozAJoGL7V7A8Vx0dGILM7Wft28EEkHkLDt/QHtR3E=;
        b=FYZNfX48Rs7CG0+e63vhnoHkVNrNx69Su0UhcD505ogE4CAF/tcVpJinJRQFxBeWJk
         dNWVeH3q+I2jEEeafSpZuxYhcmqan19/XrtkLJdOog9DnHed16D5N5DY0yhwM5R+Dj+U
         9WP+z5vR5VPvwTtK33ttAp/4ISoHjkKznxn+gLLiDLEFdf3NtF1GYCVNOCA0hiK1mrsv
         bFfv+oc48Ho9wnz8y0E2FB14VgDXHGWMQMOB4J4HHWohAFBf8K/iedrk/dcz4UQuOdYk
         ILUdSILAiTyhty3nNVUEynGUIbNc5P55V89g2CV66F6msAq7yTdljSfQeew4K1G6245N
         CKdQ==
X-Forwarded-Encrypted: i=1; AKwUvBya1juKVhdp6WTwB+iueW7Ts2dDE1CcDxx2xjiTYuce0n6fN6SnhZcz8Xo9Cy66YqASQJtQ1/EwaUfAbS0=@vger.kernel.org
X-Gm-Message-State: AFuF++lfEVmutkmpQIiu39ZuUELFAygCTEPk1QFa0j8127hcnD+AHw0I
	lnUPMfRUpRlGL53DVReFijDPgMyYXTzepuIUxPDVnzujBDp0ZH6mhf6Mi7rpweGdXg==
X-Gm-Gg: AYBFou1KZN1f3Hr0wr3GEM/1ywyTYOwlCM/U0KV8p/WsHY0eDVAFa8V3+U1LxLegPIT
	ReLcP5ygqvmb7fAEc7Ti2ro1klA2IRESFyQkvgXALk90wOTZTu/OKOEDtTaPWkIi7cjXaD4WtnM
	oSEVYj6IX2HKBfLSPmR90m2wQfbJOe6vjt9rLlSFu3JIlK2kLyLlFs6NyOn7Afv6Exdj7rzNTnD
	Rt/Wrs51H2zn7iF9NRxsDw+wYNkMljD2GnQyEkWe0JLuTYopOhFpiFusrisdNFMXZ+0opVvyVjW
	dYrm64Uu9MP+XPWp6ZWh9Xv0+G5DIDfobnPg8tVlRH9z/ydyY4cMGmevL0+J0dbuSIkNz9frubO
	V1TmimP3t2ojzm5/23cUdiOi70S16dwMYsp2sGmsyH4GWUfXJlUVFoS5Jlwr1b7ukciwz4sw3Cf
	HOO/yp8FHhd4cIgRvQqmj8iZ7mqmV+B9hZDWf9URrgSCWZbT7YTjQvUY6OuuKm4pSw2m4RYB82v
	LkxerqQX32h8MtYn0LRTI+GZofumquHy3dX
X-Received: by 2002:a05:7300:6a9c:b0:342:8ee0:1962 with SMTP id 5a478bee46e88-34c647d3a1amr230483eec.23.1790707665655;
        Tue, 29 Sep 2026 11:47:45 -0700 (PDT)
Received: from localhost ([2a00:79e0:2e7c:8:5f5a:aa9:d06d:b4a7])
        by smtp.gmail.com with UTF8SMTPSA id 5a478bee46e88-34c32072ee7sm965764eec.0.2026.09.29.11.47.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Sep 2026 11:47:44 -0700 (PDT)
From: Brian Norris <briannorris@chromium.org>
To: "Rafael J . Wysocki" <rafael@kernel.org>
Cc: Ulf Hansson <ulfh@kernel.org>,
	Douglas Anderson <dianders@chromium.org>,
	Len Brown <lenb@kernel.org>,
	linux-kernel@vger.kernel.org,
	Pavel Machek <pavel@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-pm@vger.kernel.org,
	Brian Norris <briannorris@chromium.org>
Subject: [PATCH 2/5] PM: runtime: Avoid racy clock checks for autosuspend-retry
Date: Tue, 29 Sep 2026 11:47:12 -0700
Message-ID: <20260929114714.2.Id0a3276d23d30e0b5fd4d6dca730be0f9d8fe018@changeid>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
In-Reply-To: <20260929184729.2346769-1-briannorris@chromium.org>
References: <20260929184729.2346769-1-briannorris@chromium.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The runtime PM docs clearly tell how a .runtime_suspend() implementation
can update the last-busy time (pm_runtime_mark_last_busy()) and return a
transient error code (-EBUSY or -EAGAIN) in order to rearm the
autosuspend timer. However, this check is racy, such that it will not
always rearm the timer properly.

Consider:

 1. runtime_suspend() updates last_busy
 2. long delay (scheduling, etc.)
 3. runtime_suspend() returns -EBUSY
 4. pm_runtime_autosuspend_expiration() looks up the current time
    (ktime_get_mono_fast_ns())
 5. the time from #4 suggests the "expiry" time (based on #1) is already
    in the past
 6. rpm_suspend() quits without either retry or rearm

This violates the documented expectations.

The primary problem is the racy lookup of the current time in #4. We can
avoid that by:

 * Checking whether the expiration time changed before/after the suspend
   attempt, *without* consulting the current clock for past-expiry

 * Improving pm_runtime_mark_last_busy() so that it guards against
   producing the same expiry (e.g., consider a system with a
   low-resolution clock)

Noticed by inspection, and proved out with KUnit tests which follow this
patch.

I see this pattern is utilized in at least a few drivers:

 * blk_pre_runtime_suspend() (block/blk-pm.c)
 * serial_port_runtime_suspend() (drivers/tty/serial/serial_port.c)
 * omap4_keypad_runtime_suspend() (drivers/input/keyboard/omap4-keypad.c)
 * omap_rproc_runtime_suspend() (drivers/remoteproc/omap_remoteproc.c)
 * more...

Signed-off-by: Brian Norris <briannorris@chromium.org>
---
There's a vanishingly small corner case in here still, if:

1) the monotonic clock gets an update while we're suspending

2) there are *two* mark_last_busy() calls

3) the result of those updates (backward in time) and mark_last_busy()
   (forward in time) puts us back at the same expiration.

We could potentially solve this by updating a |last_busy_counter|, and
tracking that instead. I'm not sure if it's worth the complexity though.

There's a similar corner case if somebody calls
pm_runtime_set_autosuspend_delay(), such that a shortened autosuspend
delay lands on the same expiry. This also seems vanishingly unlikely;
but this also could be solved by using a |last_busy_counter|, and
ignoring the delay entirely.

 drivers/base/power/runtime.c | 43 +++++++++++++++++++++++++-----------
 include/linux/pm_runtime.h   |  7 +++++-
 2 files changed, 36 insertions(+), 14 deletions(-)

diff --git a/drivers/base/power/runtime.c b/drivers/base/power/runtime.c
index bc5905ffc45f..2a99b7509744 100644
--- a/drivers/base/power/runtime.c
+++ b/drivers/base/power/runtime.c
@@ -162,6 +162,26 @@ static void pm_runtime_cancel_pending(struct device *dev)
 	dev->power.request = RPM_REQ_NONE;
 }
 
+/*
+ * Expiration time without considering whether it has already passed.
+ */
+static u64 __pm_runtime_autosuspend_expiration(struct device *dev)
+{
+	int autosuspend_delay;
+	u64 expires;
+
+	if (!dev->power.use_autosuspend)
+		return 0;
+
+	autosuspend_delay = READ_ONCE(dev->power.autosuspend_delay);
+	if (autosuspend_delay < 0)
+		return 0;
+
+	expires = READ_ONCE(dev->power.last_busy);
+	expires += (u64)autosuspend_delay * NSEC_PER_MSEC;
+	return expires;
+}
+
 /**
  * pm_runtime_autosuspend_expiration - Get a device's autosuspend-delay expiration time.
  * @dev: Device to handle.
@@ -176,18 +196,10 @@ static void pm_runtime_cancel_pending(struct device *dev)
  */
 u64 pm_runtime_autosuspend_expiration(struct device *dev)
 {
-	int autosuspend_delay;
-	u64 expires;
+	u64 expires = __pm_runtime_autosuspend_expiration(dev);
 
-	if (!dev->power.use_autosuspend)
-		return 0;
-
-	autosuspend_delay = READ_ONCE(dev->power.autosuspend_delay);
-	if (autosuspend_delay < 0)
+	if (!expires)
 		return 0;
-
-	expires  = READ_ONCE(dev->power.last_busy);
-	expires += (u64)autosuspend_delay * NSEC_PER_MSEC;
 	if (expires > ktime_get_mono_fast_ns())
 		return expires;	/* Expires in the future */
 
@@ -586,6 +598,7 @@ static int rpm_suspend(struct device *dev, int rpmflags)
 {
 	int (*callback)(struct device *);
 	struct device *parent = NULL;
+	u64 old_expires;
 	int retval;
 
 	trace_rpm_suspend(dev, rpmflags);
@@ -689,6 +702,7 @@ static int rpm_suspend(struct device *dev, int rpmflags)
 	}
 
 	__update_runtime_status(dev, RPM_SUSPENDING);
+	old_expires = __pm_runtime_autosuspend_expiration(dev);
 
 	callback = RPM_GET_CALLBACK(dev, runtime_suspend);
 
@@ -760,9 +774,12 @@ static int rpm_suspend(struct device *dev, int rpmflags)
 	 * autosuspend expiration time, automatically reschedule another
 	 * autosuspend.
 	 */
-	if (!dev->power.runtime_error && (rpmflags & RPM_AUTO) &&
-	    pm_runtime_autosuspend_expiration(dev) != 0)
-		goto repeat;
+	if (!dev->power.runtime_error && (rpmflags & RPM_AUTO)) {
+		u64 new_expires = __pm_runtime_autosuspend_expiration(dev);
+
+		if (new_expires && new_expires != old_expires)
+			goto repeat;
+	}
 
 	goto out;
 }
diff --git a/include/linux/pm_runtime.h b/include/linux/pm_runtime.h
index 322e3b17f987..424ac9da94ef 100644
--- a/include/linux/pm_runtime.h
+++ b/include/linux/pm_runtime.h
@@ -242,7 +242,12 @@ static inline bool pm_runtime_has_no_callbacks(struct device *dev)
  */
 static inline void pm_runtime_mark_last_busy(struct device *dev)
 {
-	WRITE_ONCE(dev->power.last_busy, ktime_get_mono_fast_ns());
+	u64 now = ktime_get_mono_fast_ns();
+
+	if (now == READ_ONCE(dev->power.last_busy))
+		now++;
+
+	WRITE_ONCE(dev->power.last_busy, now);
 }
 
 /**
-- 
2.56.0.rc1.315.gc6ed9934b7-goog

