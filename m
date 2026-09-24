Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E56AB4AF159
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 17:04:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790269495; cv=none; b=GeauQtdZF234tCS4lp9U9AgWDrTbTBPz1/HNsDVQz24XI3xwZAXMdZSBbYP7+yBFBWxlpO0yeWDNV554Cgqzk/WpqHsDfH/HsIFTanJviIIvYRn6aXncPsyMOG06Dk2lUczSGAzl7vitGs7UbUw2gqRUSVyJiun2uWf4Oo/U7Sk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790269495; c=relaxed/simple;
	bh=zHnRZ+fpQuVPCHcqMCSLhDrr6++nIoQY4LcK+JEb2fM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ccVni7LRps4BHUqYEXqDDxZzkuayggB21DEdbx+VRtB1tq35qO6nuru6jSg4bjTEUVu2q52HQqAWYkooscZLVhJ4gpJitineFPyU6+6gD3hOX5m61SqPpHUBltRyrHycSbeugsmbgMNV7Iy+zCfZORlwLruwU3LcfC0KbLrc+dc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=elXfbYK8; arc=none smtp.client-ip=74.125.82.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="elXfbYK8"
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1437272611eso14249c88.1
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 10:04:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790269493; x=1790874293; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ISBPYfoRX1y2wna029OoWmealtEkIJKMINn9ddsuUrQ=;
        b=elXfbYK8SUY6ij7YiovTk+oo6/PpsrF7czUweAU8WGYoIeSA5VlNVIH66sKFKG3yax
         bpojZmiQEZSl/AiXy5p6cJezPtZNajCc/Woqtth9pFfJbfOg2vHk/Lcib6qw1WVSmaEX
         iou3DgEAvTxDag9sHsuMLlG5ZGMWcg75d4HDo6/e9Jk3HmrHas3pr+McyfLjLWWwItLZ
         SCj2T1onFXSXQAeBU0C73CuKeq/FKcdv4WMlw+FyJ0rGB9wnspa+q+hR9tncE6WfBXdY
         gncATg6nZFiWSLdN6/SGPhczCtc/0kp70qUOZwiOM8WEIoZLftIRfSa0Db7eaRJwIpWu
         Ls4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790269493; x=1790874293;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ISBPYfoRX1y2wna029OoWmealtEkIJKMINn9ddsuUrQ=;
        b=zpYd25QDNFjnblwX1QXxuhvLsHkL1Bvot5FW9HPr8M6GaN5oU+L2HOh/Q7P8njoQba
         ppYbxbdTNC3VZOkhiPpdyFIDhL1ua7ZlqqGlSIpoKXv+sgAfnbs4VC7qV8xgt/nUm6il
         jf4o96q2cM3JUJplvI9hKPMd8oyL1G/c7iWcg6WLFV92Ix4rWmtiZVMgpIZ+Lr3G95N0
         2hPQCasSLIZ0Ai8U0AHZQbAV4hkP3MitAcY6DhLBtL6LraoZL51IkuDubQhrX3k+OZpi
         GbKRZrO6x9hRV1BL0XReUwWHq+fhZ0tFEiyC+ALqJCtoxQ3VUBc/0i4AnOkLegn604XD
         4z8g==
X-Forwarded-Encrypted: i=1; AKwUvByia0w5rjGNcQIjVx5wsNQaBgSgHhuVJlK/IdK2JR+VG+Uft03vYjISx9whoZXeDHWIf0dpLA0Wp4u/lOY=@vger.kernel.org
X-Gm-Message-State: AFuF++kMi7RF9j95U6WBjMmfYuQWp7MwxsuIHwQVYmsZX521cvBsXBqX
	fefGkvrpIwKqVx2lO74Pb/uDl5CEh2lU4wo1Z4IuIFwNrN2NwZIbgmEFmPVX8KltwgmzIvJ54gD
	i21mFa/8NoQ==
X-Received: from dlag11.prod.google.com ([2002:a05:701b:250b:b0:144:d025:68b5])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:701b:4554:20b0:143:7001:7640
 with SMTP id a92af1059eb24-14503fd2247mr2519203c88.39.1790269492538; Thu, 24
 Sep 2026 10:04:52 -0700 (PDT)
