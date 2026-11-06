Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793949547;
	b=HBZrJTfGjAkDOwyQTp7HjbL3eLjS1qu3x721ULrrKvMOUUPnxVPjtZ5ZvnO+kqhm1hi8
	 9aMVbtMthBndS+sCujnVzXBobaEFiPDWQNWhFZEX8pU8ULsEJH2DBkJDB+JGPg8News0/
	 lr8yfyfyn0EXgUeOomOB6L/lAlKl43e5Aiz4LAcRjE3p3AuUgsnpFCGHPkVln03Hp8E8+
	 ffSzDVWNEyFdmYTKPwwRUjilFcPaC8v3X8TkZM0HQVyxz9HueUoUk2FYj5QtMfYdQQZxM
	 c4x3U5x+GoV3yTvYCekPx7fPFrjv+8Ple3wh7/JISk1DORjX+Fu7X/qjZxsdrRaxPgQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793949547;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=pIjZ/Y8hQqw73CpdFq92aAVG0/oq5u/tSDIP7hM67k8=;
	b=j4OmGGFewAXjPyCKq3+m23WXOm0aVKzSqttkr5h5KgEYXylS0USq5lMzOGc/1idHR66z
	 IdFLHKX4MvP0A0lNRl7a1ikCawDkDjry7k1cis+st0Yhx6qZY/ealHar7Rw3YxvSvBlpk
	 CuharilwjXO3m7olkRjfBSLGUpEKZA4QQ/pAoxTDGRh+z0grCMSp5ddYmtuBhcbjLNmf0
	 eUmhBG+dP6EkKYrvThQpUrNQ98IaMAQrwDpEX0Cixo+4jNrabWWIXHVF2M+0jPt1Atg3B
	 14km4RvT8Zo3bSMbatwccGp0wlFmUk/7B6rvDIqBeSw2M/IXZZmk9atiEn+MjfjcnzA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--sgsatyam.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Wgbpr5am;
	arc=none smtp.remote-ip=209.85.210.200
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37194606A328
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 07:19:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 37194606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--sgsatyam.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Wgbpr5am
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8a086ed8980so308649b3a.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 23:19:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793949546; x=1794554346; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pIjZ/Y8hQqw73CpdFq92aAVG0/oq5u/tSDIP7hM67k8=;
        b=Wgbpr5amGdq3oBCrEMDJW4Jq82wMjH3VyiVfYL8kqtY5T5dUyegu7PtB1lsVcb/dRa
         ymojuAcJhpJKJa1kyGb0G6QBR1l2mWwChJT7FXfIhxjqSe1piLdZByDaWkGF1mHjbxe4
         p1WcihaapscRM6zytQHN73izR2PCoOrUPrNgN1KiG2nbS5PoshDKIL8x2Ro94ZMFyOj6
         7mSo8jy7R2g1I1J9W0eYUxmH4AkrHUkA9+Avl7BywGOTonqL/kTuJ8ViOmNJd0RS3BLJ
         ds/T4OrBX1Q2fE3qEenxs89NJycvINnOkLLYGJaoELkxaCnAmOUTExOaZtCqlzuqQVqD
         L1kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793949546; x=1794554346;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pIjZ/Y8hQqw73CpdFq92aAVG0/oq5u/tSDIP7hM67k8=;
        b=tre1t2sWPcNTyOFlpZhWXukRTdVsWf21GEllbwAebV21l78FScfr4vOzHoRIJPJel8
         POHaX1rx3s1n96M3bYk1tK3lAf9Trv8R7Ty2lNkEIZAjQV75q2D9JtxYbIj1Tr3N3fhP
         z5hHep0DZbcSaxQHYqRhboNMbEqb1WYrJuLxBg79ZgHCMXfiLr/Tg1qpgy1qIXLBnNrA
         30rKgh3e9ZgAFEEmV3JYIbrD/NqpGGD4H5sNkNX7nlEwGzkrGTiA8ChWp1IGhbUJh0oo
         fM5jCwRASltpjneG5GfoA4lJ1TUeutEInjc+qbiiEatfSPQqLr5bQTvSaV9AVQvBemNf
         ks0w==
X-Forwarded-Encrypted: i=1; AKwUvBzlzKO+RZTKHHLHEMX8iBpSA2McvCc/RnxVPdzUPq5dm03cYtPaBkRE+2ceM1DSjpend0RUqCM0ZkEN34I=@vger.kernel.org
X-Gm-Message-State: APuU4Z9AJ3FppD/lda1BQPrIVB0WdMTP6z2mKOOLp9jm6slHQ16zNfgy
	uYoN2EmkuFiJO1RNScb/oAZS37NXBykOZ+LQazpFt2V/1PrbrEaawIdfOOSguaCu7Y1OL8+hhsh
	AlPJUZ4jGuiyR2w==
