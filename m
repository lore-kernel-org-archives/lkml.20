Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 765C43A7597
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 21:13:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788210831; cv=none; b=K92WXGWkPz+JMG4nbDTK4dZpHuiN9D2qbJaBuguHkewATDnDPsi/Jg+k74LSUoT78Dr9Xpgv51AtYanY6/VvDk+23HVvEQG/cxbf3e/cUOJaw0cm6099JuY+NORb4xoBw7to0skKfftF1o8zeMRNaUlJ8qOIIJvl1bgvp4kJIYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788210831; c=relaxed/simple;
	bh=lZ538xn0MusE4k1KK9y0lCXK70e6dTvhVB099UUkj2Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PnYrU6vmlA8ekrmcF52+JYYM74fL/oalO5pbnC2nLLDY0QC/AdKDfS+iVGBEO1Kovc+9/zxq4flrbR0oWNct4qnJwtnwx5MmjYuOAQxXR6l2VYaLqzjCxYGkS/KlK53Dsu8g+YL0NkBfJnWuuSIIPCvqBIi7O5CYrQPg9vbBmwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XTAhUKCC; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XTAhUKCC"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-49b8eeb3ff2so29603345e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 14:13:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788210827; x=1788815627; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6IX/mr1AWyIWzkY9+da9P64x4UyMMvD+KxSqNh+tYjc=;
        b=XTAhUKCC/EYWkfD8MqN5GlowiUynxb2uJFcX5tuAt/LjAyId+zRs2z4Az1mefse5No
         sPCUYFzQgbFLjz7E6Vai/6KD2YQNFuYfJxoapOuvKLnan7AoFXsoxvWk82AVT4HFxQeG
         FugTFRkCpU8IEUsvWu2+s8POgy/8XBaMz2/uwiJqWtua3RWJh8d8Qfr3Wd4JaWVNEYTy
         Cf0fcXuZEqo/t+nNZibajL7K5ZtEgU7whakaZo0kVzWbDXKDI07ZYUMiX5DEgHb6OWV5
         IbCiALQdMq6y24v/cihak/wKTldy4iFOwLgIh6uqWpA1CogNhzeS3JMueuGj/P+BFGfV
         4r5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788210827; x=1788815627;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6IX/mr1AWyIWzkY9+da9P64x4UyMMvD+KxSqNh+tYjc=;
        b=oNLqL62tTnhpZL6c+HYEGhB1FlVLNfBKrXCEJ75LwLY4e3ISA0e1A50472D98vqMMU
         ef4txgM01272LmnuTDbVwMJxEfyYQswjUMZ6MTRbuQEZ5vD/r7SdmGxG8UcR9/heKiOG
         65wXyR4CIoJqi7nmAj4UIAE02kssewNOLAOlCpIjrhDPaHsFlqkvAVyawCVUzZ9OkVVn
         bh80vFxNtp0hy7SN6m04mfXn3A6H+Z9yn8lUCbhtuoZdws8QKwLu1fNkuxLfEVr563ec
         voMIb9tfP6x6KzoiL+mjr1uZSagtN8l2UnscC/bdcX1Y/nSk3E2BcwwiYvxF/6y5IfU1
         ygAA==
X-Forwarded-Encrypted: i=1; AHgh+RpKSTvi9RPQs6q21fLBDEhLUY2wNf8G3vqXldGoRHh38BICGBriZXUNjNzHoDCavxCYzL8CiLi/UEFZ4U0=@vger.kernel.org
X-Gm-Message-State: AFuF++kC9xsoiCazKayFk5+CEJl9cPXS9eLTJZesBRfmPNlPZzXwW3ht
	xffRGxt1pZYKdKTbfttMyRZ0g9SSjZQ0GdHk4DJ7NC+w9/wVYW5QC42r
