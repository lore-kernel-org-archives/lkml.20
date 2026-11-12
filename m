Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794504771;
	b=Xbe0h2ebaMp0C+FOHCTL8Pj9Zi4YF07tZ1xaKC5sGpp662aW4xOtUlLik8HF4woNe1nT
	 4gFYYX3Bjxk0IT4VN3vIkud4b10B+l7TfWTpcKyukQb8oJDTrA20gMLcjEIO+r0N7V3AG
	 PJY+z/7HQKRFOSyt5hXW/92cF6jHWAzoz5SHWa9w9qC17SKG1t/1tMzi2gyeYnlO6dhKZ
	 tN4Yt+SVN1OYoCWc873i0QeEuOj84qnomEEbUeRRajvsm1YWh8A1df0q9BEFQ8rdnjb4i
	 F0cKHjgE5NnHybQhj3BMP+onwF1/WG3tmKruUcXZ+Km8AL/5XiJs/TtXIkOtnqmLsZw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794504771;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=SEUumPJHJkZeDnIM1ODuPZ5omuUgcXpheI3jyCf4At8=;
	b=Q5dyhEMOT83UQVcCHgxYuj1lOcsVARkJQbOt+pUjbNMh++2CtWxLtjXjd0cMNnf8tEyM
	 3Y90B0a3HHJZ0lFhOVc0zpZUwQj3zg/zUL1W3v8pCzZ5dxTC2662cZ7PFJkMjA6ly+/dE
	 4jKFc5EFRRSaVma7eJllYyuL2VJVqlhoDmVzPJQXYftGqNSGwO4DMZjAXFOckontp1G/G
	 4DarWMaeAFji1QxBnbUdwajOBTaFrjtfe4g9F2I/YDxXFnDkvF8AgX6mDhb0oZ14ZUzCu
	 Gb7elLHgBLHWTD4+TniE4YgeWSO5fN7KcMNMgEZhgumEQhdeN4B5mNPrAPQxCanT5ag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=enGfzmdI;
	arc=none smtp.remote-ip=74.125.82.47
Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EEC2606A33B
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 17:32:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3EEC2606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=enGfzmdI
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-14394530ec6so6305954c88.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 09:32:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794504770; x=1795109570; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SEUumPJHJkZeDnIM1ODuPZ5omuUgcXpheI3jyCf4At8=;
        b=enGfzmdIC/sa3AzTg64ECecRtkxMs6Y/hzNrtDwuNIEpDcCwb++0a7t7k2h1DBUBAC
         4JLAqsrLFI2SPhDUJprn2zNXIkhwgBPr19ZS7qU5yBWdgB5aROoNHKASqvaDDcqAD+Yg
         4P0Oqrz7+zFPXzHSacjHj8nrDVbBw5lTczL11Sag6EdFzBFF6Ewdu2S3I1VqxvhiU2+h
         r8cgerdVVYnBW7ov4bjS7jWHtsMZXhzyhBc6uT9+S2DBYal/BZMaef6fb9BOtqGGBL9V
         C6zSlA6SzkJYTtWBPbroDvacwDYrRfqczQo7R6E7/f7dDyoWOjKTLuNaUAef1Unu9FkU
         OIAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794504770; x=1795109570;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SEUumPJHJkZeDnIM1ODuPZ5omuUgcXpheI3jyCf4At8=;
        b=s6uD9C5sJPadwmLi3LvGWM05CtvOXz8lVkZkJIBYAOjwpUgv+UXCFmRZmTBFeBX1NI
         bpGrfYug+slO5bjnjv6ugA6suiNLBu887H7WfJQdgmj5lhil8qRcWRQ23hDumLf5eXwv
         sFqz3cYnN/Fz3YIj8WaiSr+wm/jGw04hj1bKbS8/36lIBHiwj86eHJXLqQ+JIZRxB85X
         LQZQyS2fNGL1HKy2mCEyPKeZos3V9UaGKmo6tPOtzakC4hHvu+s2u51C1fDdhTuH2hkB
         oA1yGvhLam90+UQ0H/WnDZ83y/Hp4R7Oj8Q2DIXJ2RTxLAkN9tynD32tRjV3nCJZj+EU
         UqQQ==
X-Forwarded-Encrypted: i=1; AL+hErEWNlteYN+YH5d4gx000CDUTYfjX10ohosT9w6fVzPX2A8kKQvt9DComhX7VV3UfVDExiI1I9aCs+eEFRs=@vger.kernel.org
X-Gm-Message-State: APuU4Z/wzFfd6vRGrKR15Ggbh/EC5K/GadbvsmTkmi04pwGl749WUfen
	Av3RhI/L5kdd++Fo6IS7m3J5Chw1dTGSwiELAzCdNLTQGaLiIWDA+0Hg
