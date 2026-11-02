Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793621769;
	b=e0e02dkvYA0RTitNxBJZBAHDjou0KL8QsnyY+GM8pDdk0W0GH1rgRg7FWX4kVKldQrtp
	 i/6Lf2AJrg2jag+WyzbdWNRrT5Z2Httuqt7dmpOvEc0V9BMyfm7tePjbZn2wm9e+3Z8iJ
	 BNCdYZHg3Ycgq6IVdGF88e0gXq1Qt/NensTJZgQmhfpS7+XhUP8DQSSRugik2b3qg1Xr2
	 jodSrHBkwnXoI89Mhi+Tj7Vb4HwZ7De83MP5Gx3c5dlH8n8z5TNQ5pGSIb1+9OPxlVjpI
	 FhDL6tr6uCiWNlFGE9PggCz+nwrVwULNmeKEcaQII9XqniiYpk21clI1rxmVa0HxDXg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793621769;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=BoSygA+rSUd5kKs81oMTEOx8OUAzT9ufCoQu9dV/md0=;
	b=cGTxG7Q0Du7AMygYK930kIrANXhmfz7IRlNXMMd7mUcxtDjGe0UAnHg5VZ5oM0b1ivZv
	 tpT8yn1u2bROJRoSI2XaTavtZMUFJEPgksQ+7//d4IqpwWEMh3LG32kzQ99PUh4n3iFeO
	 qIQwAX9+ww2yRpkZYOn2Cre2XK8BOHUwAV+rDVanl46I0QxqPyLrxgE8R6C4zfp356mbh
	 0Te9wUFMHqKB5PKRocZW/C5OC4IhDR2tsbGnig9uT6ODLnL+5UaffJAZdgu6Csx8H32lv
	 FS8o0PEAXQK5q93j1/OrGrvA2gJqJS33gVGVLOcyarSgW93lBXQy4h/k+sUaoS6vS+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=jWR6o5+Z;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 788B4606C4E2
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 12:16:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 788B4606C4E2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=jWR6o5+Z
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a215e64962so26451165e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 04:16:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793621767; x=1794226567; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BoSygA+rSUd5kKs81oMTEOx8OUAzT9ufCoQu9dV/md0=;
        b=jWR6o5+Z+Jsc79bGAtocigWQs/3pIjO6vma7MnKXFqFTyhp9R9yMFyAsgUzCQ06TL2
         XqdBAnG4bgq+qvsAv7tHNDXBebqq0PeWNOIsoT7V3aZBvblJFR2UZrGFXb6Dlw8y0biW
         vJTyDq9oAiDJaM8+T+kAkJHmK1lLRKxMgFV6n7A70JJc3qvAOtt+kM+AoP12lhvJPLR7
         QX6+6smE5W6cz/L94nCXfjP7u9Uq5lGTcH67Cij+E9wcvIUveiPvd7q2USPiq9hxCYgA
         /8lRVci64n2ci5N9QYTkj0eh2rWQyoVamZatDnLigDAytv3DGtNDd6ScgEjs18s4onWV
         fXPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793621767; x=1794226567;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BoSygA+rSUd5kKs81oMTEOx8OUAzT9ufCoQu9dV/md0=;
        b=GNMTHJb6Zg6XFdaQLCNDebYGEqKssQ3kL6Cfoaq56xbs1V69dWCnk+++eXMHrVr/Rx
         W3mUKKXhxjcmEYfRxmqWSo1JpzkPo0yBzR6b1sKj02eXqOWixYwBsXQd+/+jDeITYQ4B
         +rZZ4fjdoWgDRZS+fDW4V8KuWu+y/PBdRz1bCrem7Wl5tjggn7sNZqiAjkl7rj2w6fhg
         pRyrT8zp5k1Gs+UGHuOSc5V6B5eL76ujxFe0ZSrN2UPmtKnBwN06w5uOuQkiouPghhEh
         K62vzHD9TzEMc8Poch1gNITDumB3SgJa2nQTDUDHej4ABY8ErhJpX0hZI5ehKO55O1q/
         lybw==
