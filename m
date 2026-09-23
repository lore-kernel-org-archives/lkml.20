Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6435B41DEDF
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 18:14:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790187273; cv=none; b=gllu4myyvsy/BGG3elf44KiaxKkSm4ocNrXEjrqLzxHT/eNLEXJb9hKDwSoBRh31rJwhPCQtbYXuDwGT9ky3Lid9jstoOPMHI7oKXGpQnezrW7EE2uWmWsJ6gm5M3/sNkSrhfY4Rbf9CA6bn+yGrCC3wRSmQdUng0cOk9hoQhOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790187273; c=relaxed/simple;
	bh=fTDYVdhZt+IkFc/ApmZtGydMwuCOtccqN1GaMfDfLWE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=PwsGF3gNYzyXiS4/fMhJjLmgor+OdClKIZBVCIgIV7dN3/LIF2XZFUlCrwUr3udr15p3GG2TiMLSu6UZmoHR3xxuDj6cWpVudW8V49uboVWSy/sR87+9pkyes9g07xAx3NevJCQ5aZ5UeyHTnZ9qUW+8B6LhV47IuwlGZr+Zwo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=BGqFA2CM; arc=none smtp.client-ip=74.125.82.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="BGqFA2CM"
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-32ab0911226so194569eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 11:14:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790187262; x=1790792062; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9vdBhccq/94gqQzrXMG/7AB+kInwb5J5Iuo7pDxt+Tw=;
        b=BGqFA2CMl9xWunUKLSO+HwKNphtURFM+Fl9YzPe/ZH/5N30gHqfM7gVCReAg0wa2wb
         g7mJMp+Gssk+pe6MUIRtB/fdzrRGnvi2uyqfe9NX3NW4OaoCFMkbsxMfqBDmvGlXAk9G
         vCgnEuY5PgwIFepgtmoQAWpDKsHihQYI2rfdflB9lVr43kqjBYmhFl3snLslYzyQxyl2
         qzdXgMiYYGFOwsTN6WqXzobd6VvGK5J43aXq1f93cN9sDaMyQnwvRAkEKB1lIMCML5Ql
         KelSvzgJ+pi1pizyEhr5lj518m+9S3c3Iz05+fyx9LZS9bY246UKzIKo4aDPf5mQznWo
         ftJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790187262; x=1790792062;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9vdBhccq/94gqQzrXMG/7AB+kInwb5J5Iuo7pDxt+Tw=;
        b=F01ZL2pVZanXdISJbYzTJRubuB6CLSOt7fm/NttGGv4nFPHa+Y/efBtQLF8JX7JkNh
         E47TatJVVs+Q9FIItXIlPcrYO9fVbm7q9MGQmB0qYj04uyp4AmpJ8a7KsALnuQpKZC9m
         1FUofJYnEv9UuZhhl1RpC7iUKqz6S0zvDt7335RwNDmgGtWY/ABdcXkOsa46bkR5rkNR
         CEzb0oDS5rCt2oBZq8EbLmUvPWamUOvZCRxWoKMixXaDWZPV4nfNa5bktwSbiVozeQXB
         LlJBmL3ACr0Y8eI/TNsjb4iF7uwLmJfU56mKsQyMiCQPMqBwtBJzK/SxJCiKtZY/hSQ5
         svJw==
X-Forwarded-Encrypted: i=1; AKwUvBw+vPsL9syo92/nOpiGpfcJCo8t9tjekux2VRIVlFc9d8pMsCE3+9x0B0gVC2xpDgGhtTIzzsYeRRqd3Q4=@vger.kernel.org
X-Gm-Message-State: AFuF++kjnA1i69vNQwutoq92MexnGquHcn34ZyhCwj2lVic3/piPhlfW
	JI6R7RBjH1lfqaKAKWdQX9w3FJdpfWgJlW3tBru1uc2h0BGbR9IZVsjm3J2Zral9bJBOAqZ8Jpt
	31f+I15kcXg==
