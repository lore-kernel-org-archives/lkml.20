Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7D5B42AF82
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 21:12:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789074771; cv=none; b=aFFxO4/GYVakLGXtvkUcwgd20OZ+DzFAZo/EaEXwWsmobL+xLpRb4QU6D7Ni6HpNcmA9dYtmz5GKhc9xqeVovnd8MQ8AWfbhIyqn5IdUiX8dEj0kte69IRXsEeMzl70rV721WdF5PMlb7lhWf0CGR0wrVW9Wm/48jyurbpEeqsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789074771; c=relaxed/simple;
	bh=GFno87KOND++0pTkbVyfXGfOMrlcWDgKnNEmxfOzH3o=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Content-Type; b=cUai/svO39Ncxz8nfJs+1OIxWuz2FFnRbM57RaSfvCTjHCpSAgqqZeE5Tychkj3vyvgjfDkr/KsA2vNsycGxHFbHP1+SjUO9NTD9bc420il9W6XMr/pxRSlejOPa+fzMKm2Bdng2lr5bnl+tnxozcpTcYqeA8DPnHoCjQZfMXD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=H4Te1NjI; arc=none smtp.client-ip=209.85.216.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="H4Te1NjI"
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-39af92138f9so412997a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 14:12:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789074757; x=1789679557; darn=vger.kernel.org;
        h=content-type:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=du1Euo+bpbmMcY488P/S5lzZFDL0wvPLdizijcyISy0=;
        b=H4Te1NjIL8t6eG7j6ZmD6cdg5yhw32YD40I420G1lkP6QRs/hl45RfYSd5kvAjADpx
         oXe9aBW/P3ewpbeSLNMQhB52VzaCF5P01G189xZpYez0EnmaYBpJps7660HqeXchrOeW
         Q7BJiJPybnN1xW65ZFPjF6SvcHASYQznEtZ/WeDjLSBkUCxlVc18qlBP0lAKDpc5beOp
         vc1SiKQ+zKbE4iY1ZP+HRP5c7f/m66FUSQmkB/OYdgwi3MZeOSlbiXRZM9ffu4WA2Nt7
         Xbf9KvHHi3zlJ5R6B6ClPhoPp7GSp2ldwXBOePHsCz6HycJH5xBI6sc0Ou/HwCKQcFhp
         zddQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789074757; x=1789679557;
        h=content-type:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=du1Euo+bpbmMcY488P/S5lzZFDL0wvPLdizijcyISy0=;
        b=itFDyLYtPAIPCUBfxZOthQbZMV4PsA7EgOj0/iTgIsSt2l0hQ2/tqXC87qXoHmq+8D
         FV0fDuzJig4rAqZ+ehmbbX3Pr+VwL8qbakkUksejly03RJNhgpvI57SlUV16LnADkHfr
         aC9WeKYT7MYiWuSuM98PABjes1Cgvnl45OIcFFgAMbGuNQyrn9P2CGwDc35g5xgpak4/
         rWSsdaZtlMUE48BVce5DcafDtqucVQqC/1cDwZ3wBfG6P20nmg3Rv1qdE3P3n6NFiBUE
         7ntqrq402htO5rFpmv95OGFQjEYN+tB/pmyjd2LydgjFYr8R8gKWhmA3OQCdHcUd60p0
         QZ4Q==
X-Forwarded-Encrypted: i=1; AKwUvBxMU37i4KWCKeCKlpvwACu5NKZ6dQ0pSfKd3GHY1TYeCKGnJEolhgeKCT2oBxQeciENatC6zJAdNyCxp74=@vger.kernel.org
X-Gm-Message-State: AFuF++nbiN0leuyLMbgEDyaMWQ1TweVE1DSgF8KyDuUkTk72pDIGbt5V
	oChmPl4XCw4/kGE1EzqksXrFD/+OLVETU0MprlZOeTOW65NJCp+AOBsL7UWqIf6BxXSNC1UBO6R
	c3ijhkDxFIA==
X-Received: from dlbay9.prod.google.com ([2002:a05:7022:6609:b0:143:5969:748])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:4b11:b0:36b:b903:994
 with SMTP id 98e67ed59e1d1-39d77916d33mr8158316a91.4.1789074756839; Thu, 10
 Sep 2026 14:12:36 -0700 (PDT)
Date: Thu, 10 Sep 2026 14:12:18 -0700
In-Reply-To: <20260910211221.3154261-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260910175634.3014018-1-irogers@google.com> <20260910211221.3154261-1-irogers@google.com>
X-Mailer: git-send-email 2.55.0.1007.g17ff1f9808-goog
Message-ID: <20260910211221.3154261-2-irogers@google.com>
Subject: [PATCH v3 1/3] perf header: Fix HEADER_COMPRESSED validation for comp_mmap_len
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	James Clark <james.clark@linaro.org>, Swapnil Sapkal <swapnil.sapkal@amd.com>, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

