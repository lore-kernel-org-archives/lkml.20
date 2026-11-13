Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794540574;
	b=3USI8PjII/RF04LFUtQQy8h/Js/SCpz6M/svzCsY8abjE1TMSKkLXXT48ZGNNXJt7OET
	 FxeyCMtp2FmjtrCuJ8VGkXRaBc0Erg70d+aQfuzgMTdtWIm6msfekxJHx5zU60jvLy2XI
	 HeHLSv6DXdryrprsXG3oRJMKxq42vyf9yFw1FNWgQ+UHf0rx+Zw8W3etREQ3D9K1zS87E
	 3DMN8YOYAIagw0p3dmUZ7LAllY6By7vqnmWq4jeziAtQ7jaly6RIjDZQM74bARojHYWYG
	 1KhxTsiMb1GZYZAM/RSSzLgYOzKsHXcicFYv1uFONxtAHwYqQ25xZxrFz2IG3HA9Dkw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794540574;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=nwrxOe/glF1Pq2cxsA4bK6k2mkf6sPrkS844eYud2JQ=;
	b=FKH57k+pi/Zp+amRmDbK317UppAduo7GXpcsJ3GlZmvMfwhvXJSJleScDJIuXwKpdOEv
	 pF5U7rb123RfjqMiQ82/PNt2RO/7ytSfjYHTPEwev+RANWR6QJdWskkcr4i9W/qpjPTNc
	 QwuF699Xd2Rtqb0LfOrfcegXS+4qs1KJiyiDerPAyIi35e+Iz0WXRCpqR4lBGA5dUMZV4
	 s64JYOJs5HNSctqhAYSPwNxd3WYoWMzO3UG6dSoSO9SXOYWaQvDOHbKMC/HQSHenkyffH
	 CWU80/0CFp+Qz9/Eq00bvLYWaWOqhCVTBfXMYQpJa0IHctbyDoZDABACzlsc7QJr9jQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NZ9Cb7Xx;
	arc=none smtp.remote-ip=74.125.82.53
Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF5D5606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 03:29:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CF5D5606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NZ9Cb7Xx
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-1a2761c69fbso1077000c88.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 19:29:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794540573; x=1795145373; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nwrxOe/glF1Pq2cxsA4bK6k2mkf6sPrkS844eYud2JQ=;
        b=NZ9Cb7XxiACGHxeJ9PjL2gqTYg7MmPZSxeLtP12HL0s2lJLnOureIM4MKomYqSGt0M
         /TJ/wRH17VKvTvHcgBHQANwLWQfT6HhJG6XdR6QQ/44X4mpjMkDmuCbm1UhLx5ceH1nz
         r90eE0Vfec+6UvkcGTc8K8m4YPt1dqgE8VMljn+aKwkoWNMa9mQNejRXCGahmgBh105+
         mYTSVbFVZ/ktwhm+wqwj/CX+uQ9pvSwA2FvR6F5bt3XG+aFCzfKPEkLwKcrl6gSeykkM
         ytrzR2tyb4LU+9lAB+Vtxa2KMoSxPHttdyBFmSuB5btsrGHHMGJJWsyinC1WFb8hQaUl
         lxpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794540573; x=1795145373;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nwrxOe/glF1Pq2cxsA4bK6k2mkf6sPrkS844eYud2JQ=;
        b=hahjUI9+43i3KECD5K4Q9rmpVhgqB851GBzHrdrIgbJ0L+N6ptzO8noH3S6+DoNymG
         0piYmGd+chdVdw4SCEXvRs6P93y6k6mYVwiUzeAuzDQphvv2amOhwJaWjHloLtIythMK
         b79oZ7+dYlTwm36kTDHkVSjaBfAxGLSXPIytMzH7bgmw8nKZVUMKPPAcXVpnkZ1x+HqJ
         PVh03KR6jzlMgO1RaGE02zUDhEP+TRCz3v5yKoBTgBI3ENTRjGXlql9DmyUHBSFn+YiN
         81LnNNvD50eX69ZGPYrRvYdejB6LfVuWlss1cpD/7iHMQ8g4phDlpEKncMKqBTwGwdAM
         lhLA==
X-Forwarded-Encrypted: i=1; AL+hErEGuYzXCTDQCxQ005qp5S7xlly/kKK1vuqaAPFk0MIB1jd/cfK7yrWPCflgnomHW4OH9cxPyDRSDBz1ncw=@vger.kernel.org
X-Gm-Message-State: APuU4Z8OvzMXveN2Z8sbwyDxFKOdsct84zWwGiROPA5ry+xOD11TIX7d
	PMeQ+CZ1EZiBNAUZTAu1IspvomgFmSRZmkgtLNjZ0AK8WLLxY2us0NBn
