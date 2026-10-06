Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B3D951C065
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 23:20:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791328856; cv=none; b=raB+tduZvds8NOXbBz9ssNoQ7i/lqCTtjwithiI3HpqA7ara9CEjDwIZjdPglQVWx3wh7eW+GTBVt9fYxSXVThF7+uY/LepNpAAWYPU3q2Ua2TbYhhei6vnQgajScuulyldLuB/Y4AvIis8Y7fKfMYSh2F2dcg7/S9Qxbc1K4Wc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791328856; c=relaxed/simple;
	bh=WA7PuvtbUthLvcW/Lb0HQQwhnWNVFVTphdPk0OJcCfY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XUmIXdSMRs/IDR/Oh94npbAtoeCqm6Mi4x1zVSZXD9fqtUZdHjOy7q9ELOMRVx1PNYF1ajuBXRbS+uTAvV6FLMM1/YE+NEd3jD3jkVW8drbQ1jv9EgVGDBJ6dfJM3/0AKyn/VEaSW1Q+irm4SjlCtmyHKD+en8yvoCH2gl+oTzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ZA9esMEL; arc=none smtp.client-ip=74.125.82.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ZA9esMEL"
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-3514b90bb89so1823313eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 16:20:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1791328830; x=1791933630; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s1IGI0iM7+36zwsjin4BRCszBFYYHuuKMw3/Hy9I2ks=;
        b=ZA9esMELG5GiLmJHD5/3J8S2U7vjcXdDHdTC2pi1zzQKESxslAFD1ef8SDqHbI+85J
         q8XXTLgvXbW+jp+JD4Ejcaoh4qp3iTjhaZLiutzdXwZG9+Tgac0YVwAVPjLZmQhw0vVC
         QGs9ZRKAaGgHIWLsx5hqL57+4AfE8ZxqctKpU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791328830; x=1791933630;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=s1IGI0iM7+36zwsjin4BRCszBFYYHuuKMw3/Hy9I2ks=;
        b=H9j7IQEUDoHDTJQpj/UU7F3ZqsiMxft54SuVW5+atMc5/xBuEFwMzFvyu1sscgJjCQ
         rZRAu/FCxHe6ITjGHOECQ1Az/d8ga93NAc3DH22cU0/HHrE0yEhYRh9fizYSE1QOc4te
         9p4ce5J+p1KPjYM+ofWEpfhS8kkJ5azuCpr6ApIKfQhSg7wA9+wGR4vMeMslUSk0A1nS
         azC/g4I5ipuy2y+SqEOZaLwYB8GjXLEXXGkPhoKOBauBYVHtd/3w60q6sgj782LA3RUu
         H+KCcz8dgcc8+sj1qPvzXkyzEpPFhLkx1avlxchkUjOhfj5kO9ZqrigzkfrAeW8s6hjU
         XgGg==
X-Forwarded-Encrypted: i=1; AKwUvBxtNP08tD3wzET01cEPy6Hot1FWVgJmqaQu62l3oUltLenX1rkyogfN95LBCuQ0W+HbnKmlEn6GRSDuawU=@vger.kernel.org
X-Gm-Message-State: AFq9FYKpdaUsPbT7bP2SGNWp7/3LvBo+nqVF99aQHkqfY42q8RpEYUBo
	GmQpddF5zEa0MTbh9FspEV3KUoQfobfUxDKbTeaeeBoUro+Rupw9ZRqk6eCPzOzQDw==
X-Gm-Gg: AYBFou2cUEptkTu2shYp3bpsArsMDSJ9BS50bU4xBogOcB+78VmWRaCOsb1Jv1EyqZk
	mlzGpjiqrx65EgwZXMYE7QznQkeXH8Pfnl1ekyK/SPPlA8Ta796D+ydrt+Nwjx1qXGNwtiRGiHJ
	3S2icbQOdtJqgi/UK4xwv2LqIJtwwT+CSlV/HWWGvbF8y0Ji+4n/5OPihcfbHj/afZF58UHkQhe
	bpzp5PLOCFBojdXGv3FeysRYBSwjBHCPX0blfvahVLi/cajKy+8iGDRYK++MEWWIcvHtd0RK4od
	njrQy7bxcqoBLg/DQtt45Omwge47ucXCQEPkXePCouJgiAZL7tOBkr34wkG1TWxYKrOQLrtITBF
	w2xCQAEFWkENgCtJzM30fd5NkLZm1daGut7JD1HRNP3VNtn/C3QrT/wvGirJGJSZl+a+jbe1K9l
	tnGPdNuPWWImhcrYNWdxASTxijgbqSYp1LdhK4ewiXRmg23ntb883LyThfVb7kLl1ydNocFfscc
	lG9vqYFXh7RwjGSIo9WOLMXhfGDgdOfVm6EZg==
