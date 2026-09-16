Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C60E3EAC8D
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 06:13:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789539201; cv=none; b=RRGXVpmzbwWffF8keaSmcgU5WYxsahayKVivmJfE+MWyobl22RMka9TE1uRC0gpAbsdEAgVQz+o3HW/um0uym7xMB20hTclfUYHD7rtPmfHaEBfHmL9jBQS5YSRG540PQVy/zHmqMp4QqJ1fK2eGF0cBQAas39qyxTR8w+ugUMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789539201; c=relaxed/simple;
	bh=468xVfbn+0XdK7xEFVTNW5kercEQE4h92XSg5yNP3F8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Content-Type; b=SWO8vNrGnYhDA+vd0QJYYgJcoiI+ctmEDYOdNQj+AjIlqtcjMd0qyau/8g978IjzHCGqEukWnUI4rHx2E68ABF62VukzgIgUVfe0jOiyDbCNhiXt2xl3maKPvpjIw9HmTYsznTfKXhHn9ag/+uphN9iMDJlI3zSkZD3MjZIJly0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=kxEUuyYO; arc=none smtp.client-ip=209.85.216.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="kxEUuyYO"
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-39de4a68f7cso5049711a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 23:13:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789539199; x=1790143999; darn=vger.kernel.org;
        h=content-type:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vR5Z3qVkhKQF/LqVThiaZx4q5xKuQTz4oWFML5HFRTo=;
        b=kxEUuyYOvn/+Y6n7q0Nz2BcJKLM54rn+mBsUYj4K0k6phwoV2BgGbxwRLBCXvicYzQ
         T+kTVH3pdG93ff9PE3roaKHhOwcEpt9TtUcbbYPxlnp+tVz7qZ4MOFIF296gM0NItF7h
         7vdHRYSm2C7A0ANlnjcduJ7G9GVlymPOZX9AaLYESZwHgcSSZ2RhaicacpbjukqFy0OG
         bBCNpzpoO+pr+U39shCMpj6zimTvOgQWLKA+V5Igpcr6on9RM3/8g56dqKVH0WyLii/Y
         aZnnniYtE/QTMRx13lJcqCqxokGBkxHAnshpnj0M5nJ+NPxrtCA7lobUPDgFW0FP+v8B
         EqWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789539199; x=1790143999;
        h=content-type:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vR5Z3qVkhKQF/LqVThiaZx4q5xKuQTz4oWFML5HFRTo=;
        b=1FAGnq8BhJWpqf/wGvr80TqeXXMfoTDBPEzhlbzo4wfRNSDG4JiOQs7uabMonKBYUV
         aXt0I1puw+UNfFwH3BAe70Kht+QPe7DFj93LdHwH7NHa25govOzT7mkf9ucj494mS8bd
         l8D75j+BeV4vfcU92u68MnsDG+ggNovlMk67ZmDKQG3rg9+UZXiJXYtJe44NXdRucz3F
         26e7s/KsoayGndUKuenzu4i31vFtaXqehaLREJxNmMtpqWQ4wh5qXIoqWYmhj5ZUplWQ
         tisplSA4mN6I83sZ1POP85btU42aXihTrV38INgOOBe1etRIF5RRrEGco0UoSSaCNNGr
         +AHQ==
X-Forwarded-Encrypted: i=1; AKwUvBw+0qKiASepMFdN4ser0AjGYpH1b4A7+C1wM879OgZ9yGVY4RxN/Pyh5IZrmKl4eLsFsr9GEVFLHS36EW4=@vger.kernel.org
X-Gm-Message-State: AFuF++m6pW5fHv31YfXYGQqbjhcyViwgrCC6clBItZ4pFjUAnO8wV6wA
	9VEzIdhUp6mTgS2J2Q8vWvLQFuX3MNbtBjNOc8cgI1ZIb0QRE47v4f4Qth6cn2QSNgH0ymhSTGV
	W0zfSfMQgbg==
X-Received: from dyay26.prod.google.com ([2002:a05:693c:62da:b0:339:7600:c341])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:3c41:b0:39d:fe64:5733
 with SMTP id 98e67ed59e1d1-39e1e5612demr4059471a91.24.1789539199252; Tue, 15
 Sep 2026 23:13:19 -0700 (PDT)
Date: Tue, 15 Sep 2026 23:12:13 -0700
In-Reply-To: <20260916061218.3061216-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260916061218.3061216-1-irogers@google.com>
X-Mailer: git-send-email 2.55.0.1032.g73a4cd73de-goog
Message-ID: <20260916061218.3061216-5-irogers@google.com>
Subject: [PATCH 4/9] perf pmu: Include the headers that are used
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	James Clark <james.clark@linaro.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Thomas Richter <tmricht@linux.ibm.com>, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

pmu.c uses errno, free() and the str*() functions but declares none of
them directly. <string.h> arrives by way of <linux/string.h>, and
<errno.h> and <stdlib.h> come from whatever the other headers happen to
drag in, which is fragile and breaks on C libraries that don't nest
their headers the same way.

Include the three directly.

<ctype.h> is deliberately not added. The isdigit(), tolower() and
toupper() used here are the macros from <linux/ctype.h>, which is
included on purpose and documents that it doesn't handle EOF the way the
standard C library does, so pulling in <ctype.h> would change which
implementation is used.

size_t is left alone too, as <stdio.h> is already included directly and
declares it.

No functional change.

Signed-off-by: Ian Rogers <irogers@google.com>
Assisted-by: Antigravity:gemini-3.1-pro
---
 tools/perf/util/pmu.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/tools/perf/util/pmu.c b/tools/perf/util/pmu.c
index 836e3b5615cd..744e253e851f 100644
--- a/tools/perf/util/pmu.c
+++ b/tools/perf/util/pmu.c
@@ -8,8 +8,11 @@
 #include <fcntl.h>
 #include <sys/stat.h>
 #include <unistd.h>
-#include <stdio.h>
+#include <errno.h>
 #include <stdbool.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
 #include <dirent.h>
 #include <api/fs/fs.h>
 #include <api/io.h>
-- 
2.55.0.1032.g73a4cd73de-goog

