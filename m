Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794163619;
	b=qvXyhjkexS+UoCi7D0dHNTz98+1i+3vpZ+Eq1La2Xd0Yoy+JX2HBJ7plw3hv4sFxnyBs
	 8YceUEZzIFwm6PmeyJpPCEObtFJwG5g3xlpFIciYvi8NRzVXWoKaxuZYdXo+iWJ1OeO2G
	 b8L0GWWd5c160GYb3012fXqEL/wT2ZiFyNuZg7cdxGQF/Vh5wZWbQmEDUg52eAh8M/pV+
	 eBYY3DmmXOQPnzYfnx+/AbD0m7D4wXZs8tJKgQ0lehXq/21bDvn5R3jlRDTtdZZ13IRok
	 4zwkd4lqa7QtLyOTgY9kmbUYIVZ/1QUMCeigZ65JrC0tKkrep7jRvAAr484dBQrmZmA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794163619;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=KLhGHJD0w6qogzd6hlhJL13wlPNhn8Vr3qPOak0i+BQ=;
	b=dJkrcRh0y2HPleTlgx7B6NklR1SqUeRnWskvIWoOVOu999OWScIUuW5VvZu6Yyy1WZri
	 GcIlCvIMEtANhENshoY7yMh55GfEQ3TIj54wxVHNE7WHsmkwTKvTcy4Y9OF7XZtOF4TWq
	 RRuj8yFcWJLv7cC8ZXAHPl41dTVZQxlOG8JLqJngV8mBp2zBUkqEKIoQakEFyaxJmhwTi
	 NMNn4d4PaUM6xXnzAC7VNjRY8g07BVXBdoeLpujpKIlXtg4O2hs1Srjq5+f5LC6NzW34C
	 idPu43JpmFfQqWjgMIgkOFw/miaCSlnxUqWFVdDO2qyKhqvsH3LkrdPSIVNzUjM4ZSw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zwwakEJ3;
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F29AA606A31C
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 18:46:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F29AA606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zwwakEJ3
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-37071c0f42aso471462eec.0
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 10:46:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794163618; x=1794768418; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=KLhGHJD0w6qogzd6hlhJL13wlPNhn8Vr3qPOak0i+BQ=;
        b=zwwakEJ3ORwCSEoOOvKxzaCPPcXZpNTTTJ8On71fhGEVimwf1IDpmnBNmpJoGsWSfp
         HuR6bNMRhUT5ng/KjEXoi7RmHX7ikWEGWB5FHs77R4Z1O5rL1VYSIbgC+9lVEENVvV3b
         DUGf1ODIqgxhBQe+sIpm/FR0TbrC1AUcO0KR3JEbNrUjo9tNBwwSlbPpG/MXtynHqVYg
         hJ8H34JmaJE6pdCs05qNL+UAoY+RIcXmEBlfJRC/hsqro4Dwc0iRxuQRKoLAO0sQ49FH
         Ov8Yhoj7zkXIULPuEN8/0PXthmuQ0HptsYZvD/FobPWC9fXXiJlKkj23l8cWPx+1gsZ0
         O53A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794163618; x=1794768418;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KLhGHJD0w6qogzd6hlhJL13wlPNhn8Vr3qPOak0i+BQ=;
        b=tHSp1GfqZ0Jdd4d/ETT481jEYoycFoNIpsc5oYJQVAJSa6/P36zMJYwOicbwix73rZ
         BwcRbgL0POpVK8jZ/fVfWg1uakvq9AP73whvt8kGhXuwaQmdNIhT9XGy1MHKTlGSBN2o
         Lot5x/LHZ7X+Drqh7/LJQYzdHknLZ913cpo/HEiT94z0CVkgm3LohpcnXNts0E3LEbxz
         VMPUxO2s2aBiBmbnvSyRGz8eqtPI8lRTuCqbRcA5RfdSUoHCro6ecoEI0lpVq4z9ceEi
         OF9u0d9S/s63YPS5LxVRnhpPZtWM4/7GBuS9Z8m1JIa4yFme7G+Do6yiutFuUrDpqmie
         nFew==
