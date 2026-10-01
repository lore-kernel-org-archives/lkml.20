Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 584DC43E4A1
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 05:41:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790833291; cv=none; b=nQZmJYzktNEcFhGhgDFpmC5JzBwwP6hJqe3YK1+Z+njuDLDejmMkMMzwxZf7jQX78d8EayAWbU6PMjR68FI6g65mtPsoC2hRmiitOQA2gjdCJYRMVuBvuX5X2Z8JxSXzhqO4trHaOuqPRQ25DFT91S85z/o3rj2Vsb5GW8gTr/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790833291; c=relaxed/simple;
	bh=sstgEXSFn/y+E7lEpfJqi2b/iKW5a75TSesEOfWmKqg=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=r4mbUg2OeoO2t2olsaDgT8aP7iJP3UOnsRr3qlI5HUtLHyxQ+NOeGO3N4npxwJPea9uPkGKQiuR9k4EorXho1W71wXBktmIKnOA8LPpaYOytWIJ5m5oCn7slKTBLEtsw7A7It+iiPEbo8MsAp6V/+Bc6+9QW4OEHNH02XgSJqOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=BBzSKdpO; arc=none smtp.client-ip=74.125.82.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="BBzSKdpO"
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-30bcb065bfdso4156874eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 22:41:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790833288; x=1791438088; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lpd3X3DRhauoImJT/i9YGSWB1evMCCVDDfsnm9T7Z/8=;
        b=BBzSKdpOLo0N0xOiw7xKqGso7NeFs6NJOCWcLoz//u3MGCI2RSyraB54xOhxkYhEpQ
         +/B86sgsFy8u7NAf9HZ3uDhsCwV7GbkcKWyDHZk9Sw7Nu08sVgY92PpqVt6JimuHRFmn
         zEIlqqq+DazaEByIXAMycXV/3vu4S6Wai0g1ylKnQn0BWbWAjttL1AivvICJ8+qdGvgQ
         HYAgpG4avFie3icJ6JxTsCzE0aRFkFRtGOOHGk6darx//7YG7NX011RlYysJrXF3Ulxy
         IV0lB7qfRBskSRdHzid9LkFxY0htOWpIzyjGDT7iu8PRxKsXlT0AcqnBKkczFZVk1tdY
         p+oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790833288; x=1791438088;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lpd3X3DRhauoImJT/i9YGSWB1evMCCVDDfsnm9T7Z/8=;
        b=OKHQdYHBox/p2d6qn+cJg+0SLTv9L6Eh504Qtse0p0eHfkYIK6jj75yW7LcarNwMyQ
         kc6KhTKs8JErFbKxuIjTqiHNl20Cd6GgRMWTN/C0X5dmvzEdLR4ZV9vkeyR9SuZe0PDu
         Ex+Sxh1dNfNTdvDh71y5QoiuYPLIvIZJBMIzjWhqvngERscQj3Wg2MIYL6MyulrHMBwY
         AYTaV319fIVbsHFqLRfIg8GwOdZXf/qCTVokq+wQMtep8xy+tWtp3WaMlueB2Gl86Sw8
         aHBkMQMh0CajABy1rE/p211XTe2Qe16LPShMvHTLSGzD9680xe72pqCdhUnNonpAonza
         ztyg==
X-Forwarded-Encrypted: i=1; AKwUvByGvVLCYBJ0p5P13hLD7xvoQTEk/4DxQqnFLozdpken4Ej+w5vWf8UqDpgTspKdY3G0WJC0kSaV9x3AgtM=@vger.kernel.org
X-Gm-Message-State: AFuF++m50WLESH1NzskSH7VP4wRMYbDhegfQD9mP9ezniZK+e89gbdun
	FBXW3uktFC2/5dr5UayAnqz2uG5JDjyZxmCugzow4Wi76X5irOPKCNDRAG7Da0uX/n6PNqkKQCp
	4lJ+WT0IEQw==
X-Received: from dlg7.prod.google.com ([2002:a05:7022:787:b0:14e:12ff:7c1b])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:701b:2505:b0:146:606e:2117
 with SMTP id a92af1059eb24-14d2f7e6e77mr4141934c88.5.1790833287738; Wed, 30
 Sep 2026 22:41:27 -0700 (PDT)
Date: Wed, 30 Sep 2026 22:41:17 -0700
In-Reply-To: <20261001054120.1570943-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20261001023423.1225713-1-irogers@google.com> <20261001054120.1570943-1-irogers@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20261001054120.1570943-2-irogers@google.com>
Subject: [PATCH v2 1/4] perf test: Update attr.py to use argparse
From: Ian Rogers <irogers@google.com>
To: irogers@google.com, acme@kernel.org, leo.yan@arm.com, namhyung@kernel.org
Cc: adrian.hunter@intel.com, james.clark@linaro.org, jolsa@kernel.org, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	mingo@redhat.com, peterz@infradead.org
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

