Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792453447;
	b=P4QYCNjVEfwskH/rQvMxsRuWdIFkeVq0O9IYo+Jg9ZW3MtXNimERqwZGDJwcUqbXCwJc
	 YMs4oUn2TzwDQItNphkyf1WKhIzmX+Xo9yXllOwUlbSPCzfe0lfn1UaOd06pbo1K/JjNG
	 Yjvbr9uyCBUZQ4QJO8wTI+u4zk/maUJxgKj72Zu1aTsnj7S/9MBcjlHjc6wxmswGmAEql
	 1XBEpxWJGXdlFR9ZP9y6yf9w4o0sJmD1Ii8+7wM3GYvB3m5H+6feJ4inko7lmdzvwxCEl
	 ME9iL6DoZFq21HyvC5U6gVbGjC89Sunlkv8tMU+1kEJxV+lV8g7qdbpRYyOL62BUwww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792453447;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=E8//VKOKqUwtACIysG7fG7TZagG/n7IG4lGWpRQho/I=;
	b=JDQ9x7+SQS94ZgNl6dnFrRBUosSjVOwJXNOHACHNUhzL1wJP9Fz/Q9EMx7PY5xrOeTDQ
	 cVRwBqyqLt4IjMrE2756QlP5geQAmagvjj8bNYSWrYTabBNEC9LGPznBAwsJTz6H+SMSe
	 Oc1c4UP6LkuhJhKd1kQ26oKXZQDKWHbUy8AtSsC/AFvfu2P3/LKZNyGSWXGhPjzDzUtFi
	 F3xVnQ2/EXvQ9F0QqhFZj95yvpprfauYtfOAaMreoVC20tcxTJS7IIolHw+v11QvmP3SR
	 QEf83WiSZsF+ZjAdvbgXxKWSMwop34GiWfXoCEkJ3otqN0ZIXBt8Nzw5ywpZeIruRWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=KLMbVLGp;
	arc=none smtp.remote-ip=209.85.219.53
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4345606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 23:44:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C4345606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=KLMbVLGp
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-9178d514951so22104596d6.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 16:44:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792453446; x=1793058246; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=E8//VKOKqUwtACIysG7fG7TZagG/n7IG4lGWpRQho/I=;
        b=KLMbVLGp79DW6EzDG8a0J0/b20rzyKRJGq930fvaCOdt4psjgGzwmjFCpd6rtxwZQD
         dTEy3lOSCZcZOqS/O5vMctISJC/gu7r/Bea7YRv8/rFQjh2Jy9Bjx2oUpdLoGhSvlCj7
         H/3iUc31+V5333uipexxtfLTrI0FAMIabAZhg6X20T9VJzYB4MHSv57xkmMU98kkEp8J
         YYYf5ZDhzaBzw5Cygtzn3T1YoP+4JqLV91z0iMq92Z4m2X7yI6UjE7r1CxBc5S+7KmjI
         s7YCTDcHWEUu5UMDkvCQCtI6cAZUXU9touUzUB8zolJvwSoKAw5p85FJSvLSSWNTXm1P
         h+Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792453446; x=1793058246;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E8//VKOKqUwtACIysG7fG7TZagG/n7IG4lGWpRQho/I=;
        b=GXTMPb0etyB+HRJAsK/FLmp2pwEpYPI4vQs+mvuoEdCwxq+GU76Z2aBtClFnzKuvTG
         xS8m/MlWamrsqDjgO2gGKW42/qSUPFv0InhirGepMzTXj2n4WOITFOFfH70UzhyZcXJY
         1siaXYBEZ/UpmNTmgjSp12Y7NLfPB7tZP4dp8k1X7PgJB3uRnvNrGSVg7AVeKf7+re91
         LwrVlSVVkSsMa/l22HIh43Jun5AjGlZaWtPbVjA8fsA3nXeHE3awOcmYUiDC/XUhWdjg
         8wzPNMgUbboUpfTkgaG5SJ6JEmmC4NeCR/HyX6GMcx90NjReO1wivqT/j3xi+94xx8Mg
         BDsQ==
X-Forwarded-Encrypted: i=1; AKwUvBwsPNNDHGwfNe413ZxUpbc41f4rcjlDdlGhDG7amxYSgjBTI45wzvpEvLX5xCb46uE34Zo7QThDzmf9CtQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYKhbj3UMT3Eqcpr9oW617vBYCUwVpr03bj9N10bDtSjF3b7clrN
	5wSJ7sW7WyhI/s4Gvv2QODHyQyb7BNqqEejfYyGmHj4/YbUyTJozpvo=
