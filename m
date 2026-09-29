Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FE1E3932F0
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 02:19:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790648381; cv=none; b=XwWLBSQdmjP9cP+Y1EO6fs451G+HfLFJQu49G9i4WFZAQZnLlcyTdvOA5lTdJ/+rfYnGCIYh3sTE0TfOugDdoDgWIBXFqitN8nQJGZtoL336FSFyN2fwrjCXcEF+CSWDWK9/692PAA28abu4EKkt3VmC+f2dfX0sWuxvr23CqAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790648381; c=relaxed/simple;
	bh=HM7ic7PGenayO74KX5wwd+deFrOxwbJv6wWm51CDm0c=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=cvV//1ShsQzlZw9qK7YEKvH008p36SaIKlwsObI6Vwe5dDQydlm0CyuOS7xCLLACC3pf3N0qvC2w1TvrKiO4M/HCUePWRqjM2LSEIQ/zZ+AjyOCHEBdA/yV4A2xG17B0nT6a9d4hkC50JMYqX88EPoYIARg8nHLsXWqb4KHLLaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=BNm/e6DU; arc=none smtp.client-ip=74.125.82.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="BNm/e6DU"
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-1416f32fe11so1426273c88.0
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 19:19:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790648378; x=1791253178; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9IGzOIODGES3gOAt25C9qV3mqPw8mWSQSxSfj3N8hBo=;
        b=BNm/e6DUMnyx3pwmaKMwPGdQu0ZU9A/ml8P2IxmAdePmbwIhDV9EKylmpawfp2uTco
         YXmYx4IoJ753/clL0mLsJqirxfITBSuaNlt0tQvs/cvwKsCxWGHoZkUxm5Pfr3S00+om
         8hWZjWinV36HBSMtz0v7uSLRdwQZNUP9YyHwJdlKdu2jQRGG4sKJ/EYyEXZsAgQUcJWx
         2/Tx9M0lQqvHDvCM7VqUGZDg7myUovxfPvQzM51v5Fd6P0t5MudfWIveFIfsJspMWuRb
         nouDSzxWhEfBzdZ9cWoIqd8sxxkozmpZgxx9Mr6UgcfjfL7hBjOOikBIyzHglqW2A8NT
         TuZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790648378; x=1791253178;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9IGzOIODGES3gOAt25C9qV3mqPw8mWSQSxSfj3N8hBo=;
        b=eqjM2bmHjYVI3cxJPGHijYmbmEZVn4C/1bylJeDPrKYRc0wJIxTtAEfODswmDIjanw
         i7JoxgfJwAwP0VRwZtZyUXXF+ea6CBZUryW0iUky1497HM9/PPK+9+ORYR+1uDkF5UQS
         aqI6hH+EQa6tNN7tOSI9q1otAEvxxfuv/fKq2vkJjjq/ufwJBRl12iK1n3svPe7iBR+T
         sgQrlty6fGlYxywhLnMRkgD0vvJI1ACThXn+c0Ygy2pNvZG7hawOQB9ZF2Z8rngFqCM8
         Cm750Ni9PElxV/cHMjLS6yoabqT3LqGOddSZUeQfa0Tmb04wGX9O2gNvkuyVzPTrVOVw
         pRvg==
X-Forwarded-Encrypted: i=1; AKwUvBykrmtPkTcQzBJLEdy/IvJhl4DbpW1DYysqidC/PLFzJPLIiBnXIwfEOks2t+0lAC3zZ98NX7FCd6hIyPM=@vger.kernel.org
X-Gm-Message-State: AFuF++kYWoXPmxRz433NVWGnjp3TmTHOGEkrFyb0UbQo//owqAldWQtl
	lAFx8NivDyJ3gZ7/GHwm4G4b0hAjvAWfG9UP5PVyKkiRnRAgdU4UB0DLxawabCP4zV++cz0qJid
	zDXcvk7esvQ==
X-Received: from dlbep12.prod.google.com ([2002:a05:7022:108c:b0:149:37d9:7f80])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:701b:240b:b0:14a:a6dc:9cfd
 with SMTP id a92af1059eb24-14aa6dca0d5mr2764362c88.10.1790648377194; Mon, 28
 Sep 2026 19:19:37 -0700 (PDT)
