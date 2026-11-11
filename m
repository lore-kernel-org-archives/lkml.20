Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794364495;
	b=GwpJz42lD9UClQAqnDDrmsmSYWhgnKm0OzViXWvXxpLsRpYlv1VUCASOkCwVPif2gCgt
	 nuxZpNB0DhQ7LMxRF1NFhPunrpOGZR6Qg4UnX+QMV9ZNpofCBYiZIkQJyR69V5SmgXPpU
	 4E9KWFOpp1ID7O2BdjR6RQHSHZGtjZsrimRbd90OU0mFbpoIrBWoqDIAN6ZMyzXtar9Zq
	 unb3KBT9s/abZI72mvrbVkT5IUrqEKiGznKanYQtV4f0vgtBRkTkTMdVwo2JW2wfgYqXV
	 PEiQ/P/ij72pHqv05sqWYRVXGFDE4fscjv2jeC6CNorifr1Kc18wmFHz5OrkPQdmHNA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794364495;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ZY/yXrMk9KshKJitniBsyfv4SHkHHsRLReltZI/KTmM=;
	b=DMbMwAxWjLP8IbyeIKHn2rZPw2+3zIWsZ/d4ExRCzGAx4YCXIURhOBJQ+jFyNPq8J75f
	 4xlr6cX8VdsqIZZd9zjWVScYHOpk4ziWqV1Qzyw3vqOodvIQStCmNbMnSxiEpcw7R/VAk
	 hV2i4NDBrGBsOPWNGPYHSsfzvmgZ2jDdgCOTJNSNG4ixZTmrgMPvNA0656PlpO7KSPQTD
	 WMGpM29HCaK5Kp/MGAqgM9Y6FYI3+H+/zQcv7tI1lpKl+P/qd49s3+Q+eQTdGsof3WxOD
	 zdZuJFeDl7v4fElZ/fd67kPozmV8uh70//Sy4ef1UYO2HHxU8c5ptmdnVCAdwlMyy2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TAe1lMoJ;
	arc=none smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1F5C606A32A
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 02:34:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B1F5C606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TAe1lMoJ
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-37628596783so1413347eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 18:34:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794364494; x=1794969294; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZY/yXrMk9KshKJitniBsyfv4SHkHHsRLReltZI/KTmM=;
        b=TAe1lMoJh46WtDwrffmktGuTNKEpSjONxHx7b6ts+iMpyQbXe7IrgEvNbgjuAJaerX
         fwK/004hKHG0ceE9Mf3xgOVUb2jjBzcIvs2i4fMOvTWQKCEz8aeSWN62jT+e8w9px7ng
         yCYoyWyEFaiI0zVJQVbEuDQcV2GbzClOoTb6Ssd8XCXwibQihSaNyigPMcs7TsZHUlfP
         nSu4beApA6PKG8qaG1tY3UJs2O1/dJJmDReK50xc4JDVJSQLn/VuCDtmDC2allGiItz7
         oh5x7wYZnoJtUYHxVBduJrv/Ct3N9fQroxcYxRyZecFyp4EJ34+3Rit+X7tOqZIs4Y1o
         b1hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794364494; x=1794969294;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZY/yXrMk9KshKJitniBsyfv4SHkHHsRLReltZI/KTmM=;
        b=xFHR8PRxR2MFgyAW13VjlQjDz3swNUCnXmX6Wk8mBvKplKonY4Ici3VRZX8+vVqAlk
         huE+lM8nU+Q74G306FwyJzT4HBHY3+ZyqF++T0wMcrLqO13iOWV40ShaqZMIbe0MRo2C
         7W8Z/1+BlDMm/Gbg81rx1blo++pl3bv9m48BjzP+CjFlvEQE45kC2fHYItjfxAIrs7Ge
         E86Wg7Y2hSeCUGlW8mK2sPOFLPsbiE/AjgGoR/gMRAlKOAyw9WL9/sHMrjhphmiLnWHF
         8ZaV/h4B8A+XH7zq36SGR1TTwq8WzD+QNCV6IRI4Wl/LUTXKgOEoddrQp2x22sD/BYK+
         2sGA==
