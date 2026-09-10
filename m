Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB13036B90C
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 21:15:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789074954; cv=none; b=ec2S3ROefQlpoxtkyD0ZLd4tMgLcVvWGzonv0YuGbZVPrt8dD8bYKOyG/4zA+Wm1gk3iuRhpi9A5v5EIv8r//tuJeKjoFdJ8BB64NybfMcvpHLyWZwW/LtxAnprqReuwAkx5kHkImzGEsvHY1sjvM/2P7aS1SarRe/V5GZxdlqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789074954; c=relaxed/simple;
	bh=Tchd9h/+ZmlnREp69ysazg2+/LxbpbaawP8hV+zLI3s=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Content-Type; b=DESSJZKRJsLjnaPqM5tMqc+xrYv3VjjTcq6sCRYZFom5YYITRDQslF29eZNvM3oRJb8h7LT1XGN9JQycrJZ08hxCf6BAByiGXDMK9G8ebibrS8L1+tQdjb9s/1/RwemsSs0CwUV6hpdBcOVEYxSWJbOPnzqHFVpMy4vr5OB+mto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=uQzLFVm6; arc=none smtp.client-ip=209.85.216.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="uQzLFVm6"
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-39d8646b10eso173805a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 14:15:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789074943; x=1789679743; darn=vger.kernel.org;
        h=content-type:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZPx7iVjI9IMbOhQe2xYSKcLblXCw9w5wIEB9KB5o4uc=;
        b=uQzLFVm6PKU52EhXUyqH4X2vvRn9r60ZTX8bGeOh3Io+a8OjjYu/GMqJOQuiRNukBT
         2TIuEgXfyTkwqJRs2xfJive7vHdo8BRXh6bKaQ659UY0HEOObHmQLYkhw/hFyeCidRJ9
         rmdUbKum0BvGh+q3VwJnNcgC0xLsOHDfX6P8XRVPWcPQzCfRRuG17Cm7gXi+2lDq05Ca
         8OZKOJ7rMABpeVzn09dZNbJg9PcagWsq1jCRqkpFYfgCUAdTZtGLJoudDG+Vt8KHkD/P
         gAEqdgigTtMawPYY12s55Wk38Fr+79zh5fpomohHgghsJqT1ZvnE2jAeK8cSkO2bd39+
         l58A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789074943; x=1789679743;
        h=content-type:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZPx7iVjI9IMbOhQe2xYSKcLblXCw9w5wIEB9KB5o4uc=;
        b=QiOQcz/s6lTx6manCXlZvnf9m4CGmeuuMVtHE3NDO06YSl1L5alqyEWsG5avWJ36VP
         y916z6/2p0ysGtJfBkKt0wyxFQeG/tWNsWba1gQUhsQ526dowHJLBBykYUSA+w2vwP+R
         YXzF9Uwq05HR0B6GVLatr7yhkAsaVraUQytdTl0A491Bgmco4G2M/BUqTZW8cBukqjv2
         VInkyd69skzAUa3CF4bWsXRT3Dq/BodroJZYt/kOyCn/1GeUL6QSo6KAD5j1w9lLRdEm
         PzFkaiYDrTbKqzAAb4bfXr2z2xWuPatVGprX67I6ReN+tXrZ7SwPAoUpEd0WVgvRl+k7
         xuow==
X-Forwarded-Encrypted: i=1; AKwUvBwXQziltU9nr5nNiLTVQ9amd+DwZGKKIoBekz9RvXZVk8wFyqVGhhA/ng6KtRBL/00izRcUy9FDcxUGjJM=@vger.kernel.org
X-Gm-Message-State: AFuF++mQqeUoa0KBNUrQWQcb7rwwFPNp554cSvvlOmMprWOw++05RNjR
	0Cch6LGvmLwfXRLWaDu5EwinIzU7AS+Lk/xEO0MBTzpjdiDJ/UMxauEba5qxH9Vahw5DbBuFNzS
	Xj/qlfqhDzg==
X-Received: from dll34.prod.google.com ([2002:a05:7022:222:b0:143:1edf:36a9])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:2ec4:b0:395:4de5:1054
 with SMTP id 98e67ed59e1d1-39d9c0b705fmr1098433a91.16.1789074942899; Thu, 10
 Sep 2026 14:15:42 -0700 (PDT)
