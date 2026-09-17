Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 464B543CE4B
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 06:43:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789627394; cv=none; b=gqcUPEj9YW9AMh0AaBuQqenuBebJCy7JgA6sNwNZgMCQcVLLuC50GzTKnDkOg0limsTPst7HmW/T8q5FEBr4w973zIerJ7cP3XPKzryyimMfuT9kxXUprOub1yY8w39vpdZRNtq/CeLlfw0us6+Ps5JkuPMsNYq/kaCS/eQPC8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789627394; c=relaxed/simple;
	bh=bYT8WVcurMLOEfyNp8NqaepgaxFS5df3jeYD3CQhJBQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=a3iXTipf8W1mO9fIZk85kbqQpMvMvRH3dyTFHXE+J7QgrkYF8X5s8RfTirLIigW/WnFH+kS5penI6mOcJeiJfd5pgE5EJOF77xs6gflGF1gtiE8UMDeJlr5akis6jDTZpMw4fM1SYTJtFcIsNpFup1vbEzTfs5vPvlB5pUR7cv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=U/51aySQ; arc=none smtp.client-ip=209.85.216.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="U/51aySQ"
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-39deda201bcso945313a91.2
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 23:43:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789627390; x=1790232190; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nhdENFaJa2NETWrV9GF10gghTb/oZJa/1Sd4bZnoKoc=;
        b=U/51aySQiXcMWreHnUjMs0rU92pKmi5owYoef7i0YzbffgT5ocxkj0CFHgvih1XCIZ
         T1CJkpcQJVGJNGhRo8EmaYn1TM1W/WvhjUNI1aanP/NrOv5VNt7JoEVbvGdNsK/BJb6t
         fA9L5uurhI76atheYoTRipBP2GAipyuoXWsyYsBl+CQiGM/wCVP+KccyKbn3FB6czV/l
         bLBvs0d4XMOx5KK5PIsSqONVgn36xHP80GEYKYbw+lfzzztDGPYwZw2phQYfKEfS38DI
         7hMcPJrL+saW3NptVBMtzQpaT99cyPhJIMrOf03BATCeI4sInKJZcTRht39dBH6B4Y0G
         FYrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789627390; x=1790232190;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nhdENFaJa2NETWrV9GF10gghTb/oZJa/1Sd4bZnoKoc=;
        b=tB2n+3vu3k4dTLGueBb4ST4y7aPXvFXWtFpzcqEB2/h6wXsEaJzycG8haXo/HuSDXx
         RHesryVIRj4r3vSKeHIrwMO+EhVVOBZtQgqsn8TeWpVROHw7M/m/QvVR4o6ux/0HhQOI
         TKUOwIC+WRz1WzNAPNZiImxqQVtJ5l/WhbaEUM0kbGzbBrnbjh5MKhqv7qKiGe+bZzLG
         jBOtnm7YVsOGbAOsmYPo2vSiCE4Mvj/GlD8z5ggT3d2GuBTj9lFQNFnwGkqsaVl2M/7w
         VjwiugMaUqcmFmz3CEw5nne2Rb3ELatrqCbrppz/bxKA6inah7xlbW0SnGLbNZpUfsuL
         ggNA==
X-Forwarded-Encrypted: i=1; AKwUvBxF+X7rMHK5lySb8swMXrOEVwjUt/LDgQmDt+1ukf/eJuE6kwUqUfmdG9ZrEgE7QPJonQpTMwr/PStjE94=@vger.kernel.org
X-Gm-Message-State: AFuF++mjl6pfViX2Uf7QvCMqbfVElys7uT0m6125peTb3dKSotUqEgpY
	LftNJ0vTyiq8Mg4HLmZZVHyd3dHguHYLsKGawLHmYUGrGLDeGVFMXxgs1ewbGb/6ZbqovBWARY5
	zxSJxrqXVUg==
X-Received: from dlbut14.prod.google.com ([2002:a05:7022:7e0e:b0:144:c1be:424b])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:4a51:b0:393:19a3:4f1
 with SMTP id 98e67ed59e1d1-39e1e28db8amr11559485a91.6.1789627390174; Wed, 16
 Sep 2026 23:43:10 -0700 (PDT)
Date: Wed, 16 Sep 2026 23:42:34 -0700
In-Reply-To: <cover.1789626977.git.irogers@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <cover.1789626977.git.irogers@google.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Message-ID: <3c8cb15f2d1ce25de658a7ea65bab2a5493c22d1.1789626978.git.irogers@google.com>
Subject: [PATCH v1 12/13] perf test trace_summary: Make non-exclusive
From: Ian Rogers <irogers@google.com>
To: Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, James Clark <james.clark@linaro.org>, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"

trace_summary.sh tests various summary modes of `perf trace`. It already
directs output to a unique temporary file without polluting the current
working directory.

Remove the (exclusive) tag so it can run concurrently in parallel test
runs.

Running perf trace in parallel is only safe now that the probe tests no
longer name their probes "vfs_getname...": perf trace opens everything
matching a hardcoded "probe:vfs_getname*" wildcard, which used to pin
those probes and make their cleanup fail with -EBUSY.

Assisted-by: Antigravity:gemini-3.1-pro
Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/tests/shell/trace_summary.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/perf/tests/shell/trace_summary.sh b/tools/perf/tests/shell/trace_summary.sh
index f975176247b5..e2834bc4eee6 100755
--- a/tools/perf/tests/shell/trace_summary.sh
+++ b/tools/perf/tests/shell/trace_summary.sh
@@ -1,5 +1,5 @@
 #!/bin/bash
-# perf trace summary (exclusive)
+# perf trace summary
 # SPDX-License-Identifier: GPL-2.0
 
 # Check that perf trace works with various summary mode
-- 
2.55.0.1082.g2b9226bbc0-goog