X-Forwarded-Encrypted: i=1; AL+hErF7JkwBYD7Wj2DmwxPMpHLvCbEcrnKHQhq/+r7uTUDt+OLh9HDEqj1V8o+7rd6VsWe3txlIjqdLLP5sQDc=@vger.kernel.org
X-Gm-Message-State: APuU4Z860IrtfavB2Z8HuvlEGvkfQfXR/j9qk84amjF2Iz296jq+10MK
	CwKftQ51HhAVuxTu1dMxbFdh95t80hjKQgl16Zq/oRlu4hQogI8ZHNSZ
X-Gm-Gg: AYBFou2RN3rkRnzG6CeFUhC7PtRNIUzKOZMkke9Sq4ynDYlRXaVxB9mDmqR7gu99thn
	mWbZBzl0Kv1+7NtwZB2/L1psQN0SFgxJLZQJzPHLEnb8qZA2Lf+gsY/qEi72McA802+64021Aie
	EZXRxK+jZIfMv42zSYrhVSOj8/0D/U227np2l9BRUy4AMstoMAVSJfL18zVjtZmEWtmQNqohYSE
	ShkXadMBwKrGExR2YiKqQcmpjZoZBuCBjCEwG1aFKma1AV/nNnMUtWr+HQSyfecX6Uiwe51eAOb
	XFPBP0Tw1HTsYwJ2Dq2Uwcaig6YorXC/8Mdh72wua+yCODGMLUd/OZKN6NYerr2EKbWe2QU6wm8
	r9lnMSaUYHOJiJ0nq+wP8CB8ie1xojQNLKFayNkJZ79zrEVqCm8lOcETtWGrRjjF0aZXHsDjPTN
	E2PPTTI7aIQzpf6lV76QzJ5QFdjyc+Ucgf5xgLkVtR/PfVvo6cqP2/YlDrhpxcgGN2BFjRNgSTJ
	oMzkO4RP5tesaeEAqyWO1WFf/rJemLofOWgoI1b5uokPx5QANeFJF79syiQohYZk4DqERF1ugPT
	xFpQOXe9Tla9KP19UQJz
X-Received: by 2002:a05:7022:1184:b0:1b2:6b1f:1d89 with SMTP id a92af1059eb24-1b3c0360627mr960969c88.36.1794364493779;
        Tue, 10 Nov 2026 18:34:53 -0800 (PST)
Received: from a1-free ([161.33.196.121])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b11435sm11752369c88.4.2026.11.10.18.34.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 18:34:53 -0800 (PST)
From: TAKANO Mitsuhiro <takano32@gmail.com>
To: linux-perf-users@vger.kernel.org,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>
Cc: Ian Rogers <irogers@google.com>,
	linux-kernel@vger.kernel.org,
	TAKANO Mitsuhiro <takano32@gmail.com>,
	James Clark <james.clark@linaro.org>,
	John Garry <john.garry@linux.dev>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Mark Rutland <mark.rutland@arm.com>
Subject: [PATCH v2 1/3] perf jevents: Name the metric when a MetricExpr is missing
Date: Wed, 11 Nov 2026 02:34:46 +0000
Message-ID: <20261111023448.1970467-2-takano32@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261111023448.1970467-1-takano32@gmail.com>
References: <20261110222250.1864777-1-takano32@gmail.com>
 <20261111023448.1970467-1-takano32@gmail.com>
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

jevents.py reads each field it wants out of a JSON object by name, so a
MetricExpr key that is missing or spelled another way leaves the object
with a MetricName and no expression. Two different failures followed,
neither of which named the metric: the rewrite in _read_json_events_impl()
raised AttributeError on the None, and a metric that got that far reached
print_pending_metrics(), whose assert fired on it.

Raise in the reader instead, naming the metric, before either of them can
happen. The check is not inside the '-' test that decides whether a metric
takes part in the rewrite: a name with a dash in it can lose its
expression the same way.

Two smaller changes on the same path:

