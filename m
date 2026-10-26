Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793030493;
	b=HYLbH6r7xbzyHaNkWn/vGOiNKKTcF73IguGEuVnlUzbBXTQiBs5lK31kqwfSHWNUyxIR
	 auvb59V/XpCyni98vwqtxenIgA0BgNoJBMVNOoQYHw7CS3VQ1P/b3NKmT1FcO4yaPmIns
	 /BYfgyTgWVM5gFSvKjQ+VMTSbYHGLl+IYXasVclNQOJ7pIaxxha9jF6q95/PlsAJ93qEp
	 dtmzSSNdZIgrSPxZqRR3JClG5QzUxLYPHP4lTEJdVHFrFYRf0V9V1I5wjNhcdRB8lt2fD
	 GV+Z0LTMPWFLYZ2+JfXmxmGQWqB9zR1PqFUDHtpoHKIf/R94J2zbD/qB847Epz7NGkA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793030493;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=HWaT+wPpmTfJJ1DIQuA8Cru6WQxlbWyH1qkN23llu4Y=;
	b=0aIfEiLtduDUYh4dwSBfiCMtyvIGRVoB97xtp5MP7jKzZiMtEI2KxBmblNP0XRxdvOyI
	 Oet5F2R2L1P2UiKT0IYzI8+NMjKRLy3MVF7SKTpXO80ITXsI7bs+C711ZJOUeahgaoWIF
	 KwQqbtkSu6dTtf502KEl5npvBJu8Y+0EzSCWgdSo+RG8vE+s9G3ZgYC43sD0pG3++k0ZX
	 /wSzpBBqWfDUuGBF2KTRw31wZEG38op2jj54W6/XcoPQVbUl1u0o6oa6luxaYc8RzrXEY
	 yLUaa/iEI32dtYTcHghQYdTfm9q1I7l8SadnLj3y869kgJ7yh6xRKVc6g8n/tqElv+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=FAklovfO;
	arc=none smtp.remote-ip=209.85.218.48
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77164606A322
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 16:01:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 77164606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=FAklovfO
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c40e02b2ebaso490156566b.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 09:01:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793030489; x=1793635289; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HWaT+wPpmTfJJ1DIQuA8Cru6WQxlbWyH1qkN23llu4Y=;
        b=FAklovfOmzD1Z1Gf319Ep8DxnBvK9Cqnnye+n0R/lnq0IBkWsbGdt5Vg53su4r0nPK
         0vwLx1aXQooGyE0y6S0qt6QR4XaKX58fCSOMQkf5J1+4vueIrb/ig3uSZL0ksv6j0Ry7
         eEFt/Cll8in8pjG/gOYNxBg/+wjZ/qFipgprQfP22rZPCBj7c/JlltSo7BUvOFElNGFp
         xHlvQxDTTW2iDvInkjSPTcVFbTLoGaFK73DPHjt88x3ASKZn1mfPHxJlJH38IBoFtRMP
         Xgk4fSZnphbgbOD7bz/w1+B7CH8cscrmgEYjpMK5TkVPj53o1c7JCr+KLB8FIYZPpESy
         EvVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793030489; x=1793635289;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HWaT+wPpmTfJJ1DIQuA8Cru6WQxlbWyH1qkN23llu4Y=;
        b=fL5I7pRN2YN9/o2WqGXmeyH4Q2LhI8fZMTlY8fK3svbBzSMH7fyRZT7TNMbXOXYej9
         kVINKkl55N9In3YXqFKxyswn/AiVW5ck6PHla4QLqHhPLEBrbkOMf3iDmpPGjKZD37r7
         pbTy/xe+H70sad68Fot1OBZt2c3qB7SIWu/7UvexH6sHbGouNKB+DiVosmxuA0GNv1RK
         4cQpl+Qu/WJtcLf7J5jzjP9VEEAGO17sJOfFJmhbqp2GbdHIgN8tf9MGstvANvzS3QYF
         Kqjhjd6kLHw7NAe8rjQlprVu5jB3zRPVRgN90qvJX/eZPcUZiv8UQUbvO8SHjLonqPaF
         y41w==
