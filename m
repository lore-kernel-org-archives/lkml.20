Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D7AD542EFD
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 14:17:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791987431; cv=none; b=JOXTZFhqbtCxr3jUWXtBqm4762mJfAfzUmucWU32fzVsvaqNHVDH+1zuWLMbekJHMHgzEYLMquZxv28g9f1Nn8u+M1w78OeFQVB3GjnsOkY3+2iSk87dYFF1qqbCNqSAKQBL3eYqbxBxQyQm4Ru2lJOFbGQ1YTOX9C/qhOkXFBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791987431; c=relaxed/simple;
	bh=kUxVa5mGjgd3Hwbquj61TOyvRjlHlIbwg1qSJUSNsZo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fjUYM67swmM96SyPvZbbOMOZ0dhXta0yipBJRFUp+eyHfHzfOTQfjluuePhLRTybUoccxU8bHmMJAe89b2hAKOBRPfvu1XPSDPrKZljKMHWoDbpHy4cNEr577wHtMQjTSebTvQvGhJ/KZAnPmctMaluSV8KyNAockNhvsnKRuBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sZI2DJmz; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sZI2DJmz"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a01933b584so36838105e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 07:17:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791987428; x=1792592228; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3+dcTjNdpl6sXOUJMEgViEWWx4Hbq5B7m0gg3ou9K64=;
        b=sZI2DJmz2RETKyvfPln+NfS6Ig/ylGeOUj12NszeA76uFUMPYJ1KNnDmzgowtZ21HV
         CuAyxQKFRKrMuw1wbJ7UwBI3IEndlGlUfjdFUh+jcYRNKyGel1g6hvHhPQysKorTkxER
         n+J0xJm+yAKiwO6x2jfVxvxh8EloeSWA79eujEiL0HwtI5Z86pYgv4C2qT3vqC3jXk0v
         yDZhJbg/bfXcBXA6DQJD+sOZvgPAp1F/jwGuEqCURaBDmelcQXskb9aSgFcO9jGPnKHT
         wBdBEBxMQ3I/PA+yhChj4BP9duJa4YXJNJZnUljRSURnOvxCMPukD60hmgFPMzshL1Zl
         KPQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791987428; x=1792592228;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3+dcTjNdpl6sXOUJMEgViEWWx4Hbq5B7m0gg3ou9K64=;
        b=VdxpvNUrIRi3t06FWpfD+F9XQO85M8dZsN+jfU6S9zUFwU8eN2dS2gR4EKde1IMQwM
         QrM32m3NwEvOw0YYe4WTICKQy95j+pY+eqMvMf1muuABiZpAIQE7Fzr+Ef/l+FTM5+LD
         7OhCVEJHNGbkOwxWwz5S4guf3ffidmKsG4zZs1/9ENQsW+EF6RHTKaFRyLZTVdXLqM/P
         E3nl7sCLOUDz9LqJp9T+mLVOxJdLortdYElj8Po6SBdEF5rrUTeipXH5INxH61vMHWRV
         aC1Fza1/z6ps+rw4Z3tc78N+ZhZCTqchhg7iOGkhzyKXGWrLvoQFWNHpUOfXfwwfeFo8
         SNxg==
X-Forwarded-Encrypted: i=1; AKwUvBy8PgN2VCKagN+xkvlq+JcKdVUM30gMb+cwvOG6EFP8CwcQ/vt4R7Llx9XhV81wKWva7uPACRtJnoYDBqA=@vger.kernel.org
X-Gm-Message-State: AFq9FYI9givdRHjblEP5FVP/yUyoJbmmIeFM+wiLMXmMIww7mZmonkHm
	6fiwfiCqYqNgG0fKlwPYQEbpildrOkVinjvxAxn32CdT3ui1upp/tkam
X-Gm-Gg: AYBFou21mhbuuVi6XJU3cqwtY99P+xpMCQE0nibfzIqxJBHaHle25Gs2ONzIcSNlXJq
	lukSyeOjhwoD4qoARKaY5BuNa2NRkciURdVF9aaRVfCkDaFhhdMlLEkznNG+8jImO1DRHM5pJtC
	w6KL4NnXK6fSM/1wsLc2T9Ia2Y3ZYmrya5U7jru6lnxbW2gW4v8fI7r+oYVtEjiLAMhyZz6ocfN
	/kcuBHBrlztpK1l8BL989+7IZQhtYmVPRi+ME9GIJ/lGO3bqxgDfLAHWpRSPHbcru/EuBPpHh2i
	OEBODokFHZ+jaY+K/uShZVmy5h1DWyy4DirUiIT3eigcam4dYqqjKli8otEcULrcgYvLZAyf5d5
	LwU3eKxUY1v4opKovvFXOOaeK/Zq/5fT4Z1kod9yIN51y+MeOffG+rmnh05x86M/6VdhtN4aycw
	2GDsoyK+a2N979c9EW1cSsOnzOwtNAszcYhe6MepY0YWFpdYMZMkE9jAxScHOH/FoXz/4=
X-Received: by 2002:a05:600c:674a:b0:49f:f0bd:1e40 with SMTP id 5b1f17b1804b1-4a18e4afe9cmr291878655e9.23.1791987427286;
        Wed, 14 Oct 2026 07:17:07 -0700 (PDT)