X-Forwarded-Encrypted: i=1; AL+hErGmgeM9rciW/HRZ8bZGFgUYIyIC8q+gHKJktVrLTM+jjwZW3AhiZsPaku0LDb6AIP4yDZ2a8wd9EgqnLDs=@vger.kernel.org
X-Gm-Message-State: APuU4Z/9GlwxKzAYei4+QrBPfE3FzyuxC3kiqAgU5a8bQVp5B5VrPaaQ
	o0/rKlpc1Sw9SlBOUc4OO9bIEH1hFOXqGVmNrudOAeBg8SbodjdP5Dsw
X-Gm-Gg: AYBFou3mulTZCKxyWFhwiGxyUhQNEkzlb8gvh2ibj9BDdrsKgpWj/d0Qt9KX+xw0W4S
	jc60TVU5D+bxZzaiaMpfitCR8Ebq08Sv6LUnizZzxHUQaibO+l4z4hIgpaB2SYacEo5d/Nadwts
	ZsY35gFAvffIlFQcC9z64PrcTD8+w5L6z2Ti4CAltrE9TTuPJhg2uIcVZTEThO6Yre0Jih68bKm
	Rk9DOTH98AvX6vN3S8oZvDn8YF+hM3S8QILJ9CSRbSVrie1FP+il24NBXOZmHdedbNywNV25hyY
	MdbXvZa9QSF1rMvV/WFfUWnEzKzIktzBBjG6jCNmjFfcYCrHE66t0AAjaPlMYX9IcBqEjMTd9VF
	QjvlyF+coHh18RxLaJNpDim3dBkXZL19muSin0sQfWKMJhgPqtFM7NWaMnygfABtBATLIRwrBP7
	MPpdLWVHFuYBRuDHwMhi1ukpWRtEjqi8x0V++70FP09cIeaB1q2iabhMgWvq/lomhfxFn1Upe0B
	sCWTUr8/88K9xVIx7OgLDLeKCq2RkNJb8SChtlKDi6TZXvOgyuBGysirl9s8E0K+Wi7FBPi67zQ
	sTVJCt+8JCbANbcwOidL4hqFgkorsWwacibMcq491w==
X-Received: by 2002:a05:693c:87dc:10b0:36a:15cb:30bf with SMTP id 5a478bee46e88-3725d1a5eabmr4318401eec.13.1794163617977;
        Sun, 08 Nov 2026 10:46:57 -0800 (PST)
Received: from a1-free ([161.33.196.121])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-372665db733sm6348252eec.23.2026.11.08.10.46.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 10:46:57 -0800 (PST)
From: TAKANO Mitsuhiro <takano32@gmail.com>
To: linux-perf-users@vger.kernel.org,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>
Cc: Ian Rogers <irogers@google.com>,
	linux-kernel@vger.kernel.org,
	TAKANO Mitsuhiro <takano32@gmail.com>,
	James Clark <james.clark@linaro.org>,
	Shunsuke Nakamura <nakamura.shun@fujitsu.com>,
	John Garry <john.garry@linux.dev>,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] perf vendor events arm64: Fix typos in event descriptions
Date: Sun,  8 Nov 2026 18:46:54 +0000
Message-ID: <20261108184654.3811267-1-takano32@gmail.com>
X-Mailer: git-send-email 2.53.0
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

Six entries in common-and-microarch.json spell Statistical as "Statisical"
(the SAMPLE_FEED_* events), and one entry in the Fujitsu a64fx table, the
L2HWPF_STREAM_PF event, spells prefetcher as "prefecher" in both its
BriefDescription and its PublicDescription.

The SAMPLE_FEED_* events are inherited through ArchStdEvent by the
neoverse-n3, neoverse-v3 and t410 tables, so the misspelling reaches those
three generated tables.  The a64fx pair appears once, because the long
description is dropped when it equals the brief one.

Spell the words correctly.  Event names, codes and expressions are
unchanged.

