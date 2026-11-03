Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793744590;
	b=Voetdi9TVIh1r/+YPh78kqISlwb4pf3BOQsyC+XkXBp0uI5zZoLdGKqqOoiIHUt5Abh+
	 KtKXhIZZvRX+n/sfKW3H2T5qgByPf4tvPAxtrgKmzl2yLBeEcNQZXOIpFmzQ+AJJPOxZi
	 7I7hJXB0bdTgUJXVZYjoNQ7cwb1axJfph0HCEyyFKOSRl+8IQGZmoMa8Xwh2nNXwCO7T4
	 iJgogUHWbTsXD5dDOesqCjal25uHnjBVQg6tVd9x4hXB79qKYt9QYsp/Xblj72fUb0qRy
	 S4QmX4Bj9IPkctQaJ3cs0Q5z1EobY6T/7oI/KZchHNw712xgrY9ujOz5YOh+Y71zRfg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793744590;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=jbi/k6dB+LyAzak7dxYir2R3Vy4OMdTuQduaHbYugqY=;
	b=P2PhtMM9Y1vsWXEzHnw2Ge8WebcISHzOgbwj2FeibEjl/jWY5UQ0+gJzQAycX0mhv4ZW
	 +M+odPTBbO+S0N0JINvgtKnAJ8fjcnRmIce2xz6Tb2A4iXCbr37TddGPVOr/wIDfinbEK
	 pvLtFjzNJ4Cjl1g5EoZaUB2dGnUIkLaGbxFYm5IlqqCWx7iT5tEpSCmO1/x6zfSlbSLTg
	 ReNwRP64lpiX34ESjP2HN7Oj5sjAGAbnEnGebC9teRFkqv9qnqKF4ZysqZzF3Jo0JOsUy
	 1QYR0HJugq1HBU7IdqyR3Dj/NusYe2gSDWoDftlu+7mg+yOf7rNMU9wT6TGpPx3+vCw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b="i8F/FmSk";
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24DD7606D807
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 22:23:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 24DD7606D807
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=i8F/FmSk
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-36cad25b8b0so18410eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 14:23:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793744589; x=1794349389; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jbi/k6dB+LyAzak7dxYir2R3Vy4OMdTuQduaHbYugqY=;
        b=i8F/FmSkCqkFjynaD9om94gzsKAGwz5oT5xjASpl2KK2eV+QrXHq713LMUENL8Vq93
         Tji54Do16pdceRX2aXyWj1eyWfbwM1DNdP7UUEibQnYrjg8egQHUyJLtAZ3cv9J9pEaZ
         8XvrY67D2BMO5v6TUdkb5Jp0Of/a9qMBnu1uo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793744589; x=1794349389;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jbi/k6dB+LyAzak7dxYir2R3Vy4OMdTuQduaHbYugqY=;
        b=mRayfsQAsB2NqJ9YxU21MQnmCVQwBPTJuE3wkI+P6hUqoOpMizXKLTAShx6myFfego
         Fs0mfz47nxQr9dfVmSmRRQoTIZg9IKDKv4GSTNbRL/gBw3k7tZSPq2eYSbzAhQCe1p9E
         FFumHKKdB6bF3BEgtQc14rKywLpj7y2FD/inCtkNdeiq/iOQxM8L/DZXyn1wbpSmkrJq
         YYuV2nBJubNmTnucRcTOnUJNcistApjscfSh5GY3bNM+jXNH/y4xWjOXwupZvfVg8UUa
         EGSKQ6tWezX6QkE8VMNMUCYK1JPfT/Mj+HD/sucESu9WQ3gXtDjM90PYhRZBCbsQ38is
         rLsg==
