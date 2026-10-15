Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8409F53E2E2
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 15:20:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792077626; cv=none; b=W+xBcq5bdE3Wp49//iFEWkMpON2fVYqxIFfJd7JxiiHXJmR802zb1wgQ+2UIVlM5n9dwOaa36fApEXLM2L4Q+eHEBUNDFJ9kQWVBnuVXFVOTQIAxCDFIZi+Cjekb9vSIrnx/Y/1D518nNn+oJLx+uV5GL2R+B6d8cv6S1hH6BF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792077626; c=relaxed/simple;
	bh=4NSUR17VCQVdZMTyKAJFDwPaPM61+d5u2XuQn5Nj6PI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cIghSmkh3u3SRq4G7B4Ow/4owF0WeSaME6O3O8uBG4RL18s08BGkknTkZt5n3nWWeddohVwingR9cmCF/oh86Q0Cez8ZsSaBJqQktFFAIgOa0ccS/WZ1hRanSGeqx91TIMq21D0ixeLhY9CRnpRqp0hvZKD8owkqSFJBhY7aKd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AUKwHAIU; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AUKwHAIU"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a16c399641so52525975e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 08:20:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792077611; x=1792682411; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=rqM9JJ4Bu8nRxycdnvpW5GKXnWTBWTx9uL9yN9l3qfg=;
        b=AUKwHAIU/JqGordSLivWDyh0Fa4br1H8jQzKmPklBeduh8NXPl4ORAx3v+vX/VDMWe
         vlRUQZiNlc3/p/uAdFUQMBoFEJQ5xHZwMJxw/hQP1lOoUNd1vsgEOzaQsDxWd45kFqZk
         f/ddQlEJGK39s9mHUyk/UsSGJPLGcins5B5qImX4fzVrURfmJpf0fdk6y5IJvbggRIvL
         Kc8coCpBdUoQtK/3cLrqyP4ObACkCurW2i/j7e8Hw2FNza2VyyZrZ+0u4pJBnS1v9mbI
         lJR87NLBK/uklYOyn9qjy34wOS/0KExcKtFf+eNnL95nOZcKYaQoRkA0W0TDUsmenbLS
         g76w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792077611; x=1792682411;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rqM9JJ4Bu8nRxycdnvpW5GKXnWTBWTx9uL9yN9l3qfg=;
        b=Z+zopVpX6wa9JhW6gjaWhCkmaqrARCHa7OpW2Cq/vhQnJCOu6XGOUbCuwY+9dJeyGt
         loglcF5l9A5k4pr8EIJ7YJZkl1/jvyED7MkZJG9qBL2bc2P3j5SaS/XJZl+DXhkY0lg+
         Lsh6Poz2wG8NovEvHPVvPlJI3KPY9QXQOjUlxoe+Zwlejl0vCVkKJosXsAbKjsnbdsyP
         2Gxi4bBoM61c+e6hQQiDotBpxldn2XoIk8Aiob96UCyfPX1J+IfLZ1EqlJjEE0zArtai
         4zbHQRFfapm/QBseVWHOH/oTve7E7bRfrSGQ/JBachW9jcMF6IO1fO4lpKXGOL6jWvSe
         3w1A==
X-Forwarded-Encrypted: i=1; AKwUvBzLavie2Zkx+oVV4L7Fin/hBCyONfwior+KiyvaB59EVLIS9Fy4e8TAJYa2r2moe0LAmO+LXlC5PxXZgMQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYK3GM8mXPb8Ijfbyh8wSwnfjyrr1LVCSuYzga2nVAXpA1wASFxD
	/bA7BxQXHcTrjcifnxrYzh7PCi10KslC+l5NKutuoc75XdU1CvYTfFsC
X-Gm-Gg: AYBFou0Ef01bcauepI4Xq27gt0fpkyCDGU53Z6PeQD0OY1TSsWiEnAnZxKpS06+Fkhj
	osEFd/9zsqhF9SZBNJCDZN99CNW8bBQGxZP1JFiv7GIZ4F13bx1mOC39Wx2LWkneVcKzoXVZYsh
	TM8zKbp74GTmxq273N5G5lypAaZtippsyGyiv2XJ8rnOBOjYtu0SjLLuW58Lps7re8ITrVqUHjR
	c2HyO6vqLASVEQ2AtWVnyTkADf5BPq7H5vg8fBzlZCVcxg/bOv3UUOcbCZC8iw3HIWm3vKvhS8D
	67ZtGBjUX4038fMf02DkZtq4epOzyV+/DadzHAu0LDAbBXMu1aQA6LdTioQwgejOU/ju7rfLFTe
	iTn6Ktxj6ffUh12nRpjJtixBS+Du9mfgniAuUdFfIVPOT3j8P0Hyu32eHAauB1gdAMj/m6GVX6n
	RjW6+BHko7hcaUZy54Gxv6+z0UOFZqcc2gPthlSH+R8q3I2S8ydNbA5MAKahDlmIxSxAn5h6NJb
	jS8G60gvxgAHmnNf2Mv0IZJ/QX7+Cs=
X-Received: by 2002:a05:600c:19c8:b0:4a1:7bae:d80a with SMTP id 5b1f17b1804b1-4a18e47ad49mr400472685e9.9.1792077611250;
        Thu, 15 Oct 2026 08:20:11 -0700 (PDT)
Received: from fedora ([154.183.128.82])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bd9a8a22sm88390005e9.5.2026.10.15.08.20.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 08:20:10 -0700 (PDT)
From: Abdelnasser Hussein <abdelnasserhussein11@gmail.com>
To: jic23@kernel.org,
	linux-iio@vger.kernel.org
