Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51DD4443C0B
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 11:10:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789125044; cv=none; b=CXLSEVLjvoSrY6z1a2MCeNF1WizQJpihtQYfOkg0Uu+Kn0CqjgafPg9LCyzX93VfiznAfOaeWkIPcr4Cv/0NDfWuO9jPzdDpB6rckqW51QpOKQtYLOeHQE4XaEL/XiedTOgokijM705DBwY75YAWA65PKqxqM1MpZqYfYpPWucY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789125044; c=relaxed/simple;
	bh=nkt9eX0UhBpFnXXxyb40A2jA3fGy9p1WHRIW/5hqH4U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mKZLRqkX2D4rJXc5+NbS0UXAmOHLuCnk4HxQPuGjLgvffGyjaeBEJY7PnLfCcOvPYMxQ2BXUyIpMIPoD+Y1WfXQARZ0plzlLckPYAr55N2dZFoagLVuI23U9x7nG/7v82xSgdA8X9eWtcP4IStluwG20hqvT7FHZA3vDv8xq11g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dm6M1h0Z; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dm6M1h0Z"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-49e651e83dfso3653975e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 04:10:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789125034; x=1789729834; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=buEE5TDzC5FsioP8qx8e+5Y4xF8w0Ds3BqUa5qHn1HE=;
        b=dm6M1h0ZIXunFxt01MMVbCItktIlWZ1Djun8hj2gMyjEFq9C0gI1e8bZoeo6p34DGe
         XS1tqguS5wLIpOrl+vgmJ+UCboR6oIRzQq+re4k+tGsSonvh/A+C36ZZozV3wPlHfAVb
         6UdhJ8/vopy7Dd+f/su51rCnGnDRMhKxtu/Ec1Vs3EiZSGFp3kJWS8Uy/lYJ8iRKG23e
         3feHMZg2atTDsrNaUFmVDySEGXItfKbClY0A+vxFPLh5nDS5VaZQp72cea3D27KpoQne
         18Y5NQhUdRpHiZ+7wZHcmJffv1PTxewkJ4M0Lf4Zt8iy+/bw9uOW+UjDlhvkmkorVZmt
         OE0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789125034; x=1789729834;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=buEE5TDzC5FsioP8qx8e+5Y4xF8w0Ds3BqUa5qHn1HE=;
        b=nFP0QICm9zuDuZvo/HHv0jnBZMFUfJyAKkNOHtCdYSszeGD5l5g/XHRC7dlzF0sYST
         4qRZe1CpoxyjChyS3uZkEx7HVj2lYTovViLZZpxl7GnVVFoYSOD34t7OY1JxYgLZIV6M
         tKqv5Zv+50wuIa2CDOgHUx0FHUypVFjS8ClNoaT9jN5AqER8eWIvHVcHiMIWIDNqfxHN
         UjZL8CPo3hRNRd+S9GxS036F+1DG5gcKvSpRKIoU7EI7VXO+Zo2IathoSx3bJjEH63Jp
         XDVkFs4YKbKcRWZ4ocfRucuOKCBy3aJV1JT/VhuCpDifhsGjfULV06Av11iJ9qQcw/5X
         fGYg==
X-Forwarded-Encrypted: i=1; AKwUvBzXtMEKSsboQxu82I+eVIbdMLWQc3iHNLPe94DB0CB52gpAzeJPgXEouP+037v+FQ3jDBIKGvETfSbafmE=@vger.kernel.org
X-Gm-Message-State: AFuF++k0/2EPp6HTNp9EMbq86i/i/C5qijvdehQrtWXvC8cWZde1e/Uj
	GXL0uZTLok3YeHhELO+LV49Bb2fewAZha2ftOD6/WB1X46myt5AHROC4
X-Gm-Gg: AYBFou3YkwGqIc7F2pDzbRKikc3e9wR9IjkV3wb1basCaQm19GmZFyKSXRg+X1bRpcF
	UWtA8iyWRTHDiLCVU0Vbd2zONJXwIYA+C0kBLsN8DOx3cNqYVBIHz+6vpbXHLMgsfGQwG27d7NN
	5jsHpz4k45PykNmYiw03/JwA4aiPItBixL1xx9xwIcpS6WW0gU3e6aBf45tlX73DPhAVX16OnB+
	sMMMfINZIZ9qldWPg92y6Dm/ALtZ6QIOY78RRD31nr2NkZVHcpYm0nHRiZpTHDlymChH6jIu4tv
	i8/Qv3UZDl3F42OwVjAGAOJVErL7PyJy9BRF7iGv2fkxe3TdatVxBp/En6H6mLf5Bzt54cVVIa8
	4JuLXe5HXRwMaEdxb8tJYg+3MgDE1Y/YuhRxTkjShaJjclsT2MARPEovnocjjoRK35C94Syg179
	IJJBkcLLyNBk6EMfeU32tz2wdMS81EuaKk4mh6FbfumsJqE1V0cUTRou6s7/3kfoYgPtveHvBnn
	Z/UGvXxf3991lV7G1U=