X-Received: from dleb14-n2.prod.google.com ([2002:a05:701b:424e:20b0:144:d0d2:bf01])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:3c87:b0:144:ee3d:21f6
 with SMTP id a92af1059eb24-144f8dfce71mr2990008c88.16.1790187261495; Wed, 23
 Sep 2026 11:14:21 -0700 (PDT)
Date: Wed, 23 Sep 2026 11:11:52 -0700
In-Reply-To: <20260923181213.3032038-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <cover.1789966896.git.irogers@google.com> <20260923181213.3032038-1-irogers@google.com>
X-Mailer: git-send-email 2.56.0.rc1.310.g51773c2048-goog
Message-ID: <20260923181213.3032038-30-irogers@google.com>
Subject: [PATCH v3 29/49] perf python: Port rwtop from Perl to perf module
From: Ian Rogers <irogers@google.com>
To: irogers@google.com, acme@kernel.org, alice.mei.rogers@gmail.com, 
	namhyung@kernel.org
Cc: adrian.hunter@intel.com, dapeng1.mi@linux.intel.com, 
	james.clark@linaro.org, leo.yan@linux.dev, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, mingo@redhat.com, peterz@infradead.org, 
	tmricht@linux.ibm.com
Content-Type: text/plain; charset="UTF-8"

Replace the legacy Perl script rwtop.pl with a standalone Python script
in tools/perf/python/rwtop.py using the perf Python module.

Improvements compared to the legacy Perl script:
- Remove the dependency on libperl and Perf::Trace::Util.
- Support both offline perf.data files (via perf.session) and live
  recording (via LiveSession with --live), driving periodic interval
  summaries from event timestamps rather than wall-clock SIGALRM timers
  so both live and offline runs produce deterministic output.
- Convert unsigned 32-bit and 64-bit error return values
  (0xfffff000..0xffffffff and >= 0x8000000000000000) to negative errnos
  so failed read/write syscalls are recorded in the error table rather
  than inflating bytes_read / bytes_written.
- Sanitize non-printable characters in /proc/<pid>/comm to prevent
  terminal control sequence injection.

Add a shell test
(test_rwtop_python.sh) to verify the standalone script.

Assisted-by: Antigravity:gemini-3.1-pro
Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/python/rwtop.py                  | 256 ++++++++++++++++++++
 tools/perf/tests/shell/test_rwtop_python.sh |  74 ++++++
 2 files changed, 330 insertions(+)
 create mode 100755 tools/perf/python/rwtop.py
 create mode 100755 tools/perf/tests/shell/test_rwtop_python.sh

