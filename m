Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 413E947044D
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 06:59:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790665157; cv=none; b=dneGkdUTKjsmM0TIBmPWrZXTlZmm86IKi++sPFX4NKGyUSAhDbYjcAEOCuG8a7VqfP0L6qKpnoMtoV1FKp2GEsbOp4MDnXnlJwbcJNt4K3ywEEM80wV8dc+wXAqcHyUok7id8nhciK5p60Z/K9yZEBZ8bUzfZM10xK4iBbECsl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790665157; c=relaxed/simple;
	bh=EzNAQc+zqELLfEsqlQ1kpZ+oVvfzTZI1o5rnigTKwoY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=jkffTy43FhG0UfdxTFL6889i5Yx3a05flk6kYW8UgzAq/ydbOTSmp6TFmuCEnYUJZz32xAI6YmqUYGsPIYo7XmcFxvxEbCSE559RaPW2Amv/UxUgyZ2sloNKp7SQHe1LjofOWxIMtFoogqX/wZyhQ4ZRnZQ7wVadqeR7FVvQVKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=P3q9Vrjx; arc=none smtp.client-ip=74.125.82.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="P3q9Vrjx"
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-14373747468so3590610c88.1
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 23:59:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790665155; x=1791269955; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f4/IsA7upi/zbnOhoxbNy0tZ5zJbyc70QixREWB/C8w=;
        b=P3q9VrjxPyAEUOv8epBOBhlrWXiBBbZPkXE7HVjIUnO4kMc7UgUzxU7Q63ooY57XaV
         dgmpWX5mYtQocJJrXmXWyMz0VpKlYKz/6dQV3yR8KFWOI96Vt9Fhrpt3WttyfplRElV7
         6EKx9yhYTs1TFxomljPPYGfomgO4RAnKtyVnzbNI9REOTl9uBIrU+wnCrAyNPai1vDVn
         QBhQ4P8NZEFsQQS97coVNOF7qnrYzwX5Q1dTndB4+lVEBbAg4SJ6HeHAZs+Az4IYRz0D
         IoCyeaCQV/RZJenLAQTRXSu0OZgEt41ATCuFmhDgZgJQ21+gZDietBUSdz0RVYHZM853
         xrFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790665155; x=1791269955;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f4/IsA7upi/zbnOhoxbNy0tZ5zJbyc70QixREWB/C8w=;
        b=r1jx170+lUzBeTxHARLwo84a1y42Ke/X+slqD6SXBN0D88qcgB0z7l08y1uDqZJGfu
         GVE9c+GZ7MMGTb0TU/MdNKjFjtILCY9BroX66JOhEL2CzZ0HqlrukIkqTNjkLzpdHgAQ
         QIReJA7sNAw5FLRkq9lHO0t5LiEOVbdXz7owEuYPGSKibrphg5kNeM6Ij3KlzbMiOw2V
         hd9YAny5jQOrcL1QBwqe3V5RKxsuZ/8uY8thpgzA0TxF2a/DcFqbS3TAa4wZ6bkO8Ys5
         oZHcbRzQeIqBCEAm32vOgY2PRkjV0jWWT9sfb2BZfY7mNORHLNVD4F7HhIBmJMwE/ZAj
         YUvg==
X-Forwarded-Encrypted: i=1; AKwUvBz/J56MHo1HXc1tM7S5cuuI2aArMuwitgBsirbZYU7KuK5JGNaWtYE4YRfuhg/z0h3ANL1f081bqJ7Zgv8=@vger.kernel.org
X-Gm-Message-State: AFuF++mVoG/AGivgqQ4eOqJn1WGfDOImgxQQPcXyhFN29kXW7/ugIOkY
	yMWP2nYPDThL/JmP2o+T0C7zNB8WRu4spbvsnE/aknjRvPqzp+IQruFXxAJXd2ey29FtW0TRanm
	2ed4YwrCrAQ==
X-Received: from dlbrn7.prod.google.com ([2002:a05:7022:1507:b0:143:8a67:84b5])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:701b:2413:b0:14a:8cff:fbb8
 with SMTP id a92af1059eb24-14a8cfffce7mr4019736c88.28.1790665155069; Mon, 28
 Sep 2026 23:59:15 -0700 (PDT)
Date: Mon, 28 Sep 2026 23:58:38 -0700
In-Reply-To: <20260929065839.407062-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260929062937.374137-1-irogers@google.com> <20260929065839.407062-1-irogers@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20260929065839.407062-9-irogers@google.com>
Subject: [PATCH v3 8/9] perf python: Initialize debug output on module load
From: Ian Rogers <irogers@google.com>
To: irogers@google.com, acme@kernel.org, namhyung@kernel.org
Cc: adrian.hunter@intel.com, james.clark@linaro.org, jolsa@kernel.org, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	mingo@redhat.com, peterz@infradead.org
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