X-Received: by 2002:a05:600c:354a:b0:49d:2536:402e with SMTP id 5b1f17b1804b1-49e61a005b6mr41951185e9.30.1789125034386;
        Fri, 11 Sep 2026 04:10:34 -0700 (PDT)
Received: from fedora ([154.182.82.204])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e60ac411asm66109065e9.8.2026.09.11.04.10.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 04:10:33 -0700 (PDT)
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
Subject: [PATCH v5 1/2] staging: iio: adc: ad7816: Serialize SPI read operations
Date: Fri, 11 Sep 2026 14:04:55 +0300
Message-ID: <20260911110456.24873-2-abdelnasserhussein11@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260911110456.24873-1-abdelnasserhussein11@gmail.com>
References: <20260911110456.24873-1-abdelnasserhussein11@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The ad7816_spi_read() function performs a sequence of GPIO state
changes followed by an SPI transfer. If multiple read operations
occur simultaneously, the GPIO state could be changed by one thread
while another is in the middle of a read. This leads to a race
condition where the sensor state is disrupted, resulting in corrupted
data being read.

Introduce a mutex to serialize the read sequence, ensuring that the
GPIO toggling and the SPI transfer are treated as a single atomic
operation.

Signed-off-by: Abdelnasser Hussein <abdelnasserhussein11@gmail.com>
---
 drivers/staging/iio/adc/ad7816.c | 21 +++++++++++++++------
 1 file changed, 15 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/iio/adc/ad7816.c b/drivers/staging/iio/adc/ad7816.c
index 0e32a2295990..d0355763aa8f 100644
--- a/drivers/staging/iio/adc/ad7816.c
+++ b/drivers/staging/iio/adc/ad7816.c
@@ -5,15 +5,17 @@
  * Copyright 2010 Analog Devices Inc.
  */
 
-#include <linux/interrupt.h>
-#include <linux/gpio/consumer.h>
+#include <linux/cleanup.h>
 #include <linux/device.h>
+#include <linux/gpio/consumer.h>
+#include <linux/interrupt.h>
 #include <linux/kernel.h>
-#include <linux/slab.h>
-#include <linux/sysfs.h>
 #include <linux/list.h>
-#include <linux/spi/spi.h>
 #include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/slab.h>
+#include <linux/spi/spi.h>
+#include <linux/sysfs.h>
 
 #include <linux/iio/iio.h>
 #include <linux/iio/sysfs.h>
@@ -50,6 +52,7 @@ struct ad7816_chip_info {
 	u8  oti_data[AD7816_CS_MAX + 1];
 	u8  channel_id;	/* 0 always be temperature */
 	u8  mode;
+	struct mutex lock; /* protect device state during SPI transfers */
 };
 
 enum ad7816_type {
@@ -67,6 +70,8 @@ static int ad7816_spi_read(struct ad7816_chip_info *chip, u16 *data)
 	int ret;
 	__be16 buf;
 
+	guard(mutex)(&chip->lock);
+
 	gpiod_set_value(chip->rdwr_pin, 1);
 	gpiod_set_value(chip->rdwr_pin, 0);
 	ret = spi_write(spi_dev, &chip->channel_id, sizeof(chip->channel_id));
@@ -91,7 +96,7 @@ static int ad7816_spi_read(struct ad7816_chip_info *chip, u16 *data)
 
 	gpiod_set_value(chip->rdwr_pin, 0);
 	gpiod_set_value(chip->rdwr_pin, 1);
-	ret = spi_read(spi_dev, &buf, sizeof(*data));
+	ret = spi_read(spi_dev, &buf, sizeof(buf));
 	if (ret < 0) {
 		dev_err(&spi_dev->dev, "SPI data read error\n");
 		return ret;
@@ -360,6 +365,10 @@ static int ad7816_probe(struct spi_device *spi_dev)
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

