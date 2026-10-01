Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F12C236493C
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 02:34:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790822073; cv=none; b=LHUiPivGpbGleOvZ6xMw+TEkgijaxPqd6NWZEK3y/83pgYD5hKKTxf2lrpT+n449Bd2UyP717RbA6rdopWySu0LchUO8yh1H5TR+F0uWurZHq1bWQXHpzwLB1Ujxg8t0FlsqT9BhKmPEKUeHkpbr1j5VB62BKFaGReUGSnsZJ4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790822073; c=relaxed/simple;
	bh=sstgEXSFn/y+E7lEpfJqi2b/iKW5a75TSesEOfWmKqg=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Content-Type; b=aHAwm2M3vwKsHmQ3LWAS4hYs3pH6djU6ZQDZk2taIiaS3clxfLOMyTtP7DITzOGxXDYbWBwIbxnqzFg6YBxg7ZhWWX2nIRBpaMi0xY4VTbpWXLaVwjUhqANcMHMZp+YmtE1/Fs1fsrKVFs6xVB4XR/5OWNKhGE98wGhWf0XObWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=M7J2q0GL; arc=none smtp.client-ip=74.125.82.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="M7J2q0GL"
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-341eff9e381so8271936eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 19:34:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790822071; x=1791426871; darn=vger.kernel.org;
        h=content-type:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lpd3X3DRhauoImJT/i9YGSWB1evMCCVDDfsnm9T7Z/8=;
        b=M7J2q0GLP55qHcpZzzk0mtwwPQ/540oummFfwFstrcF7VS1TgX0eWEKbkSueatsy/f
         9+9d0ndKHlcIeAfM6jhfIidEgayYfcloSFqH/RyTgKzdLyTGoxZEEYHphRMsWrT4TWFz
         u1mCQ+mL0kK+yZG6CeKYtu+DOpxvaS2RCvwdIgS0iomxaCHu4Ff0kx5jPVtCi15zCkcs
         42x9PPjAOSdYNUxhbeVS/SqeEIy4KZgo88sR3rkN5tEN6bdkn+Rbwp/3k+GTPTu4soMe
         0Bc+f2YZvJG3aqFJ31j3U+x5e9720MTK7z15ak0RE/hf5u1XyPuAX7g0auad+Q90urvB
         3wSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790822071; x=1791426871;
        h=content-type:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lpd3X3DRhauoImJT/i9YGSWB1evMCCVDDfsnm9T7Z/8=;
        b=De3bHVHTD75W1NMvMZzq87URpbCL2hgTlz2m227GYAu7RrwzJXcbdf6TelITgDwG9U
         Ct641WPB/E05AtscJj5rXMcvnYgL3DbemdV1NxSVruCwzaCAr4IAwpc3nKaUpFGHWKTd
         f02rNuZrEvct9ZksGUP5HvjdCW3zPOBoMl3LliWDz6IAyo+5sw+UqLRvcrWzIDWIrAz/
         Zwthi6a+YU6M+PK/VLgLkq+0S+sFYVmRFfqdFUpDb1SwJ5Rir09Mc6UxMBbHHlpGg0gh
         f1k67O3nEFMPEFAnonLCEFbIhh0k2xSA29qJ3IsuBYnk8u/mdhw31lO+P6ebanU9qy2u
         aeRw==
X-Forwarded-Encrypted: i=1; AKwUvBw8EQClfKhEGa6D5LeaIYuPy6xnnY9iK3ISF6fChjbxqIMsUXU8jnGAfJdzBg2jfs9c2biRBC4J1+MmMhE=@vger.kernel.org
X-Gm-Message-State: AFuF++kwi1QDVdioQ/2CRkcyuVOSPmYTD8gEg+fUSAGrXVSgkgNo4hRV
	Wh0tfOMQZ87gWUgkp2KlQ/0bilRCd7NqRMXJYcKDtuYWygUrdZZavNuiBmpIK2WfN4dA4aWEJlO
	2w+FKgw8WJA==
X-Received: from dlbek3.prod.google.com ([2002:a05:7022:c83:b0:14d:8029:3678])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:3a81:b0:143:6441:bb50
 with SMTP id a92af1059eb24-14d2fdc7d5cmr3457647c88.5.1790822070624; Wed, 30
 Sep 2026 19:34:30 -0700 (PDT)
Date: Wed, 30 Sep 2026 19:34:20 -0700
In-Reply-To: <20261001023423.1225713-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20261001023423.1225713-1-irogers@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20261001023423.1225713-2-irogers@google.com>
Subject: [PATCH 1/4] perf test: Update attr.py to use argparse
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

optparse is deprecated since Python 3.2 and triggers a pylint
deprecated-module warning on newer versions of pylint. Replace
optparse.OptionParser in tools/perf/tests/shell/lib/attr.py with
argparse.ArgumentParser.

Assisted-by: Antigravity:gemini-3.1-pro
Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/tests/shell/lib/attr.py | 37 +++++++++++-------------------
 1 file changed, 14 insertions(+), 23 deletions(-)

diff --git a/tools/perf/tests/shell/lib/attr.py b/tools/perf/tests/shell/lib/attr.py
index 7f3d5b64b00d..68f06df9565a 100644
--- a/tools/perf/tests/shell/lib/attr.py
+++ b/tools/perf/tests/shell/lib/attr.py
@@ -4,7 +4,7 @@ import configparser
 import os
 import sys
 import glob
-import optparse
+import argparse
 import platform
 import tempfile
 import logging
@@ -426,29 +426,20 @@ def setup_log(verbose):
     ch.setFormatter(formatter)
     log.addHandler(ch)
 
-USAGE = '''%s [OPTIONS]
-  -d dir  # tests dir
-  -p path # perf binary
-  -t test # single test
-  -v      # verbose level
-''' % sys.argv[0]
-
 def main():
-    parser = optparse.OptionParser(usage=USAGE)
-
-    parser.add_option("-t", "--test",
-                      action="store", type="string", dest="test")
-    parser.add_option("-d", "--test-dir",
-                      action="store", type="string", dest="test_dir")
-    parser.add_option("-p", "--perf",
-                      action="store", type="string", dest="perf")
-    parser.add_option("-v", "--verbose",
-                      default=0, action="count", dest="verbose")
-
-    options, args = parser.parse_args()
-    if args:
-        parser.error('FAILED wrong arguments %s' %  ' '.join(args))
-        return -1
+    parser = argparse.ArgumentParser()
+
+    parser.add_argument("-t", "--test",
+                        action="store", dest="test", help="single test")
+    parser.add_argument("-d", "--test-dir",
+                        action="store", dest="test_dir", help="tests dir")
+    parser.add_argument("-p", "--perf",
+                        action="store", dest="perf", help="perf binary")
+    parser.add_argument("-v", "--verbose",
+                        default=0, action="count", dest="verbose",
+                        help="verbose level")
+
+    options = parser.parse_args()
 
     setup_log(options.verbose)
 
-- 
2.56.0.rc1.315.gc6ed9934b7-goog

