Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C93CA3AB288
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 06:21:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790403720; cv=none; b=p42rSYP6mV/YT36eMcW7FpEt2ZCcSrWe4ucnfh1gO4t0+U709keDgGKSUwEx55mX7WeGjz/PZtDLuHBQThpS4SCKNGKrtYNdBde9O4c61qGh1YOlcWXJO1wDeoqrhoIIuGn3/NH0EbWPRjt+VybbKGVwCG/pF18eRiLUELLGRT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790403720; c=relaxed/simple;
	bh=OdQaxxBWGVLFMntT6qyopuR+76jAtK0eaJUZ3r27fro=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=DPRAgX+eUyzbze82e232KXLIVKumB+5LkOzD4o0jNiZjXKBcqARdTf/Cr63+pHD7+wLvrLZSupXAuuKtKLx+03p6si6E+RZjDIQ6TSH4G8e/VJgeBSqCBWCk8p3FbcEyOzBhkBFMZ8z2pTuRjCl01ELEdYBGBRcvMih1dnPjYKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=W7TKOoy0; arc=none smtp.client-ip=74.125.82.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="W7TKOoy0"
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-33f01b74124so2244433eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 23:21:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790403718; x=1791008518; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kwitgM2dG+fjlRoMvxPwow02it5ysqWzTJNZ0m0HMOc=;
        b=W7TKOoy04eeYM9r4QPP7opk4e/shXlHJmNlUV+xVJ6ehjzbnfXkRQdpgBowMzdX6a7
         yQMAgyLpNkBaktp1zRPMdJItArgyHlowLPYpMDkAFVtZp3tKCBoLnwTYTQAPlQ9B3ghZ
         xq9ZFWhY61k+RcAH1BR5IJuSr/RbsuRrF24WJ9ECM9p+4kUqd7w5UNvoFIqNUDl+mQr3
         FhEe3t/JvkP6oz18lXNN0G1He3dZo9pycH7xESg8Fft0/UKYVBRuxxjhpEWNMImu4mN/
         pX8ljZvcHwp/rqp30yTjXYCnpArtSocepUrL0y8YPOkuwNbEkwZJqDm8SSyNEhK7DLJR
         P/Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790403718; x=1791008518;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kwitgM2dG+fjlRoMvxPwow02it5ysqWzTJNZ0m0HMOc=;
        b=lzooAZwUnJH2J227peLG6CmpFAHpptEnu8k8nYztVWjglWXzy/VjNT4APF7a65eboX
         aqExxUiXQyYJet5o9XPi+GfNQOm9T3BKzbbpnWZzf63oKLCadRMkDpMD+YD6Se7mLfaj
         8mqYcgulGKZ+oBd39WpKTuVOr701SZoBQHfu68Cr6BLtJ/pb64/E8h68jhLy+wBwABVN
         23Fwb9/c1XbPAtTqq6sgb+ImavWVGJw9lU2Tqi+vr+ZGyLjRuDi1u0v24f4fgOo5Xcbs
         v9EYL57jvOSikwy3L0onlfXaF2qd+qNw1Q25oBr2axrArgPRPA7c+mgPyLwfwSLNUM+U
         3t6g==
X-Forwarded-Encrypted: i=1; AKwUvByi5upplIVgzJ6dXRAy8/zuUEwByvLl7yUFjE16t/bdG9f4rl1M3TdmTdFekCtjAy6pjzKemY0uzvHCQlM=@vger.kernel.org
X-Gm-Message-State: AFuF++k2oP8qMUshy116/0SpSG511m4UYqRZx93YcD1tLkRuA4VQeTF+
	rGPdyUohAObaMcIOluIfGQ7t3tnJ2G3QKBPdnWbp1VgaBrKmG1lXekTKA32lHno8vQAs2o/qeG+
	bcce7iKTTwQ==
X-Received: from dybhi48.prod.google.com ([2002:a05:7301:29b0:b0:33c:382b:2d9c])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:fa9:b0:13c:e1e2:fc86
 with SMTP id a92af1059eb24-146ce49209fmr2846765c88.4.1790403717599; Fri, 25
 Sep 2026 23:21:57 -0700 (PDT)
Date: Fri, 25 Sep 2026 23:19:57 -0700
In-Reply-To: <20260926062029.800743-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260923181213.3032038-1-irogers@google.com> <20260926062029.800743-1-irogers@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20260926062029.800743-31-irogers@google.com>
Subject: [PATCH v4 30/49] perf python: Port futex-contention to perf module
From: Ian Rogers <irogers@google.com>
To: irogers@google.com, acme@kernel.org, alice.mei.rogers@gmail.com, 
	james.clark@linaro.org, leo.yan@linux.dev, namhyung@kernel.org
Cc: adrian.hunter@intel.com, dapeng1.mi@linux.intel.com, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	mingo@redhat.com, peterz@infradead.org, tmricht@linux.ibm.com
Content-Type: text/plain; charset="UTF-8"

Port tools/perf/scripts/python/futex-contention.py to a standalone
script in tools/perf/python/ using the perf module. Avoiding the
embedded interpreter overhead improves execution speed by ~3.2x:

