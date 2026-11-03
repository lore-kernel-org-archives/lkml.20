Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793749617;
	b=aIpN+YcbkZJxe9J3PvDCxC6m3hK66zpGZ/JIX87VBdT3nVUbr35yTCV2qpt53svWrZSg
	 vshDQ98eL4aO1qqfRnUT5Qx8s6I5zRwkaPJKqLSJlvdQP/yuCe+lAZoz7pLFjw0YXC40k
	 Y2K8Te661CyJ328wOxY3sxWrSYQRi7BcDSXWa6NMxJkfrRwqKG0hX6jCZSeSRSIlaHr1R
	 QxOqlMPU/TYsg1kicmmpoUXrqzY0SCaPJfh0Z477t3LxViPyS0Pc0GMkwHUzHus0gZATf
	 +XHZtpu6VnYOuYaUNRsCnI5JFXilXg/5O3v6HWIEGpPJR/P6BLd/JPX7dcU0Oj56ulw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793749617;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Received:Date:In-Reply-To:Mime-Version:
	 References:X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=iUbENOe0+ZyGJ7lO4/Mfds7NTa8dcwMT09NdCLq1Cs8=;
	b=S5Cw2tYE3Nh0+9/IOoxAYG6mW2Os4ydD7d3CRb5dLt9IB4eph243kAUsIBYaxPvA3MyC
	 8Lxt3A/iA4Hbm8Ta/S61tffiN/dt0pNcr7Ch1YKVLHpZ/JvUXX2XE0gYaxnYV/Xr1frxT
	 i2kQEVP8k99grrDDqxUrUdnlz+2JP1j6YvInYhfoQK0Y99uahw0cwDBMc/1ddC+RxPMKQ
	 CXi7Mff5o4B0mPWYug/aY0s8Xd+mQv4erRU48MGoOZ/PfEXEapjEVehO0uK3xSFYMDrx3
	 63jkfBF4iXlMkQR7gOOUgkXOvItn0Wl1r4+yGp4lndQ9zCFVVmqjDqUPnpJRyoJOEgw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=mXo3IAJW;
	arc=none smtp.remote-ip=74.125.82.69
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFF0A606A339
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 23:46:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AFF0A606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=mXo3IAJW
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1b20a4b5f2bso241399c88.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 15:46:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793749616; x=1794354416; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iUbENOe0+ZyGJ7lO4/Mfds7NTa8dcwMT09NdCLq1Cs8=;
        b=mXo3IAJWWW63P8MuW/7c50/agUwggJzJPE0jOXIEmgw8bhYwrxVbUv8OQCdo7oc50D
         Uog+xlDUV9T+lZA7Riv6kqWrzPONerBMJ+1C1CSl5xNO7zVnisumjOmYot6H88AQg+1D
         LwkuvWEMr95OHt7Q1Z9fMIpXOjy1+xrtTwCS0z/nMP5zyWZuwZee1/vOs2KwHQUkUkBv
         0mBZVuussytWvFssVxWS3DhvJzaUxi5Y+dSG8ZN2qUWH7dIlBerFIXxec6gtYiJ4WgW2
         Zx855knIaGZX4nlloxviIk1KupfMiToKGuB1hxPEH4gLRR7uM3JDcAX0Mv4FmaclFEhd
         Wuzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793749616; x=1794354416;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iUbENOe0+ZyGJ7lO4/Mfds7NTa8dcwMT09NdCLq1Cs8=;
        b=DImy9IL3LZ+QO5eitDPf++KpYVKJZ2cU8z7BOfWEoyQOxUM6ZfxxoMgDQdFcRDb500
         H3DgzSmIMp1ryjnr5ZL4RE0Nj+7zaj75HkReWwB+H3QSLYsXiHLNvszpozUtsEanSK1z
         Jk/02/cvN0gzNXQURQYgpPhkeMS1+bB6jiCdJ5pE6+tMVlEae9HmEeGmnBJeIJPMWdYm
         UyN6gCibiqOBwaqONWDw53ConYkR8h7xqU69HvUTwyN1DQ+7Mbgg/BEGsRSJypexL32F
         Sf+Ktf7RS8n0IwLX6Pz3RxrKUcxd1Uy+KCKP8DCD+oiWwR4G/PbRPrLe1f+4FdAaIRBL
         0YEg==
X-Gm-Message-State: APuU4Z/szvn410WnH9pPbob/CggrtHwjzAkqT2QhdiMmVWXId91ac9bS
	hrDXK9eZWQrQWJRK5Rtppf5ZYX0WiKiesZ8sqNq8IKt8nqu6hdjePd8MA1PEe8mGIEiW1buvvbh
	IEzklpuNOlg==
X-Received: from dlbur23.prod.google.com ([2002:a05:7022:ea57:b0:185:5973:326c])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:b059:10b0:16a:8ffd:4977
 with SMTP id a92af1059eb24-1ac5e322661mr21999448c88.17.1793749615550; Tue, 03
 Nov 2026 15:46:55 -0800 (PST)
Date: Tue,  3 Nov 2026 15:44:57 -0800
In-Reply-To: <20261103234502.1008382-1-irogers@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261103234502.1008382-1-irogers@google.com>
X-Mailer: git-send-email 2.56.0.385.gac671c819a-goog
Message-ID: <20261103234502.1008382-42-irogers@google.com>
Subject: [PATCH v1 41/41] perf test: Add perf sysinfo shell test
From: Ian Rogers <irogers@google.com>
To: linux-perf-users@vger.kernel.org, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>
Cc: linux-kernel@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, James Clark <james.clark@linaro.org>, 
	Kan Liang <kan.liang@linux.intel.com>, Dapeng Mi <dapeng1.mi@linux.intel.com>, 
	Thomas Falcon <thomas.falcon@intel.com>, John Garry <john.garry@linux.dev>, 
	Will Deacon <will@kernel.org>, Leo Yan <leo.yan@arm.com>, 
	Athira Rajeev <atrajeev@linux.ibm.com>, Thomas Richter <tmricht@linux.ibm.com>, 
	Ravi Bangoria <ravi.bangoria@amd.com>, Sandipan Das <sandipan.das@amd.com>, 
	Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"

Add a shell test exercising default 'perf sysinfo' summary output,
'--pmus' per-PMU output, '-j' JSON validation, PMU glob filtering, and
'-i perf.data' inspection.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/tests/shell/sysinfo.sh | 83 +++++++++++++++++++++++++++++++
 1 file changed, 83 insertions(+)
 create mode 100755 tools/perf/tests/shell/sysinfo.sh

diff --git a/tools/perf/tests/shell/sysinfo.sh b/tools/perf/tests/shell/sysinfo.sh
new file mode 100755
index 000000000000..59091b4d750d
--- /dev/null
+++ b/tools/perf/tests/shell/sysinfo.sh
@@ -0,0 +1,83 @@
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
+    if grep -q "Sample types:.*regs_user" "${sysinfo_output}"; then
+      grep -q "User registers:" "${sysinfo_output}"
+    fi
+    if grep -q "Sample types:.*regs_intr" "${sysinfo_output}"; then
+      grep -q "Intr registers:" "${sysinfo_output}"
+    fi
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
2.56.0.385.gac671c819a-goog

