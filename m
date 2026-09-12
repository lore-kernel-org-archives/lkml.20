Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B317376BCD
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 13:25:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789219554; cv=none; b=LENk6XcoJRUk68YlfLw5xlKgK0TmpRjV4jbicOq0zK8YyeuhX6B8cSHQ27PXxjiCyKQkB6BMQ8YOdrVijg3c+GyHXXNty5+Frax3BXMzm9frh9Q4r3qQ81tA9snj8SPr9ogFDL7oP9ZcTMbmERmvRO1u6mwJbpNqM+F2/ISJghs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789219554; c=relaxed/simple;
	bh=wFxXi8Z9WcIxFPd9fUaEH26jlrgztUaT4NJh8D572Es=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iOucwF5/jSVeUhIBz/uxFgkLZCKXW+38Kn7OKwxK/EWiuplNkitvxdCfm9BOv07JVhlc183vywtSx2Y+ZYDpmYX6m76zL2hlxNdBfp87dRUQEfPSS1e72L9CPteD7wJh17d0tSyzohlKXor8wXP9Ag850HWbc+A0SwUk4S8HIBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=etBpPYNs; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="etBpPYNs"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49e6598dd44so1630505e9.1
        for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 06:25:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789219551; x=1789824351; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PW1ixTgxWimSTTjdthxgReSlmPLPKmDhq2QrwAvzdaI=;
        b=etBpPYNsF/ubdtDNby7KvNJx4F4IVT3PgBg1+ROGg9f6I/4V8iNYgW/80tykxUlsx+
         Is2mrQtMHaDIqXW/otcaB+DbECqTnmeZpBWr35EXK5k6XJhhe6DY2eZllCleCn08t/mA
         cgdIhgrVMAjrxXhxyQSMF4Z/ZOIyWY/BsKUtfJZC8G1V8VeOkYT0oNs4tjFmwM4/kFca
         IP1I6Rq4NwrkoOvP6t6Ryb/zqZG3NUyHJhkm+f8tIrr+QULvX536+uFY1y9N5ly4qYyO
         EZjplgXbMH/R9+T/TuYb0wdFvkBRZqy1aiwRBdyNE9NjBr/Fkgy2+QXap75oGDw4lxOi
         cy9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789219551; x=1789824351;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PW1ixTgxWimSTTjdthxgReSlmPLPKmDhq2QrwAvzdaI=;
        b=l0y9D7k12joiJbDa07pETYTHwwKyw2DZQoKLNes0DzD1sDkP07DjnDOd7KeQKaqwr3
         aemVOukFlNkc6T371afDnv0apVZiPbYn7tFbYb9odRYSyJFv8M3gffIdNFldAdcF/6LC
         /fiOBTLmUCvdchhe6V8l73jnOwpqSF3EW85v8nF7X+oAim8dp552onOMnphVAqeJyoR2
         PsLc0/935TWPAsoLxD18W7ahyzGaPHTRuW3+kdshhd102Dq3zXlsTkFTVSdLfxVhI6Fe
         pE/ooupHytgk/R/BKgaOESZHiZKA5VQ1vcgFo2RMM28SmVwLkjYrBLLB+N8Nekmj1L1D
         PntQ==
X-Forwarded-Encrypted: i=1; AKwUvBzqD3URo0j9dcaOKipnQ9Nb1wOmq1isONmp31RRvdohd4aJBDG6u0otOBlqEfIVcpc5kZKbAgEAChOO5wU=@vger.kernel.org
X-Gm-Message-State: AFuF++nhczBdHlSVpgvJVi7FtwaJkeqEDMzYmggnL5FNe+7tzhPvY3hc
	SMH1MFnsUNLz7Rh9JFkjcfwtZ2mYRXT1cBX4M8uyD+Fe22N/JxSiDApIXhjm9w==
