Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F3B53B27C7
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 16:26:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788020771; cv=none; b=OhUIa0cg1A7/xMRX8zwJarPvx8/wcfI6kK6/pyvELzGABOSieZG78BcTnqWr5l9CPEn+xd2yFNvbztvaCKF8g68/s4klp++Fc6Lf6UMTyVNm5T2Ti7k3x+BMYPmeoqAuGXf+otE+XU3mTySVBCQ/x5s2ZKDmIzi8xxGbSYIXWFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788020771; c=relaxed/simple;
	bh=7S3GqdGF0KlusnvtYvgxViEubrKHdp3YCun8jH+9hL0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cNHSDq1l0AIYzuXqHNRNHJfUBpU824f345vk6jnPfyOZYiu6j1MGCARoe5YZvxCijM/0uLowi5UmIzFko0q8d2wH2+fbZvIhdGcf+JlA7Hf2UdJe2A0Xh+vmNV6WZgcC4tSeXDkZgzLwjjAkKKKBEhi0gm17f5HCO5Fxl67dkY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jkrQDhAh; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jkrQDhAh"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-49b0dbfbf7bso13596905e9.2
        for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 09:26:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788020768; x=1788625568; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+t41cBcC7m4gJOioG8shHYMVAqAc5cSMhVD3K6KstMQ=;
        b=jkrQDhAhmUEIAUaFET6Pl8VT996Z599pMl1oQfs8JBqzRQ99cVrGdCypLabyAjaahC
         qtHNjTcP526n763Mno9QWdRH6T83gG8FWmemKIhnSJWpZMUM43oQdWE7vE5cdVeW5mht
         mcWIY+/TRcLTVEvKjpQiGn7hQkrozzXWmJ0dK4j+bgZi4RTRnMBNt8dpsr1WBRumfbTt
         6RWOhwtu6tInVztl/GeW3BKKgrGlEO88qj3colhHpS8nDeNKI1DogGbeXTtTtFfwh+h5
         Q3TsVKfzfQ4+XIZYA4kpPHZ5m9FKmo+GXc3Ha+aL0VZbEldgYF41MWwel9pDJsiW/nl0
         HQGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788020768; x=1788625568;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+t41cBcC7m4gJOioG8shHYMVAqAc5cSMhVD3K6KstMQ=;
        b=ktGeUd2xs0IvqmTS9V5Hitq5jredfMPzDo0n4TG/gBdPoHIedAT1W9/rH4KFSgHR3x
         Xp3qbgveZ7QhtyuduRZwoPRicjXiDfsv2N6pHDBvd3xM59spfzgJMu+w8QbnT8zkNgFY
         5ezNMVwo8uSSP/Sw9mn8a1Y+GD6DxbPF92PCu2+9x+N8IDc8bCZ9jJI7OYUSpl2fN2KF
         XB7fNh8AZC7f/ygSF0oDuxNWf7BuoZq4jfIvcNM2zfT5ZLPY7iswX5/qhW89MvXJjZp0
         fzHoxIrKvTvvz1K4FMMoC8NBrGIeqhQobT+WNv+xYpkdIgiuYRv3tRU9BupnHs3Thq3J
         T2EQ==
X-Forwarded-Encrypted: i=1; AHgh+RpYb11SqUD8/G3dY8DreCzxcWROH3mrv+AewbIW5nUkdEY+osqjg4nwlYgeTRWQW0lK0kyF30baJIywQj4=@vger.kernel.org
X-Gm-Message-State: AFuF++kinSi3MbXEDeAobyoXpvJD3xM+R0o8F6lHnH2u3jHNuKpoejMi
	Cud8aTqMi9SXUKaJdRHyQa/r6veVRyjYavip7t92y6a2xSsF/Y6S/VxW
X-Gm-Gg: AR+sD1391bd7RrDuA7cK3/PwASWVwOP9LYPYaKYgUh05XLIEDo1ocbq+AUaZp21eqzs
	uzIv06KQMneEUUu7UIL2tTw307Y1IadYZJ4NALXFRj7YqG3P+VTHIIumGlhdugXBELJQsrnUGAs
	0ogFSVqWpFYbnLx/FPeVwZvpvhcj1ilAdAY94hNfBJKfHvzgcgb+XNiTjPQnvqzaVxXFIvvvZdQ
	dV+9a72j7ABRxL5TpwTm8vxuKRsjjIXT4HtfOoF9hSGWioC5uhcUsFQMLkpEFFFYw6OamESxEUk
	WCBfFUZaCy8uyk3xkuTnmzLmDj28lTHQcW2LDJVSw4GBW9MODH26Rzv39yPWthDL3PXj8CALdK/
	hIxMNCMSWwidK95zBi3RGpt8BrDRjKR4hRIweNukHLr7y2jQcjMwoPp/X99/tAYeHoMR0kPhMbJ
	JgZMxXg8+P2LnrxAjyxGXdgmB/oNLUEaOHcCSkPrm6lpj2wdMIUJckqS6lOudIcVXVZ4rjuxEh1
	ItG7Urobqg9erD6Xmvr7zft2x4y41IntnGbQmDdjbAuQbG50Sm2oX07zubGhUDD4DFxaRPH8aly
	azo92EVhPmkKK/qyp9MgO+qqDq4rfxXuvgbw/MwfuGYo61kIIdiaqEYPm6XEnPuQe0k4C91L0Gr
	z40szqON0yX+sbdoXTgNOs+D3
