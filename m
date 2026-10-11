Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com [209.85.217.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BEB8353EE0
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 10:18:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.217.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791713894; cv=pass; b=i/WlshNh9tnTna0PYE+JGSfFN3xEQgMcyGVS5yMyY4bFj8NejRxevaHQLf+/HjDJO5PulUAriB7ymDlxUJifEK+np6mENBQ8hoTTVCndnoSSecLjSm88AeTQiChGQQUV/sKF4o7up1cKxhxMsJV9stp53xsQ7FL+hpEFwqkOsEQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791713894; c=relaxed/simple;
	bh=8QVnP8e031bGfGfvNZT9OId6tEk/ip7/dkUDXa6w1aw=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=C7NM5np6cx6TMoRyAwfySFFghnGzro7MT4zlZ1aws8FLds6lh4i5209GGIF7snWgaQsgbPJbrwCxvwpmno/XLMMNYvQ5Jy0p7oykFIkKCA5babr1NnNmRWlsIi3OPfzOfYgxzrQiDWHr7UnklDO4aBBX670wARqzOR/BU7WA+l4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DtsWza2L; arc=pass smtp.client-ip=209.85.217.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DtsWza2L"
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-7bf5f3736d2so734073137.0
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 03:18:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791713892; cv=none;
        d=google.com; s=arc-20260327;
        b=gexBcbiEZrfyaOs++1xuvtm3eym11/cw2Yo+ChVuhTDvQqg4fdcsycSvT6+/85L8a1
         yvddLUCgK/9nIYJmLtDs1YLq2uxck9+r5tfxYqP90aGBwyMtKpmdobMuRRNQIoHmlo//
         ZWyctqVfhfFwq3pWA7xrbRmqJnAXjSpjtWnP6I5zBOdi6qMc82b3imBisOSMNJyQtKcV
         HXs2JPST82RXw7eEiNtQ0hc+8Fp1bwk9pff6ASfpiQX6PtfEUZn1Kn+i4jZnVAgKaIRn
         MeK+tBk9eImZV4HewIy5eDPuljrYqTBVzBBj4pWuBFACRQ9DNe9AzNmXNvFPAJGWjwxX
         Jn/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:dkim-signature;
        bh=7VFFpRhUZGG173cxRqsJ8XWcj2i+48AarU4CckLgkP0=;
        fh=5zjHXyLlZBmsWpZov5s9jJbQuXGtPDif0SJj0qY9SDw=;
        b=K0iZqMp9j5Fi8PUUQRwLhuXssnOqdtI0CXwBitHHrPbOYHTCxmY5g0F1xamEXo5vwq
         2B38J/qCs5f7zzeTFZg78JIV/C+zrrkArY//p3cCQ8ZZ/2WNVJo+XU8t2hn+MfxyKvA3
         1AJ3yHNHOYsc5UCSOPgeGwg0aGzHYw3Nj6VrE3Xj1MhV+OUnxa9/4ePQt6zTDzJ60Ahx
         JMSCBciODV81ihC+uAr9OCWeq1pqQyJiSj+69/2SXMXgFlBJscIebSSXQtkvm57VvmDP
         m8mfCJjmf0ILCZ46vcPyx5c4jcQI86Gp7fLarH4tv+5UZTmR8neS7wPghJ9QfJ1yw9aJ
         5kkA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791713892; x=1792318692; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7VFFpRhUZGG173cxRqsJ8XWcj2i+48AarU4CckLgkP0=;
        b=DtsWza2LnSyfn+n2nJDPXdfmm+lGpgMOXksW4jiXdP5HJbYfgShOUTw0LV2aTkaElj
         tngBZz7Y8vnMxRORnUud9QZZjpuwYDeoAXtGkOVVDtL7Zu3MSbqHGaVCWIR2mtqduBw7
         5YIbc8191Ebo/TItmPdGvdtoBxd06lDIzsk6bTGeDrFtIibHyliwDX7nDkgZAvkPnjM5
         h7pzYuBbq4a8u/GiD6pRyYmIqIbWxUkl2wh6J4UqGK5BlI2qeIzHkF+rNx46vKz4anQ9
         xPC//WRvQ7jQTfCAO9IAE3WUNQZk2IYU6O132aJ2qPiOe3UxepMnyxessYmZcXRIH+C9
         uA8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791713892; x=1792318692;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=7VFFpRhUZGG173cxRqsJ8XWcj2i+48AarU4CckLgkP0=;
        b=V1kOuRggaxRRZ2pvuke4qXmq/OKz3Oud7NXhUYA1E+A9piFVk8TDdIJYQVjdKr+qXX
         hl5UycRfTmJUcSm0C9xwlrcHMjwWzUyOkYZMZYfeR46Y4S7+UMlG6JT0ABAqGl0P7UHr
         tzZmTxBB+WwWCJGOBUaRfgaDs7LpLwgZvHb5A/ZS6OLqwcRprhKP84V4JqlLRTS3ad98
         988R9B/pXJjqfzLX72UI9Cn9d+QVaUCZnNwNXKJlFRC8Twt1pBDr2HRdguoMMR5dIo9H
         2y6lNRCZ+OdrB0L/4lyoQiOvLL8neb9CU+lkVvFuNWuNynk5XVIa/oAeIRU85nv7CPxC
         mScg==
X-Forwarded-Encrypted: i=1; AKwUvBwZuAZT3+kfgDsi9ELSnAFHJR0TKZDI0OYXdDIQFpmQXOPZWPMnHFHKys7G8XOCDfk0piklw0z3Kt+yMRI=@vger.kernel.org
X-Gm-Message-State: AFq9FYLaIDbZZrk4sqxHx1eft/mTYGLwwhbsSPvGvYUtKpJviP33vJdc
	T/N3nWFtY8BjnmtQ1ThwmsnAuYyRC87do2/vteRdk7UJNd341MUHNuTqY1Gi9jAFi2lGeLpURz6
	QkXGrA+xdSpvkgRydGmC3ZzUWjOBHkuI=
X-Gm-Gg: AYBFou1xOWy07uzPagYrgq7ArMAilhj0Nw5FbcD8bwLB8aNEm6qUIwvAVMm/uUaT/Mh
	fDe1FeGnf9lOrVFhVnoDJLLgo8DK4Ak7HkAoffx+azdSNsQ49IPa+PPNQPuByrCtoPh4MiZ6hdb
	nEO8XGOTUaavgFGJwh/cgqqCpF7RFCltZswKgChIAyTb5E+CkvVpzkST8w0jILfuAq3Es5vNn7S
	eHnfVYmwotPsLC6uYEavHwDXKtoWUXqSIlh/GM6IKJ/08r1BThghR1yqSGPKnlfuQqBAnHfb+93
	fofAnLp9Yfn8cNSercX47kabuEqCimoMszss95Ahohre78Jmzdz89g==
X-Received: by 2002:a67:e70e:0:b0:7c3:2fa4:9a71 with SMTP id
 ada2fe7eead31-7cb3722f17emr2058168137.9.1791713891831; Sun, 11 Oct 2026
 03:18:11 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Sun, 11 Oct 2026 06:18:11 -0400
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Sun, 11 Oct 2026 03:17:39 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: =?UTF-8?B?6LW15paH5by6?= <berringtoni36@gmail.com>
Date: Sun, 11 Oct 2026 06:18:11 -0400
X-Gm-Features: AclHuK9LHDqD951buwV0hi21vRltaUq6IwxrZMZz83OPQBQupDB3sEGtQOzC1cM
Message-ID: <CAF2O-sPmL=eyUD=EndsOpDnJr2FvpXxhF2RD5S-4-9OgfCRqkg@mail.gmail.com>
Subject: [PATCH] iio: accel: adxl345: update period cache after successful write
To: =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Michael Hennerich <Michael.Hennerich@analog.com>, Jonathan Cameron <jic23@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>, Andy Shevchenko <andy@kernel.org>, linux@analog.com, 
	linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

The ADXL345 event-period read path returns st->inact_time_ms. The setters
for inactivity, free-fall and the ODR-derived default currently update
this cache before writing TIME_INACT or TIME_FF. If the regmap write
fails, the sysfs write reports an error but a subsequent read returns
the requested period even though it was not programmed.

Update the cached period only after the corresponding regmap write
succeeds.

Fixes: 8a1536cc4a1c ("iio: accel: adxl345: add inactivity feature")
Fixes: f6f22950d925 ("iio: accel: adxl345: extend inactivity time for
less than 1s")
Assisted-by: LLM
Signed-off-by: =E8=B5=B5=E6=96=87=E5=BC=BA <berringtoni36@gmail.com>
---
Validation:
- A host harness extracted the production setter and period-read helpers
  and injected -EIO at regmap_write(). The baseline failed all three
  failure cases (3/6 passed); the patch passed all six cases, including
  successful writes.
- Compiled the full source to an x86_64 object with Apple clang 17 and
  Debian Linux 6.1 headers plus upstream IIO/regmap headers and a cleanup
  compatibility shim. This checks syntax and types with a mixed header
  set; it is not a full current-tree Kbuild/modpost or target-board build.
- No in-kernel KUnit or hardware test was performed.

AI assistance: Codex drafted the fix, changelog and fault-injection
harness for a contribution related to an ADXL345 SPI/IIO project.

 drivers/iio/accel/adxl345_core.c | 27 ++++++++++++++++++++++-----
 1 file changed, 22 insertions(+), 5 deletions(-)

diff --git a/drivers/iio/accel/adxl345_core.c b/drivers/iio/accel/adxl345_c=
ore.c
index 6c9080d..cd58304 100644
--- a/drivers/iio/accel/adxl345_core.c
+++ b/drivers/iio/accel/adxl345_core.c
@@ -391,30 +391,47 @@ static int adxl345_set_default_time(struct
adxl345_state *st)
 	odr =3D FIELD_GET(ADXL345_BW_RATE_MSK, regval);
 	val =3D clamp(max_boundary - adxl345_odr_tbl[odr][0],
 		    min_boundary, max_boundary);
-	st->inact_time_ms =3D MILLI * val;

 	/* Inactivity time in s */
-	return regmap_write(st->regmap, ADXL345_REG_TIME_INACT, val);
+	ret =3D regmap_write(st->regmap, ADXL345_REG_TIME_INACT, val);
+	if (ret)
+		return ret;
+
+	st->inact_time_ms =3D MILLI * val;
+
+	return 0;
 }

 static int adxl345_set_inactivity_time(struct adxl345_state *st, u32 val_i=
nt)
 {
+	int ret;
+
+	ret =3D regmap_write(st->regmap, ADXL345_REG_TIME_INACT, val_int);
+	if (ret)
+		return ret;
+
 	st->inact_time_ms =3D MILLI * val_int;

-	return regmap_write(st->regmap, ADXL345_REG_TIME_INACT, val_int);
+	return 0;
 }

 static int adxl345_set_freefall_time(struct adxl345_state *st, u32 val_fra=
ct)
 {
+	int ret;
+
 	/*
 	 * Datasheet max. value is 255 * 5000 us =3D 1.275000 seconds.
 	 *
 	 * Recommended values between 100ms and 350ms (0x14 to 0x46)
 	 */
+	ret =3D regmap_write(st->regmap, ADXL345_REG_TIME_FF,
+			   DIV_ROUND_CLOSEST(val_fract, 5));
+	if (ret)
+		return ret;
+
 	st->inact_time_ms =3D DIV_ROUND_UP(val_fract, MILLI);

-	return regmap_write(st->regmap, ADXL345_REG_TIME_FF,
-			    DIV_ROUND_CLOSEST(val_fract, 5));
+	return 0;
 }

 /**
base-commit: 9ee8306121495d2a25aa5d1bfd519f2748786b83
--=20
2.50.1 (Apple Git-155)
