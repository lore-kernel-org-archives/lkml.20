Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com [209.85.161.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B37C63E4110
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 04:53:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789620830; cv=none; b=EvbZE3X69CkWSr3jJl3+dlsc5hXjRRvCkCWqeT0HlsnSHCjndoqKpVrqRWSsTLkiyxtxKHXHkXSXO1Kz8b6VFiZ/HgOofPWMvEFaOusBbck4yme3BjB5zLbsqwBYxWy2S+3Q9AhYnfjNQtfV2E999getVR4XaRBB0g7Lxsy3jq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789620830; c=relaxed/simple;
	bh=qHu8O6bKMJi1Q+A7KlfHsVcSSZH8sm8qHnQHCRtDrWA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=R5JDVXwR+FqqF/wXJ4dg8T0UD7JyHWQZM7IWvJMqCXE1QHhzu8TsuwzCZfqgql6WQIUnJFk0VePgRcMhJNX8Zj2c+Rxil+yOt6I7iJI3b1yAjLcFMJJqc7OOB9xgrhwC0Wft3hTEKAJoIh7U8ymzgofDtTN6/feZ0FGqb/tvdt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=CKHbwrcE; arc=none smtp.client-ip=209.85.161.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="CKHbwrcE"
Received: by mail-oo1-f70.google.com with SMTP id 006d021491bc7-6b1a3f01d2aso624708eaf.1
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 21:53:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789620827; x=1790225627; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uQCmW4sxjAYeijHrikCdGvMhBKSxI0fTqTZnViWlMyA=;
        b=CKHbwrcE0MQi8oBaZhDAsH0jFGLWw7DvqPSSMAExoGzNxYhuwTnyC+1leBYACVCvqe
         zsbNKN3JNvBlXLiEoVva99AO7vOJdc0UBLAZwWBXnPoqfxmBpbIeVheSvBZdUlVxdxnV
         V17FzrZFvRe836mi9DsrB0YPLctk4hRBKlDi89235aO7NRGJJrpAAvOkZI2lwolGyrZt
         FYkFfT7EzLIxxXvvWSlB2O/adYKMbqqD7boJCedU7L3omXwJgQO7/96RsUamSaQDOMyb
         +LCShyk8scncJUIh/zuzWzK0zSu3j2xEggJlFi1I1ngqV1wcJ9dlopwzQUtqV//tZMm0
         b7Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789620827; x=1790225627;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uQCmW4sxjAYeijHrikCdGvMhBKSxI0fTqTZnViWlMyA=;
        b=Bcz2R1FXzB7V1WnnuWY/J9Pu0ip8UIRFwv73a9HLw0831m1so2BbIEbz4ooyZhM6/4
         AzZe9rV4v97B6S82vSRtYyFCOax3Ed8Q6hY25tKKYHke49SkzTC7xiIuSNR7aBBn5ZVm
         55Y9ovqdl2FIRcO1xdnm6d7GbJ/3ENojRHigjsQEbeQ4zlLU77KebfZMTTlswoSDbzMs
         czgtnt1E3Y4LB8V8Bz7rTvqWYw51f/DA3iLlWhBDclJbkzalTmQcnkh8Hm4ajOSrxiev
         asBAKm0mCoUZDb4vQOjdP0GVrtTk9F5So0sErB3gVKTYA5jgKbmi/HQ4sUbqZVNdSJXX
         yLZQ==
X-Forwarded-Encrypted: i=1; AKwUvBziJ2UWy4adGm9CBvDa5JI4rS7XW6w7BtPbavIU+6ih2L2xGLLWHLZYzLJrLN7Y8+VDpsHOu4kHW0QfJpM=@vger.kernel.org
X-Gm-Message-State: AFuF++nFna4coZTiM56hCARMNwmvEUvA/xvzlDPYzfzVL40TLLfIeq6+
	2FViVFixLcyuaccf8TlAW3T+SKxAYIRFThhK1O9CYrAUUNBBp6cgoCBUcraJ84uXMTlEqGAKxkR
	0ALwLSh4bFQ==
X-Received: from dybfx29.prod.google.com ([2002:a05:7300:c39d:b0:328:3ef3:fe03])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6820:81d8:b0:6aa:e573:9ce0
 with SMTP id 006d021491bc7-6c7d16ce206mr5504911eaf.16.1789620826988; Wed, 16
 Sep 2026 21:53:46 -0700 (PDT)
Date: Wed, 16 Sep 2026 21:53:22 -0700
In-Reply-To: <20260917045326.63601-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260917045326.63601-1-irogers@google.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Message-ID: <20260917045326.63601-7-irogers@google.com>
Subject: [PATCH v1 07/11] perf ui annotate-data: missing explicit inclusion of
 stdlib.h and stdio.h
From: Ian Rogers <irogers@google.com>
To: Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	James Clark <james.clark@linaro.org>, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Cc: sashiko-bot@kernel.org
Content-Type: text/plain; charset="UTF-8"

Sashiko reported:

  When compiling the Linux kernel performance tools (perf) on a system
  using musl libc, a build failure occurs in
  tools/perf/ui/browsers/annotate-data.c due to missing standard
  header inclusions.

  The source file directly invokes standard POSIX library functions
  such as calloc(), free(), and snprintf() without explicitly
  including <stdlib.h> and <stdio.h>. While glibc implicitly pulls in
  these declarations via other included headers, musl libc strictly
  separates standard header declarations and does not implicitly
  expose them. This namespace isolation causes the compiler to
  generate implicit-function-declaration errors when encountering
  these undeclared identifiers, permanently failing the build.

Add the header files and use git clang-format to sort.

Reported-by: sashiko-bot@kernel.org
Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/ui/browsers/annotate-data.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/tools/perf/ui/browsers/annotate-data.c b/tools/perf/ui/browsers/annotate-data.c
index c6e07a9b6408..5ec02bfe30e4 100644
--- a/tools/perf/ui/browsers/annotate-data.c
+++ b/tools/perf/ui/browsers/annotate-data.c
@@ -1,6 +1,9 @@
 // SPDX-License-Identifier: GPL-2.0
 #include <inttypes.h>
+#include <stdio.h>
+#include <stdlib.h>
 #include <string.h>
+
 #include <linux/zalloc.h>
 #include <sys/ttydefaults.h>
 
@@ -10,8 +13,8 @@
 #include "ui/ui.h"
 #include "util/annotate.h"
 #include "util/annotate-data.h"
-#include "util/evsel.h"
 #include "util/evlist.h"
+#include "util/evsel.h"
 #include "util/sort.h"
 
 #define FOLDED_SIGN  '+'
-- 
2.55.0.1082.g2b9226bbc0-goog