X-Gm-Gg: AYBFou2ovemaHXG+0u1Lf4EJQ3zIRc7qnAcL5TlrcH3pBFsgAyHRaJcU+1IXS7fFslr
	qqSQ0jqGOm27CNUVVJgaqLXvy+Sv6cNUyFVgZwxu3B1DONmxjn/jeC5t3XX8zqS+5Gy300EeWk3
	CrhGn8JqeuuRl7eKy4q6K7Q43P2QHDceQTWj6z1uTGUW/DNp5pABV0FONDWMMp4tbnoqCQ4PU6A
	dTICXvYQ+orQ5A7uM/wnkcCaZqv1ivzD34QynEokEnmqK2Cp6ktd7tjvqCUSX5avgNR4EIXZ17u
	qrX5xW4+SLArKOJY3Hu/yHFJCqDeOt1+6ZBltVJmP3HTmEKiSYfkO7f+MX0hweoC9xQ3KLOYcbD
	2hMyeg/def+ZrGLguVMwCNsg57StFdhpCtEqaAec0kYnZLhQT+5yo6uYyM5o463VdvUTf7gKU6L
	4qnzz1OfNkhfZ/B/P9e/Wd68BiyrHV9fxEMO2pvsetDbt0LiOKgXSfBnNMVj0RU3ZyHb0FX69hR
	PjqPMJfMiZyrytrR7YGQyqmtW4PV9xEiLLwi3Q0RaOLs4QJe9ldm+sPzXMMRvu/R9IaNL4Ci3ea
	Z5pnh+UPZYSwFWoy3290+9ueptRU
X-Received: by 2002:a05:6214:27e6:b0:91b:8b44:d4be with SMTP id 6a1803df08f44-91bdf130304mr162456196d6.28.1792453445586;
        Mon, 19 Oct 2026 16:44:05 -0700 (PDT)
Received: from i4-gl-tmk5904-1.ad.psu.edu ([130.203.156.90])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91c0408c4c2sm9620256d6.20.2026.10.19.16.44.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 16:44:04 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ijae Kim <ae878000@gmail.com>
Subject: [PATCH v2] hwmon: (sht15) Stop deferred work before releasing its resources
Date: Mon, 19 Oct 2026 19:44:02 -0400
Message-ID: <20261019234402.805759-1-mhun512@gmail.com>
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

The IRQ handler can queue read_work, which accesses GPIOs and may re-enable
that same IRQ.  A measurement can return while read_work is still pending
or running.  The regulator notifier can also queue update_supply_work,
which accesses the regulator.  Neither work item was drained on removal
or on all probe failure paths before the managed resources were released.

Use request_irq() and free_irq() since the IRQ must be released at an
explicit point in the teardown sequence.  Disable and drain read_work
before freeing the IRQ.  Unregister the regulator notifier before draining
update_supply_work and disabling the regulator.

Use IRQF_NO_AUTOEN to ensure that the IRQ stays disabled until the first
measurement, rather than enabling it briefly between request_irq() and
disable_irq_nosync().  Cache the IRQ number and check errors from
gpiod_to_irq().

Fixes: 251eb40f5ccd ("hwmon: sht15 humidity sensor driver")
Assisted-by: LLM
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
Compile-tested (W=1). No runtime testing.

Changes in v2:
- Replace managed IRQ request/free with request_irq()/free_irq().
- Use IRQF_NO_AUTOEN and cache the data GPIO IRQ.
- Preserve asynchronous work drain ordering on probe failure and remove.

 drivers/hwmon/sht15.c | 47 +++++++++++++++++++++++++++++++++--------------
 1 file changed, 33 insertions(+), 14 deletions(-)

diff --git a/drivers/hwmon/sht15.c b/drivers/hwmon/sht15.c
index 7bb2105d1ae223e7131ba4cc0523e4e074e01302..c95acec7ae2f8f57a10bd72f65a2905e64c3c58c 100644
--- a/drivers/hwmon/sht15.c
+++ b/drivers/hwmon/sht15.c
@@ -31,6 +31,7 @@
 #include <linux/bitrev.h>
 #include <linux/gpio/consumer.h>
 #include <linux/of.h>
