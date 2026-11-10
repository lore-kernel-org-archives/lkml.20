Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794349377;
	b=SLYl9u1y2IVojvrdAqM7vMkr8nAIWOpby102riKf3ylrL7DJifhKE4Jcfn7mWyxTDQmt
	 iXbrnCaAsffK0wOTygcDqGkj5KvY7iKrM+ZDulKUh7DE7saV/WyZ4/9reJfeS0RfCz8CS
	 SfUzAC/Hwkr8F+i2OTu1uRxT2kbLG8Y8HUU/vwRA5qypFib34ycoypz1/gMg1F7qsLZy4
	 VIyQRt7j7MUfadnWTOVQ9pvqbVterArpkgmIs9wbOTmpygs3UXDLx4aBPMawDSar/Qq+J
	 PvlFW+GFm/88vAH6Yp0rcVbj8P0qKR6a4G7ZLGdOdFZeKilrODPYyBP3P8Bm2c1v/4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794349377;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ZY/yXrMk9KshKJitniBsyfv4SHkHHsRLReltZI/KTmM=;
	b=wQPRDzsybeuiiwpX2HMCxYRBf+b7pm4MD8uO5curZhvPhV2B4pxsZR5dWFqquWeHEP9H
	 LSYviVpSH0tQ5CYIgYDtxBm+zNlrDSO8BVVRUt9o9TfsbprXUj8y+lECWjUdz67cckaIG
	 2njyx/9zJwOXmMCN9QMJldBsbjbngAGa1E/eRQnQaesGPMPZqdCXcdIAHvsVq4Mn6swO3
	 YIu2+FJtODaHnaSHFLQv18pxLrP/us1/LHKXz2cORHN5EGLNpLNOMHC7q0a4l2tobGaav
	 L+Ii13sGJPxJqiIYm+Za6R5lSalDH5uLoTcdSWpSzQQ8Somy43qKpqL5ch24gW3d1VQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cs7rbqsT;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DE48606A326
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 22:22:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4DE48606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cs7rbqsT
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso4870552eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 14:22:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794349376; x=1794954176; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZY/yXrMk9KshKJitniBsyfv4SHkHHsRLReltZI/KTmM=;
        b=cs7rbqsTIr2PcpfPqWX7xCXFi2IGJVT8V+lmpG9xUs1NLOO/p+v86woVPCeANzEjYg
         fXWFhrDbf5A07gj4wHUjp15xY6LKd/EoTTWe0SCXeXYnISWLxtzBkN5NYr9y7Viug9v9
         4upk8vfPAEHpWwJjVfgXs4fA0Ul3Y256RdriVapt/CiiMjAkXeozxiEXmJiAxOBxFq2k
         +olTw8satupFYatARmPjN/AzAcQyU54Iuw0P88Ht+5BIG+s2rpDwTtF8fNbVVy889DR1
         5nRr+RwGxMLADNdvlPMtI/9NnLba3mBuyNgL1VasKZi67Sh3ragvqvqJ5Df0RYcvOqCz
         JL1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794349376; x=1794954176;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZY/yXrMk9KshKJitniBsyfv4SHkHHsRLReltZI/KTmM=;
        b=xrdopez1Z3swNPvdPXSEWoRfwU/yamZKotAJvvkQP+hfPvpM8b6Am1+4fZOdAMauuF
         RY4SkKM9lcyLFF4a9+Iv5VYePaXUbllTfAdr2UbQFljWOzXN7sPYtds8DFrgsG93TGVq
         X6b0t8PJRZ7+x5VnowSDCcNWTzXAJoBM4+evSb88uwfXcwk/in3vLNsJjBdHQFgFa1ZQ
         oGev/d0krCD1f1aU0Uir/zkIgXutrmdpxmrI56I8UJScmVjeniSRm1vBOAexcw24QDEA
         9K1gwge0HeQ3ADOW1YcKsy66RlW4UFzEFr0/H3S/T2IP2pWfthlbadREALpAHfgVZDAn
         xYCQ==
X-Forwarded-Encrypted: i=1; AL+hErH0ofAXBf+xenSo57Q5HJ/7uIt3rHNIIpBWBwtjQdJxc5OMqhf+wSQosBLumAbhK65esQIuPAVXgB4beOI=@vger.kernel.org
X-Gm-Message-State: APuU4Z9i5jTaEzPgH5XmbSq15Z2Cfs0GUELpt4wGbAQNIWKIrfnNZeNx
	+oikR/FtpScp3+Z+ZM0nXMmewh/xJMN8q0ZaY+iG/KXcsBZ1LRqwHDvM
X-Gm-Gg: AYBFou0cncnZ1OoCvhPAwZhziRck5pCY7E0jKZ5MFKyB7uQQWdQi7E7Y7gsm9SbFg2E
	hAhWcTuCzhvncaNN4h1ITAQ3594niUHUY7JcGZK31m08iNL71rKV+8S5HVogzMyQAZ1blAfLdKP
	aBMZKnUzolid0EXskiWzB9Y0qWGeb1BcTGEQtJc7ZRu0OLyhqRjNBAndOVgMO7zXrctvfcKXl4E
	Ql/p2h8SxGZDpIXh0nHdfLFwCHYjxsSLxeozfa+IrBDlwR68izpJ643NBSiNexqHB0AtyDXbD/F
	41Sscgb4NmEamU8nOiWI1wh4XBtz6wO2mx8ZYddKOww++d9DIe0NOsZ8IJ8E/FaW9Tj9YzFNCjv
	a09huj0NszVpZxKBFWKK/9pnQOBpOBJP2D8BZGgymwLC1izgDjnT8UGXBmBR1FAOX9n3MWIqE/d
	A1zqxzy7tKBAvH8EPsMtkZsnNp8HcchkW4J2BLlj6YOi4R1D2d3FZqHdxWPb1KWsPrBkGUUTAE9
	yMczHIwBEzYYDjBMpkwpsqt6ZpUXPerYJWl1TnjwzT2YqHLg+vHAb5qq7c7IuPj738jq8ylyHNF
	rVzeA6psmVLzmQYV/zZw
X-Received: by 2002:a05:7300:7316:b0:372:b76a:6fba with SMTP id 5a478bee46e88-37686278be4mr1451750eec.14.1794349376287;
        Tue, 10 Nov 2026 14:22:56 -0800 (PST)
Received: from a1-free ([161.33.196.121])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37520512b6asm9165030eec.10.2026.11.10.14.22.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 14:22:55 -0800 (PST)
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
Subject: [PATCH 1/3] perf jevents: Name the metric when a MetricExpr is missing
Date: Tue, 10 Nov 2026 22:22:48 +0000
Message-ID: <20261110222250.1864777-2-takano32@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261110222250.1864777-1-takano32@gmail.com>
References: <20261110222250.1864777-1-takano32@gmail.com>
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

