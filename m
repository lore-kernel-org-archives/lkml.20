Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793893769;
	b=BqGJMSyYVFzcOYg3CyqPJnjZMaDNuQkrhzmYMsnLzuAxaB7fWLORLdgigicmyopmgSa1
	 t6vZUw3Z98t64xzPLYbyXyWl/fREUSPy1aiFRjgtQK770CkOQl025/zFoFOYC1SYc4mem
	 RU4razSc+T15H00754gCizea0H8mPOhWF+QGxg+8jNfEmhipdhZQj/HSRVZ7NrMzYx4gt
	 JX40lqtJUf/qckk1QybQNWiXzNQ1PJumjmp96TBiI0PTfxlqOANPiqOJTU3V0DdXlgA9M
	 0ij8QijuW7kr/1uy4q+m7vq/yb7JxV25SAdFgKo61SjrMdh94Ow/OWD4PhQl+Tb8n/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793893769;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=gmDXh2Fp4W/G1W7OX/RwzZA5z2TV/WzysbxccmKu8eI=;
	b=LrEfTyeiJ8pocdEyhxVg53PSFIgfGsrLSOXPMktMn4RFNuFUbRBemWHKNvjhX8B+zpdG
	 WnKnmvmJIX9lT3mCOjbDYhjKzKNDhxGu86aYRVrgGRZZx1LHc8B26GwsPQcF+QNSJo4lC
	 9ECIb0swLfmxS/wMZoln7kYiarMO/Ieq901Gs23i0LM4ITvgdWuLlE8Dvxt+46ODCDCJx
	 ILwGyJaSh3306YMLJWjbTmRFLMUp1s5J0vfoYfb3Jl5HoITUj2fupxwt7ASZhY3/l745f
	 8qjqoKl7BRS2Hh9TBg3/7kewE5nkMx8z6sOleMUMhF9uaARkCBKB6Kfc5KVCPfXN7Vg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b="UNy9/NPl";
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B76B606A32C
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 15:49:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0B76B606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=UNy9/NPl
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-49134c8509fso785425f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 07:49:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793893767; x=1794498567; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gmDXh2Fp4W/G1W7OX/RwzZA5z2TV/WzysbxccmKu8eI=;
        b=UNy9/NPlMjjrOlilalAfUb/IwPCplSzLV0jInOkIVslIy507INOmeFVEXOfyF9M9s+
         mrj3vqOEas2F+G0gFuKZwjUyS7J6XA6MAk9AJhVgUhRkXNQE4HrBJjcwNr8obK3+Uz9Y
         LHbosS+RzPsUQhGkQf9StRIDXcJUpNx0F0pYrcmK2rpdF9K1sgeEyrpbt5Va69/o2pkl
         tyPgRyBAovr6YGxGC9uOLsoac2uW08p9MLWJPLT60SivIoz5Rf+xHHTfQMMue9NTnscF
         AAx7g5qH9gmEbfx2zpaNmDtiPKbiIQ7phkXMxLrjwf0FhkPD5rHZisnN4IQ1WIPcLaiD
         Q4Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793893767; x=1794498567;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gmDXh2Fp4W/G1W7OX/RwzZA5z2TV/WzysbxccmKu8eI=;
        b=a2dmq6/i2Y9Hee3iJR4dkJfxSYDGR/cdbOHRe7VuM87AS0VkzjUZt5l7Nol+QEZ6z7
         jAs/EErk3L996XC5g3LKn7+3CH2RCsl5ODyLMIq+01RLc3WKqzwWAOCmqm8uZSLHMpgC
         z4lFFdi1oRAXQZ84ZJQlhahS+RQJ0OuHP1t3zY/T6MsmvvYNuV0Cwi2/MAw9m2fMnA3+
         lDmZoB2Zqbt7/gpb+cZQhuMhY4Aed3/XEaBWbpEKpg48zpss5tVWr8uKWCOYEiG9bp8p
         LQGExNNxQ1bU9B7ZRmdTowXgryy/K01X031IJ66UpLoxS8K7p8HqLqz06ynDDdknNpOE
         PpPw==
X-Forwarded-Encrypted: i=1; AKwUvBymLUSmb/xVzPxj2nRLF7SUh5oyrhlwEG/wqSYJemVeRxQspBrp4eps3X3jRgSQQ21jot9GpgMLUKT6R58=@vger.kernel.org
X-Gm-Message-State: APuU4Z9+e2OmR+ZyU/BKQrlVfwTGOe5+baPH8Ya1cW9bJkchS6BFwFWw
	DV3oKe+ZpoaxsfVdxo9/hJmZfjX9pBMWfvI7bEL0ycr8BKBrcGWzxgspE4hddHJSsz4=