Date: Thu, 10 Sep 2026 14:15:39 -0700
In-Reply-To: <20260910174420.3002597-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260910174420.3002597-1-irogers@google.com>
X-Mailer: git-send-email 2.55.0.1007.g17ff1f9808-goog
Message-ID: <20260910211539.3157204-1-irogers@google.com>
Subject: [PATCH v2] perf python: Fix ilist TreeNode string type drift
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	James Clark <james.clark@linaro.org>, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Updates Tree type hints to correctly use TreeNode[TreeValue]
across all assignments preventing mypy strictness mismatches.

Address some other minor stylistic issues reported by mypy, pylint and
Sashiko.

Assisted-by: Antigravity:gemini-3.1-pro
Signed-off-by: Ian Rogers <irogers@google.com>
---
v2: Tweak the imports and type annotations for better 3.9
    compatibility and to be more pythonic.
---
 tools/perf/python/ilist.py | 78 ++++++++++++++++++++------------------
 1 file changed, 42 insertions(+), 36 deletions(-)

diff --git a/tools/perf/python/ilist.py b/tools/perf/python/ilist.py
index 0d757ddb4795..ebff0a843b7a 100755
--- a/tools/perf/python/ilist.py
+++ b/tools/perf/python/ilist.py
@@ -2,11 +2,13 @@
 # SPDX-License-Identifier: (LGPL-2.1 OR BSD-2-Clause)
 """Interactive perf list."""
 
-from abc import ABC, abstractmethod
+from __future__ import annotations
+
 import argparse
+from abc import ABC, abstractmethod
 from dataclasses import dataclass
 import math
-from typing import Any, Dict, Optional, Tuple
+from typing import Any, Optional
 import perf
 from textual import on
 from textual.app import App, ComposeResult
@@ -19,7 +21,7 @@ from textual.widgets import Button, Footer, Header, Input, Label, Sparkline, Sta
 from textual.widgets.tree import TreeNode
 
 
-def get_info(info: Dict[str, str], key: str):
+def get_info(info: dict[str, Any], key: str):
     return (info[key] + "\n") if key in info else ""
 
 
@@ -140,7 +142,7 @@ class ErrorScreen(ModalScreen[bool]):
     def compose(self) -> ComposeResult:
         yield Button(f"Error: {self.error}", variant="primary", id="error")
 
-    def on_button_pressed(self, event: Button.Pressed) -> None:
+    def on_button_pressed(self) -> None:
         self.dismiss(True)
 
 
@@ -234,7 +236,7 @@ class IListApp(App):
 
     def __init__(self, interval: float) -> None:
         self.interval = interval
-        self.evlist = None
+        self.evlist: Optional[perf.evlist] = None
         self.selected: Optional[TreeValue] = None
         self.search_results: list[TreeNode[TreeValue]] = []
         self.cur_search_result: TreeNode[TreeValue] | None = None
@@ -284,18 +286,18 @@ class IListApp(App):
             """Sets the focus after the SearchScreen is dismissed."""
 
             search_label = self.query_one("#active_search", Label)
-            search_label.display = True if event else False
+            search_label.display = bool(event)
             if not event:
                 return
             event = event.lower()
             search_label.update(f'Searching for events matching "{event}"')
 
-            tree: Tree[str] = self.query_one("#root", Tree)
+            tree: Tree[TreeValue] = self.query_one("#root", Tree)
 
-            def find_search_results(event: str, node: TreeNode[str],
+            def find_search_results(event: str, node: TreeNode[TreeValue],
                                     cursor_seen: bool = False,
-                                    match_after_cursor: Optional[TreeNode[str]] = None
-                                    ) -> Tuple[bool, Optional[TreeNode[str]]]:
+                                    match_after_cursor: Optional[TreeNode[TreeValue]] = None
+                                    ) -> tuple[bool, Optional[TreeNode[TreeValue]]]:
                 """Find nodes that match the search remembering the one after the cursor."""
                 if not cursor_seen and node == tree.cursor_node:
                     cursor_seen = True
@@ -332,7 +334,7 @@ class IListApp(App):
 
     def action_collapse(self) -> None:
         """Collapse the part of the tree currently on."""
