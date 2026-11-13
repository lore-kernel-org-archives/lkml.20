Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794599808;
	b=FOHYZ59Pk9QmcNduww5ySNhspPpEG0H2Om5+W07KfHzl6JNBhh9eh8nz+y7NnewYXux2
	 7d6FsxoQCj2CoaeJg93gH+cxjddQ13UdGe2OoBa8nJqs53sBR5+Dmm2OkSeLcHDxftnbg
	 M6LYKpTw7Zq3GEjsbNBZYquuMOeqTFyZC3pWdr8ZrPXXqG3rmDECSCrP2uDxnWSlNErLb
	 i7JxDtmHVV6jvu17MWDf/6a8Y2kADX3GGk1gTTZqSb/W70XBZ1/sJdquofMGr8aVg2dvn
	 KcIyVTeqnZy1G9v+yrZOT4lETCyegJ3uUufY2f+5/ueFprrKSoagzqtxBT4XaY7xRLw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794599808;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=KVb2UqrKtgpnvzd41IF23DUjLBE8x7ssVCH5HnVRYnc=;
	b=pSZp01kxlLhhi3ZsjIVEsdF5f0q5Q+6/NpTMIMv3JkeZOcYMFGQdTewsfwarw2IeK7Sr
	 iI19wkPvWojkDygneOERfU9IWcdx/ZdS9u915FQmiwOdpEZSf/1Odugba44c61h96aA26
	 RSPfqYnu9wgiZYdLELzPXsjEQ7T5NYcQl9dkxjSaEEhVSBHuRFwZH4GyPVXsErSuETKmq
	 d+6P1jHBBZuefEiJxpNLUOBOB2RnOfsgz8FSWd5G8BVsSj9dKoUfCJ1v82qkIR6TGf9SH
	 ibkaJEkXLSwn5tZ/OjrAOqj/RgHlj/gZYM6+khifBvugGaokq4PvPUa2v1sQ2XFgYsA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=cmMC3xNr;
	arc=none smtp.remote-ip=74.125.82.70
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1931607046A
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 19:56:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A1931607046A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=cmMC3xNr
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-1b25d977b91so1130001c88.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 11:56:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794599807; x=1795204607; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KVb2UqrKtgpnvzd41IF23DUjLBE8x7ssVCH5HnVRYnc=;
        b=cmMC3xNrdFdc6HgboRai6xpu1xi7P8biM2G81F5MjiMsP0loQGud9bZA24OpP1or+S
         SnH+YCgT8R+AY1TNrmClvLERUcMquLYTKQmJRIhiaRj7N9Lfw9Do2HjNGGNkLSd2DAsw
         EjPiV+rNNXZe0Z8GBBmmZ95rbaH+CcicvE4OR+sz+T4V5TsRfOWcmgAXkbLisJqRouHn
         3AF3D7i7ipgw+PLvF1psvGY4DJl9SZyA+OZAV0ILDXwWADhVpvOD7dq2QGrHKOkH6qm8
         g84Cwa5eazxaqUAMEnwWOq+EAyldTvF7gN9z9NGnmBEtudHvHH93lcM0mhIl+d4vudrD
         dD6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794599807; x=1795204607;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KVb2UqrKtgpnvzd41IF23DUjLBE8x7ssVCH5HnVRYnc=;
        b=RLiLIvINLCX/j9KfMiu6TB5tcobQZuJqIOJa+kLQQP8Z3ffdCcytfi0wKfGizLS2Cs
         IiB65lfnYouGs5Etsfq/+zkpwMnYv2Xw04vvsQHhOvtixVfiz0Q3EwDV7N0JDet8/koa
         goEgxD3hjzy37ER+fZJ8Tvap5b/a8FgC217lcATb/if6OIK0MGdZuTOcuzOU61Uf6XKq
         RTj281mSsSduxNTZU1NETPQW1rTt8cYMD1f5f4iP2DWhXtH1vradQlX3vo5PkjrJBCyB
         Th0nICVMW0pnPz3SKq6qNFdd/56qsgrtEzJQE8Y/F8qHOLEu/kLI7gZqEPS0SVD3PFfK
         NQiQ==
