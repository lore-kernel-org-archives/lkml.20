Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D778A4AA026
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 15:49:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788364157; cv=none; b=hGep3/TOHOvvDG8b23gfQ7yzhoKm2xpkkvhq3Cm618AcxZ2LN5mm/sDdbwezSsH1hHhXQauCysD3Vz8WqiXo0te+/mAVluDD3Nvwq8JMRJLR5bOR7gghxfpUa3mP0XWsSRuRlacVadggrgpdY/HBPdmIq3vfME2gLwjsgq3AhSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788364157; c=relaxed/simple;
	bh=0rHOZoRobN/My/uaUo/taCIKk/nrLMB8OuXHYhWB9Q8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Content-Type; b=A3payULfMj/+6F0C8XUreDCqVXeRwR6CpnJcddN7GnnKeS5NLmp2OII6co19aR7W2Wsk58X5k6/Lbc4h58tOnBda86GdpCN30TWk6uM/f7IqBI95nNRoeIC2aicZDAKuSmCdYiWrq4ZiuAbre1J8U0dJ2r90BDK9u5KJhRZMfZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=pYJ8FKex; arc=none smtp.client-ip=209.85.216.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="pYJ8FKex"
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-398d292eac1so2503906a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 08:49:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788364154; x=1788968954; darn=vger.kernel.org;
        h=content-type:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HlO9J/OYs/VWmsx5/JTVY1hRLPz5HlVbyPwG8syJOco=;
        b=pYJ8FKexkoISdSpA7BHKigvVZVNZAfQnDLEpBSmWswDuN9AdrPQ8pdf+ZoPhIzK95X
         jC/CZ+ztIBQ2xQC6PF2Xy1RSM5dKCVOU2Nq4UiZIt/J5wForY+yGcmg6GtUFC7MGh/6U
         SBG3HBrWkn4IYsPjsqAz/4EC7muuSdDgha/BDXJAa9KJEbYVT/3XLn/VFHHECpgvb0S4
         ZCka2e19NM0f18mXSbSea1SOKpp2cprJGcRvVWR2OUnEbeZr2q1q/gxX2bI33sOSgQcT
         2dkyN4eGdGOngJbXqS4zfjfRkOOTyhdKhIVN/CegbKgnHbAu5xL8wOCVZ9sNXooFLfcX
         SXNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788364154; x=1788968954;
        h=content-type:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HlO9J/OYs/VWmsx5/JTVY1hRLPz5HlVbyPwG8syJOco=;
        b=g6npmMwU3FF3sUOU85JOahJSvus1YPmV+gnRQ15XK8py2WhIBRcRWNRrzF/Z20iK0f
         vNijDD5YCPURhtO3IUOWjwn/Ho67UzUGwQOgddL8ImBT63gzY4SHdPRzOSFWRbHH5oiR
         DheiB5H/EYqAnjaL2DgAGBy7ld1umwqXHBTTGAVuc7dTMt+VlNc1dvCiLebD5ZEKWtXL
         7ingd5sTUmAqy2482J4+wNrvqwWkGqj1/m5vNQ6fOwYQ/wI6Lxsx0wbuzhQ6zZ4j5FBY
         oiVntsdB8vR1gNZDzgQxjcvYY1U8jOTsvQmWH+QCLWF8RlQwXjoJhQBTmJQ0JDRZtWiI
         Yt9g==
X-Forwarded-Encrypted: i=1; AKwUvBxyMDDaoIvRmrGW1RFUIBwSsJtWa4AxpFKCX3TYqxxIFLshqLPqZnEHroxSzy4FEFu4sgpWK1G9Ttb/sso=@vger.kernel.org
X-Gm-Message-State: AFuF++lFKINkFndG6Ik4sG59UUfVgEiPiyk/C8+EjCf9ykHNa/x9OUY5
	hAzEGjh4Rpl6cX0ut7alxbG2LuBDMwdGwZ8EN/uXzJ2H0lspp6pUbVDcP14Uawu60ZEJHNM7gj2
	0TW2dTZu7Ag==
