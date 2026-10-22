Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792695445;
	b=pemymJmNIWA8IyjNcvWnyIfWr9aH+9EfE4giKJGDzi7zGhenFPa5qLYNR5l4wdak8skL
	 9RCeWGprpf6hmv4gyTujNvs9EH4DIoSMojL0ta3V+3Yr5pQO7oGYAD7FNvx+9e/I7cEwr
	 GHc0gWv3DDqs+0HTwFetfR8XPnqq5vLZR+36Dq1+JfHJgKHeL0Kd4FlRq6ckrocdZ0zwv
	 aWEaNMnSvQWCNwHWYLj2Sd7CV9OKso7ObRqOwfpAFjNBFI2v1RDn1tfPPKdMVf+nj5Nmf
	 gBmRSO3HsV4meIzOJ0ldQWOygpHUOQkuynM4ALsJFE++bWVykKh5f1H1f7I7pEyBtVg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792695445;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=wWGQ5IUiMr2Rq0O0QjY6wBswC7Qqsd6H5XtqpQqPVpY=;
	b=KNhWwQH8t7Xe0uvyjN7GH5uPY0ZrmET6g41jDvgtJnzmJqHtblVoFhltDh3BLVdJJ1hB
	 lVC3NYQiRhYbE2BDYXvwJLyCvYchvUCco3ywc7+JHacVISMNDSXl0QGlt6z52XMPX5m7u
	 xHfCK23WbGqcgKrJ2bHdDZOWsUNbYq/zF8pM5ndqHpBP6/Q7l7lFAlBTpwa8fDdrxuW+w
	 hIEghT13aYbFTNLXpgfJmeKilcOpM73n8G6KMhabExmiIQm/Es9DPk1/mrgbPkYSLaSuB
	 dLIeUIBcxfvzQg8H7qbW0TG/VAx4IAQhP/2es3HCUGa4wcb9I9356MxL4jdg3ulb3fA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=rfIpA7Hl;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3CEE60A260A
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 18:57:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C3CEE60A260A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=rfIpA7Hl
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a1e477fe16so1148925e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 11:57:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792695443; x=1793300243; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wWGQ5IUiMr2Rq0O0QjY6wBswC7Qqsd6H5XtqpQqPVpY=;
        b=rfIpA7HlDh3aKDf2GFatIv79JQRi2FaUbiwlZaNVMOATuaMrelBCJOFZyGv1A0ISgV
         lu80Muhu4RwVju6xTYCexV9g6SdDw7g1AqfSiK/Pw/OXCdPCNO4Ff8z9RexznKVCDcIx
         RozmOd+aUZxQUHJCR/jAE99foQ5f+EIYA0dVf549RZF+pl0OlzAml8ddQ++DrGuPgjpL
         3jFhTs52WwKmIANowdEGbZzQ52tLFBhU3LGzFKLBxGt5PQoD/DcgSiCe43vImQc399DD
         pb9c3C0mxtfQRQa18XXZKaxJJb2Nli7zaSJ/mRNsGN6uFwFi97Ro3w97c6DFT6AOEOBw
         8wOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792695443; x=1793300243;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wWGQ5IUiMr2Rq0O0QjY6wBswC7Qqsd6H5XtqpQqPVpY=;
        b=bHfMh0s3tzK/AkpB2+q2IgrjUkyYCLKH9ip6B0ErwMUits84eAH6nOYRSmGtf1UE+2
         2IYb4GzreWIq4zO6Fljgn56siA8Kk0Ik2SA3A7ENu6f/SncToTfAkqX6TQJ0MG/wlCQU
         EfdJyUFT6XTr1bTVpHKGgG/azwWIcmyQbvZKh/RfrWvxwuL7KYGKqCCKjdw+dwUJkUb3
         fLwOBTnJgLoI3kbXSAfTwfe3picEa/vqIqIMVN6haMGfGHAphdsN0NpLAHJvXmJ5UFXG
         TZFWKIkX75G/E0QAJiwveZ6cVF2FCH+cwyxAFa84DHdV5c1NATqeOyJb0VVpfhdX2S3H
         YVgA==