X-Forwarded-Encrypted: i=1; AKwUvBy2TPeoB41uZcankmSt0ZdqNPlzUvEYPHfpYQ4vUyfkTK4VwC4yel3HRB6yUaCwqe/epDIadhFHTYxmWb0=@vger.kernel.org
X-Gm-Message-State: AFq9FYJu3sHPYEt11wddVJAjXNGdPUf5ylU+9zoJNe03eHWhLfLx6XGH
	8tbMvvQp1V3AWHVUZVbzqlNLj2svfdx16JjUPtMLJju6UuL40S3sAts1qg7bPCbXUmE=
X-Gm-Gg: AYBFou1JG2l/wwaChhy8zqNiyDrRiG9Tu4EmPvcjEi0MGoDAoLctW5LzoLzBnfDHUSB
	tQPmbAvs6FOBGf+z9moJlHk1FGaKfYeqzNZ/fwjyVF3ihsa92TdNWFe6/2CpSSrVN6FfqBnJ/rZ
	R4NMGzeP6BOY7bXcMinB+PqM+YgLPUw85e+czTitgEjxNYeE1/KOnIDxlopVcvrbXtmerB4eBEu
	fK6uWY92mnDiE/hKFHAStNbrU3QI00A9bKc/Jb4dHaiktZZfRYhjVNygs0HWSTkPp+6F4CYhA0/
	+Osg5bQAzuUZUQZgxyxXCkm6ZmGcmrYeimCuYOOcArF4eZ27hr+gwlDiZzQpvfTLpsUksbMolSq
	PY6ptBS0b8hmwZIqmZ8gOqIT0glgZdfLNVA5cFfM51iMZ4uvjnUgY15u1LLcWbHCogNm+hktbgw
	RnzYc1Kf7x4f9t4c8zJmhmTvKDIs/+Gaf0k92JhOi2j1yNTJ6rEki63AeoIbrAH9LUwifjNIWpo
	YZoQy82srottKpLhR1WyG7JPu5Rc5wNSl2sqzChaaj43qju2Fa9Z0H29DLH/9rJElKAos2FTdXO
	sBPwN29IVlY02lEm0L5YzOHGSS5/C4TNun8YCF5sBLg7ryTz0y9mrSaG9ZMHVX7UGHpjJz2viaS
	VKoBuc4kx+g==
X-Received: by 2002:a17:907:3ea1:b0:c41:b4e4:7958 with SMTP id a640c23a62f3a-c46bd95983emr863865266b.0.1793030488581;
        Mon, 26 Oct 2026 09:01:28 -0700 (PDT)
Received: from ta2.c.googlers.com (231.141.38.34.bc.googleusercontent.com. [34.38.141.231])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c49a530f520sm17307466b.23.2026.10.26.09.01.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 09:01:28 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Mon, 26 Oct 2026 16:01:23 +0000
Subject: [PATCH 06/15] thermal/drivers/samsung: acpm-tmu: Rely on devres
 for probe error and remove teardown
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
Message-Id: <20261026-acpm-tmu-fixes-v1-6-0637431b7268@linaro.org>
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
 linux-kernel@vger.kernel.org, Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Sashiko <sashiko-bot@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793030483; l=4225;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=IJeXySMGcYifUwBq633Cferss1iIcf0iRvDQk01LEvI=;
 b=hYIgikztdPaJbrzUwRxNl8rAWnP8eNJqKC6JvSPvy4S9fPCi5C3d1Q6+OnF91mTrK6fBTrreF
 T4AnaiUwDdjDqxmKUH8Rck13WpJ6EtVUR2R71anCWahkYFYvQsA+hGd
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=

Disabling sensors manually on acpm_tmu_probe() failure or in
acpm_tmu_remove() happens before devres unregisters the thermal zones,
leaving live zones backed by disabled hardware.

With .change_mode() implemented, devres tears down the IRQ, thermal
zones, and runtime PM in reverse registration order:
devm_thermal_of_zone_release() disables each sensor via
thermal_zone_device_disable(), and devm_pm_runtime_enable() disables
autosuspend and runtime PM.

Drop acpm_tmu_remove(), acpm_tmu_control_rollback(), and the manual
teardown in acpm_tmu_probe(), and switch acpm_tmu_control() to
pm_runtime_put_autosuspend() since pm_runtime_put_sync() was only needed
by acpm_tmu_remove().

Fixes: 50a2c5d4062a ("thermal/drivers/samsung: Add Exynos ACPM TMU driver GS101")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Link: https://sashiko.dev/#/patchset/20260603-acpm-tmu-v8-0-0f1810a356e6@linaro.org?part=2
Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/thermal/samsung/acpm-tmu.c | 56 ++++----------------------------------
 1 file changed, 5 insertions(+), 51 deletions(-)

