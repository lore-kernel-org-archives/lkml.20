Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792806050;
	b=xWw4KW5Rri5pIA1MHh0hBcvitvDPOeCQXf3/yLfu8dsYZZDMvkN9uEZGKNcMwGmzkh1v
	 1ZediqY6wyZTAzz8pfmLBrkcQ3qyLgkk9VGQdFsYPtwgd+yXRGIAECdOfb8fhP1XE+S74
	 sdVFV6SApx36pIxV+Hh4CInGHhDKF0HnWAp/Qn0oxa0bgC1DrjQEc982bykOfRZdrIo8I
	 FHpnRSPxipLB+oFgU106Qi1Bv10tqxxAVN+PIaINx7sOXwqKOSMEqv1nfUlVeO0DZ8OPI
	 ppi1ov8jBqFEY5SPZa+AVvCRwJObr001Wxu/Od9TiyOmBqHIiGTh2iXUy2Ylxu0KXIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792806050;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Z79+tdgxsQW9kZqIwRO1EwdUxztE35H4zfyldg/VVYo=;
	b=P0hlosLhqG4aaUX+ttpaL4AdRWsBONxSKFZOhWO5TruOIc+Cly6ZGMTF2o1P3btTcs49
	 SgPg6ncpV+8+coZgJ2Jy5AlPgID4X9PNjpEu9vOz0iCp0P5E7rOHdami+wXaCHvV9wtS0
	 mlByW8Xk+sDRPYjnuQO25UMWIT0vh1eoxFSYRyWcuU52PxkkEcyugfNyYuEMSh6TSyGvv
	 9k1sFQgrLfX225YlC+wx97CNK9Ffkbo+UQ5BS3IcarS1OFGM7WpXAOKAQDkEo9QLNxZxO
	 trQ99UBMrfuPDyaxSi9Ti7X35pYTbqIzCNCnlza/D5iOHnuFmImfC72BWfvTxRKBaGQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=CaQK0YD2;
	arc=none smtp.remote-ip=209.85.160.176
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D348E606A31B
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 01:40:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D348E606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=CaQK0YD2
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-536c8f958d7so6827371cf.1
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 18:40:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792806049; x=1793410849; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Z79+tdgxsQW9kZqIwRO1EwdUxztE35H4zfyldg/VVYo=;
        b=CaQK0YD2bwOqn25gU5jW2f3KNG1ORMq9m3qYgnHelR85J9Sl7/IBIZbyaPNiUwsLz/
         qtcpQecvi+H9mIt6UiUBkhPaOK02KVQK4Xk16l/1HwaypmR9XFUXsGl9NHA8pNJJkTwg
         jY9x3UZh7MbPIPiQJz1vyL2hQGzBJtTvF1+zJkwru8K+eaJ6UVbtvHjFfvlmXvvydjJ9
         /E4HOxNYFNj6PvXwh94mfQL2f/uu9EPBhLMhnE3UqRHouZIEG7eiKwC+3yelwAJbt1cK
         FXLHUXEX4L1wJJk/gXW8U4+9NWyyOPjT39dkuFKyid84WXXZtp03v0N39B+B6zJmIUN3
         nWFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792806049; x=1793410849;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z79+tdgxsQW9kZqIwRO1EwdUxztE35H4zfyldg/VVYo=;
        b=KVx7KQoqF8cebItc3R51Zzq3gXMHNow+zp6TBeT3l7pQh3RGlK1KD4kPzl/exw0Qc3
         AlhGfsNAN2wXfR8exhu3BMBM4jEe5kleN0aq0zSYyKXKGwPvJhp0YOG8EiSBhZ9aEdLg
         llMWb1L1Yh7XbBMaTYlMS4uYeO2YblJiiuIX/2pYRFab+Rr5p+kPsvREtF5zp3WP3YJH
         C27Q1uBCBI5g0XLo78t983anf5RyF1bCNVZdcYWzRXMhHB3tUpHl3VptrrZWselxjJ49
         8fIrSIlEoxcMXqeG875lqk8ESaGypN3Z3calfpSGYw+zjSn9MXvQ4Q7zI+RaSk1EHs5A
         ufsQ==
X-Forwarded-Encrypted: i=1; AKwUvBxM/Y4bL1AVOQapyjSub84EQNKWH+O/O/ffNZNcTPaqCNkupC+wpVz6RyG+mF8O8evoSqbqFEVkHtmfJHs=@vger.kernel.org
X-Gm-Message-State: AFq9FYLcRb5LS2sHJ1JcZXhv6oM2QHL4m63f9khrLRWei7Nd9G7gyhSI
	Ydzag8G9SeoT78IX960/kQApgZmt32fqnDUczodONWbebL2BJw5Okfk=
X-Gm-Gg: AYBFou165p9VbTJ0SD/55skRn12mOyXAuLxhj/fqWixiF/HcTrSJXJHo91E3vyMS9JW
	rS83fJof5zF6UKf8X/j7IK6P70Y8rlysrJG3SHIbclBUsV1eNJahjkhbicPFcrDuct/FfCfnUJj
	c1IE8AidRW4r3/YSjXxq2kxsiWmlv+VQNW+k/OB3E6cPxeV3bxqLaLYRQUL+AoxOEz1/2i1DTbR
	iCo4kh96OGb5Vs3qm7y0uLKoPZthuxCAoiEsEAaBecM82j3lk1VbJzNKZmhACxqRzJRcDeyfhtC
	3HCFPLBBn7A6dsu+OM4xtAqrunSbslKyeGtX1nF4QGdzuWdA6MGm4Iz0vG7JdHTaAtQdfih89TF
	0barujaCWNokgYeQpfZoU7oSp0blfTxctkP/V0AWkaUYEBafd73w8FAzP61GQFXdJen0HtawuVu
	N8RrSV8I+niLB87wexXbafkyMrSm0L0GkutcxYmWBNCcO8Qd9gF85GEdmajDma/Iia2Rjo0z6BU
	x9YuyB8yZlMDd4ITfaOplYdzgMoFtaY/PFskTenmQtCMvO1N4rKARDJHKJnCwT4C/Wj1b/LV3ol
	pck6cAJynSrHJXr/x0j2Ya0Q0mb9kTDgg98+gz4/wl7Ubpa5o5zQLe+piymAzKZ1FpTDmFGWOin
	mb9hpP39k/Q==