X-Received: by 2002:a05:693c:65d2:b0:34e:f644:9083 with SMTP id 5a478bee46e88-3515ddad0a3mr331617eec.23.1791328829695;
        Tue, 06 Oct 2026 16:20:29 -0700 (PDT)
Received: from localhost ([2a00:79e0:2e7c:8:63eb:e7f9:1d47:7d47])
        by smtp.gmail.com with UTF8SMTPSA id 5a478bee46e88-3515aeb6013sm1701105eec.5.2026.10.06.16.20.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Oct 2026 16:20:29 -0700 (PDT)
From: Brian Norris <briannorris@chromium.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: linux-pm@vger.kernel.org,
	Ulf Hansson <ulfh@kernel.org>,
	linux-kernel@vger.kernel.org,
	Brian Norris <briannorris@chromium.org>
Subject: [PATCH 13/13] PM: runtime: Drop pm_request_{idle,autosuspend}() return codes
Date: Tue,  6 Oct 2026 16:13:41 -0700
Message-ID: <20261006161337.13.If024833d8fe53aa824fa29ebd6959702ec7062e0@changeid>
X-Mailer: git-send-email 2.56.0.360.g66cac248cb-goog
In-Reply-To: <20261006231900.3230373-1-briannorris@chromium.org>
References: <20261006231900.3230373-1-briannorris@chromium.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

No in-tree callers (outside of KUnit tests) use the return values of
pm_request_idle() or pm_request_autosuspend().

As with pm_runtime_put() and pm_runtime_put_autosuspend(), these
functions asynchronously queue up a timer or work item to check whether
or not the device can be suspended, which is not guaranteed to succeed
and may return a negative error code in many valid situations (for
example, when user space has written "on" to the device's runtime PM
"control" file in sysfs, or when the device's usage counter is
non-zero).

Accordingly, change the return types of pm_request_idle() and
pm_request_autosuspend() to void, similar to commit 3afd8df02433 ("PM:
runtime: Change pm_runtime_put() return type to void").

Signed-off-by: Brian Norris <briannorris@chromium.org>
---
This patch is independent of the rest and could be applied on its own. I
put in this series because it has the same justification as the more
noisy one, "PM: runtime: Drop pm_runtime_put_autosuspend() return code"

 drivers/base/power/runtime-test.c |  8 --------
 include/linux/pm_runtime.h        | 31 ++++---------------------------
 2 files changed, 4 insertions(+), 35 deletions(-)

diff --git a/drivers/base/power/runtime-test.c b/drivers/base/power/runtime-test.c
index 24865ce844fc..ac3d7277e0c5 100644
--- a/drivers/base/power/runtime-test.c
+++ b/drivers/base/power/runtime-test.c
@@ -43,7 +43,6 @@ static void pm_runtime_already_suspended_test(struct kunit *test)
 
 	KUNIT_EXPECT_EQ(test, 1, pm_runtime_suspend(dev));
 	KUNIT_EXPECT_EQ(test, 1, pm_runtime_autosuspend(dev));
-	KUNIT_EXPECT_EQ(test, 1, pm_request_autosuspend(dev));
 
 	pm_runtime_get_noresume(dev);
 	KUNIT_EXPECT_EQ(test, 1, pm_runtime_put_sync_autosuspend(dev));
@@ -81,7 +80,6 @@ static void pm_runtime_idle_test(struct kunit *test)
 	KUNIT_EXPECT_EQ(test, 0, pm_runtime_idle(dev));
 	KUNIT_EXPECT_TRUE(test, pm_runtime_suspended(dev));
 	KUNIT_EXPECT_EQ(test, -EAGAIN, pm_runtime_idle(dev));
-	KUNIT_EXPECT_EQ(test, -EAGAIN, pm_request_idle(dev));
 }
 
 static void pm_runtime_disabled_test(struct kunit *test)
@@ -112,9 +110,7 @@ static void pm_runtime_disabled_test(struct kunit *test)
 
 	KUNIT_EXPECT_EQ(test, -EACCES, pm_runtime_resume_and_get(dev));
 	KUNIT_EXPECT_EQ(test, -EACCES, pm_runtime_idle(dev));
-	KUNIT_EXPECT_EQ(test, -EACCES, pm_request_idle(dev));
 	KUNIT_EXPECT_EQ(test, -EACCES, pm_request_resume(dev));
