Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31BA33AA4FA
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 06:21:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790403715; cv=none; b=jaMcgqNxsRJW1t3A0bXMYCOqtUshgt1V+rYtMgROLApJfc3RiVAQ0QOLN3VU3S0607gLau1waCgfNTtjZTnOJ2J5HP7HHaEcpfTtHHjXcXXQNyOOTNorI2NeHVNbfa3XwurctnyhBjVHR3F+FV9yq5yDZmShWZk7MutSG9799HM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790403715; c=relaxed/simple;
	bh=kYVZiF5hlkruhUMDokFTTc5TazRNvJak8dyWK+gF3LQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=PrjZKE4sFgnCMfYOQBxXhEskEOC3FQwfx59lknSOXVRkBalFiuVjXhSZh+xVA5Ovxocq6OZqy4Tp8OnXmFzNC5+htHjrvj5Y4DamW0ZA6U1IvI9763zSA1vaiFtGO7MI0n55salnf9IUbiHiU6eGI1bTvvM4laIIH/0ADCwEwYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=t85NWY4U; arc=none smtp.client-ip=74.125.82.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="t85NWY4U"
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1438719cc1eso1869195c88.0
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 23:21:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790403712; x=1791008512; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z0SUfYwa9UA2sHBFgE8pcIigkXmhZ0oXJZjOlbxtxg0=;
        b=t85NWY4UPOYrWYnmE6YdXP5GuGhMknBdI6O1gHxuMeMvNhnFh/Eaiu6eoT8R5aYr5F
         R0R8pJdsvb0PlVqzpT/2rZ4MdIgMCP8HZMqa5PeNpBxu6UQk9jO5et/cb6P4tD/jWd9t
         752BOTTO/ohhpDcJACoZsbq1J7HZPQ/g4TT6tbZvL0QgUwVfXScijhDEFTyEUszOofqv
         JlB+MzmgUiAtVPqRXzbEqUoeC/itpetAH1EDHysDfVD8ehL8eu4bLBLbwiTwbbQM2O5h
         0np4QAK05KBr6p8cuwehXfkHbWoGDwPLDSrgAXyLaJBhID9jN3sgCHCyEScgNH34xQ1C
         cfIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790403712; x=1791008512;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z0SUfYwa9UA2sHBFgE8pcIigkXmhZ0oXJZjOlbxtxg0=;
        b=SEhpIEUOp9X/1WlMqkJCRYsltLpu4GgdQh82t6JixkUIhCXV1iTaprhc2dFYn2jPPM
         Euk8mYAu28jpTzA3RQgDjLFmKc2ql/DfkVRdUSQo/98PgnU3uTnXlyBTGtpb5iNlix9C
         d7PvG8KM0K5OuXHPmQB5/gcBMfBOp0STObmp3d/l6UIbWeDZxIQcWSX5EEwc1tUfMPoZ
         bV9NJrkxGEYkQQZhBjpDcwUBecY37JPXaIrJZvbIec6qXZvz+37wxMZp4P7KPIOf+R6s
         DKW8cQf2N1LGLuPFUoKXd2dTG6g18zJnT2Zs02fgJGsuD6OOKcmX7ks0HmaSkrYyTUS5
         iZCA==
X-Forwarded-Encrypted: i=1; AKwUvBxY8YgSE4lBs4P2XCxnNWWg05aVRl5fb1ZPC1Zuse0256TiaCNVpVWtQVPGftN2QS7pFKhaClbC3IFwCbA=@vger.kernel.org
X-Gm-Message-State: AFuF++kQrn3rjdROgRDJiM3hSnHc4HurL/IqS/4FL8ovyplHyvGCTj/q
	qa3Oa0ty7jBNYpqxhW3+nU2C1aEquHfDsA+Ywxz74MBAQgUVhsjFteScRsmp2JDtX4+DrThlJnH
	okIwN5YMeBA==
X-Received: from dltt19.prod.google.com ([2002:a05:701a:c973:b0:144:cecc:dd20])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:b04b:10b0:143:298b:ba79
 with SMTP id a92af1059eb24-146d03a100bmr1895002c88.40.1790403711769; Fri, 25
 Sep 2026 23:21:51 -0700 (PDT)
