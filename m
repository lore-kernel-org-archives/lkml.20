Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0307652CCFA
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 21:20:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789766417; cv=none; b=WHj6W8pYbWl26LT+C0kuGmhUkyJyTdJpSDO5ulx3OvT0worzgabWuZwYKY1ZsgQtpidNCugF74GehRkHO3R2wEoLHLTPhLbxp9Ah5xt+JLjbOr6RX1WzN1McwgFQNX5xXJMwhiZNK/Kt6poiO41M8C/3jEt6y26llq7aUiMxJAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789766417; c=relaxed/simple;
	bh=l5TAbWEU6B9V61riUhgaEbX3bYek64hdeMlGHIz+XJc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=D9Cz0d3cq61+2HjeW1kd0gsOpJ0tcoC38a+rIVWXu9soVKPnxHh38fp8xBwkCRb+VCyj4PwhWEd5ekM4NabVFWFE00w+V94KUWn285cT33lrh8HOLe7U0v0g1cRGQdGhfaVQ84rwzozSknMotzLYe27xRdOQhWd079z5NPsDQXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=euyjkDfd; arc=none smtp.client-ip=209.85.216.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="euyjkDfd"
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-396901263b6so2128958a91.2
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 14:20:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789766415; x=1790371215; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CQS0ArZiNsMn8IJnh7vbzYLZ5vZtatDhvYlp4Dv89Ww=;
        b=euyjkDfd2uaIUEv4jkGE9LiFgj234TiMtSeXAL8j3v6RkqnP0Qk5QzzVYm0cNmq+bn
         Jjzmwbg/XOOtLiGeaPoAKhVYmDtNB/dh/aIHcon12AEduKMfI6auIsuXXPEyHK5kg+e+
         Rfc0ylz3AifyZJtCgg4QxOrP9NyG+JLjrQSUc6O0ltSMfNWW9RnPsZzKzd+E/7bgnjrN
         TXJSeYIoEtVBeofYO4HTaWQ1X1iOSY7db+3bYrB63W5hsamkXtpaKmBKJkEhBUVUF+ob
         mC/HVvLkK4gXgHSgYFz+Ls4HTqVgsq4M9CzqUCKTmPtpSdsABvgZnVyox2htmxqXAKPa
         bGhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789766415; x=1790371215;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CQS0ArZiNsMn8IJnh7vbzYLZ5vZtatDhvYlp4Dv89Ww=;
        b=pI8T75kuubBmm10oyUEMP+PC4r82FI+59yUkGl35Dv/1ZorjouwLG71wmspIwQQ8AU
         vjP1H3FAkVai5lFPuJzlDj/s5y7QMlHeNajwDQzg7C3xUDMUdtJA4lB3v5BGeXmoum/8
         mUf7UZA3KTPNYFeLYA0E9CYpGZn7K9zfdlNafaJhxw0ORb9mfD/AM7R7O81jUCMwHHJA
         7UYboF6y6KkD5yBSn423EeRc/5YIjehfJMe3VaUZkV0YBB1EEAdHHo/0mspZg3EKYh2N
         u+wrQC0XN/teljJB8t/2NCsexifzlEjAtqZJv5+BG+9dJxvML3UuWOOdG2b2cH/g05GC
         jdAw==
X-Forwarded-Encrypted: i=1; AKwUvBxnbi0OOSWQk/+7gKJzsETxZWoic2YpPi4E3q7PDxwQZu7ge8SZm+Vbh/IaQeXzWfxVkP/1Y1wO4pLPUMA=@vger.kernel.org
X-Gm-Message-State: AFuF++nU3T44/QMNDu8UD9sp8iD3/QDD+055xLmUAC9fnxAFM6UXDWtK
	5sxYpZev5rP48wBbuC+T2894kHBJ5j6ahwAy89JMjSTpO4iXuT8v4OpFeq50b/7feDnhqjeEj4Y
	rPISCnc16eA==
