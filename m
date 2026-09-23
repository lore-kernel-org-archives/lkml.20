Received: from mail-wr2-f35.google.com (mail-wr2-f35.google.com [74.125.225.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4219F49B47F
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 11:08:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790161684; cv=none; b=Cosw6RNqid2XBYpheUG/ULNcgAIrN8rBu+1pVblkppjCGss8y0zBwabpUk7CG2UplhgjzgHzUf96igy4ZpthmrOrMec3ociQYCp7mBdv5+CFfqARtAyArpn9fvWREBh6w8lhaz+RdoKl9G4QMdZTj+aUoEUTNVozo+3ffwSAzKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790161684; c=relaxed/simple;
	bh=uR9Z3Kd1DdLjQLugXepfRWORJuTo6E/tpSeDtpl+3q8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ghkwOmEz5b1yoj3MSD5PnbFFL9arA3q3Q1SuPAIbud4B69aBWf2fzni/kNK94HMi3QReWPT2Ik14SPMmx5G5+IXDh0uFX0m/FNeinfEeHhz0S0qNY+iiPkD6Cd6DrzVmTArWOHILl8m5PW3OgKBfhQ3FCsQc0Er62hWbzDVh+Ns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vq+KvfI5; arc=none smtp.client-ip=74.125.225.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vq+KvfI5"
Received: by mail-wr2-f35.google.com with SMTP id ffacd0b85a97d-4885d4825adso523476f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 04:08:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790161680; x=1790766480; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=EH3XZfcX8POgQQ7VhCMA6/ybLgk3CMK1ox0kamnJcns=;
        b=Vq+KvfI5kYYnYXL4vEVzd1EDmUgLpwZqmOq1U5AncuW7pvNrdS0b0vXCB5s8wUXq71
         j4tWmhYER4n1kGvxsz4IUCAS9rUMoLeWPZZVYnR8nBAE+7vVcSkRNVw5B4IzGcypVfNf
         8SOHsnaZEr5UB7dsfR3NUpAuVGAWoCec4WHr4iwxb7jCq5QCKqetrwj/XZXbHr+VbdNJ
         A2AgT85azoPCGRnw/98pqgmDwh4DXvQyiWv+goGHqMKtG83soTL/SlNbIFvvRiCeVzqn
         paCso9uRFnYJkkwjnnjeIjvYmc1irj6/hoLxaHA6KXi8uvpXM9t2meT2yjU8C+DGOeSN
         Smhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790161680; x=1790766480;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EH3XZfcX8POgQQ7VhCMA6/ybLgk3CMK1ox0kamnJcns=;
        b=X/9UaqJ+ll4BCFzKsyGhU6vDsfNf3T2fPDfNOrGJF7QwNjWDakG7jbM0eZ+VOZ+Lg6
         pydbP/OONs+abPHJh3GC8CrLfzuBtAxAM884dBLMFsVGsNHFi5vKGt0dKvBazstLSJ5T
         fL5JCbw/EKKGU4h3KXbR+xwYKfcR6iYIke2PBqZuyoU2e+9UN1pA+qv9bhSLHnjeRSWB
         t59e84PdV0oKFdzyZC6bdmO9O4INa/RKyn4OnXzHpgP5zh9eSslUrVM4kRQx9JmwgERX
         8zwRGm87GMc199AUmetf5Ylc9Xp6+GDqIuwSjTrqH79E1yjkxbq3n189ygNe05ZeQ2Qo
         kr7Q==
X-Forwarded-Encrypted: i=1; AKwUvByW2pGop6Xa+KhGAEyIH+zDxsEVcgkyASMyfd7etJXmneKrs2ERZ1FE9mYiKLJId2Pawin82tX1EkOXRuM=@vger.kernel.org
X-Gm-Message-State: AFuF++kJDin4iBcWJqOv3fsyCZ+ubvHCQkrCSA50rAUCokkBzTzs0vHQ
	XfLvX8jj57ikXj47VzxUsd4yE2H2dahDCs0CfABcnj8UYCKv7F7X2x6D
X-Gm-Gg: AYBFou012v/SOwAq1tTC3WcpIco9xFj/NSGz97ljMsU1pOcErTJ8dLOkyy2XeNy//MZ
	5FkMTmYPgKN85rggcr76sf2VgSQ8dBK8uDPwXqTuBf7tcGmSwdqFdFVf3i/oTFON3OYMqkioirk
	4mYSnqvFOxNyo19KwXzV1kihn2zA4aaGtKurgkdkffPh9UUCz4NWsbaKG+bW0XAGkhVJnybsRFf
	PhRtuFTMFUGltMW8iQVdeOzai+WdkHLCCkmIcLMC/9LT+GF/qeCnk4q8P8RH0G2gyYZnhOnAXfi
	UomnX1kaW/UXzKWBTq6aOvo0WAVQpAw388UHYRVFNi2C9DFhjaQVwga6DM7dDZwvBa5szWl+A+t
	l89GulD/MQcYjd6pdX6RoFj6AdETzYs5nby0+1XzfHcC1WNuKO6Xydou9BOVsSEZ4noQ8IAnE8W
	DDrVSJWB3lpDZFzgEPvRf2urPfy2y7YgXFYIXjj2ijMt5+LtRjfTQ3a7HHSi6MsrIwJohyosf8g
	CbUsPaDCe3xhUf4/YgtCA==
X-Received: by 2002:a05:6000:144d:b0:487:342:d142 with SMTP id ffacd0b85a97d-48867099f4cmr4203461f8f.44.1790161680282;
        Wed, 23 Sep 2026 04:08:00 -0700 (PDT)
Received: from fedora ([154.182.121.200])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-488682676c7sm5892418f8f.3.2026.09.23.04.07.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 04:07:59 -0700 (PDT)
From: Abdelnasser Hussein <abdelnasserhussein11@gmail.com>
To: jic23@kernel.org,
	gregkh@linuxfoundation.org,
	nuno.sa@analog.com,
	Michael.Hennerich@analog.com
Cc: dlechner@baylibre.com,
	andy@kernel.org,
	linux@analog.com,
	linux-iio@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	joshua.crofts1@gmail.com,
	error27@gmail.com,
	Abdelnasser Hussein <abdelnasserhussein11@gmail.com>
Subject: [PATCH v3] staging: iio: adc: ad7816: Protect sysfs attributes with mutex
Date: Wed, 23 Sep 2026 14:07:45 +0300
Message-ID: <20260923110745.3836-1-abdelnasserhussein11@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The sysfs store functions modify driver state that is critical during
SPI transactions. ad7816_store_mode toggles hardware GPIO pins, while
ad7816_store_channel updates the internal software state
(chip->channel_id).

If these are modified concurrently by userspace while an SPI transfer
is in progress, it could corrupt the hardware transaction or cause the
driver to communicate with the wrong channel.

Add the existing chip->lock guard to these functions to serialize
access and prevent these race conditions.

Fixes: 7924425db04a ("staging: iio: adc: new driver for AD7816 devices")
Suggested-by: Joshua Crofts <joshua.crofts1@gmail.com>
Reviewed-by: Joshua Crofts <joshua.crofts1@gmail.com>
Signed-off-by: Abdelnasser Hussein <abdelnasserhussein11@gmail.com>
---
Changes in v3:
- Expanded commit message to accurately explain why ad7816_store_channel
  needs locking to protect internal state, as pointed out by Jonathan.

Changes in v2:
- Added a blank line after guard(mutex) statements as requested by Joshua.
- Added Fixes tag as requested by Dan.
- Collected Reviewed-by tag from Joshua.

 drivers/staging/iio/adc/ad7816.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/staging/iio/adc/ad7816.c b/drivers/staging/iio/adc/ad7816.c
index f76f0215119a..2a15d7598abb 100644
--- a/drivers/staging/iio/adc/ad7816.c
+++ b/drivers/staging/iio/adc/ad7816.c
@@ -143,6 +143,8 @@ static ssize_t ad7816_store_mode(struct device *dev,
 	struct iio_dev *indio_dev = dev_to_iio_dev(dev);
 	struct ad7816_chip_info *chip = iio_priv(indio_dev);
 
+	guard(mutex)(&chip->lock);
+
 	if (strcmp(buf, "full") == 0) {
 		gpiod_set_value(chip->rdwr_pin, 1);
 		chip->mode = AD7816_FULL;
@@ -207,6 +209,8 @@ static ssize_t ad7816_store_channel(struct device *dev,
 		return -EINVAL;
 	}
 
+	guard(mutex)(&chip->lock);
+
 	chip->channel_id = data;
 
 	return len;
-- 
2.54.0

