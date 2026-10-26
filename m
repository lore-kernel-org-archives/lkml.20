Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793030488;
	b=XuPRue0W/8TwEhgwPX5FfpvGrxl6RghiYfirkjv6oXyyNibFJ+3QaIrbTM3kixUSZpft
	 uniNbefsedkjCOjcddkXEJNsR94s9tXgQHeX4uoOqIMjKd8bXGK0EsF7UfQEpK3ybvRGr
	 oRwjWoZRjC1Kw7/5fq+cebIAba5qAMU0wwGyyBqlc/HcOu47772CqgLzJrI/YMTkE6RVy
	 3x1jGfeL9/isqviqiZlGlSvMSlhKkqtdv5Ve4rlIfNkKfCiY5yLbgSYjG91Ju0v6t8CdH
	 A2IInYS8pXAcGl1uRrd8+ujAKM8c2KKOPEU7z+3okbz8u65tGPAF6lY/rqMYXbTLT7g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793030488;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=ULiAXlDs6uzz6Xg5tVgN5dURBE6+891+t2MegFSZRrM=;
	b=L+yNYhdSOU5CDJd7weSeX2k0CqauqZmyGWHneK8mXdGfsN+kO/WNl/zFKDxycGmf898D
	 UrAbO4W2MlceEOPet1S7lBXiI++qGagPZuiyn5yiuvfRqSslazQW9dj2C/+ZbzhMOVeVf
	 exuxcksO660pkoWjdVFs7wkNHY50pRNOwLFWX6+v4QTGA3WfFmQE/HRyrR6N7PGRWbnma
	 fXH9nVepKMxPivYrysTO75XbJ4KfQTRH9+kaTcO0k1DEI03VXDUAX6+QtSDQtWM4XN019
	 VSG1sesvaJGLoqH9afeULR+Pk9bHahkzL79CJn9Q2M3/xWlnlcROqRkvzVCQ0lNBmMw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=rrEj1gjI;
	arc=none smtp.remote-ip=209.85.218.50
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EF0E606A336
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 16:01:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2EF0E606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=rrEj1gjI
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c43373ae89aso480244866b.3
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 09:01:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793030486; x=1793635286; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ULiAXlDs6uzz6Xg5tVgN5dURBE6+891+t2MegFSZRrM=;
        b=rrEj1gjI5wPoLmWezx5JCZYgb2FeB2NczDLKP7ev0LPHlugVgNIFQ5k2OK3kQo3Jfh
         1HYr0ea4P0fQoDFSx55TbTgO+6pxh+gHBJ2FZSJUqCP+94yCz+9Lx/BlVF/UOefcaxvD
         7Ez9QKHsdkYs4/iu5WOc7W8p+UXgSseIkznkfKCUpZTeHILYIN2z3ezYq9HPy8RzhsW2
         aa1nYzFpXqViWe4avmMG+wKj/qR3FdLjxuWuYlz1fzzrpRdbeQ9vhLCuxZExvu8z8G4A
         Gvm1wA80nXQ+j/w5BxQFvFwu0Bx/NjwNMH9bz33KMEKKJCuUozNNzvZr2D0VJZMgf/TA
         biTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793030486; x=1793635286;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ULiAXlDs6uzz6Xg5tVgN5dURBE6+891+t2MegFSZRrM=;
        b=g2f0jMekNhtaiyphLppT8eid+1wvp8aw/0KEFzmV6Ln7MgJ7dJlkOzujJOvPXJH+37
         ZvK3n+Y4IaGKxqZIDZewA1iFVPw3aDVOqfdat0eUo2uGzfB7Rj7/U57DSyPN9/ibep4h
         VxJOniqUF9lEMtwxbAmgOJj+XfX2hhiAFmGVTF1a9yb5o3yGOB/BVdckIWWoJImY/WaF
         9boE+BM9eIXgwICa7czrvx7jsFWif+kE/73/7RwBEClArl0dbvy7nwN5YpEsKu8FBlzl
         hbadkmygU2NWOkucOUyywLdKykph595s108Y4rMvUEj3GKOBF5St9R4EMuOM3Q1wG6lr
         Gnfg==
X-Forwarded-Encrypted: i=1; AKwUvBwQ8aIwKU44cNKIuIRS7rAH5BpW2q+AmQadM6YTWP4WPXUKXh7hc2Tdgbaa5P+v44K1mjUPqKP7hbOQjaY=@vger.kernel.org
X-Gm-Message-State: AFq9FYKDZRmwq5eX4h0Bt9zXzcX2Xse3bylmCcRQjLhM/yg2wXzdQDPR
	0WbW3u5fXIL+3gjTtIPCxhAuWU1wl/0c6ZNrvD4MHDpO2b8Dbe/30AczchNAzaJwJdE=