X-Received: from dybbs27.prod.google.com ([2002:a05:7300:a21b:b0:337:a3b2:d113])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:5305:b0:381:6c5:3f63
 with SMTP id 98e67ed59e1d1-39e54dcd917mr13200518a91.6.1789766415217; Fri, 18
 Sep 2026 14:20:15 -0700 (PDT)
Date: Fri, 18 Sep 2026 14:19:25 -0700
In-Reply-To: <20260918211932.2966061-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260918140659.2501976-1-irogers@google.com> <20260918211932.2966061-1-irogers@google.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Message-ID: <20260918211932.2966061-12-irogers@google.com>
Subject: [PATCH v4 11/18] perf test test_task_analyzer: Isolate in temporary
 directory and make non-exclusive
From: Ian Rogers <irogers@google.com>
To: irogers@google.com, acme@kernel.org, namhyung@kernel.org, 
	Howard Chu <howardchu95@gmail.com>
Cc: adrian.hunter@intel.com, james.clark@linaro.org, jolsa@kernel.org, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	mingo@redhat.com, peterz@infradead.org
Content-Type: text/plain; charset="UTF-8"

test_task_analyzer.sh writes perf.data and temporary files directly into
the current working directory, causing collisions when running tests in
parallel.

As a temporary measure until `perf script report` supports an input file
option, resolve perfdir to an absolute path, change directory into $tmpdir
for the test duration, and clean up in the exit trap. Remove the
(exclusive) tag so the test runs in parallel.

perfdir is derived from $0, which may be relative, so it has to be
resolved before the cd into $tmpdir, otherwise both PERF_EXEC_PATH and
the cleanup trap point at paths that no longer exist.

Assisted-by: Antigravity:gemini-3.1-pro
Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/tests/shell/test_task_analyzer.sh | 20 +++++++++++++++-----
 1 file changed, 15 insertions(+), 5 deletions(-)

diff --git a/tools/perf/tests/shell/test_task_analyzer.sh b/tools/perf/tests/shell/test_task_analyzer.sh
index 0314412e63b4..443b88957b17 100755
--- a/tools/perf/tests/shell/test_task_analyzer.sh
+++ b/tools/perf/tests/shell/test_task_analyzer.sh
@@ -1,8 +1,18 @@
 #!/bin/bash
-# perf script task-analyzer tests (exclusive)
+# perf script task-analyzer tests
 # SPDX-License-Identifier: GPL-2.0
 
-tmpdir=$(mktemp -d /tmp/perf-script-task-analyzer-XXXXX)
+# Resolve the source directory before changing the working directory below,
+# $0 may be a relative path and would no longer resolve from $tmpdir.
+perfdir=$(cd "$(dirname "$0")/../.." && pwd)
+
+tmpdir=$(mktemp -d /tmp/perf-script-task-analyzer-XXXXX) || exit 1
+# The cleanup trap is only installed further down, once the functions it
+# calls have been defined, so tidy up by hand if this cd fails.
+cd "$tmpdir" || {
+  rmdir "$tmpdir"
+  exit 1
+}
 # TODO: perf script report only supports input from the CWD perf.data file, make
 # it support input from any file.
 perfdata="perf.data"
@@ -11,7 +21,6 @@ csvsummary="$tmpdir/csvsummary"
 err=0
 
 # set PERF_EXEC_PATH to find scripts in the source directory
-perfdir=$(dirname "$0")/../..
 if [ -e "$perfdir/scripts/python/Perf-Trace-Util" ]; then
   export PERF_EXEC_PATH=$perfdir
 fi
@@ -20,8 +29,9 @@ fi
 export ASAN_OPTIONS=detect_leaks=0
 
 cleanup() {
-  rm -f "${perfdata}"
-  rm -f "${perfdata}".old
+  # Step out of $tmpdir before removing it. The removal uses an absolute
+  # path and works from anywhere, so a failure to cd must not skip it.
+  cd "$perfdir" || cd / || true
   rm -rf "$tmpdir"
 
   trap - exit term int
-- 
2.55.0.1082.g2b9226bbc0-goog