-	KUNIT_EXPECT_EQ(test, -EACCES, pm_request_autosuspend(dev));
 	KUNIT_EXPECT_EQ(test, -EACCES, pm_runtime_suspend(dev));
 	KUNIT_EXPECT_EQ(test, -EACCES, pm_runtime_resume(dev));
 	KUNIT_EXPECT_EQ(test, -EACCES, pm_runtime_autosuspend(dev));
@@ -154,9 +150,7 @@ static void pm_runtime_error_test(struct kunit *test)
 
 	KUNIT_EXPECT_EQ(test, -EINVAL, pm_runtime_resume_and_get(dev));
 	KUNIT_EXPECT_EQ(test, -EINVAL, pm_runtime_idle(dev));
-	KUNIT_EXPECT_EQ(test, -EINVAL, pm_request_idle(dev));
 	KUNIT_EXPECT_EQ(test, -EINVAL, pm_request_resume(dev));
-	KUNIT_EXPECT_EQ(test, -EINVAL, pm_request_autosuspend(dev));
 	KUNIT_EXPECT_EQ(test, -EINVAL, pm_runtime_suspend(dev));
 	KUNIT_EXPECT_EQ(test, -EINVAL, pm_runtime_resume(dev));
 	KUNIT_EXPECT_EQ(test, -EINVAL, pm_runtime_autosuspend(dev));
@@ -189,9 +183,7 @@ static void pm_runtime_error_test(struct kunit *test)
 	 * (already resumed).
 	 */
 	KUNIT_EXPECT_EQ(test, -EAGAIN, pm_runtime_idle(dev));
-	KUNIT_EXPECT_EQ(test, -EAGAIN, pm_request_idle(dev));
 	KUNIT_EXPECT_EQ(test, 1, pm_request_resume(dev));
-	KUNIT_EXPECT_EQ(test, -EAGAIN, pm_request_autosuspend(dev));
 	KUNIT_EXPECT_EQ(test, -EAGAIN, pm_runtime_suspend(dev));
 	KUNIT_EXPECT_EQ(test, 1, pm_runtime_resume(dev));
 	KUNIT_EXPECT_EQ(test, -EAGAIN, pm_runtime_autosuspend(dev));
diff --git a/include/linux/pm_runtime.h b/include/linux/pm_runtime.h
index b0e7dfb3805f..418a51319a62 100644
--- a/include/linux/pm_runtime.h
+++ b/include/linux/pm_runtime.h
@@ -447,21 +447,10 @@ static inline int pm_runtime_resume(struct device *dev)
  *
  * Asynchronously request the PM core to evaluate whether @dev can be idled
  * or suspended, invoking its ->runtime_idle() callback if provided.
- *
- * Return:
- * * %0: Success.
- * * %-EINVAL: Runtime PM error.
- * * %-EACCES: Runtime PM disabled.
- * * %-EAGAIN: Runtime PM usage counter non-zero, Runtime PM status change
- *   ongoing or device not in %RPM_ACTIVE state.
- * * %-EBUSY: Runtime PM child_count non-zero.
- * * %-EPERM: Device PM QoS resume latency 0.
- * * %-EINPROGRESS: Suspend already in progress.
- * * %-ENOSYS: %CONFIG_PM not enabled.
  */
-static inline int pm_request_idle(struct device *dev)
+static inline void pm_request_idle(struct device *dev)
 {
-	return __pm_runtime_idle(dev, RPM_ASYNC);
+	__pm_runtime_idle(dev, RPM_ASYNC);
 }
 
 /**
@@ -487,23 +476,11 @@ static inline int pm_request_resume(struct device *dev)
  *
  * Update the last access time of @dev and asynchronously request the PM core
  * to suspend it after the autosuspend delay has elapsed.
- *
- * Return:
- * * %1: Success; device was already suspended.
- * * %0: Success.
- * * %-EINVAL: Runtime PM error.
- * * %-EACCES: Runtime PM disabled.
- * * %-EAGAIN: Runtime PM usage counter non-zero or Runtime PM status change
- *   ongoing.
- * * %-EBUSY: Runtime PM child_count non-zero.
- * * %-EPERM: Device PM QoS resume latency 0.
- * * %-EINPROGRESS: Suspend already in progress.
- * * %-ENOSYS: %CONFIG_PM not enabled.
  */
-static inline int pm_request_autosuspend(struct device *dev)
+static inline void pm_request_autosuspend(struct device *dev)
 {
 	pm_runtime_mark_last_busy(dev);
-	return __pm_runtime_suspend(dev, RPM_ASYNC | RPM_AUTO);
+	__pm_runtime_suspend(dev, RPM_ASYNC | RPM_AUTO);
 }
 
 /**
-- 
2.56.0.360.g66cac248cb-goog