X-Forwarded-Encrypted: i=1; AKwUvBz5z10ZNxf4WJdAJ4zBpRAIookt2B6TH6q63Si3v/YF0I6iNnd4nA1IwQlzqS0MmkdvEGDcY1YQ7Yg0vEw=@vger.kernel.org
X-Gm-Message-State: APuU4Z8DHzm6gRQF0tE3WYX4SH8n652JAzdak5Xytnkyg4WtTOEHG+Yv
	2U+/M9OAAGFtB3ORubmVb676CS4d6YZvmHZ5VQyT2ktwoSreyBfMxsXCD1ZATo59Jw==
X-Gm-Gg: AYBFou0EANqWIvTedQva7etwYpP4rzPPzK66GEWp4zi2VDI5JU0a3W6c7Xt/d9q21Cs
	HEmVDC9PsZJt8S8CUqVoFbm7F2qJDmILGmvuQhSqAUaBwiYDrjQdsW+h+tcVjJAVGW7vhffM8yd
	mr7+V4h55gUU+jXkA9abQe79VrwF8gnQ0jEe0GV9oyjj6vIkW6WVZBGWoJXOHvB/QZthLGAY0Pf
	7aqgy5PQWtWHJz1DowKzEqcWNU5iy3MTBDti02UzZt4hGk03e5qEEkouBotad9OFvFwxHv6by+L
	DKI1cMSFksVYfvoidW1PphLGIPHWXwB8LQOL63/EtblfBmGYKGSUzbnWMSEdW9Ed7fdSZSO7HMM
	RvztEaSCfoCKhZUpDEctqyhtg5r8MxVt7e0sQeLfj2PPbT2hFOY/XnjBeosWqi6lPvqAExj98AI
	YcIZDaYDGIkMFJ8ezBD1+SNKkPLEpgZqAA0ACQwbREIfRmkQvEW7iNNQMxUJ4CbZ7sS6PGDkYIG
	y+gTsSLKvlTmgIYe7TGVhiZXhScSw2kwDFu4hXgpcXcV0H6vT9oG+yMPq+dJqRlsK5WwYpQVSmn
	456fHrLQ8ABto8rAtLXJaDQIVI6/W+/ySBIjPaYgILjpXz+M97jTPIQKvIkD9cMTUeWu
X-Received: by 2002:a05:693c:20c3:10b0:36a:12c4:8bd6 with SMTP id 5a478bee46e88-36a423ea9ccmr21662751eec.22.1793744589175;
        Tue, 03 Nov 2026 14:23:09 -0800 (PST)
Received: from localhost ([2a00:79e0:2e7c:8:ab71:b3df:693a:fbf2])
        by smtp.gmail.com with UTF8SMTPSA id 5a478bee46e88-36ca3958746sm1046926eec.22.2026.11.03.14.23.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 14:23:08 -0800 (PST)
From: Brian Norris <briannorris@chromium.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Fabrice Gasnier <fabrice.gasnier@st.com>,
	linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Ulf Hansson <ulfh@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-iio@vger.kernel.org,
	Andy Shevchenko <andy@kernel.org>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Brian Norris <briannorris@chromium.org>
Subject: [PATCH v2 3/5] PM: runtime: Propagate last_busy from dependent to dependency
Date: Tue,  3 Nov 2026 14:14:41 -0800
Message-ID: <20261103141442.v2.3.I40c0bc917fa0b13111251844e9a54feb1d9cd7d2@changeid>
X-Mailer: git-send-email 2.56.0.398.g882cbad275-goog
In-Reply-To: <20261103221717.3840215-1-briannorris@chromium.org>
References: <20261103221717.3840215-1-briannorris@chromium.org>
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

When a child device suspends, it does not update the last_busy timestamp
for its parent. If that parent configured autosuspend and didn't
otherwise maintain its last_busy timestamp, it may now be immediately
eligible to suspend. This is probably not expected -- the parent should
wait for its autosuspend delay before suspending.

The effect of this behavior is that a parent device may suspend sooner
than its autosuspend delay, simply because its usage was accounted by
its children, and not by direct references to the parent device.

