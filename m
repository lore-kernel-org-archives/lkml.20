Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E14D73E4103
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 04:53:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789620825; cv=none; b=d7koGSxlhbm68I6qvEdp+4SmucyHofNe3wTvS44ev5h26pCl6ZkWWOPnf9jg2a9qnzHuUmBcNNjSpWu4jybu61Cv+HmzQw7XrcaFrG9XCo50+1T9ST20xYwcDsUILUuuzIIACIuAZbhR9ZiF1fWqtQqUMzSQSUK3gwlGHmU2BtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789620825; c=relaxed/simple;
	bh=ctgAKO83gsTv8gTCuaPIepnWz72t4D2/QM8/mKVOa2Q=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=QQi20+DCK4F2uD3LDguDGE+XNqfQdrbSUZjc6yUjtIr+WTkDjjAZAI8sSEbgnuVhPnZ3ogL5sEySErxKPdRQUZG9YdsF9zCxYUcY18E0kgrziFfdHL8E9ag+RhQ1Qjb4C+1MZaM7dpmpia0B25nZTtnkJEHLCugimxce+ROzW38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=NgmzRS0j; arc=none smtp.client-ip=209.85.216.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="NgmzRS0j"
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38ecc48b3c2so1100596a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 21:53:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789620823; x=1790225623; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t4bGGtl8mviDTYAje/z76N2WSQvQmolwBPcSYqlFs3A=;
        b=NgmzRS0jgzt4shBmpurPsr1K+VSSesM88BjKNKBJTVNuip7vZBQmZ5RxXxOqdEKY/i
         ftuu5Q4WI8Wf0Nc9qUQxTypginai+uqO904mgyirCIgayAY3pxWf7yPPLQeG3gmth+QA
         DUsKFjdptfNEqdVnnQYEmxNv+UPUYDlist7dB7Gaa04YMwDNg9qD/pZS1xlCkQ+LGh0v
         1EOhVww3aIRQMvxaGUTIP9Kk0zwMDc47cT2FAhpeX/c1hqppOYp+RM+5imlB4tU5L/Uv
         72c8Wcyh5yPUbPtzNpbdFfkUOtnDbPdbeIIMGdn36+XIFFGgbUcGk+rnnNgnhqJRrnUj
         NfyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789620823; x=1790225623;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t4bGGtl8mviDTYAje/z76N2WSQvQmolwBPcSYqlFs3A=;
        b=pgRZQzow7fRJH3UQPx6okT2/GDaUMjDCqeOshkT9ryZJSbHfY/GzxIzS0A3NvFHbbp
         adH98gqku+sH7tp+J+ekORptzA3+oF7opvFnCStIZhznO4ktFcIYaRPixcOvb8ON5dhB
         D0b9VxWpvdkoEmEjLR4l5GY5gMjNHr2lytF7z3o45rppl32H7+Gjbrh7UMlUkY5+qAwF
         2fEUbTAplttNw/rm44/Q64IxfXQ5safLnl0v3x7zmX8Nt1/Nm+GFr8gTN2UzUuq71nJi
         p9UFYFL7nuTV0Ug9r+oAzxT6fUIJdRaU7slqr0bN1GFjLTtgBd3EPszv5CqibqxAZxRN
         XK5g==
X-Forwarded-Encrypted: i=1; AKwUvBySWAmVqCtxMxo8tc+ww6LkbWbsOwjgGmub6IhwHjIdvVFEiBb9FEU7dJvWvhDdwztpaZhWxylmL2IROBw=@vger.kernel.org
X-Gm-Message-State: AFuF++lm+MDvMKChJPlMn+/NGlQnkB0FF+iIqOWKNpeUKhaxTNQcMgM6
	qkirU9sxQuENWwcX8gkCOJ4uhmR4V++cxEQsyqd1yHii7NUvF1Zdus0umymlRYkUdwRGbi9tHax
	R5MPUg/bt6A==
