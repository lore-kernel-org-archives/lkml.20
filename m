Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794381973;
	b=LLc5ySm9PkZkC5QbmUeUX83Fs8O6AaPuZhRx9pGdOu3Ivyfoypfy8uG84TN/K3Fi3Jhn
	 5awENmAw4VAU1XlLn4rOGTXDtDHDZ8bdnZMCvGhO7boopRcH9M5mdG+WkFhNijVMsvQ8+
	 K2pSYA2odzNJV2CaMMa3e5ek/CpAcKJFfwS6fEJPZhwBCh+RrlXajx4KlIrf3u4YM8j75
	 gOreGzqQPWbNSPUJ4ZvO5DRh22sjVtasRgtbQhvsVAOLD+ykSmI9amBeSdiATGMlAU0SD
	 PzJGRB37Y1weVsZBiRSMVrlmzWwkkuUnr0Rza/GhJ7KSyV2UyGKLhknuVvGH6tllkQg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794381973;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=qyaSt7rfLd9UWAEQmgIczF6QNCmMTt6/VnKgUqvfogg=;
	b=ziAKXS1Z1Q/zlZzDWiheUR099Yn0G05Orr36i3mTqlIN8XAJIPWASyToHCdn7yOVncsb
	 YxzqY25aBFdcdoLzzOA0yLWNxA7Q23dSSZBrt50V38bGnh79gp7JsAVGcf3JUYFc9rm8S
	 KzYgpSJxSweu1GQHYc6LIeNlTbwlQN3vogmPd/3Z1nSetkZypqfj/7YvSzwugUeIXcKQ/
	 kTcOId3j7GXvY0HWUf9BoJAqTqLzGJBYyG1+Bcp/bGZtEq78KbZ7bWDMFtnePjTxJD4jW
	 fVlJ3o8JsDqSNVMOvBtvMDP9e4hM4W4mkDa2kYt+skZaz2XL4XAmxveFINrkSX3MELg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--diwux.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=g3eQ1Cny;
	arc=none smtp.remote-ip=209.85.214.199
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B88E0606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 07:26:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B88E0606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--diwux.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=g3eQ1Cny
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2eb2437d752so43889405ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 23:26:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794381972; x=1794986772; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qyaSt7rfLd9UWAEQmgIczF6QNCmMTt6/VnKgUqvfogg=;
        b=g3eQ1CnyLlQsKsZymv0bDk8q4DGsjqeZHEjvGdX2RYTSTmPWoN3RdVQSpAGFn4vzaT
         s3459hiWtWC1j0N023EK/eF0deSwiC6J4u/PXy4O+GfR/qWDZm2P/rVX3M9SBKppwa6C
         1iEvj2jToxB7qnjgM4YDhzfMkdkeluH+c9yiBopin6UJI18uS41SUk86ZbeiHxNFd/Qw
         3gXmM98VhAGNxd1g8Pqk152u9XVt1PUmOqB3Yiq7jBk5GBhecn8WsBw/Hpp0E/6McOtX
         Wmz9lDJwuMxDlJjYAKAZuAeo+JCqrsCIIr9hHutG5DCQLfI9AufRKar284FAJPh2Md44
         RreA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794381972; x=1794986772;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qyaSt7rfLd9UWAEQmgIczF6QNCmMTt6/VnKgUqvfogg=;
        b=MobPBz6sOoeE9+1VaFBnvmugw0HTcq31sEV+qilS2vort9JbsGIo7abLsSazxeGrsZ
         V4Z5YDJs1ZvUWxOQLqjaMHbRds1Huet3URckuMCyd6MILUB3BtOvPw6x8EsXXR9oYBbR
         dZDoJrnGi6pEQLaOR/rF7DxJ28lZrK3NxazsPN3PBa4txKY2cLTmEh3U0CKscJWvJfws
         1JunK3S3DUNMuhv98cQprtuMlasShCBI0lXabHTyeLadYAKrf2HUx34YfYUhTJ5RFLDb
         jIWPNsV83+omV4RerttA0EjfqbFV+qQJOmlEw9Fewa5B3nagQgNqI25YE/7doURjewLd
         CZgg==
