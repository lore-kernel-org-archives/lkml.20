Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5802649F10D
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 18:13:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790187184; cv=none; b=FSSCjsAJNMInFxur8pdcjfBUe7KEKgaetjoZqIlMM2GCnjgQOOn9ZGjLRC2Qf2eOKDKbUdRm7KE+a4Ik/9udUZE0+qlNdTnefZbmQPRdNw6eANm2aH+xhKATYbrjFuICDLNeXif6v15iuC4XFT0TbYo1uFbHoc486vt5mY1Zy5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790187184; c=relaxed/simple;
	bh=Nn88fZFShXx5JVerGrjugPmKxeDP+fqMvhrMzHOf10U=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Nwx2CvCtKplMh90st/0jtajA61ast1co4jDJvd2IZmulRRBKBiWbbZ8FLcPMAkXx8VnDg+39dNGv/YE2pllMsOQdk6tdu3f4E6KdLpHJvbs2DuzzkztzljpxApEeqymkBirkvBw7mDVOc2l0D6Yg7ppd21JpMFK6nO6kenrKgbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Ik9O6FA5; arc=none smtp.client-ip=74.125.82.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Ik9O6FA5"
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-313d1015161so253717eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 11:13:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790187179; x=1790791979; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IuxfrqxTwwBqV3BAkBSM2g9sz6L6oZXb2glj2NAemZw=;
        b=Ik9O6FA5m/3+waIz+2zQJRv4fusRrEkIdGJ9D27O36/3LJA5J4xAJQcsIvYqxlsEPu
         p2rIdKjn7STc5NueDVYmjjkC2a5O15jusrqKCMYYhEtRiKkx812A18MHSQpG7VGu5GNz
         BhEWx5+iL0fZF3M/MmfkePi9xobozht50WCey6YINyZFhv6MFhx1ljLF6SPi0Vcewd7q
         V5UvK3/AmsQSPzNfC36Di8tq1KmGzPCsBpBRUT+DkdJehwahNiao35DTX711EFThIXvt
         D7hApCHcwZxCjd1f9Tf995BBBhpN6wTio1k4+LWAd73tJlneWmKUP8oYYeOVqshBEi8u
         n3nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790187179; x=1790791979;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IuxfrqxTwwBqV3BAkBSM2g9sz6L6oZXb2glj2NAemZw=;
        b=oik8o3EmmNpfXxIEpV3VyHuXd9ZfseDvF4rTC5NlhkHqJ44ZXpRQuewHGrSt/ArukW
         ketQuGcx83xmIg4+QJAgH67ZZZH0WKMmserUFRikjVB7QosA0nNFB54jshcvB4roe+mx
         JDnArKE4q6qAfsFPnDOlmuG12BUlsorn6tos9XTjYKpO9nH5HtFO3H7HArzbslrCeGZD
         E3zI0WE6Mkq0FSfOHgEIWwRMd3ldBl4CoSQCOdrWoWtRbGipWUp4+NhMfFnB20fs5ghc
         pjBWk6dHtgQbGxMj2MvE0E19K2CBbe3mcFj1DLmx/tmmCvFM7X00AMFFcHzUAQmb3OYm
         9weQ==
X-Forwarded-Encrypted: i=1; AKwUvByFf1In4SBiC3SVzLdTYR1/O+bI7RSaVV7JFpWmOO/yJK0sfXxdR3Y7Mm/SW5xdRN37nMhCYqlHxRT8VtA=@vger.kernel.org
X-Gm-Message-State: AFuF++lEG3AepZvANNauKP/Eg2c4PZYiNBIOlqdPW83uknqgrO3mUc2u
	EWvdEMi+ClS9namHNMCfWncnoto6cI51AvyuJiE6EbqlBUZfK6216XAWuBDkeaKvceYJF7bavTJ
	kNr2pyqamlw==
X-Received: from dycnl8.prod.google.com ([2002:a05:7300:d108:b0:33b:f23f:e95e])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7300:e3b5:b0:33b:fe7b:460e
 with SMTP id 5a478bee46e88-33e8bc75a7amr2865160eec.7.1790187178811; Wed, 23
 Sep 2026 11:12:58 -0700 (PDT)
Date: Wed, 23 Sep 2026 11:11:30 -0700
In-Reply-To: <20260923181213.3032038-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <cover.1789966896.git.irogers@google.com> <20260923181213.3032038-1-irogers@google.com>
X-Mailer: git-send-email 2.56.0.rc1.310.g51773c2048-goog
Message-ID: <20260923181213.3032038-8-irogers@google.com>
Subject: [PATCH v3 07/49] perf python: Improve perf script -l descriptions
From: Ian Rogers <irogers@google.com>
To: irogers@google.com, acme@kernel.org, alice.mei.rogers@gmail.com, 
	namhyung@kernel.org
Cc: adrian.hunter@intel.com, dapeng1.mi@linux.intel.com, 
	james.clark@linaro.org, leo.yan@linux.dev, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, mingo@redhat.com, peterz@infradead.org, 
	tmricht@linux.ibm.com
Content-Type: text/plain; charset="UTF-8"

Add module docstrings to counting.py, tracepoint.py, and twatch.py. This
satisfies pylint's missing-module-docstring check and prepares these
existing standalone scripts in tools/perf/python/ for the later commit
in this series ("perf script: Support standalone scripts and remove
embedded scripting"), which updates 'perf script -l' to scan
tools/perf/python/ and display each script's module docstring:

```
$ perf script -l
List of available scripts:
...
  counting
    Example for counting perf events.
...
  tracepoint
    Example showing how to enable a tracepoint and access its fields.
  twatch
    Example to show how to enable a software event and track
    context switches.
...
```

Assisted-by: Antigravity:gemini-3.1-pro
Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/python/counting.py   | 1 +
 tools/perf/python/tracepoint.py | 1 +
 tools/perf/python/twatch.py     | 1 +
 3 files changed, 3 insertions(+)

diff --git a/tools/perf/python/counting.py b/tools/perf/python/counting.py
index 02121d2bb11d..9adbbeccdacd 100755
--- a/tools/perf/python/counting.py
+++ b/tools/perf/python/counting.py
@@ -1,5 +1,6 @@
 #!/usr/bin/env python3
 # SPDX-License-Identifier: GPL-2.0
+"""Example for counting perf events."""
 # -*- python -*-
 # -*- coding: utf-8 -*-
 
diff --git a/tools/perf/python/tracepoint.py b/tools/perf/python/tracepoint.py
index 9d49a25b3b1e..faa5311b8418 100755
--- a/tools/perf/python/tracepoint.py
+++ b/tools/perf/python/tracepoint.py
@@ -1,5 +1,6 @@
 #! /usr/bin/env python
 # SPDX-License-Identifier: GPL-2.0
+"""Example showing how to enable a tracepoint and access its fields."""
 # -*- python -*-
 # -*- coding: utf-8 -*-
 
diff --git a/tools/perf/python/twatch.py b/tools/perf/python/twatch.py
index ad35b1620781..b0f1bf113162 100755
--- a/tools/perf/python/twatch.py
+++ b/tools/perf/python/twatch.py
@@ -1,5 +1,6 @@
 #! /usr/bin/env python
 # SPDX-License-Identifier: GPL-2.0-only
+"""Example to show how to enable a software event and track context switches."""
 # -*- python -*-
 # -*- coding: utf-8 -*-
 #   twatch - Experimental use of the perf python interface
-- 
2.56.0.rc1.310.g51773c2048-goog

