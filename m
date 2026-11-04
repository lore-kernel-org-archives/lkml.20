Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793817309;
	b=TE2Q5QLeXQNv+NsBLwY8fHvreBMU72zv9QT2hO4jAnMlVoQZX7IsHvqp3cCtSjsDlOWM
	 ZRLjd09DaCh8mQo5ypQaqeY9jSfr1tryvroztcmm1Rl0XA1KVqIeVEdHOaqmyNAQyqloZ
	 1FgM9lW40s8uhm8QSCGhCjOAYCAtDdp72UnYUAQo0RR7Iz2gXaZTKpLsjRYHp6nMlkEf3
	 rTKc8rP8pn7uYg99o91B2TaeN1ScRhCaO4E3MEgYeuNBC6mrpkDayweIwiLSs90Ca7BE0
	 TyssDP8cbUvj/qx8Ny+jFueKeMGAaehRMGGU2xA2dDSCJYtw74N9hvd8geuofsUFbIw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793817309;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=78AvqKs+xm6byH5E/GIRqHO2qPkCvfeiknurCnM2rCY=;
	b=qi8JRNGMdZceQDMCF7FZv/Y4IwgZ+IME42Wr4aLMN85fUEGZlbEgBnAj96lFe3sKkiBD
	 vN8fxKtR6ac3rdXiteTMsMHTZL/k8Y0p+ReihNTarCExcLqMDBRxfB+7UdQVxaAhKLGc1
	 a77RGNn5tG6Z4H/iKgrVlrDOX7i6pnp/6Tcb50izOU8Fsy7FDXgUhFPMrVgdqx2APTXyC
	 tqVblpAZnvi/Wc1AnZT/YS4aYZ4nn5jRfAU/cDgUACXqSBgean7GYPE1UxJhJFXw+JIP2
	 IOYbkR4fbxIXVAJwfS8ooySva3ZsE9dy6uQHNChhOGSUap/5DcJEtpWImeQA6xC/FZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YqkI+Wlu;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 137DB606A33B
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 18:35:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 137DB606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YqkI+Wlu
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-49d05d51553so6748205e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 10:35:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793817306; x=1794422106; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=78AvqKs+xm6byH5E/GIRqHO2qPkCvfeiknurCnM2rCY=;
        b=YqkI+WluIJocVh2f1mr6rKjFwFSild9YAR5zjTybNF0sQLhxBvfU63Ub8XXWfx/Ppy
         pDjNN6t8nR6bjhr9sgIGqKQHP/Kj3YNLX4W8Oo99wukrkgEonwiSYvD33FzkPAKw1Fwy
         gSVVgxp/XdDyAsouweUO9Ch7V4hUy/JUpVQd39HPHVNZ3vetItkzYs2+sOWnlbe72YGd
         IUjgod3hJU6Gd7FVkl4w1tF4mVXO+nLrW3W4UxKJYL2rey8dKPR+TJtP8PBUflYESuJD
         f4rE4OyPvKvtnJM0FFTEiuu6VprVSjZzYJ/scpsTXnEZ163tBlJoFkdDs0Pi0pdibmSS
         ZvUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793817306; x=1794422106;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=78AvqKs+xm6byH5E/GIRqHO2qPkCvfeiknurCnM2rCY=;
        b=LG0R92uBTc2i9k/81PbhNojRSyoU4/+lHx+MKOiSHbqF0YS3ExZVz8MsAeHxfgkrj/
         ZchzBybAGfjCxfaWXIbUedBDW99BCfiJI6dKHRf4Zg2Tq/RSiJ5kj1d0U+hfoRnY6Tng
         ACABc4GIzXCdzUiTKjHGYCADjNG/zvPcKg08CtC1BhSXnT9YhZWfoDM0qavbAiGH2+Vv
         LGGur4hmcDm967Oywa4lfUgzyiVVfQh+d4Rt1jTIwOEzLpQvlC8stD6sc04OtOxkaMz4
         +y00hwHOfU9pHnwJjezBxlvelI7MclmmcwxKWrv7wguWXVkwV62nTM7nobkg/nw7RlY0
         0wXQ==