Cc: nuno.sa@analog.com,
	Michael.Hennerich@analog.com,
	dlechner@baylibre.com,
	andy@kernel.org,
	linux@analog.com,
	linux-kernel@vger.kernel.org,
	Abdelnasser Hussein <abdelnasserhussein11@gmail.com>
Subject: [PATCH] iio: adc: ad7606: use EXPORT_NS_GPL_SIMPLE_DEV_PM_OPS() and pm_sleep_ptr()
Date: Thu, 15 Oct 2026 18:19:03 +0300
Message-ID: <20261015151903.13613-1-abdelnasserhussein11@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace SIMPLE_DEV_PM_OPS() with EXPORT_NS_GPL_SIMPLE_DEV_PM_OPS()
and use pm_sleep_ptr() to wire up the power management operations.

This allows dropping the #ifdef CONFIG_PM_SLEEP guards, simplifying the
code and improving compile test coverage of the suspend/resume callbacks
while still allowing the compiler to optimize them out when
CONFIG_PM_SLEEP is disabled.

Signed-off-by: Abdelnasser Hussein <abdelnasserhussein11@gmail.com>
---
 drivers/iio/adc/ad7606.c     | 9 +++------
 drivers/iio/adc/ad7606.h     | 5 -----
 drivers/iio/adc/ad7606_par.c | 3 ++-
 drivers/iio/adc/ad7606_spi.c | 3 ++-
 4 files changed, 7 insertions(+), 13 deletions(-)

diff --git a/drivers/iio/adc/ad7606.c b/drivers/iio/adc/ad7606.c
index cebb8ed8dcb1..e71ff8d38e4c 100644
--- a/drivers/iio/adc/ad7606.c
+++ b/drivers/iio/adc/ad7606.c
@@ -14,6 +14,7 @@
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/mutex.h>
+#include <linux/pm.h>
 #include <linux/property.h>
 #include <linux/pwm.h>
 #include <linux/regulator/consumer.h>
@@ -1673,8 +1674,6 @@ int ad7606_probe(struct device *dev, int irq, void __iomem *base_address,
 }
 EXPORT_SYMBOL_NS_GPL(ad7606_probe, "IIO_AD7606");
 
-#ifdef CONFIG_PM_SLEEP
-
 static int ad7606_suspend(struct device *dev)
 {
 	struct iio_dev *indio_dev = dev_get_drvdata(dev);
@@ -1702,10 +1701,8 @@ static int ad7606_resume(struct device *dev)
 	return 0;
 }
 
-SIMPLE_DEV_PM_OPS(ad7606_pm_ops, ad7606_suspend, ad7606_resume);
-EXPORT_SYMBOL_NS_GPL(ad7606_pm_ops, "IIO_AD7606");
-
-#endif
+EXPORT_NS_GPL_SIMPLE_DEV_PM_OPS(ad7606_pm_ops, ad7606_suspend, ad7606_resume,
+				IIO_AD7606);
 
 MODULE_AUTHOR("Michael Hennerich <michael.hennerich@analog.com>");
 MODULE_DESCRIPTION("Analog Devices AD7606 ADC");
diff --git a/drivers/iio/adc/ad7606.h b/drivers/iio/adc/ad7606.h
index 2951bb731354..c60f71a38883 100644
--- a/drivers/iio/adc/ad7606.h
+++ b/drivers/iio/adc/ad7606.h
@@ -241,11 +241,6 @@ extern const struct ad7606_chip_info ad7608_info;
 extern const struct ad7606_chip_info ad7609_info;
 extern const struct ad7606_chip_info ad7616_info;
 
-#ifdef CONFIG_PM_SLEEP
 extern const struct dev_pm_ops ad7606_pm_ops;
-#define AD7606_PM_OPS (&ad7606_pm_ops)
-#else
-#define AD7606_PM_OPS NULL
-#endif
 
 #endif /* IIO_ADC_AD7606_H_ */
diff --git a/drivers/iio/adc/ad7606_par.c b/drivers/iio/adc/ad7606_par.c
index 5b137e947f0b..986c15db90c7 100644
--- a/drivers/iio/adc/ad7606_par.c
+++ b/drivers/iio/adc/ad7606_par.c
@@ -11,6 +11,7 @@
 #include <linux/io.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
+#include <linux/pm.h>
 #include <linux/property.h>
 #include <linux/types.h>
 
@@ -251,7 +252,7 @@ static struct platform_driver ad7606_driver = {
 	.id_table = ad7606_driver_ids,
 	.driver = {
 		.name = "ad7606",
-		.pm = AD7606_PM_OPS,
+		.pm = pm_sleep_ptr(&ad7606_pm_ops),
 		.of_match_table = ad7606_of_match,
 	},
 };
diff --git a/drivers/iio/adc/ad7606_spi.c b/drivers/iio/adc/ad7606_spi.c
index 8c479fa50a23..10df12311561 100644
--- a/drivers/iio/adc/ad7606_spi.c
+++ b/drivers/iio/adc/ad7606_spi.c
@@ -9,6 +9,7 @@
 #include <linux/err.h>
 #include <linux/math.h>
 #include <linux/module.h>
+#include <linux/pm.h>
 #include <linux/pwm.h>
 #include <linux/spi/offload/consumer.h>
 #include <linux/spi/offload/provider.h>
@@ -502,7 +503,7 @@ static struct spi_driver ad7606_driver = {
 	.driver = {
 		.name = "ad7606",
 		.of_match_table = ad7606_of_match,
-		.pm = AD7606_PM_OPS,
+		.pm = pm_sleep_ptr(&ad7606_pm_ops),
 	},
 	.probe = ad7606_spi_probe,
 	.id_table = ad7606_id_table,
-- 
2.54.0

