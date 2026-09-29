Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B92B142F700
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 06:30:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790663437; cv=none; b=PBn5gu4sYSJhoYvlQ7Q5EWBCZ2hRD3sHV/ckDyUfpMJiPtlVNPFSV7EYpAgiwGtoBeC5hxwoAJeGwJ+ba26hQQKtq0DwiRC4pDZXFKIgInR00Fzy4lwnAQ55jIYsDU0zFVu3htf1YQ2B1Gr1CyDfbXSI/swrOSmoTd9HwU0XWEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790663437; c=relaxed/simple;
	bh=P+MsrHFEjrElGIN7hMAk1Fg8wsWDhle8TK7KpcN/sH4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=afQtQdToqo6lqBOpaaSaU4CqVo/ZzutXcFJS0/aWu3+LOke+LUGs8qRtpuQeboRx+K4G1+wUof/fLp9xGvJRrDdz9ZW36M/x38ptvDIaBZ6873hJ495C9RlsGnasgJLXHBD4stR+2DGmQXQmqq6Fiv30Xb/SkVQ9eWsD8uulLXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=V/zzTbcp; arc=none smtp.client-ip=74.125.82.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="V/zzTbcp"
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-349ffa249bdso2597786eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 23:30:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790663435; x=1791268235; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tJCPYv9x3XltGBwvKs/62P1gUROuXoCewbM+ScxfAAk=;
        b=V/zzTbcpuLfK7UdDNKvBi9fSOQ94zQV8dSNtpqcihsdS5g3z7bpv9dIwSkNKVHWMSc
         KXa0MJJOl0uUWRCXdOvupgDUg8Zextqwq1BnVqHDty3Qboo7k6roVa4BJaGFxYjGpY/o
         qz9k/Yrwuo3r1/7mSR6hLJlv5H3+Y0TytExk3zj9eSWsDPXswuz8Ya9xqkjztPXGFQOr
         Iv0VrYnCghtX/3Qu5TboFG+9GwqK71QqPYHDjC77ZM/AfswDxxa/UoSvET4yqrMwrBNh
         cWUQkk2g+JkpHPDfh0sFQsnCDIlT2K4CFiQQetgeuNlTigEeMPzrHopz6xHm13MnKgEl
         tskQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790663435; x=1791268235;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tJCPYv9x3XltGBwvKs/62P1gUROuXoCewbM+ScxfAAk=;
        b=MTfLqE9WKBQJseDbhptppLRXAIYMro8CsvNtb6UxU++dpiZAUtKhmiKsMOjPEnxT4v
         c+g2VLJScF5s8K0zpZLosSTbAn6rIZDYhxO50u1sb/VzkicTXvdjAo/XFskCq7nz69XD
         P4+8E5cEGXMAsUcEUzFDTe5xuAQFf1Kf/I4RMVq0yOp+h6eJqHRdlyo2qpt9Eguf7dDd
         FXFDUfOGZwM6IlDTLn40pUS87VX/KV2P1g9bbB1tSfvYWBimpNaCG2RL8zNGZXrzcQAM
         GhAsddHT4Sb6ey0xEvWRPv54kYoqmhlpcwdjUvYUo4xAe99epQ/7x3lXyIqEdiKa8oZB
         xguQ==
X-Forwarded-Encrypted: i=1; AKwUvByphlyDTUY26dsvrMHfhgUS2ieoQXwPz/LsorUInXT6layWfZM/3d8w2uWuMmPk5tfZum06yNtS+YnPLn0=@vger.kernel.org
X-Gm-Message-State: AFuF++lhSX4+Qo1artWujbJhXACoDPRG1ILMEW/XYfJ2GumAHUH6+y3+
	EKczcySY/tyyG4IicLbYJDVCb0CNfKFTsdjE9JlMMHA1JiNEwfVSJcTC/7pUpIw5H7XXRLCQgXS
	V8FQPRM5/6w==
X-Received: from dlbsv13.prod.google.com ([2002:a05:7022:3a0d:b0:13c:fe05:89a3])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:701b:231b:b0:14a:51c8:ea06
 with SMTP id a92af1059eb24-14a51c8eb9cmr4649283c88.29.1790663434079; Mon, 28
 Sep 2026 23:30:34 -0700 (PDT)
Date: Mon, 28 Sep 2026 23:29:35 -0700
In-Reply-To: <20260929062937.374137-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260929021913.56010-1-irogers@google.com> <20260929062937.374137-1-irogers@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20260929062937.374137-8-irogers@google.com>
Subject: [PATCH v2 7/9] perf python event_analyzing_sample: Default to
 in-memory SQLite database