X-Forwarded-Encrypted: i=1; AKwUvBzOYLbi7raxxAfoK12bwtNv7YG9heO0KXXX879WwA2KHvVmUcVPRzTMsJ4IXhSVF6KFt5etnEzpy250ZTQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z9L5eszW+O7QKJQ77y3qUBgAdH9J145dvgYHQj4YqNh1OtO11Jx
	xiUDY4ehvWhcViDOztp4RrINF7sRLa0MAvQo+l4uzqIJnXr09GTS+ivU
X-Gm-Gg: AYBFou0T1yp3SJ1jiOeg1TWKkhtqzJMVca9m7cboemeRVSeAcRqnzNQYcaUPQZc4nAx
	e76EakyqeDF+oNtvCBKGI8EXYEOeowfZx5b9AYenxNLHcvkChuLm22hdrl4C6ZVIo7cMqqnBT/t
	CL/dco0mtxutPwHNDqcjNSgsjnLtV5kmqbCMLLaQtUxg9yKrcajsAeJAydDFZGiWsf14hrom93A
	LJjk0ZAseqGE8ozSBnN+TRcS995OXnxxf6veU+3smzdAM9c7mEvk8FqhSstGnepCNzWV0hSvdZl
	BmGnwPqPcaKw6LpCoSugMhBoc2Rr0rFONPwBIEIr3HN8WjxPKo3si/MJihWsSr+mklpPMtL6SNC
	d2D2FVcITtrGHxpQCb/A7fImhAtNYqR2tEMj/xaIjMNAy0Hc5PHbzI5Hwjo/V+04/rGAA4rWRg+
	MjGgig+XYkbANgAoEj7q3mq6/YbZ1x9vs6HLQahwBkQ11VsttD0Atw4QbiDEUnSnlKXxHYdeFPC
	aTD1CrPIYQVfCgCFTCAwh+PeAluT2rcUjyXKw9hCVbbtv4l00G7eFS0dZAT61d3E6KPqgxwBA5/
	QMUhKe+rpT5OJBKODKPspxWQiWuRN/rk3hJboQ==
X-Received: by 2002:a05:600c:8b64:b0:4a2:84c:52f3 with SMTP id 5b1f17b1804b1-4ac16fa21dcmr409797395e9.6.1793817306434;
        Wed, 04 Nov 2026 10:35:06 -0800 (PST)
Received: from fedora ([154.183.179.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b432a883ffsm31404915e9.3.2026.11.04.10.35.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 10:35:04 -0800 (PST)
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
Subject: [PATCH v4 1/2] staging: iio: addac: adt7316: sort headers alphabetically
Date: Wed,  4 Nov 2026 20:34:28 +0200
Message-ID: <20261104183429.20125-2-abdelnasserhussein11@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261104183429.20125-1-abdelnasserhussein11@gmail.com>
References: <20261104183429.20125-1-abdelnasserhussein11@gmail.com>
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

Sort included headers alphabetically without altering the list of
inclusions. Keep the <linux/iio/*> subsystem headers separated from
the <linux/*> group, and add a blank line before the local "adt7316.h"
header.

Reviewed-by: Joshua Crofts <crofts@kernel.org>
Signed-off-by: Abdelnasser Hussein <abdelnasserhussein11@gmail.com>
---
 drivers/staging/iio/addac/adt7316.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/iio/addac/adt7316.c b/drivers/staging/iio/addac/adt7316.c
index 20f6052cc7fb..515f1fdae46b 100644
--- a/drivers/staging/iio/addac/adt7316.c
+++ b/drivers/staging/iio/addac/adt7316.c
@@ -5,22 +5,23 @@
  * Copyright 2010 Analog Devices Inc.
  */
 
-#include <linux/interrupt.h>
+#include <linux/device.h>
 #include <linux/gpio/consumer.h>
+#include <linux/i2c.h>
+#include <linux/interrupt.h>
 #include <linux/irq.h>
-#include <linux/workqueue.h>
-#include <linux/device.h>
 #include <linux/kernel.h>
-#include <linux/slab.h>
-#include <linux/sysfs.h>
 #include <linux/list.h>
-#include <linux/i2c.h>
-#include <linux/rtc.h>
 #include <linux/module.h>
+#include <linux/rtc.h>
+#include <linux/slab.h>
+#include <linux/sysfs.h>
+#include <linux/workqueue.h>
 
-#include <linux/iio/iio.h>
 #include <linux/iio/events.h>
+#include <linux/iio/iio.h>
 #include <linux/iio/sysfs.h>
+
 #include "adt7316.h"
 
 /*
-- 
2.56.0

