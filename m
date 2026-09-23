Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AF7A5293E7
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 18:13:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790187240; cv=none; b=QSP8FqmAeUHrt6n/j5R4On+W3A+2556T4M7HZnNNq5paswiUBdY28r2qpdl9OWt/TVfZwJpt0hgHrNBBsbuAeldBOjwmBrR8VkA6lpK+z36YGYJXNA8GwVXzt8MVbES6KW2CoisHjAwKQO88jpJLp9V3N2LNTeZ3yJJ0AA5mNNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790187240; c=relaxed/simple;
	bh=GYtWOGFJKuRfOu3KqWGDgB3Gm1zGpLCl72ZCAP2q3+0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=YqAxob6rVya+6+W+T/lknUm0PMdgQlQl5nc/N9n5boPQncjcocB1OJHQlg+Rzcnnxubj0/oQtJbjRRcPEJI78l1NgNp/azWZUSGLQv37Bwz/Fb8Pv9YxugP5uJMEJOl7Yeq0cR8tGq5fMWGhfVzKDQtJJyI1qm6LosbK820QP4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=CpMZmo59; arc=none smtp.client-ip=74.125.82.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="CpMZmo59"
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-30c0d568830so2220232eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 11:13:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790187234; x=1790792034; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CdWkqq5Py2/RE6rujplXydj2oxrlfwYzt8yfdoQJKEk=;
        b=CpMZmo59UROvOeg1hIO/ZYq3V9U7uG7tPyYpufwy4UMhzqk55vhjiNIRhyI0Bc8MzB
         GQXv/qK1Dwj0vAojRTnkwy11VY5CQCBjkx5jc8OfxnJPMaOQjdet5+D7kB1kzVY70G4U
         E/UsZo2NEvlkUn2d0Gc5efLF7X7nFPqKik9ys7fJ0CLFNTg384W3Ib8bjNjS8iZ+/F4M
         p5T3j7/is5Qbme6lBYF0k7V2fZ6YMDIs+eyv2nbYbsZV9Cf13oCJzhH1noGDoOFatleW
         QIL5EDpXxorC4AFn3+gpgQnep9v2KiBXMuFDyjT4bDtqhhHEpMnfq8ZM8MpUvd6HXMSI
         v/eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790187234; x=1790792034;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CdWkqq5Py2/RE6rujplXydj2oxrlfwYzt8yfdoQJKEk=;
        b=RamPCOPWBxiKFU/mASu9QL8vuXcInSOisyEhiwnJr7l4Eht2LNvePdeFAIa5ig6jY5
         N/3lAfxXS5yfZovRyb0iCo7H/nIsJW8ivbpOUc2VvaPA0Rp7M4Q0R6TTKeOADGRUH7X8
         XkMmdD9i/S90U/E7E4R8r+BQg3MtTO7G7WgoYKJVmI8tNRsMTsXJ1e0KK2BN0lRa7+Zm
         PoaMGDOOwaZrakTPSVGA5GUA1vujH7l9l20WeduSbGbYWTqiYiFmPtKDKHF63p1Uwu2B
         iwMN8hwhGtBxgs2cpv+3E8WxF0lvx3Fde83SiRQ5vrg0b49q33nGMm2Oflt8XpU/v0UK
         98ow==
X-Forwarded-Encrypted: i=1; AKwUvByLp2ARd7DiVXZLkK/3M9SUY4JTR2eEdS4veDP5ZdziL/dMmrjrXujxDUSSEiNKs0qNekT7tVYQlUi6CsY=@vger.kernel.org
X-Gm-Message-State: AFuF++muAYVRVY+Zj6mW4VQJDPdGiKGowCTGKaIhNyQZ2Hv1qTWXOUSM
	HOYxYi4ZN0aWVYUtMt45jA0yliYaR7liTHxgvb1wLclFsbmPQYDhMIsFdzY/Iii5uKc25oTYi7C
	sLiTWQNHeRA==
X-Received: from dlbsn12.prod.google.com ([2002:a05:7022:b90c:b0:144:c2f8:c025])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:3c16:b0:144:c11c:858e
 with SMTP id a92af1059eb24-144f91ba1fbmr3521801c88.31.1790187233161; Wed, 23
 Sep 2026 11:13:53 -0700 (PDT)
