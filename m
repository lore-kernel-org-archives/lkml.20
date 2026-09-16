Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D5A53EBF0F
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 06:13:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789539200; cv=none; b=EeuEcw43mS1X6MeVM/FqoER26ukjeOUjiLlx24OoXD5RtxOtDEre1lUJPtMsbKvUcxWkzyTMwp3fxZpI/7+DhSiUqXdQXu2eTHjSXr6eeJmfhH1sBtQqWdpsQttm6QtfmapaUxUZtD1vavs9aPWdyeyGV6Fo6e3JpLYPFr2Csy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789539200; c=relaxed/simple;
	bh=EkUSg3SW+p/sIj8byFhIiyPtAE+kzl5s7N8WhAJ4buA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Content-Type; b=S0pGZ5BfBAlrApcodj5UNbKd1DjH02R1pMXjzuJGbDkDujBWjb9WEgIYs+N4dgALEXkKetO01FjDlj2XFFpbsIDh4sRXqCj4lw5M6Ma5PBEWrw8LnsiF++Q/KtiF2HrrkRASr/+qt9rAvTNiMIVFHeVE6Ub5CMrG10crT4INWxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ZJAdeROF; arc=none smtp.client-ip=209.85.216.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ZJAdeROF"
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-396901263b6so10021311a91.2
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 23:13:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789539198; x=1790143998; darn=vger.kernel.org;
        h=content-type:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SntUi1xPjgoMQfW2YYfU5u+fl62gD37oiHiuv4x3AKU=;
        b=ZJAdeROF+Nwmxe6QuFtwFHvaNcw3MovTWiCKQ5TilmD7Tueokin1grGL2jsNV7lnWg
         716igmu1Qu6ixK9frZQw45Dv6RDR/Lt771Yymg91cdhVgvkyXBsIj3xj/jyJDZ0SVHPi
         VGm6pvcOLJvFVgdJO7lfVKbwU7APpl8omzHv0/KEG3zv58Sl8EMU6Hh8ibPkGmbP/xrp
         VTFv8v8F97Ri95z+WrZs8FO3vhID8hg8nRDK5Yj1r+aYUQPoo8kuK9q7tcR8huNjUQmo
         WRMLUnNRSU/XPn/NobKq8q8GMmVqTpG6fciifM1xjGfHectxpKlEGLnLJiXr9KfT4rgM
         Simg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789539198; x=1790143998;
        h=content-type:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SntUi1xPjgoMQfW2YYfU5u+fl62gD37oiHiuv4x3AKU=;
        b=Ndv17CVJMbxInwMbYma+hSs182BJp7fMSuPdDHdey+93mPEb5zBbBgTf2xlbCLyZbK
         QYsIDcRIXtyZtXjGcwV9x6cVvQ6L90W+UwtAenHxXY8rPpoTIilhCS9Pt42M08QWKh40
         4AZVRhOd9ojJCtqDiJGo5VAO8Ds6G1k+jXBqfDUjFdS45A66G/A5duOP6ASqGIuqwqj/
         BvFpZKDQL+WOOmKsTHfae0V47vrYzg64kCKDfm85gpT6f8oQIVsgYc4wDPaoYh26r2g3
         OHJmB/jNOlbJgpbEAZhnZNfDThpxOWRrDl+oDLpiGPvGbHwYpSr6NO2YweJ7+m/rb5Q/
         VJEQ==
X-Forwarded-Encrypted: i=1; AKwUvBz1ZQwUN4UZ4sCrQ0DUDdOhHhG9tk/GkTInHH/uDNdqhKC+TIm7e9ePtVYEK2jYRf7+2/M0DMOEiB+pS4k=@vger.kernel.org
X-Gm-Message-State: AFuF++khllqB4tH+LjZvB1edp/8NbTN8N/Mz4XZrCjpi8JG4wPadL/mj
	kq0HIrKhCnqX5FFs4MsDf0E/cfpYI7wbsCr3DZFl9RXZuTLMTTKjQ37jLpAJTxzXy6DRNuPvfgr
	Flp5Cymic4Q==
X-Received: from dleb6-n1.prod.google.com ([2002:a05:701b:4246:10b0:144:bc91:18ab])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:4d0e:b0:39d:f5b6:ca47
 with SMTP id 98e67ed59e1d1-39e1e47abbbmr3117561a91.12.1789539197679; Tue, 15
 Sep 2026 23:13:17 -0700 (PDT)
Date: Tue, 15 Sep 2026 23:12:12 -0700
In-Reply-To: <20260916061218.3061216-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260916061218.3061216-1-irogers@google.com>
X-Mailer: git-send-email 2.55.0.1032.g73a4cd73de-goog
Message-ID: <20260916061218.3061216-4-irogers@google.com>
Subject: [PATCH 3/9] perf libbfd: Include the headers that are used
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	James Clark <james.clark@linaro.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Thomas Richter <tmricht@linux.ibm.com>, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

libbfd.c uses errno, PATH_MAX, strdup(), strlen(), strcmp(), memcpy()
and pthread_once() but relies on other headers to drag in <errno.h>,
<limits.h>, <string.h> and <pthread.h>. The BPF disassembly code needs
<inttypes.h> for PRIx64 and <stdint.h> for uintptr_t for the same
reason.

Include them directly and group the includes so that the system ones
come before perf's own.

No functional change.

Signed-off-by: Ian Rogers <irogers@google.com>
Assisted-by: Antigravity:gemini-3.1-pro
---
 tools/perf/util/libbfd.c | 20 ++++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/tools/perf/util/libbfd.c b/tools/perf/util/libbfd.c
index 131bfedf48cd..1b23a261a9ce 100644
--- a/tools/perf/util/libbfd.c
+++ b/tools/perf/util/libbfd.c
@@ -1,5 +1,19 @@
 // SPDX-License-Identifier: GPL-2.0
 #include "libbfd.h"
+
+#include <errno.h>
+#include <inttypes.h>
+#include <limits.h>
+#include <stdint.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+
+#include <fcntl.h>
+#include <pthread.h>
+
+#include <tools/dis-asm-compat.h>
+
 #include "annotate.h"
 #include "bpf-event.h"
 #include "bpf-utils.h"
@@ -11,15 +25,13 @@
 #include "symbol.h"
 #include "symbol_conf.h"
 #include "util.h"
-#include <tools/dis-asm-compat.h>
+
 #ifdef HAVE_LIBBPF_SUPPORT
 #include <bpf/bpf.h>
 #include <bpf/btf.h>
 #include <bpf/libbpf.h>
 #endif
-#include <fcntl.h>
-#include <stdio.h>
-#include <stdlib.h>
+
 #define PACKAGE "perf"
 #include <bfd.h>
 
-- 
2.55.0.1032.g73a4cd73de-goog

