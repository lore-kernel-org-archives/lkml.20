Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6661395AE9
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 04:44:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792125885; cv=none; b=p/Cme3IVbv2aBghdIXl0QOTSzbda/jrTYP9qLSLR95O+LokvARvhDZq5j+nz4zjwR13uHbJp85HPXy0nGyxsII8/0fsM7pVelEq6mp0vDcZdHs6yw7CVkijOZneSajCsl24050ImQpyLxKR4XaDJadgS0r0MtuqfKbuRX6aOVw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792125885; c=relaxed/simple;
	bh=ajNNe8N9JiIi6z/58WHY+7M8wVOR51Ewnn5+zaGkgcc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uFwJRR8hlDFFs49ORlQrztbbcM/XRazSPuJpJLlQKFE57TQqCKxT/kT0Pxj17LJgC4ji3Tg7XkDcleOrNVd8VSh6tjFHzVHJAVXbE6TWfOWK86RvHM9JOc0u3VVh8AC2q4KoEzvXAZuHy4h1KZJhvQ42hnPlYOoZfGe2agtCCeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=gnSgr7/s; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="gnSgr7/s"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2e5fb79ce82so34700915ad.0
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 21:44:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1792125879; x=1792730679; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RdQPj6ORXxug2+szeCJ4g7yFuGdwCBNIowOh0yWYffM=;
        b=gnSgr7/sJ+UVRu8jDuOd1/M33qA/roX4i2kbAikmdS128wR75luq8MnFtoRnyjsf7s
         q8aCriKMRnXSaJI25uGhlarWInv5VIr78y7DBJY1Ff8UBE5RgmFfZpv70hXrYIYwzXyo
         erZhgHLTba9wX+O7/JyQbYzeKX3DJscTQBcPU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792125879; x=1792730679;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RdQPj6ORXxug2+szeCJ4g7yFuGdwCBNIowOh0yWYffM=;
        b=pugdCDmuaRpL5kLXjaif663eAk4cjf6K7GgGQK9ZpKoXvZOrzeNkhbJJioZKqUxprA
         DLIe9CbDzzAconIgqg1VNoLJxX68RY78Thpl9bYcGfhrjs0AkKRjvLZj7UHIQvNLAKSc
         576vjgq9a5zm4Q6EuLq+vhVVy6noc+YIcFCpbD9bNZV00u1YnWPJa97T6wDJGpvBpgqS
         uY79QbPY6luzN4gZ05NfOT34kI5WDe0ceUZzusYFrTIWHaqO+ZpQScf5t1S19Uh9eq0Q
         HQZ+oXrobRHSaL+8E0P3ZDqXuxpohRbvBfFwKlRLZGlcsL/G5AdXtdFC7Xb15MZhFczj
         PxeA==
X-Forwarded-Encrypted: i=1; AKwUvBxyTWJWhAcSwtyk/dXthw3KY9wsf9ABp4gKw6FP48sY50/sav/pI4onGyzAqAmtqqFjDF2d8oSMVsGfzUQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYI+j8aD/IePjPT2VsLfMb/oAPm64zLMaGOzYXK87wto7wKUhqdl
	j5ZpYAxO9HdqhfL/bVx88d89k15Gjb/pc3AE09yDAGkkyoK40cg5lSHRKE7q2aNeTw==
X-Gm-Gg: AYBFou3THmqfcfv9YEkaofYuWqM+lJ4AClRO853KFu2QmtiTvvsY0NxNxwrKVMVujX0
	SXOPNUEl5VvnLKXgeghUfPT39k/RmZkhgQcXPy7QCW98NucUyXio3q3WSPX0tQRnSQldH0+YaH2
	1FmK4Ite4T8snhvdyVRgGBwHpSIEIGtBvBYb222bkqiel2CYM2iDBUO35VYJ/yb2T4j1+dGcHTu
	ebOUHf1i8adt5hD2xxOrAugoKDLWkCyPGD0yIOztIRMR3C92wCODKCkktiYk+aJW9ql7OGdbdom
	k6ahdxryD+EvFol6pbJVo3txiu7ABO442pLGr0j0A1VHu8LY9hO5wECfjuGvRcisLv8bqsoSmcZ
	dlplrl3jdaaN4bdu4KuWOnOTWQoJE4xXD98RxFp+JgYK7E41Fqe7Rm74fl44fSekCfnvPDf2Q/w
	1721eUi/xHWyzDUVsxIlF1Vv0bbabBHNoGVDHsyGNkNXkZnP7ZY27GZVHvT3YbjVTKAD0rSVTqB
	ezksiG+wqFp+JKJZ6RCNGzjBZnbmJA/CdB6gQybLEWkQne+x94U1jXD5ZXGE1w=
X-Received: by 2002:a17:902:ef4f:b0:2e5:c563:c0dc with SMTP id d9443c01a7336-2e842cdb0f8mr195353235ad.42.1792125879042;
        Thu, 15 Oct 2026 21:44:39 -0700 (PDT)
Received: from tigeriii.tok.corp.google.com ([2a00:79e0:2031:6:a579:8b87:8304:7ac2])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e97e8b1b5esm4137235ad.67.2026.10.15.21.44.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 21:44:38 -0700 (PDT)
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
Subject: [PATCH v4 01/12] zram: prefix backends printk-s
Date: Fri, 16 Oct 2026 13:44:06 +0900
Message-ID: <20261016044429.1304561-2-senozhatsky@chromium.org>
X-Mailer: git-send-email 2.56.0.176.g3575e65682-goog
In-Reply-To: <20261016044429.1304561-1-senozhatsky@chromium.org>
References: <20261016044429.1304561-1-senozhatsky@chromium.org>
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

