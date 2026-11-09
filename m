Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794232110;
	b=AoHmNQOBpTkzNQxqw6wZwM+wJrs++WgnyxvgcXJOzrYRqF9smJoWee7MQUs+bVxwL3ZF
	 Dxj/1K26QQ3N6650t6Br2nzsXNKkbbA0TUzr0BidjDsUYVde6SgvynrF//ok2tiKvD5Oe
	 2y+ReoxPJITZr3y53Ib7kHcQSV96V8xItX34kdbg47zLN2leWRkcTdH4mEKj3/9KvRC7G
	 W6+J5nR94vLFrLmlvziDr287JX7dN7IWqcusfesHvWSGsetCl6eaZijpP+brXciMBp2rk
	 QhBybxihAw6SnjYLwxWZF4+Q1ke3N0ER4dCNVP3hCDodolfcvILNsFFMG3xVswU/i1Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794232110;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=WIaieGGBZ//QGoNLj878zCBnNschlkTQti7AhZ3wdkI=;
	b=AE/VzgsuMoSWFOXllVHgZQDxCv9fRD3WFgUFOumeZ5H6Qi/0O00TEEpaPmCGG9WeOjJY
	 V3I1FTomWKgl8Yp5v8KwnItjXhyXE0t7Ia/DkOzgSVO5gSzeMVZiSnZlbP4cUq2yCZJxP
	 +eAF7PySakZA6Ymq83l2krQzFdXGnJlX/txdTSukyHHvExfaQkSgtwR4Jo9chPsEunQE7
	 izm7kbd1IiI3S1E2ZRpRAA2nYnIlN7jYnbv4vkMbQqjumCl4GPHFXne66N6731jJUAaYM
	 ZGydcIvzJhOI7QFQg1h8WHoIC9dwDehaOav5E9P/oNWZl3SS7ppUpMf6b2JELNrK5Ag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=ePFmRO2P;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE248606D82B
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 13:48:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CE248606D82B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=ePFmRO2P
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a5720b0a57so5756395e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 05:48:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794232108; x=1794836908; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WIaieGGBZ//QGoNLj878zCBnNschlkTQti7AhZ3wdkI=;
        b=ePFmRO2PzqoskyTr5nfoHyPN26NaKc33xYWQaKs/0oQaOVgZlgqxcfsE0DQA42xS19
         lCEuU0cvWs8k6J9vlRVB5i58lkd8JVAT/KkXCHIj7VejyNWsyxOErkC5x++T6bMLuCQD
         ffpPbMrhdMnIYH7ZB/lmSPQ+p1elqIK8R/jNJaOhT7xZfQrMnz8HoVoEV32X1FnCUyUL
         S3EITV+8qf7EEjvGg5p4gbQTQqB/tlqcsY8aIB0y8PeiXiWFtJjQA81jr607q9JcnM6b
         gHGky26+s/mYEXpmFObIBVaK4Bnq0PcA0SBrx3ioQXJEhGebg6ovBTfjh4kDp3X7sdtM
         2Eig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794232108; x=1794836908;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WIaieGGBZ//QGoNLj878zCBnNschlkTQti7AhZ3wdkI=;
        b=C2PlEoLqjLQQgf2ql3uLgfImQLiPIcHh8LRdy3jrvjv3IlEA1MrOMB/C2TEEwu1wHp
         aIrTrp0DnFep9mJJz36JUiiCU8l99I26Yy5BvYrqBiIVyhsUmRAVyJhzbNq1qCI6ocq5
         w3KzwGMxTsERrOI+1UoHD+hPC2lofp3ioyJLhy/GsYIRRrNOBHulR7NLShuGezC8niRi
         BxVUqHUSiHtRV1h+lG+EOTUfnF8uk9nE0shqwAEbllgJ7sX+W2NfEWRhzewx+w4rsPEr
         2QXYvd15bZIVUcgBSsS8O08TBpOQQF8YDqHTomxDhUcxuQcvu8js1wzsyODDCexgjtJZ
         2g/A==