Date: Mon, 28 Sep 2026 19:19:08 -0700
In-Reply-To: <20260929021913.56010-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260929021913.56010-1-irogers@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20260929021913.56010-5-irogers@google.com>
Subject: [PATCH v1 4/9] perf test: Deflake Intel PT Python shell tests under load
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>
Cc: Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
	Adrian Hunter <adrian.hunter@intel.com>, James Clark <james.clark@linaro.org>, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

In test_intel_pt_events_python.sh, test_export_to_sqlite_python.sh, and
test_export_to_postgresql_python.sh, 'sh -c "uname; true"' uses the
shell builtin 'true' and exits within microseconds of 'uname', sending
SIGCHLD to 'perf record' before the Intel PT AUX buffer is always
flushed under heavy parallel load (~5-10% drop rate).

Sleep 0.05s in the subshell after 'uname' ('sh -c "uname; sleep 0.05"')
so 'uname' completely exits and flushes its AUX trace before 'sh' exits,
and wrap the record and verification step in a bounded retry loop (up to
5 attempts). Also pass '-B -N --no-bpf-event' to 'perf record -g' in
test_export_to_sqlite_python.sh and test_export_to_postgresql_python.sh
to avoid build-id cache and BPF synthesis overhead.

Fixes: d4ce72e9e238 ("perf python: Port intel-pt-events and libxed to perf module")
Fixes: 62d350135e67 ("perf python: Port export-to-sqlite to perf module")
Fixes: b1f968c9656a ("perf python: Port export-to-postgresql to perf module")
Assisted-by: Antigravity:gemini-3.1-pro
Signed-off-by: Ian Rogers <irogers@google.com>
---
 .../shell/test_export_to_postgresql_python.sh | 49 ++++++++++--------
 .../shell/test_export_to_sqlite_python.sh     | 50 +++++++++++--------
 .../shell/test_intel_pt_events_python.sh      | 43 +++++++++-------
 3 files changed, 79 insertions(+), 63 deletions(-)

