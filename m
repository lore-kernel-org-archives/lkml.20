Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794028655;
	b=M9M+qvNkWSloHblhnms9Xdq5dLRdtDHun1oZ1i2rnvbP96zR6P2ge+Z48umfQcqqjHAU
	 0T40OoV1n4ozcCuz7cVHbqHy9NHxni9tGKI+hYhEU6M5ibqT1KhpIYzoIGovdmkRLU9kb
	 UUpQZdjULCYEo87FOs7U47s4OfG7Quw45JcmW/WyOxCJZ1CPaN0uXNfw/EDnOYw03MxgC
	 AmiAUdF+fskMfC66uzF2+vu99L8kBdDd0fDxiO4o/3NoZvEl1a2nKzIC1Hh/h5jUHxBuy
	 YspPuvobydw4vN16IBfAU/4Y4nCBhLzbKgiV/OoXmW1seY3k7Nsv1C9SE6AyFLHBB3Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794028655;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=vCTgyycIflOX8DIFUkseDn+OY9DjAvHPkZI6oEwJhxA=;
	b=3/wA2hgXAH2eJyMtqIT3VHoWDrIOjyA6wXsI9LAasvjhD8YaM0h/Dg4lTO4IzFMpiTNo
	 wH6tTHeOORgoA4pxAqeLmXlsk5nhFwfbBdLqfAa3GS3pb5p24ywrmeOGK+ZuS4z1XMNzx
	 XVKsI/VQ23HoW/zWpLaW0kUf/fiI1cSOF+rHPGL2ZB6aGEKdv6iQrm6aOk6hQtJBP88GA
	 Xi5xiyh6iKGzHYv4PbmKs+1XXpzJfGoLpepmzwsGmpEFEA9/LO6gTAt3mDxLx3SDwdFn8
	 mqy66RzJTf5ZEoX+Ev28IfMGCw31ifUcZMuiMbOlxJmzKOgbO8nJckcFZ6QLb1spoqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eqY4XhIY;
	arc=none smtp.remote-ip=209.85.214.174
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06D22606A332
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 05:17:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 06D22606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eqY4XhIY
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2e9d7791b00so9627615ad.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 21:17:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794028654; x=1794633454; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vCTgyycIflOX8DIFUkseDn+OY9DjAvHPkZI6oEwJhxA=;
        b=eqY4XhIYPBdLTeXVUr3lAIezwHA3rSnC5XoR/WMDyE7lVYc28tjb2e5k9SFBD+8nwY
         mPs42hvwm8pAqkcPYvr8P5Pgei6sf0XcB9HGchj8qwdmfLsuUlIiLwbalO19r8G01F64
         9ic5E0jNVCGMWlzo4ezbYsoOn6mJ8usyqR/3HTrxnA6Wg0w7PqULkcq9u5Zh3D0KEU6Q
         /7eAZcsXC42CHYTM3bVvZbb4qHJHlwMFEmRvuj5xQ6wF+62VgBnj1mdBoEx3RsenN8Ku
         zo47ziPsSAqGkj9GqQbsB8HB7zTFd4uLKFlCHoTI27WldHNyahN8RGVdYksXUCrEbQoZ
         19wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794028654; x=1794633454;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vCTgyycIflOX8DIFUkseDn+OY9DjAvHPkZI6oEwJhxA=;
        b=uZ1uv0tmJJze9BGBJS+ZgAfMGzJbOd0EJCO8YGLGrXvVwq3r0VY77u6XS2WVjKTDGs
         3v/KD/ViLDtQDl1C7krjfreUu757hJr5nLY1Yy3AdnR2FLw6snK60NSrriRs8bkD3iY0
         xLUsKTLYq0nKya/ZOwLxrttxyy8QiA6cVRaw29JJY7es0SKKJiTwrYNbIWTPzU+ytE9e
         J8yL1IqBJh6ti+7xj9e7PwfLY3P/jbkbvJwc7+vhqLc4XSbdVZs00z6iTuNOInyl9Lgg
         YRp/TRFBdCbOd8tQ2MGqHZ0lMAULp6cqvTGB2L/oiqEBstf+rwbigUo5bTmww/ruMWkY
         34TQ==
