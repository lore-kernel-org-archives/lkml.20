Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FCC6387362
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 06:21:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790403675; cv=none; b=aWH5dTcaBnPvOGuwSzW+3tmH/ilcf0XTdi4J2eQI6lX08nm7hBHlr0hoP30B6xbnAxDIjxT/8BLIjVnhcgHYt/MnJai9lFkNn8H5lNRqA97geBJJI43/8/U0nKkDsE84b/zvYweDEkj6a2uA+yqk0hUELMWBwG7/1Ht8AG2yewE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790403675; c=relaxed/simple;
	bh=vVIlPXbJRn3JiojQr+d1jESd2Vb0MRde99xXZQuUO2Q=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=buKXnKDAGaYJdI/5khrOE72sF7x0GrWyTmvstvlXBhx87YoYbCjuNHZe0PrqZeVI5BrqIDtgvwb5x+7zoRp/J4HyUacdmoidVkkQGBo2sq7TDhcgTYaY0evOK+ZIEbvoYltX18AFomYCpVYxNK4nKaLYIoziw20elju5xbBrtOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Tq4QfKWD; arc=none smtp.client-ip=74.125.82.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Tq4QfKWD"
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-342217d8d53so2867717eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 23:21:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790403673; x=1791008473; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EtkTDAyqziLuz0Ye6v6rdVjgqYsh5tNU/AF4YeZZ2wQ=;
        b=Tq4QfKWDIr9ZE5ZXlRZ0rDBOK4RldUwLq3UZ8I5aTNqTe4mMt9XiItk0/P7D3IR0Zk
         6nUIOxdTSvIjyiowyTWKhjU+Xi3zxk6hwKdkpeplGBy+wi3P6zFFWNOgnvnT5avymQxh
         I/35qn6Nh1WNbR7wYaT++ol0tkZMdEet5ZxAZNOylJAcC5r7Da38/oxgVJIEilOgSvVD
         TK1ulRgaxGCwsueJqIpUiUpshVXQZVuiXXnhpnZV7xgnvLWLIWL9DUZ16ozQjhRhRDYr
         F9yCa0Wd/C6OAKdutR2Ll3kafAw6oGCbNOGycp48BVBtMpc0Q90DSl0+pwmcnPa64e8v
         yXyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790403673; x=1791008473;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EtkTDAyqziLuz0Ye6v6rdVjgqYsh5tNU/AF4YeZZ2wQ=;
        b=l2+SU0YwCSVYYhicT8aAC0QDdKOS3LGIT7B5axEfQqsLhzjhBbfh6uMfTJ4+rRLTdh
         XwGuQWI4mYIRHngofXRIeVdQ0e0u+3kbVaI+V2jyBre4aTocx0lUkLUh8Qqv0cGwbBIw
         sX2NAi5w3kE94bGGGzr3FCX7JjtecgtbM1kytzCs1Jd1paVfA0GEUlkmD++dsVU1hAET
         7nY7imTIa673LeyV7uc4te+TFXmmgCrj2p50iznn+dfT0WwUSDlpUsAddkuY+xMxUmL4
         LV0rH08fXFqHDvkh1noCjNvUUVvbgMUU+X+YbBY571PfsotuVo8f5hXPQB+lne955AWD
         0X6A==
X-Forwarded-Encrypted: i=1; AKwUvBxAyRZx9LYiHHcmn7rOwsgTTDd/icoZksyZnPjCmagPNOMVPYpORwlI+RPuWUsE7cbuBg86F6rdxp1CUXg=@vger.kernel.org
X-Gm-Message-State: AFuF++njmsYvISRThM83zAtZDTJD/C1BCjy7UImRWyIsjH+60Srfyvze
	mPms7cxfviDBWfgzZvbfsMvvpmGL8yvDIvaD8AdzB26Qqiqi6ChWKp/iMIOPiE8XlCze5B/h1AG
	FT0BIxX6wPA==
X-Received: from dyos30.prod.google.com ([2002:a05:7300:6c9e:b0:342:805e:c749])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7300:8250:b0:342:94ae:98f8
 with SMTP id 5a478bee46e88-34294ae9cd0mr1775758eec.33.1790403672587; Fri, 25
 Sep 2026 23:21:12 -0700 (PDT)
Date: Fri, 25 Sep 2026 23:19:34 -0700
In-Reply-To: <20260926062029.800743-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260923181213.3032038-1-irogers@google.com> <20260926062029.800743-1-irogers@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20260926062029.800743-8-irogers@google.com>
Subject: [PATCH v4 07/49] perf python: Improve perf script -l descriptions
From: Ian Rogers <irogers@google.com>
To: irogers@google.com, acme@kernel.org, alice.mei.rogers@gmail.com, 
	james.clark@linaro.org, leo.yan@linux.dev, namhyung@kernel.org
Cc: adrian.hunter@intel.com, dapeng1.mi@linux.intel.com, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	mingo@redhat.com, peterz@infradead.org, tmricht@linux.ibm.com
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
2.56.0.rc1.315.gc6ed9934b7-goog