X-Gm-Gg: AR+sD11nKk/LkenU8bjMoM2OBwcBcqXKNl7wctgCZJtUyuEgK6so4FWc3ejWaIffOni
	HWVWaKkF7xiozlsRTruuBDMAo8Vn7BjBUS7i7tl6mtxL8PCgI/8ZSuse6jeYBZzT2eTxm+Fe5JW
	I+Asgv5hitzD8d1q/rP0iJ9J4Nzo9XNhGiJYJuTf5FpoCIZcln9UR8ku2C/fXOiQl9grBVVXFQF
	z7miKYSlp4UCpUKxaHrcyKjnQXFcCbBa7axMtoG2MaEKLNJYSJ0Orp3dQCiWORzLOls9CctzjcR
	6LD9jpRYh1A1avvveHa3shjxv40yOpYhMW++mPx1a9xv0rOt9401IcynbVPXVLmTWA8JAVOzEiB
	bfFuZahe87OlmTPnseKxqcmEgBOKfnrxflfjcwkzS7vRskTOQzMP1OUslDLHOmETVmrqIMzEilJ
	KIp8GEHFJtl1QoZbMOf9HWuvySM1DAnSQrEtEsCKpPcgi6k3U+4mXotrlRbvAx1EB98GldWmqSo
	mFWShL8MUch9RQVj8ykxBOkivJAln8kMd+Qu09l/C9S6dmSvfe9Fb3F8YDh6mWj8cvHD3zvhMul
	qMZsYVfaGmlOwpYSOtwJBMORZBAFyKOHYbxC7N6RP9WWX6VUZpLUALfDNYzN0qukz3B8LfjgAd+
	CKh5se2QpeOYoxCYf3TnN9QGJgL9hsc/ebp4=
X-Received: by 2002:a05:600c:6b08:b0:498:952:e276 with SMTP id 5b1f17b1804b1-49cdc41f98fmr43629265e9.8.1788210827444;
        Mon, 31 Aug 2026 14:13:47 -0700 (PDT)
Received: from [192.168.1.187] ([2a02:8308:4092:11f0::f9f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cdce1754csm17695925e9.10.2026.08.31.14.13.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 14:13:47 -0700 (PDT)
From: Joshua Crofts <joshua.crofts1@gmail.com>
Date: Mon, 31 Aug 2026 23:13:35 +0200
Subject: [PATCH v2 05/11] iio: temperature: mlx90635: make headers conform
 to IWYU
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260831-kernel-header-removal-v2-5-b92b580ef5eb@gmail.com>
References: <20260831-kernel-header-removal-v2-0-b92b580ef5eb@gmail.com>
In-Reply-To: <20260831-kernel-header-removal-v2-0-b92b580ef5eb@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Crt Mori <cmo@melexis.com>, 
 Puranjay Mohan <puranjay@kernel.org>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Joshua Crofts <joshua.crofts1@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788210819; l=1772;
 i=joshua.crofts1@gmail.com; s=20260530; h=from:subject:message-id;
 bh=lZ538xn0MusE4k1KK9y0lCXK70e6dTvhVB099UUkj2Q=;
 b=cL16eD7hISahdpDpT/3iplXwrj/oBC+wB6qNOq2/ysGw4eR3kkXUloag00nNErl7wU43w+Wc7
 dAd+BljEq5KDz/3FojdQLOHnWz+S332CK/PWLltq4IpMS2wOwl0On8C
X-Developer-Key: i=joshua.crofts1@gmail.com; a=ed25519;
 pk=RTDOoVwgeL4oFdASj9U+cxJuIjXuXk73zkjnGOJKbEo=

Remove the catch-all kernel.h header and add the missing headers to
enforce IWYU.

Additionally, sort the headers alphabetically.

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
- <linux/limits.h>: not directly used in this driver
---
 drivers/iio/temperature/mlx90635.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/iio/temperature/mlx90635.c b/drivers/iio/temperature/mlx90635.c
index 0f31879a4f64..48c760c980f3 100644
--- a/drivers/iio/temperature/mlx90635.c
+++ b/drivers/iio/temperature/mlx90635.c
@@ -6,21 +6,24 @@
  *
  * Driver for the Melexis MLX90635 I2C 16-bit IR thermopile sensor
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
-#include <linux/limits.h>
-#include <linux/module.h>
 #include <linux/math64.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
 #include <linux/pm_runtime.h>
 #include <linux/regmap.h>
 #include <linux/regulator/consumer.h>
+#include <linux/types.h>
 
 #include <linux/iio/iio.h>
 

-- 
2.55.0

