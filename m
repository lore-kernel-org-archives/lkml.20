Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793884860;
	b=mdWDmoXtbZ5Iz45NrVDQIHElz7TrgAy0R7uHfMTnQR6UA+XYhxEYrp4yDH5TfTE6b9Es
	 FR8zYWuUkjHKVh9Ff0haVLOPeBJs4vOYEZNE/evzTTNVnfKnkgNPpd2kEGT9q92X6RExX
	 cQ59aqrZGcudO5X11PusPKdDLi2nzpjM5ajTqkaxkkiAtiwNAGp5lLOCIGwKRJLrFC1dD
	 icXdeHghEuDI8D70KwnOgM81vdrDl+QKCyOTjhiBBTlSNtlomChI9EoIrWHq35xOKbOAo
	 yPpaGLgLgLYdscgEyHprR6dI2VCe4A+d9AjoGvSqfy0NId1rrEzhuFRbONUQgKYGD5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793884860;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=1hWitpRXSGa3f1x2WsNsj66oTlqZG1AdJZX2odfdwlE=;
	b=Z0FPxo3APRjiUJWtdr9Xx5wYhPMeDObfhxGXGV8e23/RfxMD0vuhCUa52DwI6uCTkJeN
	 RTK/GbSmDScc1w3FnEbv2WD46V97xDdwnG1ZMRE91wnxaImqka+dR/QnC80odalQ0A2f8
	 7hMMXVutdHxsoBz2vHUcd5cq4am2/49zb/J7PK+WniuRMe7lEy2R3aLMWTXuJaFdN04rn
	 aIZCy9RkPTYGmfd7l++jPnJnskYtrz3SdWuwKf7xxybMWtpDp9S/XOJFIfInhDTQZ3t5w
	 DiAr/kaQnU0nI0ySgpDRygCl9apOxAdLrNsdu+0P1yEDiXeu5zLColOIVrVUpawGyHA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--sgsatyam.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="b/D3EHPA";
	arc=none smtp.remote-ip=209.85.210.200
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21311606A32F
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 13:20:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 21311606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--sgsatyam.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=b/D3EHPA
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8a0589ff620so1477957b3a.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 05:20:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793884859; x=1794489659; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1hWitpRXSGa3f1x2WsNsj66oTlqZG1AdJZX2odfdwlE=;
        b=b/D3EHPAAjWjhusoL98yh5jWlwzCV43CXQwazJ5Pa52pgCXMWNzAAkNx/5miqaRUZq
         76mDiTCXPQm+aYELtiVYGDyP65PIftPnb4Z1i785N5GK04Txu9/bsgfMakj+eJL+I4fw
         C84K+zt/C9drRRKqgjq/y7paN31Y8DpMCU3LN0NZd8Y8vCMFYAL1cs+F3M58+ZhXqy5M
         uESRtcQAAMoo1exUSa3etS7o8HzuHx3av2vQWK6op4zvYJV7l65tG6zuoQYYQdCIvTw6
         UKYQtCEtJd0LTgZ32N7YBlgvcEi0Dg3GN0EcFafSizj7XKqu67NmWcW5hFtVp4+yQzxA
         Wq/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793884859; x=1794489659;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1hWitpRXSGa3f1x2WsNsj66oTlqZG1AdJZX2odfdwlE=;
        b=p2NW22q8Gmz829xyepoJDHv8LZ77SaJy+IO1PF1HFJCP7HKWBLeH0wOApENxhps5bv
         PySAAtC70peaJLsSpyiJjqEoyY9gcRZUYmXaiKFUNbD4ottIHh7bnHDP09gVLrno2953
         zrpotRc4yE4UHimRF5/3dBOQc9YQPeczRX81w04hx4fv83By7z43N4ILUacWeY70E2kS
         qlbvyjn7R39C2MciIlxhnHVuDnFCNEnyI+EFCWYukAoS6LWggS5QqyxsKQ88hujKCbZ9
         cAAgSsZG3oHuT7RkeHesu1aL1milb7Rjzu/V6C1lh9dogLOH2Cb7k0lQIcoHLl93iQLe
         4t9w==
