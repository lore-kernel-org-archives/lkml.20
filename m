Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E970F3612FE
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 05:07:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789967255; cv=none; b=mleIqOhlFyXlaUhLFWHLqWTB0w/UtoM81CBFSEWePWzGN91xlyOh6o0oYiuU8//8rIEdeZROz9+4vXTblvxoF9uAr26bBilk8neiVYVO2r+C+4AaTP7+LnjWMhRw76SZSBUNrRh5KQk5FaRzAUozsPymcDCRpOdSsTl3wtB4QLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789967255; c=relaxed/simple;
	bh=I+/F6Lf272wJ/FSJ8JJf6FA0fzMKbbtKGOoiTg12V5M=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=EOtgTE3TLmjjd2R0+a9ZcC1jC50D7KUV5WLJjrMD3LUtytwWwPcivBAL5aXofoJ0If2MsCMaMPpj3ehzw2yjr9kxlYwQtmEzcPzE5Z1QBLtG2WMsXZMBzfOtNGOkQaeou/JQJa4Oe/OZBGVlAzlces/Erhhxbz672a8moI19cqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=QJf1WABg; arc=none smtp.client-ip=209.85.216.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="QJf1WABg"
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-39512608fb1so6546509a91.1
        for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 22:07:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789967253; x=1790572053; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CsSfIgYZYlBwQ/QFRNukihIBFvet4HE3Ok6+/k+W1p0=;
        b=QJf1WABgqbukXBtIBIdoBb8CB8d9jjSuAwJqlFjXzGoAs2MNj79iPTzttnVFybBARX
         ImzSRQgL5g1iKRsw5pw8ezUYB/JT8TeXelDe0OWCV+JIbZIALrlVUwG0StA7mp3BPQvx
         RJeZJayWxF2C9l6fZEBluWwn4JfwxUHslSpzsnOuo4DUg5I5hmUHyYXUnKyDnGMHpA+k
         YOuPKu20FNnyv3BxGSGhbgI/Gr5XIk8FWMmaIt9trwsXhDIonr4fVMCbn6Z6vTMMfRAz
         nhD6Wlb+etSVbKgDOwOL0oWkIOpKt0+OmoCvuv8/Y+NAoGFHlLk63SjDE0TdyPqkBHlS
         kX5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789967253; x=1790572053;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CsSfIgYZYlBwQ/QFRNukihIBFvet4HE3Ok6+/k+W1p0=;
        b=XKO0HoE+v9tO4nnQSrN2xmMUgtsNzoIRp2nIOVQnB0/qMMtADrDeR3Eb0rBq8TGX7t
         VCQTsfta6n5KcEdJb6c8ZBFFleiQ5fi45qLW/bWC105+nVRh0juqDZCJEMpy1Cseq6ap
         yL0SmHAmIrKRaX6kKoFbvUZzIqSpR00Lg4e/KvgI5GFQncxcA7Co1fPjQIi9x5jhR+co
         6Gp66/YHJjgp7b2VaSg7xNBsFLcbUVx1WVtjpVYcYpD0ZjMLgF6vaPEO4AAN3e6R17v+
         7wHdkKkkZilmKDnz8DI4hXfaULeM7y1gMBInnEKbNojK34f3ZeiBq3hQXyn0h9COMQjX
         uKlA==
X-Forwarded-Encrypted: i=1; AKwUvBwG/kpC6R72ONLU0wh8s1Sc6sJEhdCa/ZRl/SXJa+sZv7pPrYAbMuhF+v668926zDuA/tTygoyySdLj5vc=@vger.kernel.org
X-Gm-Message-State: AFuF++lE24QYxQxahiby1q6gQ478eLxRnVlYUO3fqJpU6H6yxGAaDubs
	pKOP8yYuWgn1rXEYfrbYHV7kHcnReh/Xm2kv1kZsnQcBetkhIx8V5X1VRTYZjkI9So2wGc9fUbs
	RF5jbTgPIqg==
X-Received: from dlbro10.prod.google.com ([2002:a05:7022:158a:b0:143:91fd:56cb])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90a:e7cd:b0:395:7fff:a08f
 with SMTP id 98e67ed59e1d1-39e549bd704mr15056170a91.0.1789967253026; Sun, 20
 Sep 2026 22:07:33 -0700 (PDT)
Date: Sun, 20 Sep 2026 22:06:25 -0700
In-Reply-To: <cover.1789966896.git.irogers@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <cover.1789966896.git.irogers@google.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Message-ID: <1b18a2dd4cf8d4dd3af7cf61d841c59e75c07ade.1789966896.git.irogers@google.com>
Subject: [PATCH v2 07/49] perf python: Improve perf script -l descriptions
From: Ian Rogers <irogers@google.com>
To: irogers@google.com, acme@kernel.org, alice.mei.rogers@gmail.com, 
	linux-perf-users@vger.kernel.org, namhyung@kernel.org
Cc: adrian.hunter@intel.com, dapeng1.mi@linux.intel.com, 
	james.clark@linaro.org, leo.yan@linux.dev, linux-kernel@vger.kernel.org, 
	mingo@redhat.com, peterz@infradead.org, tmricht@linux.ibm.com
Content-Type: text/plain; charset="UTF-8"

Add module docstrings to counting.py, tracepoint.py, and twatch.py so
that 'perf script -l' displays concise descriptions for all available
standalone scripts:

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
2.55.0.1082.g2b9226bbc0-goog

