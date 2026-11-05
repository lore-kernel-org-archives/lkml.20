Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793879149;
	b=Nj10E0alLZqHFrWYR0ueR7MwWWuRv5xNq/jWTgPtmN6LC29XD0JevaWmfAJwrMtqx25Y
	 lLTBMNXsc+5FwtLU/SqRb2QIWU4H4Vo+rlpfCT58AaYq4ZQRYJ41m0xIXF30uklP2RJUv
	 Eb3t3MvOnzitw0dQMuY6EBIgh9KSMn/NYyYTFsJSnBtyFNcvEU3UgI1D0cnNTssvuQsns
	 uIyCIK2udwwskYLlKEDbPeHSOnh2+OQuTB0Nno5Focu9JhzU+XLTbykIqFgUN9OTFFKg5
	 +UjK/aeWydG/5Iu1M4brT+Lz3SY58JzscxD8IjCdNuqP+KGFb97Z1tV4YVnu7XNFWeA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793879149;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=urrgTOdhrZbA2FGtYgxftgMNBud/Y8/6+LuWZZfe/7k=;
	b=OQTnz5cs9H1ukUP6LECpI8OBMB+Aohq9UfTCRXYdsA5xzWNorKRgXctNRKPacS8v4S8q
	 pzrsC/lxtP3jUJwqy5I4O7L6hducEp/6LIZNuY9G+kYQ6NCBuuY6MgCs58l6DbldZbVYF
	 ivhb/k3faLuhjZ6HLbzEFks+KS9M8xLWS7L/lW2sHWjPKfnwOD6WqK0V4pcvFS785f+CU
	 Kk0GNne5pEaHx351ZqiNCDfKZB9dhsRkEbwD8LPU5Jti6ZWRgEUZAD+cuZt3cCpY2LuhZ
	 yzHVdxLh6fh9DpSASy1md62kKUptckeQ/Xy8LExuV8DFYFy3vx1k0ohH2IhXQeGwd8g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=O7G21oQn;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6EAD606AB1A
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 11:45:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A6EAD606AB1A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=O7G21oQn
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a4d7ae1ae9so17956345e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 03:45:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793879147; x=1794483947; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=urrgTOdhrZbA2FGtYgxftgMNBud/Y8/6+LuWZZfe/7k=;
        b=O7G21oQnj5EJzLMX33JkomM0jG8TtAWCpdbH9a5JQ9LNoAwKNVCHbeWdzvN4aqIv8o
         e0i6mtuQjfheHG6pvcl7R7PuKXkw36xAPrRZynGhXNubC1q81XYCUwdjSzzOB4u0NXHL
         yqQsMbTEKxAhumaEEA8MLob0jiCe6+JyP5/y0kLzQjF3U4WpN9olH+b1d/7FevyDYzWD
         3Xs/zqsfTbDnbR7CPfq86qHpU1BJCRXYdDtqp2Td/3Oa0h2vT+HnHjtAuQE+OFFYBST7
         CIKEARQUuRGTQ8TErl2zwuYTXN59lN5TyCB/qRm69TqfrDaJ7jzJ8nv56HfTmVDmqSNc
         3w7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793879147; x=1794483947;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=urrgTOdhrZbA2FGtYgxftgMNBud/Y8/6+LuWZZfe/7k=;
        b=DUdnv17ZNCZQLQXPuUSlgFfiZalKbhTs1nij+LRqA4RwG2/5apbAAVsCCxdfiWjH6y
         BLehV/1VsAIa/HbaMIYDk54z2C1Y0zZvJ7svDKc8cYzLxTVJl9/zmoE/r8vwVdJ5wMek
         jwdpFfpi2xN45zom4DTZS49mDZVcXVgpAiK1ByUv7lKj0AlPCRc1cVYl3H4Eebg6/1or
         /0csGEpDikV1F4ezc8Sn4G3VOAEvBKYPQBsennbDpMUbZMKxKJIvs3SyaHCDfPGgbEo9
         OWkPjxC2raZBtKLoJFIkTvfApgJk0Du4ck59ZTeQXP1FjF2UmDJLF8VoJdka9Jyj/E9i
         ffoA==
X-Forwarded-Encrypted: i=1; AKwUvBxzs6UG+uEDWRHfICSzsb1Kn+U7F3mHpPbOVdBO/77SEByQfdLH/SKrOKAvDvm4o2jp+z0DE0wHtRbt3j0=@vger.kernel.org
X-Gm-Message-State: APuU4Z/zZoJaS+Pa6gVBXun0dtNx8vAAViCjC5jYnS/Ha6cm58pbOXCD
	qL4yJrOQQvnMO6md/KHqkOSUxJRyPW/ZGCWOY+SeqWYEf09IEi6PYc6I+EfIp9j6A6A=
X-Gm-Gg: AYBFou3jyzmkWzZH9FJCISEvizXOkDAjuMfBM0JRvRofscTENxiukrrvToxgR4xjOYW
	KUU2VRRR7jzS66jTNYmsJXY2eVMmYd7IIFb06S7XxP2HB8oB8c+1rjhWjx2URj6fRjjWg55rntb
	dLBsrApuwg/FUspa4tz7NwWYOpkjNmph6e27oiEDozliJn3T3x2QiTWWXB853b9GmwuBrwqPm2n
	NozK415DQLHe+6z7RmIg89Vyvyn7QaxgZpPIQfR0e2k7VXb7uTrX33n8mewewHv9NgXG6XROPc8
	SDRZ3lfSLY4UKbfs+Wq495wMPRE7rsDsGkYWc4x9Gjx6660wwlLvA2KsjM7KaEkN5reW65x4HaX
	TJT7lD8VAn7/7DJcZkvCyYs4M2cMEgn/2Zi8gNT5vfD5w7nIO6woivCj4KKXiRVSL1a5XKaK2CL
	V6HtFwE3IbeLhe3JNl/Rm/M2EwW3PWDzz7J1vBMadCO9I+9chllhP6yElQHlfK+sWbyBGNMzaoh
	EfvzDk+8MugUXH/UOp/FFnpKsl7wYmf0Z7jxbt6nTVyMSYnKlq1B/jdZfnaLnhixlHEGjBLemQV
	G2m7YZj9AjJJ4M+ySHjJEdk+8KyPRRJc