X-Gm-Gg: AYBFou1349IGEfYQkbWwoxJ6SuJVIdeJ0x8vfVaPKNEc92/kqh+9RqTfIMzvztGoUxl
	KqqFaZzaGQVnEKTBOEZbioE7SBz0TNDABODH6PoR4EZfa/s2YtR9PWtXd57ak6ferlCYeeGWURu
	TfT4bcixoerq6cyqf/Vcpz8j/WpWbyoOsvpDr1lJGCBCFmZkvODJpi4i/331kEmrX31MWe10voa
	gTcz9wil4N1ILCfHaEKA19POfZz0IvAiD3Y+igKVQdFscmL9sKGpPPBBKc+KF/lPrNsqrtEIPnP
	xKzaf02/KkqYCkUh40xQMevwA/rORCk1agIQ2jszpAw6Aycs+zhi4CZewaZ6vGD80FDpuV5Fgdn
	mW4TCRVTYJQ97GAe8SbPIPe0Cws2t8SkQrvYxQHGBiOeeA4pXWAAR1zO4CbX47yLo2zV041iZEv
	3wOaWQT3FoLM1dW0j67khnD4aUgqZhXsDTzv31TVldaAMO2UcW+kIEbk3Jx/p2Nq4/lyC0+L5NG
	R2b8+dXK8VdpNYUSZyUlB8WqxuVGaje65vt5olW28StxprYiGJWX38hhjZ952IkPF2tzez4T/rN
	nU+S0/rzMOx/wn0wsa48CrRYFo/aT+Jy
X-Received: by 2002:a05:6000:430b:b0:491:4b13:f8bd with SMTP id ffacd0b85a97d-49275373a0emr22139f8f.19.1793893767359;
        Thu, 05 Nov 2026 07:49:27 -0800 (PST)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fec9cd40csm10650462f8f.13.2026.11.05.07.49.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 07:49:26 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Thu, 05 Nov 2026 15:49:06 +0000
Subject: [PATCH 4/4] perf test: Don't starve per-process tests with
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
Message-Id: <20261105-james-perf-test-fixes-v1-4-0b279bee5830@linaro.org>
References: <20261105-james-perf-test-fixes-v1-0-0b279bee5830@linaro.org>
In-Reply-To: <20261105-james-perf-test-fixes-v1-0-0b279bee5830@linaro.org>
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
run serially, just make the system wide ones use a non-precise event.
They don't need precise sampling anyway, so use plain cycles which can
go on any counter. The per-process tests can be left alone as their
events/processes never run concurrently on any one core.

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
index 01dc3e22fa73..5292eff78a70 100755
--- a/tools/perf/tests/shell/record.sh
+++ b/tools/perf/tests/shell/record.sh
@@ -388,7 +388,7 @@ test_system_wide() {
   echo "Basic --system-wide mode test"
   local ret=0
   perf_record_with_retry "${perfdata}" "check_system_wide" "perf test -w thloop" \
-    -aB --synth=no || ret=$?
+    -aB --synth=no -e cycles || ret=$?
   if [ $ret -eq 2 ]; then
     echo "System-wide record [Skipped not supported]"
     return
@@ -471,7 +471,7 @@ test_cgroup() {
   echo "Cgroup sampling test"
   local ret=0
   perf_record_with_retry "${perfdata}" "check_cgroup" "perf test -w thloop" \
-    -aB --synth=cgroup --all-cgroups || ret=$?
+    -aB --synth=cgroup --all-cgroups -e cycles || ret=$?
   if [ $ret -eq 2 ]; then
     echo "Cgroup sampling [Skipped not supported]"
     return
@@ -491,7 +491,7 @@ test_uid() {
   echo "Uid sampling test"
   local ret=0
   perf_record_with_retry "${perfdata}" "check_uid" "perf test -w thloop" \
-    -aB --synth=no --uid "$(id -u)" || ret=$?
+    -aB --synth=no --uid "$(id -u)" -e cycles || ret=$?
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
index 2182551873be..31ec2f5cde69 100755
--- a/tools/perf/tests/shell/record_sideband.sh
+++ b/tools/perf/tests/shell/record_sideband.sh
@@ -22,7 +22,7 @@ trap trap_cleanup EXIT TERM INT
 
 can_cpu_wide()
 {
-    if ! perf record -o ${perfdata} -BN --no-bpf-event -C $1 true > /dev/null 2>&1
+    if ! perf record -o ${perfdata} -BN --no-bpf-event -e cycles -C $1 true > /dev/null 2>&1
     then
         echo "record sideband test [Skipped cannot record cpu$1]"
         err=2
@@ -39,7 +39,7 @@ test_system_wide_tracking()
     can_cpu_wide 1 || return 0
 
     # Record on CPU 0 a task running on CPU 1
-    perf record -BN --no-bpf-event -o ${perfdata} -C 0 -- taskset --cpu-list 1 true
+    perf record -BN --no-bpf-event -e cycles -o ${perfdata} -C 0 -- taskset --cpu-list 1 true
 
     # Should get MMAP events from CPU 1
     mmap_cnt=`perf script -i ${perfdata} --show-mmap-events -C 1 2>/dev/null | grep MMAP | wc -l`

-- 
2.43.0

