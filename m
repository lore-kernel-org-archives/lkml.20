Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37C783A9627
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 22:20:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787955658; cv=none; b=eFYulQOq36Si2DFBjMrR5mr8SVijPN055mKIm/m5A44UPqb7CLsF+UWx9I4JWCKKqwV4elsN+PIEh9eibMmAv1YDxLM80PnskclIflL64xZ594lQ2L+XmDchvMaXXbQ0KPcaXuj2mOnkY789xacJ1v6BbXOKuizYtjAxYM5fWG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787955658; c=relaxed/simple;
	bh=MRLx+ZIuqqVuC6zIY9/TwJ8FtyrZANKBzrP3D3vqnz8=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Content-Type; b=QryPJPdVWEWy0F+MZtGMLPwraiXY0d90crcwKJmoxeqq5BBVCFhrwrfKYmjImzB/u4Dm/3K8xzRTtmQU/KpWaDr2tUC+Hi5E5qRYIpKAB/KMtiNUfVRS/S3dSJzii/dQGuimPSVyFzyW1gzM3bpzx7ndvuO1dFUSqgro5GZv6ig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=UcTEH/Y6; arc=none smtp.client-ip=209.85.215.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="UcTEH/Y6"
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cb6cf425e86so1795163a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 15:20:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787955655; x=1788560455; darn=vger.kernel.org;
        h=content-type:to:from:subject:message-id:mime-version:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Bc0+07/SjC7xF5tpPAiX1u2Pjb21UYBHJhJguVuHLww=;
        b=UcTEH/Y6p2HTZsfMZPilVUqViSqvtYKWaEDcCgTudKZ+kKD3qCrLV7GEvrIGjw2x5X
         XGF9do7omLsgDXuuJcSMF7Uajf34L/8n1VNHzSuccVHTi26RuAT50kpUk3YIZFyNxOLN
         UFxSsJ4xWBjgC9U83f8CoJV7XC3b5LB6DdpQVPRS35So351DISHBxdHyAYaIohAM2v3J
         UUVkUn3L1o7S0yU4MeXBN2RFpSC68AFFGrpjeddbwJakKSB16V6JJJSyT7Fcp5AOW2yD
         tbSuBmrUYXKvTxQG61kVLhNk+JNhKjUKse8JYT/Y/lAxsIPHnRhPr6641PDlf9aIsSoC
         +BPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787955655; x=1788560455;
        h=content-type:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Bc0+07/SjC7xF5tpPAiX1u2Pjb21UYBHJhJguVuHLww=;
        b=m+6PFMesWih0cIzMSFguxGSd5a1Syb/e9ffZutcg3NDqbuoj/FRGXWfjubzWoQjQuF
         N6BnTE9VBnAoNhsNJw3924gjSBEn1SN9ysl3qwy5RZKShTz2rEDzCNqRlJgQKC8RyPQg
         q1IZ3W+Xdljn863Rj6QpjiVSlB2nNCQgNRS4+NrbdG3kP3ZIqQBU9uS0ubuOQqXX2vpj
         0zYOdgpBypOS3JPBKdwKMp5+01XnMGgsVf32Pov+xI1q56Jq+iiHpcLBNhqzHDclLWq8
         Gtmz5n/zj2mM+mSN6Ad38gzikOtxwHT+veSgeoelf7g0LFZA8uAog49S3vDOiCpm3e9X
         PitQ==
X-Forwarded-Encrypted: i=1; AHgh+Rplv8jPebh8nxDl32TNmrdVZ3R3Eh7GzD2nye8iEFYl2qyez7C05s50XEvD/+3dOGMeQvwkzNE0BaHVBVg=@vger.kernel.org
X-Gm-Message-State: AFuF++ntaq7jSisR6kVSqpLInGrx4h4BsgRLPrkdXJZRIxca+m/2oMD6
	SCN27BKcb62E+jczLUjjFTeSJg+eIrDH51/HFPZWNI0m5nUp1l2Cu7l953fRqiRFLZhW0DnHXNi
	B+HTEV9Mf6A==
X-Received: from dlec12-n1.prod.google.com ([2002:a05:701b:428c:10b0:141:36b0:e73b])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6300:68c8:10b0:3d3:ae40:51e7
 with SMTP id adf61e73a8af0-3d3ae4056f9mr2634694637.27.1787955655343; Fri, 28
 Aug 2026 15:20:55 -0700 (PDT)
