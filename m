Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BBC9569F21
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 17:34:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791999277; cv=none; b=BwG8+dkDVF9tGkWCn3nBO1kLr20cIS3+5iC6rrkK1mC94bEz89BR9TNkyFjkKY4BAMKvxULnCHUlT8kQ7u/UvOyMZo7vUN70R0l9jwsjxfbXspagtvAtrhEHZKPQSNabypQuOqK3qifShKQnZdkGqMgKAN++cB+8ZyTrAimO4aw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791999277; c=relaxed/simple;
	bh=PcOCiIxgYYpvwoyMWaozX6BsQL3pWei0zaNRsgiiGPA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dRzsBKJ/Z46NyhEtez+UlRjtV7jLA7t6XfXW0WwAMgGf3ssxGE8iEGs0Nn/haUNFwBAYO9owzVphPpA4zFfPlzfyW11evIYTqj17Khdu6hu8SdIqqixcpjXKF8bKZa/WufbyqC00UGL9oX51wVpXSWtxKnaeuXXBmc5hPwp8ai4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g20vz3cX; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g20vz3cX"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c315729ad50so726648766b.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 10:34:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791999269; x=1792604069; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zFAEKokaXyH/sfVBC8aM5LeUwaQ1B9EiMiPXDxWTGLA=;
        b=g20vz3cXhpe2kGlK34jp0YPonDu3a9M806FhQ5yGj/MmqeFdEnqtJly8BnLiE3Xjaq
         7//wnkFX5lUti0H1+yImLuyHrVyhPHj7hNVz9zvK7ufeoNcRy34OR0BiQJuimFZIw25X
         X3gfWukU6GcwNggN6VQzIbRJpfCquOr9RxAUDNQX9n/HCYEIFKYxILPV3AlIwZy8D+dz
         SEwq7/DIoJvuFKVFrySuihNgmdtV4O5ANmeJlNm7sgCtIkyjcgzj7/Y4C4Mb0+stTjVH
         hTZM7jqdzE80TlelhavQU6pTpn5sqSIYBamTgA/umthqTEsqlePlc0pjeIG8v75Sai2v
         R2gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791999269; x=1792604069;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zFAEKokaXyH/sfVBC8aM5LeUwaQ1B9EiMiPXDxWTGLA=;
        b=vynnB7viwAwMdauTX7IIIPR0TWlKBIF6WHcrMOLUVEfcv/wVQjZ4XSyyYFD3x7PFV1
         oy0HMWqE1tjgOf34FJ0Ur44Vqw9Mh/gMIGbFODhDBlsRyhlw2yLwU6elYSk7itD6wgJR
         1OXZAZpscE/V+MQobOq8/PXWtebttrNQE75DFDTZPFMDZCGeQvcTT0HYZMvcm7mxmrOK
         nMTYgspOCnL9m2Ja6DvW/Gbq97+QWTAhW9rlVTAA7Wwr+RXo1HksG9+JTiNXBVT2vbus
         Ndb2Bgl/CFOksxTIFmvCASXBfau+xwAXlsAx/x6QdGzfIZgfD3cq1cb6ilkgA7Co91u0
         FvJg==
X-Forwarded-Encrypted: i=1; AKwUvBx0HGPECBpvYz7o4eCFIgLhHFeMnatQ/9uIhbsEQWlQznAabesUsh69IflbYX2g94dG98ZUxguJvizIp08=@vger.kernel.org
X-Gm-Message-State: AFq9FYLiRbdpYp63+rjU6hf4ZH1LXwLIFEOacUYVbsBAglwDFuvGpbMX
	KBCJQbu4lz1/Y/oeZOWuZTEOi2FxAyWb9g+RSFsApHBS2KtCWBCE72BV
