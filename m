Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3E7D3515F7
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 04:53:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789620817; cv=none; b=qZxtlWVkMDHmk9TyTSRP6PFUWv43vzVFHzEjplVZAlGEw0xGZjQfzAH9Cn5furvi2SlZeUJGVlRr79hqekd/F3wjXKDM7KDAGb7LcGpf8Q2bG8bWEMaut/0oB6BYDfH+lRevZMDl76+oj4xntgz23aIMArHlk50sD1tJX0M7lOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789620817; c=relaxed/simple;
	bh=4KvZJH6YRwPglA9o3nI6z1rEnSsw3vH+LveBOSJFiwY=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=r+/fiBOnsgjcHZOiIQZAQqAAsgHfDgWNaxafhRPwfftkRlCZOHpKr8cVvp7ra+DNPKjE3PForfv8jdECSo8peeM+whEYrX9w2pFRidT07JWfsC9DRNZnYOaEjV9kGvNUVXthqesxsmI3LG+gakUJvwShlQ2yqM4das7TZq0Jby4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=W8oTM/0X; arc=none smtp.client-ip=209.85.216.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="W8oTM/0X"
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-39deb05ef51so711472a91.3
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 21:53:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789620815; x=1790225615; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bOKipafnbhub0qpZgGArEWzHEFMMWCTscOxRR7YZKWY=;
        b=W8oTM/0XH6Zp//oJTh4UyX1ZAtHHqVGx3CBsHuKRF/mdpkbcbhGBBh24vy7YiYjdxW
         0biKZIDZmdQFBdGpuJe9CQ9b1yJ3X3uiAkzXnS372njNo9z67eACinoWCjyOznxiu9Gd
         V1JsAPS0Gq4bdQKWtjeJ++lB8cKs38K75DQn+ae2k3iChRR1orYwfSl9hy4k2OsemQnJ
         Qr9WzFxciimRT13gv/qWgxdSfqI8xOsn+Kr6+y8W9z3Sp6KLiBE9QX4DMSFsCVyitpZ8
         5WVpmrAW58Jp0M3wunBKsvfn6NVd+5VAzxJ4ysCSU1aoXdLWseFw1no/xOJrqKRevdub
         syWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789620815; x=1790225615;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bOKipafnbhub0qpZgGArEWzHEFMMWCTscOxRR7YZKWY=;
        b=QPhEC90ykD6JJHVXZRk+PSRGZZ3PEewqwZMEXsvIw78Upz49PJPl7oi4sWTqM1MnWX
         TaDpShQMMAXWu3yS3xspbtgNSt0CNcPSAKK4/x5LzYP1yvpqM9CYoXRussJ2VMF1Moon
         hA1d9IubbQa7Jdf6A7Vew9hTVlzekZxdcP1t5tvyy+PBy/R9052+aOzpSaw68FrP2bUi
         wmhdYh4JhTECpP3oYapSPHD5LQ493YUTgxvYheoPwDQSdWTpv9FbwY5XXFoB7Drhm7mU
         KOqg+UeG3NZXNYfU2UFrptu4lCO4D3HkhjQmD/5y2rsGy054/cVzx2eKIEGYXzH69lBF
         HbVg==
X-Forwarded-Encrypted: i=1; AKwUvBxaS21iwqnuZ+kuEZ0mLaV1/kZjTcDI/kjw+TeEl1BkiG4D4BRSk2sXLRtx7WOaSgGSd/AJsBbF94t1Pis=@vger.kernel.org
X-Gm-Message-State: AFuF++nY68pg3HOSst+VCMC2MwfFXYdsf1EdkXb4s5blXwfabTOahwbQ
	8SN+IHIs+XJNv2TQrFGA2bcLy9yE72ejOlKTr3PuLP+c6fwODrvpZsAVmkAkZbKmoSBI8Vkv2bT
	5TAi7IZPwQw==
X-Received: from dli5-n1.prod.google.com ([2002:a05:7022:285:10b0:144:c0e8:a153])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:4a51:b0:39d:ee20:1e28
 with SMTP id 98e67ed59e1d1-39e1e510f73mr15259716a91.21.1789620814920; Wed, 16
 Sep 2026 21:53:34 -0700 (PDT)
Date: Wed, 16 Sep 2026 21:53:16 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Message-ID: <20260917045326.63601-1-irogers@google.com>
Subject: [PATCH v1 01/11] perf aslr: Add missing includes and sort headers
From: Ian Rogers <irogers@google.com>
To: Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	James Clark <james.clark@linaro.org>, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Cc: sashiko-bot@kernel.org
Content-Type: text/plain; charset="UTF-8"

Sashiko reported:

  When building the perf utility against strict C standard libraries
  such as musl libc, compilation fails in tools/perf/util/aslr.c due
  to missing explicit inclusions of <stdlib.h> and <string.h>.

  The implementation relies on standard memory management and string
  functions like malloc(), free(), memcpy(), and memset() in routines
  such as aslr_tool__findnew_mapping(), aslr_tool__process_sample(),
  and aslr_tool__delete(). Because the required headers are omitted,
  the compiler must resolve these calls via implicit function
  declarations. While glibc may transitively provide these definitions
  via other headers, musl libc does not. This violates strict C99+
  standard compliance and triggers fatal build errors under modern
  compiler configurations.

Add the header files and use git clang-format to sort.

Reported-by: sashiko-bot@kernel.org
Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/aslr.c | 32 ++++++++++++++++++--------------
 1 file changed, 18 insertions(+), 14 deletions(-)

diff --git a/tools/perf/util/aslr.c b/tools/perf/util/aslr.c
index 027695d96779..f49e965243aa 100644
--- a/tools/perf/util/aslr.c
+++ b/tools/perf/util/aslr.c
@@ -1,28 +1,32 @@
 // SPDX-License-Identifier: GPL-2.0
 #include "aslr.h"
 
+#include <errno.h>
+#include <inttypes.h>
+#include <stdlib.h>
+#include <string.h>
+
+#include <byteswap.h>
+#include <linux/compiler.h>
+#include <linux/zalloc.h>
+#include <unistd.h>
+
+#include <internal/lib.h> /* page_size */
+
 #include "addr_location.h"
+#include "data.h"
 #include "debug.h"
+#include "dso.h"
 #include "event.h"
-#include "evsel.h"
 #include "evlist.h"
+#include "evsel.h"
 #include "machine.h"
 #include "map.h"
-#include "thread.h"
-#include "tool.h"
-#include "session.h"
-#include "data.h"
-#include "dso.h"
 #include "pmu.h"
 #include "pmus.h"
-
-#include <internal/lib.h>  /* page_size */
-#include <linux/compiler.h>
-#include <linux/zalloc.h>
-#include <errno.h>
-#include <inttypes.h>
-#include <unistd.h>
-#include <byteswap.h>
+#include "session.h"
+#include "thread.h"
+#include "tool.h"
 
 /**
  * struct remap_addresses_key - Key for mapping original addresses to remapped ones.
-- 
2.55.0.1082.g2b9226bbc0-goog

