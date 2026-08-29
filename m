Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D224405C2F
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 16:26:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788020780; cv=none; b=makVfrZwAsqvPTq9t1UOaqf/WT+c/aoof/6ePwCxQzw0vjF3+Rvl04yXpDwD+10/ZU9hTlLoWX4strc3DClVQLMNreME6nkrI+TT49Xitcx/+LSRyxflB4P4vyhCkeelW4M/+CIlGs0MpFidOlRCiUdPcBBgg4NrMyOVLSNv2uI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788020780; c=relaxed/simple;
	bh=ZIw2rzdxIzgoQq1kfSNGayVIiaA2jegJtB6KBr+dslc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=D92UuhZXWga3Cg7PwqUbo1u+HJGyfgCQDbO5dTMgzdE7eHOs/ubvXo6Ms9ri/4M6+0+K/nuQ830TYJDS9P/S0rssWo6b7rayC97VSTytzYrf8utwl5AJR/s92ITQ7B0fbrm+EeHI5KtYooIizaxrBSypamfwwL2IBSUSu8bAw5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oaVHsc33; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oaVHsc33"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-48431648f33so293297f8f.0
        for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 09:26:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788020771; x=1788625571; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JVRNnsMP4fdjNaKvqoLkeRuZUXITpXc/hMd/ONdj0oI=;
        b=oaVHsc33UUsWsLwrfmnDpxALQgWgCZ79za098Xhh4k1cLPpOavDVkieSe6oXSOSVJJ
         pKxzgpZYTNyZKTGwMu2F7Ejof8vXl7yZ7CegAkbdLsrOf7KTZVlg8+RrYFF8X90Sxth7
         CKK5itioFQ72pQVo6FDIBJSlTr+GHNRWX4BoSL/xev0DCgXgfD7JyJ0vVLGWFrA6z04j
         4d02OQ4C/T8+iFHcpz6P89wbkwgIzyKRG/j4aJijc74KloyV89oK+qGQQzU/zcYntzt9
         k9oaqANn8GHd0PD5nMGxR8lZau/sXhbGx8y6pc2yzFIr0GOy5MrQvncLuJL6JExTVdzc
         iTlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788020771; x=1788625571;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JVRNnsMP4fdjNaKvqoLkeRuZUXITpXc/hMd/ONdj0oI=;
        b=I/0ifUoBq8NvI37qqZ7pOsDdYj46GVXEptF1Gmiw3gye72epUMmSSlJxGdfaWSJEw5
         /zsoHkxOP3TJ8LxTiHYVYe4CXlZLfbdkL+j9SyKNSK9FqRyat+yh9WXAD32FHG9fBZ+t
         msl/BKSFZVyiQUyMjFVZ56MvqQ5rHkX6zR8GNiSBvpvSpRhxXfWenu1wUxRiGFMjeVjC
         GzaVExv5i5VKaN6ME7Ik6y7i0glJrD27h3kGz+RQV/+zCZSS3h+Np/JL1mQ9m7lUAHYV
         aL9+ekNr6wmVvhDbeQc01FnrI00O2WEkq6TpSFcylIZEYKm1lSaWnXLGWebWOcrMZpFT
         wIVA==
X-Forwarded-Encrypted: i=1; AHgh+Ro0fblzOaLqbBWKe796a2EaAx6Ayp8KT3lZMYEdJGE4tkweyjlsAdoP68kJ5V5nNgB/jFXBlSNobWy7ZH0=@vger.kernel.org
X-Gm-Message-State: AFuF++nCxjLr1Yt3jH5lO3REbAtoX5uUUBAYoT3YqprBcPh5WVgbsAVx
	03a9FuJ1uW+NBUE66Yd/IlhSblfz1d+l48FdpvHGTmWCe7aH682i46nh
X-Gm-Gg: AR+sD13bAFeY1yBJWorz9Lio4sTNsAkFB9Kckoz8fkRWkdoIuzqBnKILjVW8mWxFRzs
	hyqIA8/W+/BlTXiYvbuFRo0FjPbULXoBVDZ17Cp7w0wBKdOjNgfHjDXOyCvqtdgHPSu2jbjv7/B
	CqCva0rFmpxml1HXmGAR7yl0keZRXV5qGzSECt1Hq1maF0YVYu6lPw1zggeS0UjH57covz3fdRP
	nhCxj8fAfdmRDL3XUHyB29dkAOZTEw4d+QNgyGKCqiaTzwAmPfzZ9aArbRhvlXjORDem3DFW120
	O+94kkFsEqbCwP7MjmBYCHlzIfuw96XAZnAP5xLqNfvqX0jzN3GCxoKC8TET62HyrrDFuuFHSdS
	8TFRQtHFxw9XhRycWbiNHWY8pjMlTKCG8pALYd1uyYl+f6vfWiJPmMDOSKwc16M4P/CMt7ElDxw
	gSEwwj5sLMbOfzrod+gwXUzExk019Y13yXRP070k81zt0E9ehIq9II0+Mb8F3chuMYdK5728KEV
	F6Kq2GYvZMA3eaBIYWQVMy2WywlMjX0yf8+F6jQMm0zUsTAUpg/TWtY6xi+zNEToeW8YV+0cuea
	7ii+YcmQHBldSiX2uHWwo+Jtz5U2E3edpAbklsH1BecoZiNbzMU52FulDos0fPPfUglHDWZ9hwY
	YnsMy1d3i3ZV6+OyM5vG/aCSY