X-Forwarded-Encrypted: i=1; AL+hErHknX7s4guuZUerfo9H4esFVwaqLalHk8iyw17VEVzUCXo593lWjgwaEJhyTE/ZTLvXZDZgtBpWtVDRW2s=@vger.kernel.org
X-Gm-Message-State: APuU4Z+o1O4Zr6Etzo6Er0/JMA4nW9WT8fhim+nBfXBwbpO6N0NNFZPh
	vQy+1uDrAzfg0yO21vLnFvBNbllZcfreU+ZQTU+n8y9Qwz/PpLceBHNL4XGmv3KRas9Wr7FfFGy
	dvZIQbCz+xA==
X-Received: from dlea10-n1.prod.google.com ([2002:a05:701b:420a:10b0:1b2:4b00:1331])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:701b:4293:20b0:187:efba:9ba2
 with SMTP id a92af1059eb24-1b5031562cemr3451824c88.44.1794599806424; Fri, 13
 Nov 2026 11:56:46 -0800 (PST)
Date: Fri, 13 Nov 2026 11:56:01 -0800
In-Reply-To: <20261113195601.2872738-1-irogers@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261113195601.2872738-1-irogers@google.com>
X-Mailer: git-send-email 2.56.1.703.gf848ed807c-goog
Message-ID: <20261113195601.2872738-17-irogers@google.com>
Subject: [PATCH v2 16/16] perf test: Add perf sysinfo shell test
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	James Clark <james.clark@linaro.org>
Cc: linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Add a shell test exercising default 'perf sysinfo' summary output,
'--pmus' per-PMU output, '-j' JSON validation, PMU glob filtering, and
'-i perf.data' inspection.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/tests/shell/sysinfo.sh | 88 +++++++++++++++++++++++++++++++
 1 file changed, 88 insertions(+)
 create mode 100755 tools/perf/tests/shell/sysinfo.sh

diff --git a/tools/perf/tests/shell/sysinfo.sh b/tools/perf/tests/shell/sysinfo.sh
new file mode 100755
index 000000000000..743c8254b24f
--- /dev/null
+++ b/tools/perf/tests/shell/sysinfo.sh
@@ -0,0 +1,88 @@
+#!/bin/bash
+# SPDX-License-Identifier: GPL-2.0
+# perf sysinfo tests
+
+set -e
+
+shelldir=$(dirname "$0")
+. "${shelldir}"/lib/setup_python.sh
+
+sysinfo_output=""
+perf_data=""
+
+cleanup() {
+  rm -f "${sysinfo_output}" "${perf_data}" ${perf_data:+"${perf_data}.old"}
+  trap - EXIT TERM INT
+}
+
+trap_cleanup() {
+  cleanup
+  exit 1
+}
+trap trap_cleanup EXIT TERM INT
+
+sysinfo_output=$(mktemp /tmp/__perf_test.sysinfo_output.XXXXX)
+perf_data=$(mktemp /tmp/__perf_test.sysinfo.perf.data.XXXXX)
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
+  if grep -q "Modes:.*sampling" "${sysinfo_output}"; then
+    grep -q "Sample types:.*ip" "${sysinfo_output}"
+    # Register names are only known on some architectures.
+    case "$(uname -m)" in
+    x86_64|aarch64)
+      if grep -q "Sample types:.*regs_user" "${sysinfo_output}"; then
+        grep -q "User registers:" "${sysinfo_output}"
+      fi
+      if grep -q "Sample types:.*regs_intr" "${sysinfo_output}"; then
+        grep -q "Intr registers:" "${sysinfo_output}"
+      fi
+      ;;
+    esac
+    grep -q "Features:.*leader_sampling" "${sysinfo_output}"
+    grep -q "Features:.*sw_grouping" "${sysinfo_output}"
+  fi
+  echo "Filtered perf sysinfo output test [Success]"
+}
+
+test_sysinfo_perf_data() {
+  echo "perf.data perf sysinfo test"
+  if ! perf record -e software/cpu-clock/u -o "${perf_data}" -- true 2>/dev/null; then
+    echo "perf.data perf sysinfo test [Skipped: perf record failed]"
+    return
+  fi
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
2.56.1.703.gf848ed807c-goog