diff --git a/drivers/thermal/samsung/acpm-tmu.c b/drivers/thermal/samsung/acpm-tmu.c
index 69793fce3bf1..4257bec802c1 100644
--- a/drivers/thermal/samsung/acpm-tmu.c
+++ b/drivers/thermal/samsung/acpm-tmu.c
@@ -153,26 +153,6 @@ static int acpm_tmu_op_tz_control(struct acpm_tmu_sensor *sensor, bool on)
 	return 0;
 }
 
-static void acpm_tmu_control_rollback(struct acpm_tmu_priv *priv, int start_idx)
-{
-	int i;
-
-	for (i = start_idx; i >= 0; i--) {
-		struct acpm_tmu_sensor *sensor = &priv->sensors[i];
-		int ret;
-
-		if (!sensor->tzd)
-			continue;
-
-		mutex_lock(&sensor->lock);
-		ret = acpm_tmu_op_tz_control(sensor, false);
-		mutex_unlock(&sensor->lock);
-		if (ret)
-			dev_err(priv->dev, "Rollback: Failed to disable sensor %d: %d\n",
-				i, ret);
-	}
-}
-
 static int acpm_tmu_control(struct acpm_tmu_priv *priv, bool on)
 {
 	struct device *dev = priv->dev;
@@ -199,7 +179,7 @@ static int acpm_tmu_control(struct acpm_tmu_priv *priv, bool on)
 			err = ret;
 	}
 
-	pm_runtime_put_sync(dev);
+	pm_runtime_put_autosuspend(dev);
 
 	return err;
 }
@@ -489,7 +469,7 @@ static int acpm_tmu_probe(struct platform_device *pdev)
 	ret = acpm_handle->ops->tmu.init(acpm_handle, priv->mbox_chan_id);
 	if (ret) {
 		ret = dev_err_probe(dev, ret, "Failed to init TMU\n");
-		goto err_pm_put;
+		goto out_pm_put;
 	}
 
 	for (i = 0; i < priv->num_sensors; i++) {
@@ -510,7 +490,7 @@ static int acpm_tmu_probe(struct platform_device *pdev)
 			}
 
 			ret = dev_err_probe(dev, ret, "Failed to register sensor %d\n", i);
-			goto err_rollback;
+			goto out_pm_put;
 		}
 		sensor->tzd = tzd;
 
@@ -522,39 +502,14 @@ static int acpm_tmu_probe(struct platform_device *pdev)
 	ret = devm_request_threaded_irq(dev, priv->irq, NULL,
 					acpm_tmu_thread_fn, IRQF_ONESHOT,
 					dev_name(dev), priv);
-	if (ret) {
+	if (ret)
 		ret = dev_err_probe(dev, ret, "Failed to request irq\n");
-		goto err_rollback;
-	}
 
+out_pm_put:
 	pm_runtime_put_autosuspend(dev);
-
-	return 0;
-
-err_rollback:
-	acpm_tmu_control_rollback(priv, i - 1);
-err_pm_put:
-	pm_runtime_dont_use_autosuspend(dev);
-	pm_runtime_put_sync(dev);
 	return ret;
 }
 
-static void acpm_tmu_remove(struct platform_device *pdev)
-{
-	struct acpm_tmu_priv *priv = platform_get_drvdata(pdev);
-
-	/* Stop IRQ first to prevent race with thread_fn */
-	disable_irq(priv->irq);
-
-	/*
-	 * Disable autosuspend to force the subsequent pm_runtime_put_sync()
-	 * inside acpm_tmu_control() to synchronously suspend the device
-	 * immediately, preventing clock leaks when the driver is removed.
-	 */
-	pm_runtime_dont_use_autosuspend(&pdev->dev);
-	acpm_tmu_control(priv, false);
-}
-
 static int acpm_tmu_suspend(struct device *dev)
 {
 	struct acpm_tmu_priv *priv = dev_get_drvdata(dev);
@@ -648,7 +603,6 @@ static struct platform_driver acpm_tmu_driver = {
 		.of_match_table = acpm_tmu_match,
 	},
 	.probe = acpm_tmu_probe,
-	.remove = acpm_tmu_remove,
 };
 module_platform_driver(acpm_tmu_driver);
 

-- 
2.56.0.257.gf7497c7d27-goog