Date: Fri, 25 Sep 2026 23:19:54 -0700
In-Reply-To: <20260926062029.800743-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260923181213.3032038-1-irogers@google.com> <20260926062029.800743-1-irogers@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20260926062029.800743-28-irogers@google.com>
Subject: [PATCH v4 27/49] perf python: Port rw-by-file from Perl to perf module
From: Ian Rogers <irogers@google.com>
To: irogers@google.com, acme@kernel.org, alice.mei.rogers@gmail.com, 
	james.clark@linaro.org, leo.yan@linux.dev, namhyung@kernel.org
Cc: adrian.hunter@intel.com, dapeng1.mi@linux.intel.com, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	mingo@redhat.com, peterz@infradead.org, tmricht@linux.ibm.com
Content-Type: text/plain; charset="UTF-8"

Replace the legacy Perl script rw-by-file.pl with a standalone Python
script in tools/perf/python/rw-by-file.py using the perf Python module.

Improvements compared to the legacy Perl script:
- Remove the dependency on libperl and Perf::Trace::Util.
- Encapsulate per-file-descriptor read/write byte and call count
  aggregation in an RwByFile class using perf.session and resolve thread
  command names via session.find_thread(pid, sample_tid).
- Add argparse CLI support (-i/--input and target program filter) and
  full type annotations.

Add a shell test
(test_rw_by_file_python.sh) to verify the standalone script.

Assisted-by: Antigravity:gemini-3.1-pro
Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/python/rw-by-file.py               | 113 ++++++++++++++++++
 .../tests/shell/test_rw_by_file_python.sh     |  68 +++++++++++
 2 files changed, 181 insertions(+)
 create mode 100755 tools/perf/python/rw-by-file.py
 create mode 100755 tools/perf/tests/shell/test_rw_by_file_python.sh