X-Forwarded-Encrypted: i=1; AKwUvBy2ljsZI+5SAGqvwHwgUB9qKsGHnD4W2UV7XOh1fEA0t+JMc+UbmHMq6RXnAMjDDLAOnz91hyINLHxcvq0=@vger.kernel.org
X-Gm-Message-State: AFq9FYIDuqrQygae6q9UeNGIxX1oZMMASV+yNa9VZUxEwLRINFnxqr34
	GJvbcNRdMKDs6GYbqHLkuZXTTqn/cL6DGdWdaL8xXs6kY/dQSHs29h7FRr6WXg624Nc=
X-Gm-Gg: AYBFou1BWNFdOOdbnT7UaMWG8sW4ImR0Fcopu+nQUj2CMLnlzqkK1j1wNfEhjH2Tk4Q
	oWh8S2JCM3OZkJEWV+wJefrtTD65stVnrdXwCjf7dMYI+Mv68B/kutUdOwMOwCF3Zhnryg7zJwx
	3pPcF1GDTmdZ7rZtrrZRHnQLqO2h/TGOnLmClf+xPj01I6gimDtgaGySymHNhsQsIsVA0iU0PUB
	KHwL4ono94xNASiMleQPiUKv5E9Dhnk7VxGPY/8NGSoR7NIHFebI07vepOtWBpGkr24SmXLWRwm
	GBeXdV/qSnqgWIHfSK1jskb1piVquKLbb/2e/JbJaXGX4V8eh1QJk1pfFQHN8PrIMDP6O1M47WY
	Md0jk8FtDn2AweDEdJmx/asQyPVpzurZcl3MnxDwHV0RT/vH1kP91ktH85oAQkTffGYCfvqpEcd
	IqZhrVUIj7eb0tdgg82cFoAvvjB7PCR1IVl2zNOnN3SPTLB7/okwrVKnVVTeHrbg4Hx6XZ6ZwXb
	TD8GNhoozX9eYwrxP+JOup/8h2WFlWfJkM5S0kgdIfEmx25KsDrAA==
X-Received: by 2002:a05:600c:8b4c:b0:4a1:f0ca:2de6 with SMTP id 5b1f17b1804b1-4a1fdd1580amr126584375e9.14.1792695443077;
        Thu, 22 Oct 2026 11:57:23 -0700 (PDT)
Received: from localhost ([2a02:8308:b092:fd00:d900:ff27:14a1:f032])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e379f448esm150664f8f.41.2026.10.22.11.57.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 11:57:22 -0700 (PDT)
From: Jan Remes <ciakval@gmail.com>
Date: Thu, 22 Oct 2026 20:56:43 +0200
Subject: [PATCH v4 4/4] iio: light: tsl2591: improve lux calculation
 precision
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261022-first-patch-v4-4-90b2fc6e8e28@mycroftmind.com>
References: <20261022-first-patch-v4-0-90b2fc6e8e28@mycroftmind.com>
In-Reply-To: <20261022-first-patch-v4-0-90b2fc6e8e28@mycroftmind.com>
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Joe Sandom <joe.g.sandom@gmail.com>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jan Remes <jan.remes@mycroftmind.com>, Jonathan Cameron <jic23@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@intel.com>
X-Mailer: b4 0.16.0

From: Jan Remes <jan.remes@mycroftmind.com>

The lux calculation computes the ratio CH1 / CH0 as a truncated integer
(CH1 * 1000 / CH0) before using it. When CH1 is close to CH0, the
truncation makes the result off by up to ~35%, e.g. CH0 = 56097,
CH1 = 55973 at LOW gain and 100ms gives 1.517 lux instead of 1.118 lux.

The formula (CH0 - CH1) * (1 - CH1 / CH0) / CPL is equal to

   (CH0 - CH1)^2 * DF / (CH0 * ATIME_ms * AGAIN)