+#include <linux/workqueue.h>
 
 /* Commands */
 #define SHT15_MEASURE_TEMP		0x03
@@ -120,6 +121,7 @@ static const u8 sht15_crc8_table[] = {
  * struct sht15_data - device instance specific data
  * @sck:		clock GPIO line
  * @data:		data GPIO line
+ * @irq:		interrupt number for the data GPIO line.
  * @read_work:		bh of interrupt handler.
  * @wait_queue:		wait queue for getting values from device.
  * @val_temp:		last temperature value read from device.
@@ -149,6 +151,7 @@ static const u8 sht15_crc8_table[] = {
 struct sht15_data {
 	struct gpio_desc		*sck;
 	struct gpio_desc		*data;
+	int				irq;
 	struct work_struct		read_work;
 	wait_queue_head_t		wait_queue;
 	uint16_t			val_temp;
@@ -532,9 +535,9 @@ static int sht15_measurement(struct sht15_data *data,
 		return ret;
 	atomic_set(&data->interrupt_handled, 0);
 
-	enable_irq(gpiod_to_irq(data->data));
+	enable_irq(data->irq);
 	if (gpiod_get_value(data->data) == 0) {
-		disable_irq_nosync(gpiod_to_irq(data->data));
+		disable_irq_nosync(data->irq);
 		/* Only relevant if the interrupt hasn't occurred. */
 		if (!atomic_read(&data->interrupt_handled))
 			schedule_work(&data->read_work);
@@ -546,7 +549,7 @@ static int sht15_measurement(struct sht15_data *data,
 		data->state = SHT15_READING_NOTHING;
 		return -EIO;
 	} else if (ret == 0) { /* timeout occurred */
-		disable_irq_nosync(gpiod_to_irq(data->data));
+		disable_irq_nosync(data->irq);
 		ret = sht15_connection_reset(data);
 		if (ret)
 			return ret;
@@ -825,7 +828,7 @@ static void sht15_bh_read_data(struct work_struct *work_s)
 		 * have gone low in meantime so verify it hasn't!
 		 */
 		atomic_set(&data->interrupt_handled, 0);
-		enable_irq(gpiod_to_irq(data->data));
+		enable_irq(data->irq);
 		/* If still not occurred or another handler was scheduled */
 		if (gpiod_get_value(data->data)
 		    || atomic_read(&data->interrupt_handled))
@@ -976,25 +979,31 @@ static int sht15_probe(struct platform_device *pdev)
 		goto err_release_reg;
 	}
 
-	ret = devm_request_irq(&pdev->dev, gpiod_to_irq(data->data),
-			       sht15_interrupt_fired,
-			       IRQF_TRIGGER_FALLING,
-			       "sht15 data",
-			       data);
-	if (ret)
+	data->irq = gpiod_to_irq(data->data);
+	if (data->irq < 0) {
+		ret = data->irq;
+		goto err_release_reg;
+	}
+
+	ret = request_irq(data->irq, sht15_interrupt_fired,
+			  IRQF_TRIGGER_FALLING | IRQF_NO_AUTOEN,
+			  "sht15 data", data);
+	if (ret) {
+		dev_err(&pdev->dev, "failed to get irq for data line\n");
 		goto err_release_reg;
-	disable_irq_nosync(gpiod_to_irq(data->data));
+	}
+	/* IRQ remains disabled until a measurement starts. */
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
@@ -1007,9 +1016,14 @@ static int sht15_probe(struct platform_device *pdev)
 
 err_release_sysfs_group:
 	sysfs_remove_group(&pdev->dev.kobj, &sht15_attr_group);
+err_free_irq:
+	/* The read worker can re-enable the IRQ, so drain it first. */
+	disable_work_sync(&data->read_work);
+	free_irq(data->irq, data);
 err_release_reg:
 	if (!IS_ERR(data->reg)) {
 		regulator_unregister_notifier(data->reg, &data->nb);
+		cancel_work_sync(&data->update_supply_work);
 		regulator_disable(data->reg);
 	}
 	return ret;
@@ -1023,12 +1037,17 @@ static void sht15_remove(struct platform_device *pdev)
 	hwmon_device_unregister(data->hwmon_dev);
 	sysfs_remove_group(&pdev->dev.kobj, &sht15_attr_group);
 
+	/* The worker can re-enable the IRQ, so stop it before free_irq(). */
+	disable_work_sync(&data->read_work);
+	free_irq(data->irq, data);
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
2.47.3
