Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE9073E4104
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 04:53:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789620819; cv=none; b=NCNKvd8im+MN7fCR9IpdXlh3ZkSNn6ZsDdUvMQrLiCeNkGbQcrhanDV+VVwDPiAYNyv28EexNtXGbcFoP+FsKBZfCBtkb0h7Q/aVj9SDPqKKbI9HAEwYKkTmxJiK8p4yxer1FN4o62QAgmoxizPB/D76w2FBqpS4lqQCwnjmfsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789620819; c=relaxed/simple;
	bh=ibELKQVAYhSfge9/lsSfuKL+EgcxyDwO7B03A8+Cc/8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=T0sXgl2dXxzxDBGuRCAvVXxMfy1s9U5YBEWQL9er0/UEGUXJ7Y0Tpn7iIQ86jShtCzdjrpguttTojx6OJ2TsyR+UwKMMzBz6sIbsHttjnq0jZsBEMD6wf+PyQDqpkujWB9i/I972w9ZN+g0btBCXgSyc+zsTxTzM9iXr5CAcn3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=VFg/U6jw; arc=none smtp.client-ip=209.85.215.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="VFg/U6jw"
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c85798977dcso606792a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 21:53:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789620817; x=1790225617; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=72CSLnQbeA4ZEEUcuYiv0dIvEEceHpo0qmSlWpbBICc=;
        b=VFg/U6jwUsfZCeetBFWOO0VvChN3JlEJdLopNSdYUO3TvmwYvyY+16j8ER0eAMzcRF
         YN5ax+JWk9KOv0u4L7TKLtNFZsWQ2T9X7bVWWGpJ1onu8FcxkQVBZaIG7lgtzs/dhK9V
         nQVOrRX9Dh8LLcwLMy2cfHuSt3e9LM103d4uAzPYwM5RBKKv1b9RZq4rqAnwBoHodI8P
         D+Hwrp6vOvoCjVWK/QKNX9AbzpgX6kSpqkgpo+t9IXEsrIh2oz+LglY4cekybT5N685a
         MxNgfviQMAiQMUaU2D+grNyB7NEvtILbVgzzVQr9Lz/qxUxtvvBAI2J/kdIeanBonbJw
         0m4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789620817; x=1790225617;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=72CSLnQbeA4ZEEUcuYiv0dIvEEceHpo0qmSlWpbBICc=;
        b=cKGh8pguIdwqcAkE+86DOz7p3D5PwW+AYBXrZJ7ttzxmIbuPYbgsswrC9XRpmO2mO2
         FyfaEXdYjBIOC/6ILgDu/WHhbElzP4L2eFC0DoGjaAOTNLLiUwd6eTwFVJYTKlaBIGPV
         8rhI1TriLQ+GwcDexMjLKPW2ifjUnLWicJYHQdcChuoxPOa+jKacuSdPDDfmo/sUPIgC
         jKbfAxke7joHdF70ggWX3pydsTTTA48A3sXQPW5AspfQv2EwPuDhzgAAuUknXrhg8VSX
         UMYOR5vGiWBKPqzUx8LCPWp3jAh6a7LaqAc41HMSoDWuH2bikk/DAM8sVBD1WF6GLkT8
         BAmw==
X-Forwarded-Encrypted: i=1; AKwUvBzNA5QOB/QdQgCLJ02FscCCDzpYPOJV6dPDuLpZzOybxnOYHXhnCPEOX97aZXLzdeCWtS4m4ukyQFdMMkY=@vger.kernel.org
X-Gm-Message-State: AFuF++mxguLjamWdz96narO55CAMA+0y779efvjuHMK7ozjn7/6lnefd
	MjJ5FmdxlgJr5eAGM9+2Jxn/LgJFqvjHGRlXwmUtNh+SKE5I96l/No1yciPM9znE3ZMpA6oCpz9
	k9gfx6icooA==
X-Received: from dycnr8-n2.prod.google.com ([2002:a05:7300:e9c8:20b0:32e:3955:bc8d])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:e290:b0:3d3:ae40:51e7
 with SMTP id adf61e73a8af0-3dd5f7add8fmr11957483637.27.1789620816834; Wed, 16
 Sep 2026 21:53:36 -0700 (PDT)
Date: Wed, 16 Sep 2026 21:53:17 -0700
In-Reply-To: <20260917045326.63601-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260917045326.63601-1-irogers@google.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Message-ID: <20260917045326.63601-2-irogers@google.com>
Subject: [PATCH v1 02/11] perf bench messaging: Add missing includes and sort headers
From: Ian Rogers <irogers@google.com>
To: Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	James Clark <james.clark@linaro.org>, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Cc: sashiko-bot@kernel.org
Content-Type: text/plain; charset="UTF-8"

Sashiko reported:

  When building the perf tool on systems using musl libc, compilation
  of tools/perf/bench/sched-messaging.c fails due to missing
  signal-related header declarations.

  The POSIX signal API and associated constants (SIGKILL, SIGINT,
  SIGTERM) are referenced in sig_handler() and bench_sched_messaging()
  but require an explicit inclusion of <signal.h>. While builds on
  glibc succeed because the header is implicitly pulled in via other
  includes, strict libc environments like musl do not provide this
  implicit namespace pollution.  This results in undeclared identifier
  errors for kill() and signal() during the build process.

Add the header files and use git clang-format to sort.

Reported-by: sashiko-bot@kernel.org
Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/bench/sched-messaging.c | 20 +++++++++++---------
 1 file changed, 11 insertions(+), 9 deletions(-)

diff --git a/tools/perf/bench/sched-messaging.c b/tools/perf/bench/sched-messaging.c
index 4fb6657fc826..5bdcc0595367 100644
--- a/tools/perf/bench/sched-messaging.c
+++ b/tools/perf/bench/sched-messaging.c
@@ -14,21 +14,23 @@
 #include "bench.h"
 
 /* Test groups of 20 processes spraying to 20 receivers */
-#include <pthread.h>
+#include <errno.h>
+#include <limits.h>
+#include <signal.h>
 #include <stdio.h>
 #include <stdlib.h>
 #include <string.h>
-#include <errno.h>
-#include <unistd.h>
-#include <sys/types.h>
-#include <sys/socket.h>
-#include <sys/wait.h>
-#include <sys/time.h>
-#include <poll.h>
-#include <limits.h>
+
 #include <err.h>
 #include <linux/list.h>
 #include <linux/time64.h>
+#include <poll.h>
+#include <pthread.h>
+#include <sys/socket.h>
+#include <sys/time.h>
+#include <sys/types.h>
+#include <sys/wait.h>
+#include <unistd.h>
 
 #define DATASIZE 100
 
-- 
2.55.0.1082.g2b9226bbc0-goog