Received: from localhost ([2a02:8308:b092:fd00:d20:6232:49ca:4be9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0bc506asm12638806f8f.47.2026.10.14.07.17.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 07:17:06 -0700 (PDT)
From: Jan Remes <ciakval@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Joe Sandom <joe.g.sandom@gmail.com>,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	martin.triska@mycroftmind.com,
	Jan Remes <jan.remes@mycroftmind.com>,
	stable@vger.kernel.org
Subject: [PATCH v2 1/4] iio: light: tsl2591: don't divide by zero
Date: Wed, 14 Oct 2026 16:16:47 +0200
Message-ID: <20261014141650.259929-2-ciakval@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261014141650.259929-1-ciakval@gmail.com>
References: <20261014141650.259929-1-ciakval@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jan Remes <jan.remes@mycroftmind.com>

The TSL2591 has two raw light channels - CH0 and CH1. The algorithm for
calculating illumination from the raw channels requires division by CH0
(which can be zero) and by "counts per lux" (CPL) value which is also zero
for (gain = LOW, integration time <= 400 ms).

Furthermore, the algorithm assumes CH0 > CH1, which can be violated in
almost complete darkness.

As a result, reading from 'in_illuminance_input' results in
division-by-zero whenever CH0 is 0 (complete darkness) or whenever the
parameters result in CPL being zero. This results in kernel oops on
x86_64 and in reading the value as 0 on arm64.

Fix that by:
- reporting CH0 <= CH1 as zero (catches also CH0 = 0)
- updating the lux algorithm to only do the division at the end

Fixes: 2335f0d7c790 ("iio: light: Added AMS tsl2591 driver implementation")
Cc: stable@vger.kernel.org
Reported-by: Martin Triska <martin.triska@mycroftmind.com>
Assisted-by: LLM
Signed-off-by: Jan Remes <jan.remes@mycroftmind.com>
---
 drivers/iio/light/tsl2591.c | 32 ++++++++++++++++++++++----------
 1 file changed, 22 insertions(+), 10 deletions(-)

diff --git a/drivers/iio/light/tsl2591.c b/drivers/iio/light/tsl2591.c
index ef3ed9635a1e..f56d31404c25 100644
--- a/drivers/iio/light/tsl2591.c
+++ b/drivers/iio/light/tsl2591.c
@@ -16,6 +16,7 @@
 #include <linux/interrupt.h>
 #include <linux/iopoll.h>
 #include <linux/kernel.h>
+#include <linux/math64.h>
 #include <linux/module.h>
 #include <linux/mutex.h>
 #include <linux/pm_runtime.h>
@@ -362,6 +363,10 @@ static int tsl2591_wait_adc_complete(struct tsl2591_chip *chip)
  * Scale values to get more representative value of lux i.e.
  * lux = ((C0DATA - C1DATA) * (1000 - ((C1DATA * 1000) / C0DATA))) / CPL
  *
+ * CPL is not computed on its own: at 1x gain it is below 1 for integration
+ * times under 500 ms, so the division by LUX DF is folded into the final
+ * division instead.
+ *
  * Channel 0 = IR + Visible
  * Channel 1 = IR only
  */
@@ -373,8 +378,10 @@ static int tsl2591_read_channel_data(struct iio_dev *indio_dev,
 	struct tsl2591_als_settings *settings = &chip->als_settings;
 	struct i2c_client *client = chip->client;
 	u8 als_data[TSL2591_NUM_DATA_REGISTERS];
-	int counts_per_lux, int_time_fval, gain_multi, lux;
+	int int_time_fval, gain_multi;
 	u16 als_ch0, als_ch1;
+	u64 lux;
+	u32 rem;
 	int ret;
 
 	ret = tsl2591_wait_adc_complete(chip);
@@ -410,23 +417,28 @@ static int tsl2591_read_channel_data(struct iio_dev *indio_dev,
 			return gain_multi;
 		}
 
-		int_time_fval = TSL2591_FVAL_TO_MSEC(settings->als_int_time);
-		/* Calculate counts per lux value */
-		counts_per_lux = (int_time_fval * gain_multi) / TSL2591_LUX_COEFFICIENT;
+		/* No visible light, this also catches C0DATA == 0 */
+		if (als_ch0 <= als_ch1) {
+			*val = 0;
+			*val2 = 0;
+			break;
+		}
 
-		dev_dbg(&client->dev, "Counts Per Lux: %d\n", counts_per_lux);
+		int_time_fval = TSL2591_FVAL_TO_MSEC(settings->als_int_time);
 
 		/* Calculate lux value */
-		lux = ((als_ch0 - als_ch1) *
-		       (1000 - ((als_ch1 * 1000) / als_ch0))) / counts_per_lux;
+		lux = (u64)(als_ch0 - als_ch1) *
+		      (1000 - ((als_ch1 * 1000) / als_ch0)) *
+		      TSL2591_LUX_COEFFICIENT;
+		lux = div_u64(lux, int_time_fval * gain_multi);
 
-		dev_dbg(&client->dev, "Raw lux calculation: %d\n", lux);
+		dev_dbg(&client->dev, "Raw lux calculation: %llu\n", lux);
 
 		/* Divide by 1000 to get real lux value before scaling */
-		*val = lux / 1000;
+		*val = div_u64_rem(lux, 1000, &rem);
 
 		/* Get the decimal part of lux reading */
-		*val2 = (lux - (*val * 1000)) * 1000;
+		*val2 = rem * 1000;
 
 		break;
 	default:
-- 
2.53.0