Date: Thu, 24 Sep 2026 10:03:43 -0700
In-Reply-To: <20260924170346.3872848-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260924053645.3555041-1-irogers@google.com> <20260924170346.3872848-1-irogers@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20260924170346.3872848-24-irogers@google.com>
Subject: [PATCH v2 23/26] perf vendor events intel: Fix lunarlake umask encoding.
From: Ian Rogers <irogers@google.com>
To: irogers@google.com, acme@kernel.org, dapeng1.mi@linux.intel.com, 
	namhyung@kernel.org, edward.baker@intel.com, perry.taylor@intel.com, 
	eranian@google.com
Cc: adrian.hunter@intel.com, afaerber@suse.de, ctshao@google.com, 
	james.clark@linaro.org, jolsa@kernel.org, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, mani@kernel.org, mingo@redhat.com, 
	peterz@infradead.org
Content-Type: text/plain; charset="UTF-8"

Fix UMaskExt that was wrongly encoded when the UMask was 0.

Fixes: 23878069de30 ("perf vendor events: Update/add Lunarlake events/metrics")
Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/pmu-events/arch/x86/lunarlake/cache.json    | 3 +++
 tools/perf/pmu-events/arch/x86/lunarlake/pipeline.json | 2 ++
 2 files changed, 5 insertions(+)

diff --git a/tools/perf/pmu-events/arch/x86/lunarlake/cache.json b/tools/perf/pmu-events/arch/x86/lunarlake/cache.json
index 5b350233a5e1..c77040e87639 100644
--- a/tools/perf/pmu-events/arch/x86/lunarlake/cache.json
+++ b/tools/perf/pmu-events/arch/x86/lunarlake/cache.json
@@ -848,6 +848,7 @@
         "EventName": "MEM_LOAD_L3_MISS_RETIRED.MEMSIDE_CACHE",
         "PublicDescription": "Retired load instructions which data source is memory side cache. Available PDIST counters: 0,1",
         "SampleAfterValue": "100007",
+        "UMask": "0x100",
         "Unit": "cpu_core"
     },
     {
@@ -901,6 +902,7 @@
         "EventName": "MEM_LOAD_RETIRED.L1_HIT_L1",
         "PublicDescription": "Counts retired load instructions with at least one uop that hit in the Level 1 of the L1 data cache. Available PDIST counters: 0,1",
         "SampleAfterValue": "1000003",
+        "UMask": "0x100",
         "Unit": "cpu_core"
     },
     {
@@ -1093,6 +1095,7 @@
         "EventCode": "0x44",
         "EventName": "MEM_STORE_RETIRED.MEMSIDE_CACHE",
         "SampleAfterValue": "100021",
+        "UMask": "0x400",
         "Unit": "cpu_core"
     },
     {
diff --git a/tools/perf/pmu-events/arch/x86/lunarlake/pipeline.json b/tools/perf/pmu-events/arch/x86/lunarlake/pipeline.json
index 8be3ea336bb8..5d8bd972d463 100644
--- a/tools/perf/pmu-events/arch/x86/lunarlake/pipeline.json
+++ b/tools/perf/pmu-events/arch/x86/lunarlake/pipeline.json
@@ -190,6 +190,7 @@
         "EventName": "BR_INST_RETIRED.COND_TAKEN_FWD",
         "PublicDescription": "Counts taken forward conditional branch instructions retired. Available PDIST counters: 0,1",
         "SampleAfterValue": "400009",
+        "UMask": "0x100",
         "Unit": "cpu_core"
     },
     {
@@ -474,6 +475,7 @@
         "EventName": "BR_MISP_RETIRED.COND_TAKEN_FWD",
         "PublicDescription": "Counts taken forward conditional mispredicted branch instructions retired. Available PDIST counters: 0,1",
         "SampleAfterValue": "400009",
+        "UMask": "0x100",
         "Unit": "cpu_core"
     },
     {
-- 
2.56.0.rc1.315.gc6ed9934b7-goog

