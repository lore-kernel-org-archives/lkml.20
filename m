Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C3B1466B77
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 07:14:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790147694; cv=none; b=RE5JHXLAqIYsztebQyOfBIEDsS++vDxLr4dyEr2/a5+UUfkju53V+qnkq07rtDZmBpm4OtIFh4OtN3T07ttExh8t1OPf7M1qfQY0kNKVIzCeAEo6WPbY7yvgqEZIs4X0i8X9/nd8BTri/l3AKg7r9aDV3znFuk5Gh+0ZfaJ1TWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790147694; c=relaxed/simple;
	bh=HGRs9eE+a+hJaFRu3Ek+1Q83wFRO/38c+2fbh/2XvQk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=FjapC6Xg5RZrSATLhQ7nJxQCYkhLYLww3Tk4ylYFELxVDuHnZsR4IhVMzBJs7UHEtzPU4oO2xYnuCNYK6GwoV6X8DGcv4l8/v2+RAmeTZ+f4tbhjGiUvXuzPXkamAuRdAItM2OFQDBTTRl601cnFNqSNFi7otu+/l0Mvd7CkKnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=QkvDPFS6; arc=none smtp.client-ip=74.125.82.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="QkvDPFS6"
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-334f782d1abso2068231eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 00:14:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790147691; x=1790752491; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ooYn38WMvkypRVHD0ux8njXnA46P1bfoYCxR163N8YI=;
        b=QkvDPFS6iTwtSaDPmrIF9O5gkOWvedF89Zir74ZVO5ZDftoBm24htcZz6AJ2JvCmYT
         mOpe5wPigyvpGcGjnhmPiWg/Fp+D3je1bEw2jC4Zh+cxcoRJ+pwNuoUlw856H/ZHFLHw
         LZIJ3yM3mKkNoPyaKKu2sbQOykmLlYF8u0710kEoO7mjZMxoCnHzIjWun5+VGCGP2jRz
         u+iwUSJcssE2D37Cy6PxoqP44LSdXYoH2rqheoui0rxccTR/Qw/mfUgUKIh4U3Evk254
         bRxcr88rmue5QforQEV93/MWF6QMPiiwBw/A0pLf+Jn4NwDTnfRzCWQA/bif9wLqmm81
         J4QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790147691; x=1790752491;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ooYn38WMvkypRVHD0ux8njXnA46P1bfoYCxR163N8YI=;
        b=08ODyk8Nl5Egr7f9qF+9pzQZZ+wMn3gG/QR8h+59BEOr7Jmf7SFNyDCLxozpnfcWUE
         fZaZwK62IIk9mzB61Q7YuHZc/vSzc6cDSvsC0SBW5TP+vC3QeigVHVSYJsoHc/qQ5NI4
         SGdccm1FG0EYeUVbgqr/XdfVAKaYqh1jxVOu2TutCA3ztHIT3leIopan/R9N7B91mQPJ
         R10hTABiReyLKDuflTuSsY9+fMurRcivbCOpROn/9lwjeyVhLKYz8wqqgELlqE5h35n0
         AwXNTlyU0oz+xXD88jzOfQkBxG4kYFejVFIyp5CsyUWsPoYm5KplBE5ZxA+O2WDg+dZ2
         pBKQ==
X-Forwarded-Encrypted: i=1; AKwUvByZBJzvQHV6K2C92BkCSm0ZFnbKtvpUUeSLlPbyjnjcI9niAM+8VV8COhuGAFJ3fJZaPAAfej45rfRwSMs=@vger.kernel.org
X-Gm-Message-State: AFuF++mILZhZxTijMfWErIZEpwfrv6x6smRXv7qaZRbny7GC+qYTk+Tf
	yURXJLZrMtyj1M1i3px94PY+Zsbbjb+b63dbGw1QzmyM63kWf9XaQDpnnZIDuTeabk2RhGDmg8f
	fbNdZnQfaQA==
X-Received: from dli6-n1.prod.google.com ([2002:a05:7022:286:10b0:144:e53d:6fa6])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:b903:b0:144:ed03:7c6a
 with SMTP id a92af1059eb24-144f90c371fmr2036646c88.15.1790147683855; Wed, 23
 Sep 2026 00:14:43 -0700 (PDT)
Date: Wed, 23 Sep 2026 00:13:56 -0700
In-Reply-To: <cover.1790145937.git.irogers@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <cover.1790145937.git.irogers@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <d3f26f77e5aabb9776c9a4775ca650f6d90b0136.1790145937.git.irogers@google.com>
Subject: [PATCH v5 16/23] perf test test_task_analyzer: Isolate in temporary
 directory and make non-exclusive
From: Ian Rogers <irogers@google.com>
To: irogers@google.com, acme@kernel.org, howardchu95@gmail.com, 
	namhyung@kernel.org
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
2.56.0.rc1.315.gc6ed9934b7-goog

