Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793946634;
	b=o6VkN8FyFORABXNdjgjT5pnYoTjwsVpjU3Nd0qYG6dSvtE99jbH8huaeik4TGBdIZIej
	 tbTPCgk/WhrsGjhCkpCdCjDn6psvADDJHixM1AfWiz2EUy2S7E8XwJ+qrEJHYbY6sSAqA
	 fqaHjZUv8jefrm1+2CzdQDFVFp5ogH6nsYFLqNcJd7awasdXD4MkuW1Yt31StWMPLKg8y
	 81wry8Qm6n5gUjkoWkopuLl1xqPk/0cQoS4iUZ3d7/f7/+0MyHlrUBYGN33tI1ZvOeHx2
	 u8JkfcX7Tkz+041t5InLrgeun1xcvUT5LCbtOpqahUUppV3VOznq1JB6SzI93+XQGuA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793946634;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=g7mFdWrudXwM2nYrMXMzR7kkLu5bcGMHbyNVyyN8oZ4=;
	b=bPUYpvyNnT+UXHjGUd5VNLHIYFc7SWAlqqTN4fXw8TX3NQnO/tlKSxaT4C7gHfX35SMa
	 HAeeD6qIuH6xTiVqQpj/1QT1Fz9UMeAz43s3GWFLgwhZM+3tLD04aLQoewHzqv/ztgl26
	 B3WHNFy8+2CnK6dM2pyZJ05RVMXLFIl70uR2XUfeS6Y5NlNbD8vHkCx2g+etmPhbOE6gF
	 c3uChR1baItJQv+MTctkOxulHUgOETzoqtBaI/hKd4xgHw1CuIcAzzYbX/aEeWqXL7dCQ
	 u+G9NkRrmUWY24pRi/BUqIaRt78OKhzPNIE+y5b3VIkbV3g12SN1JTIbCU2BiVg8XOg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=S551POE4;
	arc=none smtp.remote-ip=74.125.82.50
Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6765606A33A
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 06:30:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A6765606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=S551POE4
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-1ae18eb9ad0so468598c88.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 22:30:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793946628; x=1794551428; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g7mFdWrudXwM2nYrMXMzR7kkLu5bcGMHbyNVyyN8oZ4=;
        b=S551POE4JMpdw1h8MBDgFKO0BBgcA3Bg9vJRYDUE6lAzJfC883E+i1XL7BvEnc/Ggr
         pps9g+oAU0XnGSRfDA2H9HJw57R8aGdy4rJCMpnbT5WX5DEQl3Pqxe+QsKVEMNGsSg9k
         3Hfo9WtNoleg9jy8zkiHR9v7900QDQkmSUtxRRdu8BScrzuqlgDlNC+5LwIuqK9iH3mQ
         lCMhTf8NmP5GJaRRfOM7JN7vkqdvCLOzSQWTOajh7W2ph+O5SlYSbwmohDANKexM1jY4
         IzQi9lnUO1m/d8MhjEZ4y8Y/6DY0WB78rQLyPCaXg26T+jqr0/cgpiYC73c/hcKQcGgI
         0jLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793946628; x=1794551428;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=g7mFdWrudXwM2nYrMXMzR7kkLu5bcGMHbyNVyyN8oZ4=;
        b=rgMJqrJ7EL68vxkOOpltRKvoPj4ng/iV17Dr9Xp7vQ1IrYVVJH0TRmptKO7QkBZA1Z
         0Q5hY3UBC1XXShtIz6UI5HiEeWaCjdfafa48b7wSql8CH1dVb3jn9A5SW4YCdx8UMoeC
         qYeiOiX4hhzmuWCoQHxGZNcFStKburw/yuEsE5CUuUDAOzqj/5VoCekOhwMRUhyZBTjf
         KAL0fYnmMZionmGYcEfznhgJeF1jCN/PjHEZt7ERr6RJB8BQwdmrCnQDVqHR2L9wzq0a
         TpEev5rEV4eE4+6BX/u4VerIyaXjP7czOwCPgEgdpfZQttpjSSf4zZekMaSPVuMmkMtx
         7xMg==