diff --git a/tools/perf/python/rw-by-file.py b/tools/perf/python/rw-by-file.py
new file mode 100755
index 000000000000..b33330261606
--- /dev/null
+++ b/tools/perf/python/rw-by-file.py
@@ -0,0 +1,113 @@
+#!/usr/bin/env python3
+# SPDX-License-Identifier: GPL-2.0-only
+"""Display r/w activity for files read/written to for a given program."""
+from __future__ import annotations
+
+import argparse
+from collections import defaultdict
+import sys
+from typing import Optional, Dict
+import perf
+
+class RwByFile:
+    """Tracks and displays read/write activity by file descriptor."""
+    def __init__(self, comm: str) -> None:
+        self.for_comm = comm
+        self.reads: Dict[int, Dict[str, int]] = defaultdict(
+            lambda: {"bytes_requested": 0, "total_reads": 0}
+        )
+        self.writes: Dict[int, Dict[str, int]] = defaultdict(
+            lambda: {"bytes_written": 0, "total_writes": 0}
+        )
+        self.unhandled: Dict[str, int] = defaultdict(int)
+        self.session: Optional[perf.session] = None
+
+    def process_event(self, sample: perf.sample_event) -> None:
+        """Process events."""
+        event_name = str(sample.evsel)
+        if event_name.startswith("evsel(") and event_name.endswith(")"):
+            event_name = event_name[6:-1]
+        event_name = "".join(c if c.isprintable() else "?" for c in event_name)
+
+        pid = sample.sample_pid
+        assert self.session is not None
+        try:
+            thread = self.session.find_thread(pid, sample.sample_tid)
+            comm = (thread.comm() if thread else None) or "unknown"
+        except (TypeError, AttributeError):
+            comm = "unknown"
+
+        if comm != self.for_comm:
+            return
+
+        if event_name == "syscalls:sys_enter_read":
+            try:
+                fd = sample.fd
+                count = sample.count
+                self.reads[fd]["bytes_requested"] += count
+                self.reads[fd]["total_reads"] += 1
+            except AttributeError:
+                self.unhandled[event_name] += 1
+        elif event_name == "syscalls:sys_enter_write":
+            try:
+                fd = sample.fd
+                count = sample.count
+                self.writes[fd]["bytes_written"] += count
+                self.writes[fd]["total_writes"] += 1
+            except AttributeError:
+                self.unhandled[event_name] += 1
+        else:
+            self.unhandled[event_name] += 1
+
+    def print_totals(self) -> None:
+        """Print summary tables."""
+        print(f"file read counts for {self.for_comm}:\n")
+        print(f"{'fd':>6s}  {'# reads':>10s}  {'bytes_requested':>15s}")
+        print(f"{'-'*6}  {'-'*10}  {'-'*15}")
+
+        for fd, data in sorted(self.reads.items(),
+                               key=lambda kv: kv[1]["bytes_requested"], reverse=True):
+            print(f"{fd:6d}  {data['total_reads']:10d}  {data['bytes_requested']:15d}")
+
+        print(f"\nfile write counts for {self.for_comm}:\n")
+        print(f"{'fd':>6s}  {'# writes':>10s}  {'bytes_written':>15s}")
+        print(f"{'-'*6}  {'-'*10}  {'-'*15}")
+
+        for fd, data in sorted(self.writes.items(),
+                               key=lambda kv: kv[1]["bytes_written"], reverse=True):
+            print(f"{fd:6d}  {data['total_writes']:10d}  {data['bytes_written']:15d}")
+
+        if self.unhandled:
+            print("\nunhandled events:\n")
+            print(f"{'event':<40s}  {'count':>10s}")
+            print(f"{'-'*40}  {'-'*10}")
+            for event_name, count in self.unhandled.items():
+                print(f"{event_name:<40s}  {count:10d}")
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
+        self.print_totals()
+
+def main() -> None:
+    """Main function."""
+    parser = argparse.ArgumentParser(description="Trace r/w activity by file")
+    parser.add_argument("comm", help="Filter by command name")
+    parser.add_argument("-i", "--input", default="perf.data", help="Input file")
+    args = parser.parse_args()
+
+    analyzer = RwByFile(args.comm)
+    try:
+        analyzer.run(args.input)
+    except IOError as e:
+        print(e, file=sys.stderr)
+        sys.exit(1)
+
+if __name__ == "__main__":
+    main()
diff --git a/tools/perf/tests/shell/test_rw_by_file_python.sh b/tools/perf/tests/shell/test_rw_by_file_python.sh
new file mode 100755
index 000000000000..98218bf8a39e
--- /dev/null
+++ b/tools/perf/tests/shell/test_rw_by_file_python.sh
@@ -0,0 +1,68 @@
+#!/bin/bash
+# SPDX-License-Identifier: GPL-2.0
+# rw-by-file python test
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
+script_path="${script_dir}/rw-by-file.py"
+
+if ! perf check feature -q libtraceevent > /dev/null 2>&1; then
+	echo "Skipping test, libtraceevent is disabled"
+	exit 2
+fi
+
+if [ ! -f "$script_path" ]; then
+	echo "Skipping test, rw-by-file.py not found at $script_path"
+	exit 2
+fi
+
+err=0
+cleanup() {
+	rm -f "${temp_data}" "${temp_out}"
+}
+trap 'cleanup' EXIT TERM INT
+temp_data=$(mktemp /tmp/perf.data.XXXXXX)
+temp_out=$(mktemp /tmp/perf.out.XXXXXX)
+
+echo "Testing rw-by-file.py..."
+
+# Create a perf.data file. Try to get tracepoint data.
+if perf list | grep -q "syscalls:sys_enter_read"; then
+	perf record -e syscalls:sys_enter_read,syscalls:sys_enter_write -a -o "${temp_data}" \
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
+# Check that the script executes - filtering for "dd" since that's what we ran
+if ! "$PYTHON" "$script_path" -i "${temp_data}" "dd" > "${temp_out}"; then
+	echo "rw-by-file.py test failed"
+	err=1
+else
+	if ! grep -E -q "^ *[0-9]+" "${temp_out}"; then
+		echo "Failed to find metric data rows"
+		err=1
+	else
+		echo "rw-by-file test passed."
+	fi
+fi
+rm -f "${temp_out}"
+
+exit $err
-- 
2.56.0.rc1.315.gc6ed9934b7-goog

