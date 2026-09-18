Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48357501F5C
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 14:07:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789740459; cv=none; b=IyhnP+FHVmzVs9/wTmsO4/rCyEwqi/v1hMAcNNNhcDwFdGajbTml8LdxCumbY1LPzo2JNAXnbdLwneeDuMte2U78Bm5q5mz8nZfBac7IrNPojJuwIg83vbqEArKtt3HR4XenaaHXsVP5BOaFifMINGZRnGmEua9xExt+DejRuYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789740459; c=relaxed/simple;
	bh=uXUyVsWXdGRR9r0Yf+u2xCJJUCEXrufHCD6FF1dYRUw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=tILKmD0Az/8nWalMgsPteTpjYxphwHcKKP+JbBrFBa9eDwBYV/hOvlqu+2JxlmuKbTOWuGh/fHaiDIdLFZikJPcQU1k6Rle2KC2n09JfM8cFgT4oYf+1IuZxSc/VcBLx+tuJBA368b3Myf7wtfXFWeVZCZgnoao77nt4v4hMmzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=GXYYdja4; arc=none smtp.client-ip=209.85.216.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="GXYYdja4"
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-39d8646b10eso865747a91.1
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 07:07:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789740456; x=1790345256; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0q/ZlHbTsYZyN2/8M0P/yh3YerzxVzD8tkGrmWQ37IA=;
        b=GXYYdja4cWYwIpcP/pzL88ivLbL8oYf88bWntt6wEX1nk0Jh9/kIy3Mjg06XqVBnfg
         jPj/Kh/wQa5VtTsowMnnm3BrkmbfhQmzHqx+eG0IHlmq69X3/qQ79UWASCdRy4xDKzJI
         BbxvTzJMS79o5+FF4CvQL0QpGmkfdFMioJ8wD95XYK5qOd3miF796LFhaZJoni982qfv
         jW6M/XuKd+WIicEDwDjscb0mxR03PUL0LU5NtL7GNzGjnAb99b4+HLPVzXnXtg9P2Avx
         Vm6htTBteT41Ye5/oYIx88iPmrNZJIEG9xQlUbBWFDzWhiPCWKGOrYsHEHs8xiukl4Gw
         Uuhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789740456; x=1790345256;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0q/ZlHbTsYZyN2/8M0P/yh3YerzxVzD8tkGrmWQ37IA=;
        b=QX8VgU0puwl51VuPpXU+0aZ1W5Fpo0Q81B34WVje84q4IgoniP0gz0wWuWoerwjEa3
         idxbow5qiGFRr60NbYDbmMj4rWVhVhPS9OnBIQYpvrYChIJTeSEX6074Y8ibA2qI7WLn
         aTy2LI5Qa1Jbq2kuC5w81d/cOFJCoYor90YFlamr9Gjvh1E7SaMKDa6be0tSKUufsg7K
         3dqW3V/h3elfZIH29lCIn/Z/6hvqUOTeXFa8KCVwhUijLJaJDEST7YeotlwciFHJ7mpc
         xbuXMw1inKmdbhJXbcZ4wlvu7vBwkDl7kXNtLAcX3pQYmjCKeUJqudhHhsJ3Y0PyFcYQ
         quuA==
X-Forwarded-Encrypted: i=1; AKwUvBy7PgqsYjOD++6lPGz5/kRdNByY6780IYF0LZ5sHI5ct4fnj+lLgyFKfWim4rmkC0Q5pmqtIfoYqBfA3Ck=@vger.kernel.org
X-Gm-Message-State: AFuF++lv6B8jww1PRlj/+iWAlhgRbmJqC3WmjHYE+iwuH3hFL51km4FV
	dPxotecvNkbpW3ovlSoELCzrJY8xpK5x32i0EgB2Hz4z9C+Eqn7f6UvnBjaspyflJxQlAww2Se2
	rdLcQs3G3Zg==
X-Received: from dlbdx5.prod.google.com ([2002:a05:7022:e05:b0:143:f317:f434])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:4a03:b0:36d:9e0b:3801
 with SMTP id 98e67ed59e1d1-39e54d38c48mr9856774a91.8.1789740456293; Fri, 18
 Sep 2026 07:07:36 -0700 (PDT)
