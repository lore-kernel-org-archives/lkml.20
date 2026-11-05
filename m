Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793879147;
	b=GF1gsoACnk+nqpYDjOOMKYpob1EJVojvvNxQGaHypL96pgB9m/p1izLRmzVtN3irF5bN
	 nyq0BH8dHZRuD0qAyRG+432utjZJCmUcJ8GyH2RuFRZaggef0WHLfb71gRjwLkDZL8aP9
	 z5OMX6XfBS8xvYDUEV3DgW2DzL9jppYF3pVJUbk15jIrtnbgjJxyMhR6xaU0f9V7DfC6O
	 zZWw4Wj4fEOBDfYoCoZXXRqk77XETr0kwztWidWLlrIBQBfGio6FKysgCkR4W7UnsnZcp
	 TKa3cQTJTYwz4oTKXE+Vzhw9TVMBn4rbdgs109ls5c3WzQXMJxDIb+upazoNbSOroCg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793879147;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=PU/EFB+VchMZfy9q7Y3QQl5gRcVp9NfFdbFPAQA+Sio=;
	b=1Ki+8RDNIqqTAznpSC1saWp6OjfoOxeoGpz1jIDvgyXDYZ2xpb4fexLH/cUU9nMv2A6W
	 32IXfN3hCKaduUfdDIxm5jk9BeYigJXOMfTTp4DQZmFHsPYk82Lxwij34/RWU2sGvGGxL
	 hKm7pexyzCPAmqWBpmFfB7l7r+59r/f5nkUj5zSgeHsGsWog6N33ZUlfd0ZnoHdivbj9f
	 CasuC2Oy0DTZZolv0x/yhqPO35nOLtnp0kUwXAAsJswp277kHKGzF+BXVNWnt9p/IAmVO
	 l0y4YPxka+FItxkPSII7Zkf2F9Bjq59UnbEA9/4617kyrPelO5cMax3N+a8SMsv9Duw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=I7oinnSI;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44D26606AB06
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 11:45:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 44D26606AB06
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=I7oinnSI
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a5177d78c7so15955695e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 03:45:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793879146; x=1794483946; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PU/EFB+VchMZfy9q7Y3QQl5gRcVp9NfFdbFPAQA+Sio=;
        b=I7oinnSIex9WFs6wfj7U4/5LTijkW/OBRe1wgdWSEGSuNIJLRIVB4EeDFohVHeRWpy
         DqjStibRNJH3jsN5HSVGk7cfRqcBC0AarDaLs87TQiySozz+SD8cF4F5KLETWWs+i1/F
         pGKhWou+u9v3gqQpJ/US0ijSsGmaebkIse965iixAd/5gRXaE0mk+DF4acZr0o3eyAKb
         MqvRpNMTk4evk4WBlWlHak1egOjOCXK8HBjPiwKrraYDiX0ZXZzuH24f+1DcKNCEHXNW
         mzhQ/NsZ/+5HecrctE5PiYjZlAxqDhEeqRyWa5JuagiLVzLPtrlz1/sL5nMLEqblRmdL
         S3Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793879146; x=1794483946;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PU/EFB+VchMZfy9q7Y3QQl5gRcVp9NfFdbFPAQA+Sio=;
        b=GkwvzdeHiTtVOg21u5mHR31qkh3Is2fdZhF5i3iVFK7L+7VeSDfROMmNSsLy9Q3PBg
         Qn0rDgqJzyvOcnlVZRRVR4cknop1GH1FH+0k6YrErssFUAokzimT6ftkvlnNwhwmCzsi
         hOU6zGLij2N6c0XgrR4D1glHtlvOchTCTFx9PFD63asyKmxE9HlAP42qy/uK+EwKepC4
         3w5zYtNJK1/fEAhnovrO1uX1aaNGhncC9Dj55q9o9GYO90MnSb2WNEVV9uG8lMHIy31L
         M1ejmhcyKa27GM8ppRIeVJwu2xoY/md06DWzOCv9LkbKPrkoexBKLoQTmeOBFJVIt4Fr
         q9sg==
X-Forwarded-Encrypted: i=1; AKwUvByF1r4YCqLiLzK7Okw4p8Y+G9TbekTYSkTaqHVK9s+TqGzJSxY2BX6V/CDG/mOfse18burGmZj+cjz7QiA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+DSt67YtXaMIHEO3n/LXwwGOnHbjvnW94qsApe8BoCd3ybRL60
	ceeKa/A6tYLPA9tANxyYrZCw0VxARF82Ct9fpv1E2wvBnKM4UlKibRAjV+I69CBKVcQ=
