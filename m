Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DED51455185
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 13:03:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791291837; cv=none; b=VFZr9NkTOVc4wodARpHdgsnr+T0NsupmyzxcEdXIJ9AzZNA1SdnWWbzdH+FzkW5ZKvJ8z1jM9QqFz3Lzu09WHyjqx4DNOxbSXmszME7jqH3LWCdk+0IiUbrzorC24XIg59CLXdh/IMarbKoBchaThLbp80CyDmFFc/9lUGNsfEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791291837; c=relaxed/simple;
	bh=9zQu7wg1xjbiD5jQtWxleHDg0CQmiEWV+WvaA8rFa1s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WS0sccA5LpXyNVacUtCWt8xMerLBSZsjWeb8lI4SyreT/V2R8dTwIwKZ+YObSSqseUgFD6y7DPREYxm8YsYYtHRMbh7P11ykZbgLzglqcRHeWwJWzyT+AE3U5FUb4a+Pg+xSNGThb1iwBMYxhM0Vd1igiHLIbetz8+MByXgjSYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TvrCtNCd; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TvrCtNCd"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a168355946so6795105e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 06:03:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1791291834; x=1791896634; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fRxFX5jd7vzqIjZY35n79LbZDv/XaQ+6fw2e2XJNrQ8=;
        b=TvrCtNCd6BTrYLyOMuscXZhkX/jhlXsRjVXeYORI9maCHVXIhHRZFx8+2xil+oGQeR
         ZraG/C4q6NYpjEmKrqU44/RKzt88kmhrrMCf+TFE0rP6j742/LuhduKc35dpr0m60PbP
         SRGkIhw40gQ/1+bYNFVmQmdAqgXaGOQi7+d1GIGcLz8PgMsImwUSgeZnND+1xvUUV91h
         b5W88Oj2fwkBQZQtRvpMeQ/nRY3CRZcYS1HUy5OWMwDyV49Z9sXjFmKsNMonngyl++tU
         uZpo3YJhMfRGM2nqyZgz+FyepJoZDJqUUtJp82i2GMnMfjIV22CYa9nFD70tnl3pejpI
         uTdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791291834; x=1791896634;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fRxFX5jd7vzqIjZY35n79LbZDv/XaQ+6fw2e2XJNrQ8=;
        b=K2S0r4u/dG7O+KViTx4c3JWML6LR8ejnTF5P5HPE9j3xW4D5RIRvTNlgQs9x5wBjTo
         SSGLVgXjvFmPDQxH1J9nAWoaUU81bYwRtWLucT4TgzCkXNWyAkO82E2TKnsx52v1ueW+
         z8+KPR5sLavoJ6uPh6Uiquu8Wn0JG9TqMbFWATW/8BcLNf47/AXCQD1WixUVL6yASm6Z
         tT0LQPt6CfH+B58l0i1yGfSbS+l9eme2SwkSRpkZQU+ULbwprMNRiDyFtdeqFnQMyov5
         KOb57rnp9nMCX+k4qqnSwxObRilcLXtLaHA+T5nsLYl9oXnIfVGussngP+YM0ans/ThZ
         IyQw==
X-Forwarded-Encrypted: i=1; AKwUvByMydjHi7F/jpRMRgD6RmXMMu9cmHL6T6gFKIcKvbMtYxsu2BXiJzu2XxleTbWIvmYUOMgyypQK5YOru7I=@vger.kernel.org
X-Gm-Message-State: AFuF++lWEmHO/U+g4Vuo6REE6JXWD0nEuBcBLKfUEpxiMntav9wQT0Tc
	qoROPxGgwLXDxWdY1CAsW3tI6z5LF6pnj3hVkUDb1EwqVvtMnjjuWYWQ3kiK7deQG2A=