X-Forwarded-Encrypted: i=1; AL+hErGeRhrBv9lFEKMqI2/bswaCfc29+cTJIAaayUXk8L2edRkdEjhBEokVLTja1H5kNVHISms9nXqwDHtQ2f0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+8kxjtXzkMyLw6y8c6qJ9Qq/6lJ0mvtplFrmFq8nWnbxx7KLZg
	rXMonw7G8BL5N+hB7pX1RAa976lyvmXE2+PaXFJSi87KZymKccMBsDXJbR6TGn8ZPU4=
X-Gm-Gg: AYBFou1yZUniMpBkIUyBZBqfhRWVCNFFxbPwoZTkpUyK58e13PG1FDKaWW8VJpw/CYL
	Dg1Uo1KcrfUGMZu4irAW2+Ja11PIlRh3dGvJZfn1scxdwIOtQKYqFM7aW4UIcYgs3H+eMV0+hZg
	cC+EoC/pxtVYfD/OlTQvFvaX4hNTbcQNPHc9N0C7/2DUfQIXnF2E8wjvzyPuB8S3SNVUzQbLenN
	AYsLy/Y7jx4xXvxTI2aM6+Zwm2rLoMeoSBOZZ9nQL1gAlSX07p5R9gtKgMiv7A/Zohim4LioDod
	fEF79ebXlW20NZXYUBjWs8B9TqaHtlc5WjR5dHmd0T6IjerB20ALaITdVxBmQ6NJ/32lL6/8lX+
	Jbqu/H2bZZiy1AkQf+VnJsBtrvMeB9pomRYiukBTCzq/g7IfnnuX1FDpwMv0429y4TKV1VeGkJN
	zrbtRpCctyAGrWL10UxS3PshtGRBv+KRvjvtZINFv4CD//MH+njBxCusvcZ4c4kgR2UoX3rp8n0
	kh/qMFoOnK0hv2zDokSV27737tdrIH9tAOggFZ0f1WMJfe2kuEnJCK/8ejy0cRMh3tfCmY6iShl
	c3BdAsxgcf2seHzVxrddasUW+fKxsrZw
X-Received: by 2002:a05:600c:3111:b0:4a2:180a:3417 with SMTP id 5b1f17b1804b1-4b94d75ec90mr80947465e9.1.1794232108132;
        Mon, 09 Nov 2026 05:48:28 -0800 (PST)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b7bb101537sm98522045e9.0.2026.11.09.05.48.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 05:48:27 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Mon, 09 Nov 2026 13:48:11 +0000
Subject: [PATCH v4 4/4] perf test: Don't starve per-process tests with
 system-wide events
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261109-james-perf-test-fixes-v4-4-355ee6b81917@linaro.org>
References: <20261109-james-perf-test-fixes-v4-0-355ee6b81917@linaro.org>
In-Reply-To: <20261109-james-perf-test-fixes-v4-0-355ee6b81917@linaro.org>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, Jakub Brnak <jbrnak@redhat.com>, 
 Leo Yan <leo.yan@arm.com>
Cc: Arnaldo Carvalho de Melo <acme@redhat.com>, 
 linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
 James Clark <james.clark@linaro.org>
X-Mailer: b4 0.15.2

Some tests intermittently fail when run in parallel, for example "Check
branch stack sampling" fails with no branches recorded at all.

The default event is cycles:P which there may only be 1 or 2 HW counters
for on Intel because it's precise. System wide or per-core precise
events hog the HW counter leaving other per-process tests with no
samples. Rather than make all the tests that use default record commands
run serially, just make the system wide ones use a software event which
has the greatest possible compatibility. They don't need precise
sampling or HW counters anyway. The per-process tests can be left alone
as their events/processes never run concurrently on any one core.

The LBR filter is another resource shared by all events on a CPU, and
the system-wide LBR test uses different filters to the per-process
branch stack test, so mark the LBR test as exclusive.

