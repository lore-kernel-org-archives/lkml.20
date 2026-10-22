Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792695442;
	b=HXr4PehhyaPv28auLp4exA4rbXyV4bMPoEJpzQ71T0YKi5hiBhFXre80Z1Hz+jjalbpN
	 48eH/xEbwfbGEtzMHXprbstlgu3nrzP5KEa3EHOY3pOR04jk8u8mL60hr8aK5P+bCshZN
	 LybXeEEe7WAV1wZ+F79tcVxmAMXpFa5T8F7qG38GAVDj3Q55542ISFulBVZYOSvUeN41V
	 8fx51RhwGl1lR2UpxUcfjF5+udvW+A7NscPdZrjkJvIG0vQlZQRxR1cf43of0i5jvB/zy
	 JfD9GvIuCW4bjhm8i3Yhljg8HsuOKVLhO3lesSj9eAPi6yoyT1ErOomMbbtB1Pl8tZw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792695442;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=k6t6hNWD/TCa3KhqajK3ikKYHbg8LQCXp5YTHqmRyGM=;
	b=ZfI/+K6o5WwKzh+H3Bpek6DpWbbNSlwal5yAn0nr7imFd1Y1C01oVNsKJ0dSC0UlYfAp
	 MMaKhGwJJS3aFeS8QIOqIVgtNT2M9/fWWVInGCA3gYecDDhiWJG6AQkX/t0ohjxw2Oe7g
	 OEnG612ChJFHJtmARvsoVg8H4T9SX5BHHEPvTAl5aOCp39fpdLUbc3SpLppOMsireDKis
	 NGRAH0+hfV2eYXRO80gG2HfS+55Af3GFOqHacVP2sKTACLH4GVQh1WkeF1RJHXvis9pTA
	 5WLm5a3FovNY8uliqJtMQVF6d4gbBpWeo7IPiV1eUza0Q2pYmE99hAyWaRStutzkybA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=MLzRKjna;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FD31606A325
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 18:57:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9FD31606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=MLzRKjna
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a208d93758so1333145e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 11:57:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792695440; x=1793300240; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=k6t6hNWD/TCa3KhqajK3ikKYHbg8LQCXp5YTHqmRyGM=;
        b=MLzRKjna5tBlkK/Gjzbdvr9H5iYwVtu4YaemWrVLYuqP0k0eQXsYf4jp+ayNbNLacE
         Ry9e1xaNZwDTFONAUWYZe0feqk3Mb0ndNDRTyIBoLpxbM7y9QTmHn1RAtNGC5PMjNiZk
         6wZ8uMoEwwimYxC7pT1mFoVccRZQHgTAiNBWTwq7xhGTiY2pW5lJ1JJzUpI/iLIM/I9N
         O+aXcqYNwj8ZW7q6deN8xrp6RqmCilmWhWi8OaPHau8yY87dowJ3LoQ42dpMFMZm3k45
         2gGSWqsTnbeTYNgRMl9kKi9WhTWauHso7D6F4kfyGRw52msBzGzL3W9HHY43DA1dfwlM
         XmDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792695440; x=1793300240;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k6t6hNWD/TCa3KhqajK3ikKYHbg8LQCXp5YTHqmRyGM=;
        b=R84HJDJFQRni1bP6TeVnbDu9TD/VeUtfW1psjoGsnZdHAx2YbYlkS5Sb0kbgGXbbo2
         nYTe0w4nfVnc86Xne/t1Q8qa2b7AM1KnH5Vajcx2FptgyfLOTAo2YD74eGKUbbBKLgoS
         A2jjUjewXWlQdLoJj5S+OyiUevGF5950UC39B3MbtacMyWN2ZzC7MWy4kT6PvaFFqkzF
         y9/BNsRgdzxcbKCoZIldLNv9GV9a84uzeY9C9ZrxKxjwHvQg5/DGiGgSGv/lchPnWrpm
         R8WcLWJnv2XuXwYSrKYfHn6SHfGn4ZOvZ9dcOME+KsFbc5QEAo4qPkOHlQN0mTush5qq
         5sUw==
X-Forwarded-Encrypted: i=1; AKwUvBwd/5yEHlwxsI3rKcckulNre7Ss83KVcJ+nCGwfsNmnlXkvILR4RRSHIc+UZkRWxkDAkfuGugY3wIARqKM=@vger.kernel.org
X-Gm-Message-State: AFq9FYILIamkZroAmBJh/kkEckTnoAgx/DHS1t7Z2cD19lRjrT9lUOt3
	DciXeIjgEq29bMCZBVbj9jtkJiNtS15VGttTeqyF9+qg7OZ4TIfXWutxJbDsfTUNxI8=
X-Gm-Gg: AYBFou08zVoLL0WhUN7Lui+RMk8d60nMk/vb3B8NNiVMgPdnFmvFcN09AoO1dNjODgU
	6aD/2r51Xvn6ag/pcDQpZe6MOiRDSdKp3C3+siTAS+4b7zTHm5/Cao6yNhi6Cxd1dnQXx7l6Uo4
	eJV3HZlSiDie1MWySzGDhSgy/60rYO2KxdlStnfBEJe3jKiT6uPmSmX5w0rbFFz0a6dzwbKusz1
	OqyZ7OK7mnxnkUbAa2mgIQ1sS3h/Ldq5ht6D7nvMe6BQoGA5T09/BxTb+p1H3aP/e2Nzfe/ZIJ2
	A44TXezaOJ6ksoHjyCxY4qUvhuSXmR7VLZRFxtP8ZWIR3qlkiwXzSHBwZ8z1HN9jC6TtcCEhglN
	F0XMv+ivJHNsmh/tybSKNS179NN8yvGcZXnCjnDEz0nh5mqf2uzm/WZ73K+Gp3ae50m4Hq0faQV
	lKgtbgpD90S8Fur04lP7yk/ymcwO5terxzX/kIQT7OWTdqA87ofN6rSuf1/3PFoH9g4EoGi1TR4
	/l+kOz99RsmlLJBIuvHePia1QmwqrVVSFtc4A2uDjF1EdkkAW1sbZjL0TJh98pfRxCZqQXO39A=
X-Received: by 2002:a05:600c:a0b:b0:4a1:7bae:d80a with SMTP id 5b1f17b1804b1-4a1fdd245bcmr119483665e9.9.1792695439903;
        Thu, 22 Oct 2026 11:57:19 -0700 (PDT)
Received: from localhost ([2a02:8308:b092:fd00:d900:ff27:14a1:f032])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e379f0695sm162442f8f.37.2026.10.22.11.57.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 11:57:19 -0700 (PDT)
From: Jan Remes <ciakval@gmail.com>
Date: Thu, 22 Oct 2026 20:56:40 +0200
Subject: [PATCH v4 1/4] iio: light: tsl2591: don't divide by zero
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
Message-Id: <20261022-first-patch-v4-1-90b2fc6e8e28@mycroftmind.com>
References: <20261022-first-patch-v4-0-90b2fc6e8e28@mycroftmind.com>
In-Reply-To: <20261022-first-patch-v4-0-90b2fc6e8e28@mycroftmind.com>
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Joe Sandom <joe.g.sandom@gmail.com>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jan Remes <jan.remes@mycroftmind.com>, Jonathan Cameron <jic23@kernel.org>, 
 stable@vger.kernel.org, Martin Triska <martin.triska@mycroftmind.com>, 
 Andy Shevchenko <andriy.shevchenko@intel.com>
X-Mailer: b4 0.16.0

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
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
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

