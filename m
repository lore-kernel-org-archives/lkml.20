Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53EB841CB2E
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 06:29:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790663392; cv=none; b=EAH+gLz7UU8N3V+ireKczxi4vNeJhocZrOzZe/G+wN3JHW5TowtraIv7jGvh6TlbSzeUHYjfY0JDXag+qTO6HhbOeqD4kuFmUlyRmz3oyzAalsnl83e9rP/8tJ3ziUxOUXHPvIwx9TQJKlq4rSVUukQIIydjMBtiyelkYVdDCEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790663392; c=relaxed/simple;
	bh=9dnCnm0obUdo2EqOcPv85Krg2CWY6/1fPUxNbupSKAU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=L2bhTt+yqzDT5Dr0eCtuzCuvqEEsjx9pjYqiVLxDepFNGp4zEPzu8BNB2nY74pSabgVmHnVJdPTAuSE7EAETmbszE73PBk86CIRQCsgb0rYxTYcW0spbPrd9erhT5XpeOwnPXoFJbssnUM/kj1H5orCE7u5T0E4iMrB2nak1COQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=K/uZ5Kzb; arc=none smtp.client-ip=74.125.82.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="K/uZ5Kzb"
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-1384427c3efso5846426c88.0
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 23:29:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790663390; x=1791268190; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dnibIJ+lZBQ1CeVh0g9DN0YYOUBh+70fdfgpvSaop2o=;
        b=K/uZ5KzbV/jq0+d8Pjzng9cSPShP+6vy/hmT2kHBFdsD97P3ZxmyjKmQejnBlzhcz3
         1r+N/IKSR5ssyIL/HbbEQn2F+A5k+qXhkCoL0I6eqKZhFE7mFhdXc71BNv7waGu4tpv3
         teZD7yaCbjfotlV/OH+jySeMKuOf7DfBu97xUxwm/jHHdYd9kUOtTSSjG6QvvUvsPXfH
         8VRW8DAJelq4DcbyxQW98jDfDTBMQnjuE5S7OQQNXZgpsIMo9xe79epNZLxNDjzFGipN
         F/XN3w8lgzckj5qhoTv05OvXtIXqSgWy4fGo0hX2+iQl6tBAhnACVLVAKXcuiIqwPyHN
         faGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790663390; x=1791268190;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dnibIJ+lZBQ1CeVh0g9DN0YYOUBh+70fdfgpvSaop2o=;
        b=iyfopdrIrGRFVZ2CZRTajTjFL0cLl77VxdomEYA13ugvvMKoa5mEbI01nc6RaFY0Gu
         N8yqBU5Oz+24NNqfZS402ATiDDhPma3l0pyp58DGMxfi+QCgMhYP9q2wH3QcP3u4+fcv
         c9Kxdk7WOdCevANF8uCHTd63Gpd37yp1+pwwoGMV1lWJbH3X+dJVk4cwsINZQ/g2wwvl
         i3EEIp8hZV1EVMTiwxB4Hu/9LNNaWFiyia73y8JWxYWHGrVVVZm/73sK+hZKgEoL8OF4
         KAaCGT9KOfvrycLs45xkE1MwrTHN9kpNgv6uVnxd0eXb+9oR/8P4IiqUOGH6ZrJK728c
         DpPw==
X-Forwarded-Encrypted: i=1; AKwUvByB1lIyNtntMSHiQt1s4+1zZOsrdPPxDZfYKmshrh3g46/bUzUWchArLqbJhFT3kKK3K7+3IBSES1zoRxI=@vger.kernel.org
X-Gm-Message-State: AFuF++l/YWnGitVqzXqMMcLsF+tdKlAJ/uD5dQbkh+R9pvyrhVY+ir79
	mtTw6dxclFWljYYqdPRCvex37l3s7/nndOmeWMuPQRxDkTyvtGJMu+3B1WD6w8jEIgNfsP9IIcq
	ARfpujMKI4Q==
X-Received: from dlbox1.prod.google.com ([2002:a05:7022:1201:b0:144:bba4:7daa])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:b044:10b0:147:9ad0:cf32
 with SMTP id a92af1059eb24-1479ad0d333mr11842878c88.31.1790663389876; Mon, 28
 Sep 2026 23:29:49 -0700 (PDT)
Date: Mon, 28 Sep 2026 23:29:31 -0700
In-Reply-To: <20260929062937.374137-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260929021913.56010-1-irogers@google.com> <20260929062937.374137-1-irogers@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20260929062937.374137-4-irogers@google.com>
Subject: [PATCH v2 3/9] perf python stat-cpi: Fix live mode signal races and
 test flakiness
From: Ian Rogers <irogers@google.com>
To: irogers@google.com, acme@kernel.org, namhyung@kernel.org
Cc: adrian.hunter@intel.com, james.clark@linaro.org, jolsa@kernel.org, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	mingo@redhat.com, peterz@infradead.org
Content-Type: text/plain; charset="UTF-8"

