Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793817318;
	b=y/oJGiMlvyFoFCQPAxP25HPzTPe7vI34i0MhdIfNiWLmIQ5tt83nEp20WdGj+6BQNVZM
	 znADY+QzHmYIs3qHYer29TB1l1eGAgOsn41IcSHbae7WL4/SuRiHWkpbF8eE/uN8R9msC
	 DxtAhFQkBWZv9ld6WnROmdELOaW0ZVN3/CUjTSFkZVQCjVy10SXQz6k4ijDufPkcdrlht
	 wrCkY2V5A3NU293DzOD1JTrM9V8041mejJXGrhmz36y909NIQbv0tHTmRrR8UKyGJxf+5
	 W9q5ImL/vw+mlq5WLl6LvX2+gswHYpyO1Sl7u4PJWUE1vtshZungyK5QZXdMrWt5wSg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793817318;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=JcGDDVLFabrkV6b/q/P+th6iJ/MJURW7IlDAfrljWjc=;
	b=lqPFO+1G/czpQsif/5bLVadIocFRSioOWt56KwX6Dlz3s0AMwKNEO2R2z8D/un6TkRHz
	 e2XT+lkZSgSOicjoFV2xEDiDrjPKNvuSA/f74IodeL39szqWqVjdHZN2ljmXQvJPajN15
	 gClwmItR5Jr2Eri3A6hIW9l4oaxIfo9vTqbOaZ51Y0snqGd1TlMMoxgDi19I9qMCHshWH
	 L+yJafW0mPZCPhlCbz30mwZkpEK1XnLOvRRCARix5ECWxxLIvneeddZO78Ts1TS6bznEe
	 7nr8cHSC60UwnBLHG2k0F2ZWHXclyJhCu7/qP/QCPpbut/MVrFsfdwOqYDG1AgVqvqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=u2bgpExK;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 289F4606D81E
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 18:35:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 289F4606D81E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=u2bgpExK
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a2072b9832so12956495e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 10:35:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793817316; x=1794422116; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JcGDDVLFabrkV6b/q/P+th6iJ/MJURW7IlDAfrljWjc=;
        b=u2bgpExKvb+SNLNVJWcB+8BYoZisdBATOrf2Vav8+GQNUXakxJcit4OcWIk/5Q09Ra
         K1MYw3BApB/beTooo2em3NZ2R/9aRH3oeol9QMBYi3P/ikabYXEzT2OYiW2JJWGxUpL0
         f6mgLw3yooteAOVuLmMc74kvxTURicgGn72Y+y+gKOMHqoXI6ikkHJGvcUyY6+cFKc5O
         mhPlpmwjSJTj37gNc8ctV8T8p3lVzsJnCiuzvo0zft5l/7qw04FzrBCAEoDqAp7VQ+ES
         QBXmVnw93jsiGMXzBuO/1yHNycMLf9KGAPFOgPns7mE8DGdWZTiASjnXC3CHDeG/+av4
         pCkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793817316; x=1794422116;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JcGDDVLFabrkV6b/q/P+th6iJ/MJURW7IlDAfrljWjc=;
        b=H7DHhcrxKfcz3S2hbLTvkubtuDGMqfzYNIe0h7Xqf2lN9BWrIn5cqIMPxSmTbp/BTB
         oAeB29AWxnrKjFq2HtXSddJsjC9RDZ7DsejKS8RDfmPnCR0Kr4gRrxCXw7ebnJW/0S0P
         lEVA4Xu6mLG7QHlN/2yXHxSfzZVekSsiTqcBMt9+RRzdIFVEPxgX5PHloeESgWBA9TFx
         yjsVT3xT90O9tP/iHVv7Wv5YXQ3jxwNXYjuPiq9zKgfQZNHg+B9mjpIN4dJbBA0Lln/v
         E+ITL0H8/V8DWVFzhlmLLIqbNX6Fpj+MZ/SAi6SZFYdBIUbvANhYRLndUwo3HV8bylWF
         ZnIQ==