Date: Wed, 23 Sep 2026 11:11:45 -0700
In-Reply-To: <20260923181213.3032038-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <cover.1789966896.git.irogers@google.com> <20260923181213.3032038-1-irogers@google.com>
X-Mailer: git-send-email 2.56.0.rc1.310.g51773c2048-goog
Message-ID: <20260923181213.3032038-23-irogers@google.com>
Subject: [PATCH v3 22/49] perf python: Port syscall-counts to perf module
From: Ian Rogers <irogers@google.com>
To: irogers@google.com, acme@kernel.org, alice.mei.rogers@gmail.com, 
	namhyung@kernel.org
Cc: adrian.hunter@intel.com, dapeng1.mi@linux.intel.com, 
	james.clark@linaro.org, leo.yan@linux.dev, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, mingo@redhat.com, peterz@infradead.org, 
	tmricht@linux.ibm.com
Content-Type: text/plain; charset="UTF-8"

Port tools/perf/scripts/python/syscall-counts.py to a standalone script
in tools/perf/python/ using the perf module. Avoiding the embedded
interpreter and per-event dictionary allocation overhead improves
execution speed by ~4x:

```
$ perf record -e raw_syscalls:sys_enter -a sleep 1
...
$ time perf script tools/perf/scripts/python/syscall-counts.py perf
...
real    0m3.887s
user    0m3.578s
sys     0m0.308s
$ time python3 tools/perf/python/syscall-counts.py perf
...
real    0m0.953s
user    0m0.905s
sys     0m0.048s
```

Additional improvements compared to the legacy script:
- Resolve syscall names using perf.syscall_name(id, session.e_machine)
  instead of host python-audit / Util.py tables, enabling accurate
  cross-architecture perf.data analysis without external dependencies.
- Support both raw_syscalls:sys_enter (sample.id) and individual
  syscalls:sys_enter_* tracepoints (sample.__syscall_nr / sample.nr),
  filtering out invalid/corrupt (> 0xffff or negative) syscall numbers.
- Add argparse CLI options (-i/--input and optional comm filter).

Add a shell test (test_syscall_counts_python.sh) to verify the
standalone script. The legacy script and its bin wrapper are retained
temporarily during the transition to maintain bisectability and are
removed once all scripts are migrated.

Assisted-by: Antigravity:gemini-3.1-pro
Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/python/syscall-counts.py           | 91 +++++++++++++++++++
 .../tests/shell/test_syscall_counts_python.sh | 81 +++++++++++++++++
 2 files changed, 172 insertions(+)
 create mode 100755 tools/perf/python/syscall-counts.py
 create mode 100755 tools/perf/tests/shell/test_syscall_counts_python.sh

