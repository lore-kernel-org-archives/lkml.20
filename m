Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 555EC40DB38
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 16:26:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788020779; cv=none; b=nZiARaOOWuMEVgKejTOIvF1r/lWUUlVguuuo7/LmHPnlfhu5Rk+H4CHUmI+h8CLaYw+rD8NZ+Imn06s0UypOTKMNyu+c+x1qR/GPKFGBp6/zYvpTxxfIta2GLPzqFbppBT19g4PPdndht1FmAWpI1ykkdkOuW2OIHTIG9XPMyd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788020779; c=relaxed/simple;
	bh=5XLKjOzOTRwerZYjWQlSm0V6kefuJzxf5B3r7vswQh0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=e3mOhNt8GjfnSHgB0gyOK6n94wVoY8eEc9R3EhCNVwCZRrwLyMZv9YIojTY29M/USVSVED7Zc1ZQNbgcJYvYRlqdHAR+GFPD1TOsvYX6rGTnbE0khKqb96VHfDz85QfVh+b0Tk5OPoRGXaxqeZw9CJLIMoAiuqX7m5Y7rig5Jzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DKH9wMXP; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DKH9wMXP"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-499ae1c6471so15129075e9.3
        for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 09:26:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788020770; x=1788625570; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=l08v+DWhMTTHzUO00k+LB67tdNqKonKDnz7vF0UlhQU=;
        b=DKH9wMXPpAsByaapCenOkD2y6tQvWkKohy30a0Ug9AgpLeCq3IMVup4lQBD4fuxVk8
         x4hnHDWHxtYbrMYl2DLkHIaB/zdB1zc+/QN3DBhdh7cKxgH8dFY0obw+zcDhawx+DTi+
         t7dSlGy9hDbFO4OLMsPsZyT/oshOZHjJNjBhz5TTDEbu2qN3NIbYjy1ow7acCE0f5jXN
         IRekO3GjtETXu9DhquWXcnIEVIYTp7WSc2NeWuT4JxgsSqdpUnMm606/TrHUCunM8cRR
         CRBDtim4pedrqHJ4qk2RFYk/An4rWQ/F0qPpImGFF4K6dxe2/GreypfIYOZl7YlEwZ5x
         3tIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788020770; x=1788625570;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=l08v+DWhMTTHzUO00k+LB67tdNqKonKDnz7vF0UlhQU=;
        b=JtEL+J2HsxmeJVw3k5uMeXGlQnOjj2sjja49mSJ06TVxYITEHOGwmVSV05BLwN7DKC
         SBmwelkfdZUmvbBaEiUT2CGkepDDn1CDwkrro5ZovzEqCGLRzz6UAHpCkvu/TzXtvlaz
         myrVXbaHixO/On0VNcJEuQGUINHDdub3YdnxUmfSltpUr0yL3TOFq4SItZa/gAWzOrrU
         70Gp0H7UlyFBZdmrxY5e/ZrKsC7GQoiOsjCtex/K3iIr4r5+rW/s9ZEkOmUv//T6ZYQ/
         OzMC6l2++UYQ7FTgmswEKD88fLbQXMA/+KqYUdyt61vDIVTsQpvDnHkG9WVCk4uwXfOi
         L8oA==
X-Forwarded-Encrypted: i=1; AHgh+RorwUdnnKUyLVpZ0zeoAVcmlq1SzvhHSmXVuuAfkNP2zD6asyMHvN4eup97lFsknYDgYE/ZGgsgfKAXDI8=@vger.kernel.org
X-Gm-Message-State: AFuF++m9HVWLGg0c1eFMkbEopACE6oCloxFhgxS4PZpA/YwD+egiRAQH
	7Plfyavmls27pLLjyFbdmLOz57sTrvht8Z9uYiW+noctiJ1NWjTwtay6
