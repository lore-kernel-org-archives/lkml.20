Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1622D3D9699
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 18:15:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790187324; cv=none; b=TQMcvNFfABSu4Dr8MmYtD8wS0s5wnIRXbroB/IXTlOLc98bTbMORM32cCF0OddOBfv25Z4PYwGrMvwhBO8XZpPSoYsA4EmmXVzwk+Q9yXPz7OsOUNqg0svk0PBp5/RiSMmjI2dl1oHiy4F9WeUuR6nY2GYZDxUvADkWSyh9buo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790187324; c=relaxed/simple;
	bh=PTyuVU39I+840foBXiDO2G2SScsFTZaBrIjDz55R7pk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=jvUNwrHnFBBHuFqGDwJxjGnqVWOQ5Jslm5j7h7nqiFCuupHko02utYJjqVNH4WcCIHSoNryA5oC5DjsX+ThGfDkAxBXDgB+bJvXVRupud5Y6Naq0GqZJ6+Z6jzvFHpin/PfWJ/sEZ1Ekvc67JI5DinMMYolOQnrRdpQ8aliTbY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=OxqQ20cp; arc=none smtp.client-ip=74.125.82.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="OxqQ20cp"
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-33310847fcaso2107937eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 11:15:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790187317; x=1790792117; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WQXgOMdtm2cE30Q2NpZmEdXsLuoUvGR+n7owpW08rYI=;
        b=OxqQ20cpEValExNAPocoYq4nov5yHd4pwV6ToM83AsZx/hiXImnF3aLf9XkUilRoOc
         z4Rsc1m43pQJjgR+1VDcJUOHmTzIKccKR+sMc3fPiwL2vYpa872+3kYGJ8U5/ETiAAFp
         fbCVLvC89cgaw92/m605B9hNOz5nMgRq8WLc4+nJwseeCBhf7QwYwquhXSrfvn0OMZ7I
         HHJ7wJ+pOg4XpLhh4s2HVt9PmJWhXAAX7UDRTBR0hLPhoR4DZCl64v/nNH56xN+fHh27
         RYgf+nNqzpqrgyXGLkARktumfGbVZYO4cYMKeYGSVgo/Q71HSZTC4kYeEC3oMe9tBL6A
         N1yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790187317; x=1790792117;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WQXgOMdtm2cE30Q2NpZmEdXsLuoUvGR+n7owpW08rYI=;
        b=OCyZBTrrAwcKFTr6nBfdn0npc10w0tfNssGpnGjuxh1DrUDJcMqfepHfk2+u03HvHC
         HAzefI0mauV3BXAt9mZj13seDDJhTWIRHO43S+aru8IAmPxIqeR0qc6pKlFudRyn5bHB
         UdBpLQMhZROXTV1j5447D1kT6a2ryQaHooLo6G67pBKKjy3V7b3IDeyJcHNKBDaUWypO
         nKCFFlLVE03zrXTddhHoQBi2/T/hqPKcJuiRvtd2cEt0vksmwTp7uqBfcsMr4n8z0OpI
         5iHKTKIlvfYVT4le63aBXmUekh3j/9fsD031S2yrxLbLlzGQoLtK6v/fRQdWhRPMIPD9
         E8hQ==
X-Forwarded-Encrypted: i=1; AKwUvBxQxyBQKNXYR7joM97F9vAwG6iM5bPIa2EYUN6lpuWTsR+AxEd/re9n9bhfqEE9XOLKRs2S45Y91XkjnBM=@vger.kernel.org
X-Gm-Message-State: AFuF++kjvMSHLzJdKrekg4JK4r5L1Qq764ge8s3M0z0O0+AW8JprEX9P
	WNM8PjrOhbm6Jh/ntEiN2oOJwRoGIahW/LeLFhN+35DRDtNio3DPaLAFRbGRyapynXhWbx0BEGr
	ckbM9ZsCdcA==
X-Received: from dyjm35.prod.google.com ([2002:a05:7300:16a3:b0:33e:c93c:a524])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:693c:2403:b0:33c:1f44:81c1
 with SMTP id 5a478bee46e88-33ee3619fedmr2154853eec.37.1790187316326; Wed, 23
 Sep 2026 11:15:16 -0700 (PDT)
Date: Wed, 23 Sep 2026 11:12:04 -0700
In-Reply-To: <20260923181213.3032038-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <cover.1789966896.git.irogers@google.com> <20260923181213.3032038-1-irogers@google.com>
X-Mailer: git-send-email 2.56.0.rc1.310.g51773c2048-goog
Message-ID: <20260923181213.3032038-42-irogers@google.com>
Subject: [PATCH v3 41/49] perf test: Migrate Intel PT virtual LBR test to
 Python API
From: Ian Rogers <irogers@google.com>
To: irogers@google.com, acme@kernel.org, alice.mei.rogers@gmail.com, 
	namhyung@kernel.org
Cc: adrian.hunter@intel.com, dapeng1.mi@linux.intel.com, 
	james.clark@linaro.org, leo.yan@linux.dev, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, mingo@redhat.com, peterz@infradead.org, 
	tmricht@linux.ibm.com
Content-Type: text/plain; charset="UTF-8"

Migrate the Intel PT virtual LBR test from generating an inline legacy
perf script callback to using a standalone Python script
(perf_brstack_max.py) with the brstack iterator API in the perf Python
module.

