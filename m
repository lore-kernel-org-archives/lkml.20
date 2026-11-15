Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794702916;
	b=e7Vn2N9MtzJgdvG6fGpTSo5BZA7pdpN9/G/KXhsq7OMf2iVWWrehIsyoDDTcsZT1GVZl
	 6gLprfFcSIPvfCWLvwH5ZEiA735Y60zExw4s6QvS/bea2HehjZVqltG85/uxdJrAcRQhj
	 hLDBzcq/N05bbJnX6JYI6h8hp6VvNOt0YfNCIHdsYFwlZT6FpdCjx49zfo7zD5jtaZitq
	 hCZWTrEc/u4ViWdZ9skD+30Q1/GaAxp8Xcf6J/loskrcLsv+keW8hMrddFtsMoqpZbd6I
	 XRLPiRSk1xCVzNgCncmFX9Kopr5RBHwOIBNyKqVm2E1CO8FupQBT8tneExLfUth4dLQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794702916;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=2nYIukBoRE89MLYt2M3FDs+Pz1fZECVW1PjFbco9lqI=;
	b=FWnJ73qDN8Se8B1uEI9fyNE8D/UM13Uw9yQtAB5oBPEmPL6LmVyy8rAh74vRy9DiMAN5
	 Cfmm4eTbrTzAnf3atT/ACoj2GA+tDOVbP2I7sThcg9QnoCYkbwqOzR8Y0TCtnxLwMyZKt
	 jeGxPWn+P8jNHs3Zdv4vNpv8Ch/gP6Q2nt68xW7Ivo69tLEJgP1JZlpNFrqVpufewXJPR
	 8IHINYp4o/7kMIJ7kHJFONYu6ThIoczqN/Pf93L/7bndlnB3g6p8aS2XYpO2UabR72Ca4
	 81WXVh1vkWgEgOdPxxZKSl+5+4Dt0gtZjZI/LeAZsYoaEJceiidK5Ng8nmR8QEzzrRA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=alRD4mQZ;
	arc=none smtp.remote-ip=74.125.224.43