Written with Hermes Agent, an LLM assistant.  Running jevents.py for arm64
before and after this change removes 12 occurrences of "Statisical" and the
one "prefecher" from the generated string table; perf was not rebuilt.

Fixes: 994256a79867 ("perf vendor events arm64: Add N3 events/metrics")
Fixes: 5497b23e870c ("perf vendor events arm64: Add Fujitsu A64FX pmu event")
Signed-off-by: TAKANO Mitsuhiro <takano32@gmail.com>
---
 .../pmu-events/arch/arm64/common-and-microarch.json  | 12 ++++++------
 .../pmu-events/arch/arm64/fujitsu/a64fx/other.json   |  4 ++--
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/tools/perf/pmu-events/arch/arm64/common-and-microarch.json b/tools/perf/pmu-events/arch/arm64/common-and-microarch.json
index 144325d87be4..c61d6c0ceb4f 100644
--- a/tools/perf/pmu-events/arch/arm64/common-and-microarch.json
+++ b/tools/perf/pmu-events/arch/arm64/common-and-microarch.json
@@ -1340,32 +1340,32 @@
     {
         "EventCode": "0x812A",
         "EventName": "SAMPLE_FEED_BR",
-        "BriefDescription": "Statisical Profiling sample taken, branch"
+        "BriefDescription": "Statistical Profiling sample taken, branch"
     },
     {
         "EventCode": "0x812B",
         "EventName": "SAMPLE_FEED_LD",
-        "BriefDescription": "Statisical Profiling sample taken, load"
+        "BriefDescription": "Statistical Profiling sample taken, load"
     },
     {
         "EventCode": "0x812C",
         "EventName": "SAMPLE_FEED_ST",
-        "BriefDescription": "Statisical Profiling sample taken, store"
+        "BriefDescription": "Statistical Profiling sample taken, store"
     },
     {
         "EventCode": "0x812D",
         "EventName": "SAMPLE_FEED_OP",
-        "BriefDescription": "Statisical Profiling sample taken, matching operation type"
+        "BriefDescription": "Statistical Profiling sample taken, matching operation type"
     },
     {
         "EventCode": "0x812E",
         "EventName": "SAMPLE_FEED_EVENT",
-        "BriefDescription": "Statisical Profiling sample taken, matching events"
+        "BriefDescription": "Statistical Profiling sample taken, matching events"
     },
     {
         "EventCode": "0x812F",
         "EventName": "SAMPLE_FEED_LAT",
-        "BriefDescription": "Statisical Profiling sample taken, exceeding minimum latency"
+        "BriefDescription": "Statistical Profiling sample taken, exceeding minimum latency"
     },
     {
         "EventCode": "0x8130",
diff --git a/tools/perf/pmu-events/arch/arm64/fujitsu/a64fx/other.json b/tools/perf/pmu-events/arch/arm64/fujitsu/a64fx/other.json
index 10c823ac26cc..6fa2936e427d 100644
--- a/tools/perf/pmu-events/arch/arm64/fujitsu/a64fx/other.json
+++ b/tools/perf/pmu-events/arch/arm64/fujitsu/a64fx/other.json
@@ -162,10 +162,10 @@
     "BriefDescription": "This event counts non-allocation type prefetch injection requests to L1D cache generated by hardware prefetcher."
   },
   {
-    "PublicDescription": "This event counts streaming prefetch requests to L2 cache generated by hardware prefecher.",
+    "PublicDescription": "This event counts streaming prefetch requests to L2 cache generated by hardware prefetcher.",
     "EventCode": "0x233",
     "EventName": "L2HWPF_STREAM_PF",
-    "BriefDescription": "This event counts streaming prefetch requests to L2 cache generated by hardware prefecher."
+    "BriefDescription": "This event counts streaming prefetch requests to L2 cache generated by hardware prefetcher."
   },
   {
     "PublicDescription": "This event counts allocation type prefetch injection requests to L2 cache generated by hardware prefetcher.",

base-commit: d48723711bae9b8cdc56719c448ba42fef28cbee
-- 
2.53.0

