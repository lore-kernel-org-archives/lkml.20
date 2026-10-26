Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793030494;
	b=3Zz6ssgZOPQeshi2SdOH2ExBrfzHeKBBHDQy1DvbdNvR0RlSti722K2SfLkytXt2l5t1
	 jw0Cv0+yJES/vZxM3oCVOyCKUGmhuHdmrqVmTI8qQMwTRnqGufcahSPT4lEk13fD8H/Ih
	 5sn9ZUTzsXvgVetmb4FpyP82tePQFmhZaB07GXubGX8AdNpM+DoPUtepss+V8kaW+GIsJ
	 vYgTshtEJf77ZI4mCODHJ3JT57SwCln2kyju6Q1qT0L7nAeaEj+1pPvt3Xwm6UOUN7htp
	 P+9mii17PSqEmOvk0lUwcNGDCOYTMABavcEgVxHLlhmB34yH0dwkl4e+NLdAbTx3tyQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793030494;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=WHqpDy7PbKCDefXUBKtfUU6422syVtJV7HXYeU5J3C8=;
	b=EzoT1jTnhpKWDekSpM3p4vpnzF+/eVwTbIasSkSs+R2vuhK5hHOlizZ9U8V5QUrQR/qu
	 kWp00UDhRZu8NHRsFbTRwDvpIivzFAT6z7QapCegFyRKqLXOtXSZQEXsnZFKvKr9t1uSS
	 SxOr38H0DkkIcY3IDi1Ry9lyAqcje7+PUWlVyDlCqCW3MqHDRPjYMpxhb0TejRMYVi7SF
	 w3NmavSpaFAjZnFRxknHr6gakd2GIoYgVH3HjHtW2uLolHnwb8OJm9tNVgK+KsHuVYaQk
	 nHAgyl1Sc/wntms4LHJsQm/iN8TQHl8GYE8sTWfNXWqGDxjmAQ2Oclak16HJJHRiEVA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=TQ3sL5qC;
	arc=none smtp.remote-ip=209.85.218.44
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DE8260A2611
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 16:01:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5DE8260A2611
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=TQ3sL5qC
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c3fd91337baso430926966b.3
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 09:01:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793030491; x=1793635291; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WHqpDy7PbKCDefXUBKtfUU6422syVtJV7HXYeU5J3C8=;
        b=TQ3sL5qC28dptNJERBM0jXxisLe7YsoH9R3CGPv+xzgJfhV8xiRc5ZqaM2AtpphLS/
         rFfj+CFOjp0TnACOV1+AB0n746qacZO7aagUyzuHH9B5XWPps5aXal4pTMGEIOSzIovR
         dcOmkMQMgFNn9+z14GaD4hJrmplbEct2NUHx7Z/GORuzqPT5/ojFo5PFzFuYs9RYM7Fe
         5jdblgvFjKAYoscRvU+4yp49IcEWdQTzfxMgkMKuIP+/yRywNtptld9PraZBK5sN1VhU
         0Bk1jcEsj3PgSipIk1jwIZpmJB6lzRdP9453au5XDY8J2Vz/jnBzwld0Fohe/Z/+WG4c
         9qgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793030491; x=1793635291;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WHqpDy7PbKCDefXUBKtfUU6422syVtJV7HXYeU5J3C8=;
        b=jENmlWA2SxUDzVN5y1qI5N8mmjaCoQz6T8DdUt7ZXA+7nlIMoAWm9J7At6Sxh0vGjL
         2qG3IQRBNyliWrKouL+sK8BulInmlnkHA1+FU/9VY5wwXaMLUyBxDJkZNpzQbsWpOBVw
         oybAIHb2YMPwNcXa2vVTgZbOJUtEYgC7t5hdapSgamC5iJOVhW6w/PJG6kLqBKXR6u4t
         7Ip3Fx8uwNXs2DKaRr+kzIuFYvaNuAy22njFjvlLMzSfboRg+zT1sT/SSNJCpfIMdIaj
         Hku7YG+pW5nPchCct3EBlAiEhx37Y4iPzKL9JNz9mK+a1m46WGibc5bACm8/NxixpRrX
         Smsg==