X-Forwarded-Encrypted: i=1; AL+hErEhW7RxoA3xTY7SzHK9MBetpo9Ntv4GFguhOq2qhdRkIz3+yIt81F2G6fahwOrkJxUNPjEjhfPJY7ELC+4=@vger.kernel.org
X-Gm-Message-State: APuU4Z91f9ZMAj5wU/N2oqJHWQMYciH7a3A4ByHx1ZET2AKzVQU7DYcq
	clBAykoELOCIsVZsHUpC8IThqm7ywJh0U3GyQklo8bCmEYnSUrJ0hIcFSlX3pJvu5pA8U7KAtwt
	2Pg==
X-Received: from pla14.prod.google.com ([2002:a17:902:ffce:b0:2ea:7f9c:2ce])
 (user=diwux job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:f78d:b0:2ed:e22b:779f
 with SMTP id d9443c01a7336-2ede22b8363mr6850925ad.58.1794381971881; Tue, 10
 Nov 2026 23:26:11 -0800 (PST)
Date: Wed, 11 Nov 2026 07:26:08 +0000
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.542.g3ef89b7020-goog
Message-ID: <20261111072608.3490763-1-diwux@google.com>
Subject: [PATCH] iio: cros_ec: use sysfs_emit() in show callbacks
From: Di Wu <diwux@google.com>
To: jic23@kernel.org
Cc: dlechner@baylibre.com, nuno.sa@analog.com, andy@kernel.org, 
	bleung@chromium.org, groeck@chromium.org, tzungbi@kernel.org, 
	linux-iio@vger.kernel.org, chrome-platform@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Di Wu <diwux@google.com>
Content-Type: text/plain; charset="UTF-8"

Replace sprintf() and snprintf() with sysfs_emit() in the sysfs show
and ext_info read callbacks. sysfs_emit() is aware of the sysfs buffer
PAGE_SIZE limit and is the preferred helper for show callbacks.

Signed-off-by: Di Wu <diwux@google.com>
---
 .../iio/common/cros_ec_sensors/cros_ec_sensors_core.c  | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/iio/common/cros_ec_sensors/cros_ec_sensors_core.c b/drivers/iio/common/cros_ec_sensors/cros_ec_sensors_core.c
index d03e40c91582..624d4b32b034 100644
--- a/drivers/iio/common/cros_ec_sensors/cros_ec_sensors_core.c
+++ b/drivers/iio/common/cros_ec_sensors/cros_ec_sensors_core.c
@@ -149,9 +149,9 @@ static ssize_t cros_ec_sensor_get_report_latency(struct device *dev,
 	if (ret < 0)
 		return ret;
 
-	return sprintf(buf, "%d.%06u\n",
-		       latency / 1000,
-		       (latency % 1000) * 1000);
+	return sysfs_emit(buf, "%d.%06u\n",
+			  latency / 1000,
+			  (latency % 1000) * 1000);
 }
 
 static IIO_DEVICE_ATTR(hwfifo_timeout, 0644,
@@ -165,7 +165,7 @@ static ssize_t hwfifo_watermark_max_show(struct device *dev,
 	struct iio_dev *indio_dev = dev_to_iio_dev(dev);
 	struct cros_ec_sensors_core_state *st = iio_priv(indio_dev);
 
-	return sprintf(buf, "%d\n", st->fifo_max_event_count);
+	return sysfs_emit(buf, "%d\n", st->fifo_max_event_count);
 }
 
 static IIO_DEVICE_ATTR_RO(hwfifo_watermark_max, 0);
@@ -465,7 +465,7 @@ static ssize_t cros_ec_sensors_id(struct iio_dev *indio_dev,
 {
 	struct cros_ec_sensors_core_state *st = iio_priv(indio_dev);
 
-	return snprintf(buf, PAGE_SIZE, "%d\n", st->param.info.sensor_num);
+	return sysfs_emit(buf, "%d\n", st->param.info.sensor_num);
 }
 
 const struct iio_chan_spec_ext_info cros_ec_sensors_ext_info[] = {

base-commit: b70566610b48ba49dec636019da4d696db64b085
-- 
2.56.0.455.g6c5a503b38-goog

