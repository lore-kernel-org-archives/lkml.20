Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01A8C3A7858
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 21:13:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788210832; cv=none; b=APGB9NZOSRE+tkuA00bBY+3rRhlpaNhEt15ngyDbNbl7fx1dZ44ByiZrdHRQW6cXrbNNPwwEGvp0kVPzpfuOEcZsH4cF9DnXBaJJk+v2M05+bQ54WiKEKDiDtL3WoZb8NziOdz/Y9/DXa56qx1rE1VYKOS6GoJv7ar6/Csp5smc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788210832; c=relaxed/simple;
	bh=5XLKjOzOTRwerZYjWQlSm0V6kefuJzxf5B3r7vswQh0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cM8CJsmugku4K833hNPFM0puKoUe3eivKcF2UkrHE08szEd5dGQwM5TGDi/3VCRcGC6YKQqXMfEEfRVvgkFPc4dqpOBNDNzZ0XvQrO8bs3+GIUa5TeWKXs7foKc/OB3MOwpUwdRK7ykWt8Of1PBQ5+KdyUpJgPQ2S8Gw+rxu2dI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B7Hcywt8; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B7Hcywt8"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-49b0eab380eso3702915e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 14:13:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788210829; x=1788815629; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=l08v+DWhMTTHzUO00k+LB67tdNqKonKDnz7vF0UlhQU=;
        b=B7Hcywt8xoHVksyPKHAo0XMxL/hmvs/sweidDBMA3A1/x8JQY5LtSCf9ElRTBy0Vyy
         ML33WBaiD0amh5BBAWrMo9Xo1eBhvUWBD7Ka9LBUDIk4HejYkboF+5cZjFj7YeO4AWck
         0881gMKGUOX0B2NtEltXBy7/dCHgzf3jD2/ebJ7sTy9UzkxTQDa1pP3W9uh1805ZNh8c
         uX7YoL/C1rciho2B05B1jR5e9hkP1JmGWQAyvInAOuZAZxF5EdGnbLhFLtiCswBHeXdP
         bLYGjKjAYt01ct8QRHvnhjPv0OdvWJkQlPIW1DYxxkXE4l0oFeSKedMSXwpUj8/qiWfC
         L47g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788210829; x=1788815629;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=l08v+DWhMTTHzUO00k+LB67tdNqKonKDnz7vF0UlhQU=;
        b=T23GKpb5fOZBAEjg67OTAS18sf5Kex4AIOi2jC7YB+sm7GNkv/FN3FxcGUyVMlmHnB
         VpLwC7AFfmBKn5m/52tEUQ7C43P/jFRb83HZdZalvojoA+RbnGMh+XkjJLTG4Hen2dMa
         ehbK7Pi/r35C0vAHOoOmW0n9HBc2pxG/KuiiUb+ko1ypzUKyMLJ3rdPnCQfncSNCn0p8
         2e99oec+gYMJfu7tKFvDjkXfC/slpHnbOv2KqL3KoMC9mqxX+BnrSriuOe0f7wCevESl
         hiOUHFha+X4i0AdmYuA3Cd4ikxovkg3nr5a9RMLT06Qd82jjluG3IvrstpwvbXzCaU0x
         MU1w==
X-Forwarded-Encrypted: i=1; AHgh+Rqcx08E7tPk7/b4NCiCjL9wGY/G8ApjQHXMxBornwyPC2uBX3d6WC8r6FXIkbyvDyKsudl7wl3pRfY8C1E=@vger.kernel.org
X-Gm-Message-State: AFuF++kwOTdxSoJ309kMDKb8TLYJK5PKWMMsKA/q0TTVL2s0p6VF98nC
	vt8A9tOCtH3bx3hPOZOGRe2XTKVbUfWLiLCZrC2wDO/YuFkAV8CfXGFa
X-Gm-Gg: AR+sD11UsjzlBojsDnhbHUlKrUrn+D9owZEVMXQoJ/XLNq6ptpRixLTGEr+upFo9LNN
	y7bfQZEpjkGWl/4fU5fcD8o2PqSYUEDhWCnizFr6/8NvKkbDOV9BQjFB8bQMGoXFEsng56HlNjm
	IfdRe1Zg0qdhEdtOwt/seYPiy6fDrM7BNWHC+VOO+1wMZCXWiIPkyqD2XBInZ2PuoLvc8uak5Wl
	0/VeF7PIopJoZmvjviOFoKYhcnYAUlv/HDpl6GJCc0dZcq4fMyBGeI7x9K/ow26kp5MG4CcutBl
	GC17cGWpx7Fgqx4BR+v5Q/TOS99DA3bBjlv95CzytvUI9wvuwCIoHm8caBnEnoQgmvk1Niwm7kB
	6MHC3Rwu1Lz1Sdg7H7MI+hbGi3CNjlz1H5MrKJq9syk/tcE78Mpx5Npt/I31xrBKwGH2LdocJqM
	BpkLRAeLOp5IdT3fmTmRznfasPiGwiVtyWwBvNNFkuJ5+YY2IUsFynv/BUCwI8sXN9s4mbENcCg
	3IkMiUYvFi0Tj9hETpGx8wSTm1tDAluzxNurgagmWkQHkVwbVYzdaJ9nU+N1gpdZWFjsWQO3P2e
	YK6BmgIe9YkSVDuQtqh6cSNIgapzCGkksZYjMHE6sXedyCUYnLPgbXM8WeNVdckf3k/f58Y/ayJ
	6DntARIFvdWF5O90g57LQOI4UXkgY46N7fkk=
X-Received: by 2002:a05:600c:3556:b0:495:5d6d:9cc1 with SMTP id 5b1f17b1804b1-49cdd3be8a4mr13416825e9.0.1788210828882;
        Mon, 31 Aug 2026 14:13:48 -0700 (PDT)
Received: from [192.168.1.187] ([2a02:8308:4092:11f0::f9f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cdce1754csm17695925e9.10.2026.08.31.14.13.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 14:13:48 -0700 (PDT)
From: Joshua Crofts <joshua.crofts1@gmail.com>
Date: Mon, 31 Aug 2026 23:13:37 +0200
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
Message-Id: <20260831-kernel-header-removal-v2-7-b92b580ef5eb@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788210819; l=1060;
 i=joshua.crofts1@gmail.com; s=20260530; h=from:subject:message-id;
 bh=5XLKjOzOTRwerZYjWQlSm0V6kefuJzxf5B3r7vswQh0=;
 b=nIPIsBHN3LFcK6bhKd4eld/6bSVD1bfvwP5GN0lIuTQFyPwJUSgUPByKvyuo9mryDqqwM5+nW
 IycpG0CwQcMDdw0oeiwHsYiqbuPueT1Uw3l5fu23EuovZytTBivs67R
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