Date: Fri, 18 Sep 2026 07:06:57 -0700
In-Reply-To: <20260918140659.2501976-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <cover.1789662556.git.irogers@google.com> <20260918140659.2501976-1-irogers@google.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Message-ID: <20260918140659.2501976-15-irogers@google.com>
Subject: [PATCH v3 14/16] perf test trace_btf_general: Drop --max-events=1 and
 make non-exclusive
From: Ian Rogers <irogers@google.com>
To: irogers@google.com, acme@kernel.org, namhyung@kernel.org
Cc: adrian.hunter@intel.com, james.clark@linaro.org, jolsa@kernel.org, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	mingo@redhat.com, peterz@infradead.org
Content-Type: text/plain; charset="UTF-8"

trace_btf_general.sh used `--max-events=1` with `perf trace` on
commands such as `mv`, `echo`, and `sleep`. When background activity
occurs or tests run in parallel, `perf trace` can capture an event
from an unrelated process and exit prematurely before recording the
target command's syscalls.

Drop `--max-events=1` and let tracing run until the command completes,
checking for the expected output with grep (matching trace_btf_enum.sh).
Remove the (exclusive) tag so the test runs in parallel.

Running perf trace in parallel is only safe now that the probe tests no
longer name their probes "vfs_getname...": perf trace opens everything
matching a hardcoded "probe:vfs_getname*" wildcard, which used to pin
those probes and make their cleanup fail with -EBUSY.

Assisted-by: Antigravity:gemini-3.1-pro
Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/tests/shell/trace_btf_general.sh | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/tools/perf/tests/shell/trace_btf_general.sh b/tools/perf/tests/shell/trace_btf_general.sh
index 7a94a5743924..4d654b687a4e 100755
--- a/tools/perf/tests/shell/trace_btf_general.sh
+++ b/tools/perf/tests/shell/trace_btf_general.sh
@@ -1,5 +1,5 @@
 #!/bin/bash
-# perf trace BTF general tests (exclusive)
+# perf trace BTF general tests
 # SPDX-License-Identifier: GPL-2.0
 
 err=0
@@ -27,7 +27,7 @@ check_vmlinux() {
 
 trace_test_string() {
   echo "Testing perf trace's string augmentation"
-  output="$(perf trace --sort-events -e renameat* --max-events=1 -- mv ${file1} ${file2} 2>&1)"
+  output="$(perf trace --sort-events -e renameat* -- mv ${file1} ${file2} 2>&1)"
   if ! echo "$output" | grep -q -E "^mv/[0-9]+ renameat(2)?\(.*, \"${file1}\", .*, \"${file2}\", .*\) += +[0-9]+$"
   then
     printf "String augmentation test failed, output:\n$output\n"
@@ -38,7 +38,7 @@ trace_test_string() {
 trace_test_buffer() {
   echo "Testing perf trace's buffer augmentation"
   # echo will insert a newline (\10) at the end of the buffer
-  output="$(perf trace --sort-events -e write --max-events=1 -- echo "${buffer}" 2>&1)"
+  output="$(perf trace --sort-events -e write -- echo "${buffer}" 2>&1)"
   if ! echo "$output" | grep -q -E "^echo/[0-9]+ write\([0-9]+, ${buffer}.*, [0-9]+\) += +[0-9]+$"
   then
     printf "Buffer augmentation test failed, output:\n$output\n"
@@ -48,7 +48,7 @@ trace_test_buffer() {
 
 trace_test_struct_btf() {
   echo "Testing perf trace's struct augmentation"
-  output="$(perf trace --sort-events -e clock_nanosleep --force-btf --max-events=1 -- sleep 1 2>&1)"
+  output="$(perf trace --sort-events -e clock_nanosleep --force-btf -- sleep 1 2>&1)"
   if ! echo "$output" | grep -q -E "^sleep/[0-9]+ clock_nanosleep\(0, 0, \{1,.*\}, 0x[0-9a-f]+\) += +[0-9]+$"
   then
 	printf "BTF struct augmentation test failed, output:\n$output\n"
-- 
2.55.0.1082.g2b9226bbc0-goog