diff --git a/tools/perf/python/rwtop.py b/tools/perf/python/rwtop.py
new file mode 100755
index 000000000000..9a66f37080ef
--- /dev/null
+++ b/tools/perf/python/rwtop.py
@@ -0,0 +1,256 @@
+#!/usr/bin/env python3
+# SPDX-License-Identifier: GPL-2.0-only
+"""Periodically displays system-wide r/w call activity, broken down by pid."""
+from __future__ import annotations
+
+import argparse
+from collections import defaultdict
+import os
+import sys
+from typing import Optional, Dict, Any
+import perf
+from perf_live import LiveSession
+
+class RwTop:
+    """Periodically displays system-wide r/w call activity."""
+    def __init__(self, interval: int = 3, nlines: int = 20) -> None:
+        self.offline = False
+        self.interval_ns = interval * 1000000000
+        self.nlines = nlines
+        self.reads: Dict[int, Dict[str, Any]] = defaultdict(
+            lambda: {
+                "bytes_requested": 0,
+                "bytes_read": 0,
+                "total_reads": 0,
+                "comm": "",
+                "errors": defaultdict(int),
+            }
+        )
+        self.writes: Dict[int, Dict[str, Any]] = defaultdict(
+            lambda: {
+                "bytes_requested": 0,
+                "bytes_written": 0,
+                "total_writes": 0,
+                "comm": "",
+                "errors": defaultdict(int),
+            }
+        )
+        self.unhandled: Dict[str, int] = defaultdict(int)
+        self.comm_cache: Dict[int, str] = {}
+        self.session: Optional[perf.session] = None
+        self.last_print_time: int = 0
+
+    def get_comm(self, pid: int, tid: Optional[int] = None) -> str:
+        """Resolve and cache the comm(and) of a pid."""
+        comm = None
+        if self.session:
+            # In offline mode, query session.find_thread() directly so PERF_RECORD_COMM
+            # updates after execve are reflected immediately instead of returning a
+            # stale pre-exec comm from comm_cache.
+            try:
+                thread = (self.session.find_thread(pid, tid)
+                          if tid is not None else self.session.find_thread(pid))
+                comm = thread.comm() if thread else None
+            except (TypeError, AttributeError):
+                pass
+            if not comm:
+                comm = self.comm_cache.get(pid)
+        else:
+            comm = self.comm_cache.get(pid)
+            if comm:
+                return comm
+            try:
+                with open(f"/proc/{pid}/comm", "r", encoding="utf-8", errors="replace") as f:
+                    comm = f.read().strip()
+            except OSError:
+                # The thread may have exited before /proc could be read.
+                pass
+        if not comm:
+            comm = f"PID({pid})"
+        comm = ''.join(c if c.isprintable() else '?' for c in comm)
+        self.comm_cache[pid] = comm
+        return comm
+
+    def process_event(self, sample: perf.sample_event) -> None:
+        """Process events."""
+        event_name = str(sample.evsel)
+        if event_name.startswith("evsel(") and event_name.endswith(")"):
+            event_name = event_name[6:-1]
+        event_name = "".join(c if c.isprintable() else "?" for c in event_name)
+        pid = sample.sample_pid
+        sample_time = sample.sample_time
+
+        if self.last_print_time == 0:
+            self.last_print_time = sample_time
+
+        # Check if interval has passed
+        if sample_time > self.last_print_time and sample_time - self.last_print_time >= self.interval_ns:
+            self.print_totals()
+            self.last_print_time = sample_time
+
+        # Map each event onto the totals it updates. "enter" events count the
+        # requested bytes, "exit" events the transferred bytes or the error.
+        handlers = {
+            "syscalls:sys_enter_read": (self.reads, "total_reads", None),
+            "syscalls:sys_exit_read": (self.reads, None, "bytes_read"),
+            "syscalls:sys_enter_write": (self.writes, "total_writes", None),
+            "syscalls:sys_exit_write": (self.writes, None, "bytes_written"),
+        }
+        handler = handlers.get(event_name)
+        if not handler:
+            self.unhandled[event_name] += 1
+            return
+
+        totals, count_key, bytes_key = handler
+        try:
+            value = sample.count if count_key else sample.ret
+        except AttributeError:
+            self.unhandled[event_name] += 1
+            return
+
+        data = totals[pid]
+        data["comm"] = self.get_comm(pid, getattr(sample, "sample_tid", None))
+        if count_key:
+            data["bytes_requested"] += value
+            data[count_key] += 1
+        elif bytes_key:
+            # Convert unsigned 32-bit or 64-bit kernel error return values to signed integers.
+            # Because kernel read/write transfers are bounded by MAX_RW_COUNT (0x7ffff000 < 2 GiB),
+            # 0xfffff000..0xffffffff is always a 32-bit negative errno even on 64-bit hosts.
+            if value > 0:
+                if 0xfffff000 <= value <= 0xffffffff:
+                    value -= 0x100000000
+                elif value >= 0x8000000000000000:
+                    value -= 0x10000000000000000
+            if value >= 0:
+                data[bytes_key] += value
+            else:
+                data["errors"][value] += 1
+
+    def print_totals(self) -> None:
+        """Print summary tables."""
+        if not self.offline:
+            print('\x1b[H\x1b[2J', end='')
+        print("read counts by pid:\n")
+        print(
+            f"{'pid':>6s}  {'comm':<20s}  {'# reads':>10s}  "
+            f"{'bytes_req':>10s}  {'bytes_read':>10s}"
+        )
+        print(f"{'-'*6}  {'-'*20}  {'-'*10}  {'-'*10}  {'-'*10}")
+
+        count = 0
+        for pid, data in sorted(self.reads.items(),
+                                key=lambda kv: kv[1]["bytes_read"], reverse=True):
+            print(
+                f"{pid:6d}  {data['comm']:<20s}  {data['total_reads']:10d}  "
+                f"{data['bytes_requested']:10d}  {data['bytes_read']:10d}"
+            )
+            count += 1
+            if count >= self.nlines:
+                break
+
+        print("\nfailed reads by pid:\n")
+        print(f"{'pid':>6s}  {'comm':<20s}  {'error #':>7s}  {'# errors':>10s}")
+        print(f"{'-'*6}  {'-'*20}  {'-'*7}  {'-'*10}")
+
+        errcounts = []
+        for pid, data in self.reads.items():
+            for error, cnt in data["errors"].items():
+                errcounts.append((pid, data["comm"], error, cnt))
+
+        sorted_errcounts = sorted(errcounts, key=lambda x: x[3], reverse=True)
+        for pid, comm, error, cnt in sorted_errcounts[:self.nlines]:
+            print(f"{pid:6d}  {comm:<20s}  {error:7d}  {cnt:10d}")
+
+        print("\nwrite counts by pid:\n")
+        print(
+            f"{'pid':>6s}  {'comm':<20s}  {'# writes':>10s}  "
+            f"{'bytes_req':>10s}  {'bytes_written':>13s}"
+        )
+        print(f"{'-'*6}  {'-'*20}  {'-'*10}  {'-'*10}  {'-'*13}")
+
+        count = 0
+        for pid, data in sorted(self.writes.items(),
+                                key=lambda kv: kv[1]["bytes_written"], reverse=True):
+            print(
+                f"{pid:6d}  {data['comm']:<20s}  {data['total_writes']:10d}  "
+                f"{data['bytes_requested']:10d}  {data['bytes_written']:13d}"
+            )
+            count += 1
+            if count >= self.nlines:
+                break
+
+        print("\nfailed writes by pid:\n")
+        print(f"{'pid':>6s}  {'comm':<20s}  {'error #':>7s}  {'# errors':>10s}")
+        print(f"{'-'*6}  {'-'*20}  {'-'*7}  {'-'*10}")
+
+        errcounts = []
+        for pid, data in self.writes.items():
+            for error, cnt in data["errors"].items():
+                errcounts.append((pid, data["comm"], error, cnt))
+
+        sorted_errcounts = sorted(errcounts, key=lambda x: x[3], reverse=True)
+        for pid, comm, error, cnt in sorted_errcounts[:self.nlines]:
+            print(f"{pid:6d}  {comm:<20s}  {error:7d}  {cnt:10d}")
+
+        # Reset counts
+        self.reads.clear()
+        self.writes.clear()
+        self.comm_cache.clear()
+
+    def run(self, input_file: str) -> None:
+        """Run the session."""
+        self.session = perf.session(perf.data(input_file), sample=self.process_event)
+        try:
+            self.session.process_events()
+        finally:
+            # Break the reference cycle between perf.session and self.process_event
+            # because perf.session lacks cyclic GC support (tp_traverse).
+            self.session = None
+
+        # Print final totals if there are any left
+        if self.reads or self.writes:
+            self.print_totals()
+
+        if self.unhandled:
+            print("\nunhandled events:\n")
+            print(f"{'event':<40s}  {'count':>10s}")
+            print(f"{'-'*40}  {'-'*10}")
+            for event_name, count in self.unhandled.items():
+                print(f"{event_name:<40s}  {count:10d}")
+
+def main() -> None:
+    """Main function."""
+    parser = argparse.ArgumentParser(description="Trace r/w activity by PID")
+    parser.add_argument(
+        "interval", type=int, nargs="?", default=3, help="Refresh interval in seconds"
+    )
+    parser.add_argument("-i", "--input", default="perf.data", help="Input file")
+    parser.add_argument("-l", "--live", action="store_true", help="Run in live mode")
+    args = parser.parse_args()
+
+    analyzer = RwTop(args.interval)
+    try:
+        if args.live or (not os.path.exists(args.input) and args.input == "perf.data"):
+            # Live mode
+            events = (
+                "syscalls:sys_enter_read,syscalls:sys_exit_read,"
+                "syscalls:sys_enter_write,syscalls:sys_exit_write"
+            )
+            live_session = LiveSession(events, sample_callback=analyzer.process_event)
+            print("Live mode started. Press Ctrl+C to stop.", file=sys.stderr)
+            live_session.run()
+        else:
+            analyzer.offline = True
+            analyzer.run(args.input)
+    except IOError as e:
+        print(e, file=sys.stderr)
+        sys.exit(1)
+    except KeyboardInterrupt:
+        if not analyzer.offline:
+            print("\nStopping live mode...", file=sys.stderr)
+        if analyzer.reads or analyzer.writes:
+            analyzer.print_totals()
+
+if __name__ == "__main__":
+    main()
diff --git a/tools/perf/tests/shell/test_rwtop_python.sh b/tools/perf/tests/shell/test_rwtop_python.sh
new file mode 100755
index 000000000000..062fca2dad14
--- /dev/null
+++ b/tools/perf/tests/shell/test_rwtop_python.sh
@@ -0,0 +1,74 @@
+#!/bin/bash
+# SPDX-License-Identifier: GPL-2.0
+# rwtop python test
+
+set -e
+
+shelldir=$(dirname "$0")
+# shellcheck source=lib/setup_python.sh
+. "${shelldir}"/lib/setup_python.sh
+
+if ! "$PYTHON" -c 'import perf' > /dev/null 2>&1; then
+	echo "Skipping test, perf python module not found"
+	exit 2
+fi
+
+script_dir="$(dirname "$0")/../../python"
+script_path="${script_dir}/rwtop.py"
+
+if ! perf check feature -q libtraceevent > /dev/null 2>&1; then
+	echo "Skipping test, libtraceevent is disabled"
+	exit 2
+fi
+
+if [ ! -f "$script_path" ]; then
+	echo "Skipping test, rwtop.py not found at $script_path"
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
+trap 'cleanup' EXIT TERM INT
+
+temp_data=$(mktemp /tmp/perf.data.XXXXXX)
+temp_out=$(mktemp /tmp/perf.out.XXXXXX)
+
+echo "Testing rwtop.py..."
+
+# Create a perf.data file. Try to get tracepoint data.
+if perf list | grep -q "syscalls:sys_enter_read"; then
+	ev="syscalls:sys_enter_read,syscalls:sys_exit_read"
+	ev="${ev},syscalls:sys_enter_write,syscalls:sys_exit_write"
+	perf record -e "$ev" -a -o "${temp_data}" \
+		-- dd if=/dev/urandom of=/dev/null bs=1M count=10 >/dev/null 2>&1 || \
+		{ echo "Skipping test, perf record failed"; exit 2; }
+else
+	echo "Skipping test, no syscalls:sys_enter_read event"
+	exit 2
+fi
+
+if [ ! -s "${temp_data}" ]; then
+	echo "Skipping test, perf record failed to create data"
+	exit 2
+fi
+
+# Check that the script executes
+if ! "$PYTHON" "$script_path" -i "${temp_data}" > "${temp_out}"; then
+	echo "rwtop.py test failed"
+	err=1
+else
+	if ! grep -E -q "^ *[0-9]+" "${temp_out}"; then
+		echo "Failed to find metric data rows"
+		err=1
+	else
+		echo "rwtop test passed."
+	fi
+fi
+rm -f "${temp_out}"
+
+exit $err
-- 
2.56.0.rc1.310.g51773c2048-goog

