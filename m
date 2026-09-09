Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 120D141D635
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 22:21:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788992463; cv=none; b=VXkmbaW7ZZKXS0xcvuC8ap2UBg2XgUHP20BXODezI8iVPyGh8/iV9F97sfJXPsY50rd0R7IPnZiOdSVUswRJPu4/bxkaI8wAK/4cZ6kRmuIv5LFMXEZxqYy8oupvyijeXdaHzT/C3IQALe9Z6aP2IIcvo0bjA6qcnvOMG/0l/eQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788992463; c=relaxed/simple;
	bh=VZ+QrtQv7xI7B3IQVjbQxMe+h2xaBR/0SDyIoRVpkXI=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Content-Type; b=UjjkFlgLVM3MoqjoHjmQD2R8jK0YS+FOCIxObKB1u4kQXsHCbYaklhQ4bRmuRwnQvcdIXrv/nxWNfLpW5B4FVv4C8KWB8cQY4LI0fGRJLPHePKABXg4OTUbnAm2A77gdLk8ywxGrUp1juNm+JB1ZB61knTPMKeqHmIFjeU6CaNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Qs19EF5e; arc=none smtp.client-ip=209.85.216.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Qs19EF5e"
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3968bb86fb7so7902361a91.2
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 15:21:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788992461; x=1789597261; darn=vger.kernel.org;
        h=content-type:to:from:subject:message-id:mime-version:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=/mH/R/7XHDTfSxv2g6sI7/hAPq1nkMVsTHrzOC/yfi4=;
        b=Qs19EF5e2SeTMSYvwl5Svuhz22bFT6NL8gj098h6+ui26Y5OjiP8J3Iy/94EdvilJX
         QOJOyWX69En9FLF1Qc0C3scfUeHGjOZh7MB2Exu9ekswOItsD+qlZiF4mdo40bl8pmYv
         pbv+diwI4Tj8BNq6hl1sfQO1/DEjxasE4/IsalkkQUJAk7Uc+YDMv+KFB3X57yo8/ltd
         nVYirMhWzlEx+ky5e8xnDINEJfWjVuml6O1IUB0N+fEb1T8Lg8rsdOFDvgcKcff+3qfn
         IJCJwtWqw85UIouIi2ojPePzj+69As2s6z3/OSiD4lVhnayjqCRtr8eew/gHoxnz5116
         rBXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788992461; x=1789597261;
        h=content-type:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/mH/R/7XHDTfSxv2g6sI7/hAPq1nkMVsTHrzOC/yfi4=;
        b=nvUQxjZJ4ZTj9CRphUTwehQCCc+jPgwkU4OeHqvyx4a1xz/t5bMyQnIiqffld6qCf8
         Du7cp7wgU6Q0oKD5BC0WyRC/l6l6O9cHUTC/Dz1Cn8XO/9eg1B+HSjev/ZMEZORaNZb1
         0hvsPH9VJ6H4gk6EPzelv/y7BARRBXyWETWpWcipOotwqLndn7OH8ZZyZQr3NVXa33Ke
         5sibd09GdoCHgMGp/fHYSE5txIU1snKDggCZnV6zrOW/VpWCWY2SYwf6gcRCZDJ7SmkC
         AMgUKEdXI4bobApeHx1xHkSFI7Utz5RgeQ7xCwqO6OsOPgOXjNYS+XtPmBbS06Cd7YZ+
         oD5Q==
X-Forwarded-Encrypted: i=1; AKwUvBwuYWrH1aWJfUO1uCpEko13UGWSgGy1jw7/W1UW/qhQQwdogqliukbHpUnyUVekrEADxDhxRGyY3W3EXzY=@vger.kernel.org
X-Gm-Message-State: AFuF++lYqg1mCIHvYDJpJJhg0OkgDGirhgBv4wxluFGJRKAWlCJ0Lvsf
	fG/4q8FnbdbOR3J3/pEWr4GAmu7qekhhZIHzavOw2ur+Oq0AwgNyM78OJoDA7d6IvNKxEVU7LiU
	7cg1kd6yiMw==
X-Received: from dlj39.prod.google.com ([2002:a05:7022:527:b0:143:355c:770e])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:264e:b0:398:9bd1:3215
 with SMTP id 98e67ed59e1d1-39b262e28cdmr59756112a91.22.1788992460252; Wed, 09
 Sep 2026 15:21:00 -0700 (PDT)
Date: Wed,  9 Sep 2026 15:20:48 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.55.0.1003.g10538fe699-goog
Message-ID: <20260909222048.2138387-1-irogers@google.com>
Subject: [PATCH v1] perf test x86: Fix missing __msan_unpoison
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	James Clark <james.clark@linaro.org>, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

__msan_unpoison may need the sanitizer header including for its
definition.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/arch/x86/tests/dwarf-unwind.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tools/perf/arch/x86/tests/dwarf-unwind.c b/tools/perf/arch/x86/tests/dwarf-unwind.c
index 99d2b7ed016f..3c66dadcab75 100644
--- a/tools/perf/arch/x86/tests/dwarf-unwind.c
+++ b/tools/perf/arch/x86/tests/dwarf-unwind.c
@@ -8,6 +8,10 @@
 #include "debug.h"
 #include "tests/tests.h"
 
+#if defined(MEMORY_SANITIZER) && !defined(__msan_unpoison)
+# include <sanitizer/msan_interface.h>
+#endif
+
 #define STACK_SIZE 8192
 
 static int sample_ustack(struct perf_sample *sample,
-- 
2.55.0.1003.g10538fe699-goog