X-Gm-Gg: AYBFou0vDtrHyxjrwuEFypLmfn6n69jGqh67pmuUoBnEz7mbnmuAXUF3qiApzcZ2tRV
	SnhUpsJ9HSBnS69uH4ovOY5PKtByEVfX3xPmvx93RlILNrvgll3xLqMpdwdLuy77GS6A448lRoX
	bWR2MyylSYayL5kOau74FkGALQrzJ43r2VFolY0JKsRQM/DiRikFaBjL5epVNkXz2sHt56fNqsb
	vQP4snCe0LdEvSMLdOLFwnx/vcRA3E80aZc4m31B1947XjBI+RM5zHOMuQuJGCo7TQDZQWUTALH
	SOAvRjm2f7NcK4OThb7qRrU7p1BwysbMLLeU005QWBaoubOVyt2a2GL14kT1ymA3jHHTl4G5flD
	vWUxbcSqtZo3wLH+UMazOQMsHjUDZvPeiROP/kNZua/MwoP0mgcmuzDott4/IMJmnKIBnRtfZZq
	6jT/WHETC3VJJSLBxBPscvqlI4f86QNy3EuLGX3G1iWZSR/OVU7AataCLQizuIh12uYYDor+/9k
	zDVmM/LM0CwLIMM
X-Received: by 2002:a17:907:724b:b0:c2e:1d6a:6b78 with SMTP id a640c23a62f3a-c31aa0e0cb8mr1632543966b.47.1791999268901;
        Wed, 14 Oct 2026 10:34:28 -0700 (PDT)
Received: from [127.0.1.1] ([2001:4bb8:148:f08c:65a8:f8e5:f310:5a71])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3ed963cecesm9381366b.21.2026.10.14.10.34.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 10:34:28 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Wed, 14 Oct 2026 19:34:09 +0200
Subject: [PATCH v3 10/11] hwmon: chipcap2: serialize access to the alarm
 indicators
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261014-chipcap2_locks-v3-10-27ebfc2c5b9e@gmail.com>
References: <20261014-chipcap2_locks-v3-0-27ebfc2c5b9e@gmail.com>
In-Reply-To: <20261014-chipcap2_locks-v3-0-27ebfc2c5b9e@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Javier Carrasco <javier.carrasco.cruz@gmail.com>, stable@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791999252; l=4456;
 i=javier.carrasco.cruz@gmail.com; s=20260924; h=from:subject:message-id;
 bh=PcOCiIxgYYpvwoyMWaozX6BsQL3pWei0zaNRsgiiGPA=;
 b=qvqS/uq+hwir8HDZjZVknIOfHkTB+05+LTVsSLASdvkqYGlJ/2vKgWvDwVLv5zK0sMgXJUR8d
 x2sqvg38owcCVK7aOkhuVDM1+qTiulD6aIOMmnEokNMVIyfWRg7UYQz
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=VV+hcMoOj1Sx6xSiY0W/FZNAskGZe2AagSMVj0PsmAs=

low_alarm and high_alarm are accessed from the threaded interrupt
handlers and from sysfs without any locking, which can lead to lost
alarms.

Add a mutex to serialize the access to the alarm indicators and to
process_irqs, which the handlers use to decide whether an interrupt
belongs to an ongoing operation.

Fixes: 3af350929e75 ("hwmon: Add support for Amphenol ChipCap 2")
Cc: stable@vger.kernel.org
Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Assisted-by: opencode:claude-opus-5
---
 drivers/hwmon/chipcap2.c | 58 ++++++++++++++++++++++++++++++------------------
 1 file changed, 37 insertions(+), 21 deletions(-)

diff --git a/drivers/hwmon/chipcap2.c b/drivers/hwmon/chipcap2.c
index eba6469940ab..b3b725cc7224 100644
--- a/drivers/hwmon/chipcap2.c
+++ b/drivers/hwmon/chipcap2.c
@@ -20,6 +20,7 @@
 #include <linux/i2c.h>
 #include <linux/interrupt.h>
 #include <linux/irq.h>
+#include <linux/mutex.h>
 #include <linux/module.h>
 #include <linux/unaligned.h>
 #include <linux/regulator/consumer.h>
@@ -91,6 +92,8 @@ struct cc2_data {
 	int irq_low;
 	int irq_high;
 	bool process_irqs;
+	/* protects process_irqs and the alarm indicators */
+	struct mutex irq_lock;
 	bool regulator_enabled;
 };
 
@@ -122,7 +125,8 @@ static int cc2_enable(struct cc2_data *data)
 
 	/* exclusive regulator, check in case a disable failed */
 	if (data->regulator_enabled) {
-		data->process_irqs = true;
+		scoped_guard(mutex, &data->irq_lock)
+			data->process_irqs = true;
 		return 0;
 	}
 
