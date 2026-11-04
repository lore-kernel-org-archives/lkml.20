Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793833418;
	b=uxayGZjae0ZrzAD8X/iDUUDL+BoB8CVYowz6/7T2ry1fvyOY4y2DEFeileK6vT0uVIRu
	 RqAK1rPuVvBkbgLkoNplfWtucXr7rAwGmWRlVszh7UVyWnUwP7/+Ih/CSp52VKHJPUus9
	 rwmtAW7cVHp8pw7D995NrgqyX3jCmnd4tSgdQyoM8Bq0WCM0jZ/uU2w+jIcj5PzwRusat
	 bV/ompiPojWjoM/zaW5OeHhGQks/6O+0vYd4Y4kuHLm4C+LXI9P8wERRGC/9LTYS1gH7e
	 7Gp2nMV5tFgjyzOkb8/r+QGoYNYaIHjnm45RBQxWlZATI+Y9FIpl7DV/gRTqezS/vNA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793833418;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:From:In-Reply-To:References:MIME-Version:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=TASN3SRwvlxH6Ri9XmKZPLPt+xWrnD4iUlUH+1j2Dqc=;
	b=HznmqqGJCP2J5Hm0ThcSVrGg4BYWAhUYbv6yUdwVUqsNPWF8MCHkK3uFlHhxfsvTBO+e
	 iC9hEVuIkjJZ3YgsiBs49AmHl6rEWMpAfI0wArRAQnBfOH8Aiwj7SUHGnAKXtqQbgnPNg
	 pLENkl+tEmv/36oA7lmO2mbaihwdtCmdoO9SysfVPKLNaiPYamkbULErij1RlQZdUBzYG
	 gi9oF9rsLraZRvytVhbdZ/PFMS+e8jaNX705aLzT1YSb7PPVfga4l5svl2boPhpouvYjv
	 cAGC+PmTnmjeoX13kJxKvy/7VAWXpzJROyIzIEgnyWjlpmwwLoRj+5W+h19ih7n5aQQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=j0m0znIs;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.47
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A1C0606EE93
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 23:03:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4A1C0606EE93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=j0m0znIs
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-7f48c750afcso898230a34.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 15:03:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793833417; cv=none;
        d=google.com; s=arc-20260327;
        b=bk9Pu58KitSMGJzVu1aW28Isih8PTm9EY55uyvky/o4wgKnVio/eQP6K766eN78WEh
         xUVCGGyfV31R8zEX2RDcd7JWKCuIZHtnsq43ECtF9IJck8lx+9XcJkAYaQ6HeJgbaDab
         nAE8pzGU7wKxA262qTri4F/Z/fGuhUT+5ytpv+oVJ6Hgi3XFDd/Fsl/dnJuwoapTl3k0
         FLrcoem51zRVCgKemvcrQBr6pf9zKhckxwxN67DJFvI3ZuMbQwyxL2DFjsHRX70bvUEU
         hqh3pMKQjUjhq5AdnfnVwBuVgdyGMG8mG+0TDKtNO6zmu/SrP92uAAUUuxV/H+38oUZo
         J9lQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=TASN3SRwvlxH6Ri9XmKZPLPt+xWrnD4iUlUH+1j2Dqc=;
        fh=YwPGgsGAUcMh8ZfNBP8GSXSUdadJF/mk6RAcUKb9tHU=;
        b=Gf2PyUvbDigJbzgm6/2uzHybGXXiiRO5OMX1Tn3rkzFNcedcpeeF/gPvhWvEZ4MN6M
         5z9pzNDofmexm1sqJ7HajqjdXDIFqpy/JMXMVVq6SMF/Ko5qiK+Ba2tGlkfFh15Jz60Y
         8iePxEhU22ka4iy5A3LzbpTH0q1P096mZ704+dOxINHCH0ZgD09+nv8xNSXKZwWDqJ6f
         YPwH4vnv2Whpxgx/o7pRmZXUlpERnI8i0vOgCR8oySduUq8E1tafkDYHtad2V/vZxOu7
         m2qb26PKwAc0/o8qqsDm/PYlZiC6bKHQMkWN4rE0kohe5BvP9XjeCpciH3CUt+f6IFIo
         uufg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793833417; x=1794438217; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TASN3SRwvlxH6Ri9XmKZPLPt+xWrnD4iUlUH+1j2Dqc=;
        b=j0m0znIsup/qWIeqK4wvvhVN9ewaBu36TG4pQfrMscHx/qzUVos0TO4uX1F7xbjGml
         DOm4sASZXe/m3skCbRgVlUyXNWxBhsHV7hj/hywd8QR6CLOr3ynRwFv/fQ5IZZHXFI7I
         MJE2OhvBqiDzTqUOEozYfh0Z3qwg/D2ERD6oDj7IByy4bxmTtiNb/1eqvLKFHFqKZrWV
         OtYR5zrYLUM24OCkUR2vWBXOs4Y9N1MlEDPP8QzWHPu0euO/YCuyrFySDYop8X04DNXH
         iwmiAopm1uCyKBvyQRL2RKGkSPnAnv8UO5yc03V0eW7i3L9rFyJtvl6oEEnoB1h/AXgC
         GSXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793833417; x=1794438217;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TASN3SRwvlxH6Ri9XmKZPLPt+xWrnD4iUlUH+1j2Dqc=;
        b=kpx06tIXsCtVuZcHmql90XyGojhOSycwVL8RMtHZPIUuP4rSySBOwAOz81Ow5gl8Ra
         mYEsZ0JOPXWxBTErtj5mbTO+hq0K/95arT2AL+U/5Q1J7ToJiph6xgFQJrqGf73cqNnG
         84prVvGc5zr0QSt8loWtJLe+yN0HvFzOQQ0aJzz/V1RjhYNMgi9tMfBZ7w1yIGaf1ZfG
         toAgmVbfWGQDQu6R/CcHrq5BzdyCFDscyogoiEmWIqD7qMmX7aTEuP4YXr/8WkFjNOLh
         GfXYOwgHCUBeOpGOYC8fva3V/+v2AY2Ov9YLiHwsxwekfmgp9L4GbsHuTu5kyqVqEYzc
         igGg==