X-Gm-Gg: AYBFou3mWh0TTttUZkQlWHx4a0UV3xtO2TscQl9Nm1Ykb+4S5meDVJUXRC0e1VoFrB6
	gXxgH15fTm//b+UBiEL770+QdcMFUMYoHcGOwTB+m4pQHDePIP62YE5bHWIzgwH6UAfmYdVNbxY
	cl3CTJMTghqU8rW5c24/LqbPTDTFBABy3LjedEiUGMOIJqIurQAZxrtQQHLcNagMegEcxvL2ESc
	ddYS9J3DWCgtKiyED9raaxhDYLUfCF2z4CIcLMISQlq6hpPUL4FTImk0XZwtGrxxsK6DZDjilEQ
	EziYhvfRFg1iBpGXdsgS1WeHCp+WlDXdAqn02sReESV5RuKPxOiNmEDtNMZl42ZrRUww7N8R+MJ
	fZsrwD2pCvNwGRSSdw5iUof3xqbGqmAf/hY3zy3/3fqa2YkLOpLJoztjuDfhzF8HNUuEPtgY0tY
	RQjJRYdINY6A3S21s9MxjOjPMZNwBTybQW1YQRa+qoaGdM3acNRtTyfQnvGQR+CWONx2RiWDTUp
	j2bTPRNTU03Js/ogs+p8l9Y17ZiyBkY9wSeqz5Ukz2Nzk8GRLuwGa+V0aVg1nUksknCBm/pBGhk
	Hbgk+47mrpF5nXbnm5sc
X-Received: by 2002:a05:7023:a4b:20b0:1a4:3fa7:adef with SMTP id a92af1059eb24-1b5031bbaecmr1435822c88.47.1794540572777;
        Thu, 12 Nov 2026 19:29:32 -0800 (PST)
Received: from a1-free ([161.33.196.121])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b50309b27dsm3029718c88.2.2026.11.12.19.29.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 19:29:32 -0800 (PST)
From: TAKANO Mitsuhiro <takano32@gmail.com>
To: linux-perf-users@vger.kernel.org,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>
Cc: Ian Rogers <irogers@google.com>,
	James Clark <james.clark@linaro.org>,
	John Garry <john.garry@linux.dev>,
	linux-kernel@vger.kernel.org,
	TAKANO Mitsuhiro <takano32@gmail.com>
Subject: [PATCH v10 1/1] perf jevents: Check the keys of the JSON tables
Date: Fri, 13 Nov 2026 03:29:27 +0000
Message-ID: <20261113032927.634183-2-takano32@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261113032927.634183-1-takano32@gmail.com>
References: <20261112222526.462146-1-takano32@gmail.com>
 <20261113032927.634183-1-takano32@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

jevents.py takes the fields it wants out of each JSON object by name and
ignores the rest, so a key that is spelled differently is dropped without
a word and the object is built without whatever that field held.  Two of
those are in the tree: "PublicDescrition" in 16 entries of an Arm table,
and "BriefDescript6ion" in one entry each of three AMD tables.

A table may carry 51 keys; 47 of them jevents.py reads, one more metric.py
reads, and three are read by nothing although the tables hold them
(Counter, CountersNumFixed, CountersNumGeneric).  A key outside that list
is reported with the file that carries it.  There is no cut-off, no
similarity and nothing that depends on what a run of the generator
happened to read.

The check is not a JSON schema because perf's build would then require
jsonschema, which it does not use today and which is not in every
builder's python.  It runs as a perf test, not as part of the build.

--check reads its directory before the parser asks for the three
positional arguments, so it needs no dummy architecture and model, and it
takes "--check=DIR" as well as "--check DIR".  A directory that is not
there is reported instead of passed, since nothing found under it would
otherwise read as a clean tree.

On the tree today it reports 19 keys in four tables.

Signed-off-by: TAKANO Mitsuhiro <takano32@gmail.com>
---
v10: the two fixes v9 described were missing from the diff v9 carried;
     they are in this one.  The check itself is unchanged.

 tools/perf/pmu-events/jevents.py        | 48 +++++++++++++++++++++++++
 tools/perf/tests/shell/jevents_check.sh | 36 +++++++++++++++++++
 2 files changed, 84 insertions(+)
 create mode 100755 tools/perf/tests/shell/jevents_check.sh

diff --git a/tools/perf/pmu-events/jevents.py b/tools/perf/pmu-events/jevents.py
index 080e04b51b8c..4bbaba7086c5 100755
--- a/tools/perf/pmu-events/jevents.py
+++ b/tools/perf/pmu-events/jevents.py
@@ -7,6 +7,7 @@ import json
 import metric
 import os
 import sys
+from pathlib import Path
 from typing import (Callable, Dict, Optional, Sequence, Set, Tuple)
 import collections
 
@@ -1450,9 +1451,56 @@ def _init_worker(std_events: dict) -> None:
   global _arch_std_events
   _arch_std_events = std_events
 
