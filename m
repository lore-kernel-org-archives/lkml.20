Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792670044;
	b=jlcbx2yZekgsFr4l0Wu3CXhw3RHav0a8mXJYJ4iFfbreNk1aRuCXUleBBGnmJD8KoqWb
	 nxAUQYQ33EZfcTHKc7BtoCIvMZ5jz8e9CBDi/X+W+m+iirdRW5Du4i1MbwM52iCUQ89Gu
	 zFOfvhu1gum/ENee9vzcrSnHuHHdXNhfUyjWyjhReiW66y0bIrpcwULsB4YWQMbwVSG77
	 oBXQLropl7egraVXDLeewmsk/6IvfVnrv+of/51BYEB6KHacejGn0kqp8TBGmGTOXlZNC
	 NGeDBejbCSRrfo8goCtGkX84Bpx89UQIL6Dh3VB9XalfKqfMPjDvgSKBpZ8rtzffIMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792670044;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=YxlCmOT7eJfl7d21JfpqssCKce37H2r+MwEthBjDzno=;
	b=h/JhBp0gwCV7HGqK1Vddlc9bbCSFB3NnnO/obbSzuOM2PlGinRQm8U94SmacYaMLGN9T
	 m2t5gweGBS5eF0vt7+Hmwei/YMBAJFwZedORPoheGbzlCj4zljeGKdPOFt+RGJIgjQcSh
	 doNpg0QzTeVcsJMCYEnmkoh1p2SFp83LFSOoYNA4Dy7XPSAa8V3Ll6EhxI42y4WtrkRPl
	 w8DFj36O8SpdWCCyN33RyYrcbSXeHk4cu2jNNFFnoyq917Qa4ywFfBek7iQ9rAt1zSRaL
	 LyC1EwX3uyB+5Pvn+hCGh8apOEy4XuosDOVO88/hJOd274oYN/UAWfr/25sgBl5wDYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ZfTRjXM5;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 089DA606A323
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 11:54:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 089DA606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ZfTRjXM5
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a20803a757so2842135e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 04:54:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792670042; x=1793274842; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YxlCmOT7eJfl7d21JfpqssCKce37H2r+MwEthBjDzno=;
        b=ZfTRjXM5P/KOG3kdqzn3/eIMY8HHK9gUtAuHjAUIDLapWpNiIuwgUoJEJxL3h4cYYV
         vrV2mknc0I/VVKhroieCkxEUzVEloT1zeR/QY0hrZ1v2GWHgqmpXpRfOHQEK/NYeApaI
         G7zxxXaNMwAJdWYBAbp9OxMT0fgB8wuyycvvIg/oEWLm2jz1z2fJEY0ycaDLTQBdXFEs
         n4gT53cuqJRvjbea0+a0d3tqVJrl4SaUQVD4CvLLU79gSIGLqoTBXL9PSoiGmLdRgu7t
         5pVHm6vgT8Te5A/JNBF3q49Asr8y5fn8sznyQaikZxVyARoioC6bYdYxnskdpWqP4B0v
         mdsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792670042; x=1793274842;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YxlCmOT7eJfl7d21JfpqssCKce37H2r+MwEthBjDzno=;
        b=Iq9IJeIEXwJ5rNGEKG0xW3U6+WcZhe9COgWDcwL17zis8maDygozNdd3auLaWGHw9E
         UC3eu2cv0k7AbRyYsW40C1SpD2A9K9dn89VoNVjTY0WpvYgMrv9YutE+6KYtl0Fguefi
         aDNV/wiIiSo1E8Ju56t1e2E6f+It/QE0Fs5wAKAOVxFvLevve+bmDEMTSzVemoZ9wLZa
         VxFuxfi4N34+rVeQUcDjcTJTWRgHfchchGnnnmwIZK7bbktcJi8WEVkMUT07T7SZhbqH
         atOmER7nAIMuc0xcP/i5RO7m3ClUbBsHRGHo2uCK9OsKMHmuI/AqK+qcgpyK/vTNYmta
         LmxA==
X-Forwarded-Encrypted: i=1; AKwUvBwstFFuw6Vp6gnxZigTub6yjDHPZLCnrzzFpcK5A46V54YEYfvmxlK1c1IIimPeNrxNQe549nAb8qG2iuE=@vger.kernel.org
X-Gm-Message-State: AFq9FYJsUo5jktWs6+siqqKrdiI5IcUhO/H8ziup60qKAoTfeg5OcaAX
	c/HhyxEJf850GNpRsFqUKtaroIAkoq3nKLjp35JvDKV8bbcG8szNj3Av
X-Gm-Gg: AYBFou3BXCzYJK8xW44LMRs0coUAxbdJIq5wq3qXU2EeC2PAt+8yPSyNrh9To1ItSlU
	2DYIip/3bgyn5qGJ/JXQB4aBJjWlY2+TGL8CV9P8JOJ5ZrGW/NPXUxVsJH1DBqdbs0vqAshEQdS
	p//ij2wTna6G7kaU0/tDR4P+sKQaUdrKlN50ktbvC345OxWxIC8tJUTmogF4dKxzdR2oFKAz1KM
	EZRv/kNXqfjh9ctOWBUr8dvYruu292JITU2lz9eGCXzMb0yYZzcLwUb/XIvS0pZm4XcKkKSR1Zw
	xosUqXgNiRhueELwCehHMi01iCWxbVZtqcunRtycSbRwOtbBynO8rD0XrBoIUewDTPwAiR9ATgT
	i462B31AyMmOnQ0TUMs/f7Qw9nnbZy+TOa3WQQqTr3dmzlCmjO/jL05f2MmiuS/ZpNdiK0pRoGF
	RdbuAwZiCl0rzNnUAxf8pEXq21mTms2uH1EU9SieMRx0lGzDRmNm5bHsiL771K28wBfEtTGvWwU
	+Jqdf2OOa3Wr+eezqjllWkanotY+vxEqLxD9iWkNY9wxF5c25xXy198qkrtfEODpCWp95lAP6UT
	ChFR1Phzlg==
X-Received: by 2002:a05:600c:34ce:b0:4a1:dbdf:17a8 with SMTP id 5b1f17b1804b1-4a1fd8a7d77mr102657805e9.2.1792670042298;
        Thu, 22 Oct 2026 04:54:02 -0700 (PDT)
Received: from localhost (ip-94-113-240-150.net.vodafone.cz. [94.113.240.150])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e25828ca3sm11613395f8f.25.2026.10.22.04.54.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 04:54:01 -0700 (PDT)
From: Jan Remes <ciakval@gmail.com>
Date: Thu, 22 Oct 2026 13:53:57 +0200
Subject: [PATCH v3 1/4] iio: light: tsl2591: don't divide by zero
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
Message-Id: <20261022-first-patch-v3-1-b792e89a429a@mycroftmind.com>
References: <20261022-first-patch-v3-0-b792e89a429a@mycroftmind.com>
In-Reply-To: <20261022-first-patch-v3-0-b792e89a429a@mycroftmind.com>
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
Assisted-by: LLM
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