From: Ian Rogers <irogers@google.com>
To: irogers@google.com, acme@kernel.org, namhyung@kernel.org
Cc: adrian.hunter@intel.com, james.clark@linaro.org, jolsa@kernel.org, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	mingo@redhat.com, peterz@infradead.org
Content-Type: text/plain; charset="UTF-8"

When -d/--db is not specified, event_analyzing_sample.py created a
temporary file in /tmp via tempfile.mkstemp() and deleted it in
trace_end(). As noted during review, creating the database in a shared
/tmp directory does not reserve SQLite's auxiliary sidecar filenames
(-journal or -wal), and a temporary on-disk file is unnecessary when the
caller did not ask to persist the database.

Default to sqlite3.connect(":memory:") when db_path is not provided,
removing the temporary file creation and cleanup logic, and test both
the default in-memory mode and explicit -d file mode in
test_event_analyzing_sample_python.sh.

Fixes: eeb70645a809 ("perf python: Port event_analyzing_sample to perf module")
Assisted-by: Antigravity:gemini-3.1-pro
Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/python/event_analyzing_sample.py   | 35 ++++++-------------
 .../test_event_analyzing_sample_python.sh     |  8 ++++-
 2 files changed, 17 insertions(+), 26 deletions(-)

diff --git a/tools/perf/python/event_analyzing_sample.py b/tools/perf/python/event_analyzing_sample.py
index 15b47cff9fa3..b4efee88d94b 100755
--- a/tools/perf/python/event_analyzing_sample.py
+++ b/tools/perf/python/event_analyzing_sample.py
@@ -17,10 +17,8 @@ from __future__ import annotations
 
 import argparse
 import math
-import os
 import sqlite3
 import struct
-import tempfile
 from typing import Any
 import perf
 
@@ -117,16 +115,11 @@ session: Any = None
 
 class _DB:
     con: sqlite3.Connection | None = None
-    temp_path: str | None = None
 
 def trace_begin(db_path: str | None = None) -> None:
     """Initialize database tables."""
     print("In trace_begin:\n")
-    if not db_path:
-        fd, db_path = tempfile.mkstemp(prefix="perf_events_", suffix=".db")
-        os.close(fd)
-        _DB.temp_path = db_path
-    con = sqlite3.connect(db_path)
+    con = sqlite3.connect(db_path or ":memory:")
     try:
         # Drop any pre-existing tables so repeated runs do not accumulate duplicate events.
         con.execute("drop table if exists gen_events;")
@@ -297,28 +290,20 @@ def show_pebs_ll() -> None:
 def trace_end() -> None:
     """Called at the end of trace processing."""
     print("In trace_end:\n")
-    try:
-        if _DB.con:
-            try:
-                _DB.con.commit()
-                show_general_events()
-                show_pebs_ll()
-            finally:
-                _DB.con.close()
-                _DB.con = None
-    finally:
-        if _DB.temp_path and os.path.exists(_DB.temp_path):
-            try:
-                os.remove(_DB.temp_path)
-            except OSError:
-                pass
-            _DB.temp_path = None
+    if _DB.con:
+        try:
+            _DB.con.commit()
+            show_general_events()
+            show_pebs_ll()
+        finally:
+            _DB.con.close()
+            _DB.con = None
 
 if __name__ == "__main__":
     ap = argparse.ArgumentParser(description="Analyze events with SQLite")
     ap.add_argument("-i", "--input", default="perf.data", help="Input file name")
     ap.add_argument("-d", "--db", "--database", dest="database", default=None,
-                    help="Database file name (defaults to a temporary file cleaned up on exit)")
+                    help="Database file name (defaults to an in-memory database)")
     args = ap.parse_args()
 
     try:
diff --git a/tools/perf/tests/shell/test_event_analyzing_sample_python.sh b/tools/perf/tests/shell/test_event_analyzing_sample_python.sh
index 5f0a41080acf..cddb12b67698 100755
--- a/tools/perf/tests/shell/test_event_analyzing_sample_python.sh
+++ b/tools/perf/tests/shell/test_event_analyzing_sample_python.sh
@@ -45,8 +45,14 @@ test_file_mode() {
 		exit 2
 	fi
 
-	# Run the script
+	# Run the script with default (:memory:) database and with explicit -d path
 	if ! perf script event_analyzing_sample -i "${temp_data}" \
+		> "${temp_dir}/perf.mem.out" 2>&1 || \
+	   ! grep -q "Statistics about the general events" "${temp_dir}/perf.mem.out" || \
+	   grep -q "Error creating/inserting event" "${temp_dir}/perf.mem.out"; then
+		echo "Default in-memory database mode test failed."
+		err=1
+	elif ! perf script event_analyzing_sample -i "${temp_data}" \
 		-d "${temp_db}" > "${temp_dir}/perf.out" 2>&1; then
 		echo "File mode test failed."
 		err=1
-- 
2.56.0.rc1.315.gc6ed9934b7-goog