In test_stat_cpi_python.sh, 'perf test -w noploop &' defaults to a
1-second duration and can exit under heavy parallel load before
'perf stat -p' and 'perf script stat-cpi' finish starting up. In
addition, the fixed 'sleep 0.5' before sending SIGINT can fire before
Python finishes importing the perf module, opening the live evlist, and
flushing the first interval.

In stat-cpi.py, register SIGINT and SIGTERM handlers before calling
_open_live_evlist() and pass flush=True when printing live output so
redirected stdout is flushed immediately after each interval.

In test_stat_cpi_python.sh, run 'perf test -w noploop 60 &' so the
target workload stays alive until killed, and poll the output file for
'cpi' (up to 5 seconds) before sending SIGINT.

Fixes: 4425182d426b ("perf python: Port stat-cpi to perf module")
Assisted-by: Antigravity:gemini-3.1-pro
Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/python/stat-cpi.py                 | 19 ++++++++++---------
 .../perf/tests/shell/test_stat_cpi_python.sh  | 12 +++++++++---
 2 files changed, 19 insertions(+), 12 deletions(-)

diff --git a/tools/perf/python/stat-cpi.py b/tools/perf/python/stat-cpi.py
index 0b7d76876a6c..da92cf560067 100755
--- a/tools/perf/python/stat-cpi.py
+++ b/tools/perf/python/stat-cpi.py
@@ -106,7 +106,8 @@ class StatCpiAnalyzer:
             if ins != 0:
                 cpi = cyc / float(ins)
             t_sec = timestamp / 1000000000.0
-            print(f"{t_sec:15f}: cpu {cpu}, thread {thread} -> cpi {cpi:f} ({cyc:.0f}/{ins:.0f})")
+            print(f"{t_sec:15f}: cpu {cpu}, thread {thread} -> cpi {cpi:f} ({cyc:.0f}/{ins:.0f})",
+                  flush=True)
 
     def read_counters(self, evlist: Any) -> None:
         """Read counters live."""
@@ -173,19 +174,19 @@ class StatCpiAnalyzer:
 
     def run_live(self) -> None:
         """Read counters live."""
-        try:
-            evlist = self._open_live_evlist()
-        except OSError as e:
-            print(f"Failed to open events: {e}", file=sys.stderr)
-            sys.exit(1)
-
         def handle_signal(_signum: int, _frame: Any) -> None:
             raise KeyboardInterrupt
 
         signal.signal(signal.SIGINT, signal.default_int_handler)
         signal.signal(signal.SIGTERM, handle_signal)
 
-        print("Live mode started. Press Ctrl+C to stop.")
+        try:
+            evlist = self._open_live_evlist()
+        except OSError as e:
+            print(f"Failed to open events: {e}", file=sys.stderr)
+            sys.exit(1)
+
+        print("Live mode started. Press Ctrl+C to stop.", flush=True)
         try:
             while True:
                 time.sleep(self.args.interval)
@@ -195,7 +196,7 @@ class StatCpiAnalyzer:
                 self.data.clear()
                 self.recorded_pairs.clear()
         except KeyboardInterrupt:
-            print("\nStopped.")
+            print("\nStopped.", flush=True)
         finally:
             evlist.close()
 
diff --git a/tools/perf/tests/shell/test_stat_cpi_python.sh b/tools/perf/tests/shell/test_stat_cpi_python.sh
index fe7562307634..6cb376c92e2f 100755
--- a/tools/perf/tests/shell/test_stat_cpi_python.sh
+++ b/tools/perf/tests/shell/test_stat_cpi_python.sh
@@ -50,7 +50,7 @@ test_live_mode() {
 		echo "perf stat failed (permissions?), skipping live mode test."
 		return 0
 	fi
-	perf test -w noploop &
+	perf test -w noploop 60 &
 	workload_pid=$!
 	if ! perf stat -e cycles,instructions -p "$workload_pid" -- sleep 0.05 2>/dev/null && \
 	   ! perf stat -e cycles:u,instructions:u -p "$workload_pid" -- sleep 0.05 2>/dev/null; then
@@ -61,10 +61,16 @@ test_live_mode() {
 	fi
 	ran=1
 
-	# Run live mode for 1 interval in the background, give it a tiny sleep, then interrupt
+	# Run live mode in the background, wait until at least one interval is
+	# printed, then interrupt.
 	perf script stat-cpi -I 0.1 -p "$workload_pid" > "${temp_out}" &
 	pid=$!
-	sleep 0.5
+	for _ in $(seq 1 50); do
+		if grep -q "cpi" "${temp_out}"; then
+			break
+		fi
+		sleep 0.1
+	done
 	kill -INT "$pid" 2>/dev/null || true
 	set +e
 	wait "$pid"
-- 
2.56.0.rc1.315.gc6ed9934b7-goog