X-Received: from pfem17.prod.google.com ([2002:a05:6a00:c091:b0:89b:34dc:b094])
 (user=sgsatyam job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:188e:b0:89f:2b65:2ad with SMTP id d2e1a72fcca58-8b1e5967803mr3971036b3a.27.1793949546203;
 Thu, 05 Nov 2026 23:19:06 -0800 (PST)
Date: Fri,  6 Nov 2026 07:19:04 +0000
In-Reply-To: <au1FF5K9EALuqnNR@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <au1FF5K9EALuqnNR@google.com>
X-Mailer: git-send-email 2.56.0.455.g6c5a503b38-goog
Message-ID: <20261106071904.142937-1-sgsatyam@google.com>
Subject: [PATCH v3] iio: cros_ec: Use platform sensor_num to unregister FIFO callback
From: Satyam Gupta <sgsatyam@google.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>, "=?UTF-8?q?Nuno=20S=C3=A1?=" <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Andy Shevchenko <andriy.shevchenko@intel.com>, 
	Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
	Tzung-Bi Shih <tzungbi@kernel.org>, Enric Balletbo i Serra <eballetbo@kernel.org>, linux-iio@vger.kernel.org, 
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

cros_ec_sensors_core_register() registers the FIFO callback for the
sensor number found in the platform data. The matching cleanup action,
cros_ec_sensors_core_clean(), reads the number back from
st->param.info.sensor_num instead.

st->param is the EC host command buffer. Drivers fill it in under
cmd_lock before each command, while the cleanup action reads it without
that lock. It is also set only for physical sensors. If the field holds
another value when the device is unbound, the cleanup clears the wrong
slot and leaves the callback in place, still pointing to the iio_dev
that is about to be freed.

Use the platform data in the cleanup action too, and pass the struct
device pointer directly to devm_add_action_or_reset(), so it always
unregisters the slot that cros_ec_sensors_core_register() registered.

Fixes: aa984f1ba4a4 ("iio: cros_ec: Register to cros_ec_sensorhub when EC supports FIFO")
Signed-off-by: Satyam Gupta <sgsatyam@google.com>
---
Changes in v3:
- Pass dev instead of pdev to devm_add_action_or_reset() and drop the
  unused pdev local variable (Tzung-Bi).
- Move the note about out-of-tree triggers and how the issue was found
  below '---' (Tzung-Bi).

Changes in v2:
- Add a Fixes tag (Andy).
- Use a local struct device pointer and name the platform data pdata,
  so the unregister call fits on one line (Andy).
- Say what triggers the problem and how it was found.

v2: https://lore.kernel.org/r/20261105132057.2429385-1-sgsatyam@google.com
v1: https://lore.kernel.org/r/20261105073107.172121-1-sgsatyam@google.com

No in-tree driver changes st->param.info.sensor_num after probe, so
mainline is not known to hit this. The ChromeOS out-of-tree RGB light
sensor support does: it changes the field while a command is in flight,
and unbinding the device then leaves a stale callback. Found by an AI
code review agent.

The patch was drafted with an LLM-based coding assistant (Gemini); I
reviewed and tested it.

Tested on downstream kernels, together with fixes to the out-of-tree
RGB light sensor support: ChromeOS 6.6 (Intel) and 5.10 (MediaTek), and
Android desktop 6.12 (MediaTek) and 6.18 (Intel). Unbinding and binding
the light sensor while its RGB channel is read in a loop failed within
1 to 46 cycles without the fixes (the stale callback slot makes the
next probe fail with -EINVAL) and passed 200 cycles with them on all
four. On the 6.12 device the accelerometer and gyroscope were also
unbound and bound repeatedly and still streamed FIFO samples. Mainline
itself was only build-tested (W=1 and sparse, x86_64 and arm64).

 .../common/cros_ec_sensors/cros_ec_sensors_core.c  | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

diff --git a/drivers/iio/common/cros_ec_sensors/cros_ec_sensors_core.c b/drivers/iio/common/cros_ec_sensors/cros_ec_sensors_core.c
index d03e40c91582..67fb53071684 100644
--- a/drivers/iio/common/cros_ec_sensors/cros_ec_sensors_core.c
+++ b/drivers/iio/common/cros_ec_sensors/cros_ec_sensors_core.c
@@ -213,14 +213,11 @@ EXPORT_SYMBOL_GPL(cros_ec_sensors_push_data);
 
 static void cros_ec_sensors_core_clean(void *arg)
 {
-	struct platform_device *pdev = (struct platform_device *)arg;
-	struct cros_ec_sensorhub *sensor_hub =
-		dev_get_drvdata(pdev->dev.parent);
-	struct iio_dev *indio_dev = platform_get_drvdata(pdev);
-	struct cros_ec_sensors_core_state *st = iio_priv(indio_dev);
-	u8 sensor_num = st->param.info.sensor_num;
+	struct device *dev = arg;
+	struct cros_ec_sensorhub *sensor_hub = dev_get_drvdata(dev->parent);
+	struct cros_ec_sensor_platform *pdata = dev_get_platdata(dev);
 
-	cros_ec_sensorhub_unregister_push_data(sensor_hub, sensor_num);
+	cros_ec_sensorhub_unregister_push_data(sensor_hub, pdata->sensor_num);
 }
 
 /**
@@ -372,7 +369,6 @@ int cros_ec_sensors_core_register(struct device *dev,
 {
 	struct cros_ec_sensor_platform *sensor_platform = dev_get_platdata(dev);
 	struct cros_ec_sensorhub *sensor_hub = dev_get_drvdata(dev->parent);
-	struct platform_device *pdev = to_platform_device(dev);
 	struct cros_ec_dev *ec = sensor_hub->ec;
 	int ret;
 
@@ -391,7 +387,7 @@ int cros_ec_sensors_core_register(struct device *dev,
 		return ret;
 
 	return devm_add_action_or_reset(
-			dev, cros_ec_sensors_core_clean, pdev);
+			dev, cros_ec_sensors_core_clean, dev);
 }
 EXPORT_SYMBOL_GPL(cros_ec_sensors_core_register);
 

base-commit: 1390ca4953a7400ca932cb49635f02c727f885a6
-- 
2.56.0.455.g6c5a503b38-goog

