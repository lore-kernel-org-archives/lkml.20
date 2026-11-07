Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794035936;
	b=DNzp73Eoh35rEW+3ks4X9CASI1MrKAIwiyB8e5m4AgjYOh6ptQjsKL/jGRnN8iLzV9wz
	 l8pIUAQQ2PoGSBVwom7K/1J5NaU3mxfQPdJUIatLV1zBF89dig2xLl812TTyB44Q4LGTr
	 7cXJP/itBIc4Tj+0XkAJBBZjTXCrlr5Jx+B3S1HqOyKfT25moOqYKVHMbCBUldx+/OkA0
	 HPxsNE+ptpCpUch9i4nqAhTjsw/VAxZbIu74QDZGA9/5sl4hWPZfpHFEDdnwBIbETYT/a
	 ugb9Xd8x6pzA7DqMYzV2gutAdDcVO4h6KTkqdPk377GnqnbmsepT9VoDmUzp8fX8FAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794035936;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=e2RBvV6ZC2qSudUbd18r2yO6oRHwMggBhLaocYC4YVg=;
	b=CNBK0+ElMaZ13qztxsxouecWTmBZD0ged+Yzf4HyUy8OGvITnOkU9wxDwd7nGGoHqDcc
	 MOnnMRpq4mMcJTaHiZmK1EgpFzSummj/SXbncPZJCOww8CNqCBAbHf+7f52k+4ORPzc60
	 1nsHy73b70tDJOrOTkcfJqi9acdZPDdaL3snR45/K/VWVgppmPXzrCNsYtqQzPm32V+XI
	 s/Ttg/QRTz6MKLu6RkCtT6l5iFtSs/7QhtFb0GAzFe0CENUpbnX2rsHS0Kd/Chsh1pQBn
	 8w7KpvWKbACIUZsM5OoVQNnSokhsJYvB4pezLRnOMwTgQszU4RLz4UHiiARBeSRrQEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=H75OZMkX;
	arc=none smtp.remote-ip=209.85.210.169
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06660606A326
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 07:18:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 06660606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=H75OZMkX
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-8a594d313a3so759686b3a.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 23:18:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794035935; x=1794640735; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=e2RBvV6ZC2qSudUbd18r2yO6oRHwMggBhLaocYC4YVg=;
        b=H75OZMkXSjam0NOi3FZTiMVbVJF2RYmjV9H0u/a4VttNJxAm5Sx5cn//1UR34WbQbI
         Fk0vCUFMXQ+zZcuOW1sSveqJXFgZcGZ3yZAHTMsbroZ3o3MmkNF1LIJMVA3HX4EFqNgR
         exgw9WPmdb1u58gPSC9A5Q66r+U+Uwz2fVU4tuWPJPtpTpvhaJ4AkL4LfNy1fNraTg18
         vEzDRDc4CxJKXdDqwJ9Y4Od4HJvsyN9Ys0do8JWY1hXQXWW6USlEs7auSegDvFjzGGJ7
         1FBbKGFbOpt+cIMypYL5W0OMGUfakv5YoYFj6BUS6i6gxHTOhO0Q4rLkyxSyA9jl6rGg
         IXww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794035935; x=1794640735;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=e2RBvV6ZC2qSudUbd18r2yO6oRHwMggBhLaocYC4YVg=;
        b=Drm5YGCBukbdKzajflxQ9fUxzwN5FKTHfLmQ6MvlEAlOad+Mtq9NJYW/pk/AOp2LZ2
         lqrlvzJlua67/y2NA5+SJ6pEQOwx0K2K63zWsdhSi9SJ984LaJDzLAIWOlopJb3G7ej1
         /hr+sULbVj5R409lB2Y/jqQvsFNxb7pehOZgGfRlvUJ4q47/zviuqyT+yVYw21NE8lFB
         nbNcE9g+1eP40lAcS7tj3xWf/dY8AitA5O3Une3vC8OcrBpxXO1fo8TrfJwQlvwShm5l
         PtaE6qtY5fpTNXO/lLdN7VUy7cHU5eaVYWzzYn1ucrQ9ACupfNpy6z6Uk/Ykv0MTflLm
         TUkw==
X-Gm-Message-State: APuU4Z+3UQDAM57TOFUy2vdVjuBVobKJX/MiK3yLIOMc/UUnuF1PaJLW
	E3blGwB1qwJ3BWfALSdlf6PCqv/hPXdGPBk3pGvc24F+bThu15doyO6b