```
$ perf record -e syscalls:sys_*_futex -a sleep 1
...
$ time perf script tools/perf/scripts/python/futex-contention.py
...
real    0m1.007s
user    0m0.935s
sys     0m0.072s
$ time python3 tools/perf/python/futex-contention.py
...
real    0m0.314s
user    0m0.259s
sys     0m0.056s
```

Additional improvements compared to the legacy script:
- Consolidate per-(tid, uaddr) contention count, total_time, min_time,
  and max_time into a single LockStats class instead of maintaining
  three separate dictionaries.
- Validate that uaddr and op tracepoint attributes are present on
  syscalls:sys_enter_futex samples rather than silently attributing
  missing fields to uaddr=0, op=0 (FUTEX_WAIT).
- Add -i/--input CLI option support via argparse and full type
  annotations.

Add a shell test (test_futex_contention_python.sh) to verify the
standalone script.

Assisted-by: Antigravity:gemini-3.1-pro
Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/python/futex-contention.py         | 107 ++++++++++++++++
 .../shell/test_futex_contention_python.sh     | 115 ++++++++++++++++++
 2 files changed, 222 insertions(+)
 create mode 100755 tools/perf/python/futex-contention.py
 create mode 100755 tools/perf/tests/shell/test_futex_contention_python.sh