Received: from mail-yx1-f43.google.com (mail-yx1-f43.google.com [74.125.224.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3DF7606A323
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 00:35:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C3DF7606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=alRD4mQZ
Received: by mail-yx1-f43.google.com with SMTP id 956f58d0204a3-677bc4704cbso2318163d50.0
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 16:35:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794702915; x=1795307715; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2nYIukBoRE89MLYt2M3FDs+Pz1fZECVW1PjFbco9lqI=;
        b=alRD4mQZf1yKAdYgBXU+nGRJF2V7dX6f6n7iipUFWPAHMK4eBhGkTz5n52PIMkkChB
         SODXx7LxHfLE3n+yAPm9PYfFKr9myDDH/NNqjm8jeKs842mMQIyF7UrpHWKmS7SKRVjy
         LE3tbvWRxWQWTyQWhL4AjaEOwYJy0aJC6AJd/mnLGUWvouBUYQcJYRaSVf5/41UPHJgK
         B4wVoFCcjilp8lt7V4nmJNVBwXI+JdxLgVViyiVY7/6fq0sR5x4OHsv8uPhhbkO0oU8f
         bgnt1B7/IZzX6DEj0GU/QPjkLLdBzJHIjk9QDcAkEZTxagfaEVnnq4EI86LoB6jWvsyQ
         pv8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794702915; x=1795307715;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2nYIukBoRE89MLYt2M3FDs+Pz1fZECVW1PjFbco9lqI=;
        b=V5NTCXAqze9mR6jUXhIp1tkmWrFUGPF+MFnxC5JuBwwFmE7D7xu8qoPD4+s6p9a0Tv
         NuynZtDKXJoMUxkYrMDj9S0vsOQinMHB4HStbDooRhXDXSj1VPNp3qsEulHQfcRwWMRS
         GjcoZTC3eF+crzIyKc7Hx+QQEzgKif0mPF3LcpY/HmKi/3ob+DJpQENC5zvWEFsJ4/IP
         SWV0jtvAL3IVNIPDX7J0JLMFSiAfVa0uKLBNfSmbmBA/Y7IfQyldtZR2N9iJahHd/0/+
         RB7oq/lnOZtNNaPfaphJyC40/WbOnJf2ZNPk6MZlR4w2RJ0ztuJEyxfzbhRGxMJDW4i1
         eXJA==
X-Forwarded-Encrypted: i=1; AL+hErE6MXEhpCkaF5Nzlcj0T6bcS/8cvUz5eoiFhUevq2JHvzeEDsYeeF3iTJDXQbvfb0iKSTV4OSH00wgipXE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/3Y2vKOpN3W83pS3TVOy2souSk4VrvCwEzjUeO0Np9bS1LyYoB
	lUHYsrDc2+z9/K1SHaK/NpkufLd6LgmxBdUdLQwpczmhqlHZ6W/X2t0r
X-Gm-Gg: AYBFou23g1DUNnywcWUvSxUb+DhhHCcGOAaQIX4e155kF/3yLR8aoWf3YMVkXRmNOxS
	oK2EH5KrbGieVzbHxRTshfnatvkl/J2z6D1egJynYnADxDjBd2V6EvSTNK1aPqyUaaZP7RHs+Uz
	XYslomGcYmAQxtCNmPIxgqiMYpzJGql9z7YBkvDQZBBFmC2FbLtRbmPH7vmN43AhiK/pb0WhEb8
	4dHsAmbx3+lMrYjmf1b22nt4hXkb69JiFUMcIvf5UvMhSUR9G2hD/87J2JKtoYHUyKKIVtYKv3I
	ToNn0UnisFnVRn38N7pT6q5Cx9iDrvaiZoQQaypEQu5y/b1NQuMltm9g6k2Ett2gqhTAXWbJBEX
	G5NpioJZk35wm/Pw6O/45855Or8lE8DsKAVsruykimyA0n83CYrLUvdBaRNu4QmvXHzLh7UqVux
	5sUoQWgLzqN6V3/vRKJTYyKPNd2+gJTg1fuor1G0GCZotqWxo85cZijR5pRRqoDIdVSZR5w100B
	ZZfiG6dNxe6XagkyoPW0bpjBlSV+60vuodJLjc9K+FstaneIg31Ffl34oWFdjoewx2ixi4F8iSO
	PjtUZZbUPw1akDLTbFeBml7psdu6ojS0J4FBm8ZWSqxv7NvahCrbCRu04ZQNEmQI/AOiwr1n465
	+ig==
X-Received: by 2002:a05:690e:a47:b0:67d:a95e:27d2 with SMTP id 956f58d0204a3-67da95e2a0emr689331d50.84.1794702914732;
        Sat, 14 Nov 2026 16:35:14 -0800 (PST)
Received: from codey.attlocal.net ([2600:1700:22f5:3930::a])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67d8a55b09esm6013734d50.6.2026.11.14.16.35.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 16:35:14 -0800 (PST)
From: Lalit Maganti <lalitmaganti@gmail.com>
To: acme@kernel.org,
	namhyung@kernel.org,
	irogers@google.com
Cc: adrian.hunter@intel.com,
	james.clark@linaro.org,
	jolsa@kernel.org,
	mark.rutland@arm.com,
	alexander.shishkin@linux.intel.com,
	peterz@infradead.org,
	mingo@redhat.com,
	linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	leo.yan@arm.com,
	Lalit Maganti <lalitmaganti@gmail.com>
Subject: [PATCH] perf tools: Stop using the deprecated argparse.FileType
Date: Sun, 15 Nov 2026 00:35:07 +0000
Message-ID: <20261115003507.1872482-1-lalitmaganti@gmail.com>
X-Mailer: git-send-email 2.56.0
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

Python 3.14 deprecates argparse.FileType, and pylint 4 warns about each
use of it. The perf build runs pylint and treats its warnings as errors,
so the default build fails:

  pmu-events/jevents.py:1494:26: W4904: Using deprecated class FileType of module argparse (deprecated-class)
  pmu-events/jevents.py:1496:33: W4904: Using deprecated class FileType of module argparse (deprecated-class)
  tests/shell/lib/perf_json_output_lint.py:23:31: W4904: Using deprecated class FileType of module argparse (deprecated-class)

Take plain file names and open the files after parsing, as the
deprecation warning suggests. The output of jevents.py is unchanged.

Fixes: 5fe83fb352c8 ("perf build: Make pylint build test opt-out (NO_PYLINT=1)")
Link: https://lore.kernel.org/linux-perf-users/20261018070110.927636-1-lalitmaganti@gmail.com/
Assisted-by: LLM
Signed-off-by: Lalit Maganti <lalitmaganti@gmail.com>
---
 tools/perf/pmu-events/jevents.py                    | 12 ++++++++----
 tools/perf/tests/shell/lib/perf_json_output_lint.py |  8 ++++++--
 2 files changed, 14 insertions(+), 6 deletions(-)

diff --git a/tools/perf/pmu-events/jevents.py b/tools/perf/pmu-events/jevents.py
index 080e04b51b8c..99b9813ca242 100755
--- a/tools/perf/pmu-events/jevents.py
+++ b/tools/perf/pmu-events/jevents.py
@@ -1490,11 +1490,15 @@ such as "arm/cortex-a34".''',
       type=dir_path,
       help='Root of tree containing architecture directories containing json files'
   )
-  ap.add_argument(
-      'output_file', type=argparse.FileType('w', encoding='utf-8'), nargs='?', default=sys.stdout)
-  ap.add_argument(
-      'output_string_file', type=argparse.FileType('w', encoding='utf-8'), nargs='?', default=None)
+  ap.add_argument('output_file', nargs='?', default=None)
+  ap.add_argument('output_string_file', nargs='?', default=None)
   _args = ap.parse_args()
+  if _args.output_file:
+    _args.output_file = open(_args.output_file, 'w', encoding='utf-8')
+  else:
+    _args.output_file = sys.stdout
+  if _args.output_string_file:
+    _args.output_string_file = open(_args.output_string_file, 'w', encoding='utf-8')
 
   _args.output_file.write(f"""/* SPDX-License-Identifier: GPL-2.0 */
 /* THIS FILE WAS AUTOGENERATED BY `jevents.py arch={_args.arch} model={_args.model}` ! */
diff --git a/tools/perf/tests/shell/lib/perf_json_output_lint.py b/tools/perf/tests/shell/lib/perf_json_output_lint.py
index 8cde22ac9d97..1324dd8c9ec6 100644
--- a/tools/perf/tests/shell/lib/perf_json_output_lint.py
+++ b/tools/perf/tests/shell/lib/perf_json_output_lint.py
@@ -20,10 +20,14 @@ ap.add_argument('--per-die', action='store_true')
 ap.add_argument('--per-node', action='store_true')
 ap.add_argument('--per-socket', action='store_true')
 ap.add_argument('--metric-only', action='store_true')
-ap.add_argument('--file', type=argparse.FileType('r'), default=sys.stdin)
+ap.add_argument('--file', default=None)
 args = ap.parse_args()
 
-Lines = args.file.readlines()
+if args.file:
+  with open(args.file, encoding='utf-8') as f:
+    Lines = f.readlines()
+else:
+  Lines = sys.stdin.readlines()
 
 def isfloat(num):
   try:

base-commit: a1c3b14c28ebfa79dd56e2743c2fbad0c02a7146
-- 
2.56.0

