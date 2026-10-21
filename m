Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792609342;
	b=lLlyTqLhWNWjWdTUSzfAaxH2DLUxrKHvi+r+CtyPDl5mIsrtldovwGLtkhw4HWC/lFQa
	 r/eIpbPfWiC8+eBGSCrsNsxPt7ByD20nFIlHujhZjjGyn8x6wiQwOI161pHK2D5HkoP24
	 DywJe3jWvi/yP8eC1FHDvGtWbv1qIaqSFNMCGH6n3kjTTk/Gh+p421xMyuU3GvAIGmXvD
	 okC6Dh5KdaE+joYjq9HaAbl++9su6msGof/kHK5KqJIywmoFnbM9f3HE2/UeN8WGzc/Ze
	 K4rxKrCH49uf3tyoN5+U6+jilkZieoXM8p2IcUc8/wO+eEuS+llIyNWZGYstCm7zFVA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792609342;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=RkMBOzHZaqfkrvZVoORPFrG7aLfMnVNocm8UgOzB2rE=;
	b=wRssj6CFvER0iQ1QWr7ve0mwDnfJEPAgcg4Zgstld/h7eIhGgmhRMqY/IS4bg+vFc5Nt
	 F3LRgHWRX8RtdMIHR8aqgifHmBZO7vyrBPSZIrB1WGobTmeJf4IgMvW9+g8osSeWb5RLm
	 lHKYoaKtWPIl7QoicbG9V+rbOvn1KAGfK87yukYOTHdTZvi/rRWt0y5EXlAMmP5vGnZ32
	 /R7iPBpxvDSV+J9ZEnSKsX++pkddODnNGDd07aiZVvFfO+chYjUMabl7b1DKR2FOhqpKZ
	 Mb8qoS5nQCNRZLCULm1nfNQITXZOeJU9tutrt4gmKgUAlRVDW+dmry8yY4YPeTDqS0A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=CMNNZ2uN;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D68F0606A324
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 19:02:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D68F0606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=CMNNZ2uN
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-35f036b17easo906786eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 12:02:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792609341; x=1793214141; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RkMBOzHZaqfkrvZVoORPFrG7aLfMnVNocm8UgOzB2rE=;
        b=CMNNZ2uNtC+Gcc4n0JALRHHUVZD3P89j9YksfcLSjctQ1+nP6KuYPhv//xRv7dZ315
         RcMF8R7fy/dwk+5lA6PxfKai/tYq9L46uG9LME/VE34TEvt8r5iijZ2HZwd6oqqg8Vag
         kAvTzStbeZn0Cx1DxBCv0dFgJEXkZf7OUw/ctU4RT/rT/4DU7jYO4s0vrM22FFS0umm8
         Fi55Ba8yPAe5d5dsZiAX5EN7HQTo5NW0XlZA4oXs6syD92B9+6n8sGw50fA1Q7DEmX91
         ozQ8jXXaMXzfJNzLclC5EdeImvaiFqk2GJTsf640baUhtd4iu7J9DN9zNkw9K++hZpyA
         8KnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792609341; x=1793214141;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RkMBOzHZaqfkrvZVoORPFrG7aLfMnVNocm8UgOzB2rE=;
        b=wKp8jdhk4UxVgyZGZ++j0p/c2//28B7uahgw12B3qKkBChZFWyYmRjvVWj/TTo4zxx
         pKG6LQ5Xly0DTQBKJEUnGb8XuUFcqbF8szGHRb3Pr5iAgPxxEQi3reWabd2B5CITiwBt
         g+mPf3pz/Lp8HZuVy3+ZL9th9wKeQ4aGdb0NxeuNM+yELivWZA2jHD4a6nYUW6XfI6iQ
         GI9XWhr7pdPtTEecYyYbiwxLl/lSM2RTct6/ILCSzgMKF7Xs3etodsPMifA5BlBvO57b
         yuK1toF5MOe865PZYV6cgF+z2eH/QjVCU6ORVOjo5Tq/bXvUiLMDlspjX92LKC02OAVq
         pwUg==
X-Forwarded-Encrypted: i=1; AKwUvBwxG/4fHZ2UW/SCDGLFDy6TxqAzHee3jfg6dNUvSJLOQHNbGFJ37b/Nuox3ZgO51zEg7pIXPKitxlU5KEw=@vger.kernel.org
X-Gm-Message-State: AFq9FYJBpRoXWeCn08261pokmMm/fXeNf3l0pWeh755uNASFTnglaMVF
	EApYzT5u9/eOumbotEXAHZpngSwDvmJLK+Qhc7vCkCBDImzC6SZY8r3M