X-Received: by 2002:a05:600c:699b:b0:49b:e22:4ee4 with SMTP id 5b1f17b1804b1-49cca2fee49mr97536745e9.4.1788020771515;
        Sat, 29 Aug 2026 09:26:11 -0700 (PDT)
Received: from [192.168.1.187] ([2a02:8308:4092:11f0::f9f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b92679be5sm137861705e9.3.2026.08.29.09.26.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Aug 2026 09:26:11 -0700 (PDT)
From: Joshua Crofts <joshua.crofts1@gmail.com>
Date: Sat, 29 Aug 2026 18:26:06 +0200
Subject: [PATCH v2 09/11] iio: temperature: tsys01: make headers conform to
 IWYU
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260829-kernel-header-removal-v2-9-c67739d5dedf@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788020764; l=2137;
 i=joshua.crofts1@gmail.com; s=20260530; h=from:subject:message-id;
 bh=ZIw2rzdxIzgoQq1kfSNGayVIiaA2jegJtB6KBr+dslc=;
 b=etx8yrDM8KRtKBRRMfOg6qZJ+DqgDqCZh3pItFttPj8p61kYxa6hO0NMmrjaYtno7Tm0bHxVz
 Pvt+ANBWgZtDU5uzl6K7YtUUBXrTggXt6xmO6DAkvBXv4K9ZwlTdPVP
X-Developer-Key: i=joshua.crofts1@gmail.com; a=ed25519;
 pk=RTDOoVwgeL4oFdASj9U+cxJuIjXuXk73zkjnGOJKbEo=

Remove the catch-all kernel.h header, add missing headers and remove
unused headers.

Signed-off-by: Joshua Crofts <joshua.crofts1@gmail.com>
---
Header changes explained:
Added:
- <linux/array_size.h>: for ARRAY_SIZE()
- <linux/i2c.h>: for i2c_client and i2c_device_id
- <linux/math64.h>: for div64 functions
- <linux/sprintf.h>: for sprintf functions
- <linux/types.h>: for fixed-width integer types (u8, u16, etc.)
Removed:
- <linux/init.h>: not directly used in this driver
- <linux/kernel.h>: catch-all header no longer needed
- <linux/property.h>: not directly used in this driver
- <linux/stat.h>: not directly used in this driver
---
 drivers/iio/temperature/tmp117.c |  3 +--
 drivers/iio/temperature/tsys01.c | 10 ++++++----
 2 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/iio/temperature/tmp117.c b/drivers/iio/temperature/tmp117.c
index 25bc98e64e48..96252627613f 100644
--- a/drivers/iio/temperature/tmp117.c
+++ b/drivers/iio/temperature/tmp117.c
@@ -12,13 +12,12 @@
 #include <linux/array_size.h>
 #include <linux/bitops.h>
 #include <linux/delay.h>
-#include <linux/dev_printk.h>
+#include <linux/device.h>
 #include <linux/err.h>
 #include <linux/i2c.h>
 #include <linux/limits.h>
 #include <linux/minmax.h>
 #include <linux/module.h>
-#include <linux/property.h>
 #include <linux/regulator/consumer.h>
 #include <linux/types.h>
 
diff --git a/drivers/iio/temperature/tsys01.c b/drivers/iio/temperature/tsys01.c
index 14de67ee8be7..3c1f5b6ac156 100644
--- a/drivers/iio/temperature/tsys01.c
+++ b/drivers/iio/temperature/tsys01.c
@@ -8,12 +8,14 @@
  *  http://www.meas-spec.com/downloads/TSYS01_Digital_Temperature_Sensor.pdf
  */
 
-#include <linux/device.h>
-#include <linux/init.h>
-#include <linux/kernel.h>
+#include <linux/array_size.h>
+#include <linux/dev_printk.h>
+#include <linux/i2c.h>
+#include <linux/math64.h>
 #include <linux/module.h>
 #include <linux/mutex.h>
-#include <linux/stat.h>
+#include <linux/sprintf.h>
+#include <linux/types.h>
 
 #include <linux/iio/iio.h>
 #include <linux/iio/sysfs.h>

-- 
2.55.0