X-Received: by 2002:a05:600c:608d:b0:4a2:1197:1de0 with SMTP id 5b1f17b1804b1-4ac18b7dcdbmr405802955e9.19.1793879147059;
        Thu, 05 Nov 2026 03:45:47 -0800 (PST)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b571f46538sm56679525e9.5.2026.11.05.03.45.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 03:45:46 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Thu, 05 Nov 2026 11:45:06 +0000
Subject: [PATCH v4 18/19] perf test: cs-etm: Test multiple per-thread
 threads
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
Message-Id: <20261105-james-cs-unformatted-per-thread-fix-v4-18-7759e0ce2449@linaro.org>
References: <20261105-james-cs-unformatted-per-thread-fix-v4-0-7759e0ce2449@linaro.org>
In-Reply-To: <20261105-james-cs-unformatted-per-thread-fix-v4-0-7759e0ce2449@linaro.org>
To: Leo Yan <leo.yan@linux.dev>, Adrian Hunter <adrian.hunter@intel.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@arm.com>, Leo Yan <leo.yan@arm.com>, 
 Will Deacon <will@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
 Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Suyash Mahar <smahar@meta.com>, Amir Ayupov <aaupov@fb.com>, 
 linux-arm-kernel@lists.infradead.org, coresight@lists.linaro.org, 
 linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Arnaldo Carvalho de Melo <acme@redhat.com>, linux-doc@vger.kernel.org, 
 James Clark <james.clark@linaro.org>, John Garry <john.garry@linux.dev>
X-Mailer: b4 0.15.2

Launch something that has multiple child threads, attach to it and
make sure that all child threads are present in the samples

This will only work with 1:1 sinks/sources, and looking for TRBE is an
easy way to guarantee this. In theory this could also work for ETR
sinks, but we'd have to attempt to record and skip if that fails, which
would make the test silently skip if the record command started failing
on TRBE too.

Tested-by: Leo Yan <leo.yan@arm.com>
Reviewed-by: Leo Yan <leo.yan@arm.com>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 .../perf/tests/shell/coresight/per-thread-multi.sh | 76 ++++++++++++++++++++++
 1 file changed, 76 insertions(+)

diff --git a/tools/perf/tests/shell/coresight/per-thread-multi.sh b/tools/perf/tests/shell/coresight/per-thread-multi.sh
new file mode 100755
index 000000000000..bace76cb6a51
--- /dev/null
+++ b/tools/perf/tests/shell/coresight/per-thread-multi.sh
@@ -0,0 +1,76 @@
+#!/bin/bash -e
+# CoreSight per-thread multiple threads (exclusive)
+
+# SPDX-License-Identifier: GPL-2.0
+
+# If CoreSight is not available, skip the test
+perf list pmu | grep -q cs_etm || exit 2
+
+if ! tmpdir=$(mktemp -d /tmp/perf-cs-per-thread-multi-test.XXXXXX); then
+	echo "mktemp failed"
+	exit 1
+fi
+
+cleanup_files()
+{
+	if [[ $parent ]]; then
+		kill -9 $parent
+		wait $parent || true
+	fi
+	if [[ $perf ]]; then
+		kill -9 $perf
+		wait $perf || true
+	fi
+	rm -rf "$tmpdir"
+	trap - EXIT TERM INT
+}
+
+trap cleanup_files EXIT
+trap 'cleanup_files; exit 1' TERM INT
+
+# Multiple --per-thread events are only supported with 1:1 sinks/sources
+if ! ls /sys/bus/coresight/devices/trbe* > /dev/null 2>&1; then
+	echo "No TRBE sinks, skipping"
+	exit 2
+fi
+
+# Launch 2 threads to run indefinitely
+nthreads=2
+perf test -w named_threads $nthreads 0 &
+parent=$!
+
+# While parent still exists, wait for the 2 children to spawn
+while kill -0 "$parent" 2>/dev/null; do
+  threads=(/proc/"$parent"/task/*)
+
+  if (( ${#threads[@]} >= $(($nthreads + 1)))); then
+    break
+  fi
+
+  sleep 0.1
+done
+
+echo "Recording..."
+perf record -o "$tmpdir/data" -e cs_etm//u --per-thread -Se -m,128K --pid $parent > /dev/null 2>&1 &
+perf=$!
+
+sleep 1
+
+kill $parent
+wait $parent || true
+unset parent
+wait $perf
+unset perf
+
+echo "Decoding..."
+perf script -i "$tmpdir/data" > "$tmpdir/script" 2>/dev/null
+
+# Check all threads were traced and they have the correct thread name and symbol
+for i in $(seq 1 $nthreads); do
+	if ! grep -q "thread${i} .* named_threads_thread${i}" "$tmpdir/script"; then
+		echo "Error: thread${i} missing" >&2
+		exit 1
+	fi
+done
+
+exit 0

-- 
2.43.0