diff --git a/tools/perf/tests/shell/test_export_to_postgresql_python.sh b/tools/perf/tests/shell/test_export_to_postgresql_python.sh
index 350813466700..835f48f002e9 100755
--- a/tools/perf/tests/shell/test_export_to_postgresql_python.sh
+++ b/tools/perf/tests/shell/test_export_to_postgresql_python.sh
@@ -61,9 +61,10 @@ test_file_mode() {
 	fi
 
 	# Generate events with callchains and context switches
-	if ! perf record -g --switch-events -o "${temp_data}" \
+	if ! perf record -B -N --no-bpf-event -g --switch-events -o "${temp_data}" \
 	     -- perf test -w noploop >/dev/null 2>&1 && \
-	   ! perf record -g -o "${temp_data}" -- perf test -w noploop >/dev/null 2>&1; then
+	   ! perf record -B -N --no-bpf-event -g -o "${temp_data}" \
+	     -- perf test -w noploop >/dev/null 2>&1; then
 		echo "Skipping test, perf record failed"
 		exit 2
 	fi
@@ -92,29 +93,33 @@ test_file_mode() {
 test_intel_pt() {
 	echo "Testing export-to-postgresql.py with intel_pt..."
 
-	psql -c "DROP DATABASE IF EXISTS ${temp_db}" postgres >/dev/null 2>&1 || true
-	rm -f "${temp_data}"
-	# Generate some intel_pt events; use a subshell that waits for uname
-	if ! perf record -B -N --no-bpf-event -e intel_pt//u -o "${temp_data}" \
-		-- sh -c "uname; true" >/dev/null 2>&1; then
-		echo "Skipping intel_pt test, intel_pt not available."
-		return 0
-	fi
+	# Generate some intel_pt events; sleep briefly after uname in the subshell
+	# so uname's AUX buffer is flushed before SIGCHLD stops perf record.
+	passed=0
+	for _ in 1 2 3 4 5; do
+		psql -c "DROP DATABASE IF EXISTS ${temp_db}" postgres >/dev/null 2>&1 || true
+		rm -f "${temp_data}"
+		if ! perf record -B -N --no-bpf-event -e intel_pt//u -o "${temp_data}" \
+			-- sh -c "uname; sleep 0.05" >/dev/null 2>&1; then
+			echo "Skipping intel_pt test, intel_pt not available."
+			return 0
+		fi
 
-	# Run the script with --itrace cr to synthesize call_returns
-	if ! perf script export-to-postgresql -i "${temp_data}" \
-		-o "${temp_db}" --itrace cr >/dev/null; then
-		echo "intel_pt file mode test failed."
-		err=1
-	else
-		# Check DB for calls
-		if ! psql -d "${temp_db}" -t -c 'SELECT COUNT(*) FROM calls WHERE id > 0;' | \
+		# Run the script with --itrace cr to synthesize call_returns
+		if perf script export-to-postgresql -i "${temp_data}" \
+			-o "${temp_db}" --itrace cr >/dev/null && \
+		   psql -d "${temp_db}" -t -c 'SELECT COUNT(*) FROM calls WHERE id > 0;' | \
 			grep -q '[1-9]'; then
-			echo "PostgreSQL intel_pt validation failed (no calls found)."
-			err=1
-		else
-			echo "intel_pt test passed (cr validated)."
+			passed=1
+			break
 		fi
+	done
+
+	if [ "$passed" -eq 0 ]; then
+		echo "PostgreSQL intel_pt validation failed (no calls found)."
+		err=1
+	else
+		echo "intel_pt test passed (cr validated)."
 	fi
 }
 
diff --git a/tools/perf/tests/shell/test_export_to_sqlite_python.sh b/tools/perf/tests/shell/test_export_to_sqlite_python.sh
index d3c5e22a0754..19ca7c539cf7 100755
--- a/tools/perf/tests/shell/test_export_to_sqlite_python.sh
+++ b/tools/perf/tests/shell/test_export_to_sqlite_python.sh
@@ -47,9 +47,10 @@ test_file_mode() {
 	echo "Testing export-to-sqlite.py..."
 
 	# Generate events with callchains and context switches if supported
-	if ! perf record -g --switch-events -o "${temp_data}" \
+	if ! perf record -B -N --no-bpf-event -g --switch-events -o "${temp_data}" \
 	     -- perf test -w noploop >/dev/null 2>&1 && \
-	   ! perf record -g -o "${temp_data}" -- perf test -w noploop >/dev/null 2>&1; then
+	   ! perf record -B -N --no-bpf-event -g -o "${temp_data}" \
+	     -- perf test -w noploop >/dev/null 2>&1; then
 		echo "Skipping test, perf record failed"
 		exit 2
 	fi
@@ -77,29 +78,34 @@ test_file_mode() {
 test_intel_pt() {
 	echo "Testing export-to-sqlite.py with intel_pt..."
 
-	rm -f "${temp_db}" "${temp_data}"
-	# Generate some intel_pt events; use a subshell that waits for uname
-	if ! perf record -B -N --no-bpf-event -e intel_pt//u -o "${temp_data}" \
-		-- sh -c "uname; true" >/dev/null 2>&1; then
-		echo "Skipping intel_pt test, intel_pt not available."
-		return 0
-	fi
+	query="import sqlite3; c = sqlite3.connect('${temp_db}'); "
+	query="${query}r = c.execute('SELECT COUNT(*) FROM calls').fetchone()[0]; "
+	query="${query}exit(1 if r == 0 else 0)"
+
+	# Generate some intel_pt events; sleep briefly after uname in the subshell
+	# so uname's AUX buffer is flushed before SIGCHLD stops perf record.
+	passed=0
+	for _ in 1 2 3 4 5; do
+		rm -f "${temp_db}" "${temp_data}"
+		if ! perf record -B -N --no-bpf-event -e intel_pt//u -o "${temp_data}" \
+			-- sh -c "uname; sleep 0.05" >/dev/null 2>&1; then
+			echo "Skipping intel_pt test, intel_pt not available."
+			return 0
+		fi
 
-	# Run the script with --itrace cr to synthesize call_returns
-	if ! perf script export-to-sqlite -i "${temp_data}" -o "${temp_db}" --itrace cr; then
-		echo "intel_pt file mode test failed."
+		# Run the script with --itrace cr to synthesize call_returns
+		if perf script export-to-sqlite -i "${temp_data}" -o "${temp_db}" --itrace cr && \
+		   "$PYTHON" -c "$query" >/dev/null 2>&1; then
+			passed=1
+			break
+		fi
+	done
+
+	if [ "$passed" -eq 0 ]; then
+		echo "SQLite intel_pt validation failed (no calls found)."
 		err=1
 	else
-		# Check DB for calls
-		query="import sqlite3; c = sqlite3.connect('${temp_db}'); "
-		query="${query}r = c.execute('SELECT COUNT(*) FROM calls').fetchone()[0]; "
-		query="${query}exit(1 if r == 0 else 0)"
-		if ! "$PYTHON" -c "$query" >/dev/null 2>&1; then
-			echo "SQLite intel_pt validation failed (no calls found)."
-			err=1
-		else
-			echo "intel_pt test passed (cr validated)."
-		fi
+		echo "intel_pt test passed (cr validated)."
 	fi
 }
 
diff --git a/tools/perf/tests/shell/test_intel_pt_events_python.sh b/tools/perf/tests/shell/test_intel_pt_events_python.sh
index b5c3173fa2db..9754b9125da1 100755
--- a/tools/perf/tests/shell/test_intel_pt_events_python.sh
+++ b/tools/perf/tests/shell/test_intel_pt_events_python.sh
@@ -30,7 +30,8 @@ cleanup() {
 	[ -n "${temp_dir}" ] && rm -rf "${temp_dir}"
 }
 
-trap 'cleanup' EXIT TERM INT
+trap 'cleanup' EXIT
+trap 'cleanup; exit 1' TERM INT
 
 temp_dir=$(mktemp -d /tmp/perf.ipt.XXXXXX)
 temp_data="${temp_dir}/perf.data"
@@ -39,27 +40,31 @@ temp_out="${temp_dir}/perf.out"
 test_intel_pt() {
 	echo "Testing intel-pt-events.py with intel_pt..."
 
-	rm -f "${temp_data}" "${temp_out}"
-	# Generate some intel_pt events; use a subshell that waits for uname so
-	# uname's AUX buffer is flushed before the parent workload exits.
-	if ! perf record -B -N --no-bpf-event -e intel_pt//u -o "${temp_data}" \
-		-- sh -c "uname; true" >/dev/null 2>&1; then
-		echo "Skipping intel_pt test, intel_pt not available."
-		exit 2
-	fi
+	# Generate some intel_pt events; sleep briefly after uname in the subshell
+	# so uname's AUX buffer is flushed before SIGCHLD stops perf record.
+	passed=0
+	for _ in 1 2 3 4 5; do
+		rm -f "${temp_data}" "${temp_out}"
+		if ! perf record -B -N --no-bpf-event -e intel_pt//u -o "${temp_data}" \
+			-- sh -c "uname; sleep 0.05" >/dev/null 2>&1; then
+			echo "Skipping intel_pt test, intel_pt not available."
+			exit 2
+		fi
 
-	# Run the script and check output
-	if ! perf script intel-pt-events -i "${temp_data}" > "${temp_out}"; then
-		echo "intel-pt-events.py test failed."
+		# Run the script and check output
+		if perf script intel-pt-events -i "${temp_data}" > "${temp_out}" && \
+		   grep -q "Intel PT Branch Trace" "${temp_out}" && \
+		   grep -q "uname" "${temp_out}"; then
+			passed=1
+			break
+		fi
+	done
+
+	if [ "$passed" -eq 0 ]; then
+		echo "Failed to find expected output: $(cat "${temp_out}" 2>/dev/null)"
 		err=1
 	else
-		if ! grep -q "Intel PT Branch Trace" "${temp_out}" || \
-		   ! grep -q "uname" "${temp_out}"; then
-			echo "Failed to find expected output: $(cat "${temp_out}")"
-			err=1
-		else
-			echo "intel-pt-events test passed."
-		fi
+		echo "intel-pt-events test passed."
 	fi
 	rm -f "${temp_out}"
 }
-- 
2.56.0.rc1.315.gc6ed9934b7-goog