X-Forwarded-Encrypted: i=1; AKwUvByHXsUwuVQ0bgPny0W4sTMBX7nUO8QAWA1PMHJ1jfpqU1aWK1AJvZabhNlJpj2PW/j4BNK0/kyOr6jqj/0=@vger.kernel.org
X-Gm-Message-State: APuU4Z/AJLHioLu12OxYeJ3s2GuGZt1JVup1s4H2zmdsuWkqYGVk9Aqc
	+5WueAcE1O3yWSV13b20Ulz/4jPLp8dVutxSv2iJdklaR65qYByG7cTkfe+KZMpjMVRX6cYv0tA
	Dz3X0Qp6jmOeafg==
X-Received: from pgme25-n2.prod.google.com ([2002:a05:6a02:6c99:20b0:cd8:c5f8:e73d])
 (user=sgsatyam job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6300:68cb:20b0:3eb:818f:619a with SMTP id adf61e73a8af0-3eb818f7477mr3915541637.33.1793884859215;
 Thu, 05 Nov 2026 05:20:59 -0800 (PST)
Date: Thu,  5 Nov 2026 13:20:57 +0000
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.398.g882cbad275-goog
Message-ID: <20261105132057.2429385-1-sgsatyam@google.com>
Subject: [PATCH v2] iio: cros_ec: Use platform sensor_num to unregister FIFO callback
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

No in-tree driver changes the field after probe, so mainline is not
known to hit this. The ChromeOS RGB light sensor support does: it
changes the field while a command is in flight, and unbinding the
device then leaves a stale callback. Found by an AI code review agent.

Use the platform data in the cleanup action too, so it always
unregisters the slot that cros_ec_sensors_core_register() registered.

Fixes: aa984f1ba4a4 ("iio: cros_ec: Register to cros_ec_sensorhub when EC supports FIFO")
Signed-off-by: Satyam Gupta <sgsatyam@google.com>
---
Changes in v2:
- Add a Fixes tag (Andy).
- Use a local struct device pointer and name the platform data pdata,
  so the unregister call fits on one line (Andy).
- Say what triggers the problem and how it was found.

v1: https://lore.kernel.org/r/20261105073107.172121-1-sgsatyam@google.com

The patch was drafted with an LLM-based coding assistant (Gemini); I
reviewed and tested it.

Tested on downstream kernels, together with fixes to the out-of-tree
RGB light sensor support: ChromeOS 6.6 (Intel) and Android desktop 6.12
(MediaTek) and 6.18 (Intel). Unbinding and binding the light sensor
while its RGB channel is read in a loop failed within 1 to 46 cycles
without the fixes (the stale callback slot makes the next probe fail
with -EINVAL) and passed 200 cycles with them on all three. On the 6.12
device the accelerometer and gyroscope were also unbound and bound
repeatedly and still streamed FIFO samples. Mainline itself was only
build-tested (W=1 and sparse, x86_64 and arm64).

 .../iio/common/cros_ec_sensors/cros_ec_sensors_core.c  | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/iio/common/cros_ec_sensors/cros_ec_sensors_core.c b/drivers/iio/common/cros_ec_sensors/cros_ec_sensors_core.c
index d03e40c91582..632036eea4f3 100644
--- a/drivers/iio/common/cros_ec_sensors/cros_ec_sensors_core.c
+++ b/drivers/iio/common/cros_ec_sensors/cros_ec_sensors_core.c
@@ -214,13 +214,11 @@ EXPORT_SYMBOL_GPL(cros_ec_sensors_push_data);
 static void cros_ec_sensors_core_clean(void *arg)
 {
 	struct platform_device *pdev = (struct platform_device *)arg;
-	struct cros_ec_sensorhub *sensor_hub =
-		dev_get_drvdata(pdev->dev.parent);
-	struct iio_dev *indio_dev = platform_get_drvdata(pdev);
-	struct cros_ec_sensors_core_state *st = iio_priv(indio_dev);
-	u8 sensor_num = st->param.info.sensor_num;
+	struct device *dev = &pdev->dev;
+	struct cros_ec_sensorhub *sensor_hub = dev_get_drvdata(dev->parent);
+	struct cros_ec_sensor_platform *pdata = dev_get_platdata(dev);
 
-	cros_ec_sensorhub_unregister_push_data(sensor_hub, sensor_num);
+	cros_ec_sensorhub_unregister_push_data(sensor_hub, pdata->sensor_num);
 }
 
 /**

base-commit: 1390ca4953a7400ca932cb49635f02c727f885a6
-- 
2.56.0.398.g882cbad275-goog