which needs no intermediate ratio. Compute it like that, with a single
division at the end.

Also report the result in micro-lux instead of milli-lux. At MAX gain
and 600ms one count is well below 1 mlx, so the milli-lux resolution
throws away information. The numerator still fits into u64.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Signed-off-by: Jan Remes <jan.remes@mycroftmind.com>
---
 drivers/iio/light/tsl2591.c | 27 ++++++++++++---------------
 1 file changed, 12 insertions(+), 15 deletions(-)

diff --git a/drivers/iio/light/tsl2591.c b/drivers/iio/light/tsl2591.c
index e3092ae77a11..fce8cea08201 100644
--- a/drivers/iio/light/tsl2591.c
+++ b/drivers/iio/light/tsl2591.c
@@ -21,6 +21,7 @@
 #include <linux/mutex.h>
 #include <linux/pm_runtime.h>
 #include <linux/sysfs.h>
+#include <linux/units.h>
 
 #include <linux/unaligned.h>
 
@@ -362,12 +363,12 @@ static int tsl2591_wait_adc_complete(struct tsl2591_chip *chip)
  * Counts Per Lux (CPL) = (ATIME_ms * AGAIN) / LUX DF
  * lux = ((C0DATA - C1DATA) * (1 - (C1DATA / C0DATA))) / CPL
  *
- * Scale values to get more representative value of lux i.e.
- * lux = ((C0DATA - C1DATA) * (1000 - ((C1DATA * 1000) / C0DATA))) / CPL
+ * Since (C0DATA - C1DATA) * (1 - (C1DATA / C0DATA)) equals
+ * (C0DATA - C1DATA)^2 / C0DATA, this is computed in micro-lux as
+ * lux = ((C0DATA - C1DATA)^2 * LUX DF * 10^6) / (C0DATA * ATIME_ms * AGAIN)
  *
  * CPL is not computed on its own: at 1x gain it is below 1 for integration
- * times under 500 ms, so the division by LUX DF is folded into the final
- * division instead.
+ * times under 500 ms, so all divisions are done at the end.
  *
  * Channel 0 = IR + Visible
  * Channel 1 = IR only
@@ -382,8 +383,8 @@ static int tsl2591_read_channel_data(struct iio_dev *indio_dev,
 	u8 als_data[TSL2591_NUM_DATA_REGISTERS];
 	int int_time_fval, gain_multi;
 	u16 als_ch0, als_ch1, als_max;
+	u32 diff, rem;
 	u64 lux;
-	u32 rem;
 	int ret;
 
 	ret = tsl2591_wait_adc_complete(chip);
@@ -436,19 +437,15 @@ static int tsl2591_read_channel_data(struct iio_dev *indio_dev,
 
 		int_time_fval = TSL2591_FVAL_TO_MSEC(settings->als_int_time);
 
-		/* Calculate lux value */
-		lux = (u64)(als_ch0 - als_ch1) *
-		      (1000 - ((als_ch1 * 1000) / als_ch0)) *
-		      TSL2591_LUX_COEFFICIENT;
-		lux = div_u64(lux, int_time_fval * gain_multi);
+		/* Calculate lux value in micro-lux */
+		diff = als_ch0 - als_ch1;
+		lux = (u64)diff * diff * TSL2591_LUX_COEFFICIENT * MICRO;
+		lux = div64_u64(lux, (u64)als_ch0 * int_time_fval * gain_multi);
 
 		dev_dbg(&client->dev, "Raw lux calculation: %llu\n", lux);
 
-		/* Divide by 1000 to get real lux value before scaling */
-		*val = div_u64_rem(lux, 1000, &rem);
-
-		/* Get the decimal part of lux reading */
-		*val2 = rem * 1000;
+		*val = div_u64_rem(lux, MICRO, &rem);
+		*val2 = rem;
 
 		break;
 	default:

-- 
2.53.0

