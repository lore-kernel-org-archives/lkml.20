Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794219455;
	b=I6oTg5O2GgHM7iiRu7atSTFVeJWB8n5du8gBbBixAiOgNQKb3p7UNx4IRDs8kTIE6lj1
	 pd22GLBQrjktFXvn6Ms69QUISZalOXZt5t8Pc1YAijGLIPA1ErPmZzwiH5uQwlyg2cBEH
	 vIpjXkJ8oo4wHPrmF9P2irBY+7+tWbpkkpafLNU2FbdUbMCjfFnRE+Mc8B+L3HTmHiVGX
	 bGUyWMIzjNwkCov1nLmxsrUvkFgIW9q9djK+5kBpSm1MoyspRiOXp34dKoqOGZq1mRt4g
	 YWwHCqY6MO1RijSSQVVRmwLbduuXr3MiB3FLZ/AwcPh4COiwjxdydRoLYfGr28SlTaQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794219455;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=WIaieGGBZ//QGoNLj878zCBnNschlkTQti7AhZ3wdkI=;
	b=G/XsDQZxe9rs+Tojxre0ijo9V9xryeULO+G+TiN8M3g/4EAvJ1k3hL6ud6zFyYW16sqD
	 lwrcapcWkWrGnfd899VFoHfv1Y0FJngj5GO1rH+T7D8/CAIuU0KXHxyHdMEZIoZI0N7pZ
	 qYLIF0QJxPy5r2DNMDkls7994a3OTer7wd4hFdfs9XVjMxEh5MVZFO5VzMlpLOCD/WfQq
	 gO9QLmqsmbc6qPeI1ZtAjtRDbnHsW6OW7p7ywtDocXzKwV60ahV4Psn0YmGEseQmnjgYp
	 7DMoKf+ejXNnsWDBGADsk5/Lim9whyBuKIKb+ry6CkW5snr6kYA7X3BbtAeuX8BPCXw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=KbmTF0pB;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1CB0606D83A
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 10:17:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E1CB0606D83A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=KbmTF0pB
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a35d5d4a20so8100305e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 02:17:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794219453; x=1794824253; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WIaieGGBZ//QGoNLj878zCBnNschlkTQti7AhZ3wdkI=;
        b=KbmTF0pBknBeDwOEN7r0cHteYDa/vTyhn6x0Nd9IvVWy1J0cE3V8Pre6W8UpWPoTqb
         0TcIGXn5KsjZtiMF5LSq5h33pMTB2oDkym7mAiDju6tBfN9dhgMmX99/G7ut6msUmeJG
         56tWZjKTHjF1kX6z9m4o2jmVjsyvjWXsqFRnIdWAcyuLo8suFTc9tYi0TC+XDl7YHgFK
         WDT4V5NaFpGsSlqww02GtNWVmmVlnBUIPBDsHXhKA8UoRhcbd4n/qQ9H1M7I/JqRwxGo
         BxQm3ekGb9zAd4TetWohPwXVyVok4mXgL/u7UnP+3nq7V09fcWDNDY7or7FJbxfBQjtJ
         yzDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794219453; x=1794824253;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WIaieGGBZ//QGoNLj878zCBnNschlkTQti7AhZ3wdkI=;
        b=P0Mj4/FBxEWZEl3aA+grH4CLP6qKfF4wJfVw+oT4JjB+f0jj6+VtGJodI8VWOFuRmI
         pOolEj60F2iYFPJt85KiywkD/4N4q4vCJ0mLRdV/0HkN4BQ0ihGTcxp22mQI5CwaiQfV
         LhnR3ts7juotVdpOQ6jsOABG1O7LIvOtUcpXeZSmZCenzNIGrpKDGQ5imWH2PQ75pr8s
         6gDtepKdyZEaj7X+m82wb2Ii9EDrn80+DaQw1YiihVmDeL/k7FymjVUflzQHzAcc/fj7
         OmtCbs/nMmjJkhMsPa1QgznlJUmLYgFLWb1WstmymNzd0hrpxic7hGP8rTvrCK59wJOy
         rLeA==
X-Forwarded-Encrypted: i=1; AL+hErFysWm8sYYpYYJJr29/04UnKzPbRVuPofsIV1/fWH1FeNZjuVJC9WcX02sCyue5A1wtXzNccNx//ARVsbI=@vger.kernel.org
X-Gm-Message-State: APuU4Z9KLC331YhjBurBXwhmRSUGn30F+/as7kZw8zWm/Ff9jh3gIKa9
	X8PAKxB8FrC2MfbNzTbU6V1u+wDueVBcHfMN30b//2m6AaTRj5SbkRX9d+/zZyRrBzk=
X-Gm-Gg: AYBFou3LqcRd42arwa04RQqshkrZDlfeg6EViCJY8wdSBEjZ4jESUIM0PpqxNuDLDJ4
	eI4/L8fr82LzteYCGzyQYmzLdNgrPpD7MrATGKOW0ERFiOasZuiviI3jlQlGDgTG/l44x+WQABn
	6JGC2NNaUDAWyi2WB+kHjQ7+gNF3v/6Tv06zQ7LeENlFGQLGBlEXNDwlGNz3XeyTHL76074PRRk
	iUxu2+fu/EjrPJOtlviOUnSrdXfVdRwAgWyQ41VfXv8HziSGazKXVdakTMj4MSxmdXU2sO1QkBd
	bmT0GVjP0hK8MY8lMOe/ctM7Fd++/xPhnuvbc3wtp0xJJwG4ZD59H+BMUd2zmG60cXMio8y0trU
	0EfKKq7kpLkaciCKOYWhzFY2QbIXD5oF6s30rtBJfWdvqtyynf3o63G7cgcTnq9ZLhfSfAsjd/2
	bUd00sB2Mw5gHSXWgb+X2wXkZyNO1hpMG1NcZJ71tJRCbgdKJnW9C7WFf3SAQUKQITjHtqIlKoD
	Pcb/wwHOWzsmiw9/W1TtfpRINOX7YzCtASDvQootHbpb4+u6qS61XNQjl3nQsE5V+IozJk1Mznn
	A9cNBaRfIa7K/m0Z1PdUZyJTJ/A4QzqJlqqIzt0cb4+UMA5ksw/P+g==
X-Received: by 2002:a05:600c:8714:b0:4a2:1364:252a with SMTP id 5b1f17b1804b1-4b94d763291mr62542225e9.3.1794219453273;
        Mon, 09 Nov 2026 02:17:33 -0800 (PST)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b90ee1de2esm121575795e9.5.2026.11.09.02.17.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 02:17:32 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Mon, 09 Nov 2026 10:17:04 +0000
Subject: [PATCH v3 4/4] perf test: Don't starve per-process tests with
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
Message-Id: <20261109-james-perf-test-fixes-v3-4-e8d0a65e618a@linaro.org>
References: <20261109-james-perf-test-fixes-v3-0-e8d0a65e618a@linaro.org>
In-Reply-To: <20261109-james-perf-test-fixes-v3-0-e8d0a65e618a@linaro.org>
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

