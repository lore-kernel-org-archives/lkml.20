Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6C3C38E10C
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 21:13:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788210833; cv=none; b=MrygdtYvvvuGO6GLXx8FVQMjgvUY6/ID4f3KuPLUcdmItKqdgl5Et1ii9x6rKbEWAkxpPWN1ibr03k+TcOiis467ZOZjDTghTrDdutNTrH2yNX8KSVXXp72o0SWkc8+98jnS7AB4nyv+oB/KeJfRF2SfEJNnMVBIrKOokRPjcmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788210833; c=relaxed/simple;
	bh=HXABlvbovapo8X5ULjVoUp05rLGCvcH7Hwv2idfGruc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Fw3wfnE0ldbW2FwboU+lqwPt5xKv2F20CwpLdYtpdCowr4c62iWdUCPgmor1O5Z5Oh4fgEopybRZdjIjX/JmRiGI8I2Gk3+mm7on8EW4ZsqkFUCP2Z1mcDB+yTZ5npjk8fgAq/LgblSLnXGU6h4ii7d3vI7nWc0Hp+sTpzW09IM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qtxwB1+N; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qtxwB1+N"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-49ccfbe062eso19828145e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 14:13:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788210830; x=1788815630; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QkSPzkNePAAObmivPyMjVU/afPEpN4pzFimu9a853YI=;
        b=qtxwB1+NeJBNP5+t9FaPgwDqXH1SvCIYoMXZd1zWRTB9l5FrbZ1Bj2ocoE+I6csavX
         fd+MmCKGO2q8BLSN1bTsIyealVCBkBRpFx5yaqdN0CShUKziIZR5vKEwbZHSY9ED2Twq
         P7sm0WUoSb6nJjB3VSP26CfiWOy856rnmV/ujNUxj2UcwXZnoQGMZ+L8DWtYabZpRVSU
         8RrB68YSLRRsf3eZ4Ymh+h2vbdhrp0+beGcQeaayCQnRXACkfCc71Hw8ctl/LbBklB4c
         +A8Jb7fXzwgjqmInLxxqo7jlJPjY7XjWvB+KbRLPZSwKztMuNziRBMNUItYOXvR6Bfwz
         cblA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788210830; x=1788815630;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QkSPzkNePAAObmivPyMjVU/afPEpN4pzFimu9a853YI=;
        b=YsA1fTAL5D1usNQVO164ffy1s10HINtbQraO0svawTWcUws9XX+zwWGqhVSjc6VvF2
         RZg+EOB2aC4FmHj4daK0TSMXT/WdqVgHflb0HWTiVVD2zxs3kGP9WT24yNh/uL3A3ulK
         2s66zTRhpYXaRnAknS427U/bZb7i5dkaNLOa4or4NERP33ytu3nr9HzueXWUInZ5V0mV
         LOaRhjZxdVjtPJ/8wEhLyXvvrqtMKU4NqVw5+niQl/qqMalWy4HNsVBn3Bwu63YbMFxm
         8lgbZLh8sUDKi/5IzLZUvkKXElPHHeCYF4/ut63qdFvvFeKepsOLVpnUIWGqJ6b9h6iQ
         7yEw==
X-Forwarded-Encrypted: i=1; AHgh+RqooIvKtlYjjVFdSeJSGz2ugLEAtBcBVmdXeLqOQ0c13CzpwTQmsjNMavxE1s3SjF5SItC/gClqoJhyRcY=@vger.kernel.org
X-Gm-Message-State: AFuF++nJA2k3W80NFhytunZ7oPAimcz5eMJMP4Bwk1YC31vJy0KsoKnf
	g+JMPlsfLGRQZcVnyIwi9SI+CWpnLYkaj3Yt/Y0w1WZS6sIH7z2QKJHk