X-Forwarded-Encrypted: i=1; AKwUvBwKf3qRh+rBKMf8/e28PnuyU4fecij31/y+YngCtJw9u+bckK4tIyvJHMrw7ATFw/JdUbjYEj2jwP4jB68=@vger.kernel.org
X-Gm-Message-State: APuU4Z/LHgUemtBHEtxm7YbecOLTG7EdL2O+r71udDAnJZT7+d31doWr
	PEzA0mJoI/WRzRns6Bhh1gLr7+uo58olThGY2ByVfoSsqPJ94YpB3jg4vNWlXzhCFOiercd5cIT
	TiYTrGLKeXQMSPBF0PHCZQWW/ierjS9bmsLlvytQ=
X-Gm-Gg: AYBFou1wMiUuJ67+Ey8T0i55d/cWIQ/G82ppEqs8uX2FvTzdSJworSIpfUS5XYdSPka
	wBLXGX3wwS4jJ2V+SMIu/J9xZxCcEGBLHaPnTBrbyeHPI4dbp+L43PUdN5kY+6ObPrf24yi83nD
	sy+DokDxIWw88ds49+XorKQcILJ2AY4G85/ayN/KaPXNzchJqHTv6yp1fhaDNNegVc8p8dCgcpc
	ooDYOS/RUiT909COHKaULUTmKxQdyTIbDtP1L29C+mLIlGz0/cw/GWzEjsP/xRDp4uGmofd8gKx
	+b7cxFKD1SVWyckZpicNhKgAHdb0EYGfY/+PcszXWcA//xxyQAj6rdsjINcC/EOgzlPoUY9JEF/
	V8/TNVIapVoAuQwgJHxVGC8BCWABw66/cGtqpvZJ0/EPmjegeAZ0oOCUovAKBo9Ah59RCM7c=