X-Gm-Gg: AYBFou0BKef+wZVyrpGAUrwr2rFBeIScAI+NVk6sWj5Z6REwAV0GFB0YM0tN2hWfhUN
	7buEg2VrwS1DDssYkWO9pmVuzY94RtBM4RO2Sfrj1V6lCjFIomTEfnSYFMIu1iTtJe66t4ssUE1
	fQIOqlRvcHt25WHXpRUIzltFAkdtcAOlxaK562+H3RkPby9jdG4sJNC6fwGxRWELz8gxFnuJY3a
	4kfXhChg1uS4lcnEHA2KmAIwl5T2JEdWjC7i4jrJvaDN7cTVFllc3clWIeMlDaH/zmAZ76f5zhg
	xeuowmlpdZIeDfy9rQP/z+te25Ffm692NmqSFfQ7XskURtjefuMO738QZ8qELjFfpSPIPna1xNS
	lSx5ROhPan0Y4FGnMR4pJz9C2ad643OAoIL065ocehgxqzIwtZnYlgve0rW4KS2LrZWO3Ot2ZDc
	aTuq/Q4S9PXhJh69X6JzS0+CkiOE9nNT2kdS46m+AZZ2TTNvDE2EtwF8T3Q7JUxLg+j53jqvSnn
	JxHqui3QMNtUagbE/04eZi+1LkTM4r9W5Q9VVdLd2gxChpjrmlB/XzI9SvZMoYIn5q4PqEbm560
	TlMtSHyzanquKrldu9FjiXnoOuciGIZxopuOVNxpDg==
X-Received: by 2002:a05:7023:904:b0:1ac:2f6d:e1c6 with SMTP id a92af1059eb24-1b503068271mr243860c88.6.1794504770162;
        Thu, 12 Nov 2026 09:32:50 -0800 (PST)
Received: from a1-free ([161.33.196.121])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b50316e008sm379345c88.6.2026.11.12.09.32.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 09:32:48 -0800 (PST)
From: TAKANO Mitsuhiro <takano32@gmail.com>
To: linux-perf-users@vger.kernel.org,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>
Cc: Ian Rogers <irogers@google.com>,
	James Clark <james.clark@linaro.org>,
	John Garry <john.garry@linux.dev>,
	linux-kernel@vger.kernel.org,
	TAKANO Mitsuhiro <takano32@gmail.com>
Subject: [PATCH v8 1/1] perf jevents: Check the keys of the JSON tables
Date: Thu, 12 Nov 2026 17:32:41 +0000
Message-ID: <20261112173241.197996-2-takano32@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261112173241.197996-1-takano32@gmail.com>
References: <20261112162823.139419-1-takano32@gmail.com>
 <20261112173241.197996-1-takano32@gmail.com>
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

On the tree today it reports 19 keys in four tables.

Signed-off-by: TAKANO Mitsuhiro <takano32@gmail.com>
---
v8: --check takes the directory as its own argument, so it does not need
    the arch and model the generator takes; the test uses PYTHON and exits
    2 when the interpreter is missing.  The check is unchanged.

 tools/perf/pmu-events/jevents.py        | 41 +++++++++++++++++++++++++
 tools/perf/tests/shell/jevents_check.sh | 29 +++++++++++++++++
 2 files changed, 70 insertions(+)
 create mode 100755 tools/perf/tests/shell/jevents_check.sh

diff --git a/tools/perf/pmu-events/jevents.py b/tools/perf/pmu-events/jevents.py
index 080e04b51b8c..5daf92527573 100755
--- a/tools/perf/pmu-events/jevents.py
+++ b/tools/perf/pmu-events/jevents.py
@@ -7,6 +7,7 @@ import json
 import metric
 import os
 import sys
+from pathlib import Path
 from typing import (Callable, Dict, Optional, Sequence, Set, Tuple)
 import collections
 
@@ -1450,9 +1451,49 @@ def _init_worker(std_events: dict) -> None:
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
+  # before the parser below asks for the three positional arguments.
+  if '--check' in sys.argv:
+    ap = argparse.ArgumentParser()
+    ap.add_argument('--check', metavar='DIR', required=True,
+                    help='report the keys of the tables under DIR and exit')
+    sys.exit(_check_tables(ap.parse_args().check))
+
   def dir_path(path: str) -> str:
     """Validate path is a directory for argparse."""
     if os.path.isdir(path):
diff --git a/tools/perf/tests/shell/jevents_check.sh b/tools/perf/tests/shell/jevents_check.sh
new file mode 100755
index 000000000000..62ce70ef5d02
--- /dev/null
+++ b/tools/perf/tests/shell/jevents_check.sh
@@ -0,0 +1,29 @@
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
+exit 0
-- 
2.53.0

