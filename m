Received: from mail-yx1-f50.google.com (mail-yx1-f50.google.com [74.125.224.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCF22414427
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 06:53:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792306440; cv=none; b=Qp+92aaMvecSq3mrtBbi7z1H5IBsMi70SEwGkVHPfONfQGT3Q6KxI6WC70avAy//bJexVhixxwfWH40f2KMV03mzhqSFRdM5ui12Q/0ORr6hbYN1mXCj8XABdJ/foapZqH8F/Y4jig2igM/F+BmvPLX4IdLzmP7kuxZKiXr50CI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792306440; c=relaxed/simple;
	bh=7S4uqWXNA/0rrC4PU8M5O6F7tpEkhnCZRhG/kN4kCBc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VW4O4OPh9lJqCPm3KaQhtM2X6YjFReoTm53xx8xi2yxUJ8X4aTnxb466m76N4bcc9a7Z3QUQGmPFxvnt68KyCK6tc6ftVBnnMhpLL2XoQR1aYl3+eoNDOeKMek5PWvYZmgR1ecoQu1hVmr3F9F2/Bkiv4PAnhID18D+JCtW+rqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PzUGVFQL; arc=none smtp.client-ip=74.125.224.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PzUGVFQL"
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-677d35fd1d2so1163651d50.1
        for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 23:53:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792306436; x=1792911236; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=iW0ss9u7NkVSrB0sdOboIOy8rk2Qek+ClEv2cxlaXKw=;
        b=PzUGVFQLsQZEhqqEQG+khAAOfX60vkHVJPn52Bgso5gvrJH/Pgwej+opGRP7D34879
         4Dyp47aVML4WfvXldnGKUp6IkFlyyno74K7u3FeF5bNbR2r4Rx425fSBW9UT4PefGt/b
         GWEBdGn9bDMBNSJYdiaAV1vUnvk1R9SRVOJFHLTegcRWua0J/bN60svlk6yxoATxbm8e
         vOS+ZH2KqhGKVSDx0xgve8HvhTZivDm9lgsKHsSpO/sMO5jNCCPjPQVo3DY1yXZjXze8
         lPHCJhF6trlgV1lB3n44UuX/1pmhrAQEQNg+e/vp7YaqC2YA+v4WTpIiNc29GpiOCKbz
         k9sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792306436; x=1792911236;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iW0ss9u7NkVSrB0sdOboIOy8rk2Qek+ClEv2cxlaXKw=;
        b=I37aU4oSSDzI2wN2QG6vvLV5PSceIPBYyHlgxs/Yvg/0SUaK2H47oJQ4O8a0fjeHeM
         Cp6gAyuqkDHFE0IE+cddH4sHw4A5wRfjKUiMqcBwEuU+tfdU+pZERVDXHlGlAHHJaHZu
         2IJNfgtHTipvxEvETcH1wRxta/MNCM+p2ykaIjFUIZInhxwpClRntBR7gLis68mElixS
         bOAd229Ex8i0F7OipsYq7b7CqG9+RKtLnbU+yyym9pB+9xIACD2GpOCn+He4GrpfjyN3
         d09KYA6Ls8BIIBG3Qyqw3FbKhK5R2mAirPBQ8O4C0seJDO05BJRY6ehW5SwlEkrwNT73
         7rnw==
X-Forwarded-Encrypted: i=1; AKwUvBwO1G7W1p3c2wZVOz0/MaIa3YtxDJyOnfI9jTXye0qukEItGr+hc7v6d9s55U0wb3+ee2ItXk5AD6kEFSQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYJFaxh4m+mlIboVg9HCl7+5ga2oAOCDMzqiHlbvdcc9elpIHcMK
	cX2WEF2FkfCGWH2o+vHEkSqJUW1Nxxggs2gFoWfuImqv29TgDby7fBbg
X-Gm-Gg: AYBFou13U2PWJIKBbdq+scrEP/x1PJM2CnngQxza0KUuLVbzakdzIz0K0EeEUgtL9Ii
	h86l1RQdlyKkw9ACAOVTtoThn8bsDyvdMhg+oOTDBdQ2TdoM3QfelWDCF27yI3yFnwTaTGiwxXw
	D7yIj5j03gtcphyRt8sRQVJ9eeoV/LSGZUsRnQPUKlvQn4AHTIOkuITDYiT5NArdpYNEWqOq39a
	9Uyz1oaovYb2o4tPwRlNpEkE7ApbJr1HE9YyrKG/nuFI5VzPVi/PCd0MwfGBkE+9QT2kBRoLfxc
	rys9WT1czWL8El4VlkYlAkLuQ1xuNQD/RA46OgYdMOuuNR+BIWv4a6ddQRQeZkQH5VB7pUxOzlz
	u+jRdtzWqaGRm9rm37AgfcRS36ABx6n2UUUN3nB7zUEYkMjo+RtXc8NCfTvLeqSpFh5kYSV81Am
	vzfC33ReC+ThjoIRE7qGTpM/y3o1riIiRh1e6ifsb3nrZHGcml1CC9X1Dru9msarD1gWBDPgLli
	4W9hMcATrArHi5p6Z6xZ9S4nQ==
X-Received: by 2002:a05:690c:d82:b0:8b0:cdf4:94a2 with SMTP id 00721157ae682-8b0f21e0f5emr13238637b3.84.1792306436573;
        Sat, 17 Oct 2026 23:53:56 -0700 (PDT)
Received: from codey.attlocal.net ([2600:1700:22f5:3930::a])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b0e5726fb8sm27948317b3.7.2026.10.17.23.53.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 23:53:56 -0700 (PDT)
From: Lalit Maganti <lalitmaganti@gmail.com>
To: irogers@google.com,
	acme@kernel.org,
	namhyung@kernel.org
Cc: james.clark@linaro.org,
	adrian.hunter@intel.com,
	linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lalit Maganti <lalitmaganti@gmail.com>
Subject: [PATCH] perf pmu-events: Fix jevents.py type annotations for mypy 2.x
Date: Sun, 18 Oct 2026 07:53:45 +0100
Message-ID: <20261018065345.918176-1-lalitmaganti@gmail.com>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since the build runs mypy whenever it is installed, the perf build fails
with mypy 2.4 on 7 errors in jevents.py, e.g.:

  pmu-events/jevents.py:542: error: Item "None" of "str | None" has no
  attribute "replace"  [union-attr]
  pmu-events/jevents.py:563: error: Item "None" of "BigCString | None"
  has no attribute "offsets"  [union-attr]

Both come from wrong annotations rather than from code that can see
None:
 - unit_to_pmu() is annotated as returning Optional[str] but always
   returns a string, so JsonEvent.pmu is typed as optional where it is
   used as a str.
 - _bcs is set to None before the BigCString class is defined and only
   assigned an instance after it, so mypy types it as BigCString | None.

Correct the return type and declare _bcs with its type instead of the
None placeholder. The generated pmu-events.c and pmu-events-string.c
are unchanged, and mypy 1.9 still passes.

Fixes: b3e9c396d0ac ("perf build: Make mypy build test opt-out (NO_MYPY=1)")
Assisted-by: LLM
Signed-off-by: Lalit Maganti <lalitmaganti@gmail.com>
---
 tools/perf/pmu-events/jevents.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/perf/pmu-events/jevents.py b/tools/perf/pmu-events/jevents.py
index cc143f7e7cdf..080e04b51b8c 100755
--- a/tools/perf/pmu-events/jevents.py
+++ b/tools/perf/pmu-events/jevents.py
@@ -35,7 +35,7 @@ _pending_metrics: list["JsonEvent"] = []
 # Name of metrics table to be written out
 _pending_metrics_tblname: Optional[str] = None
 # Global BigCString shared by all structures.
-_bcs = None
+_bcs: "BigCString"
 # Map from the name of a metric group to a description of the group.
 _metricgroups: Dict[str, str] = {}
 # Order specific JsonEvent attributes will be visited.
@@ -262,7 +262,7 @@ class JsonEvent:
         return fixed[name.lower()]
       return event
 
-    def unit_to_pmu(unit: Optional[str]) -> Optional[str]:
+    def unit_to_pmu(unit: Optional[str]) -> str:
       """Convert a JSON Unit to Linux PMU name."""
       if not unit:
         return 'default_core'

base-commit: 1c90f0a3c8a1c4e38f9edd97af9e20848805a7fb
-- 
2.56.0

