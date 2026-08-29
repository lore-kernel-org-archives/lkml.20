Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFD96408626
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 16:26:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788020775; cv=none; b=B0BeNmo9uBCuJw/9OjV8Zkwz3SQI8yCDwTjgdysfu2VkBEWipxkqHX3Qvu5h5e0QDsMe87Zr8IgtRsptbqgl62OYWIHEpJUVBKX2QKYcfjw3dUvxdekbgAf0J1eW245D/oq7mad+hg3rfFQfXGc3Odf1VMKI7owcXKHapUhBTMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788020775; c=relaxed/simple;
	bh=lZ538xn0MusE4k1KK9y0lCXK70e6dTvhVB099UUkj2Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GiJ20A/+ERBfz5VgDv5MSq2SVOvJQ2DyS1PNfK+EnGv/m3EIDq3jhiE0kMPzKedL9BouVCDDqj9j96n5ocRgAH5foasrYK6E1WzIXJMOY2lyrDcG6SgfMHj6+6d5zpmsJshB/XiagFhnhXJAnYiFPEByFDVPYDvFsXVkBq30UYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Hvb64mpL; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hvb64mpL"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-49b0dd3c9a0so14541755e9.1
        for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 09:26:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788020769; x=1788625569; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6IX/mr1AWyIWzkY9+da9P64x4UyMMvD+KxSqNh+tYjc=;
        b=Hvb64mpLmpjyPbijJ4POS3Ks0/861kEzju8WU6bRwhdAYee1kvZPq2fiNUdkX1htDt
         93b25dJQXcC6L2HZqBC2m8EMM048X6xPszEBwWLHGtzpzd0lFM6LEv8CWJOG24dWd+pO
         MlxVyZNy+kKd0ajHNOOV+r/2GmsZbV+8/GCzs9tjAGewAtQjQo7izMa5JkNycWJM00p4
         CMuDAnoJNneD2TOJShaNstrcVdO6bAE705EvL5mhmO+HIOmHfPaj3ZKgm7U9RJ1AKnsB
         khDiVvzZpz6XfEdqcylQv+JzsQaLO+XSQSDLbtzyJK4NF0nllpWFSLo1FTBwDs2tVC4l
         Gw9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788020769; x=1788625569;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6IX/mr1AWyIWzkY9+da9P64x4UyMMvD+KxSqNh+tYjc=;
        b=IY5VmsofWovYnKqaUt6U33UsKfncugDjdR1FuDSvZFeb0q2qJ9TAOhymVC/NL0d3Is
         p6rxjIScBPedazTdMpAf6nw3C8RcYGetEQrhFOkGXF+8Kqs6L3UgHx66kH757QKTpIzN
         JMzZUv4F4P3jEKCycnRiy7Iq0BmndeiwLdTRwpnN68uFJhz5juvPRek0Lg0d6T6gwaLQ
         ijxqEC9jjAStuWo9iMwy0JC3XyS04Ylk/ghDfBG7Ymb1+oyFV90d515pt7uEgaB9RFD5
         W6tT1vkbY+XcNlYUjoJgeRgf9sYHP1Dw5m0Jpp1tDN2q6oMHJENXtG27nFMtT1s3Lelv
         ZwmQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq0LECzT+1y9HpsAaQfcwQ/lUwGHj/UPY9yIGd4BzbZu4Al0H6oR+ShTBeLmKFpPMiOMJ3CtqQ3Le5i1K8=@vger.kernel.org
X-Gm-Message-State: AFuF++k+2qtUmxPOgJ4mc+sTOO6MdPpCjcCw+NkWdKOq69h5Lsl6wYJh
	5GYlTS9O0Lo2D3Q08qAuAlhtv7O385xzqlSj7PKTOd3Y44LzUhyaV/28
X-Gm-Gg: AR+sD10q2rNdh7dWcYS7ZUpVy37qSejKNHh79HJtk3cL+Q+8vNH0fIGrdNG5ANLwTs6
	CQGTBJXtgwaQhuqxegftWtpW1KIRdH+RIMPy+2Yoy32QxnluUp8TeFnZjFjnffwzRSevxS+K387
	y3XwADV4jCKluMlGBTBY5L14fHyEo0QSO8FIdLqyBgxDjo7FNzBS0oTKR1eap4HnDjDXjOw9tLP
	2+T3m12UWX77+GiBFs4eFf3p01huwJZV01G1ceocX3B4HgSxn4YM8KBKBeM2PSLaQVoETPZl/Pe
	KD1i4xHcLVEEoMJtGa0Tqu6oQD08lLHUEF38EkSJpKfTcmbMyHWpJsDPZr6GuSRE5+xwQuO7M/N
	exz7CJydkBHkBZCq72cmwGpkECi+wuLAK8Q9pll/0wLftdb1MD9CFvYjs32svCmnsgkRKhRXORE
	lez9wkCpPbRNEjXVHgF6DO1SH16w/roWV8i0QLPOAFMn1UAGAwE4rO0+kX8aJWC5wsu7fK6eGw9
	ZRUJsKUi0xnJCBMm0wnuxLA09BlfsNeKPAUd3A7bJFiqfXZGAVvUyztwCPsoMMF7HB0Vz2MH3vm
	4jusX5CCEkH276iQbYbrt6bj7IqFOWvJzPKvFhh9Vz0nXOHcaB1Uaxj8w6o9LVSQE68r/sPyARF
	R2asNYDp7tThtvpvC+umJF3vV
X-Received: by 2002:a05:600c:4715:b0:499:cd34:f7c with SMTP id 5b1f17b1804b1-49b91c26a01mr216943995e9.5.1788020768754;
        Sat, 29 Aug 2026 09:26:08 -0700 (PDT)
Received: from [192.168.1.187] ([2a02:8308:4092:11f0::f9f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b92679be5sm137861705e9.3.2026.08.29.09.26.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Aug 2026 09:26:08 -0700 (PDT)
From: Joshua Crofts <joshua.crofts1@gmail.com>
Date: Sat, 29 Aug 2026 18:26:02 +0200
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
Message-Id: <20260829-kernel-header-removal-v2-5-c67739d5dedf@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788020764; l=1772;
 i=joshua.crofts1@gmail.com; s=20260530; h=from:subject:message-id;
 bh=lZ538xn0MusE4k1KK9y0lCXK70e6dTvhVB099UUkj2Q=;
 b=eFx0TE8GgE6L2NdWf8apa0VbzmT1NVPo//tqIe/7pYiIUspmmT0mifu9c8FzKbqlzP6Ep09e6
 egK4ZvWF5HEDz2zmYsP+7fo5M+nm41c6AS/Q3VLnNh9Cd8lEXOnKl6e
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

