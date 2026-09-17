Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CE0B5372C6
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 16:39:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789663191; cv=none; b=L0j2GDRWthfCs5n22Wu/fVRFoajgv/xnI84TSzPO6JYdZkvYs4zLno/J6LXmFNhiLE3W9gGfQtWy2Y1//4THcahOvux0V5A2BdN8LRNtN4wCqsMMu0Zme7z1ZPG2SPWQ8+x1ySqAGdtk9VDJOOg6E6j/i7QI3LK5K5VGeKK+VpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789663191; c=relaxed/simple;
	bh=uXUyVsWXdGRR9r0Yf+u2xCJJUCEXrufHCD6FF1dYRUw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=hQ6FmhSsLv/GBI28aXb2z6qKJghyt3yg8IvndpXyC1ClNQmcSSUC1tWgKqBS5MqnOz6xlQKqalEl/WQWS8PYKdnBFqojTd0yiCpmsJPELexnbQLoEgrh+u7uindYSyzcAn6PEEK2ou5wi9wDkHH5jRgGwbcS1EwWT1lw39bHpsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=p+aNd8zv; arc=none smtp.client-ip=209.85.215.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="p+aNd8zv"
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cc1cdfb337eso1478772a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 09:39:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789663189; x=1790267989; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0q/ZlHbTsYZyN2/8M0P/yh3YerzxVzD8tkGrmWQ37IA=;
        b=p+aNd8zvJVtBwNmPNZxyobP+Yo0ls6vOKsrz6jdP4vJxRvouWO4j6vztrGAp65DmIR
         vhxIEc3gDAKATzK7Qu5uNaCX54DUHHF/jktCFyv/q187l7yxn3AOGx/LZSyeLJ73hcnh
         Upaz+yzy1BHpONNGeLiBSHhZAcAh/gifR+L2HhiFn8gSHkIDIEeWZoP60JkOA82WQR2Y
         sNeO2snLh6BwQOWYehFuBkVorzzE2NnK6p4baqFl9oPaDMba7KXznfglyejxSBDUOcyB
         NUbJRnLi+kg8IhvfW6cYf339c45VLSFq4fhAKFoyUj7/DuZQWpjJlYM4VOZHeR0t7I/J
         u5+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789663189; x=1790267989;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0q/ZlHbTsYZyN2/8M0P/yh3YerzxVzD8tkGrmWQ37IA=;
        b=cOYHjGt9p4I6t5gAmtmfjFW0nD2efKz/LWXkFcQq8X9A1pUMVwv8P+P8SEFmOIS65p
         sIl4+QWys359qcqD3dBU0mBtoRENAqfiOI0DMyW/ebfqBxYWxHLCtHQ4Ryd//4QobyPe
         zw7QFTyvLZLmXSUw+WxNyxxO9pJ3iw8rCi0WBnpBIlBldnrbTRYxIYx+uwFlHQXXswIe
         GDsX7LrJDOte7/uLSR3HB/0RvM9Cs60SbsTnMGYsawkSxOLf1QrMlKcmu3POGJEoElXf
         +oCz0F9OzQYTzhG6h9t4+BM4G15bhZvult/sMNwurX7FSvobMUQQFNAhk+ITVj3KNrYc
         V4wQ==
X-Forwarded-Encrypted: i=1; AKwUvBzusQ8bFFdHXzSs5JrknUZM9aiij6pv7/UYP0gMXJ/v2nZ+9m01L1oZFlfdgsIq4cV9c6kmaeWHB70ZOLk=@vger.kernel.org
X-Gm-Message-State: AFuF++kzATmxFVqsA01BvBJQ7W1ACNEBhCnXXwGGt+SlIeHo0X306y67
	WEIZumajNR3be+yw/PQPPaFccGJ0GjtLOgqQ3Ti74/qyZagVpJWiAGxCj+EylHm0NKUP5MXG49z
	JNnp5itJzGw==
X-Received: from dldyr11-n1.prod.google.com ([2002:a05:701b:450b:10b0:143:64ee:152c])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:ce46:b0:3dd:85a8:4c5b
 with SMTP id adf61e73a8af0-3dd85a84e3fmr1512128637.34.1789663188695; Thu, 17
 Sep 2026 09:39:48 -0700 (PDT)
Date: Thu, 17 Sep 2026 09:39:00 -0700
In-Reply-To: <cover.1789662556.git.irogers@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <cover.1789662556.git.irogers@google.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Message-ID: <c031566fe3af02b978c7e7ae47c6f7d4a05515aa.1789662556.git.irogers@google.com>
Subject: [PATCH v2 12/14] perf test trace_btf_general: Drop --max-events=1 and
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