Assisted-by: Antigravity:gemini-3.1-pro
Signed-off-by: Ian Rogers <irogers@google.com>
---
 .../perf/tests/shell/lib/perf_brstack_max.py  | 40 +++++++++++++++++
 tools/perf/tests/shell/test_intel_pt.sh       | 43 ++++++++-----------
 2 files changed, 58 insertions(+), 25 deletions(-)
 create mode 100644 tools/perf/tests/shell/lib/perf_brstack_max.py

diff --git a/tools/perf/tests/shell/lib/perf_brstack_max.py b/tools/perf/tests/shell/lib/perf_brstack_max.py
new file mode 100644
index 000000000000..cc065f07cfed
--- /dev/null
+++ b/tools/perf/tests/shell/lib/perf_brstack_max.py
@@ -0,0 +1,40 @@
+#!/usr/bin/python
+# SPDX-License-Identifier: GPL-2.0
+# Determine the maximum size of branch stacks in a perf.data file.
+
+import argparse
+import sys
+
+import perf
+
+def main():
+    ap = argparse.ArgumentParser()
+    ap.add_argument("-i", "--input", default="perf.data", help="Input file name")
+    args = ap.parse_args()
+
+    bmax = 0
+
+    def process_event(sample):
+        nonlocal bmax
+        try:
+            brstack = sample.brstack
+            if brstack:
+                n = len(list(brstack))
+                if n > bmax:
+                    bmax = n
+        except AttributeError:
+            pass
+
+    session = None
+    try:
+        session = perf.session(perf.data(args.input), sample=process_event)
+        session.process_events()
+        print("max brstack", bmax)
+    except Exception as e:
+        print(f"Error processing events: {e}", file=sys.stderr)
+        sys.exit(1)
+    finally:
+        session = None
+
+if __name__ == "__main__":
+    main()
diff --git a/tools/perf/tests/shell/test_intel_pt.sh b/tools/perf/tests/shell/test_intel_pt.sh
index 26243ff760ec..6dcacbfa2569 100755
--- a/tools/perf/tests/shell/test_intel_pt.sh
+++ b/tools/perf/tests/shell/test_intel_pt.sh
@@ -1,6 +1,6 @@
 #!/bin/bash
-# Miscellaneous Intel PT testing (exclusive)
 # SPDX-License-Identifier: GPL-2.0
+# Miscellaneous Intel PT testing (exclusive)
 
 set -e
 
@@ -22,7 +22,6 @@ perfdatafile="${temp_dir}/test-perf.data"
 outfile="${temp_dir}/test-out.txt"
 errfile="${temp_dir}/test-err.txt"
 awkscript="${temp_dir}/awkscript"
-maxbrstack="${temp_dir}/maxbrstack.py"
 
 cleanup()
 {
@@ -376,34 +375,28 @@ test_kernel_trace()
 test_virtual_lbr()
 {
 	echo "--- Test virtual LBR ---"
-	# Check if python script is supported
-	libpython=$(perf version --build-options | grep python | grep -cv OFF)
-	if [ "${libpython}" != "1" ] ; then
-		echo "SKIP: python scripting is not supported"
+	# Run setup_python.sh in a subshell first so its 'exit 2' when Python is
+	# not detected skips only this subtest rather than exiting test_intel_pt.sh
+	# (which would trigger trap_cleanup and fail the suite).
+	# shellcheck source=lib/setup_python.sh
+	if ! ( . "${shelldir}"/lib/setup_python.sh ) ; then
 		return 2
 	fi
+	# shellcheck source=lib/setup_python.sh
+	. "${shelldir}"/lib/setup_python.sh
 
-	# Python script to determine the maximum size of branch stacks
-	cat << "_end_of_file_" > "${maxbrstack}"
-from __future__ import print_function
-
-bmax = 0
-
-def process_event(param_dict):
-	if "brstack" in param_dict:
-		brstack = param_dict["brstack"]
-		n = len(brstack)
-		global bmax
-		if n > bmax:
-			bmax = n
-
-def trace_end():
-	print("max brstack", bmax)
-_end_of_file_
+	if ! "$PYTHON" -c 'import perf' > /dev/null 2>&1; then
+		echo "SKIP: Python perf module not found"
+		return 2
+	fi
 
 	# Check if virtual lbr is working
-	perf_record_no_bpf -o "${perfdatafile}" --aux-sample -e '{intel_pt//,cycles}:u' uname
-	times_val=$(perf script -i "${perfdatafile}" --itrace=L -s "${maxbrstack}" 2>/dev/null | grep "max brstack " | cut -d " " -f 3)
+	perf_record_no_bpf -o "${tmpfile}" --aux-sample \
+		-e '{intel_pt//,cycles}:u' perf test -w brstack || return 1
+	perf inject --itrace=L -i "${tmpfile}" -o "${perfdatafile}" || return 1
+	output=$("$PYTHON" "${shelldir}/lib/perf_brstack_max.py" -i "${perfdatafile}") || return 1
+	echo "Debug: perf_brstack_max.py output: $output"
+	times_val=$(echo "$output" | grep "max brstack " | cut -d " " -f 3)
 	case "${times_val}" in
 		[0-9]*)	;;
 		*)	times_val=0;;
-- 
2.56.0.rc1.310.g51773c2048-goog

