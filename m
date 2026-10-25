Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792894729;
	b=wJs18OJqeOKnVau1Hi+iH5PONMxfx/ES/xiBpgX3W4Ef4YhlrcCAbxjmtdKkLQyd9xN9
	 2FDK38VPOAYktbHnsxj6/ZjaMn8quiU+82PahvVeoXZI/0d6gWPX+0mhuwMj1KY5VIXyN
	 DQkYGMnAOxdeoG4+6Qp61uxgc/MqZY1Zw8vS9yw5uw9k7HhzzOraIdtpMKeagpp9SRZL5
	 isx63evSsQJon/07fBx22mVuNY7hRUM21uWhbgjmbwxG/jvr8o2u9+mi1YSjN3dadSc55
	 PwQgRT0mm864KENkwh8i6CW36rUX6UoWeTlUGwxoeKV91WBBmexYWYZ3RCQ1sE2H7+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792894729;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=NBoVZyDPXGY96HrSU5SgYmE9fzVyxsjGoqNqHA/swwo=;
	b=RTBRicNaqEeXwJXv4hCN9rwGRXt2gf/B6Q/uoFivjDyLLrLEuU+NlphCWnbvxTt3b+QN
	 qsJKNYtXPUKisYGgOYelBsZ96OccnkslPWb6YttMRhwHc/jOhvKtpEQtqD07t+9hqyVE8
	 qFYroTastzUrB9DagWDga0K7gYjMDxAaInbPKSvXbSj8iNAX9xnTBvH26ZT+mMbzKRvZp
	 vpRisbWsRXPEjPyCPTsMlYHWyQ9hEbPTHz4yXmW4UONIjQ1c86Ad9l04M8ttsqA0y6vLg
	 DMw5q8SBYv94wDGl+5orZBsChEEVpheDY5aQyBga1+sVOLFmm4/RocIjz55fpShw+og==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=OZWr6MtV;
	arc=none smtp.remote-ip=74.125.82.46
Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D553606A32D
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 02:18:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9D553606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=OZWr6MtV
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-188406bb948so1552192c88.1
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 19:18:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1792894728; x=1793499528; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NBoVZyDPXGY96HrSU5SgYmE9fzVyxsjGoqNqHA/swwo=;
        b=OZWr6MtVxYIekC6jpt4qnYPVPmMpV48f5xrif0uULFSdKg99waiKjeBz/xpENBPIv5
         JecxjBxMhE7P2PilFyu93gWg2dQZmy47Qo1j/uhvXiK4zuR3mekgNeGHCF1rSu21bjVo
         vyBeJunqxL8o1zuMD2Mzw5D3tFb7kAOgnFwVQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792894728; x=1793499528;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NBoVZyDPXGY96HrSU5SgYmE9fzVyxsjGoqNqHA/swwo=;
        b=dHjqRXQMWweIMAIgR2Kpts9pTew7fg/WxFZS9BlIv96Y94kTIa8DoP9UxFR6tQNeuG
         87qJlKH4IeDTuZjUt+15x7ol+2EAgZx0E2TbesS+ecrWI5TRI3eBnKFzJFbVkJLZYTkL
         Jezwsb6cA01qIyKaWsdVov947JUjGxNJp7lXUo5Tl3ews3iGBOCpNWxpWgaqUxqmCvah
         EAgtsp5GiCkW1er4I4IDLfuzVrZ0tdgY9/wQFg5BHHsb/cvcGJunuhmgXpnQF7ge4YsN
         05ZofprT6W3pj0CX199EjhT3RlJvQeQ5FDJYpI4wnStvI1dql1Lnv51iZM8XnzhahP7T
         ZLUw==
X-Forwarded-Encrypted: i=1; AKwUvBwX5HOifDd4L+yIyTyjcjPQ0IYPGX/DD0rGOXr1f6iN9+Qar3QSSyfiRhwSZo4onCdDSNjA01k/wjRvWjM=@vger.kernel.org
X-Gm-Message-State: AFq9FYIK+ofYMqtHgW2HJ0W5KW76OwWXcf6JPHDXhJW/Kb3WZHamuQPp
	GEQ3mLD5aHo5u45VblCj3zvkq4qcMWkEbw2EPQM9FtNbxLXcm96XA0wRVYGh5onRzw==
X-Gm-Gg: AYBFou0NahI4XKV668wawj7OVoh8/zQ1EFq+rjg5oqkx+DGrywywkstGBJsiRbXkA6N
	S03Jt2FqGWfnIaLyyQrXvCQrHNEH/OvFy8lKmpvXdtRRW9FtpnH+aW+9pjWwAAThzLOWLQfZV3e
	vHHMzDXdJ5iEejdBg/hDPkIql9gfF/ypzPXP4hCKvGDici/RP6MnmTSeLN+5pV8K8GfCff8XOo8
	5K/Bm53BNs9KztDAttAp1LzDVxumtKSiZtScnlWc7oB8g/3TS6Mj0PdwESHxUDT/hPMzzmH3JNH
	HwoKiwhLKOpdNwNeONuD+pHuStj8jvFKvdrFFB3/vCnLYVlSlq/RfHG4kH63lFsZpHyO7MStdnE
	N66ZMZe0lmKqbo9T0xdbao4ZvENZxe9XMOyzvnuQM3hwkftQ8624spB9MpDmKD70NzqL1JlDfM9
	GIaMHHGmKa97V30pWbLMD/JY38ABxl6/jXFcPpn/KK+I7kodm4xT9S7SSYMhsjXu6o1cKgZ6JKR
	FcDlowVrbenULF0ZSa9VI542u4eqhzysddUVD8k0tzhI+t8sp2YpqYojhJvOqqZWjIxt6UHM0qw
	lRu+RdrpPjWc/DmkhA3uZIfqeIoSlmjalr7+ZDvXZdwV
X-Received: by 2002:a05:7022:ea9c:b0:18d:c38c:bcc9 with SMTP id a92af1059eb24-199290fe50amr4386210c88.3.1792894727665;
        Sat, 24 Oct 2026 19:18:47 -0700 (PDT)
Received: from tigeriii.tok.corp.google.com ([2a00:79e0:2031:6:9f87:66fc:8c85:11bb])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1989ff2ee5asm10387242c88.8.2026.10.24.19.18.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 19:18:47 -0700 (PDT)
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
Subject: [PATCH v7 01/15] zram: prefix backends printk-s
Date: Sun, 25 Oct 2026 11:18:17 +0900
Message-ID: <20261025021839.1542805-2-senozhatsky@chromium.org>
X-Mailer: git-send-email 2.56.0.257.gf7497c7d27-goog
In-Reply-To: <20261025021839.1542805-1-senozhatsky@chromium.org>
References: <20261025021839.1542805-1-senozhatsky@chromium.org>
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

Currently, zram backends prefix printk-s with their names, which may
look a little confusing, e.g. "zstd: alloc size 408128".  Prefix
backend names with "zram:" so it's clear that the message is coming
from a zram backend.

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
2.56.0.257.gf7497c7d27-goog

