Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 387873D9552
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 03:51:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792295498; cv=none; b=ZcXVHdhWzr6Vm+TwWjbBCe57koQWOV+oqNVUQgIdrgVntHrWuMvxNoBX16l5BP+u830I0Dtphqh17CKogTPjcQki6irycA6SKoykuyTX0XDcaOACJgQcVKtefvy2EwLUlLtywppFI72XoON/4jMxC9MAGUxGSa1mIfyjBYdg5Xg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792295498; c=relaxed/simple;
	bh=ajNNe8N9JiIi6z/58WHY+7M8wVOR51Ewnn5+zaGkgcc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iDBhCd1cFOK0syd62A4bOckvBUrvMpF3o8j2DCcup8GgIAvuxD9+wTv6Bp8nZzdKO6kyncuk7tllTlOHf58pJvgXh19g63NXKWrveWmVk1FviOM7BrBkdwto79z1euO2vieaFFUmjI4ezPckVtxMqRIAJkahxTnRIpC15fc+g7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=nepzn37c; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="nepzn37c"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-38ec1402b05so753520a91.2
        for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 20:51:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1792295496; x=1792900296; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RdQPj6ORXxug2+szeCJ4g7yFuGdwCBNIowOh0yWYffM=;
        b=nepzn37c/f6mEOdKvCodJn9AXFLGSAtcVZdZN0XmdAiqGMaft6Nb7N1ujGAg9Le3du
         BLS5bMDKRxwhKif+NtyaVOKebNOZWMosg3DeNn7e7oekqOHvHBvPRrxJc4BMeNnoEA4z
         4ZbH8jL0NvXf7VTXtSF5hiMFLK41pv3336104=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792295496; x=1792900296;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RdQPj6ORXxug2+szeCJ4g7yFuGdwCBNIowOh0yWYffM=;
        b=IA26L5JPEUPqRAMWVi/mw/4GA8Ikkml+Kf6GPDJTRpgwY49/yzwxc3Q3+dRXSjDr5r
         7rdBddGbEdYMiJmx0wnYkLVtxJUxfYrr18yPlaYkuQP+JNHhGpBtEIhWmcWbzd/FL7sd
         6pgAWbkCNGGz7v4m8aY+R91YOpNQsRjjU7x/3lIx62N65uKz2DxZ25HOuWHNIYxy4kc/
         13ZIN9sLTXcNYsCTtAArsIc9WLR5DT9i/x+EnojjrRF8QjCMKsh0kxxqHqF4vRnzFmWJ
         ESPSLmpWFlAcU4I4UKld/3lnNcsfGjtTvLxK3CV3oN3ivZbSB5bqG9RW0pvwkFvV8oPL
         vHgw==
X-Forwarded-Encrypted: i=1; AKwUvBy4wKKiD7T6MSNINzM2CpHU3Bmo+QMk3mTmyDscEfmk+XSLTOh9rUAcdlI6W/IQ9tdaABkG7wbdXbkcAOY=@vger.kernel.org
X-Gm-Message-State: AFq9FYKecX2rZIF2MTMn2xQl4EoR+Obg6J5nLC/Npq2e1tGOPwlfzTEM
	sEhVvoHfBARcgvt0ModAz6+aSCfP5Gjy+dSCgsf88kP2TRWeZEzKlc/Og/MEllfSXg==
X-Gm-Gg: AYBFou3aFuf7UkDUfGWaT6PDVZ6IRMtBB7qy9GW0ccZtfk/KKCQ7t2qxR4Wut4Plvcn
	anb0QeDo5MZibVhDRT9jo2Plt/q+XQsa1ymqBOhY3LR4V7wWVVYJ6eYna6/jvXJf4E6u/ioPEm1
	GTbHbb5HEiazjNYbluFXRCG9EqOrJz6XTjm8wgHLNbbu3m3lxr88Npn9V5/q8GD5X8oVbRSAclI
	5WJO+dVZ4W/0BN4gWE2xdOKgnLKz/unzoUTGyRVHXRvQuh8Z/yV/rzQkxMXfZAAyL8TUPVvVKLL
	R3wl2IYhUiwLn0Fe+gafIIYTezMJLPIHCLBLdWExMPGEbStFiPK4JsfwEWnB3xKz6PZ3UjqEXtj
	rsGuggM91Si3MeLtWFkjDo2seNJuK35IIsKj/lExC06CDQvwDvu37mtVHqWaTH29T2vENZngr58
	qWe4EBtPER8Zm+264CAZz32wdg4b52FMaQNkOGoBzM1oykljuDrKv9WI7hGMnybsu4QAnReQagZ
	YBZ2ecC2+f0s3a5IDFGX76Mg+nf5FvVMqBluhuDW6zJyHIuP/JVfmM/+5y+gsA=
X-Received: by 2002:a17:90b:390f:b0:3ac:8897:7ba5 with SMTP id 98e67ed59e1d1-3acef5f5bd8mr3660899a91.59.1792295496583;
        Sat, 17 Oct 2026 20:51:36 -0700 (PDT)