X-Gm-Gg: AR+sD10akc20DzFTOwXEgBwK2qmA8AXq20O/q91RUmUUqeru1RSTB080p2OzuJwwbNw
	O+jmPUuKMsJ7qBnOmjbDxaHOsymzNEoFxaf8eEaOH1gXXLSgy73lUDK8amnSwQiUKuKzeMm2xQl
	Th4kjg51Lv9gCraHS2kfeZhvbE1qEbBFTPUlLj2rhr15yn1p0kN1k3dRP8SRODADa/o9r3GiaUw
	SXedpC3ZkoIywxqJJjvxUsAZqKMjwBNL/WrijhG/4L5Us/NrskA3SgtYcI7Fgis+C1k5qcAD05K
	BmvBQupyte8CQ4hFytzAmwSrOeiCphC5BHbbFmKvkUkoDnR9OzOHxN/GSzShM3ZleuCR95AR5eS
	3P0E5BV+FEDosnE2i9wvMJrlJPjMb1ciociEI87wLEFxHWqzqRNHUX2btyTkC3CqlKLJliTiP6o
	iLSwpbpe6OYtSNqbLZp37A+hXECfoo1gsYCD48s7Hiltp+06uWA2druDvIXpdpfbGqCPYSOKin7
	l4mAK8nLjwrlOsf2ML1nVH53ARq/c+v05uvSRNP19HmuPLA6/9SJox6EALJnk1pi7qnNq82quia
	stlBLH9LO/RIGsQAOer5FoEsCebET+ug5t+9iU34+e0hfIrJmwxqVBCWJeW1cwV9+59Fg2fgh4h
	0rDd080RFBA1nPCaIc035bf/p
X-Received: by 2002:a05:600c:c494:b0:499:8aff:59b6 with SMTP id 5b1f17b1804b1-49b91c486c3mr361162565e9.14.1788210829843;
        Mon, 31 Aug 2026 14:13:49 -0700 (PDT)
Received: from [192.168.1.187] ([2a02:8308:4092:11f0::f9f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cdce1754csm17695925e9.10.2026.08.31.14.13.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 14:13:49 -0700 (PDT)
From: Joshua Crofts <joshua.crofts1@gmail.com>
Date: Mon, 31 Aug 2026 23:13:38 +0200
Subject: [PATCH v2 08/11] iio: temperature: tsys01: reorder headers
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260831-kernel-header-removal-v2-8-b92b580ef5eb@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788210819; l=1038;
 i=joshua.crofts1@gmail.com; s=20260530; h=from:subject:message-id;
 bh=HXABlvbovapo8X5ULjVoUp05rLGCvcH7Hwv2idfGruc=;
 b=jW+8VHxUen/pme45o0CJauIjkEOZLcZ/pytVtjDREqo30I6sc8zb2/ZuQXdoD2Tak7ru0fGbI
 402OJX1QKRdAEee4RQGPryGtN3mniUeP2QHNECe7dmr2bHNH4lV3fTb
X-Developer-Key: i=joshua.crofts1@gmail.com; a=ed25519;
 pk=RTDOoVwgeL4oFdASj9U+cxJuIjXuXk73zkjnGOJKbEo=

Sort the headers alphabetically and group the IIO headers and vendor
specific header separately.

No functional change.

Signed-off-by: Joshua Crofts <joshua.crofts1@gmail.com>
---
 drivers/iio/temperature/tsys01.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/iio/temperature/tsys01.c b/drivers/iio/temperature/tsys01.c
index 28b3ce022ce7..14de67ee8be7 100644
--- a/drivers/iio/temperature/tsys01.c
+++ b/drivers/iio/temperature/tsys01.c
@@ -8,14 +8,16 @@
  *  http://www.meas-spec.com/downloads/TSYS01_Digital_Temperature_Sensor.pdf
  */
 
-#include <linux/iio/iio.h>
-#include <linux/iio/sysfs.h>
 #include <linux/device.h>
-#include <linux/mutex.h>
-#include <linux/module.h>
 #include <linux/init.h>
 #include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
 #include <linux/stat.h>
+
+#include <linux/iio/iio.h>
+#include <linux/iio/sysfs.h>
+
 #include "../common/ms_sensors/ms_sensors_i2c.h"
 
 /* TSYS01 Commands */

-- 
2.55.0