X-Forwarded-Encrypted: i=1; AKwUvByYGrh+s0mLPhnCdSHqdeKKcEl+mVwNpPcTrZvwHwVve/tZmSJMc265/BLypbAPwhqekR/8I1Hpwi4S5bM=@vger.kernel.org
X-Gm-Message-State: AFq9FYIYgNp5fPKRUo7w1wW6NBvea5gR5nxyVS9uaF56MAbW4DCAGM6B
	wV3IPGNK5bTm6M1NBI+vtmOKKXeC+siyMpKxfuPDcZik3ePyQhk5ckBGwsXK8HKQFeg=
X-Gm-Gg: AYBFou2/fMNL3UUoio3t/7suqP+qSh+KAiSh4XzL3fM4TqO9grPwoFm9KM9SbtsTBxy
	okAiOoUTSCT5JwzS4cP7XI2QCTgJrYeBEQptBsR2Idkz+Ftg54+Dt30xSkPiFuadsns/BJ22KUl
	Odb9MsZfcqrC+xUTMtIYP/o6icfq7oXm1KFX6IBNUkAufzGfXk0M/AOri2nL1nV1tz4fvKwBl+R
	ywpUzvJdFSQXvb+4KnJSTTN6mx2UJvNl88tblRJzLQw3E0nX61VvvoBu1+U/7sZhNgFp6zlKaah
	Vy4GMXapbWwFKzN3CFSg4H/EOrBfBEEt07pqDRUA4GL0gnWLhZNi5sMBMBOXziPLB4oDAiPrKko
	o1Nfz2+7+oig/MuryiOd9VhlLAmHcfVkv5ZIhjTBseO7HuFz6XZT+YJOFMFP/T0cYbp/5oPmjvf
	isWjAnAosBvGSBgf4cVfoxbedaiG6ttu9BPBhnUILlcasiev977YXjp0ROPBWZPIsKMJ0fZU4HX
	egcWafdSo2FL9f9nMrq2uE+ovbPXDTecZ3Uu4wrzEzGb/E5VQiWsbfV5Aco/zz+4vwhskjM+9NE
	aKlQ1WwHc0hMc8LURP3o48uSBqZfktYv4CsrHIdO6LnXSksAgF/QxCbtIQ==
X-Received: by 2002:a17:907:86a3:b0:c31:5bb8:4b3b with SMTP id a640c23a62f3a-c46bdaf85e3mr841090266b.2.1793030490619;
        Mon, 26 Oct 2026 09:01:30 -0700 (PDT)
Received: from ta2.c.googlers.com (231.141.38.34.bc.googleusercontent.com. [34.38.141.231])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c49a530f520sm17307466b.23.2026.10.26.09.01.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 09:01:30 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Mon, 26 Oct 2026 16:01:26 +0000
Subject: [PATCH 09/15] thermal/drivers/samsung: acpm-tmu: Fix IRQ locking
 and error handling
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
Message-Id: <20261026-acpm-tmu-fixes-v1-9-0637431b7268@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793030483; l=3882;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=TiuBHtlRRMGFiGpDB3+TL3spi9O67ScMwNWNv6pXoY0=;
 b=IXVM7S+QH4aPV/nYNEl41yy6nPmbInM7Jmz64JJW/7l8h0sg/F8IR5+RmiE7ob2uyX4aoyuVs
 IBDp3eQ3v+tAzFgPCZbES69bfhx4xBR2Ilefyq6AbMpUncnFpWwpC2C
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=

acpm_tmu_has_pending_irq() acquires and releases sensor->lock around the
INTPEND read, and acpm_tmu_thread_fn() re-acquires it to call
ops->clear_tz_irq(), leaving a window where concurrent .set_trips() or
.change_mode() calls can modify sensor state in between. Moreover, if
ops->clear_tz_irq() fails, acpm_tmu_thread_fn() still sets handled = true
and updates the thermal zone while INTPEND remains asserted; conversely,
returning IRQ_NONE on a level-high IRQF_ONESHOT line re-triggers the
interrupt up to 100,000 times before the spurious IRQ detector disables
it, so unthrottled dev_err() calls flood the kernel log.

