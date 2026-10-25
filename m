Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792964983;
	b=e6Vn5Fv9ciWlUyZCLFoOiZ+0Gi0hxRhi4LVAJB0pzZnToYc6GB+rAUKFEL/J2StcoknB
	 OSf0iIke5FwskckJfZKTfnRxioZuuecIq8HU8lEClkql9R+xh1B63qRjQLsYrPAmFkClm
	 JZCp7Zs1uVufzifnA9KAQe1lCnAvIYo+GqncvKtp9udVvyY+rK44iSRol0S6GNUEKW00r
	 bviPaD3hbWCWfuMXVKwojNPBUgjpRmjxA7HVtTsyRi79HMnKdUOuCpKgmbUnvvKWFp+cr
	 B1QPXTdLfFOPptavKps+AyfOe03g1XqvXIZPmVNTu9oSFqbZwOXRT701B15l9FlVg9A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792964983;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Content-Type;
	bh=rSl/IRl/7R53a17GL4J9p0EIN6qioPBOxysY/CGRCZ8=;
	b=ffmzd6cZccS1xcCiBedpXJfa1XssxRQCstsQ+VQ7b1lYaTcJ5y6NeXP9i61qKr8BYpL3
	 dQ+SfMX9Ml5OnYJQ8GAkPJXytP+3xHMExEafZvdsHwNX49dYVUq141l8oemP8xIptx280
	 90482x4Fq2AxV6VMPRt/qqrG80t9XeSWjQY2xOgS8DkTFICVNF5ANDBDXQFl0LR/hzWoC
	 rc72vSlrXxEuoDOkEEWdOXU26BzavxZIsW5Ej2TpkzJ0FHXHw/O9OvCx0wLMBnjAvsmBs
	 QLJT9ZwdzmWx0AGYTDCGImoR2P8L3jl9rSuY4tLO6EtL+v9+5zN4z29g3+zSI2ZZzFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=r2Rt2lom;
	arc=none smtp.remote-ip=74.125.82.197
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30C7E606A31B
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 21:49:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 30C7E606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=r2Rt2lom
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso5199381eec.1
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 14:49:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792964981; x=1793569781; darn=vger.kernel.org;
        h=content-type:to:from:subject:message-id:mime-version:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=rSl/IRl/7R53a17GL4J9p0EIN6qioPBOxysY/CGRCZ8=;
        b=r2Rt2lomB3QnV4EK1aO7dOz5gUTGEEkqARp7iXsYagt+c4tci0PiYaArEJe1ZQLGBg
         JpOPpX8c0G2eCPDf0d+F5iwEvULjNxyE6Ru+CBExTrafav1hBwOghYNnEKMfQTEwGa6p
         5heoT5JRt1kQWLDQELdMXxpZMLm+S8lMHye2ID6Tizv3CBKvtYhRHZ0RGT4vDjV+Utsj
         yRJDyWe9tqPOgnA9lLAEmvoymLDgBbdh1o26c4mONZj2WW2Se0AGVW+HTBGD3SCrGPtN
         6aXnjIWMPZFekkalYRe7OuGkLQVZpjib0/7nmlTc+RQeYWJBNERTPvWjZAcbrIKIMLA4
         dCXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792964981; x=1793569781;
        h=content-type:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rSl/IRl/7R53a17GL4J9p0EIN6qioPBOxysY/CGRCZ8=;
        b=AG9rjrf+xy7ucDLFhjHwF40mHQi4VpxaPXGQBLxqrg0QH1ihb084jwYPB1LHSieLH/
         ltmyUOtg/sqZZ00fD2NTbC4QKPNfo+bW369y8IKLjtdRd4Y+iWqMxgMzSlKVcF/dJgkk
         vLURX36pjFAyiP+Dcl3JkbqtWkZHtKOd52QvES0aeNnbQuu+g05alEaY4QqWVkp8YGsp
         m1Mmg5nCjWHyVGfD1hBiZ7DCyj57PHhwN+xZ4aEUG977yzpa/VVtpRzdWm0Cing1ovOR
         kLWNUWshlgnqGjfVIL29k6Bt25xjAvENRkST2zvrLcw05+y8LbFAWJdPC/I7A+5A+zvD
         Fynw==
