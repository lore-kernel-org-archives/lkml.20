Received: from mail-pj2-f42.google.com (mail-pj2-f42.google.com [74.125.227.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB485448BB7
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 12:20:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791202861; cv=none; b=lyNWZ5PmEA/hlwa9j3mDk+WzJg9+BBtPM+v3oCUhTqG5ELgXh4+qIyIsAKudul9/2Tt2TEU3Hczhh6HJ8ebXjzPyVD+BpIHlqM+MmqjOHq4fgfqeAyvwdb1lk1YlZKhMvzQz4NLFEigqjTz75/zM1qp5EVPhDDe4D7dC9EWALMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791202861; c=relaxed/simple;
	bh=slNkQmnUGIS6ajBLsCRFg0x0QUKi35JZWyJzNVGOhic=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mHfsSdh2i+l2qwtqLI5cMCRHic9YsH5H/5bvlz6hb3OANJGRRfpyH3ozBIPK9q5SqRQ3gVw7Z7oUg6xXRTIYzIpxUKba7SWSAUCIECWvooYNEaN268HM8QMSRvtxsxceaCdYlHjhfDHKnkG8J97zH5OR5HnzIn1VFzK7vCVJT00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=HtBk4PWS; arc=none smtp.client-ip=74.125.227.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="HtBk4PWS"
Received: by mail-pj2-f42.google.com with SMTP id 98e67ed59e1d1-396ccda24afso553131a91.3
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 05:20:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1791202859; x=1791807659; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qBy3Qhx5x3GHz21HDgx33swSeoCPkTH3zJT6nvmx4+w=;
        b=HtBk4PWSe+tpYChFsaxTvyiucGio87ILe1Sz1zW+D7PW2CnvEADkKpPTdNqCGRMa4s
         Ao0MGkDRu4LZ21ERUC6qt5f8gcfCaRBDFp8WNSE3oYzuYB5Utc8ZJ4ZhlC4l+vKzI6JS
         0afe5sDMu/EzTGwkX/VvATZQ4xhThWaeF+pDQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791202859; x=1791807659;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qBy3Qhx5x3GHz21HDgx33swSeoCPkTH3zJT6nvmx4+w=;
        b=VntNhdqfaNuorYw4o0tp1Es+kEU+ClDtk+MLoMAa9GvPO6FN518i1eQ0zhgw5869pu
         iDyFQdbZKuk9pZU/eiQtxxTXv91++/U5j8nO6c0g3ToTdwVna/AJOmx59ur7A84DBK8p
         A9L0952Tb75YckJGY6KoVUN7bal2rj0a5bJIEkbKlFplxFx5TuXtKX4PXe3PiSjzZdjT
         D2xj9ee4iNAkjOxPAx1xuWl6K5qfhQi2Kd4Ccu6oq3Q9WTWeNd7IjaQwdrcCB1YJasI3
         jpxtOYbh/9+HKX/LrF30wxwLRfZHnCFDa6uWr+j8RaefV4OrosjJyhJTK+HDSjcgopaF
         25UA==
X-Forwarded-Encrypted: i=1; AKwUvBzY/UKvU9rpKDYtWxV7bqZUXwqfQEfXOnHC+fIf1SgWHUhby/KskxMW2mo6TjHXiI2V1kyxCXx62TfNOu4=@vger.kernel.org
X-Gm-Message-State: AFq9FYI4ofY+Q0oLPz9iEliFEcPS/PDby1IwqPpOwqV3uLNrGp91Zpxj
	rSiBtB6tB0I9TzDvkW6+iSUf5ExvgO7BALkgUpdQ9N/v230cwKbNrGIaUI8rbmQlhg==
X-Gm-Gg: AYBFou14e3Fx6bqYRfXZWbWjWmcq/WKygxZniDU9KXFdtz6SojStyIlYDL0oSaNm9Ea
	naJCkCdL3Og/N4c5K+LOQbd+xm5pSuDfXpfAFctxSl583X0p8A16u1rHpUM1nn4jdcqQignPAKX
	xRxC2gNUapEimzGtZ/zG/rHurv8HCDVOPzjqAZ9s9B2ZPFE6GbyqCBNXFy3lohx7wb9jEyONnjR
	Wf8+T3qxvaagL2crk9poWbAML0IC7woZtMt2aUIG4LZj0VYHRxx847GmBoLW4lZciJ95e3MjJ2i
	TnOb/VUKTUEOhZNMTqTjI8b7cfXjl/+JpURRvMf0h2mHXKjVJ222hPnExjtVtjsgiOaWmq7te4w
	cvxnMnT1yiFsf4SGt36yz4a63/+MHausu1Brd1MivjF/8crUTYfWIEynqJvfXHqQkRH/VnJrdXN
	LShTGBtKnp0DL6pUdZ2cjwoUMcH30gG2dNapUD6eCHzMti8joBTL5Lufnnf3gyyBrib9pM2u5O4
	IXa91YbHOeH42IZXpcJFu9OP6YlTeX3PpC7ws5w26NC65lOsenSIfG+R+xcy6A=
X-Received: by 2002:a17:90b:2791:b0:3a8:e2c:af52 with SMTP id 98e67ed59e1d1-3a80e2cb9c7mr810510a91.24.1791202858970;
        Mon, 05 Oct 2026 05:20:58 -0700 (PDT)
Received: from tigeriii.tok.corp.google.com ([2a00:79e0:2031:6:9211:ddf0:3c6a:bf9e])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a7e4b00de6sm3342997a91.1.2026.10.05.05.20.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 05:20:54 -0700 (PDT)
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Brian Geffon <bgeffon@google.com>,
	Minchan Kim <minchan@kernel.org>,
	Richard Chang <richardycc@google.com>,
	linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org,
	linux-mm@kvack.org,
	Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: [PATCH 01/10] zram: prefix backends printk-s
Date: Mon,  5 Oct 2026 21:20:16 +0900
Message-ID: <20261005122036.718976-2-senozhatsky@chromium.org>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
In-Reply-To: <20261005122036.718976-1-senozhatsky@chromium.org>
References: <20261005122036.718976-1-senozhatsky@chromium.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently, zram backends prefix printk-s with their names,
which may look a little confusing, e.g.

	[   30.859567] zstd: alloc size 408128

In addition, prefix backend names with "zram:" so it's
clear that the message is coming from a zram backend.

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
2.56.0.rc1.315.gc6ed9934b7-goog