Replace acpm_tmu_has_pending_irq() with acpm_tmu_clear_pending_irq() so
both the INTPEND check and ops->clear_tz_irq() run under a single
guard(mutex)(&sensor->lock), only mark the IRQ handled and update the
thermal zone when an interrupt was pending and cleared, and rate-limit
the error messages on both IRQ_NONE failure paths in the threaded IRQ
handler.

Fixes: 50a2c5d4062a ("thermal/drivers/samsung: Add Exynos ACPM TMU driver GS101")
Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/thermal/samsung/acpm-tmu.c | 42 ++++++++++++++++++--------------------
 1 file changed, 20 insertions(+), 22 deletions(-)

diff --git a/drivers/thermal/samsung/acpm-tmu.c b/drivers/thermal/samsung/acpm-tmu.c
index 65be8884a8c5..42b338d8d093 100644
--- a/drivers/thermal/samsung/acpm-tmu.c
+++ b/drivers/thermal/samsung/acpm-tmu.c
@@ -330,11 +330,12 @@ static const struct thermal_zone_device_ops acpm_tmu_sensor_ops = {
 	.set_trips = acpm_tmu_set_trips,
 };
 
-static int acpm_tmu_has_pending_irq(struct acpm_tmu_sensor *sensor,
-				    bool *pending_irq)
+static bool acpm_tmu_clear_pending_irq(struct acpm_tmu_sensor *sensor)
 {
 	struct acpm_tmu_priv *priv = sensor->priv;
+	const struct acpm_tmu_ops *ops = &priv->handle->ops->tmu;
 	unsigned long mask = sensor->group->mask;
+	bool pending_irq = false;
 	int i, ret;
 	u32 val;
 
@@ -343,53 +344,50 @@ static int acpm_tmu_has_pending_irq(struct acpm_tmu_sensor *sensor,
 	for_each_set_bit(i, &mask, EXYNOS_TMU_SENSORS_MAX_COUNT) {
 		ret = regmap_field_read(priv->regmap_fields[i], &val);
 		if (ret)
-			return ret;
+			return false;
 
 		if (val) {
-			*pending_irq = true;
+			pending_irq = true;
 			break;
 		}
 	}
 
-	return 0;
+	if (!pending_irq)
+		return false;
+
+	ret = ops->clear_tz_irq(priv->handle, priv->mbox_chan_id,
+				sensor->group->id);
+	if (ret) {
+		dev_err_ratelimited(priv->dev,
+				    "Sensor %u: failed to clear IRQ (%d)\n",
+				    sensor->group->id, ret);
+		return false;
+	}
+
+	return true;
 }
 
 static irqreturn_t acpm_tmu_thread_fn(int irq, void *id)
 {
 	struct acpm_tmu_priv *priv = id;
-	struct acpm_handle *handle = priv->handle;
-	const struct acpm_tmu_ops *ops = &handle->ops->tmu;
 	struct device *dev = priv->dev;
 	bool handled = false;
 	int i, ret;
 
 	ret = pm_runtime_resume_and_get(dev);
 	if (ret) {
-		dev_err(dev, "Failed to resume: %d\n", ret);
+		dev_err_ratelimited(dev, "Failed to resume: %d\n", ret);
 		return IRQ_NONE;
 	}
 
 	for (i = 0; i < priv->num_sensors; i++) {
 		struct acpm_tmu_sensor *sensor = &priv->sensors[i];
-		bool pending_irq = false;
-
-		if (!sensor->tzd)
-			continue;
 
-		ret = acpm_tmu_has_pending_irq(sensor, &pending_irq);
-		if (ret || !pending_irq)
+		if (!sensor->tzd || !acpm_tmu_clear_pending_irq(sensor))
 			continue;
 
 		handled = true;
 
-		scoped_guard(mutex, &sensor->lock) {
-			ret = ops->clear_tz_irq(handle, priv->mbox_chan_id,
-						sensor->group->id);
-			if (ret)
-				dev_err(priv->dev, "Sensor %d: failed to clear IRQ (%d)\n",
-					i, ret);
-		}
-
 		thermal_zone_device_update(sensor->tzd,
 					   THERMAL_EVENT_UNSPECIFIED);
 	}

-- 
2.56.0.257.gf7497c7d27-goog

