Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F40852E065
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 21:20:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789766431; cv=none; b=aLW0b27dF/ikHr359q0W753CkYXHsDXNvbs9xEe/JygMLg7oe0mzc8dVqXPrtVeAZJ+iCfW0+ajDGBWgTI4Q4J5FsqLsp/xlzlRpFlmhaTpWKymDMFBbBZVy7mM937pAeAa2eOrp5w9NRej4ZmZopqpZTrokVtf7y2BDqtU1WAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789766431; c=relaxed/simple;
	bh=uXUyVsWXdGRR9r0Yf+u2xCJJUCEXrufHCD6FF1dYRUw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=g9H41N7Yj7ckAjqZv00BHeONtC/A5H8PTZ1Ghanfwhjo8yX7m4x1WGfPVRKUHMJRSKB8WYCsnjKdD4sqSadSdDJ1Yo12hUX+HwG235GTcMXYif1GXivh1EM7i/CWaDLbKciTw87zygdX5K0XsHdzq2KCzGd/3Gdm0nZfcA8PKks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=g0/FSayE; arc=none smtp.client-ip=209.85.216.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="g0/FSayE"
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38f57e31b6eso1138789a91.1
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 14:20:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789766429; x=1790371229; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0q/ZlHbTsYZyN2/8M0P/yh3YerzxVzD8tkGrmWQ37IA=;
        b=g0/FSayEqqeFhQ/karCUQz6ito/iX7Dybm3EVrLz+EJ+Bz6G5dp4kbHLfpQ+eAIb4A
         IAdIa01tBLPnrOIeOyToG7C/7/coVHVh+nxbd4Wu7CSvfmKSf0x+zBDXuXmO1aeWlPvJ
         A195xlj6l9jncvFkQwNdQlLS1HiYjkU7mGwaR9ikLa6GgQtA1x1ZCzV8FDtMeEP7h6MU
         YgMEPrE6WEqNDSqccfm52wsIhy9y0Nb/BIld+HWgmsl2YH7RS2ZCyY8hMxbR46E4o2rW
         lKQTgJhOw8+8YIUWp7YgwxPx5l5s+4MTYKh0dXxdFFP1NB8AU+ij5qUSg43LA2ShX5Wa
         zW+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789766429; x=1790371229;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0q/ZlHbTsYZyN2/8M0P/yh3YerzxVzD8tkGrmWQ37IA=;
        b=Zz5zOfh4lnUlDzo2rqmru7H5iovT4zRMkr9d/cESQMYQQMbaAKLFda3DzWMqb5l+GM
         DK3djXQy1p0xBMZDh5oFFpc2oVIMtDhXEAhjbqn3WHG6VW/ZE6AiIcIzdDuo5MwzrbYK
         siaDtgw/UnIXw1fSrFb18sW3mQMSL11EtF2V3EPf4c/2JA8dyPZmhZUdaV3/5nftwTR3
         8RNNQN4BpyJCKsLtTOWBBStEAEO6MTAoMEFJyTZAa5OawGDmMpqpwqFm69warVkjwiCz
         EzMA0jjTdD4ixeWECnXkWpgM3qVTLewaI4WLz3LR2+ianGc29wN11egtAepIV/EM1IaG
         szvg==
X-Forwarded-Encrypted: i=1; AKwUvBwhcoCHOE1huE7gZacxvXXhnC0Eg5Y9zpSZz+xSuujzRCRvOJ37PxQLZE2iVw8RbctqO61DcsTUKHWXvw4=@vger.kernel.org
X-Gm-Message-State: AFuF++mXLb+2JG2xNRHQFzgL84wjbjBHCZtI5MNGI8RZRjr2G7Ge3MGq
	amiPyMeAfTPNl8IXZHpaTMoqYnHoSFW/nm8XOB0b9SIRD9We6eJuCf0+pVbvdrTl8R0M3T+wO68
	iauJN7XnbSQ==
X-Received: from pjbct5.prod.google.com ([2002:a17:90a:f585:b0:39d:ff1c:bcbe])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90a:141:b0:39e:5ade:f9de
 with SMTP id 98e67ed59e1d1-39e5adf0579mr4314793a91.26.1789766428532; Fri, 18
 Sep 2026 14:20:28 -0700 (PDT)
Date: Fri, 18 Sep 2026 14:19:30 -0700
In-Reply-To: <20260918211932.2966061-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260918140659.2501976-1-irogers@google.com> <20260918211932.2966061-1-irogers@google.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Message-ID: <20260918211932.2966061-17-irogers@google.com>
Subject: [PATCH v4 16/18] perf test trace_btf_general: Drop --max-events=1 and
 make non-exclusive
From: Ian Rogers <irogers@google.com>
To: irogers@google.com, acme@kernel.org, namhyung@kernel.org, 
	Howard Chu <howardchu95@gmail.com>
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

