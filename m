Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792670046;
	b=CNi16pciOo3YL0dN3m75fQFnMKsLuGeyYQyb1rRYKSKtWE8qc770sL+dOwsVCprAZvO2
	 EN3WQM/S6ZO8uV25MnZNdTDYOYtUAcIvy8SltnMC3cvdzcs16U66Mpy6RB7x83Da4CreD
	 cRVQZefJpVB9jezZJWVQsbfaiZ9mMAmV4dC5YvR9iIkol9dYNkVbxp7WZtgqS6vDzZI+2
	 AQJASuUoUfmOuqP4gP3tXqa8356w2SVFycsdN8BNuTZUqbBjIwtRJQUOTP/DBv0YxpZr4
	 9C2LIev4jemplA4Rxumd+x61pVJEgmiM7BLTqecin/OMrPkF72+Z4pelDmZcvvzJItw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792670046;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=peR+wtMRuf/Lbf3aBVnZb+FceQ6m+uCwk67vJ8kOWzU=;
	b=CQiYHhooBdSBlo2Z0+YINoUMvXw2CrJ8kvJ8uzHYl6v2ilP7KjqLyvuTR42bBOlFFgI2
	 lteRG4kZ7XFBQ2wCOGIksh0eV4qd8AJt3IVeBK1aJtbdpOLQL7f1IdV3U2D2MRcJ3d76E
	 YPvR70B0Z8uHA/nq4ZDlc1A5BLRs40Qy7ukOc9idGx1arZwhrgCz1UJz83R0Qe0mF/5sH
	 7PrtSpcxW745y6NWp4hcs7aGtVUSZKaXC0Ft5L9Quhe9GxXWwnocRPh83Vu0JjLFJu6ug
	 UgEaRleUq7QjRdB1XZBTdrD9ulbfK9HjKiyKr37UHjYuajKu0jEyufmMMngc5r+AvMw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=oRTKVgbx;
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35E5060A2601
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 11:54:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 35E5060A2601
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=oRTKVgbx
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48e1d0e5dafso591565f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 04:54:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792670045; x=1793274845; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=peR+wtMRuf/Lbf3aBVnZb+FceQ6m+uCwk67vJ8kOWzU=;
        b=oRTKVgbxyBlIREX7nZMYP+04H0N8obAoqRFnsZsoK0olwGVDPe8k4ZtzBK+MY80drs
         TlZFP5ymKxgbUX2oCBuKze2R6SYmG0s7In9DeKQ54P2lAVdmka4SCB+fyFSfRJ9IcNw5
         m6QQVw0Nzeb5KocUfYHaue9nRZynhDxOBMkbUFx1+83G2M9uX4MVnQ5RTLy812IW1U89
         hVcXSyqz+UjgBLhhYlhl15g3DmMF8XlA2huFyKfdDFey0bGCB2DGjyhQAJqFdtVJoXBz
         JVUOEMX1VZjDIq2+QYHv6j9BAx2Yre4LDjYYNSJKYK/M0Wbb/jTLjCqXnAAo6OiWjlYU
         lGkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792670045; x=1793274845;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=peR+wtMRuf/Lbf3aBVnZb+FceQ6m+uCwk67vJ8kOWzU=;
        b=ojRMZ8N6yBM7l8ucMCbhoWoy14oiXMJXZ5MRaSlIHgvSdJVFoGi9YlIQQ9evWOtK1R
         xWuu0zNcHHRVEsgEjHXVIWQqrQ/XguXJjeSMqvr+QNVx41KdF3yHUQj3dJsegq13+eoz
         BK7/57pM1Na1WCL4PwdO+C8aGO1TrSQ8XKFIhEVOTv+fDh47wic/has4JTRlzNqkgPaR
         M25fsP+Q96AUa7WCL6L42ojqzCc4uy+YRcMCGcmpS6HtO/ognjW/PPeL5o53HLkd5eMd
         5MbiGCuGxds7B4XZRoHVfNDV2+31ldIJz47ptc5Melg7Ra2dwH3VELgcak+1eSC+SOlx
         5w2A==
X-Forwarded-Encrypted: i=1; AKwUvBzNnrSjFpkUgMDMdnFBmtZraDgb2M+9aHDLOmyN2026yruhSq8p4UE+W/Y2+cvu+CcjVZUs5Whxrk/4V8U=@vger.kernel.org
X-Gm-Message-State: AFq9FYJGrLm3mFjOrkxhnOd056vDhNuE2amV7frDQCdAU0cJLamTIGnw
	LeSvWtjsYsbkGQI04MNhaJ6ReMERr2ymD9x585YWpfSYfivT8HAlwisObAzIP21BA7I=
X-Gm-Gg: AYBFou1AvUQSnUrQI+/8XVpuQRASOr6n+D4tl7/pS3Hk7gFH4itJD/NN4GBv87k9GtT
	IQdWTX5GY8gm5bzDLNTz5oAUY0UyamPccRwcOF+BMZeTn3CVJFP2tQsp5CW9J7W1aG57r7D3Gk2
	VTWkjdyvsxmzFX0B7h0eeekXrgWWqAm12Eb42IAtt0TGLpJR0H6BRuHoFjdEq6aJHT6+k+vL1Is
	uzajruJdQihSdm+dooIvFce1JRRVi3OifBCdIR1/0Av8+xHPcC7zunzCZ5gBzVFxb0iot+aJr17
	s9/jgRvEijOOjsoaVEmsMVltXstA7ikrySn6FdgXCshQlNyYWKAcv/ZfNDGJi9NyXpdAJ2omzNr
	5eSiyBFLTT3EWWH82ZyXFik9ZLIw6aPn9h6wE7xBHRAGxUAZ1gPLUELzYGV89e9QS8bICzUTz4O
	ETlWNo5lQt4bpN1Pr/dWJMpFqtYukGX1tuVIqy8R3QMh6zHz3bIva95KqLWtYJAckj62fTgwZWE
	nZLe5RAWJLkLMMeD9eIhSbm5d10nszzOKzx3GFGi/hxaOsDFtCNbkDHUAOS5AdJeEq2rHAvqgom
	xbWsilwOsQ==
X-Received: by 2002:a05:6000:2f8a:b0:48d:f160:efad with SMTP id ffacd0b85a97d-48e2d27f5ffmr5035811f8f.30.1792670044596;
        Thu, 22 Oct 2026 04:54:04 -0700 (PDT)
Received: from localhost (ip-94-113-240-150.net.vodafone.cz. [94.113.240.150])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e25841fe4sm12371400f8f.53.2026.10.22.04.54.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 04:54:04 -0700 (PDT)
From: Jan Remes <ciakval@gmail.com>
Date: Thu, 22 Oct 2026 13:54:00 +0200
Subject: [PATCH v3 4/4] iio: light: tsl2591: improve lux calculation
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
Message-Id: <20261022-first-patch-v3-4-b792e89a429a@mycroftmind.com>
References: <20261022-first-patch-v3-0-b792e89a429a@mycroftmind.com>
In-Reply-To: <20261022-first-patch-v3-0-b792e89a429a@mycroftmind.com>
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

Assisted-by: LLM
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