X-Received: from dltt5.prod.google.com ([2002:a05:701a:c965:b0:141:a317:d828])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:524c:b0:390:8361:a532
 with SMTP id 98e67ed59e1d1-39aedfb8ebcmr8928932a91.7.1788364153348; Wed, 02
 Sep 2026 08:49:13 -0700 (PDT)
Date: Wed,  2 Sep 2026 08:48:58 -0700
In-Reply-To: <20260902154858.2078885-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260902154858.2078885-1-irogers@google.com>
X-Mailer: git-send-email 2.55.0.966.g6673acef38-goog
Message-ID: <20260902154858.2078885-7-irogers@google.com>
Subject: [PATCH v3 6/6] perf hist: Remove keysym.h include from hist.h
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	James Clark <james.clark@linaro.org>, Tianyou Li <tianyou.li@intel.com>, 
	Jiebin Sun <jiebin.sun@intel.com>, Dapeng Mi <dapeng1.mi@linux.intel.com>, 
	Eric Biggers <ebiggers@kernel.org>, Thomas Richter <tmricht@linux.ibm.com>, 
	Stephen Brennan <stephen.s.brennan@oracle.com>, Swapnil Sapkal <swapnil.sapkal@amd.com>, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

hist.h isn't related to UI and so remove the UI inclusion. Fix the
transitive dependency issues this exposes.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/builtin-annotate.c     | 8 ++++++++
 tools/perf/builtin-c2c.c          | 1 +
 tools/perf/builtin-kvm.c          | 1 +
 tools/perf/builtin-report.c       | 1 +
 tools/perf/builtin-top.c          | 1 +
 tools/perf/ui/browsers/annotate.c | 1 +
 tools/perf/ui/browsers/hists.c    | 1 +
 tools/perf/ui/browsers/scripts.c  | 1 +
 tools/perf/ui/libslang.h          | 2 ++
 tools/perf/util/hist.h            | 6 ------
 10 files changed, 17 insertions(+), 6 deletions(-)

diff --git a/tools/perf/builtin-annotate.c b/tools/perf/builtin-annotate.c
index f208ff513238..a4c014a1d28f 100644
--- a/tools/perf/builtin-annotate.c
+++ b/tools/perf/builtin-annotate.c
@@ -24,6 +24,7 @@
 #include "arch/common.h"
 #include "builtin.h"
 #include "perf.h"
+#include "ui/keysyms.h"
 #include "ui/progress.h"
 #include "ui/ui.h"
 #include "util/annotate-data.h"
@@ -46,6 +47,13 @@
 #include "util/tool.h"
 #include "util/util.h"
 
