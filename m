Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com [209.85.161.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69A5D33BBCC
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 22:04:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788991492; cv=none; b=W+DfTxfolvvHP1btC+aft6EHtYboCodEsjfYxUaEv7oebgvIRZ8KOCPTyTgSZFTXGn109PK/XEoDWiS2rLQafKIqFGY+7Tix2eaIapxMM2p3BIJuAFvfge21QcNco2yucxtN/809GVMC5syjpvxUhSM4Q+OJ7F30HiWdAHrfz2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788991492; c=relaxed/simple;
	bh=ad+bNZ4USmKgMq6SkQBi3gLPmyVi9iSEmIqF/cKXwos=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Content-Type; b=UcqH4E070b2BZ/iNP0lsb0dPQhhZGRUW4E/Ubtp1so9hXDG3gKWqmK1/NTg2P/utkPD6rfLY9usL2/Z6GvdNnJdd7jlmswcvKgTjW4xSnCZV1hwbPPugznvyfmxwMb9ghy9q3xhKDQwUUlwaNhe1N1MOVQFbvzFFte1M/KsUiyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=GpDK6hxj; arc=none smtp.client-ip=209.85.161.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="GpDK6hxj"
Received: by mail-oo1-f72.google.com with SMTP id 006d021491bc7-6b1b19eab8bso3813471eaf.0
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 15:04:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788991490; x=1789596290; darn=vger.kernel.org;
        h=content-type:to:from:subject:message-id:mime-version:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=qma9gw1P9kNpAUOitunBhFwjdFWCVEpI1YruD7FlFBE=;
        b=GpDK6hxjSDMQbQqCj0ztrii7RdGS6vHsuBVuGark4SJ7u4TF/fSZKGvD91gesXlLR9
         UUbx5Wn2GnIWkTidxyU/a9UKgmrSQ6zf6uXsaurACW2/hlyMPG9+y2pwf9qhj9ghjzyw
         ieS9eZN5+OomWNFUbyNus42S35CXEkXxqYiCd+e2PHnEbNg6RB3CBrrqYH+ajoGtdQzc
         nxvCCC8bp56NYhb0+9a+CMX1ZKMnCPIsMhHJX4pJKiuG+Vhq+eVyY/j4I+6ai0KvdDsi
         ELYY3oRanXkqwsEFzp04W9htx4qrcwTNrgeFaWhtY/2+8XkQD55XGUXat8xnlZQy5sIh
         vlwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788991490; x=1789596290;
        h=content-type:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qma9gw1P9kNpAUOitunBhFwjdFWCVEpI1YruD7FlFBE=;
        b=Ct7l+Au/KhEq+DU2I4v7jAF4wp6xmYdczgidcRURw1yZFE1U5ZmUBNuD3Kqtezj5Xm
         TaziOSxBH2i2b9Uh1j3czv5nwEs3GCg1C0ifXu2WAI57GwrnTTU4jglF4xrN2vUsJEcr
         Gp4n4ZtLLvo4QHUtVd0IpEfebE6XMAhC8z3NW9bh+kpvPndVGLFHTBOw3UnI9WBm+RXN
         qYz2b6R2lish1Q6+N05i3iGcPPK5v5coWBsL0vn0Du8dJXTN+aA7jvLSwxfPlxLFKeFw
         BGjix1vWmUkvotEIm4YnEbu/+KxPO0439Rca2d3iFD+YoDpngruTX18x5s6joyxldQUZ
         /oCg==
X-Forwarded-Encrypted: i=1; AKwUvByAEXugK389bHCagh1ub7qOmPfQE9JgcFLNJk5cNIrZAvbR+q8idTxZ7/tn32+65PRJXcAv4eg8H9ndn4k=@vger.kernel.org
X-Gm-Message-State: AFuF++k00TDHurhap9rBGAPtDvCZWUYhucPsKCPCsiZiZ9ej+MDsCw8k
	nUd6oJiFRPl4Gtgl3j8eDM6YdgkaCk7xtNKpC9BZOUnVpv2Dsy37+1kjzswkIlcWG37HXKjoh6m
	XCA/C9gjEPA==
X-Received: from dlbbt1.prod.google.com ([2002:a05:7022:981:b0:143:4d12:3952])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6820:561c:b0:6b7:8396:f3e3
 with SMTP id 006d021491bc7-6b78396f924mr12735908eaf.69.1788991489967; Wed, 09
 Sep 2026 15:04:49 -0700 (PDT)
Date: Wed,  9 Sep 2026 15:04:45 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.55.0.1003.g10538fe699-goog
Message-ID: <20260909220445.2117921-1-irogers@google.com>
Subject: [PATCH v1] perf jevents: Add mesh bandwidth saturation for CWF, EMR,
 GRR, SNR, SPR, SRF
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	James Clark <james.clark@linaro.org>, Chun-Tse Shao <ctshao@google.com>, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Extend the mesh bandwidth saturation's list of events to include
events from clearwaterforest, emeraldrapids, grandridge,
graniterapids, sapphirerapids and sierraforest. This makes the
lpm_mem_sat metric available for those CPU models.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/pmu-events/intel_metrics.py | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tools/perf/pmu-events/intel_metrics.py b/tools/perf/pmu-events/intel_metrics.py
index bc2b920d3a0d..9780bf978a41 100755
--- a/tools/perf/pmu-events/intel_metrics.py
+++ b/tools/perf/pmu-events/intel_metrics.py
@@ -1099,7 +1099,8 @@ def UncoreMemSat() -> Optional[Metric]:
     try:
         clocks = Event("UNC_CHA_CLOCKTICKS", "UNC_C_CLOCKTICKS")
         sat = Event("UNC_CHA_DISTRESS_ASSERTED.VERT", "UNC_CHA_FAST_ASSERTED.VERT",
-                    "UNC_C_FAST_ASSERTED")
+                    "UNC_C_FAST_ASSERTED", "UNC_CHA_DISTRESS_ASSERTED.DPT_ANY",
+                    "UNC_CHA_DISTRESS_ASSERTED.DPT_NONLOCAL")
     except:
         return None
 
-- 
2.55.0.1003.g10538fe699-goog