X-Received: by 2002:a05:622a:1aa2:b0:536:8bb4:2a9c with SMTP id d75a77b69052e-5383b4cac1dmr8960551cf.21.1792806048703;
        Fri, 23 Oct 2026 18:40:48 -0700 (PDT)
Received: from i4-gl-tmk5904-1.ad.psu.edu ([130.203.156.90])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91c47c1af0csm9261606d6.19.2026.10.23.18.40.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 18:40:47 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ijae Kim <ae878000@gmail.com>
Subject: [PATCH v3] hwmon: (sht15) Stop deferred work before releasing its resources
Date: Fri, 23 Oct 2026 21:40:44 -0400
Message-ID: <20261024014044.27853-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.53.0
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

The IRQ handler and regulator notifier can leave work pending after a
measurement or notification completes. Neither work item is drained before
its resources are released on removal or probe failure.

Disable read_work before freeing the IRQ, since the worker can re-enable
it. Use request_irq()/free_irq() for explicit teardown. Unregister the
regulator notifier before cancelling update_supply_work and disabling the
regulator. Apply the same ordering to probe failures.

Fixes: 251eb40f5ccd ("hwmon: sht15 humidity sensor driver")
Assisted-by: LLM
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
Compile-tested with GCC 15.2.0, W=1 (x86_64). No runtime testing.

Changes in v3:
- Drop IRQF_NO_AUTOEN and IRQ caching; preserve the original initialization.
- Keep request_irq()/free_irq() and work synchronization.

Changes in v2:
- Switch to request_irq()/free_irq().
- Add IRQF_NO_AUTOEN and IRQ caching.

 drivers/hwmon/sht15.c | 22 ++++++++++++++--------
 1 file changed, 14 insertions(+), 8 deletions(-)

diff --git a/drivers/hwmon/sht15.c b/drivers/hwmon/sht15.c
index 7bb2105d1ae223e7131ba4cc0523e4e074e01302..48d93c61345c1d4a00b0edd2fc452161ac90db9e 100644
--- a/drivers/hwmon/sht15.c
+++ b/drivers/hwmon/sht15.c
@@ -31,6 +31,7 @@
 #include <linux/bitrev.h>
 #include <linux/gpio/consumer.h>
 #include <linux/of.h>
+#include <linux/workqueue.h>
 
 /* Commands */
 #define SHT15_MEASURE_TEMP		0x03
@@ -976,25 +977,22 @@ static int sht15_probe(struct platform_device *pdev)
 		goto err_release_reg;
 	}
 
-	ret = devm_request_irq(&pdev->dev, gpiod_to_irq(data->data),
-			       sht15_interrupt_fired,
-			       IRQF_TRIGGER_FALLING,
-			       "sht15 data",
-			       data);
+	ret = request_irq(gpiod_to_irq(data->data), sht15_interrupt_fired,
+			  IRQF_TRIGGER_FALLING, "sht15 data", data);
 	if (ret)
 		goto err_release_reg;
 	disable_irq_nosync(gpiod_to_irq(data->data));
 	ret = sht15_connection_reset(data);
 	if (ret)
-		goto err_release_reg;
+		goto err_free_irq;
 	ret = sht15_soft_reset(data);
 	if (ret)
-		goto err_release_reg;
+		goto err_free_irq;
 
 	ret = sysfs_create_group(&pdev->dev.kobj, &sht15_attr_group);
 	if (ret) {
 		dev_err(&pdev->dev, "sysfs create failed\n");
-		goto err_release_reg;
+		goto err_free_irq;
 	}
 
 	data->hwmon_dev = hwmon_device_register(data->dev);
@@ -1007,9 +1005,13 @@ static int sht15_probe(struct platform_device *pdev)
 
 err_release_sysfs_group:
 	sysfs_remove_group(&pdev->dev.kobj, &sht15_attr_group);
+err_free_irq:
+	disable_work_sync(&data->read_work);
+	free_irq(gpiod_to_irq(data->data), data);
 err_release_reg:
 	if (!IS_ERR(data->reg)) {
 		regulator_unregister_notifier(data->reg, &data->nb);
+		cancel_work_sync(&data->update_supply_work);
 		regulator_disable(data->reg);
 	}
 	return ret;
@@ -1023,12 +1025,16 @@ static void sht15_remove(struct platform_device *pdev)
 	hwmon_device_unregister(data->hwmon_dev);
 	sysfs_remove_group(&pdev->dev.kobj, &sht15_attr_group);
 
+	disable_work_sync(&data->read_work);
+	free_irq(gpiod_to_irq(data->data), data);
+
 	ret = sht15_soft_reset(data);
 	if (ret)
 		dev_err(&pdev->dev, "Failed to reset device (%pe)\n", ERR_PTR(ret));
 
 	if (!IS_ERR(data->reg)) {
 		regulator_unregister_notifier(data->reg, &data->nb);
+		cancel_work_sync(&data->update_supply_work);
 		regulator_disable(data->reg);
 	}
 }
-- 
2.53.0
