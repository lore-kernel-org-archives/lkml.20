Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793962121;
	b=T0rRNXFB0bnuxrHW6tqakEJ8bgqdnCVVMATha/ktAbWq4U96ZjR++Phg8nBcL+IAwoDG
	 hD+dHkeLMN3lVsIuDwIo1ueQ3uPSxiljXinrplPFJVVugYVxihe+rIwhWAKoTWLrxkP1S
	 LU+6gwiPPaUu/tGtQ4YwI8D2MqmYLBk2H00W6hyx4StgGXWbADYPs7h5bCvDTSYcQTk4G
	 PDU5AB5xeCruImocnLamt/owe4aUuJOJDqbTLouAjsf6C0b0tsVcrrid/UJ0wzRbsa50k
	 8bn6H+x99EO/NZIzwDvOnVP8WgdxHLCgvI8jR1OIyu6fEE6gpMKGJiPm1X3BM5IODiQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793962121;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=WIaieGGBZ//QGoNLj878zCBnNschlkTQti7AhZ3wdkI=;
	b=Q45P0xJ61JqQR6r9Eka6qif3pst7KinaA6wX1IAsQPhlnUSta+OBFZATxfBWQ+q8fT3V
	 pq24VGDv5u16AorK6txPgO4JYjemXBU3hBrQhHqXk5/vWeop0Rc40OzHPhrsmgWRycksD
	 0pbCgDVWkhi+EADfzpaCp77Rv4XDT9RNl/Lli02Y5c7/6TkuTc9WLqUBw68T8HYI7jHzH
	 Ig6YnfgvA/ZzWj1kBk70iwPTH6VVD4KmorgyUnOdXKvIBcz35HefuVHvjKmZdYTOE8Y9R
	 C164ERA++7OEVFGAb6JzmhRz1g7XbwPc88e9HEEtXVj9AINB/EzTJjE1hwCPIVjNTMw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=fyJ6tW+C;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41E22606EEA3
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 10:48:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 41E22606EEA3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=fyJ6tW+C
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-491aaed7565so277907f8f.2
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 02:48:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793962120; x=1794566920; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WIaieGGBZ//QGoNLj878zCBnNschlkTQti7AhZ3wdkI=;
        b=fyJ6tW+Ceau7nBdlIjAZ3IVJchO+6mMOJ1SK1lOTAW4EpwyoyVfWU6kHu9uKA+rNYA
         3W+fIQAi+wjxlB1/LMRGLu+9D72DySrdd4kweKAb6wo0NuhMdCiAD7PhYRc+KR+nnm2E
         TM0lPPgcuEtnQ3Iudgf88ErsIWNV2Hmk0BrcIHti7AdekPwufCm1Z7D7kaJRE8oqfMSC
         8u4Q6LyU3i59k2skIWHvveVKriEQceuUzxrY1xO16UlypF+9/r+2fgs/S3ZU8hJBiipn
         qLgYQ9Izn4ifvHmp2hWJfD4TaE87/7yaentXSYr3PkMydXdgEMY0jvliLEnbDlO39XIh
         DpJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793962120; x=1794566920;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WIaieGGBZ//QGoNLj878zCBnNschlkTQti7AhZ3wdkI=;
        b=MFZ+p9tqqIY1OL9QN6zD3S9O0bTqRieU3TGbAeDRydpvW/fGCEFXyzeRJYyQoqOCzm
         f/CcJtEf2zVPNKZalgKtLG56O+/ePFtNojqfQkM1n0Vh9qhXrGWZtXy9XkM/aTwPZ7B2
         xGNYMxz+gzOaD2dkUwXU05bTuDFKKQleDsc6qkDc5jt/GaOKMOe30DC6S69Y5nnef+gz
         wujhc8z3NrKnnoj8unwG4W8MLeoIg4knN3K0TatOo0vBBFePDDFUoSdzTitjKJOa1U5B
         4SpjsxjQYxA1UOm4oV32DbHLm8Wfk0GN4L7JzVUdBb1BNKjYFZivHj+/m6U2MUCvCrid
         28Cg==
X-Forwarded-Encrypted: i=1; AL+hErHMH/tHlSgiCMr+oJMvxAT5iYunj8rcbFGBWNOyc9f3mPec6li8iaPNpz54QADemtDkcTxitNlPiXuJUZ0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+C0T61dtgNbdCUnZGQj9rvhijtJ4aCHqtPpQBgCNJuSKLhgZLb
	/TwEuUWlalYNoc5IjiKN5asQT2TaUALmlPjm+tZtVzxUGA61hTI6bBtaRaz1SAH5BiU=
X-Gm-Gg: AYBFou1y1o/Kxm5aV/9KF5vXwOgugqfK0rGLlUAfuheFPpI2scYyR715WkN9YQ/PAbM
	IqEJGeXfipL2hO/Z3Eaqa0l8etq3kIBGFDbAfF17Niw8XldGeXsUe7Apeaz4asSJNYCohKxA/IE
	1mS4Bc6uu/4QxJCy4u0wC4D7ZCEMblL6ICnAFbycJFWhpUahrY0IQUt7+SoMBoIw7nhg/bWGosT
	TkGOCqXpP+dgTFP7L/zODWoHL8Hh4dskx9DJkmsRN5oOmHuTSegNjls+RDz1tRk/zDcTyGpBz9v
	bDPo3+kWOCM6q4vvN7Sttv+poRUgcF7KOjlhH317lPUTvARofr3PLKUKs11B5jrmelAxFYR5vys
	EuZ3L2z4mnLiyt57dGzY7tJNwBhcYSKwl10BOcCwEByIrccCy3a3DgsDX2QjfyP9knkCvl9pEuM
	h3t73iNKEJFCnsZ5M+fS20n1xlkD4dvbytEgAY1Tin5XwQpo4TjcHbWoulb1fGKFxYtatMSCNr4
	SmVwnqhYEA0qko6gn8gUrvLeBVsC0cn0wF1MkK0Benx+W2eHyjfeVP6yUcPL6KzuKeJRH76ybA7
	q7lyz8PuKwYdOwcNIEiQZLrDRJIwSyV7
X-Received: by 2002:a05:6000:46d7:b0:48e:21f7:79ff with SMTP id ffacd0b85a97d-49277123e64mr3043355f8f.33.1793962119602;
        Fri, 06 Nov 2026 02:48:39 -0800 (PST)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-492d6d63ae2sm3232248f8f.11.2026.11.06.02.48.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 02:48:39 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Fri, 06 Nov 2026 10:48:10 +0000
Subject: [PATCH v2 4/4] perf test: Don't starve per-process tests with
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
Message-Id: <20261106-james-perf-test-fixes-v2-4-9a912662f822@linaro.org>
References: <20261106-james-perf-test-fixes-v2-0-9a912662f822@linaro.org>
In-Reply-To: <20261106-james-perf-test-fixes-v2-0-9a912662f822@linaro.org>
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

