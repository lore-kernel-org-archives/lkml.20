Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C50F343899
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 08:00:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789459215; cv=none; b=K1MoO6er/pO4iq/Mp/qtR0p04YvM6z7NYBpUsj5Jj0k+ey+VrY1tlzXw9uZWMitSigi6CuHIrsaMNiDrwdYh5WVKPj+ky4yjjWGTASSu8t5o3kzSO3pbICdMNG5IPTvN92XN3TYqAHYpNm9gmsr5IRGsHGMgNIfH/brNyus/Xpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789459215; c=relaxed/simple;
	bh=wFxXi8Z9WcIxFPd9fUaEH26jlrgztUaT4NJh8D572Es=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hUQWE9BLO6uf5+sgBM+UzJRYDscVhOpE8NMzJli0l1p5Xlx8SKcwvOyOYDEbpIsLTQ3kMTfZTuOmBjKbDM3iWM7DvAjoHqD9DzmYp0+hyoOfUlkToxvlroOzTwEt5WbprwUNA/TzDsj6fcxkzVXOKjigTvYsuPyHs0sjVswuJuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KcgwfU90; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KcgwfU90"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-486e1a044c5so6813f8f.3
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 01:00:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789459210; x=1790064010; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PW1ixTgxWimSTTjdthxgReSlmPLPKmDhq2QrwAvzdaI=;
        b=KcgwfU90wWAGZpjTUr8z91VWhc2YRUIU65O0O21c3pzfStJ4f8VWFN9soQN0WrJhLd
         1nEeyLqBDoznAr9xI/Y0p+bfqGNjrthdpP7kwsX7ZfK6D1dPfqcchJSn72SRFuuys4qY
         hR2gRKhN/q/y+dB+IHKoqEc+XaMSW6fr5fqUndKSL0PCuTl2ZxZfRdFIE3++xuRgSbTM
         D/VKzt1i1tn0w7sZ0MPYsUHhQIqAsXs3rltt1cZITwWMB2CCtnyJpuOAK0lzPVah6frf
         Hn99UHHdTnfCqSkZWaFQOqqO7yd22qFFQOKJIDsjflOVcvBREk1tS0Q7F/vpcL6X1wmW
         X14g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789459210; x=1790064010;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PW1ixTgxWimSTTjdthxgReSlmPLPKmDhq2QrwAvzdaI=;
        b=yKvrQB1OdMYekOTcWCB7F6CWzqwnP+DrgS23suzySAEeUfygyJ8CcBVOXKdCwX4Bwb
         4A2Bo4wV1QDHUS9pLDo5hgxxFjuddNGDVO0sSuLRJ3+HvqrTBR5m1SBUg8dbaVH9yPEp
         Hy01MFuTEbrTgkgJ4nL4gaKfx1I9tRXijrnZpRwabf5mLl6obZHQhl97LKjT9AYOcIOK
         8OkoDImKhSf218jlbmNYjuGiIEHWTMJ4gh/lyAzAjM3yPNIhXQInmhpjELi5i+6y9ih1
         NNMbh22BUnWAMoB+mwQD8piEaVHmCy6y3b5QtHrF46inqFO5myE8CWQi3dPg9OQshGcw
         VMQg==
X-Forwarded-Encrypted: i=1; AKwUvBxdGZQ942l94mm0Buyk3N9aaKejvGbESi+5Q5NJ9caVIrjlU8UiCOyIb800COhcFNIm9yNFprWCtEZD2Lg=@vger.kernel.org
X-Gm-Message-State: AFuF++mQIhiDZYt0175TCYvtir62EUIxKcGYBcoE33/lnQjBTKkGr/lb
	Hb/umL9oeY1QBzYFgGdw0Y2cFfMKyxRLLLMTZZPSWvB6jxfvOzTtZr9d
X-Gm-Gg: AYBFou38FlJzWDff0N1s5UV/HFd/aXPYoCqMxGLTm7DseuIZvKgYs0WYwc+uvYLwgNx
	brithNhHeynT79VkzIebQmMdBssUakLmK0Tp7YP7sFw+RcjJL2f/9phajqfZOJlUgSvkSDkOF7P
	GP/DMRPcE2SdwmRyQnim0p5YXv7l/nJUoBQlPdWCcm5foHJWL6xgMGcX40yXo4Fa6tRoUvKC07Q
	w5QPie/Q5HeiU2u4PgqjtNrYxe69LYt7sKB50Ud/U6+i8aZ97wZuLymXvbGGCfkPZuCaMLx2J1/
	VvY8x+jAnwj0Xj8+BJgFI9HWuUwqxvV+yk4ImLiarh7/p+yXI1xQ9IIuknVm0I+E2zDo6FipPBw
	k9QY2Fjf9MW+Yp1o87dHSYX3+ZTp+vr2b7r+MRJ2DSFHuyT+a5mT0vzo7hKKjZMxYWTIvgMpsgJ
	sOdsMLaSY5Odotqtyc8o0zyxwvaK5Vh1yGxAeD0NVS16eo3avIoYlLZdsuMef+ux0xHmWfnPo/+
	/OfeuCjz0aIuk+ov0A=
X-Received: by 2002:a05:600c:3548:b0:49e:6ac4:b76e with SMTP id 5b1f17b1804b1-49e822a6d43mr585075e9.30.1789459210180;
        Tue, 15 Sep 2026 01:00:10 -0700 (PDT)
Received: from fedora ([154.182.99.41])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e7d6bf4desm64112155e9.15.2026.09.15.01.00.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 01:00:09 -0700 (PDT)
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
Subject: [PATCH v7 1/3] staging: iio: adc: ad7816: Sort headers alphabetically
Date: Tue, 15 Sep 2026 10:59:37 +0300
Message-ID: <20260915075939.18180-2-abdelnasserhussein11@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260915075939.18180-1-abdelnasserhussein11@gmail.com>
References: <20260915075939.18180-1-abdelnasserhussein11@gmail.com>
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