X-Gm-Gg: AYBFou0fOOaSHzmcQxsPu3YWJq1I33h4v/nMrqOKbZQH/k0+Ux+ofaaiEFN2dI8Uqze
	vslG9CnE9wp53xYEcm2j8orW5Z1WK62KXMO8fWIgJr47Y+yiIFdiwOQKYA5RN5OopMiO/1a6cLu
	f2rClRTgsKiMCcinMCyO+TubdDbztP4vlodujMyTtJTsWhNQS33jZLzTy3dT/VaBXjTmpL+9Ake
	qJrdobpo4kpNeT3Jszez449LxnOUT3mxI8Os4OHlUkwhmvnEihZPQg07Z5MzEgPX9b+VIcVjE/2
	yyX0rmrQHmyJE7hp+pCcKmm8mFxqzRgvoNEVdLSzE+szLR5Z+blIFOHDsG4B7HYQKw5H+NOj1mR
	vQb3QDhxApWlDPPd+VuU7AV7FFzAy834D8AIFQR90X7myvwIGE6+IJWyvY7ZZ1U94TcCS4WCPee
	HA/tZq6JvSLwXasohbixP3n0BRvjiPT4ojZQzkz+wEZ7AG4txw+wiNpODodgFiqdJSeXFcSe/5x
	nYvqnan7KoYnNP4/8hpVme7MctTzzGp4mxoTCcY0nUcPV+zW+hjhb3M/i+m3io2IPOZlKk01NhD
	kIA4obETjtewA7f1gBQxdjYbj4827e+AQdeL/sCsrmfOQiOnpHm4OQltJid8+My/bQ==
X-Received: by 2002:a05:7300:b099:b0:367:414a:c8db with SMTP id 5a478bee46e88-3674eb303a7mr4103709eec.14.1792609340730;
        Wed, 21 Oct 2026 12:02:20 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:1761:399a:3c8c:31ba])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3673e153519sm9500604eec.3.2026.10.21.12.02.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 12:02:19 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: Andy Shevchenko <andy@kernel.org>,
	Janusz Krzysztofik <jmkrzyszt@gmail.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/5] gpiolib: add support for scope-based management of GPIO descriptors
Date: Wed, 21 Oct 2026 12:02:08 -0700
Message-ID: <20261021190212.2237804-3-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.56.0.307.g5fe7bd680c-goog
In-Reply-To: <20261021190212.2237804-1-dmitry.torokhov@gmail.com>
References: <20261021190212.2237804-1-dmitry.torokhov@gmail.com>
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

Add DEFINE_FREE() definitions for gpiod_put and gpiod_put_array to
allow using __free(gpiod_put) and __free(gpiod_put_array) for automatic,
scope-based cleanup of individual GPIO descriptors and descriptor
arrays. Place these definitions after the CONFIG_GPIOLIB check so that
they are available regardless of whether CONFIG_GPIOLIB is enabled.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 include/linux/gpio/consumer.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/linux/gpio/consumer.h b/include/linux/gpio/consumer.h
index fceeefd5f893..ee183a97575c 100644
--- a/include/linux/gpio/consumer.h
+++ b/include/linux/gpio/consumer.h
@@ -3,6 +3,7 @@
 #define __LINUX_GPIO_CONSUMER_H
 
 #include <linux/bits.h>
+#include <linux/cleanup.h>
 #include <linux/err.h>
 #include <linux/types.h>
 
@@ -578,6 +579,9 @@ gpiod_is_equal(const struct gpio_desc *desc, const struct gpio_desc *other)
 
 #endif /* CONFIG_GPIOLIB */
 
+DEFINE_FREE(gpiod_put, struct gpio_desc *, if (!IS_ERR_OR_NULL(_T)) gpiod_put(_T))
+DEFINE_FREE(gpiod_put_array, struct gpio_descs *, if (!IS_ERR_OR_NULL(_T)) gpiod_put_array(_T))
+
 #if IS_ENABLED(CONFIG_GPIOLIB) && IS_ENABLED(CONFIG_HTE)
 int gpiod_enable_hw_timestamp_ns(struct gpio_desc *desc, unsigned long flags);
 int gpiod_disable_hw_timestamp_ns(struct gpio_desc *desc, unsigned long flags);
-- 
2.56.0.307.g5fe7bd680c-goog

