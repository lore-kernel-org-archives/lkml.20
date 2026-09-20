Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 164F83D47B5
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 05:22:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789881772; cv=none; b=RDP4DSHnzTRNo1ppBXl3HEXwaVk+sw43Qar320/y9+jaK5LGzT09j8c4NZhwSNqzzrXUj+5gaiCGuMfTH8FBcabx0Z07Ze1zt0ASt+L9L53grU9dJZMbapvy0Uxv+fHLExGpsyRj2xPHFt0E08BTBbI7JfcNVe7uymyTsnQeyrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789881772; c=relaxed/simple;
	bh=I+/F6Lf272wJ/FSJ8JJf6FA0fzMKbbtKGOoiTg12V5M=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Y2KrboyojO+xEyz4sySmmyT2fcFnzO3J3FM4W6ZU0e9Qzdpz2T/V2uTMZbENQQmWUYjhOG+wuXs3Qekz0AYSmqfxp+26ztnKHqUAehX33mQrNYEYO8AXLFK3ar4SkFnNcw6qNDV1/UBvC/4cgzWTFu4GYn5XsbyM5i+pxfvHMbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=MZRDdgvV; arc=none smtp.client-ip=209.85.215.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="MZRDdgvV"
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cc489e7a701so2942132a12.2
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 22:22:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789881770; x=1790486570; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CsSfIgYZYlBwQ/QFRNukihIBFvet4HE3Ok6+/k+W1p0=;
        b=MZRDdgvVyev3Onpolp8gXqXo83GCqT0OwtbWRlK8qot2QJhD9II1Qvp9bJJFl0eVNU
         q/rVeC68pM7JmF1YaaI6jhdJ/y2NU354RSzAtZQ6oQIwXmXTx/o9enxu2i2GSdOKW3Iu
         /z/ku9LeaTgS9vqFFlDOdnZcMDMX/Z2/VwjhjqXMrkWNvunkwJ/fQJhQIkna3Z3o+4FC
         0Y6/GNwLOmzKwIJmPfVtoqCAbw4C1jZrJAmbEN9vy4vZozPEQtLSUPYuOIazF2xtgJiK
         J8Sl5VjgL/rOJu58aQlmlfTZtFqf1Sds1+/vKSklO93tzVTOii8aq6RY8wlKlfRm2jBy
         OpVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789881770; x=1790486570;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CsSfIgYZYlBwQ/QFRNukihIBFvet4HE3Ok6+/k+W1p0=;
        b=IhPgoZtreLCreFpt+ErzNqp1lQD9ec/mbKCHNTNGntdf/Z+YAnELd9WJntnNrGsxgB
         9f3oVIqfGlOuk3a7XGh9PtyZ/FKKyEjsmc1tx2fRT6syopDWbCcug3D4SoU6+eRQc8Nm
         QiJRCO3JOnYFksq4aijnVGCnzdNnXTWrmjwRDVOqZgBpDiRpyo/yddcxFDJT0M/baUCz
         E3K/YaaVGmbgS3zOFfWn8llXXhBXS5YNLi0+WF4H/TMmSvw4JbsmI+vGSxcj05G0RkWF
         xZa53iko+FmwkNyHQAL5JE3HL050s+a4boEE9/fd1cw4k2ltHQt/+dzcE16D5yaxuNHv
         oDfQ==
X-Forwarded-Encrypted: i=1; AKwUvBwtCUoz5f8lVO8E69Nmxf1a1PNBwZ4Br9Tv+Ve6u+/4LyLNcRJpiEHG44qKCEBRuLRfO0gEVq52ch6xJE4=@vger.kernel.org
X-Gm-Message-State: AFuF++mkhg0SYln6cer7mUzbwR3DzMLgfHfscNxrVgbLgud6Kice1q6Y
	tuV3gKA7yJOZHttwZbqgtpX0cf8PlwJFlhyS7NeAbrcJ0+uDkPBs8Tq31kSPbPa+HPaZdG6eO1l
	wQs0v0/OePA==
X-Received: from dled9-n1.prod.google.com ([2002:a05:701b:42c9:10b0:143:8a67:84b5])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:9185:b0:3dd:a196:5394
 with SMTP id adf61e73a8af0-3dda196544dmr5536802637.54.1789881770336; Sat, 19
 Sep 2026 22:22:50 -0700 (PDT)
Date: Sat, 19 Sep 2026 22:20:59 -0700
In-Reply-To: <cover.1789880842.git.irogers@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <cover.1789880842.git.irogers@google.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Message-ID: <03a0ba15a5d53b66d6ec2202ceb5d422e3e9432c.1789880842.git.irogers@google.com>
Subject: [PATCH v1 07/49] perf python: Improve perf script -l descriptions
From: Ian Rogers <irogers@google.com>
To: irogers@google.com, acme@kernel.org, adrian.hunter@intel.com, 
	alice.mei.rogers@gmail.com, james.clark@linaro.org, 
	linux-perf-users@vger.kernel.org, namhyung@kernel.org
Cc: dapeng1.mi@linux.intel.com, leo.yan@linux.dev, 
	linux-kernel@vger.kernel.org, mingo@redhat.com, peterz@infradead.org, 
	tmricht@linux.ibm.com
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