- An architecture standard table that does not parse now carries the
   reason in its message ("Failure processing '<file>' in '<dir>':
   <cause>").  The traceback used to end with the file name alone, and
   only the chained exception said why.

- A table that does not parse is reported on stderr with a "jevents:
   error:" prefix instead of on stdout, where it was mixed with the
   generated output.

And the output file is opened after the tables have been read, and not by
argparse, so a build that fails while reading them leaves a file the
caller named as it was instead of truncating it to the header.

Signed-off-by: TAKANO Mitsuhiro <takano32@gmail.com>
---
 tools/perf/pmu-events/jevents.py | 35 ++++++++++++++++++++++++++------
 1 file changed, 29 insertions(+), 6 deletions(-)

diff --git a/tools/perf/pmu-events/jevents.py b/tools/perf/pmu-events/jevents.py
index 080e04b51b8c..86060a228b75 100755
--- a/tools/perf/pmu-events/jevents.py
+++ b/tools/perf/pmu-events/jevents.py
@@ -460,11 +460,17 @@ def _read_json_events_impl(path: str, topic: str) -> Sequence[JsonEvent]:
     with open(path, encoding='utf-8') as f:
       events = json.load(f, object_hook=JsonEvent)
   except BaseException:
-    print(f"Exception processing {path}")
+    print(f'jevents: error: Exception processing {path}', file=sys.stderr)
     raise
   metrics: list[Tuple[str, str, metric.Expression]] = []
   for event in events:
     event.topic = topic
+    if event.metric_name and event.metric_expr is None:
+      # A MetricName without a MetricExpr leaves nothing to put in the
+      # generated tables, whether or not the name has a dash, so the build
+      # must not go on.  Name the metric instead of letting the table printer
+      # assert on the None.
+      raise RuntimeError(f'Metric {event.metric_name!r} has no MetricExpr')
     if event.metric_name and '-' not in event.metric_name:
       metrics.append((event.pmu, event.metric_name, event.metric_expr))
   updates = metric.RewriteMetricsInTermsOfOthers(metrics)
@@ -493,7 +499,7 @@ def preprocess_arch_std_files(archpath: str) -> None:
         if event.metric_name:
           _arch_std_events[event.metric_name.lower()] = event
     except Exception as e:
-        raise RuntimeError(f'Failure processing \'{item.name}\' in \'{archpath}\'') from e
+      raise RuntimeError(f'Failure processing \'{item.name}\' in \'{archpath}\': {e}') from e
 
 
 def add_events_table_entries(item: os.DirEntry, topic: str) -> None:
@@ -1490,12 +1496,29 @@ such as "arm/cortex-a34".''',
       type=dir_path,
       help='Root of tree containing architecture directories containing json files'
   )
-  ap.add_argument(
-      'output_file', type=argparse.FileType('w', encoding='utf-8'), nargs='?', default=sys.stdout)
-  ap.add_argument(
-      'output_string_file', type=argparse.FileType('w', encoding='utf-8'), nargs='?', default=None)
+  ap.add_argument('output_file', nargs='?', default=None,
+                  help='file to write the tables to, default standard output')
+  ap.add_argument('output_string_file', nargs='?', default=None,
+                  help='file to write big_c_string to when it is to be kept '
+                       'apart from the tables')
   _args = ap.parse_args()
 
+  # Opened here, and not by argparse, so that a failure before the tables are
+  # written cannot empty a file the caller named.
+  if _args.output_file in (None, '-'):
+    _args.output_file = sys.stdout
+  else:
+    try:
+      _args.output_file = open(_args.output_file, 'w', encoding='utf-8')
+    except OSError as e:
+      ap.error(f'argument output_file: {e}')
+  if _args.output_string_file == '-':
+    _args.output_string_file = sys.stdout
+  elif _args.output_string_file is not None:
+    try:
+      _args.output_string_file = open(_args.output_string_file, 'w', encoding='utf-8')
+    except OSError as e:
+      ap.error(f'argument output_string_file: {e}')
   _args.output_file.write(f"""/* SPDX-License-Identifier: GPL-2.0 */
 /* THIS FILE WAS AUTOGENERATED BY `jevents.py arch={_args.arch} model={_args.model}` ! */
 """)
-- 
2.53.0