X-Gm-Gg: AYBFou2wlUe0JYlYVkkBxS+LFuvhLinwWwNG5fCIa/qP8ViEOoHLmdEl7HIxk+Bm5dQ
	eC8svQ0Q3begMOxMLr3BF9Tj+95BjQvtBWQKiTfGTw0vMUZ1jPX0W69IKw6s0kI+uvHtkDySpv5
	h+esh6ylxzT1ORzTQyprWQAqI2wkmuWx3pqV+ZdecZGQNAAXuVn7Goj6fkFzwkHq0z3a9/EUJsD
	O1ohqMxp6YzhsEwMUiVmxqOtzESbW2x719Xz0sqzxjl58wV4y1gXCDNDm0RAohwxb19vgZDbtag
	FWBwJpectrQw2ahNdWgXIKg7BOvauAGQkUqflvIko/0Jke79YQNEyCsTYy8g1GiBNSqhAtwUqET
	QDw/QA6/4TEWuivNP6eopzy5jYi1tp98HlU7KDKu2MSl91qnwSMbCPwHOUev/AIg7cAKBt4v9Cs
	u0Mc0NHwT28qTHXQ2gdyghTlMxReOQ67ol/5k3FbPqnnrmBI8qd3w8f9KPwN02tRtZlHYEF0tNs
	RRMfGrvV7lQSQrrwA==
X-Received: by 2002:a05:600c:19c9:b0:49e:6683:d23c with SMTP id 5b1f17b1804b1-49e6ca4003cmr24788655e9.0.1789219551327;
        Sat, 12 Sep 2026 06:25:51 -0700 (PDT)
Received: from fedora ([154.182.88.3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb33ee8bsm12684503f8f.15.2026.09.12.06.25.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 06:25:50 -0700 (PDT)
From: Abdelnasser Hussein <abdelnasserhussein11@gmail.com>
To: jic23@kernel.org,
	gregkh@linuxfoundation.org,
	nuno.sa@analog.com,
	Michael.Hennerich@analog.com
Cc: dlechner@baylibre.com,
	andy@kernel.org,
	linux@analog.com,
	linux-iio@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	joshua.crofts1@gmail.com,
	Abdelnasser Hussein <abdelnasserhussein11@gmail.com>
Subject: [PATCH v6 1/3] staging: iio: adc: ad7816: Sort headers alphabetically
Date: Sat, 12 Sep 2026 16:25:15 +0300
Message-ID: <20260912132517.55686-2-abdelnasserhussein11@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260912132517.55686-1-abdelnasserhussein11@gmail.com>
References: <20260912132517.55686-1-abdelnasserhussein11@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Sort the include directives alphabetically to improve readability and
maintainability. This is a precursor cleanup patch to prepare for the
addition of new headers in subsequent changes.

Signed-off-by: Abdelnasser Hussein <abdelnasserhussein11@gmail.com>
---
 drivers/staging/iio/adc/ad7816.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/iio/adc/ad7816.c b/drivers/staging/iio/adc/ad7816.c
index 30644d2d7c54..9e43ce83e071 100644
--- a/drivers/staging/iio/adc/ad7816.c
+++ b/drivers/staging/iio/adc/ad7816.c
@@ -5,19 +5,19 @@
  * Copyright 2010 Analog Devices Inc.
  */
 
-#include <linux/interrupt.h>
-#include <linux/gpio/consumer.h>
 #include <linux/device.h>
+#include <linux/gpio/consumer.h>
+#include <linux/interrupt.h>
 #include <linux/kernel.h>
-#include <linux/slab.h>
-#include <linux/sysfs.h>
 #include <linux/list.h>
-#include <linux/spi/spi.h>
 #include <linux/module.h>
+#include <linux/slab.h>
+#include <linux/spi/spi.h>
+#include <linux/sysfs.h>
 
+#include <linux/iio/events.h>
 #include <linux/iio/iio.h>
 #include <linux/iio/sysfs.h>
-#include <linux/iio/events.h>
 
 /*
  * AD7816 config masks
-- 
2.54.0

