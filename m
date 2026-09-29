Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CC383C3C1C
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 02:19:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790648395; cv=none; b=mBT3GTOMA15g9uWW85rXqX381FQUbBy4MXQc7qrGQTdZ5rLDXVxaRvAHjcJT+n37pBI/UVx5nJbctxDDWJMaUEpvxz/MwmjN/iTY6Mn312hGUvtNDJwqFcZLhn7i7vrCHn2UOWzM4CqZZHmd+M9XMc79rX8GfG9+qlc37MuQvqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790648395; c=relaxed/simple;
	bh=P+MsrHFEjrElGIN7hMAk1Fg8wsWDhle8TK7KpcN/sH4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=nsyFpU6mTzjSP+dkzTpJ3TFDc7IDvxnfHDoCvCER8BdF1Y+y26pj6cB+9rYMmZ9m4lkowYfPZHo/kx14PyaJLfQcz5Pa0sD6ymV1AM7zxVuq2MDrtpSjwBEts3ItyE01qGEzApHtyAKFx0rrFZQa/zoEZq3pkNVW8ySjavYvodY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=r7j7ZwcB; arc=none smtp.client-ip=74.125.82.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="r7j7ZwcB"
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-34316295d86so5998870eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 19:19:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790648385; x=1791253185; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tJCPYv9x3XltGBwvKs/62P1gUROuXoCewbM+ScxfAAk=;
        b=r7j7ZwcBEJdhhdgoICg0ZhsIhvYTtUux2jytMkvaTHY5L+pHvfpqObZKrLdWjrk0NQ
         zXjJ+5hSt51NW514OCPTP0mrKT7nm0AJg8KbHWM4IuM2ay7H0ZLAvt37G676t5bpPP74
         QFlhCWj53UYptbXM+fo043laiojNUxVNZY3S59Q0OwZzkCx1g18K0DqIZvAkI83WepHI
         kuWZZssG3+f6+97LyhuZxqUNLh14hB18wCJPtGSNygXIx5qgflju2EMgw/4rWDO123eO
         FK+FDVNayN5DQySQ7fq+G3xn1CL1poITieI9xcW7eqELIVbWlXKCMCYRGy6fCHTDjPOF
         s7vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790648385; x=1791253185;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tJCPYv9x3XltGBwvKs/62P1gUROuXoCewbM+ScxfAAk=;
        b=xbm/SwBx20xQ+AHC1n3GBhPH8N5VERIe+A8HPN6WZ0l09QwM/6Yqh3Mb5sKGxLzWIi
         UUpayHeRDOmYwwGro6d+CU7aOES1beK9guzsd9ecWcZe27J6xcUZ6FUP2F52TkDKhcmG
         jERT7buf8UrWPEI8VxlLDj9EkUBRC5HsLOVDXp/ZImqBfKv0c5J0dYE4L3tsTvUjeb8u
         ssBPeDJZmM99X/F6GUbHwAnxRWnxkPGxfbkGwJrP8DUl8blt6NpjtJniktKZTCkb/FOs
         +siBD6jtjbRkhEoKax/2x+/nAUslFkl+UEd8qSIVf7vzm0cQkGS2Q7fQu0UEZm2zBMtw
         R/ig==
X-Forwarded-Encrypted: i=1; AKwUvBwBw2mEhJ+qpaCkc+L+m4VAFtExfXk86s5flurOtzQpS+uM+yI37K2TIhCX68hD1MQzkk8riIHstldxv6w=@vger.kernel.org
X-Gm-Message-State: AFuF++n3dN4P7s16SJu/HKhYB7y8nsIR2mTVkDcL+YDWl3g5QJ1ZXvyw
	J3q3EBL3zcHV2cC+OtP2FTAiY8XcE7G+gAmPMZpZO282wvBN0CSm9VXsA8WTOrIYC2lx6QWJkDx
	0HEHu44gfJw==
X-Received: from dlbpu5.prod.google.com ([2002:a05:7022:e885:b0:144:d065:6639])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:b04b:10b0:143:298b:ba79
 with SMTP id a92af1059eb24-146d03a100bmr11063456c88.40.1790648384223; Mon, 28
 Sep 2026 19:19:44 -0700 (PDT)
Date: Mon, 28 Sep 2026 19:19:11 -0700
In-Reply-To: <20260929021913.56010-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260929021913.56010-1-irogers@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20260929021913.56010-8-irogers@google.com>
Subject: [PATCH v1 7/9] perf python event_analyzing_sample: Default to
 in-memory SQLite database
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>
Cc: Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
	Adrian Hunter <adrian.hunter@intel.com>, James Clark <james.clark@linaro.org>, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
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