This fixes the "Check branch stack sampling" test and other flakes when
a system-wide record from another test runs at the same time, for
example:

  $ sudo perf record -a -o /dev/null -- sleep 30 &
  $ sudo perf test -vvv "Check branch stack sampling"
  ...
  Testing user branch stack sampling
  ERROR: Branches missing ^brstack_bench\+[^ ]*/brstack_foo\+[^ ]*/IND_CALL/.*$
  ...
  Testing user branch stack sampling [Failed]
  ...
  Testing branch stack filtering permutation (call,CALL|SYSCALL)
  Testing branch stack filtering [Failed empty script output]
  ...
  ---- end(-1) ----
  138: Check branch stack sampling : FAILED!

Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/perf/tests/shell/record.sh          | 6 +++---
 tools/perf/tests/shell/record_lbr.sh      | 2 +-
 tools/perf/tests/shell/record_sideband.sh | 4 ++--
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/tools/perf/tests/shell/record.sh b/tools/perf/tests/shell/record.sh
index 01dc3e22fa73..e4789e2bcf43 100755
--- a/tools/perf/tests/shell/record.sh
+++ b/tools/perf/tests/shell/record.sh
@@ -388,7 +388,7 @@ test_system_wide() {
   echo "Basic --system-wide mode test"
   local ret=0
   perf_record_with_retry "${perfdata}" "check_system_wide" "perf test -w thloop" \
-    -aB --synth=no || ret=$?
+    -aB --synth=no -e cpu-clock || ret=$?
   if [ $ret -eq 2 ]; then
     echo "System-wide record [Skipped not supported]"
     return
@@ -471,7 +471,7 @@ test_cgroup() {
   echo "Cgroup sampling test"
   local ret=0
   perf_record_with_retry "${perfdata}" "check_cgroup" "perf test -w thloop" \
-    -aB --synth=cgroup --all-cgroups || ret=$?
+    -aB --synth=cgroup --all-cgroups -e cpu-clock || ret=$?
   if [ $ret -eq 2 ]; then
     echo "Cgroup sampling [Skipped not supported]"
     return
@@ -491,7 +491,7 @@ test_uid() {
   echo "Uid sampling test"
   local ret=0
   perf_record_with_retry "${perfdata}" "check_uid" "perf test -w thloop" \
-    -aB --synth=no --uid "$(id -u)" || ret=$?
+    -aB --synth=no --uid "$(id -u)" -e cpu-clock || ret=$?
   if [ $ret -eq 2 ]; then
     local logfile="${PERF_RECORD_LOGS[${#PERF_RECORD_LOGS[@]}-1]}"
     if grep -q -E "libbpf.*EPERM|Access to performance monitoring" "$logfile" || \
diff --git a/tools/perf/tests/shell/record_lbr.sh b/tools/perf/tests/shell/record_lbr.sh
index 8d51afeb437b..6b6af59db871 100755
--- a/tools/perf/tests/shell/record_lbr.sh
+++ b/tools/perf/tests/shell/record_lbr.sh
@@ -1,6 +1,6 @@
 #!/bin/bash
 # SPDX-License-Identifier: GPL-2.0
-# perf record LBR tests
+# perf record LBR tests (exclusive)
 
 set -e
 
diff --git a/tools/perf/tests/shell/record_sideband.sh b/tools/perf/tests/shell/record_sideband.sh
index 2182551873be..f16889e3fa9a 100755
--- a/tools/perf/tests/shell/record_sideband.sh
+++ b/tools/perf/tests/shell/record_sideband.sh
@@ -22,7 +22,7 @@ trap trap_cleanup EXIT TERM INT
 
 can_cpu_wide()
 {
-    if ! perf record -o ${perfdata} -BN --no-bpf-event -C $1 true > /dev/null 2>&1
+    if ! perf record -o ${perfdata} -BN --no-bpf-event -e cpu-clock -C $1 true > /dev/null 2>&1
     then
         echo "record sideband test [Skipped cannot record cpu$1]"
         err=2
@@ -39,7 +39,7 @@ test_system_wide_tracking()
     can_cpu_wide 1 || return 0
 
     # Record on CPU 0 a task running on CPU 1
-    perf record -BN --no-bpf-event -o ${perfdata} -C 0 -- taskset --cpu-list 1 true
+    perf record -BN --no-bpf-event -e cpu-clock -o ${perfdata} -C 0 -- taskset --cpu-list 1 true
 
     # Should get MMAP events from CPU 1
     mmap_cnt=`perf script -i ${perfdata} --show-mmap-events -C 1 2>/dev/null | grep MMAP | wc -l`

-- 
2.43.0