X-Received: by 2002:a05:600c:1f8f:b0:499:b65d:1250 with SMTP id 5b1f17b1804b1-49b91c1fc4bmr177702185e9.2.1788020768097;
        Sat, 29 Aug 2026 09:26:08 -0700 (PDT)
Received: from [192.168.1.187] ([2a02:8308:4092:11f0::f9f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b92679be5sm137861705e9.3.2026.08.29.09.26.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Aug 2026 09:26:07 -0700 (PDT)
From: Joshua Crofts <joshua.crofts1@gmail.com>
Date: Sat, 29 Aug 2026 18:26:01 +0200
Subject: [PATCH v2 04/11] iio: temperature: mlx90632: make headers conform
 to IWYU
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260829-kernel-header-removal-v2-4-c67739d5dedf@gmail.com>
References: <20260829-kernel-header-removal-v2-0-c67739d5dedf@gmail.com>
In-Reply-To: <20260829-kernel-header-removal-v2-0-c67739d5dedf@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Crt Mori <cmo@melexis.com>, 
 Puranjay Mohan <puranjay@kernel.org>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Joshua Crofts <joshua.crofts1@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788020764; l=1745;
 i=joshua.crofts1@gmail.com; s=20260530; h=from:subject:message-id;
 bh=7S3GqdGF0KlusnvtYvgxViEubrKHdp3YCun8jH+9hL0=;
 b=1gd5+xvYPpWBVPhjQtGMdjxLzJjveSdKRKWt1kEmq4IKWg8eh856PR+n+j1umVvM5uFoEByfH
 pKe7pCidqPyCBQvIKp46kFSET8DZ9sRn9fsC8QmXXbsIOMtRk5rYgK7
X-Developer-Key: i=joshua.crofts1@gmail.com; a=ed25519;
 pk=RTDOoVwgeL4oFdASj9U+cxJuIjXuXk73zkjnGOJKbEo=

Remove the catch-all kernel.h header and add the missing headers to
enforce IWYU.

Additionally, sort the entries alphabetically.

Signed-off-by: Joshua Crofts <joshua.crofts1@gmail.com>
---
Header changes explained:
Added:
- <linux/array_size.h>: for ARRAY_SIZE()
- <linux/bits.h>: for GENMASK() and BIT() macros
- <linux/dev_printk.h>: for dev_err(), dev_info(), etc.
- <linux/mutex.h>: for struct mutex and mutex_lock/unlock
- <linux/types.h>: for fixed-width integer types (u8, u16, etc.)
Removed:
- <linux/gpio/consumer.h>: not directly used in this driver
- <linux/kernel.h>: catch-all header no longer needed
---
 drivers/iio/temperature/mlx90632.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/iio/temperature/mlx90632.c b/drivers/iio/temperature/mlx90632.c
index 2fde48f337e2..74ae36f74e8b 100644
--- a/drivers/iio/temperature/mlx90632.c
+++ b/drivers/iio/temperature/mlx90632.c
@@ -6,21 +6,25 @@
  *
  * Driver for the Melexis MLX90632 I2C 16-bit IR thermopile sensor
  */
+
+#include <linux/array_size.h>
 #include <linux/bitfield.h>
+#include <linux/bits.h>
 #include <linux/delay.h>
+#include <linux/dev_printk.h>
 #include <linux/device.h>
 #include <linux/err.h>
-#include <linux/gpio/consumer.h>
 #include <linux/i2c.h>
 #include <linux/iopoll.h>
 #include <linux/jiffies.h>
-#include <linux/kernel.h>
 #include <linux/limits.h>
-#include <linux/module.h>
 #include <linux/math64.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
 #include <linux/pm_runtime.h>
 #include <linux/regmap.h>
 #include <linux/regulator/consumer.h>
+#include <linux/types.h>
 
 #include <linux/iio/iio.h>
 #include <linux/iio/sysfs.h>

-- 
2.55.0

