Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793612609;
	b=J0FIY8iZh8wv6RtVE5XBBoEOMhtMkfg2U1QNXtQyCkHnqlKKS+tl3f6wMCSpTClcucpl
	 EAy+sweKqh7YAh4Zlu8pQBlaE0eY64PfCzrzdXYXE5LE0zXsqoexu/qT2wliaVo2QuVxd
	 dygxxso6ChQR/CAox9dKza2b2sQWLlKscQJb+SL/5qGNG/KB+L6CVnGHpHJqS7mG2oQ2f
	 pb1oOiMb0QXs5rGOQBnFwqnqoDb9WAZEayl+DTjw4fnlz3qul7eqIktUDY3G9yzcJF0Ii
	 MLI1/LAuM6vfRPrIpC8gDAzFYaISoaLBYfhM11YU8l2tcknnIX177buWmPcPfN9G/zg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793612609;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=teF6NADalu5/7cF6wyx/P+C8roXp4OA8wuuPR0caYC0=;
	b=aBolC0sBe1/LIrTmHTLj5HXyS7z4h3wwpQLlPYEcdh/69xOjs30Ngh5omRRqQCZk3EfS
	 y32CdWVW866UjM4uBpnYE2GmLh8ePvz7IM+5IwO0r6QxJS1QF0ZKvDvlmRq3/6P9EVUo/
	 RP14iNSLFkwbZe2DotqaC9lt76TiCm+2p6EUIWjZZaUXPxYWB7qke0NCIc7ZNKGx2neud
	 vvC6qLP3h4ox4AueWFj/cLgao+roOv5e+yp6v6h6mgZqFU21LPwkXvCF5uY85naPRNkYr
	 A6xJeD52MeJ31+nL3TN/zZcathky1q18WuKO1flCkduRjLrBzQoqLtS0HcPxNICTchA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LMKrpVt5;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E57EB606A326
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 09:43:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E57EB606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LMKrpVt5
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a35ac4475dso18761025e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 01:43:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793612607; x=1794217407; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=teF6NADalu5/7cF6wyx/P+C8roXp4OA8wuuPR0caYC0=;
        b=LMKrpVt59Xo+e0jBA1cABwDkmC6LHbX2LJa4iXrgTtt0zTh7vDPXoNmaMNjIKg2HrX
         pyPMORppsnJoJljs4Z/wIUml4niIwQIB4lofbenMLUNNaZ33xOOo1hGcF5sgPFzmPw0/
         tC+Cb+hPYWc4KwRSeQbmwm69XD1th6NbywcsQ2agLBgT5zEM4ealXcO5LV3WSVlg320g
         yy1XYzVBFNNDIHD7yGkk6QpUuOqA3oFnK+24fuQOPS6ml3ZRf0uZY2YV767aeGWvxyAA
         Fm0AQOjTr9YxLXcaln9VpN0D64ZFHtFWtX44N3jntoxiBL/t4Lvpf5UyBRT9X+Crcx++
         IiAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793612607; x=1794217407;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=teF6NADalu5/7cF6wyx/P+C8roXp4OA8wuuPR0caYC0=;
        b=jp1JcQhLHWSiV0nhBDq4GWwqeUiRZNEyxTaQKUkwSdIGo5UxowFZAGejij22yXludd
         A+vxqb9rEPQ5LfxI8BUwLaU69p2tbUpIJXMmtKW0ZiGOuDBZnGnoZRdDqB2HKn2lClXD
         DI8Cp9CEEcp8B18xcs8FtJxK6enU82tzQvmCicqrnjikGu9soRgoheQ2Sd7OYX3B0tl0
         zlz96iXDAq67hrga9hms9/lN77cGMCGQAS4kNud+pxSGhLItizJpGMFjWj8IJlQXdnKS
         TKrnCQiqT6PWsaVJnsrMZ+FWEtszIk7c2qiFpVaO66XNcoCFuK3SSLhJGkmj2XS+aY8m
         3tSA==
X-Forwarded-Encrypted: i=1; AKwUvBzm/iZMTyvJqXsvAeI4KJ+xWZJkq2EMCJmk7cljXMQFrzz19CpZY/wE7uuKfUdcpsI707o6mQvaLbh9AG8=@vger.kernel.org
X-Gm-Message-State: AFq9FYId2A7gNIFvktFSuXv3egR4zbWn3sf66U1M7Z3upUJBiZfJIil1
	wsL7wrYz4N2fOch+z3YfkGVJioYCe2RCfagUMl147YpAm1igzvYEwmtFRCRSTA==