X-Gm-Gg: AYBFou37omDmeo12bl0q21QjKawBj430RITlBtj3eFo2/DJ+TIIwBfkq1bXhUlSoLbr
	KlmP1VZvyIqintRXV2Rit2NSBixpQdmXo2i+LD+DkO5k1QN0B32TQj+YnhVCqtOxsQh1hq8ppfw
	JBFpFdY44Rzko/77W1syewEwhFxoV0/uOgJeLzCnYB4sotHOidReQSTQgWUlhrw/y9xkHPhjO3L
	oICmxICZ3jxVxqnZ/emReZj70zYqYepGdVjqaAtBHKgbevhi7baGrBYY42DLJA7JJdgEaaGrNKF
	56rtgoO+Pia1yUtnbz1MZPIDsNTVPwegjydgITHZHAkYKwhO5CkQ5maXvw0UBXiKUzUqiLF7MCZ
	tvQ6nDdKiVaZmjk1hGrcOw5RvUxc3NvHP0Xsqw9r0k9sSazToYNlDVGlLUY+CHyADFZF+Nx+NMn
	EVj7ESQOWZw4vyEEQVjrgC5VJxZVafryKeJhk21ztqsyNxxai5DFCm1NlhR0zj9wHlTE+c2fgWr
	EHIxuzs9T6/XQWgvvenYlVIPjSfZ+PrQXqq2By1+2hZNQ3w6kJvqZYqviimwUpUPHI+U6MNLda5
	Zs3kLdUrylgy0u71tLUFrL5zErwup1upFXkJH4MUC0OBbmcCRI82iunLyiJbbHovrzxIsQ==
X-Received: by 2002:a05:6a00:b82:b0:89f:450d:90f5 with SMTP id d2e1a72fcca58-8b37aca2e17mr4908542b3a.11.1794035935229;
        Fri, 06 Nov 2026 23:18:55 -0800 (PST)
Received: from hj.. ([163.239.22.29])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8b356c287a8sm1234364b3a.3.2026.11.06.23.18.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 23:18:53 -0800 (PST)
From: hyunjungg <hj351016@gmail.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	linux-input@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Hyunjung Ko <hj351016@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] Input: lm8323 - cancel PWM works on unbind to avoid use-after-free
Date: Sat,  7 Nov 2026 16:18:42 +0900
Message-ID: <20261107071843.3427985-1-hj351016@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Hyunjung Ko <hj351016@gmail.com>

lm8323 registers LM8323_NUM_PWMS PWM works (lm8323_pwm_work) and
schedules them from the threaded IRQ handler, when a PWM ramp script
completes, and from the LED brightness_set callback. The handler
dereferences the containing struct lm8323_pwm and its ->chip, i.e. the
struct lm8323_chip.

The driver is fully device-managed and has no remove callback, and
nothing ever cancels these works. struct lm8323_chip is allocated with
devm_kzalloc(), so on unbind devres frees it once probe's resources are
released. A PWM ramp completion interrupt arriving while a fade is in
progress schedules pwm->work; free_irq() stops further interrupts but
does not cancel an already queued work, and led_classdev_unregister()
only flushes the LED core's own work, not this driver-private one. The
queued work can therefore run after the lm8323_chip has been freed,
dereferencing freed memory (use-after-free).

Register the works with devm_work_autocancel() instead of INIT_WORK().
It is registered in init_pwm(), before devm_request_threaded_irq(), so
on unwind devres runs free_irq() first, after which no new work can be
scheduled, and then cancels each work while the lm8323_chip is still
valid. The handler does not re-queue itself, the re-arming comes from
the interrupt, so a single cancel drains it.

Found by static analysis and code review; not runtime-reproduced (needs
LM8323 keypad/PWM hardware with a fade in progress racing device unbind).

Fixes: a48b2d4a0091 ("Input: introduce lm8323 keypad driver")
Cc: stable@vger.kernel.org
Signed-off-by: Hyunjung Ko <hj351016@gmail.com>
---
 drivers/input/keyboard/lm8323.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/input/keyboard/lm8323.c b/drivers/input/keyboard/lm8323.c
index 8eac63b..388b790 100644
--- a/drivers/input/keyboard/lm8323.c
+++ b/drivers/input/keyboard/lm8323.c
@@ -16,6 +16,7 @@
 #include <linux/sched.h>
 #include <linux/mutex.h>
 #include <linux/delay.h>
+#include <linux/devm-helpers.h>
 #include <linux/input.h>
 #include <linux/leds.h>
 #include <linux/platform_data/lm8323.h>
@@ -564,7 +565,9 @@ static int init_pwm(struct lm8323_chip *lm, int id, struct device *dev,
 	pwm->desired_brightness = 0;
 	pwm->running = false;
 	pwm->enabled = false;
-	INIT_WORK(&pwm->work, lm8323_pwm_work);
+	err = devm_work_autocancel(dev, &pwm->work, lm8323_pwm_work);
+	if (err)
+		return err;
 	mutex_init(&pwm->lock);
 	pwm->chip = lm;
 
-- 
2.43.0

