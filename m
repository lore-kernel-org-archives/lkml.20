Received: from mail-dl2-f12.google.com (mail-dl2-f12.google.com [74.125.229.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 110FD49B473
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 23:07:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790982449; cv=none; b=UHhRXfj+pqlIXNDs7ri7Nb3NDUBMMT7SmU3eeu/eIEy4Bg7vhvLNTAkPTww1EOzuFpOYtu7+uhQ+iwNEw18TLNyv5MINZWsJ+SP+jBOiNNcz8He72SYkXDfjNI35zFXmbOyR5uvDcMMAelQZz4x0zElfEGDxkHmQZ2EYTP+muq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790982449; c=relaxed/simple;
	bh=ojqUoeadyLtRgHpE4QSBZ8jr4q1a9kCTFa/MCi0AEBc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QiGD5OjEX1V3wHmHH8rDsaMoBxiApXZ1ZrqEOqKfE+x4l9CYC7wzZMwxv+6Hg3EW3vuj3PxNuRtfiD3PPtkyP4RuUIECJPBzoZE9rHLSNfzxUhxD5sIUrw2V5PijhcPMeNKWKtf5uQY8C+HkeOLR6mAHlr8PMIDaFgZdN02jjYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=k4OAZFjr; arc=none smtp.client-ip=74.125.229.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="k4OAZFjr"
Received: by mail-dl2-f12.google.com with SMTP id a92af1059eb24-142dd025d07so13226c88.2
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 16:07:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1790982446; x=1791587246; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LXSwX5jjkSLNliyM1NMwqcwfmmI5JkAaKqy5NKFRsCg=;
        b=k4OAZFjrT8ZpBcwWcTygc65JkvsUGDw0/mjw3fJ73pLkJEbDv+e4QnPe9yKz64yzze
         XmEHx7UOnjKccDCjvOne8TdlNazx2DnJ8GpANDhTW+2Oc5Onoevd9UHCiXDx14c4OPoQ
         gI5AEFDU5sWqiZastOXddjLTbZU23cgthDKKg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790982446; x=1791587246;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LXSwX5jjkSLNliyM1NMwqcwfmmI5JkAaKqy5NKFRsCg=;
        b=QMq+kq88/+F1w5FW41jpdwkwVPm5WLZ99VhxlzlMLJ5GopESIblSA/Uw/F/+vQBQ9A
         zIBwlDVl106zu2meXJZbiBYIxhiF94JTw8h3SxMr6TgK1M/vdmRfwOdfsGtoIDV6xfSI
         YpzVWLyxO/V7bPEdZBGgH/eE9kaH0e+hzUji8wEmt47ayUumx9g0J07/0LX3n76OyXj1
         h4p23JEG77Zrrv1cpO1lBy4nofBRL61T9uT9qs0kyWcfjWyIA7CI87WAgfJ5rjw5xsUJ
         FEb+6njakdS1zGrPLqJNhpM5rcN9petcaJhc6tF647/tzlAs0T4/ptPSjblwbj+DSTjS
         4kgw==
X-Forwarded-Encrypted: i=1; AKwUvBz/NZ0JFyjl2Amg4e2MIGMsn3+vclffS67/bKnrmNKkeKZZg/H73gcccQWKsLcQRC2M+gi/JeQDi0QWpCQ=@vger.kernel.org
X-Gm-Message-State: AFuF++nQnqcer6FxphxhCBsvXIAeasvkSUESnCbWYUPWZH/KEYsIkH5E
	ZHg2jCVwHvxhblOsLislXMV+GaDNxgVm11VhLScNIF9LWr64w7ZcME00V04L4NFY8A==
X-Gm-Gg: AYBFou3duEAaZVDqTZ0O10AxnPIAyVF56Q19biXcDUAcvGnYciYEUWb32Lee3DHmOlH
	y4xBni8tmaBZSmvP94fhHqXG7yHGBjYjOd4tcawvdYZfKRyQWI/8Ue466M5PlBmLt7gQhqZew/B
	vaaTkY2R1KLtHZ4PXAYCrA+PJwgwjkN2k/uGiz9fMSdRTEEveOTt5gHOe/piQfMVMi0QaEG18NX
	eORCZr9OYRZ6PHl6ooRLrGFpNqSCT/3I/K2f7lV5GW+m0wzw9ZfjLoTQLrGdMvmIbHHFUNTkEIq
	CG3aEu6lEEO5ziNFUjZRQDEzusXTLvqUx2eC/M+p3SThBfm6nsHQyCKaefBGvcivi/OgVDYxXbv
	Fa+VQ7V0T3UooaPrxUORo6Xey015lj67e3NeFPRHYrfj/zq9CyJhRUtbozA56pguL3tsktpEFi9
	FgJegxxVSqeMutFFRZyVYL0xTi2B8IAAnXiRozHCQPg3k6sFhivorH1lw3uiUDw7XqBbqT8QTjQ
	+JKNGgqMPZqDmSuFAqIIb7yk3fQPQoJxKiRCjwWWQS6V6E0
X-Received: by 2002:a05:701b:450b:10b0:148:cfd2:1e4 with SMTP id a92af1059eb24-14f7e8aad17mr4136592c88.16.1790982445807;
        Fri, 02 Oct 2026 16:07:25 -0700 (PDT)
Received: from localhost ([2a00:79e0:2e7c:8:b0dc:e72e:e96b:3323])
        by smtp.gmail.com with UTF8SMTPSA id a92af1059eb24-151f7bd2884sm704829c88.0.2026.10.02.16.07.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Oct 2026 16:07:25 -0700 (PDT)
From: Brian Norris <briannorris@chromium.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: linux-pm@vger.kernel.org,
	linux-iio@vger.kernel.org,
	Andy Shevchenko <andy@kernel.org>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	linux-stm32@st-md-mailman.stormreply.com,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	linux-kernel@vger.kernel.org,
	Fabrice Gasnier <fabrice.gasnier@st.com>,
	linux-arm-kernel@lists.infradead.org,
	Brian Norris <briannorris@chromium.org>
Subject: [PATCH 3/5] PM: runtime: Propagate last_busy from dependent to dependency
Date: Fri,  2 Oct 2026 16:03:07 -0700
Message-ID: <20261002160309.3.I40c0bc917fa0b13111251844e9a54feb1d9cd7d2@changeid>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
In-Reply-To: <20261002230714.507921-1-briannorris@chromium.org>
References: <20261002230714.507921-1-briannorris@chromium.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
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
suggested these problems "should be solved in the runtime PM core".

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

Link: https://lore.kernel.org/all/CAPDyKFp=KTf8=zGBSzPYqhjnZpY8xwvjCeM1e-WTKT1QLSxaDA@mail.gmail.com/
Cc: Ulf Hansson <ulfh@kernel.org>
Signed-off-by: Brian Norris <briannorris@chromium.org>
---

 drivers/base/power/runtime.c | 22 +++++++++++++++++++++-
 1 file changed, 21 insertions(+), 1 deletion(-)

diff --git a/drivers/base/power/runtime.c b/drivers/base/power/runtime.c
index 9eed1f79429d..ee7253d154e2 100644
--- a/drivers/base/power/runtime.c
+++ b/drivers/base/power/runtime.c
@@ -318,6 +318,21 @@ static int rpm_get_suppliers(struct device *dev)
 	return 0;
 }
 
+/*
+ * Propagate last_busy timestamp from one device to another. This can, for
+ * example, prevent overactive suspend when a dependency's usage is primarily
+ * driven by one of its dependents.
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
@@ -348,6 +363,7 @@ static void __rpm_put_suppliers(struct device *dev, bool try_to_suspend)
 		if (!device_link_test(link, DL_FLAG_PM_RUNTIME))
 			continue;
 
+		rpm_propagate_last_busy(dev, link->supplier);
 		pm_runtime_release_supplier(link);
 		if (try_to_suspend)
 			pm_request_idle(link->supplier);
@@ -710,6 +726,8 @@ static int rpm_suspend(struct device *dev, int rpmflags)
 
 	if (dev->parent) {
 		parent = dev->parent;
+		if (!parent->power.ignore_children)
+			rpm_propagate_last_busy(dev, parent);
 		atomic_add_unless(&parent->power.child_count, -1, 0);
 	}
 	wake_up_all(&dev->power.wait_queue);
@@ -1369,8 +1387,10 @@ int __pm_runtime_set_status(struct device *dev, unsigned int status)
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
2.56.0.rc1.315.gc6ed9934b7-goog