X-Gm-Gg: AYBFou33ZodJWRO0hpeJDy5BDdb3iM/Ev4DgZBTKrHZjbCGVq5ckm+w0Q834JGCysHZ
	VqRUXRS/pWpv//r7+EY3xi9j9HqTqfFs2regPrU3ZG635Gx6ZxLSoRwkd/mSM0XEVA79qYTj470
	Qq30ritfHCHG55gIXSsrzhF76f4mk0rPo36x1l/QIWtnKE4MJ4Ik3y9YBHIWWzjR+05IN5Nz4NI
	Re8bETOO28O2tCbKK3yF68w+I4BQ5MSkjn8OZ3ZmvAUmkLanczjZmzbefUVxTgflrJgVgEzHHiJ
	R4qrCEWLcR41C+opDPeKov7tQam9xJN5jPRR0RjRsDAF+I6if1tfoU+whEEKVNDVq1aDKhUfPfX
	egToEAzeYMkc0b2G3FA1zbmv0dUrowDyxx3atGkHKXaeyydm5LvqC5IroDXV+kvrGEJuux5MQfH
	A12Qd5JGm2ZdcM9c1VlGYZ13FCGvDUdXj+6g/8JX7ysKpRLl7jnItwai0EZoRsHIM88fQPEjbap
	0bLHfdHLlayhF0Aem2aF37EUMs2Zkz1rB59xA60DASX8boxyxMxMIFE0QilaN4KmjrFgS0WfB4W
	VsHht5QDVWlXMT57WBebQ9owa9XrPYLq
X-Received: by 2002:a05:600c:1f93:b0:4a0:1fb9:2f51 with SMTP id 5b1f17b1804b1-4ac182dbc34mr397731085e9.14.1793879145713;
        Thu, 05 Nov 2026 03:45:45 -0800 (PST)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b571f46538sm56679525e9.5.2026.11.05.03.45.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 03:45:44 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Thu, 05 Nov 2026 11:45:05 +0000
Subject: [PATCH v4 17/19] perf test: cs-etm: Add test for per-thread mode
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
Message-Id: <20261105-james-cs-unformatted-per-thread-fix-v4-17-7759e0ce2449@linaro.org>
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

Test that per-thread mode works when the process migrates across CPUs
and that the decode happens in the correct order.

A TODO is left in for when support for decoding in order with Perf
records is added.

Reviewed-by: Leo Yan <leo.yan@arm.com>
Tested-by: Leo Yan <leo.yan@arm.com>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/perf/tests/shell/coresight/per-thread.sh | 48 ++++++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/tools/perf/tests/shell/coresight/per-thread.sh b/tools/perf/tests/shell/coresight/per-thread.sh
new file mode 100755
index 000000000000..8a1ab9d8f1e7
--- /dev/null
+++ b/tools/perf/tests/shell/coresight/per-thread.sh
@@ -0,0 +1,48 @@
+#!/bin/bash -e
+# CoreSight per-thread CPU attribution (exclusive)
+
+# SPDX-License-Identifier: GPL-2.0
+
+# If CoreSight is not available, skip the test
+perf list pmu | grep -q cs_etm || exit 2
+
+if ! tmpdir=$(mktemp -d /tmp/perf-cs-per-thread-test.XXXXXX); then
+	echo "mktemp failed"
+	exit 1
+fi
+
+cleanup_files()
+{
+	rm -rf "$tmpdir"
+	trap - EXIT TERM INT
+}
+
+trap cleanup_files EXIT
+trap 'cleanup_files; exit 1' TERM INT
+
+echo "Recording..."
+perf record -o "$tmpdir/data" -e cs_etm//u --per-thread -- \
+	taskset --cpu-list 0 taskset --cpu-list 1 taskset --cpu-list 2 true > /dev/null 2>&1
+
+echo "Decoding..."
+perf script -i "$tmpdir/data" --itrace=b -F comm,cpu 2> /dev/null | \
+	grep -Eo '(taskset|true).*(\[[0-9]+\])' | \
+	uniq | tail -n 3 > "$tmpdir/script" 2>/dev/null
+
+# Check that the decode says it ran on CPU 0, 1, 2, in that order. TODO: The
+# correct result should be "taskset [0,1,2], true 2" but we don't decode trace
+# in order of the Perf events yet, so everything is associated with the last
+# exec.
+cat > "$tmpdir/expected" << EOF
+true [000]
+true [001]
+true [002]
+EOF
+
+if ! diff -q "$tmpdir/script" "$tmpdir/expected"; then
+	echo "FAIL: per-thread output doesn't match expected:"
+	cat "$tmpdir/script"
+	exit 1
+fi
+
+exit 0

-- 
2.43.0