diff --git a/tools/perf/python/futex-contention.py b/tools/perf/python/futex-contention.py
new file mode 100755
index 000000000000..097663d929b7
--- /dev/null
+++ b/tools/perf/python/futex-contention.py
@@ -0,0 +1,107 @@
+#!/usr/bin/env python3
+# SPDX-License-Identifier: GPL-2.0
+"""Measures futex contention."""
+from __future__ import annotations
+
+import argparse
+from collections import defaultdict
+from typing import Dict, Tuple
+import perf
+
+class LockStats:
+    """Aggregate lock contention information."""
+    def __init__(self) -> None:
+        self.count = 0
+        self.total_time = 0
+        self.min_time = 0
+        self.max_time = 0
+
+    def add(self, duration: int) -> None:
+        """Add a new duration measurement."""
+        self.count += 1
+        self.total_time += duration
+        if self.count == 1:
+            self.min_time = duration
+            self.max_time = duration
+        else:
+            self.min_time = min(self.min_time, duration)
+            self.max_time = max(self.max_time, duration)
+
+    def avg(self) -> float:
+        """Return average duration."""
+        return self.total_time / self.count if self.count > 0 else 0.0
+
+process_names: Dict[int, str] = {}
+start_times: Dict[int, Tuple[int, int]] = {}
+session = None
+durations: Dict[Tuple[int, int], LockStats] = defaultdict(LockStats)
+
+FUTEX_WAIT = 0
+FUTEX_PRIVATE_FLAG = 128
+FUTEX_CLOCK_REALTIME = 256
+# Mask out FUTEX_PRIVATE_FLAG and FUTEX_CLOCK_REALTIME so variants such as
+# FUTEX_WAIT_PRIVATE (0 | 128) match the base FUTEX_WAIT command.
+FUTEX_CMD_MASK = ~(FUTEX_PRIVATE_FLAG | FUTEX_CLOCK_REALTIME)
+
+
+def handle_start(pid: int, tid: int, uaddr: int, op: int, start_time: int) -> None:
+    """Handle a futex sys_enter event."""
+    if (op & FUTEX_CMD_MASK) != FUTEX_WAIT:
+        return
+    try:
+        if session:
+            process = session.find_thread(pid, tid)
+            if process:
+                process_names[tid] = process.comm() or "unknown"
+    except (TypeError, AttributeError):
+        pass
+    if tid not in process_names:
+        process_names[tid] = "unknown"
+
+    start_times[tid] = (uaddr, start_time)
+
+def handle_end(tid: int, end_time: int) -> None:
+    """Handle a futex sys_exit event."""
+    if tid not in start_times:
+        return
+    (uaddr, start_time) = start_times[tid]
+    del start_times[tid]
+    durations[(tid, uaddr)].add(end_time - start_time)
+
+def process_event(sample: perf.sample_event) -> None:
+    """Process a single sample event."""
+    event_name = str(sample.evsel)
+    if event_name.startswith("evsel(") and event_name.endswith(")"):
+        event_name = event_name[6:-1]
+    if event_name.startswith("syscalls:sys_enter_futex"):
+        uaddr = getattr(sample, "uaddr", None)
+        op = getattr(sample, "op", None)
+        if uaddr is None or op is None:
+            return  # Tracepoint fields missing, skip silent attribution to 0
+        handle_start(getattr(sample, "sample_pid", sample.sample_tid),
+                     sample.sample_tid, uaddr, op, sample.sample_time)
+    elif event_name.startswith("syscalls:sys_exit_futex"):
+        handle_end(sample.sample_tid, sample.sample_time)
+
+
+if __name__ == "__main__":
+    ap = argparse.ArgumentParser(description="Measure futex contention")
+    ap.add_argument("-i", "--input", default="perf.data", help="Input file name")
+    args = ap.parse_args()
+
+    try:
+        session = perf.session(perf.data(args.input), sample=process_event)
+        try:
+            session.process_events()
+        except KeyboardInterrupt:
+            pass
+
+        for ((t, u), stats) in sorted(durations.items()):
+            avg_ns = stats.avg()
+            print(f"{process_names.get(t, 'unknown')}[{t}] lock {u:x} contended "
+                  f"{stats.count} times, {avg_ns:.0f} avg ns "
+                  f"[max: {stats.max_time} ns, min {stats.min_time} ns]")
+    finally:
+        # Break the reference cycle between the global session and the
+        # process_event callback so the C perf.session object is freed.
+        session = None
diff --git a/tools/perf/tests/shell/test_futex_contention_python.sh b/tools/perf/tests/shell/test_futex_contention_python.sh
new file mode 100755
index 000000000000..26b13d263d20
--- /dev/null
+++ b/tools/perf/tests/shell/test_futex_contention_python.sh
@@ -0,0 +1,115 @@
+#!/bin/bash
+# SPDX-License-Identifier: GPL-2.0
+# futex-contention python test
+
+set -e
+
+shelldir=$(dirname "$0")
+# shellcheck source=lib/setup_python.sh
+. "${shelldir}"/lib/setup_python.sh
+
+# If we don't have the perf python module, we can't test
+if ! "$PYTHON" -c 'import perf' > /dev/null 2>&1; then
+	echo "Skipping test, perf python module not found"
+	exit 2
+fi
+
+script_dir="$(dirname "$0")/../../python"
+script_path="${script_dir}/futex-contention.py"
+
+if ! perf check feature -q libtraceevent > /dev/null 2>&1; then
+	echo "Skipping test, libtraceevent is disabled"
+	exit 2
+fi
+
+if [ ! -f "$script_path" ]; then
+	echo "Skipping test, futex-contention.py not found at $script_path"
+	exit 2
+fi
+
+err=0
+temp_data=""
+temp_out=""
+
+cleanup() {
+	rm -f "${temp_data}" "${temp_out}"
+}
+
+trap 'cleanup' EXIT TERM INT
+
+temp_data=$(mktemp /tmp/perf.data.XXXXXX)
+temp_out=$(mktemp /tmp/perf.out.XXXXXX)
+
+test_synthetic() {
+	echo "Testing futex-contention.py synthetic events..."
+	if ! "$PYTHON" - "$script_path" << 'EOF'
+import importlib.util
+import sys
+from types import SimpleNamespace
+
+spec = importlib.util.spec_from_file_location("futex_contention", sys.argv[1])
+mod = importlib.util.module_from_spec(spec)
+spec.loader.exec_module(mod)
+
+enter_sample = SimpleNamespace(
+    evsel="evsel(syscalls:sys_enter_futex:k)",
+    sample_pid=1234,
+    sample_tid=1234,
+    uaddr=0xdeadbeef,
+    op=mod.FUTEX_WAIT | mod.FUTEX_PRIVATE_FLAG,
+    sample_time=1000,
+)
+exit_sample = SimpleNamespace(
+    evsel="evsel(syscalls:sys_exit_futex:k)",
+    sample_pid=1234,
+    sample_tid=1234,
+    sample_time=2500,
+)
+
+mod.process_event(enter_sample)
+mod.process_event(exit_sample)
+
+stats = mod.durations.get((1234, 0xdeadbeef))
+assert stats is not None and stats.count == 1, f"Unexpected stats: {stats}"
+assert stats.min_time == 1500 and stats.max_time == 1500 and stats.avg() == 1500.0
+line = (f"{mod.process_names.get(1234, 'unknown')}[1234] lock {0xdeadbeef:x} "
+        f"contended {stats.count} times, {stats.avg():.0f} avg ns "
+        f"[max: {stats.max_time} ns, min {stats.min_time} ns]")
+expected = "unknown[1234] lock deadbeef contended 1 times, 1500 avg ns [max: 1500 ns, min 1500 ns]"
+assert line == expected, line
+EOF
+	then
+		echo "Synthetic test failed."
+		err=1
+	else
+		echo "Synthetic test passed."
+	fi
+}
+
+test_file_mode() {
+	echo "Testing futex-contention.py..."
+	# Some systems might not have syscalls:sys_enter_futex
+	if ! perf list | grep -q syscalls:sys_enter_futex; then
+		echo "Skipping file mode test, syscalls:sys_enter_futex not found"
+		return
+	fi
+
+	# Generate some futex events
+	if ! perf record -e syscalls:sys_enter_futex,syscalls:sys_exit_futex -a -o "${temp_data}" \
+		-- sleep 0.5 2>/dev/null; then
+		echo "Skipping file mode test (record failed)"
+		return
+	fi
+
+	if ! "$PYTHON" "$script_path" -i "${temp_data}" > "${temp_out}"; then
+		echo "File mode test failed."
+		err=1
+	else
+		echo "File mode test passed."
+	fi
+}
+
+test_synthetic
+test_file_mode
+
+exit $err
-- 
2.56.0.rc1.315.gc6ed9934b7-goog