Date: Fri, 28 Aug 2026 15:20:44 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.55.0.897.gb25b4bd76c-goog
Message-ID: <20260828222045.1314766-1-irogers@google.com>
Subject: [PATCH v1 1/2] perf tool: Remove util/cache.h
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	James Clark <james.clark@linaro.org>, Thomas Richter <tmricht@linux.ibm.com>, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Move definitions to places they are used, or path.h in the case of
path.c's mkpath function. Remove unused definitions. Fix transitive
include dependencies.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/builtin-annotate.c      |  2 +-
 tools/perf/builtin-config.c        |  2 +-
 tools/perf/builtin-help.c          |  2 +-
 tools/perf/perf.c                  |  8 +++++++-
 tools/perf/util/cache.h            | 31 ------------------------------
 tools/perf/util/config.c           |  2 +-
 tools/perf/util/help-unknown-cmd.c |  6 +++++-
 tools/perf/util/path.c             |  1 -
 tools/perf/util/path.h             |  3 +++
 tools/perf/util/strbuf.c           |  4 +++-
 10 files changed, 22 insertions(+), 39 deletions(-)
 delete mode 100644 tools/perf/util/cache.h

diff --git a/tools/perf/builtin-annotate.c b/tools/perf/builtin-annotate.c
index 69cb72b2082a..3efeb845099c 100644
--- a/tools/perf/builtin-annotate.c
+++ b/tools/perf/builtin-annotate.c
@@ -11,7 +11,6 @@
 
 #include "util/color.h"
 #include <linux/list.h>
-#include "util/cache.h"
 #include <linux/rbtree.h>
 #include "util/symbol.h"
 
@@ -38,6 +37,7 @@
 #include "util/branch.h"
 #include "util/util.h"
 #include "ui/progress.h"
+#include "ui/ui.h"
 
 #include <dlfcn.h>
 #include <errno.h>
diff --git a/tools/perf/builtin-config.c b/tools/perf/builtin-config.c
index 237600643bbd..f4f916241d1d 100644
--- a/tools/perf/builtin-config.c
+++ b/tools/perf/builtin-config.c
@@ -7,10 +7,10 @@
  */
 #include "builtin.h"
 
-#include "util/cache.h"
 #include <subcmd/parse-options.h>
 #include "util/debug.h"
 #include "util/config.h"
+#include "util/path.h"
 #include <linux/string.h>
 #include <limits.h>
 #include <stdio.h>
diff --git a/tools/perf/builtin-help.c b/tools/perf/builtin-help.c
index 2692b2e40a23..36f5c5e94289 100644
--- a/tools/perf/builtin-help.c
+++ b/tools/perf/builtin-help.c
@@ -4,8 +4,8 @@
  *
  * Builtin help command
  */
-#include "util/cache.h"
 #include "util/config.h"
+#include "util/path.h"
 #include "util/strbuf.h"
 #include "builtin.h"
 #include <subcmd/exec-cmd.h>
diff --git a/tools/perf/perf.c b/tools/perf/perf.c
index 1f51e8de6b1b..ad8c8067b765 100644
--- a/tools/perf/perf.c
+++ b/tools/perf/perf.c
@@ -10,13 +10,13 @@
 #include "perf.h"
 
 #include "util/build-id.h"
-#include "util/cache.h"
 #include "util/env.h"
 #include <internal/lib.h> // page_size
 #include <subcmd/exec-cmd.h>
 #include "util/config.h"
 #include <subcmd/run-command.h>
 #include "util/parse-events.h"
+#include <subcmd/pager.h>
 #include <subcmd/parse-options.h>
 #include <subcmd/help.h>
 #include "util/debug.h"
@@ -39,6 +39,12 @@
 #include <linux/string.h>
 #include <linux/zalloc.h>
 
+#define CMD_EXEC_PATH "--exec-path"
+#define CMD_DEBUGFS_DIR "--debugfs-dir="
+
+#define EXEC_PATH_ENVIRONMENT "PERF_EXEC_PATH"
+#define PERF_PAGER_ENVIRONMENT "PERF_PAGER"
+
 static int use_pager = -1;
 static FILE *debug_fp = NULL;
 
diff --git a/tools/perf/util/cache.h b/tools/perf/util/cache.h
deleted file mode 100644
index 0b61840d4226..000000000000
--- a/tools/perf/util/cache.h
+++ /dev/null
@@ -1,31 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-#ifndef __PERF_CACHE_H
-#define __PERF_CACHE_H
-
-#include "strbuf.h"
-#include <subcmd/pager.h>
-#include "../ui/ui.h"
-
-#include <linux/compiler.h>
-#include <linux/string.h>
-
-#define CMD_EXEC_PATH "--exec-path"
-#define CMD_DEBUGFS_DIR "--debugfs-dir="
-
-#define EXEC_PATH_ENVIRONMENT "PERF_EXEC_PATH"
-#define PERF_DEBUGFS_ENVIRONMENT "PERF_DEBUGFS_DIR"
-#define PERF_TRACEFS_ENVIRONMENT "PERF_TRACEFS_DIR"
-#define PERF_PAGER_ENVIRONMENT "PERF_PAGER"
-
-int split_cmdline(char *cmdline, const char ***argv);
-
-#define alloc_nr(x) (((x)+16)*3/2)
-
-static inline int is_absolute_path(const char *path)
-{
-	return path[0] == '/';
-}
-
-char *mkpath(char *path_buf, size_t sz, const char *fmt, ...) __printf(3, 4);
-
-#endif /* __PERF_CACHE_H */
diff --git a/tools/perf/util/config.c b/tools/perf/util/config.c
index 7988149dc7ed..6a310e56a2f1 100644
--- a/tools/perf/util/config.c
+++ b/tools/perf/util/config.c
@@ -11,7 +11,6 @@
  */
 #include <errno.h>
 #include <sys/param.h>