-        tree: Tree[str] = self.query_one("#root", Tree)
+        tree: Tree[TreeValue] = self.query_one("#root", Tree)
         node = tree.cursor_node
         if node and node.parent:
             node.parent.collapse_all()
@@ -343,31 +345,34 @@ class IListApp(App):
         if not self.selected or not self.evlist:
             return
 
-        def update_count(cpu: int, count: int):
+        def update_count(cpu: int, count: int | float):
             # Update the raw count display.
-            counter: Label = self.query(f"#counter_cpu{cpu}" if cpu >= 0 else "#counter_total")
-            if not counter:
+            counter_query = self.query(f"#counter_cpu{cpu}" if cpu >= 0 else "#counter_total")
+            if not counter_query:
                 return
-            counter = counter.first(Label)
+            counter: Label = counter_query.first(Label)
             counter.update(str(count))
 
             # Update the sparkline.
-            line: Sparkline = self.query(f"#sparkline_cpu{cpu}" if cpu >= 0 else "#sparkline_total")
-            if not line:
+            line_query = self.query(f"#sparkline_cpu{cpu}" if cpu >= 0 else "#sparkline_total")
+            if not line_query:
                 return
-            line = line.first(Sparkline)
+            line: Sparkline = line_query.first(Sparkline)
             # If there are more events than the width, remove the front event.
-            if len(line.data) > line.size.width:
-                line.data.pop(0)
-            line.data.append(count)
-            line.mutate_reactive(Sparkline.data)
+            if line.data is not None:
+                if len(line.data) > line.size.width:
+                    line.data = line.data[1:]
+                line.data = list(line.data) + [float(count)]
+            else:
+                line.data = [float(count)]
+            line.refresh()
 
         # Update the total and each CPU counts, assume there's just 1 evsel.
-        total = 0
+        total: float = 0.0
         self.evlist.disable()
         for evsel in self.evlist:
             for cpu in evsel.cpus():
-                aggr = 0
+                aggr: float = 0.0
                 for thread in evsel.threads():
                     aggr += self.selected.value(self.evlist, evsel, cpu, thread)
                 update_count(cpu, aggr)
@@ -424,16 +429,16 @@ class IListApp(App):
         # Add spark lines for all the CPUs. Note, must be done after
         # open so that the evlist CPUs have been computed by propagate
         # maps.
-        line = CounterSparkline(cpu=-1)
-        lines.mount(line)
+        line_sp = CounterSparkline(cpu=-1)
+        lines.mount(line_sp)
         for cpu in self.evlist.all_cpus():
-            line = CounterSparkline(cpu)
-            lines.mount(line)
-        line = Counter(cpu=-1)
-        lines.mount(line)
+            c_sp = CounterSparkline(cpu)
+            lines.mount(c_sp)
+        c_val = Counter(cpu=-1)
+        lines.mount(c_val)
         for cpu in self.evlist.all_cpus():
-            line = Counter(cpu)
-            lines.mount(line)
+            c_val2 = Counter(cpu)
+            lines.mount(c_val2)
 
     def compose(self) -> ComposeResult:
         """Draws the app."""
@@ -459,17 +464,18 @@ class IListApp(App):
                     # Reading events may fail with EPERM, ignore.
                     pass
             metrics = tree.root.add("Metrics")
-            groups = set()
+            groups: set[str] = set()
             for metric in perf.metrics():
                 groups.update(metric["MetricGroup"])
 
-            def add_metrics_to_tree(node: TreeNode[TreeValue], parent: str, pmu: str = None):
+            def add_metrics_to_tree(node: TreeNode[TreeValue], parent: str, pmu: Optional[str] = None):
                 for metric in sorted(perf.metrics(), key=lambda x: x["MetricName"]):
-                    metric_pmu = metric.get('PMU')
+                    metric_pmu_raw = metric.get('PMU')
+                    metric_pmu = str(metric_pmu_raw) if metric_pmu_raw else ''
                     if pmu and metric_pmu and metric_pmu != pmu:
                         continue
                     if parent in metric["MetricGroup"]:
-                        name = metric["MetricName"]
+                        name = str(metric["MetricName"])
                         display_name = name
                         if metric_pmu:
                             display_name += f" ({metric_pmu})"
-- 
2.55.0.1007.g17ff1f9808-goog

