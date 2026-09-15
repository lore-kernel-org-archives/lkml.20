Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6668B36B915
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 08:00:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789459225; cv=none; b=dxdYIHWZVCsk+AnG4DUi1XPtyFGqunyHmLyjrWd2xi3rtQL5/66bzruGLOJs+lXZVBJX9C9YcZNDOfy1h4xl2lr3iNEIfdstuAg3lF4nkMXUQRB2i/q5q2KQFzzNLb5Yfnfy5IM22NqJvnK3gVDYJyMX6syu5MunT7LbQ4zbpJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789459225; c=relaxed/simple;
	bh=WWVcE57q2ujxsqolRC6ZoeQXUL6FEoBX5JlOVLcjvtU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=O95bfw0eSuR9alMG+UwF48GpygzvNFq4ZizA/QHWziog7sHdZ0T1CElWl/8eDLnggJuod7nrQppD48kNFkpY+E/1Aaqec9n3XQjvLo/crJUL5dhk0cQA/gMokV3VRrgFBgQNbGisM0IwAuNAMc0G23bo35WGnp3zu+uFC+zQRh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ghgrjG3/; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ghgrjG3/"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912d37b6so12993175e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 01:00:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789459223; x=1790064023; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tXRYdo/Nw5o2tKXlPYpP0Bk1aAxSCNWraHSi1/LMRzI=;
        b=ghgrjG3/X8l3jAzPHgjzgmBRqX5ncys7KkiOE2SSUOYPhvCe5DO4789TfLpV7QBQ6F
         XrnZ8/SHcQ2uU3gLifv5NM8sh+Nh6m37QJRRZfym6nsYnD/9n/XW7kVnj078PpzqbA6Y
         C2h2uVfDTvKnHPt6qIZ5469adt79ICsW8pU1EpWjv9470m5M7L9SL0Oxb3dypBZurg56
         /T7uDzplMggyJF8zOCaRxNNRVH7pxm5aCtnOKgsxjioCea3H1cDYQgKGNE7RSCbnkh1Y
         X6jPSEzpYNMq7OOBG+JwF9UfVznw0J6MiHk3tz0aP9O47KA/5KgNmXCWNReKlRfQ41nm
         z7Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789459223; x=1790064023;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tXRYdo/Nw5o2tKXlPYpP0Bk1aAxSCNWraHSi1/LMRzI=;
        b=2I9FQE2p0DwdjM/3mq2j5budUtZLIzRFstPwmQnErt3iChmLoH5CEPP4jNm627X59l
         vXsQ8sMuD9aOtBsHrar928dR9Nme1b2qfXlXXZv1wKFV3sDhhJ/EglpxTJtyM5Brykzh
         QJ4sOP2jAAw8ZIgsnwtX6xjsMoE9Pl1w2NtSmL1rI3M0hG5ng9eKqqd3k3leMO5wYcbf
         XdH6a7sQ/5d5FdEFxBdflHr1Gru6BG4atwygdEkH9TRhuxu3CV0Nxcq5f9vh2WIjJCgk
         VA9C3UVYv3B0ul7tMKl8rxbk3lGl02N5q0jJAsODVLtv2Jw3aZe6HHv7bYrYc4TiaLuE
         AhYw==
X-Forwarded-Encrypted: i=1; AKwUvBw14oDb+sqwI1/xuGKp4Nx6sh2QwPI2uszLzCEIGcbevl6F4IpFmzR3w101qXuIjuIekT0UCrhqlx2mcH0=@vger.kernel.org
X-Gm-Message-State: AFuF++nDEArxBHVOJFfQukO1Xco01S9riFyIuEI6g7C2P7KRjVYMsdyT
	QzxyH4qXnVvmMUVROt4a+9scBPr88uequMf1SlQLVSPVHT9vRDeyBHWa
X-Gm-Gg: AYBFou3bxDm+f4/wbEaQ6aUEec/Z6R6vI9oNSwfrWxpslgIX//jOkaWBq0DumHXiFJA
	dUt5NnewsAWZcLFnurDz4GdaJlQE5HUO+RA4E5UmJrlEdSJFnfZp9cy/yIpYxyYOCsn74ABgS5r
	FDxqywYC8Y/7UJNX5Pn2QGmcSuAVXknJ2gQlJ57xgn0KMCmeHR8eHO6mVYOer4vclZc5uNAuRvk
	oo60Bd6EixUHAZJygCyom5suTVcpfzveun9EUzqW6sOM59OGjRnkZQ30ogJqCkGdnFZxe0qx6VN
	vH7R17qK+RAyhGEzFExyrO8Qql1gLdKWsGjnPHSW+wSWF1crxXXGyGSmoC65PSnklhLb6CFxK04
	gXCNCGPqiV2dIbTDuLA8/hIHfo21ThHQDE3d4LY4yj8cu3dt0U/4+vowwSQOe1I57S6q5/AekXS
	E0Jk4VjEYb47Gh23WlhevmyWpnaCivn4U7zEHq1Me3ssoA1pz4bsofU2knP/KF2O8EV8Y+uZ0W/
	gAMV0/M8PpYgtyeH/ARlw8Bm+9ZaA==