Received: from tigeriii.tok.corp.google.com ([2a00:79e0:2031:6:4569:b311:f3ea:5f8d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ad25d5d1b4sm253024a91.16.2026.10.17.20.51.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 20:51:36 -0700 (PDT)
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Brian Geffon <bgeffon@google.com>,
	Barry Song <baohua@kernel.org>,
	Bo Zhang <zhangbo0325@gmail.com>,
	Minchan Kim <minchan@kernel.org>,
	Richard Chang <richardycc@google.com>,
	linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org,
	linux-mm@kvack.org,
	Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: [PATCH v5 01/13] zram: prefix backends printk-s
Date: Sun, 18 Oct 2026 12:51:03 +0900
Message-ID: <20261018035125.3120704-2-senozhatsky@chromium.org>
X-Mailer: git-send-email 2.56.0.176.g3575e65682-goog
In-Reply-To: <20261018035125.3120704-1-senozhatsky@chromium.org>
References: <20261018035125.3120704-1-senozhatsky@chromium.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently, zram backends prefix printk-s with their
names, which may look a little confusing, e.g.
"zstd: alloc size 408128".  In addition, prefix
backend names with "zram:" so it's clear that the
message is coming from a zram backend.

Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
---
 drivers/block/zram/backend_842.c     | 2 +-
 drivers/block/zram/backend_deflate.c | 2 +-
 drivers/block/zram/backend_lz4.c     | 2 +-
 drivers/block/zram/backend_lz4hc.c   | 2 +-
 drivers/block/zram/backend_lzo.c     | 2 +-
 drivers/block/zram/backend_lzorle.c  | 2 +-
 drivers/block/zram/backend_zstd.c    | 2 +-
 7 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/block/zram/backend_842.c b/drivers/block/zram/backend_842.c
index 3846a04c69d7..56ffda201727 100644
--- a/drivers/block/zram/backend_842.c
+++ b/drivers/block/zram/backend_842.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
 
-#define pr_fmt(fmt) "842: " fmt
+#define pr_fmt(fmt) "zram: 842: " fmt
 
 #include <linux/kernel.h>
 #include <linux/slab.h>
diff --git a/drivers/block/zram/backend_deflate.c b/drivers/block/zram/backend_deflate.c
index f71b11bcac78..20685aca9bdc 100644
--- a/drivers/block/zram/backend_deflate.c
+++ b/drivers/block/zram/backend_deflate.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
 
-#define pr_fmt(fmt) "deflate: " fmt
+#define pr_fmt(fmt) "zram: deflate: " fmt
 
 #include <linux/kernel.h>
 #include <linux/slab.h>
diff --git a/drivers/block/zram/backend_lz4.c b/drivers/block/zram/backend_lz4.c
index 1e4ad31d39a6..158fd8b5e8a9 100644
--- a/drivers/block/zram/backend_lz4.c
+++ b/drivers/block/zram/backend_lz4.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
 
-#define pr_fmt(fmt) "lz4: " fmt
+#define pr_fmt(fmt) "zram: lz4: " fmt
 
 #include <linux/kernel.h>
 #include <linux/lz4.h>
diff --git a/drivers/block/zram/backend_lz4hc.c b/drivers/block/zram/backend_lz4hc.c
index d8aa01bb258f..5c009835a684 100644
--- a/drivers/block/zram/backend_lz4hc.c
+++ b/drivers/block/zram/backend_lz4hc.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
 
-#define pr_fmt(fmt) "lz4hc: " fmt
+#define pr_fmt(fmt) "zram: lz4hc: " fmt
 
 #include <linux/kernel.h>
 #include <linux/lz4.h>
diff --git a/drivers/block/zram/backend_lzo.c b/drivers/block/zram/backend_lzo.c
index d83f92cf757c..78538479c511 100644
--- a/drivers/block/zram/backend_lzo.c
+++ b/drivers/block/zram/backend_lzo.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
 
-#define pr_fmt(fmt) "lzo: " fmt
+#define pr_fmt(fmt) "zram: lzo: " fmt
 
 #include <linux/kernel.h>
 #include <linux/slab.h>
diff --git a/drivers/block/zram/backend_lzorle.c b/drivers/block/zram/backend_lzorle.c
index 1b120d062c92..011787f1430b 100644
--- a/drivers/block/zram/backend_lzorle.c
+++ b/drivers/block/zram/backend_lzorle.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
 
-#define pr_fmt(fmt) "lzo-rle: " fmt
+#define pr_fmt(fmt) "zram: lzo-rle: " fmt
 
 #include <linux/kernel.h>
 #include <linux/slab.h>
diff --git a/drivers/block/zram/backend_zstd.c b/drivers/block/zram/backend_zstd.c
index 08da3810cffd..127976b5455b 100644
--- a/drivers/block/zram/backend_zstd.c
+++ b/drivers/block/zram/backend_zstd.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
 
-#define pr_fmt(fmt) "zstd: " fmt
+#define pr_fmt(fmt) "zram: zstd: " fmt
 
 #include <linux/kernel.h>
 #include <linux/slab.h>
-- 
2.56.0.176.g3575e65682-goog