This was noticed in several cases, and some have implemented
workarounds, such as in commit c537d3457542 ("iio: adc: stm32-adc: fix
runtime autosuspend delay when slow polling"). At the same time, Ulf
suggested these problems "should be solved in the runtime PM core" [1].

Instead of working around the problem in drivers, we propagate last_busy
timestamps from a dependent device to its dependencies any time it may
allow a dependency to suspend -- i.e., when releasing a refcount for its
parent or suppliers. We take care to only propagate the timestamp if it
is larger than the existing busy timestamp.

Note that this works best if the dependent device is using autosuspend
(and therefore updates its last_busy timestamps appropriately), but even
for a non-autosuspend child, this is still somewhat useful --
non-autosuspend devices still automatically update their last_busy every
time they resume.

Link: https://lore.kernel.org/all/CAPDyKFp=KTf8=zGBSzPYqhjnZpY8xwvjCeM1e-WTKT1QLSxaDA@mail.gmail.com/ [1]
Signed-off-by: Brian Norris <briannorris@chromium.org>
---
Cc: Ulf Hansson <ulfh@kernel.org>

Changes in v2:
 * Update comments to explain when/why rpm_propagate_last_busy()
   performs the update

 drivers/base/power/runtime.c | 23 ++++++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)

diff --git a/drivers/base/power/runtime.c b/drivers/base/power/runtime.c
index 2a117d6a776f..dd306cbabcd3 100644
--- a/drivers/base/power/runtime.c
+++ b/drivers/base/power/runtime.c
@@ -318,6 +318,22 @@ static int rpm_get_suppliers(struct device *dev)
 	return 0;
 }
 
+/*
+ * Propagate last_busy timestamp from one device to another, typically when a
+ * device (@dev) releases a reference count on a dependency (@target) and might
+ * allow it to (auto)suspend. This can, for example, prevent overactive suspend
+ * when a dependency's usage is primarily driven by one of its dependents.
+ */
+static void rpm_propagate_last_busy(struct device *dev, struct device *target)
+{
+	s64 busy = atomic64_read(&dev->power.last_busy);
+	s64 target_busy = atomic64_read(&target->power.last_busy);
+
+	while (target_busy < busy)
+		if (atomic64_try_cmpxchg(&target->power.last_busy, &target_busy, busy))
+			return;
+}
+
 /**
  * pm_runtime_release_supplier - Drop references to device link's supplier.
  * @link: Target device link.
@@ -348,6 +364,7 @@ static void __rpm_put_suppliers(struct device *dev, bool try_to_suspend)
 		if (!device_link_test(link, DL_FLAG_PM_RUNTIME))
 			continue;
 
+		rpm_propagate_last_busy(dev, link->supplier);
 		pm_runtime_release_supplier(link);
 		if (try_to_suspend)
 			pm_request_idle(link->supplier);
@@ -710,6 +727,8 @@ static int rpm_suspend(struct device *dev, int rpmflags)
 
 	if (dev->parent) {
 		parent = dev->parent;
+		if (!parent->power.ignore_children)
+			rpm_propagate_last_busy(dev, parent);
 		atomic_add_unless(&parent->power.child_count, -1, 0);
 	}
 	wake_up_all(&dev->power.wait_queue);
@@ -1368,8 +1387,10 @@ int __pm_runtime_set_status(struct device *dev, unsigned int status)
 		goto out_set;
 
 	if (status == RPM_SUSPENDED) {
-		atomic_add_unless(&parent->power.child_count, -1, 0);
 		notify_parent = !parent->power.ignore_children;
+		if (notify_parent)
+			rpm_propagate_last_busy(dev, parent);
+		atomic_add_unless(&parent->power.child_count, -1, 0);
 	} else {
 		spin_lock_nested(&parent->power.lock, SINGLE_DEPTH_NESTING);
 
-- 
2.56.0.398.g882cbad275-goog