+#ifndef HAVE_SLANG_SUPPORT
+#undef K_LEFT
+#define K_LEFT  -1000
+#undef K_RIGHT
+#define K_RIGHT -2000
+#endif
+
 struct perf_annotate {
 	struct perf_tool tool;
 	struct perf_session *session;
diff --git a/tools/perf/builtin-c2c.c b/tools/perf/builtin-c2c.c
index 715b75d42f2a..6b64c0d6b24f 100644
--- a/tools/perf/builtin-c2c.c
+++ b/tools/perf/builtin-c2c.c
@@ -49,6 +49,7 @@
 #include "thread.h"
 #include "tool.h"
 #include "ui/browsers/hists.h"
+#include "ui/keysyms.h"
 #include "ui/progress.h"
 #include "ui/ui.h"
 #include "util/annotate.h"
diff --git a/tools/perf/builtin-kvm.c b/tools/perf/builtin-kvm.c
index b9f6cb71c0a0..c5e82c078848 100644
--- a/tools/perf/builtin-kvm.c
+++ b/tools/perf/builtin-kvm.c
@@ -27,6 +27,7 @@
 #include "util/kvm-stat.h"
 #include "util/util.h"
 #include "ui/browsers/hists.h"
+#include "ui/keysyms.h"
 #include "ui/progress.h"
 #include "ui/ui.h"
 #include "util/string2.h"
diff --git a/tools/perf/builtin-report.c b/tools/perf/builtin-report.c
index 60d1f166629e..6f4ad5fa536d 100644
--- a/tools/perf/builtin-report.c
+++ b/tools/perf/builtin-report.c
@@ -51,6 +51,7 @@
 #include "util/units.h"
 #include "util/unwind.h"
 #include "util/util.h" // perf_tip()
+#include "ui/keysyms.h"
 #include "ui/ui.h"
 #include "ui/progress.h"
 #include "util/block-info.h"
diff --git a/tools/perf/builtin-top.c b/tools/perf/builtin-top.c
index 570410599f1b..44ba67e53cf1 100644
--- a/tools/perf/builtin-top.c
+++ b/tools/perf/builtin-top.c
@@ -51,6 +51,7 @@
 #include "util/intlist.h"
 #include "util/parse-branch-options.h"
 #include "arch/common.h"
+#include "ui/keysyms.h"
 #include "ui/ui.h"
 
 #include "util/debug.h"
diff --git a/tools/perf/ui/browsers/annotate.c b/tools/perf/ui/browsers/annotate.c
index e47a46775089..61ffdc52933d 100644
--- a/tools/perf/ui/browsers/annotate.c
+++ b/tools/perf/ui/browsers/annotate.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 #include "../browser.h"
 #include "../helpline.h"
+#include "../keysyms.h"
 #include "../ui.h"
 #include "../../util/annotate.h"
 #include "../../util/debug.h"
diff --git a/tools/perf/ui/browsers/hists.c b/tools/perf/ui/browsers/hists.c
index c15874a491b4..f62cb2d534ed 100644
--- a/tools/perf/ui/browsers/hists.c
+++ b/tools/perf/ui/browsers/hists.c
@@ -35,6 +35,7 @@
 
 #include "../browsers/hists.h"
 #include "../helpline.h"
+#include "../keysyms.h"
 #include "../util.h"
 #include "../ui.h"
 #include "map.h"
diff --git a/tools/perf/ui/browsers/scripts.c b/tools/perf/ui/browsers/scripts.c
index 1e8c2c2f952d..94cc1f427c96 100644
--- a/tools/perf/ui/browsers/scripts.c
+++ b/tools/perf/ui/browsers/scripts.c
@@ -7,6 +7,7 @@
 #include "../../util/session.h"
 #include "../../util/symbol.h"
 #include "../browser.h"
+#include "../keysyms.h"
 #include "../libslang.h"
 #include "config.h"
 #include <linux/err.h>
diff --git a/tools/perf/ui/libslang.h b/tools/perf/ui/libslang.h
index 6722561e0458..dd6b9f192155 100644
--- a/tools/perf/ui/libslang.h
+++ b/tools/perf/ui/libslang.h
@@ -15,7 +15,9 @@
 #define ENABLE_SLFUTURE_CONST 1
 #define ENABLE_SLFUTURE_VOID 1
 
+#ifdef HAVE_SLANG_SUPPORT
 #include <slang.h>
+#endif
 
 #define SL_KEY_UNTAB 0x1000
 
diff --git a/tools/perf/util/hist.h b/tools/perf/util/hist.h
index b830cbe7f95b..b30375a203e7 100644
--- a/tools/perf/util/hist.h
+++ b/tools/perf/util/hist.h
@@ -714,7 +714,6 @@ struct block_hist {
 #define NO_ADDR 0
 
 #ifdef HAVE_SLANG_SUPPORT
-#include "../ui/keysyms.h"
 void attr_to_script(char *buf, struct perf_event_attr *attr);
 
 int __hist_entry__tui_annotate(struct hist_entry *he, struct map_symbol *ms,
@@ -787,11 +786,6 @@ static inline int block_hists_tui_browse(struct block_hist *bh __maybe_unused,
 {
 	return 0;
 }
-
-#define K_LEFT  -1000
-#define K_RIGHT -2000
-#define K_SWITCH_INPUT_DATA -3000
-#define K_RELOAD -4000
 #endif
 
 unsigned int hists__sort_list_width(struct hists *hists);
-- 
2.55.0.966.g6673acef38-goog