X-Gm-Gg: AYBFou0TEBREzkQI4PAirrMIiOEU4TNu6fzQXXjKyBr0tpCR9HqDRV/3Lo3MInTirTn
	lf+6ky5w3xK8rk9x51gGubXSRGc79/6UY9tAwQ9JXR/b0y3xAX99Al8FHvx4umbkk3/yBnsplER
	rhHcSwjtERISgmkfpet01Yk9T0PHt8FF3g4jOLbhpPco76p6uUHFUaAz+igKbxpyJxeiQC+J/Zv
	M7w1SUEFtqnHkT2pVw7ENCAS7Dn6gHY2z1SLmuYlRzNC4oKJyn/NADVlipTog3GUg4ZPsO84K+/
	//lS+skeYH7Bhp0+4Li8gH91HiLi5cOOxbU93nu8zKc1407jPpNWqU6S63cigPBQ/XPUlxkwzTT
	ZWczB4Dj41Ihzjd9cmsKGzBro9WwHrWdstmqvCi0EkyTNgqzqh0Ihe2+yAkF3SZmhW4n/o2TRkl
	jj2EJHieG/SCqDQIb94Oz9freYnQUz7a5mZDe5QbQuE+4IsuVROayZiXIf0g3XnVQW6Cz6Rutov
	g==
X-Received: by 2002:a05:600c:4712:b0:4a0:251c:fa72 with SMTP id 5b1f17b1804b1-4a17b53bf09mr21476995e9.11.1791291833973;
        Tue, 06 Oct 2026 06:03:53 -0700 (PDT)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a178c49c35sm78638295e9.9.2026.10.06.06.03.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 06:03:53 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Tue, 06 Oct 2026 14:03:31 +0100
Subject: [PATCH 1/2] perf timechart: Fix task row type narrowing in
 goto_task()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261006-james-perf-timechart-mypy-v1-1-e2c7edf4dd31@linaro.org>
References: <20261006-james-perf-timechart-mypy-v1-0-e2c7edf4dd31@linaro.org>
In-Reply-To: <20261006-james-perf-timechart-mypy-v1-0-e2c7edf4dd31@linaro.org>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, 
 Alice Rogers <alice.mei.rogers@gmail.com>
Cc: Arnaldo Carvalho de Melo <acme@redhat.com>, 
 linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
 James Clark <james.clark@linaro.org>
X-Mailer: b4 0.15.2

Mypy cannot narrow Row to TaskRow or IoRow when the class passed to
isinstance() comes from a loop variable, causing the perf build to fail
with:

  python/ttimechart.py:1686: error: "Row" has no attribute "task" [attr-defined]

Check against TaskRow and IoRow explicitly so mypy can verify access to
the task attribute. The tasks and I/O views contain TaskRow and IoRow
instances respectively, so task navigation behaves as before.

Fixes: e7a72d691980 ("perf timechart: Add an interactive --tui mode")
Assisted-by: Codex:GPT-6.1-Sol
Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/perf/python/ttimechart.py | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/tools/perf/python/ttimechart.py b/tools/perf/python/ttimechart.py
index 34ecf84e68c1..d7ba0276a9fb 100755
--- a/tools/perf/python/ttimechart.py
+++ b/tools/perf/python/ttimechart.py
@@ -1676,14 +1676,13 @@ class TimechartApp(App):
 
     def goto_task(self, tid: int, time: Optional[float]) -> None:
         """Select the task in the tasks or I/O view, optionally moving the cursor."""
-        for tab_id, view_id, row_type in (("tasks", "#tasks_view", TaskRow),
-                                          ("io", "#io_view", IoRow)):
+        for tab_id, view_id in (("tasks", "#tasks_view"), ("io", "#io_view")):
             views = self.query(view_id)
             if not views:
                 continue
             view = views.first(TimelineView)
             for idx, row in enumerate(view.rows):
-                if isinstance(row, row_type) and row.task.tid == tid:
+                if isinstance(row, (TaskRow, IoRow)) and row.task.tid == tid:
                     self.query_one(TabbedContent).active = tab_id
                     if time is not None:
                         self.window = self.window.with_cursor(time)

-- 
2.43.0