diff --git a/tools/perf/python/syscall-counts.py b/tools/perf/python/syscall-counts.py
new file mode 100755
index 000000000000..005916542c26
--- /dev/null
+++ b/tools/perf/python/syscall-counts.py
@@ -0,0 +1,91 @@
+#!/usr/bin/env python3
+# SPDX-License-Identifier: GPL-2.0
+"""
+Displays system-wide system call totals, broken down by syscall.
+
+If a [comm] arg is specified, only syscalls called by [comm] are displayed.
+"""
+from __future__ import annotations
+
+import argparse
+from collections import defaultdict
+from typing import DefaultDict
+import perf
+
+syscalls: DefaultDict[int, int] = defaultdict(int)
+for_comm = None
+session = None
+
+
+def print_syscall_totals():
+    """Print aggregated statistics."""
+    if for_comm is not None:
+        print(f"\nsyscall events for {for_comm}:\n")
+    else:
+        print("\nsyscall events:\n")
+
+    print(f"{'event':<40} {'count':>10}")
+    print("---------------------------------------- -----------")
+
+    for sc_id, val in sorted(syscalls.items(),
+                             key=lambda kv: (-kv[1], kv[0])):
+        e_machine = getattr(session, "e_machine", 0) or 0
+        # Mask out the x86_64 x32 ABI bit (__X32_SYSCALL_BIT = 0x40000000) before
+        # resolving the syscall number in the architecture's syscall table.
+        raw_sc_id = sc_id & ~0x40000000
+        if e_machine:
+            name = perf.syscall_name(raw_sc_id, e_machine) or str(sc_id)
+        else:
+            name = perf.syscall_name(raw_sc_id) or str(sc_id)
+        print(f"{name:<40} {val:>10}")
+
+
+def process_event(sample):
+    """Process a single sample event."""
+    event_name = str(sample.evsel)
+    # raw_syscalls:sys_enter exposes the syscall number as 'id', whereas
+    # per-syscall syscalls:sys_enter_* tracepoints expose '__syscall_nr' (or 'nr')
+    # and may have an unrelated syscall argument named 'id' (e.g. sys_enter_clock_gettime).
+    if event_name.startswith("evsel(raw_syscalls:sys_enter"):
+        sc_id = getattr(sample, "id", -1)
+    elif event_name.startswith("evsel(syscalls:sys_enter"):
+        sc_id = getattr(sample, "__syscall_nr", None)
+        if sc_id is not None and not (0 <= (sc_id & ~0x40000000) <= 0xffff):
+            sc_id = None
+        if sc_id is None:
+            sc_id = getattr(sample, "nr", -1)
+    else:
+        return
+
+    # Mask out __X32_SYSCALL_BIT (0x40000000) when validating the syscall ID range.
+    if not (0 <= (sc_id & ~0x40000000) <= 0xffff):
+        return
+
+    comm = "unknown"
+    try:
+        if session:
+            proc = session.find_thread(sample.sample_pid, sample.sample_tid)
+            if proc:
+                comm = proc.comm() or "unknown"
+    except (TypeError, AttributeError):
+        pass
+
+    if for_comm and comm != for_comm:
+        return
+    syscalls[sc_id] += 1
+
+
+if __name__ == "__main__":
+    ap = argparse.ArgumentParser()
+    ap.add_argument("comm", nargs="?", help="Only report syscalls for comm")
+    ap.add_argument("-i", "--input", default="perf.data", help="Input file name")
+    args = ap.parse_args()
+    for_comm = args.comm
+    try:
+        session = perf.session(perf.data(args.input), sample=process_event)
+        session.process_events()
+        print_syscall_totals()
+    finally:
+        # Break the reference cycle between session and process_event (whose module
+        # globals reference session) since perf.session lacks cyclic GC (tp_traverse).
+        session = None
diff --git a/tools/perf/tests/shell/test_syscall_counts_python.sh b/tools/perf/tests/shell/test_syscall_counts_python.sh
new file mode 100755
index 000000000000..0c4b75499209
--- /dev/null
+++ b/tools/perf/tests/shell/test_syscall_counts_python.sh
@@ -0,0 +1,81 @@
+#!/bin/bash
+# SPDX-License-Identifier: GPL-2.0
+# syscall-counts python test
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
+script_path="${script_dir}/syscall-counts.py"
+
+if ! perf check feature -q libtraceevent > /dev/null 2>&1; then
+	echo "Skipping test, libtraceevent is disabled"
+	exit 2
+fi
+
+if [ ! -f "$script_path" ]; then
+	echo "Skipping test, syscall-counts.py not found at $script_path"
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
+test_file_mode() {
+	echo "Testing syscall-counts.py..."
+	# Some systems might not have raw_syscalls:sys_enter (e.g. stripped kernels or permissions)
+	if ! perf list | grep -q raw_syscalls:sys_enter; then
+		echo "Skipping test, raw_syscalls:sys_enter not found"
+		exit 2
+	fi
+
+	# Generate some syscall events
+	if ! perf record -e raw_syscalls:sys_enter -o "${temp_data}" -- sleep 0.5 2>/dev/null; then
+		echo "perf record failed (permissions?), skipping file mode test."
+		exit 2
+	fi
+
+	if ! "$PYTHON" "$script_path" -i "${temp_data}" > "${temp_out}"; then
+		echo "File mode test failed."
+		err=1
+	elif ! grep -E -q "^[a-zA-Z0-9_]+ +[0-9]+$" "${temp_out}"; then
+		echo "File mode output validation failed."
+		err=1
+	else
+		echo "File mode test passed."
+	fi
+
+	# Test with a comm argument
+	if ! "$PYTHON" "$script_path" -i "${temp_data}" "sleep" > "${temp_out}"; then
+		echo "Comm filter test failed."
+		err=1
+	elif ! grep -E -q "^[a-zA-Z0-9_]+ +[0-9]+$" "${temp_out}"; then
+		echo "Comm filter output validation failed."
+		err=1
+	else
+		echo "Comm filter test passed."
+	fi
+}
+
+test_file_mode
+
+exit $err
-- 
2.56.0.rc1.310.g51773c2048-goog