X-Received: from dlec16-n1.prod.google.com ([2002:a05:701b:4290:10b0:144:be75:f389])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:54cb:b0:37f:c22a:c188
 with SMTP id 98e67ed59e1d1-39e1e25ac28mr12048608a91.4.1789620823042; Wed, 16
 Sep 2026 21:53:43 -0700 (PDT)
Date: Wed, 16 Sep 2026 21:53:20 -0700
In-Reply-To: <20260917045326.63601-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260917045326.63601-1-irogers@google.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Message-ID: <20260917045326.63601-5-irogers@google.com>
Subject: [PATCH v1 05/11] perf dso: missing POSIX headers string.h and limits.h
From: Ian Rogers <irogers@google.com>
To: Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	James Clark <james.clark@linaro.org>, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Cc: sashiko-bot@kernel.org
Content-Type: text/plain; charset="UTF-8"

Sashiko reported:

  When building the perf tool on a system using the musl C library,
  compilation of tools/perf/util/dso.c fails because it utilizes
  standard string operations and the PATH_MAX macro without explicitly
  including <string.h> and <limits.h>.

  Functions like dso__read_binary_type_filename() allocate arrays
  sized by PATH_MAX and perform string manipulations using strncpy(),
  strlen(), and strdup(). While glibc implicitly exposes these POSIX
  definitions via other included standard library headers such as
  <stdlib.h>, musl enforces strict header dependency
  boundaries. Consequently, these macros and functions remain
  undeclared during preprocessing, resulting in a fatal compiler
  error.

Add the header files and use git clang-format to sort.

Reported-by: sashiko-bot@kernel.org
Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/dso.c | 47 +++++++++++++++++++++++++------------------
 1 file changed, 27 insertions(+), 20 deletions(-)

diff --git a/tools/perf/util/dso.c b/tools/perf/util/dso.c
index 42bfe30a3b51..592fb971ffaa 100644
--- a/tools/perf/util/dso.c
+++ b/tools/perf/util/dso.c
@@ -1,38 +1,45 @@
 // SPDX-License-Identifier: GPL-2.0
+#include "dso.h"
+
+#include <errno.h>
+#include <limits.h>
+#include <stdlib.h>
+#include <string.h>
+
 #include <asm/bug.h>
+#include <fcntl.h>
 #include <linux/kernel.h>
 #include <linux/string.h>
 #include <linux/zalloc.h>
-#include <sys/time.h>
 #include <sys/resource.h>
-#include <sys/types.h>
 #include <sys/stat.h>
+#include <sys/time.h>
+#include <sys/types.h>
 #include <unistd.h>
-#include <errno.h>
-#include <fcntl.h>
-#include <stdlib.h>
-#ifdef HAVE_LIBBPF_SUPPORT
-#include <bpf/libbpf.h>
-#include "bpf-event.h"
-#include "bpf-utils.h"
-#endif
+
+#include "annotate-data.h"
+#include "auxtrace.h"
 #include "compress.h"
+#include "debug.h"
+#include "dsos.h"
 #include "env.h"
+#include "libdw.h"
+#include "machine.h"
+#include "map.h"
 #include "namespaces.h"
 #include "path.h"
-#include "map.h"
-#include "symbol.h"
 #include "srcline.h"
-#include "dso.h"
-#include "dsos.h"
-#include "machine.h"
-#include "auxtrace.h"
-#include "util.h" /* O_CLOEXEC for older systems */
-#include "debug.h"
 #include "string2.h"
+#include "symbol.h"
+#include "util.h" /* O_CLOEXEC for older systems */
 #include "vdso.h"
-#include "annotate-data.h"
-#include "libdw.h"
+
+#ifdef HAVE_LIBBPF_SUPPORT
+#include <bpf/libbpf.h>
+
+#include "bpf-event.h"
+#include "bpf-utils.h"
+#endif
 
 static const char * const debuglink_paths[] = {
 	"%.0s%s",
-- 
2.55.0.1082.g2b9226bbc0-goog