X-Received: by 2002:a05:6808:15a7:b0:4f4:4eef:52cc with SMTP id
 5614622812f47-5640de2513bmr12203189b6e.43.1793833417236; Wed, 04 Nov 2026
 15:03:37 -0800 (PST)
Received: from 41474967715 named unknown by gmailapi.google.com with HTTPREST;
 Wed, 4 Nov 2026 18:03:36 -0500
Received: from 41474967715 named unknown by gmailapi.google.com with HTTPREST;
 Wed, 4 Nov 2026 18:03:36 -0500
From: Kirtikumar Anandrao Ramchandani <kirtiar15502@gmail.com>
In-Reply-To: <20261105-kasync-devm-timer-1-kirtiar15502@gmail.com>
References: <20261105-kasync-devm-timer-1-kirtiar15502@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Date: Wed, 4 Nov 2026 18:03:36 -0500
X-Gm-Features: AclHuK8_mptZYAXia0N85GcfAK4F984qFw3tZGgYmiv7d0zdmwUYqklPkOQLZe0
Message-ID: <CADZg-m3OJAhUi8EzBeMQbcKKVTkBBN70mnkGmJzkj2t54xFxDQ@mail.gmail.com>
Subject: [PATCH 2/2] hwmon: pwm-fan: use managed timer shutdown
To: Hans de Goede <hansg@kernel.org>, Guenter Roeck <linux@roeck-us.net>
Cc: Matti Vaittinen <mazziesaccount@gmail.com>, linux-hwmon@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Replace the private devres timer cleanup action with
devm_timer_autoshutdown(). Keep initialization and action registration at
their existing positions, preserving the cleanup order. The system
shutdown path continues to call timer_shutdown_sync() directly.

Signed-off-by: Kirtikumar Anandrao Ramchandani <kirtiar15502@gmail.com>
---
 drivers/hwmon/pwm-fan.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/drivers/hwmon/pwm-fan.c b/drivers/hwmon/pwm-fan.c
index 9cabbe9f8..6b02c2687 100644
--- a/drivers/hwmon/pwm-fan.c
+++ b/drivers/hwmon/pwm-fan.c
@@ -8,6 +8,7 @@
  */

 #include <linux/delay.h>
+#include <linux/devm-helpers.h>
 #include <linux/hwmon.h>
 #include <linux/interrupt.h>
 #include <linux/module.h>
@@ -493,13 +494,6 @@ static void pwm_fan_cleanup(void *__ctx)
 	}
 }

-static void pwm_fan_timer_cleanup(void *__ctx)
-{
-	struct pwm_fan_ctx *ctx = __ctx;
-
-	timer_shutdown_sync(&ctx->rpm_timer);
-}
-
 static int pwm_fan_probe(struct platform_device *pdev)
 {
 	struct thermal_cooling_device *cdev;
@@ -650,7 +644,7 @@ static int pwm_fan_probe(struct platform_device *pdev)
 	}

 	if (ctx->tach_count > 0) {
-		ret = devm_add_action_or_reset(dev, pwm_fan_timer_cleanup, ctx);
+		ret = devm_timer_autoshutdown(dev, &ctx->rpm_timer);
 		if (ret)
 			return ret;

@@ -710,7 +704,7 @@ static void pwm_fan_shutdown(struct platform_device *pdev)
 {
 	struct pwm_fan_ctx *ctx = platform_get_drvdata(pdev);

-	pwm_fan_timer_cleanup(ctx);
+	timer_shutdown_sync(&ctx->rpm_timer);
 	pwm_fan_cleanup(ctx);
 }