X-Forwarded-Encrypted: i=1; AL+hErEarClp7tPmqJ5llh9jSdxmxUtNWZ9sV+lsHJLwp3im/2ls9Qe1uwEgiC2vzgvGYDuKqsH68Cd0mdveYKg=@vger.kernel.org
X-Gm-Message-State: APuU4Z+FZDewXA2rCQozdOQV6i1sUt59JeXVNnCC4dn/uAju1qZxbqhD
	N6UNm5rjOQxlrqixiQWvHYeTqcv4vco0au2nL6TG5/UefbfA/OuuagTp
X-Gm-Gg: AYBFou0K3LATXuR1kzuaSdHKpTTb2zxa1UfZHWmPNzz4xoo1uO9RUj9G2jdxErJ5uR9
	x6XixtdEwtwrM3vsJBEqaZ8gCj4wkZMoRz6BnHQQNK7hb3rRZTGrnHqygn4LOE1WDzYvaIK6Mom
	kvQtYwHLHQ6Bywhg0zGQ2ZLi3IMogwRYb1LcElIa/Oe9IHqWZTk+Od4HviGd5uyLhMULs+cTtck
	ezFLHJrHFORyUbEJwhLB1qlrs+LXNCxOFwggA//odkssyJWR6F8ORXxDPIsWV9b6Dj37zWYiR6p
	Ye5IYiNWVFSzpXaXsviy952VJFIeCixum/z0iyDtyvCYVp3MxLeFrQ3TrfrJdzNrjCu72I/9skA
	HppGT0RDiFjnETxjKTUMhfCBa5wndocUMBNcQ3biSp2xFK8M4LEZWsEMub4eMgMBTkQL2kEr6Xa
	tg9z3ooNlcgBhBKx+P8OQGU3B9saqExBB64MAR8g7nBZXCWkUcuTPV5C8m3QwvZAjJoFAOR2tl0
	1QsM/T9zdqznRoRX3SEyKXCYckBUNweZHwo+t0fBa0Fivv9/8EvFineg4V+gvu7tSMaiadZq/CA
	ZiIKLyW/jTz9L06QE/QVJQ==
X-Received: by 2002:a17:90b:3c86:b0:3ab:413:49bc with SMTP id 98e67ed59e1d1-3b0db7074c1mr4345247a91.37.1794028654209;
        Fri, 06 Nov 2026 21:17:34 -0800 (PST)
Received: from a1-free ([161.33.196.121])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b103435561sm1133772a91.3.2026.11.06.21.17.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 21:17:33 -0800 (PST)
From: TAKANO Mitsuhiro <takano32@gmail.com>
To: linux-perf-users@vger.kernel.org,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>
Cc: Ian Rogers <irogers@google.com>,
	John Garry <john.garry@linux.dev>,
	James Clark <james.clark@linaro.org>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Ilkka Koskinen <ilkka@os.amperecomputing.com>,
	TAKANO Mitsuhiro <takano32@gmail.com>
Subject: [PATCH] perf vendor events arm64: AmpereOne/AmpereOneX: Fix typos
Date: Sat,  7 Nov 2026 05:17:30 +0000
Message-ID: <20261107051730.1880691-1-takano32@gmail.com>
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

Three distinct words are misspelled in eight description fields in the
AmpereOne and AmpereOneX PMU tables: "Preditable" in BPU_BTB_UPDATE
(AmpereOneX only), "satisified" in LD_FROM_ST_FWD, and "misprediciton"
in the branch_mispredict metric.  jevents.py copies the strings into the
generated tables, so perf list prints them and a grep for the correct
spelling misses the entries.

Fix both fields where an entry has them; the metrics entries carry only a
brief description.  No event code, metric expression or reported value
changes, and the generated tables are not tracked, so the diff is JSON
only.  ISTALL - the other codespell hit here - is the ETM stall-control
bit name, left alone.

Written with Hermes Agent, an LLM assistant.  Running jevents.py on this
change produces none of the three words; perf was not rebuilt, so the
perf list output was not checked.

Signed-off-by: TAKANO Mitsuhiro <takano32@gmail.com>
---
 .../arch/arm64/ampere/ampereone/core-imp-def.json         | 4 ++--
 .../pmu-events/arch/arm64/ampere/ampereone/metrics.json   | 2 +-
 .../arch/arm64/ampere/ampereonex/core-imp-def.json        | 8 ++++----
 .../pmu-events/arch/arm64/ampere/ampereonex/metrics.json  | 2 +-
 4 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/tools/perf/pmu-events/arch/arm64/ampere/ampereone/core-imp-def.json b/tools/perf/pmu-events/arch/arm64/ampere/ampereone/core-imp-def.json
