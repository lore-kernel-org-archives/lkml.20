Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DCDC487CE5
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 18:55:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792263312; cv=none; b=PpHicd5Uzd41adHcTdFQKkf4ZnFsivsJLeR+HqR/sb817P79J38mpQhKoE16mY/k2NoeIgHlPlYCDo+w19MlAcbNTKOlS7g28oZ8d2PV18iy5g+W5kUur5XMwCgIBBSKqjs7jjIW5hzUzioBuxEwZEtkTR7eK5YOgkWFbaOLT5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792263312; c=relaxed/simple;
	bh=n3sTF53H1CSPwKHgLSFsX2BlfmHohIne1H8m5jDaijs=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=qDO2FcLn7558eeNybBycjyNjouCWCnGzhvQ85d+b5ZdZPNjW2nruRObkO10dy8yKzryy4sTAwh0TMMZ7OPHwxDFxuZWblulmFWlIyEmTOoU8Hqou7J9a3stRdxkhQjMSgJv0Klq/TGAygVrfiVu/T16egUfiQgzThnFyubCo0TU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=qrMIRGoY; arc=none smtp.client-ip=74.125.82.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="qrMIRGoY"
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-3425098ae4bso2919921eec.0
        for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 11:55:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792263311; x=1792868111; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w/rkRGK5m8VUOKvguNtsfIf4D4KPxwCrTQteuz2/qWE=;
        b=qrMIRGoYCqQTr14ejXx4czMNmZOCk8RJSdvrQg53rOGzRPvGakZjhPvyjDv7MKll+N
         pX54lsk6x5h7abMOKvUs8PKaZhlWMkHSuddJttAnO3hU5+I2jj4BkgNHK9FLDXfLNdJ4
         JTRyTnVWVdFoPN/EWu0QNQwBYCgDz5GP6MelCtAQZGwHelD/VAyGR6xeUSVDjKgHyOiI
         pz876R3EC02m3S5nX2IlSYTNdQonaeRUlMmxZqVrFbMTtv+Z0Bh/f5/KdEeG2ydSdB54
         QeMlCTQiLkWVoLfDfhvbbUBM1truzOOXAlPZPd5Gj1l8wpRGoiNNPh3nCwDvRUe4C4/l
         SHeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792263311; x=1792868111;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=w/rkRGK5m8VUOKvguNtsfIf4D4KPxwCrTQteuz2/qWE=;
        b=SKK8+kuVemnXvl5Rofb8moge+f1wf7rUKapqgz8M61CTLzKK88rqf+UcRkjJWIB/ZI
         Qw0htDXZZOvsuOcGniUDQfbr1aIvi7Wlic2SJPqGKrE5AQfPp13qsMJpqRnBKYnRL4/M
         9XZkR+wIyeclxI0gE/kSc3uwn8zYIkJNE37WttJskp66JhDnUj1qGo32Vz/31ZsjlpSn
         C7l8F1ShYOcPy4og7dE0nnt6ycZ6gMBjRMvQ+qJaaZErvti6dFEDuIdt2SFCu9bJ1Rwe
         GXHHwf1IluDxPqEj7RTejXu2yDyk36dYAwNxlLwCNul65YHub00dXLCDE6guqBPr4PlH
         OyMQ==
X-Forwarded-Encrypted: i=1; AKwUvBxt35lMJisAeqjL7Z8dzlUBiLL9PO5N4UiQlsvP4Th8qIeDwkJRIkWylTQa9861piXQM3QGyUas1UU0ur0=@vger.kernel.org
X-Gm-Message-State: AFq9FYIzBQXxZk0DH3Y+q5ERR0IkSwZ30ahjBe69s15pVTnAGldvmOsl
	aI0z/ta6Q/7ZO4CLziKlkb/H8H+jvFpZZIdsgRhKia2g1roLbc7iicmOtlVD422lpPdmEHLJa/b
	74RvZ9iZfUg==
X-Received: from dlbrs10.prod.google.com ([2002:a05:7022:f68a:b0:185:c12:c9bc])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:701b:2917:b0:158:b944:b15
 with SMTP id a92af1059eb24-185120a75a8mr3731956c88.22.1792263310060; Sat, 17
 Oct 2026 11:55:10 -0700 (PDT)