-#include "cache.h"
 #include "callchain.h"
 #include "header.h"
 #include <subcmd/exec-cmd.h>
@@ -19,6 +18,7 @@
 #include "util/hist.h"  /* perf_hist_config */
 #include "util/stat.h"  /* perf_stat__set_big_num */
 #include "util/evsel.h"  /* evsel__hw_names, evsel__use_bpf_counters */
+#include "path.h"
 #include "srcline.h"
 #include "build-id.h"
 #include "debug.h"
diff --git a/tools/perf/util/help-unknown-cmd.c b/tools/perf/util/help-unknown-cmd.c
index a0a46e34f8d1..f1cd9d4746f3 100644
--- a/tools/perf/util/help-unknown-cmd.c
+++ b/tools/perf/util/help-unknown-cmd.c
@@ -1,9 +1,9 @@
 // SPDX-License-Identifier: GPL-2.0
-#include "cache.h"
 #include "config.h"
 #include <poll.h>
 #include <stdio.h>
 #include <stdlib.h>
+#include <string.h>
 #include <subcmd/help.h>
 #include "../builtin.h"
 #include "levenshtein.h"
@@ -36,10 +36,14 @@ static int add_cmd_list(struct cmdnames *cmds, struct cmdnames *old)
 
 	if (nr > cmds->alloc) {
 		/* Choose bigger one to alloc */
+#define alloc_nr(x) (((x) + 16) * 3 / 2)
+
 		if (alloc_nr(cmds->alloc) < nr)
 			cmds->alloc = nr;
 		else
 			cmds->alloc = alloc_nr(cmds->alloc);
+
+#undef alloc_nr
 		tmp = realloc(cmds->names, cmds->alloc * sizeof(*cmds->names));
 		if (!tmp)
 			return -1;
diff --git a/tools/perf/util/path.c b/tools/perf/util/path.c
index 2e62f272fda8..bf5d081707e4 100644
--- a/tools/perf/util/path.c
+++ b/tools/perf/util/path.c
@@ -1,6 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0
 #include "path.h"
-#include "cache.h"
 #include <linux/kernel.h>
 #include <limits.h>
 #include <stdio.h>
diff --git a/tools/perf/util/path.h b/tools/perf/util/path.h
index fb850fb55c60..e7cdb0cb1097 100644
--- a/tools/perf/util/path.h
+++ b/tools/perf/util/path.h
@@ -4,9 +4,12 @@
 
 #include <stddef.h>
 #include <stdbool.h>
+#include <linux/compiler.h>
 
 struct dirent;
 
+char *mkpath(char *path_buf, size_t sz, const char *fmt, ...) __printf(3, 4);
+
 int path__join(char *bf, size_t size, const char *path1, const char *path2);
 int path__join3(char *bf, size_t size, const char *path1, const char *path2, const char *path3);
 
diff --git a/tools/perf/util/strbuf.c b/tools/perf/util/strbuf.c
index a64a37628f12..7b94aa1e5ade 100644
--- a/tools/perf/util/strbuf.c
+++ b/tools/perf/util/strbuf.c
@@ -1,5 +1,4 @@
 // SPDX-License-Identifier: GPL-2.0
-#include "cache.h"
 #include "debug.h"
 #include "strbuf.h"
 #include <linux/kernel.h>
@@ -54,9 +53,12 @@ int strbuf_grow(struct strbuf *sb, size_t extra)
 	if (nr <= sb->len)
 		return -E2BIG;
 
+#define alloc_nr(x) (((x) + 16) * 3 / 2)
+
 	if (alloc_nr(sb->alloc) > nr)
 		nr = alloc_nr(sb->alloc);
 
+#undef alloc_nr
 	/*
 	 * Note that sb->buf == strbuf_slopbuf if sb->alloc == 0, and it is
 	 * a static variable. Thus we have to avoid passing it to realloc.
-- 
2.55.0.897.gb25b4bd76c-goog