index 879ff21e0b17..5a82a7717060 100644
--- a/tools/perf/pmu-events/arch/arm64/ampere/ampereone/core-imp-def.json
+++ b/tools/perf/pmu-events/arch/arm64/ampere/ampereone/core-imp-def.json
@@ -450,10 +450,10 @@
         "BriefDescription": "OFB full cycles"
     },
     {
-        "PublicDescription": "Load satisified from store forwarded data",
+        "PublicDescription": "Load satisfied from store forwarded data",
         "EventCode": "0xD605",
         "EventName": "LD_FROM_ST_FWD",
-        "BriefDescription": "Load satisified from store forwarded data"
+        "BriefDescription": "Load satisfied from store forwarded data"
     },
     {
         "PublicDescription": "L1 prefetcher, load prefetch requests generated",
diff --git a/tools/perf/pmu-events/arch/arm64/ampere/ampereone/metrics.json b/tools/perf/pmu-events/arch/arm64/ampere/ampereone/metrics.json
index 324104438e78..76cdf38b1e58 100644
--- a/tools/perf/pmu-events/arch/arm64/ampere/ampereone/metrics.json
+++ b/tools/perf/pmu-events/arch/arm64/ampere/ampereone/metrics.json
@@ -260,7 +260,7 @@
     {
         "MetricName": "branch_mispredict",
         "MetricExpr": "(BR_MIS_PRED_RETIRED / GPC_FLUSH) * slots_lost_misspeculation_fraction",
-        "BriefDescription": "Fraction of slots lost due to branch misprediciton",
+        "BriefDescription": "Fraction of slots lost due to branch misprediction",
         "MetricGroup": "TopdownL2",
         "ScaleUnit": "1percent of slots"
     },
diff --git a/tools/perf/pmu-events/arch/arm64/ampere/ampereonex/core-imp-def.json b/tools/perf/pmu-events/arch/arm64/ampere/ampereonex/core-imp-def.json
index eb5a2208d260..558b13fd7d0d 100644
--- a/tools/perf/pmu-events/arch/arm64/ampere/ampereonex/core-imp-def.json
+++ b/tools/perf/pmu-events/arch/arm64/ampere/ampereonex/core-imp-def.json
@@ -84,10 +84,10 @@
         "BriefDescription": "Predictable branch speculatively executed, unpredicted, that mispredict"
     },
     {
-        "PublicDescription": "Preditable branch update the BTB region buffer entry",
+        "PublicDescription": "Predictable branch update the BTB region buffer entry",
         "EventCode": "0x11c",
         "EventName": "BPU_BTB_UPDATE",
-        "BriefDescription": "Preditable branch update the BTB region buffer entry"
+        "BriefDescription": "Predictable branch update the BTB region buffer entry"
     },
     {
         "PublicDescription": "Count predict pipe stalls due to speculative return address predictor full",
@@ -438,10 +438,10 @@
         "BriefDescription": "Fill buffer full"
     },
     {
-        "PublicDescription": "Load satisified from store forwarded data",
+        "PublicDescription": "Load satisfied from store forwarded data",
         "EventCode": "0xD605",
         "EventName": "LD_FROM_ST_FWD",
-        "BriefDescription": "Load satisified from store forwarded data"
+        "BriefDescription": "Load satisfied from store forwarded data"
     },
     {
         "PublicDescription": "Store retirement pipe stall",
diff --git a/tools/perf/pmu-events/arch/arm64/ampere/ampereonex/metrics.json b/tools/perf/pmu-events/arch/arm64/ampere/ampereonex/metrics.json
index a29aadc9b2e3..a0dc917b9462 100644
--- a/tools/perf/pmu-events/arch/arm64/ampere/ampereonex/metrics.json
+++ b/tools/perf/pmu-events/arch/arm64/ampere/ampereonex/metrics.json
@@ -260,7 +260,7 @@
     {
         "MetricName": "branch_mispredict",
         "MetricExpr": "(BR_MIS_PRED_RETIRED / GPC_FLUSH) * slots_lost_misspeculation_fraction",
-        "BriefDescription": "Fraction of slots lost due to branch misprediciton",
+        "BriefDescription": "Fraction of slots lost due to branch misprediction",
         "MetricGroup": "TopdownL2",
         "ScaleUnit": "1percent of slots"
     },

base-commit: d48723711bae9b8cdc56719c448ba42fef28cbee
-- 
2.53.0