X-Gm-Gg: AYBFou3Xfc7lfEVtO0iwD9mGYbw1nUAciMQUGOJ4aaTS0pX0SWyflop8mPZMwaY2+TL
	Uj2HgFeBne1WKaVksNKIe5qpKXeLC01ejT2lrCEW/5+egjpppzVaLjLv1zc2UMZca/3ldKCi0mk
	+/CbpWuKK/qt8h0xlLj66QjI51QNoAriOYa8rTvD7rCjapF0uCtuiIr0Hy6/srikUucYcWwp30p
	y/YKZTcQHQ7iNZzSYwaW3jQD9FRub9fKWgv8JoeHbzaYynt4re5pCcClEIqgVaLVFVDg6l1PQT5
	6U+L9dovWESJJ1VjgNSuvLUOsgzrYxBgG14H3jyLv/Dtd+9xz4AKccJv+7YuOx5F4cyoAmfvFIL
	c2hg7AnKqleVrHxC8ed6jSpDiecls+5Es+G6+aATrAarHDpv/M368pjI8dW4gxpsqe34K+tfuPr
	AN11Jr0wCiB4aph0+fkkCO76Py+gsvjTRezxGLEBMD3zTFfKva6+2dcrE7K4S+/tXWU3kqpV0Rp
	ugEyBDt4VUzllZ1ztIkxZS/FZCt45ktqkXXhERmXIyoBxOmurnbAwsl3Ng/mAluSSUV+XmM/Uvv
	gihjwa546ojxwKz/50IdUQdNGigQe5+S+knIyLk=
X-Received: by 2002:a05:600c:46c8:b0:4a2:1a:a120 with SMTP id 5b1f17b1804b1-4ac16acfde1mr230539615e9.6.1793612607413;
        Mon, 02 Nov 2026 01:43:27 -0800 (PST)
Received: from fedora ([154.183.179.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa813d295csm332507285e9.7.2026.11.02.01.43.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 01:43:27 -0800 (PST)
From: Abdelnasser Hussein <abdelnasserhussein11@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Michael Hennerich <Michael.Hennerich@analog.com>
Cc: David Lechner <dlechner@baylibre.com>,
	Andy Shevchenko <andy@kernel.org>,
	Joshua Crofts <crofts@kernel.org>,
	linux@analog.com,
	linux-iio@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Abdelnasser Hussein <abdelnasserhussein11@gmail.com>
Subject: [PATCH v3 2/2] staging: iio: addac: adt7316: replace kernel.h with explicit headers
Date: Mon,  2 Nov 2026 11:42:36 +0200
Message-ID: <20261102094236.57757-3-abdelnasserhussein11@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261102094236.57757-1-abdelnasserhussein11@gmail.com>
References: <20261102094236.57757-1-abdelnasserhussein11@gmail.com>
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

Drop the proxy header <linux/kernel.h> and replace it with direct
inclusions per the Include What You Use (IWYU) principle. Also remove
unused headers and keep the list alphabetically sorted.

Explicitly add:
- <linux/bits.h> for BIT()
- <linux/err.h> for IS_ERR() and PTR_ERR()
- <linux/errno.h> for error codes (-EIO, -EPERM, -EINVAL, -ENOMEM,
  -ENODEV)
- <linux/kstrtox.h> for kstrtou8(), kstrtou16(), and kstrtoint()
- <linux/pm.h> for EXPORT_GPL_SIMPLE_DEV_PM_OPS()
- <linux/string.h> for memcmp()
- <linux/types.h> for fixed-width and standard types (u8, u16, bool, s64)

Drop unused headers:
- <linux/i2c.h> (no I2C symbols used in core driver)
- <linux/kernel.h> (proxy header)
- <linux/list.h> (no linked list symbols used)
- <linux/rtc.h> (no RTC symbols used)
- <linux/slab.h> (no kmalloc/kfree symbols used)
- <linux/workqueue.h> (no workqueue symbols used)

Signed-off-by: Abdelnasser Hussein <abdelnasserhussein11@gmail.com>
---
v3:
 - Replace <linux/kernel.h> and add/remove headers in this patch, as
   suggested by Joshua Crofts.
 - Explicitly add <linux/err.h>, <linux/errno.h>, and <linux/types.h>
   per IWYU after symbol verification.
v2:
 - Split from original monolithic patch.

 drivers/staging/iio/addac/adt7316.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/iio/addac/adt7316.c b/drivers/staging/iio/addac/adt7316.c
index 515f1fdae46b..54d942cae586 100644
--- a/drivers/staging/iio/addac/adt7316.c
+++ b/drivers/staging/iio/addac/adt7316.c
@@ -5,18 +5,19 @@
  * Copyright 2010 Analog Devices Inc.
  */
 
+#include <linux/bits.h>
 #include <linux/device.h>
+#include <linux/err.h>
+#include <linux/errno.h>
 #include <linux/gpio/consumer.h>
-#include <linux/i2c.h>
 #include <linux/interrupt.h>
 #include <linux/irq.h>
-#include <linux/kernel.h>
-#include <linux/list.h>
+#include <linux/kstrtox.h>
 #include <linux/module.h>
-#include <linux/rtc.h>
-#include <linux/slab.h>
+#include <linux/pm.h>
+#include <linux/string.h>
 #include <linux/sysfs.h>
-#include <linux/workqueue.h>
+#include <linux/types.h>
 
 #include <linux/iio/events.h>
 #include <linux/iio/iio.h>
-- 
2.56.0