X-Forwarded-Encrypted: i=1; AKwUvBzK3V/ez4RSux+TM37ZeHMy8C5uAgQJSJCGzhYB6XmnhnOUMqabglFSW9x6TpapWo0bTnyrXyy7bX4xOZM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+4PhBR9hw0Y2XTHtwrFrctkEu0SC6feLCZN3+T8WTfQfU4BXSh
	GiVKP/ZKbWsbMaaeqRe4ocVQBvy8stWdoTZ5eZU8FhSF3Ak9ssOWEIYC
X-Gm-Gg: AYBFou1IPcJRPj4BeOCnbCQO1BWARsCvvd8+1H7JEiOnocJDlolL0bBHnmLr++10oiG
	MjCpZ7LspjDvfr92mXKcFB2DtdsG3jUi4of60pYYTg14duybmKZk/bTo+bk9p+Xn9ckPgZQ7Uf+
	l5LxLm5vKJuZFT7wqeId0839kRqg9XqrwRJVX1OpLwsBCQ4FCcuuGvcOedssmENGYDXoGuYeLws
	0bGnej4qZlHbzPIKhw7Y7A2bHksuBoZM+7OiYLyeGiFTxSBTY4vEbHS7X6fXA89Gqw/jUMc05OU
	2I63rSqPhZwdBQlp/YsOKvnsrgphVIKpQuz7IbeDOWKbjeigcRq/1BOqYBkziP1MR6H80ADiflO
	aU6WdHWOrDWez9thN2Ba7Sr/8nTYkFVsz4WzcxxKWgcV9lr87+OvBmqdHtTIiXI44FW4C8UnuQE
	0FaxQvxw8h4OpGav2JTfKdjYpABOnFKZGkS17+IUn64K8GdPglsiUSGU0/Q2wPTVYQGZPDUPF8/
	StfAOfnHKGn+BygSDRFME62bl38xg91yzpl9itGSnuIIa8CLuLL6aIRnDt5VU0T4+WOcgiTXrKT
	72xZhneJyWUaTu9wspsxfSzAYNlasH0OhEb39GXVQMXCHgNb9P9qbgND5zU=
X-Received: by 2002:a05:600c:46cf:b0:4b0:b9ff:1e7c with SMTP id 5b1f17b1804b1-4b55e07e569mr5336135e9.15.1793817316624;
        Wed, 04 Nov 2026 10:35:16 -0800 (PST)
Received: from fedora ([154.183.179.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b432a883ffsm31404915e9.3.2026.11.04.10.35.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 10:35:16 -0800 (PST)
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
Subject: [PATCH v4 2/2] staging: iio: addac: adt7316: replace kernel.h with explicit headers
Date: Wed,  4 Nov 2026 20:34:29 +0200
Message-ID: <20261104183429.20125-3-abdelnasserhussein11@gmail.com>
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

Drop the proxy header <linux/kernel.h> and replace it with direct
inclusions per the Include What You Use (IWYU) principle. Also remove
unused headers and keep the list alphabetically sorted.

Reviewed-by: Joshua Crofts <crofts@kernel.org>
Signed-off-by: Abdelnasser Hussein <abdelnasserhussein11@gmail.com>
---
 Headers added:
 - <linux/bits.h> for BIT()
 - <linux/err.h> for IS_ERR() and PTR_ERR()
 - <linux/errno.h> for error codes (-EIO, -EPERM, -EINVAL, -ENOMEM,
   -ENODEV)
 - <linux/kstrtox.h> for kstrtou8(), kstrtou16() and kstrtoint()
 - <linux/pm.h> for EXPORT_GPL_SIMPLE_DEV_PM_OPS()
 - <linux/string.h> for memcmp()
 - <linux/types.h> for u8, u16, bool and s64

Headers dropped:
 - <linux/i2c.h>, <linux/kernel.h>, <linux/list.h>, <linux/rtc.h>,
   <linux/slab.h> and <linux/workqueue.h>

Changes in v4:
 - Moved the list of added/dropped headers out of the commit message.

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

