Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E0133E5EE7
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 04:53:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789620835; cv=none; b=G6A4G0NN0nLu+Y2OX59FoURd8j9KSsqq9pu9QbzE/Pe5+lwioo18Hxta9eO3kjIAZHIgA+EhQd4OY5PHV+FoNd3yLsnLh/EaULtd0MefQnMDlK4te01WDKTj4nTSLMx7kPl91wUgw3bGzyFrddiOdZeunX5WgbjNOTMMCzJUKLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789620835; c=relaxed/simple;
	bh=MCRtz/VwUrrtZbKs25VEqKBHP5G4iO3e+pODi2v1Ucc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=GhOqOd2rX4487dQ78UM02tf6ftUWetFLp4sxFr7090+Gbq3OpII1+kKRLcmdT3Voyrmh47SnDpki1SR2M9E7bGVxKwIM5T9fP5COUiarCAzmQLjZOCX2h9+e0sw2vvNS46Kyd5lW5Hn2JnbR34L3d3bA+DsnyN3llHs3cDvUQrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=r6ECqb+i; arc=none smtp.client-ip=209.85.215.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="r6ECqb+i"
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cc1b80835d5so535286a12.2
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 21:53:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789620832; x=1790225632; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=g9JN/Di+KgTRKeSYgmf/U6+GV+WTwPqrJpuHpwbFA28=;
        b=r6ECqb+iDFGSOyM4/WWn+XCpwVEKVA2SWTx+OcDKP3H2/7TZ+Cs1VdXv9gRyZ9zMQy
         k0rG9QNsVhoULctRR/4ZZKYUEtjW5hp71KkEi+Sl5jduATB6K2Rwk5igLDkzqO4TdXDt
         o+5ucUqiTQPj0H73BxJFtt5yexhnMZYXscVosbuCTs/F398ztLxOxpBLvvPOQmWGCfAE
         j79n1m9qPT3LGYIMjtFdPPiUq/t9HF57hi5MviiXn8NBMSZIP4Ylr74hYUf9ddL9uCQj
         hXL6YJPlWqfiRMAEjRdJIQ+3KGm5CfgEXH3T9sgJl8jq1adSDoA7R4mGwHWUbHYQKm+V
         v6DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789620832; x=1790225632;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g9JN/Di+KgTRKeSYgmf/U6+GV+WTwPqrJpuHpwbFA28=;
        b=M6HB9KMVpPU1VwE4BfU+7PCZ5OKVLl2HnFoNqNm4CQiRV+KjHWxKWnqsYzhteG9xc1
         z6IyTBsBcecgAWTqRBSbMGgJiD3kCkHQim+8Y4QMKNrMYu5iY1v1jr7V9iuHBfZQpfeU
         U4mYKpoc7eVABWetekKvHJcOrXrJZU3/XU+v9wMu7aJ5cMBy/kQwMMvX7vOuB1lh5V5/
         D9oQhC/e1ZbgYNNHBhhcAGQKnuhx9InBLub0Wq7lLBjHNm4sSPmSMtL6YKvhLT8YDd0e
         gDgw8e9Xv/l9G+atl1ywK2jaHsC5884C6qpH4eoO5RlqaMf9Wa5Wh6OdopSp7zsglrKQ
         bg2A==
X-Forwarded-Encrypted: i=1; AKwUvBw1zD1uLh3Fx18tOwhctS+lqSC+ZU4yKJS++BMwdHRLuVyjJWKf0kOFxSacC5rBRViGEVAtX6yKZ5q4YYM=@vger.kernel.org
X-Gm-Message-State: AFuF++kySrMyBANFcd9igFS59p/HpCNAnvdp7Jcmw5/NHEK1Pk+ay69/
	T9WYn15uBGeYvQipCQ58aRCm4Ddyjc5UMeKOwd+hBIpKg87nRtSG7k0yCSlpSaxJntZ+70Yp3+h
	a1Gc6huTsqQ==
X-Received: from dyblf1.prod.google.com ([2002:a05:7301:a01:b0:334:e08b:1b72])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:1811:b0:39d:e54c:8658
 with SMTP id 98e67ed59e1d1-39e1e250230mr15529129a91.5.1789620831564; Wed, 16
 Sep 2026 21:53:51 -0700 (PDT)
Date: Wed, 16 Sep 2026 21:53:24 -0700
In-Reply-To: <20260917045326.63601-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260917045326.63601-1-irogers@google.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Message-ID: <20260917045326.63601-9-irogers@google.com>
Subject: [PATCH v1 09/11] perf mem: missing stdio.h and limits.h in mem-events.c
From: Ian Rogers <irogers@google.com>
To: Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	James Clark <james.clark@linaro.org>, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Cc: sashiko-bot@kernel.org
Content-Type: text/plain; charset="UTF-8"

Sashiko reported:

  When compiling the perf tool against a strict POSIX C library such
  as musl libc, tools/perf/util/mem-events.c fails to build due to the
  use of undeclared standard symbols.

  The source file defines an array using PATH_MAX in
  perf_pmu__mem_events_supported(), and utilizes fprintf() with stderr
  in perf_pmu__mem_events_list():

  Because the required <limits.h> and <stdio.h> headers are not
  explicitly included, these symbols remain undeclared. While glibc
  masks this omission by implicitly pulling in these definitions via
  other standard headers, musl libc adheres strictly to POSIX
  inclusions. This causes the compiler to reject the undeclared
  PATH_MAX macro, the stderr stream, and the fprintf() function,
  halting the build process on systems utilizing strict libc
  implementations.

Add the header files and use git clang-format to sort.

Reported-by: sashiko-bot@kernel.org
Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/mem-events.c | 20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/tools/perf/util/mem-events.c b/tools/perf/util/mem-events.c
index 0b49fce251fc..64aecc2b67e5 100644
--- a/tools/perf/util/mem-events.c
+++ b/tools/perf/util/mem-events.c
@@ -1,22 +1,28 @@
 // SPDX-License-Identifier: GPL-2.0
+#include "mem-events.h"
+
+#include <errno.h>
+#include <limits.h>
 #include <stddef.h>
+#include <stdio.h>
 #include <stdlib.h>
 #include <string.h>
-#include <errno.h>
-#include <sys/types.h>
+
+#include <linux/kernel.h>
 #include <sys/stat.h>
+#include <sys/types.h>
 #include <unistd.h>
+
 #include <api/fs/fs.h>
-#include <linux/kernel.h>
+
 #include "cpumap.h"
-#include "map_symbol.h"
-#include "mem-events.h"
-#include "mem-info.h"
 #include "debug.h"
 #include "evsel.h"
-#include "symbol.h"
+#include "map_symbol.h"
+#include "mem-info.h"
 #include "pmu.h"
 #include "pmus.h"
+#include "symbol.h"
 
 unsigned int perf_mem_events__loads_ldlat = 30;
 
-- 
2.55.0.1082.g2b9226bbc0-goog