X-Forwarded-Encrypted: i=1; AKwUvBz7Hx6e0T9WJ1FuuaA0Ybd1B476FPboJ+Gzn/36A7G8u0/7/IIBDEn4ZaAVwU55lTLk4TCntTspz16Ip+A=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ1BPQzbu2nbv7swZuG8PC1n0O9N6sKa7ctucDqi/T9O2vKR4dC
	MXiXYXKRpP3faBe3Khup/zuJcejVX/OvuV9rk0mYNX09jGjklbItyiK2lKE2ZGhX8fTPj7sjTTr
	jCTeFDol5Yw==
X-Received: from dli20-n2.prod.google.com ([2002:a05:7022:294:20b0:19f:527d:96cf])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:701b:451c:20b0:193:5449:b889
 with SMTP id a92af1059eb24-1993f6d2ccemr6647782c88.45.1792964980671; Sun, 25
 Oct 2026 14:49:40 -0700 (PDT)
Date: Sun, 25 Oct 2026 14:49:28 -0700
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.307.g5fe7bd680c-goog
Message-ID: <20261025214928.1225895-1-irogers@google.com>
Subject: [PATCH v1] perf test task-exit: Fix POLLHUP busy-loop race waiting
 for SIGCHLD
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@linux.dev>, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

In the kernel's do_exit(), perf_event_exit_task() runs before exit_mm()
and exit_notify() (which delivers SIGCHLD to the parent). Once
perf_event_exit_task() completes, PERF_RECORD_EXIT is written to the
ring buffer and POLLHUP is set on the perf event file descriptor.

In test__task_exit(), once POLLHUP is set on the fd, evlist__poll()
returns immediately on every call without blocking. If the child is
still in exit_mm()..exit_notify() on another CPU when the parent reads
PERF_RECORD_EXIT, exited is still 0 and the retry loop spins through all
1000 non-blocking poll() calls in less than a millisecond before SIGCHLD
is delivered.

Sleep briefly with usleep(1000) on subsequent retries (which also wakes
early on EINTR when SIGCHLD arrives), mark exited as volatile
sig_atomic_t, and reset exited and nr_exit on test entry.

Fixes: 791ce9c48c79 ("perf test: Avoid infinite loop for task exit case")
Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/tests/task-exit.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/tools/perf/tests/task-exit.c b/tools/perf/tests/task-exit.c
index 9fac426ac2f9..1a9de2d13497 100644
--- a/tools/perf/tests/task-exit.c
+++ b/tools/perf/tests/task-exit.c
@@ -9,13 +9,14 @@
 
 #include <errno.h>
 #include <signal.h>
+#include <unistd.h>
 #include <linux/string.h>
 #include <perf/cpumap.h>
 #include <perf/evlist.h>
 #include <perf/mmap.h>
 
-static int exited;
-static int nr_exit;
+static volatile sig_atomic_t exited;
+static volatile int nr_exit;
 
 static void sig_handler(int sig __maybe_unused)
 {
@@ -55,6 +56,8 @@ static int test__task_exit(struct test_suite *test __maybe_unused, int subtest _
 	struct mmap *md;
 	int retry_count = 0;
 
+	exited = 0;
+	nr_exit = 0;
 	signal(SIGCHLD, sig_handler);
 
 	evlist = evlist__new_dummy();
@@ -135,6 +138,8 @@ static int test__task_exit(struct test_suite *test __maybe_unused, int subtest _
 			err = -1;
 			goto out_put_evlist;
 		}
+		if (retry_count > 1)
+			usleep(1000);
 
 		goto retry;
 	}
-- 
2.56.0.307.g5fe7bd680c-goog