X-Forwarded-Encrypted: i=1; AKwUvByi7xe87iow64Sl6DLpkg0b8L8e1FKbmam0Z9Ng8HUMSwIwGFmjxgF00bbqjQIKH2MsIEFJTzMG3UQEQcc=@vger.kernel.org
X-Gm-Message-State: APuU4Z//UDiEp273dwYrZVvsDpq3bQh9pW9hoRg5oyjRgztb682teVkn
	jIsFhMZRydzwcHYN5di9w9DkoKhpZldul57lHDQaQ0Ej24PQYCkVe06+
X-Gm-Gg: AYBFou2TqD7c7mR/fGk9inLrES5pm8KxseK+F1L22r3blReX8oNiu10vzJO26Krg4ao
	q8j0ZVkRKCgIOQyU/KmWWgrrukibbX+6DcH7ysyPmt6ffsos7H11GzNk/nVH8v2di8RekX+6pGp
	Cj47jqd8FUKD3HXYbsEOWbZkcGoNNrUGS8hQBKC7a5vEwDdRrWxuPyGkO2PJVLFcKinIAl6G46v
	lU412d2oQT/OGBKwRLFIrWKox926LFbQYtNEI5MMAbeCQhk5ZfpmDq4YP421CCWViYr8KLaIDqx
	skaxmODfTZYhZNOfr5eERo/J+p/BlyFpVZANRo67Di2hvQgneXmdnzBiNttDsgUcBYEHFE8iiqa
	cVtnYxqtcuTvzNZV3gjWRqJoask07DpEyRjCm08vFxB1/bk5YgF3tS9l19v0MDtWE6YflvqpL7U
	ghUB6BSPZ8zhGCuaWdlNqvVTqCPDQDzsT1/kQPPyvqJtSC0ZsNaYVmBfX7WEqZIZOwOIreuxOAL
	nsPwxB1eq5SaQGJpaSnMbLdasU7RhSt870BqYyDUuI6vozZuzOGj6YPK7fxMB5tOgCSHeqcuFEz
	BnoxQQ9cJCLQTuKN2cljlsedhYBf6JJigfgk8MMn3gSxMh+LdY8XjXNgL+AbJCgmnIEGQdHITUG
	xx+WrMzoFB7hvCHbxvhKCXG3x2p1jtGjVgZpnMg==
X-Received: by 2002:a05:7022:ea5c:b0:182:94d7:f76a with SMTP id a92af1059eb24-1b25d3776aemr1728427c88.43.1793946627391;
        Thu, 05 Nov 2026 22:30:27 -0800 (PST)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:64e:8358:c9cb:c17b])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b25e4a63f6sm3734266c88.9.2026.11.05.22.30.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 22:30:26 -0800 (PST)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Thu, 05 Nov 2026 22:30:18 -0800
Subject: [PATCH v3 4/8] gpiolib: add support for scope-based management of
 GPIO descriptors
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
Message-Id: <20261105-b4-gpiolib-free-v3-4-bb47ad58642d@gmail.com>
References: <20261105-b4-gpiolib-free-v3-0-bb47ad58642d@gmail.com>
In-Reply-To: <20261105-b4-gpiolib-free-v3-0-bb47ad58642d@gmail.com>
To: Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>
Cc: Andy Shevchenko <andy@kernel.org>, 
 Janusz Krzysztofik <jmkrzyszt@gmail.com>, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Andy Shevchenko <andriy.shevchenko@intel.com>
X-Mailer: b4 0.17-dev-e56a4

Add DEFINE_FREE() definitions for gpiod_put and gpiod_put_array to
allow using __free(gpiod_put) and __free(gpiod_put_array) for automatic,
scope-based cleanup of individual GPIO descriptors and descriptor
arrays. Place these definitions after the CONFIG_GPIOLIB check so that
they are available regardless of whether CONFIG_GPIOLIB is enabled.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Reviewed-by: Linus Walleij <linusw@kernel.org>
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
2.56.0.506.g506a7eabc5-goog