+# The keys a json object under arch/ may carry.  jevents.py takes the fields it
+# wants by name and ignores the rest, so a key that is spelled differently is
+# dropped without a word; this is the list a table is allowed to contain.
+_TABLE_KEYS: Set[str] = {
+    'AggregationMode', 'AnyThread', 'ArchStdEvent', 'BriefDescription',
+    'Compat', 'ConfigCode', 'Counter', 'CounterMask',
+    'CountersNumFixed', 'CountersNumGeneric', 'Data_LA', 'DefaultMetricgroupName',
+    'DefaultShowEvents', 'Deprecated', 'EdgeDetect', 'EnAllCores',
+    'EnAllSlices', 'Errata', 'EventCode', 'EventidCode',
+    'EventName', 'Experimental', 'ExtSel', 'FCMask',
+    'Filter', 'Invert', 'LegacyCacheCode', 'LegacyConfigCode',
+    'MetricConstraint', 'MetricExpr', 'MetricGroup', 'MetricgroupNoGroup',
+    'MetricName', 'MetricThreshold', 'MSRIndex', 'MSRValue',
+    'NodeType', 'PEBS', 'PerPkg', 'PortMask',
+    'PublicDescription', 'RdWrMask', 'RetirementLatencyMax', 'RetirementLatencyMean',
+    'RetirementLatencyMin', 'SampleAfterValue', 'ScaleUnit', 'SliceId',
+    'ThreadMask', 'UMask', 'Unit',
+}
+
+def _check_tables(root: str) -> int:
+  """Report the keys in the tables under root that a table may not carry."""
+  if not os.path.isdir(root):
+    print(f'{root}: not a directory', file=sys.stderr)
+    return 2
+  bad = 0
+  for path in sorted(Path(root).rglob('*.json')):
+    if path.name.endswith('metricgroups.json'):
+      # A dictionary keyed by metric group name, not a list of events.
+      continue
+    for obj in json.loads(path.read_text(encoding='utf-8')):
+      if extra := set(obj) - _TABLE_KEYS:
+        print(f'{path}: {sorted(extra)}')
+        bad += 1
+  return 1 if bad else 0
+
 def main() -> None:
   global _args
 
+  # --check takes the directory to check and needs nothing else, so it is read
+  # before the parser below asks for the three positional arguments.  Both
+  # "--check DIR" and "--check=DIR" are accepted.
+  for i, arg in enumerate(sys.argv[1:]):
+    if arg != '--check' and not arg.startswith('--check='):
+      continue
+    if arg.startswith('--check='):
+      root = arg.split('=', 1)[1]
+    else:
+      root = sys.argv[i + 2] if len(sys.argv) > i + 2 else ''
+    sys.exit(_check_tables(root))
+
   def dir_path(path: str) -> str:
     """Validate path is a directory for argparse."""
     if os.path.isdir(path):
diff --git a/tools/perf/tests/shell/jevents_check.sh b/tools/perf/tests/shell/jevents_check.sh
new file mode 100755
index 000000000000..b596f8bc509d
--- /dev/null
+++ b/tools/perf/tests/shell/jevents_check.sh
@@ -0,0 +1,36 @@
+#!/bin/sh
+# SPDX-License-Identifier: GPL-2.0
+# jevents_check: an unknown key in a table is reported (no_mlock)
+#
+# A key that is spelled differently is dropped without a word, so the keys of
+# the tables are checked against the list jevents.py reads.
+
+jevents=$(dirname "$0")/../../pmu-events/jevents.py
+python=${PYTHON:-python3}
+
+# An installed perf has the test but not the generator, and a python that
+# cannot run the generator is not a failure of the check.
+[ -r "${jevents}" ] || exit 2
+command -v "${python}" > /dev/null || exit 2
+
+tmp=$(mktemp -d)
+trap 'rm -rf "${tmp}"' EXIT
+tables="${tmp}/arch/x86/model"
+mkdir -p "${tables}"
+
+# Known keys pass.
+printf '[{"EventName": "a", "EventCode": "0x1"}]\n' > "${tables}/events.json"
+"${python}" "${jevents}" --check "${tmp}/arch" > /dev/null || exit 1
+
+# A key the generator does not read is reported.
+printf '[{"EventName": "a", "NotAKey": "x"}]\n' > "${tables}/events.json"
+"${python}" "${jevents}" --check "${tmp}/arch" > /dev/null && exit 1
+
+# A directory that is not there is an error, not a clean tree.
+"${python}" "${jevents}" --check "${tmp}/nodir" > /dev/null 2>&1 && exit 1
+
+# The key is an option, so "--check=DIR" works the same as "--check DIR".
+printf '[{"EventName": "a", "EventCode": "0x1"}]\n' > "${tables}/events.json"
+"${python}" "${jevents}" "--check=${tmp}/arch" > /dev/null || exit 1
+
+exit 0
-- 
2.53.0

