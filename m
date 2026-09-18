Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1783C52CCE6
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 21:20:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789766433; cv=none; b=e23Q8mbk+eV23MxcNab+MoRUXLFK8+sjGYPoBk0UQJA9yLEQwZ9u6/9q5OfX2POGgduJHJ5VgnHYYTlxaApJoUudk7EAhgljpJh69X2dcZjAdAElpskTmiTV1bBQgKgakpgZodTTWeZ3aZamLn+HYf6RWRGPaR0ZDTnCKtPhyIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789766433; c=relaxed/simple;
	bh=cUOLtOGC1sSr8NqERNj02XhiosC+nBk1W+33Ik/UsHw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=j5XicgJ4judU937dr0bX9v5tXfWzDbDEW+VOa7sSRjfqMWpBlIVjXFuIpHWucztDHC47U2Hw7CzDLLR32kwnNrTOWAfz07sr7r2NqFsteaWSNhoj3nGfPZ522HoAf5Cv0G3qP+IQux2nbWo+bsgmkiAMbNdadkbAUdTJIAIglrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=NUQmKjMT; arc=none smtp.client-ip=209.85.215.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="NUQmKjMT"
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cbb20f82a0eso859981a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 14:20:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789766431; x=1790371231; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Y1WBF+lhdsNyuuMsRQ/q34du1kWAD6BuZOicdGwPzPk=;
        b=NUQmKjMTubi61Jud9fTtJycULxso2hff1VGta3g6yhGPFrUKoplktsZVE/91RrfHHX
         210kDUmkO61jB6RIJNEfl4C7SaIpZEYebP0AosPZfvUSjZ7j8Tozme+f6DtdXNhsfOaa
         5+4OeUoKrK6ploa/ZoRdDyhdENeyYRnu4RH/X15FftEeqUbFbrtCW1MJpcQFR/FMOVDp
         IA8I+5zvo7T/DpXOO9/Dkq88Bi9rmXfWeNxW/pK37XWFGtLqfB0ZPSZY0WMbY4+rKA9d
         ljVyLv0ZQqzB1NMCjju2rNhGgONSRFt3lLfUixwvLj+1si8q9qSJ6Y9OmQTVAbSlaLFG
         VyXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789766431; x=1790371231;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y1WBF+lhdsNyuuMsRQ/q34du1kWAD6BuZOicdGwPzPk=;
        b=xHgG5TgcqyF0R/DbK9gDoDFN/oX64L+NO/uy63SmU8hV7SH0+xaXgREQMWgmxf+kTy
         b3wM2QK7yVFr4gfqllVxoa9ZkJW5HtU3R0bBDp6NpDK787iZOKYl5Np9HEKQpkz/taS6
         RRFhFds8Vpa2KEvyyWLDMZ7GQh08swmEvZLmRDqo5exwREbfV7YEg/qzreW3OZPVVDtE
         /N1FnQ9OOSArgPtXrAaElMatZ758s/1UFoMf6NxJm0FJybOx0SnP7e2LDP1jQnMBxIu7
         iCH+JoYj2H8qMu6RGLY/qvB78e9LN838GYADR13Q3vSAJxu+12i9FUmCbP46wY7F/eOe
         04Ag==
X-Forwarded-Encrypted: i=1; AKwUvBwQyFVjeZeDz9+ZlaBUYdjS3O9lvfONpD5/dr+kCkOTkSVvZ7w/0LRNUJ64NBMtxX0JT6xitldmLYMMdK0=@vger.kernel.org
X-Gm-Message-State: AFuF++nrUXare4QIfW0s9UZx0tDzYY4SNyUOnaFezeb0Wz8glh1hkHJU
	sbgt5VFGlF63J+6bGwpzHNpSaykMHMFWpY5+u4J5TPC8IlXTXh3bgeE8UI8Ca+AXvk4JSCmXCuP
	2Lch19QCSlw==
X-Received: from dlbds34.prod.google.com ([2002:a05:7022:2522:b0:144:c402:cd22])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:1f88:b0:3da:bea4:6219
 with SMTP id adf61e73a8af0-3dd8c33fc47mr6762375637.20.1789766431253; Fri, 18
 Sep 2026 14:20:31 -0700 (PDT)
Date: Fri, 18 Sep 2026 14:19:31 -0700
In-Reply-To: <20260918211932.2966061-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260918140659.2501976-1-irogers@google.com> <20260918211932.2966061-1-irogers@google.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Message-ID: <20260918211932.2966061-18-irogers@google.com>
Subject: [PATCH v4 17/18] perf test trace_summary: Make non-exclusive
From: Ian Rogers <irogers@google.com>
To: irogers@google.com, acme@kernel.org, namhyung@kernel.org, 
	Howard Chu <howardchu95@gmail.com>
Cc: adrian.hunter@intel.com, james.clark@linaro.org, jolsa@kernel.org, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	mingo@redhat.com, peterz@infradead.org
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
index 4589b4581419..d0196351243d 100755
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