X-Forwarded-Encrypted: i=1; AKwUvBwtkiGMVVrKd6FEgMpCc/oNbuB3vzM88W7HzplEyj5wuuozNaMcIWp9Ho1lR0r0BfkQ9OdvIesftbHpnyo=@vger.kernel.org
X-Gm-Message-State: AFq9FYJCzMI+3Q99yZxjgHcmXTTdA+7tkuFf40wlWoPM/oGQJ7ZsHTby
	wV0wvOlMjblk9BcxUzSSfjzg3HAZdp1YYpXfdSEhZb+26pm9hKNeFhZw2JpObputQeE=
X-Gm-Gg: AYBFou1c6g5oYrB5uWpe3+W28+RdxiS6U7M3kY0Wi2PP7oL4sIR7T28cBma97VZq3kn
	2cbspKiD6SFyW5LZFmKkDlP6BwGerBXZhVMsBKrgIRTUant1hiWyB/QpLq/Nh63EUJhJ+LjHoOn
	akqWatAV7t8qEMgkWXK7FidEx0kooBAZXsfXxkImZ8SW612XvBuUOI8TtsyNPEIfdsHD07fwYF9
	IEp0WyPDoiChC7MV1BnYO5qdbkB4aBkXUV29WOXsxMuI1RvPh7yjfZXlK/pu4kaptZdcXlEaNT4
	1wmyPZ99e6dOZA/lDruBPGIUV6kVtMKiLVGjbWnlWS1AId/ajV/9jWT+SaBGttzsEzJ0CKFQF81
	QrSgQkN13xV/asrro6DRkt69OHBBCMxouPiYlERuPSKBD83PeEn6hKMHl5P7t5LvlR13mQTJTFB
	ip4RcDzjfp6UfvIjGQaEUYcr/cKULhUhrL1zuXtTToij9nq9BtIMo/dogxab3ZoOeZ1en1wQUvl
	WCL4f64pqmO7vWWlwwz+cqNAW8dCsk3iNTogidZFdtGyIki1nunCPi9igomdh0lHw0o1AEmmw8F
	nDMS9bL+k/DU1FglX4uu069YTduh3vbw5i/U4FkYIeCqpnoD3850gg==
X-Received: by 2002:a05:600c:34cf:b0:4a2:fe3:121b with SMTP id 5b1f17b1804b1-4ac18d68ba0mr204596495e9.28.1793621766831;
        Mon, 02 Nov 2026 04:16:06 -0800 (PST)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abf5b27e46sm434974855e9.3.2026.11.02.04.16.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 04:16:06 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Mon, 02 Nov 2026 12:15:32 +0000
Subject: [PATCH v3 18/18] perf test: cs-etm: Test multiple per-thread
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
Message-Id: <20261102-james-cs-unformatted-per-thread-fix-v3-18-dbcb0c281b9b@linaro.org>
References: <20261102-james-cs-unformatted-per-thread-fix-v3-0-dbcb0c281b9b@linaro.org>
In-Reply-To: <20261102-james-cs-unformatted-per-thread-fix-v3-0-dbcb0c281b9b@linaro.org>
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

Signed-off-by: James Clark <james.clark@linaro.org>
---
 .../perf/tests/shell/coresight/per-thread-multi.sh | 76 ++++++++++++++++++++++
 1 file changed, 76 insertions(+)

diff --git a/tools/perf/tests/shell/coresight/per-thread-multi.sh b/tools/perf/tests/shell/coresight/per-thread-multi.sh
new file mode 100755
index 000000000000..c6bf1ff2e53d
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
+perf record -o "$tmpdir/data" -e cs_etm//u --per-thread -Se -m,64K --pid $parent > /dev/null 2>&1 &
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