X-Gm-Gg: AR+sD133Snk4TSTHQmOt7s++sb+OMS+6r7Fagr7EeoBk2WEO99n3upKyKN4OkiPeX9k
	gHr4y0U07s0HIzbn6DfCdff7JSLBJRUqCSxFCwCSZ7l+ED26QkH8ZvwJ6Lit6CImQ7HFq43ArSn
	WsdohlLvzPI6+2Y5RcgtPFZ222zhE7urtXCrc4MmmCWyF1/B8PyMA2hY/pLNVq4Nna4uRemHRza
	6sZwMNDMhy9nWeMk7zjLDVZhuZjBcQFy0fUpodwg1hQFClgeGsxPjHqg1Bw8iI9waNYPu8d54+8
	MZ/TifixuQCMdL/my/x3NsXFHBjXWrD3eIg4LuICCKCSJPVt6V9YqejpL/1gdlsuDo2duJ2Lxc2
	U9jWszM+bYotGnKQJJVQzO7k3Nw+1DEqvBOGSebSnySGfdY5jRlxJxtCjv+AKkdqSZMfQmteZ/C
	6HnnVvOxaZ8BvuKhKQl15QK1aFwjRua1OzX3ec/IBHOOJmqNvwTls9DAaPoR/9hpGLOA2oQc7cV
	SDU+jeCAtI/6G5PcPr7WJZV0ttouw9paUTxW7R9F3kstfPHoi3bah4Fvhbc3I5DgT5xdyvsS6vo
	DtBzeUGpQ6pvSpGxaRWpcEyUnKkXRk4XZYbgtkMvJxunnsqOkJgSsPpvWrsbaBYylGH/4pAwSnT
	+qLwCDwDyamlPP+PrflwR/N2XwxsCpd/CzNQ=
X-Received: by 2002:a05:600c:8b78:b0:49c:d27e:8f7c with SMTP id 5b1f17b1804b1-49cd27e903fmr6656045e9.12.1788020770370;
        Sat, 29 Aug 2026 09:26:10 -0700 (PDT)
Received: from [192.168.1.187] ([2a02:8308:4092:11f0::f9f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b92679be5sm137861705e9.3.2026.08.29.09.26.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Aug 2026 09:26:09 -0700 (PDT)
From: Joshua Crofts <joshua.crofts1@gmail.com>
Date: Sat, 29 Aug 2026 18:26:04 +0200
Subject: [PATCH v2 07/11] iio: temperature: tmp117: make headers conform to
 IWYU
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260829-kernel-header-removal-v2-7-c67739d5dedf@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788020764; l=1060;
 i=joshua.crofts1@gmail.com; s=20260530; h=from:subject:message-id;
 bh=5XLKjOzOTRwerZYjWQlSm0V6kefuJzxf5B3r7vswQh0=;
 b=KhNpn5GKI54v//aKPafQ95S+K8LINVDHiNSdFVhlL3menW+5WXGDeN3y9PDnNgALHMn4eDGQn
 py9KRU/hXYzC7YpK9qVTWyn+Y93VIBo5EXSRBjsiIG8DH0M55jVLQ14
X-Developer-Key: i=joshua.crofts1@gmail.com; a=ed25519;
 pk=RTDOoVwgeL4oFdASj9U+cxJuIjXuXk73zkjnGOJKbEo=

Remove the catch-all kernel.h header and add the missing
<linux/dev_printk.h> header to enforce IWYU.

Signed-off-by: Joshua Crofts <joshua.crofts1@gmail.com>
---
Header changes explained:
Added:
- <linux/dev_printk.h>: for dev_err(), dev_info(), etc.
- <linux/minmax.h>: for min/max limit macros
Removed:
- <linux/kernel.h>: catch-all header no longer needed
---
 drivers/iio/temperature/tmp117.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/iio/temperature/tmp117.c b/drivers/iio/temperature/tmp117.c
index fed8af2d81eb..25bc98e64e48 100644
--- a/drivers/iio/temperature/tmp117.c
+++ b/drivers/iio/temperature/tmp117.c
@@ -12,10 +12,11 @@
 #include <linux/array_size.h>
 #include <linux/bitops.h>
 #include <linux/delay.h>
+#include <linux/dev_printk.h>
 #include <linux/err.h>
 #include <linux/i2c.h>
-#include <linux/kernel.h>
 #include <linux/limits.h>
+#include <linux/minmax.h>
 #include <linux/module.h>
 #include <linux/property.h>
 #include <linux/regulator/consumer.h>

-- 
2.55.0