This commit updates process_compressed() to ignore comp_mmap_len == 0
when validating the compressed header. A zero size is valid and may
occur during testing.

Sashiko review flagged string.h was missing (preexisting problem) and
so I opportunistically fixed this and sorted the header files.

Signed-off-by: Ian Rogers <irogers@google.com>
Assisted-by: Antigravity:gemini-3.1-pro
---
 tools/perf/util/header.c | 79 +++++++++++++++++++++-------------------
 1 file changed, 42 insertions(+), 37 deletions(-)

diff --git a/tools/perf/util/header.c b/tools/perf/util/header.c
index 7db7da090a1e..974ce1c926cd 100644
--- a/tools/perf/util/header.c
+++ b/tools/perf/util/header.c
@@ -1,65 +1,69 @@
 // SPDX-License-Identifier: GPL-2.0
+#include "header.h"
+
 #include <errno.h>
 #include <inttypes.h>
 #include <limits.h>
-#include "string2.h"
-#include <sys/param.h>
-#include <sys/types.h>
-#include <byteswap.h>
-#include <unistd.h>
-#include <regex.h>
 #include <stdio.h>
 #include <stdlib.h>
+#include <string.h>
+
+#include <asm/bug.h>
+#include <byteswap.h>
+#include <dirent.h>
+#include <linux/bitops.h>
 #include <linux/compiler.h>
-#include <linux/list.h>
+#include <linux/ctype.h>
 #include <linux/kernel.h>
-#include <linux/bitops.h>
+#include <linux/list.h>
 #include <linux/string.h>
 #include <linux/stringify.h>
+#include <linux/time64.h>
 #include <linux/zalloc.h>
+#include <regex.h>
+#include <sys/param.h>
 #include <sys/stat.h>
+#include <sys/types.h>
 #include <sys/utsname.h>
-#include <linux/time64.h>
-#include <dirent.h>
-#ifdef HAVE_LIBBPF_SUPPORT
-#include <bpf/libbpf.h>
-#endif
+#include <unistd.h>
+
+#include <api/fs/fs.h>
+#include <api/io_dir.h>
+#include <internal/lib.h>
 #include <perf/cpumap.h>
 #include <tools/libc_compat.h> // reallocarray
 
+#include "../perf.h"
+#include "bpf-event.h"
+#include "bpf-utils.h"
+#include "build-id.h"
+#include "cacheline.h"
+#include "clockid.h"
+#include "cpumap.h"
+#include "cputopo.h"
+#include "data.h"
+#include "debug.h"
 #include "dso.h"
 #include "evlist.h"
 #include "evsel.h"
-#include "util/evsel_fprintf.h"
-#include "header.h"
+#include "evsel_fprintf.h"
 #include "memswap.h"
-#include "trace-event.h"
-#include "session.h"
-#include "symbol.h"
-#include "debug.h"
-#include "cpumap.h"
 #include "pmu.h"
 #include "pmus.h"
-#include "vdso.h"
+#include "session.h"
 #include "strbuf.h"
-#include "build-id.h"
-#include "data.h"
-#include <api/fs/fs.h>
-#include <api/io_dir.h>
-#include "asm/bug.h"
-#include "tool.h"
-#include "../perf.h"
+#include "string2.h"
+#include "symbol.h"
 #include "time-utils.h"
+#include "tool.h"
+#include "trace-event.h"
 #include "units.h"
-#include "util/util.h" // perf_exe()
-#include "cputopo.h"
-#include "bpf-event.h"
-#include "bpf-utils.h"
-#include "clockid.h"
-#include "cacheline.h"
+#include "util.h" // perf_exe()
+#include "vdso.h"
 
-#include <linux/ctype.h>
-#include <internal/lib.h>
+#ifdef HAVE_LIBBPF_SUPPORT
+#include <bpf/libbpf.h>
+#endif
 
 #ifdef HAVE_LIBTRACEEVENT
 #include <event-parse.h>
@@ -3903,7 +3907,8 @@ static int process_compressed(struct feat_fd *ff,
 	 * checks decomp_len + sizeof(struct decomp) against SIZE_MAX
 	 * before allocating, which handles 32-bit safety.
 	 */
-	if (env->comp_mmap_len < 4096 || env->comp_mmap_len % 4096) {
+	if (env->comp_mmap_len &&
+	    (env->comp_mmap_len < 4096 || env->comp_mmap_len % 4096)) {
 		pr_err("Invalid HEADER_COMPRESSED: comp_mmap_len (%u) must be a 4K-aligned value >= 4096\n",
 		       env->comp_mmap_len);
 		return -1;
-- 
2.55.0.1007.g17ff1f9808-goog

