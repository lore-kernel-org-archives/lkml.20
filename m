Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2ED239C63E
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 21:13:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788210827; cv=none; b=MK+tCoCXkt9AkuxiF/rpKS/TY6AuuLwtJKew4jpFAWiVQQkWc1J5jNZV5UEgcnSEE1OOf6CHnt/n85sN2q3SsPYek/DnyTVtOPXG3g0n6Htrbfthjb3VPbS0zrveHcPjm17VNu/Gm3J8lPQ/HvpB4a019rIion3JgEOe6/HBczc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788210827; c=relaxed/simple;
	bh=7S3GqdGF0KlusnvtYvgxViEubrKHdp3YCun8jH+9hL0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PkHLG03f2NJoIOrCKbuTzqxdKZIJDFqij5UWd/Ka8DMkHrCUR6y/vdvpHR7X3N2PjlCTv7b/SOe+3ev1z51BHDTaNZwx19KY+PesIWO5LgUeeNhcn6D4FLWhF8aIz+X8Pp3g/KCTNBCq5U9CpaXxuVR92GjgyHPV/dgFQGEqEyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=epWe26SL; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="epWe26SL"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-49b8687630fso29151265e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 14:13:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788210823; x=1788815623; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+t41cBcC7m4gJOioG8shHYMVAqAc5cSMhVD3K6KstMQ=;
        b=epWe26SLn94WvOEHxMmmANZ++KOsoZX3BUAe9jwL3N/nqEkXmq7s48giZ+p95dlb6w
         q6F96jygrAQ0D4Ax9V5Oz0xs2yl3aJWvF/PektCXLZpsky9rBWEhwFm0tMIygpO30jps
         wMjAcBv/iHJAWNFZcmxiWgkXcZ/gWu1h7z4r9Rz6S30gt7b617N+jhcpHvIB0vqg+MA0
         URV+dzCbb4AWmRGlt3tdFHKNaFJ/+lTbAf2GOjzjzEzAdqa9DCA9IZph6CMUFrvc33ZO
         tDmozIXqYT4xhc/VtHx++7Pg5j8S/IgMz0hmRc0AWm4V5M5xQa1AEDyQyjDK9oKZSW+c
         Rvmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788210823; x=1788815623;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+t41cBcC7m4gJOioG8shHYMVAqAc5cSMhVD3K6KstMQ=;
        b=XXEV5jw2Emb+aGZgRZPUAdS0syG8rDSQPib67vrM9Gnm2XnFt3OJEmCj60astmG52/
         8HMdeK7SqjhItDC6O8uJFPfcNtvMq7h8cZAF/U2Wl7L9ZInI/KIRzxYG2hSn0U31mIJG
         016/KfYh66z1SeRkn9VlviTSRQv6GSTRJ7C83bPc6qZCkKifYiAJE4hc6QCkuoujFOxe
         uMDwK9voUVi3vUILTP0uXXGQLvBFpz6p4k/m0GcJTkQ//QWanxvJwUKlFQWwybHkR7Hp
         kW/QgRv7MG24LuR2xhBoFWw+S/GJcFFIzGAuvseb78X9fhfF/uURuOV+855e94BRYJAb
         HNNA==
X-Forwarded-Encrypted: i=1; AHgh+RoLq08r36Y8wAUtWuCCwj0U9+Sb37QW40ol4RRzOgwRh446/Rw3NyQl/KvoqJJPZbKhUlZbqFfViWDvDDQ=@vger.kernel.org
X-Gm-Message-State: AFuF++l78boBn09Y4efaxej2qUN7PQ7kTXDkB4SuOB4vYC0ZTTqmV1/v
	WnVi1mY8BEpTbsj5rZ/6B6KvYBbZ7+t14US4y8E0p2v+NJ7JzZVou3C8
X-Gm-Gg: AR+sD13ZVU1xAHgQcAucechuXmqoYMCzPJEwAJjaeDbHzwrNLnepxofTDmPoQ505kjl
	tpa2p6+Mdekvyg9PqLQWlrKaCW23DVql7FExKKBcRd848BehiQbdg/4fVTElTs1eXLe2x1RRwzJ
	ystrlpfYRV8L0Mi2c5vxW2JfTwji4SZqceqgZQtV3PFxfc6FX8+Ea6o1Jeo8MgmtfK7kiyGMm4o
	cp7cVuCg8Q/ZWknG8ZzCrgM+kwyFE03UylTAhgwpKgoDUusCmE3SvgUB+JGZIvjxnOqflyUP0vs
	3fihEQAFOkVqC9MKJ073LigceGywtPVsB/AY6FNAaHKIp+SM7sE5C86fypCtUCEBRQIwNVBJH78
	gwydGVlES9QCYfT+uO22vHnJTaZ0TIZPE4OI879Uo+xdyreZSeuUWjrtTEg1gDkK8XSBA8LSH+4
	0BxdmawntYK14dTWeCb7V6LtYkE5omiHg6edKvzb5uK4jtJR7zQuDLtJ9Z9kRP034H50RjSWksP
	ey7Vrg3BBtQnJ64zcwaS1k8rLxBqUmgXTsi/6ZDL2tHqjUdlvrt+idFiUC0yPPALsZYPedTtQkz
	eju+knoD8VzsL2asHKCq/pO6AKQi35y1hVoLYO5knTsXSzv+aQ3pALcGx10uSODPltjOU/Q32hA
	Vp4kHXimwdNlI8IYCeR8JcC5h
X-Received: by 2002:a05:600c:870e:b0:495:6e68:5df2 with SMTP id 5b1f17b1804b1-49cdc43f461mr74399055e9.12.1788210822685;
        Mon, 31 Aug 2026 14:13:42 -0700 (PDT)
Received: from [192.168.1.187] ([2a02:8308:4092:11f0::f9f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cdce1754csm17695925e9.10.2026.08.31.14.13.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 14:13:42 -0700 (PDT)
From: Joshua Crofts <joshua.crofts1@gmail.com>
Date: Mon, 31 Aug 2026 23:13:34 +0200
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
Message-Id: <20260831-kernel-header-removal-v2-4-b92b580ef5eb@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788210818; l=1745;
 i=joshua.crofts1@gmail.com; s=20260530; h=from:subject:message-id;
 bh=7S3GqdGF0KlusnvtYvgxViEubrKHdp3YCun8jH+9hL0=;
 b=kbASjicAqc7v5dkMxgLjn5XPiAx/VzNB27l99Q4B81dXw0B5iTU+YCxRuJnG0WmDp/wwQ/zKZ
 BbtQhwjUPuhAsrY4Rf9uZUz1zV/wdYE1gb+SCWcgwYQXmc4veev+847
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