X-Gm-Gg: AYBFou0rVmtaAe46P0LXPLgkIaZZuCQx35YWB5/cdKL4SiwJT88KP1BTHl2wLzNAISf
	aMpJGsSBB4/8/TaqV3f3JC6cvXC48HlrgXHVUBKB4zrBLhBkmIEEQwTaaiF4MdhJQUrEfEWUPG1
	BAwTg2NEYloet92Pb76nGBUmKHZTlk1NKPVmuDaocka/cm7NQPyLMlQa5gj30d3ftV2vhbciLUm
	P5ICySo1AAPblfnrIkaRLyasgb+WUUcD5FsoDzcAmX1lps4IzUokZiB4elzWzld/bDn8iFRWMEz
	T9k8Ejuhzm1WiJHH+sZFiKnLHDA2dfdir0xQg5kbZglwwHPJvmOJCOdrAflnYs7G+D6i8jte30l
	vjty3ga8N5XyLCV34/KngcLQZAna1FIB+yigqRi7nkXc62AmbCViVv8obceYR5xZSVoxViZyUrS
	mT/UVjjA9PMD8EmulMJymWRI9CXUfbgfMtaxJxFF+xo+ae6exeqZ3xmY6QbSDEUqIcj6BR5cd/e
	QL+c1nMGt+xe1e2g+4f1/eGxT5bq0I6IZ9URZTIkJrArNOPhOcQqQ4ebbcgSkeRkaBqUVbJwSBe
	nA6Qve1B45HTKb4jiA5+6bPllVAAmThTT3y5yN1y7NspcuVZKUCqWw5BvoVPtpwJSkX6eTE1biL
	FiLAO0UeWFw==
X-Received: by 2002:a17:907:3e06:b0:c46:8b9a:39ae with SMTP id a640c23a62f3a-c46bde4eb8bmr821391266b.28.1793030486440;
        Mon, 26 Oct 2026 09:01:26 -0700 (PDT)
Received: from ta2.c.googlers.com (231.141.38.34.bc.googleusercontent.com. [34.38.141.231])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c49a530f520sm17307466b.23.2026.10.26.09.01.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 09:01:25 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Mon, 26 Oct 2026 16:01:20 +0000
Subject: [PATCH 03/15] thermal/drivers/samsung: acpm-tmu: Fix
 acpm_tmu_resume() error handling
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261026-acpm-tmu-fixes-v1-3-0637431b7268@linaro.org>
References: <20261026-acpm-tmu-fixes-v1-0-0637431b7268@linaro.org>
In-Reply-To: <20261026-acpm-tmu-fixes-v1-0-0637431b7268@linaro.org>
To: Daniel Lezcano <daniel.lezcano@kernel.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, 
 Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, 
 Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Alexey Klimov <alexey.klimov@linaro.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Juan Yescas <jyescas@google.com>, linux-pm@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Tudor Ambarus <tudor.ambarus@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793030483; l=5298;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=qCVVqc6x/0s6bvl7rY2mwBkC7vhwwi3YsCjDNoVX0oI=;
 b=OXFKufosU6U5StLfJ2EhbNkIwQkfSSKgKLDfOeJRGJ4ZNoF2KUu4DMwUDH5vRQ4Mq598C/Kqq
 CY0W11kdtKqCDlgRvj8x/U86cthK9v74EmXyy00w+8tt0Y7/tsqWzeK
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=

Unlike .suspend(), system resume cannot be aborted: device_resume()
clears dev->power.is_suspended before invoking .resume(), and on error
merely logs the failure and continues into normal system operation
without re-enabling runtime PM on the driver's behalf.

acpm_tmu_resume() treats errors by rolling back into a suspended state,
causing three problems:
1. acpm_tmu_suspend() disables runtime PM via pm_runtime_force_suspend().
   If ops->resume() fails before pm_runtime_force_resume() runs, or if
   acpm_tmu_control() fails and the rollback path calls
   pm_runtime_force_suspend(), dev->power.disable_depth remains at 1
   with the device runtime-suspended. Every subsequent
   pm_runtime_resume_and_get() then fails with -EACCES, breaking thermal
   zone operations and causing future system suspends to abort in
   acpm_tmu_suspend().
2. Calling ops->suspend() on error leaves the ACPM TMU firmware in the
   suspended state while Linux considers the device awake, so subsequent
   thermal zone operations run against suspended firmware and the next
   acpm_tmu_suspend() issues an unbalanced ops->suspend() call.
3. Rolling back sensors via acpm_tmu_control_rollback() when a single
   sensor fails to re-enable disables sensors that already resumed and
   skips remaining sensors, leaving active CPU clusters without thermal
   monitoring.