Date: Sat, 17 Oct 2026 11:54:42 -0700
In-Reply-To: <20261017185442.2137623-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20261016213258.945737-1-irogers@google.com> <20261017185442.2137623-1-irogers@google.com>
X-Mailer: git-send-email 2.56.0.212.g129ede20d9-goog
Message-ID: <20261017185442.2137623-10-irogers@google.com>
Subject: [RFC PATCH v2 9/9] perf test: Add perf sysinfo shell test
From: Ian Rogers <irogers@google.com>
To: irogers@google.com, acme@kernel.org, namhyung@kernel.org
Cc: adrian.hunter@intel.com, eranian@google.com, james.clark@linaro.org, 
	jolsa@kernel.org, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, mingo@redhat.com, peterz@infradead.org
Content-Type: text/plain; charset="UTF-8"

Add a shell test exercising default 'perf sysinfo' summary output,
'--pmus' per-PMU output, '-j' JSON validation, PMU glob filtering, and
'-i perf.data' inspection.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/tests/shell/sysinfo.sh | 71 +++++++++++++++++++++++++++++++
 1 file changed, 71 insertions(+)
 create mode 100755 tools/perf/tests/shell/sysinfo.sh

diff --git a/tools/perf/tests/shell/sysinfo.sh b/tools/perf/tests/shell/sysinfo.sh
new file mode 100755
index 000000000000..40e90af6dca2
--- /dev/null
+++ b/tools/perf/tests/shell/sysinfo.sh
@@ -0,0 +1,71 @@
+#!/bin/bash
+# SPDX-License-Identifier: GPL-2.0
+# perf sysinfo tests
+
+set -e
+
+shelldir=$(dirname "$0")
+. "${shelldir}"/lib/setup_python.sh
+
+sysinfo_output=$(mktemp /tmp/__perf_test.sysinfo_output.XXXXX)
+perf_data=$(mktemp /tmp/__perf_test.sysinfo.perf.data.XXXXX)
+
+cleanup() {
+  rm -f "${sysinfo_output}" "${perf_data}" "${perf_data}.old"
+  trap - EXIT TERM INT
+}
+
+trap_cleanup() {
+  cleanup
+  exit 1
+}
+trap trap_cleanup EXIT TERM INT
+
+test_sysinfo_default() {
+  echo "Default perf sysinfo output test"
+  perf sysinfo -o "${sysinfo_output}"
+  grep -q "^Summary:" "${sysinfo_output}"
+  grep -q "System rating:" "${sysinfo_output}"
+  perf sysinfo --pmus -o "${sysinfo_output}"
+  grep -q "^software (" "${sysinfo_output}"
+  grep -q "^Summary:" "${sysinfo_output}"
+  echo "Default perf sysinfo output test [Success]"
+}
+
+test_sysinfo_json() {
+  echo "Json perf sysinfo output test"
+  perf sysinfo -j -o "${sysinfo_output}"
+  $PYTHON -m json.tool "${sysinfo_output}" /dev/null
+  echo "Json perf sysinfo output test [Success]"
+}
+
+test_sysinfo_filter() {
+  echo "Filtered perf sysinfo output test"
+  perf sysinfo -o "${sysinfo_output}" software
+  grep -q "^software (" "${sysinfo_output}"
+  grep -q "Sample types:.*ip" "${sysinfo_output}"
+  grep -q "User registers:" "${sysinfo_output}"
+  grep -q "Intr registers:" "${sysinfo_output}"
+  grep -q "Features:.*leader_sampling" "${sysinfo_output}"
+  grep -q "Features:.*sw_grouping" "${sysinfo_output}"
+  echo "Filtered perf sysinfo output test [Success]"
+}
+
+test_sysinfo_perf_data() {
+  echo "perf.data perf sysinfo test"
+  perf record -e software/cpu-clock/u -o "${perf_data}" -- true 2>/dev/null
+  perf sysinfo -i "${perf_data}" -o "${sysinfo_output}"
+  grep -q "^Summary:" "${sysinfo_output}"
+  perf sysinfo --pmus -i "${perf_data}" -o "${sysinfo_output}"
+  grep -q "software" "${sysinfo_output}"
+  perf sysinfo -i "${perf_data}" -j -o "${sysinfo_output}"
+  $PYTHON -m json.tool "${sysinfo_output}" /dev/null
+  echo "perf.data perf sysinfo test [Success]"
+}
+
+test_sysinfo_default
+test_sysinfo_json
+test_sysinfo_filter
+test_sysinfo_perf_data
+cleanup
+exit 0
-- 
2.56.0.212.g129ede20d9-goog