@@ -137,7 +141,8 @@ static int cc2_enable(struct cc2_data *data)
 
 	usleep_range(CC2_STARTUP_TIME_US, CC2_STARTUP_TIME_US + 125);
 
-	data->process_irqs = true;
+	scoped_guard(mutex, &data->irq_lock)
+		data->process_irqs = true;
 
 	return 0;
 }
@@ -154,7 +159,8 @@ static void cc2_disable(struct cc2_data *data)
 		synchronize_irq(data->irq_high);
 
 	/* ignore alarms triggered by voltage toggling when powering up */
-	data->process_irqs = false;
+	scoped_guard(mutex, &data->irq_lock)
+		data->process_irqs = false;
 
 	/* exclusive regulator, check in case an enable failed */
 	if (!data->regulator_enabled)
@@ -514,10 +520,12 @@ static irqreturn_t cc2_low_interrupt(int irq, void *data)
 {
 	struct cc2_data *cc2 = data;
 
-	if (cc2->process_irqs) {
-		hwmon_notify_event(cc2->hwmon, hwmon_humidity,
-				   hwmon_humidity_min_alarm, 0);
-		cc2->rh_alarm.low_alarm = true;
+	scoped_guard(mutex, &cc2->irq_lock) {
+		if (cc2->process_irqs) {
+			hwmon_notify_event(cc2->hwmon, hwmon_humidity,
+					   hwmon_humidity_min_alarm, 0);
+			cc2->rh_alarm.low_alarm = true;
+		}
 	}
 
 	return IRQ_HANDLED;
@@ -527,10 +535,12 @@ static irqreturn_t cc2_high_interrupt(int irq, void *data)
 {
 	struct cc2_data *cc2 = data;
 
-	if (cc2->process_irqs) {
-		hwmon_notify_event(cc2->hwmon, hwmon_humidity,
-				   hwmon_humidity_max_alarm, 0);
-		cc2->rh_alarm.high_alarm = true;
+	scoped_guard(mutex, &cc2->irq_lock) {
+		if (cc2->process_irqs) {
+			hwmon_notify_event(cc2->hwmon, hwmon_humidity,
+					   hwmon_humidity_max_alarm, 0);
+			cc2->rh_alarm.high_alarm = true;
+		}
 	}
 
 	return IRQ_HANDLED;
@@ -546,11 +556,13 @@ static int cc2_humidity_min_alarm_status(struct cc2_data *data, long *val)
 	if (ret < 0)
 		return ret;
 
-	if (data->rh_alarm.low_alarm) {
-		*val = (measurement < min_hyst) ? 1 : 0;
-		data->rh_alarm.low_alarm = *val;
-	} else {
-		*val = 0;
+	scoped_guard(mutex, &data->irq_lock) {
+		if (data->rh_alarm.low_alarm) {
+			*val = (measurement < min_hyst) ? 1 : 0;
+			data->rh_alarm.low_alarm = *val;
+		} else {
+			*val = 0;
+		}
 	}
 
 	return 0;
@@ -566,11 +578,13 @@ static int cc2_humidity_max_alarm_status(struct cc2_data *data, long *val)
 	if (ret < 0)
 		return ret;
 
-	if (data->rh_alarm.high_alarm) {
-		*val = (measurement > max_hyst) ? 1 : 0;
-		data->rh_alarm.high_alarm = *val;
-	} else {
-		*val = 0;
+	scoped_guard(mutex, &data->irq_lock) {
+		if (data->rh_alarm.high_alarm) {
+			*val = (measurement > max_hyst) ? 1 : 0;
+			data->rh_alarm.high_alarm = *val;
+		} else {
+			*val = 0;
+		}
 	}
 
 	return 0;
@@ -753,6 +767,8 @@ static int cc2_probe(struct i2c_client *client)
 
 	i2c_set_clientdata(client, data);
 
+	mutex_init(&data->irq_lock);
+
 	data->client = client;
 
 	data->regulator = devm_regulator_get_exclusive(dev, "vdd");

-- 
2.43.0