Mirror acpm_tmu_suspend() in reverse order by calling
pm_runtime_force_resume() at the start of acpm_tmu_resume(), and drop
the pm_runtime_force_suspend() and ops->suspend() error rollback paths.
Re-enable sensors on a best-effort basis so any sensor that fails
remains marked !sensor->enabled for the thermal core's post-resume
update, and drop the now-unused rollback parameter from
acpm_tmu_control().

Fixes: 50a2c5d4062a ("thermal/drivers/samsung: Add Exynos ACPM TMU driver GS101")
Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/thermal/samsung/acpm-tmu.c | 48 ++++++++++----------------------------
 1 file changed, 12 insertions(+), 36 deletions(-)

diff --git a/drivers/thermal/samsung/acpm-tmu.c b/drivers/thermal/samsung/acpm-tmu.c
index f9802080acd7..f490551de69a 100644
--- a/drivers/thermal/samsung/acpm-tmu.c
+++ b/drivers/thermal/samsung/acpm-tmu.c
@@ -172,7 +172,7 @@ static void acpm_tmu_control_rollback(struct acpm_tmu_priv *priv, int start_idx)
 	}
 }
 
-static int acpm_tmu_control(struct acpm_tmu_priv *priv, bool on, bool rollback)
+static int acpm_tmu_control(struct acpm_tmu_priv *priv, bool on)
 {
 	struct device *dev = priv->dev;
 	int i, ret, err = 0;
@@ -191,16 +191,8 @@ static int acpm_tmu_control(struct acpm_tmu_priv *priv, bool on, bool rollback)
 		mutex_lock(&sensor->lock);
 		ret = acpm_tmu_op_tz_control(sensor, on);
 		mutex_unlock(&sensor->lock);
-		if (ret) {
-			if (!err)
-				err = ret;
-
-			/* On enable, stop on first error if rollback is requested */
-			if (on && rollback) {
-				acpm_tmu_control_rollback(priv, i - 1);
-				break;
-			}
-		}
+		if (ret && !err)
+			err = ret;
 	}
 
 	pm_runtime_put_sync(dev);
@@ -539,7 +531,7 @@ static void acpm_tmu_remove(struct platform_device *pdev)
 	 * immediately, preventing clock leaks when the driver is removed.
 	 */
 	pm_runtime_dont_use_autosuspend(&pdev->dev);
-	acpm_tmu_control(priv, false, false);
+	acpm_tmu_control(priv, false);
 }
 
 static int acpm_tmu_suspend(struct device *dev)
@@ -549,7 +541,7 @@ static int acpm_tmu_suspend(struct device *dev)
 	const struct acpm_tmu_ops *ops = &handle->ops->tmu;
 	int ret, restore_ret;
 
-	ret = acpm_tmu_control(priv, false, false);
+	ret = acpm_tmu_control(priv, false);
 	if (ret)
 		goto err_restore_sensors;
 
@@ -571,7 +563,7 @@ static int acpm_tmu_suspend(struct device *dev)
 			restore_ret);
 
 err_restore_sensors:
-	restore_ret = acpm_tmu_control(priv, true, false);
+	restore_ret = acpm_tmu_control(priv, true);
 	if (restore_ret)
 		dev_err(dev, "Failed to re-enable TMU after suspend failure: %d\n",
 			restore_ret);
@@ -584,34 +576,18 @@ static int acpm_tmu_resume(struct device *dev)
 	struct acpm_tmu_priv *priv = dev_get_drvdata(dev);
 	struct acpm_handle *handle = priv->handle;
 	const struct acpm_tmu_ops *ops = &handle->ops->tmu;
-	int ret, restore_ret;
-
-	/* APB clock not required for this specific msg */
-	ret = ops->resume(handle, priv->mbox_chan_id);
-	if (ret)
-		return ret;
+	int ret;
 
 	ret = pm_runtime_force_resume(dev);
 	if (ret)
-		goto err_suspend_acpm;
+		return ret;
 
-	ret = acpm_tmu_control(priv, true, true);
+	/* APB clock not required for this specific msg */
+	ret = ops->resume(handle, priv->mbox_chan_id);
 	if (ret)
-		goto err_suspend_pm;
-
-	return 0;
+		return ret;
 
-err_suspend_pm:
-	restore_ret = pm_runtime_force_suspend(dev);
-	if (restore_ret)
-		dev_err(dev, "Failed to force suspend during resume rollback: %d\n",
-			restore_ret);
-err_suspend_acpm:
-	restore_ret = ops->suspend(handle, priv->mbox_chan_id);
-	if (restore_ret)
-		dev_err(dev, "Failed to suspend ACPM during resume rollback: %d\n",
-			restore_ret);
-	return ret;
+	return acpm_tmu_control(priv, true);
 }
 
 static int acpm_tmu_runtime_suspend(struct device *dev)

-- 
2.56.0.257.gf7497c7d27-goog