X-Received: by 2002:a05:600c:8716:b0:49e:6692:27fd with SMTP id 5b1f17b1804b1-49e7a657f9dmr165235115e9.2.1789459221055;
        Tue, 15 Sep 2026 01:00:21 -0700 (PDT)
Received: from fedora ([154.182.99.41])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e7d6bf4desm64112155e9.15.2026.09.15.01.00.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 01:00:20 -0700 (PDT)
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
	Abdelnasser Hussein <abdelnasserhussein11@gmail.com>
Subject: [PATCH v7 2/3] staging: iio: adc: ad7816: Serialize SPI operations
Date: Tue, 15 Sep 2026 10:59:38 +0300
Message-ID: <20260915075939.18180-3-abdelnasserhussein11@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260915075939.18180-1-abdelnasserhussein11@gmail.com>
References: <20260915075939.18180-1-abdelnasserhussein11@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The ad7816_spi_read() and ad7816_spi_write() functions perform a
sequence of GPIO state changes followed by an SPI transfer. If multiple
operations occur simultaneously, the GPIO state could be changed by one
thread while another is in the middle of a transfer, leading to a race
condition.

Introduce a mutex to serialize the operations, ensuring that the GPIO
toggling and the SPI transfer are treated as a single atomic operation.
The mutex is placed right after the pointers in the device state
structure to avoid padding holes.

Signed-off-by: Abdelnasser Hussein <abdelnasserhussein11@gmail.com>
---
 drivers/staging/iio/adc/ad7816.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/staging/iio/adc/ad7816.c b/drivers/staging/iio/adc/ad7816.c
index 9e43ce83e071..c18093ca8a82 100644
--- a/drivers/staging/iio/adc/ad7816.c
+++ b/drivers/staging/iio/adc/ad7816.c
@@ -5,12 +5,14 @@
  * Copyright 2010 Analog Devices Inc.
  */
 
+#include <linux/cleanup.h>
 #include <linux/device.h>
 #include <linux/gpio/consumer.h>
 #include <linux/interrupt.h>
 #include <linux/kernel.h>
 #include <linux/list.h>
 #include <linux/module.h>
+#include <linux/mutex.h>
 #include <linux/slab.h>
 #include <linux/spi/spi.h>
 #include <linux/sysfs.h>
@@ -47,6 +49,7 @@ struct ad7816_chip_info {
 	struct gpio_desc *rdwr_pin;
 	struct gpio_desc *convert_pin;
 	struct gpio_desc *busy_pin;
+	struct mutex lock; /* protect device state during SPI transfers */
 	u8  oti_data[AD7816_CS_MAX + 1];
 	u8  channel_id;	/* 0 always be temperature */
 	u8  mode;
@@ -67,6 +70,8 @@ static int ad7816_spi_read(struct ad7816_chip_info *chip, u16 *data)
 	int ret;
 	__be16 buf;
 
+	guard(mutex)(&chip->lock);
+
 	gpiod_set_value(chip->rdwr_pin, 1);
 	gpiod_set_value(chip->rdwr_pin, 0);
 	ret = spi_write(spi_dev, &chip->channel_id, sizeof(chip->channel_id));
@@ -107,6 +112,8 @@ static int ad7816_spi_write(struct ad7816_chip_info *chip, u8 data)
 	struct spi_device *spi_dev = chip->spi_dev;
 	int ret;
 
+	guard(mutex)(&chip->lock);
+
 	gpiod_set_value(chip->rdwr_pin, 1);
 	gpiod_set_value(chip->rdwr_pin, 0);
 	ret = spi_write(spi_dev, &data, sizeof(data));
@@ -360,6 +367,10 @@ static int ad7816_probe(struct spi_device *spi_dev)
 		return -ENOMEM;
 	chip = iio_priv(indio_dev);
 
+	ret = devm_mutex_init(&spi_dev->dev, &chip->lock);
+	if (ret)
+		return ret;
+
 	chip->spi_dev = spi_dev;
 	for (i = 0; i <= AD7816_CS_MAX; i++)
 		chip->oti_data[i] = 203;
-- 
2.54.0

