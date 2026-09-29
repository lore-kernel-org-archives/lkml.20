Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A2D23932F0
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 02:19:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790648388; cv=none; b=qiJTLKdBPEZl7K7s5p08lpjiQVmhtpHLg3A2AKm/l/Brlt2hmYdfot+9HtzZcAACB0C5pZbvqsBvx36oWdeZA2Mli2watxzENuqxxGPY3qjIEeG0dKi5AAyGzRRgzdDPjbfhGgjTkiZVbjZn2DHuYLERs+LQ170PzAdhz/3zvT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790648388; c=relaxed/simple;
	bh=EzNAQc+zqELLfEsqlQ1kpZ+oVvfzTZI1o5rnigTKwoY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=B1/zfKQDTfR0IZvkuv8iYtjdW2+d8mox24UIR/FWdomO0WXqlIpvmjAUUTVy2FjekK868Rtwfih/2L7LXicVp5lvr2c6DO7xeMgv2C+C6kn7ahWixnSRGscgGt7AbmLhP6gbGGx/bo4OMa83dN+sb+gj6eOcYE/x0uwqcXrlD+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ipY9bZZ9; arc=none smtp.client-ip=74.125.82.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ipY9bZZ9"
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-34318e88ba2so2172134eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 19:19:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790648387; x=1791253187; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f4/IsA7upi/zbnOhoxbNy0tZ5zJbyc70QixREWB/C8w=;
        b=ipY9bZZ9iCWSgyMbwXYToDyJT7LLcbsA0pQm7FTf8QFpCHN8TLlQfWxbbzDmoElCtA
         XIrh2KW/WnV5xeXbnmRni+KgR1T6G8yNzIyVnCwFGvnkUq+zM740I1BptcvR1bXSJ/JU
         AfLXdm4XGIgZJxxSOqHuSL1lA891QdnjxrxMmzUWgNG/8uiBku+G18LbiEUDicRB2HAN
         160xG0rKJVFr5J7iDhIuQ7ZGgfMNzkbAhGBvfqF+tkWBzGlWCOlCe03LIeHq/oaGCf9W
         VjJybPHI57hG7p6vLCGCvLmq4sBAo7WqJohBBoLq4YfkBl8iDKBPXJcVNtAb6SRkzNJw
         TV/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790648387; x=1791253187;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f4/IsA7upi/zbnOhoxbNy0tZ5zJbyc70QixREWB/C8w=;
        b=aKv4fxDECUoseXRS+Yg3/rF5SicUKyhgpZGMnP+79Sqj/idcZD/CmHvAgmeLXB0JAr
         Jdwv2Qmq/SFe5PLICdaVi4wr5MNAMXUizDIoDVpCc5LlKKaauU1B7QbOHGB5VUQWFna/
         pmQeYYT2r2ROZwWgcbLPCzRvA44TLfypBmeqTnFY2Tu2T/idL64DZMRGNPXJXb52e63B
         uW5IHRMvod34kbB9Ymy8eY8S+AMu/+uMs0A70ITJ1P/mLeU9jFX/QEHZ9ALmSKqZJY8u
         zvnCfXZ0WjTTPfWqbx/jruej6LhRyIqYJzrbfY5fmJt4rIwBgyc3vSxFsd/j4WAXvkZk
         7G3A==
X-Forwarded-Encrypted: i=1; AKwUvByjN9twhsq5t7GVUgJQav7xvcrsdrWEgHj0WUHGmsqHyjX9BxBSeIO8eHvcE7cBm7PimUq1hausnQ6w20M=@vger.kernel.org
X-Gm-Message-State: AFq9FYLPrZoYi9oy1FAtA3LTd+RnetsM32y3T9r7ImiaMRb1qjt+hEEG
	Svsc6t4qiA9OmGoHCq2GuyIKdudDuQysN8AEoyH3Ok67uNtvyJk+mATiAo1Ln+LKfBv0E/O80o9
	LGqL1iCi4cg==
X-Received: from dybme43.prod.google.com ([2002:a05:7301:18ab:b0:34a:10b2:be3d])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7301:1f15:b0:341:5da1:7851
 with SMTP id 5a478bee46e88-342703b8346mr16683047eec.12.1790648386241; Mon, 28
 Sep 2026 19:19:46 -0700 (PDT)
Date: Mon, 28 Sep 2026 19:19:12 -0700
In-Reply-To: <20260929021913.56010-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260929021913.56010-1-irogers@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20260929021913.56010-9-irogers@google.com>
Subject: [PATCH v1 8/9] perf python: Initialize debug output on module load
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>
Cc: Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
	Adrian Hunter <adrian.hunter@intel.com>, James Clark <james.clark@linaro.org>, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Unlike the perf binary's main(), PyInit_perf() does not call
perf_debug_setup(). As a result, the first warning or error printed from
the perf Python C extension hits debug_file() with _debug_file == NULL
and emits 'debug_file not set' without a trailing newline before the
actual diagnostic message.

Call perf_debug_setup() in PyInit_perf() and add the missing trailing
newline to the fallback warning in debug_file().

Fixes: ec49230cf6dd ("perf debug: Expose debug file")
Assisted-by: Antigravity:gemini-3.1-pro
Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/debug.c  | 2 +-
 tools/perf/util/python.c | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/tools/perf/util/debug.c b/tools/perf/util/debug.c
index 6b5ffe81f141..b7095519419e 100644
--- a/tools/perf/util/debug.c
+++ b/tools/perf/util/debug.c
@@ -55,7 +55,7 @@ FILE *debug_file(void)
 {
 	if (!_debug_file) {
 		debug_set_file(stderr);
-		pr_warning_once("debug_file not set");
+		pr_warning_once("%s not set\n", __func__);
 	}
 	return _debug_file;
 }
diff --git a/tools/perf/util/python.c b/tools/perf/util/python.c
index 690a94fb4f62..95140dfaef9c 100644
--- a/tools/perf/util/python.c
+++ b/tools/perf/util/python.c
@@ -5157,6 +5157,7 @@ PyMODINIT_FUNC PyInit_perf(void)
 
 	/* The page_size is placed in util object. */
 	page_size = sysconf(_SC_PAGE_SIZE);
+	perf_debug_setup();
 
 	Py_INCREF(&pyrf_evlist__type);
 	PyModule_AddObject(module, "evlist", (PyObject *)&pyrf_evlist__type);
-- 
2.56.0.rc1.315.gc6ed9934b7-goog

