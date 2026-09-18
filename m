Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AF91381EB0
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 14:07:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789740435; cv=none; b=B8yWif269EXOuDxeNb6Cfqn+jvwwfaPJA+xPgoTnmHNViGLgu9hoV/jjr7QVjlLYmluOSioTi/IoEdPGpKKdoT4EdmNfSp2wNuWleblT86R4ih6sNvb5AIOLXn7aOvVYp150Q6hoj8hHC9dog91EdVXpGXiHBZNfPCcGPr3Sc3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789740435; c=relaxed/simple;
	bh=Bl7p5fPq1zzv8earO2MgxKfTQKk3Ks5v1cj5G/bckVs=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=m4ui9eiMg2POd4/Ps205hdORD/tN50Wc298kwNQX4c+Fg+LlHAImqFdOBDqmhBf7v9rS9DYdYEFyw4Szy5VB07RT/H+Au9/jLmr2TvwsUYxdoAOH0XevGfbK84vgUtl1tYGdaJnzDMMEdAJHEgKrpSy7pDEwKyirmndVJPHNhGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=fXSCiMAK; arc=none smtp.client-ip=209.85.214.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="fXSCiMAK"
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2d6fed0652bso9713135ad.2
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 07:07:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789740433; x=1790345233; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=q198WRfVuFdwy23wGpDOJAEDHlwObTAenaQ9DfUue+I=;
        b=fXSCiMAKa97YGNMs+LkDya3DxPrgvryHUnstG/fH+r5fkwNAf4iDQV9klWEarRaG+T
         p5gqsrx93XLwdW6bESa/fwO+8Zy7AoVzP9ySLXUkuuIsNg0cKSVQLrFNPc9VuDZ681Yq
         +y6/O1vb6+ftwNHjUHRZqweMYAfGhpsJWG1V7PBP5K7C5ahX+oFcxV5wJEH9k+20eDC/
         OD6fgpqZOwLlxsV0WrUWIjUOCTKocHeoKtqqR4txwp+umNkLbMbP1TGYI4h2Th4qEvne
         tkagdY/I3trPp+FmEfdgNd2b6VCh9XpL74Nrctj9uqQ5OkLjGk6aBdO/lGaKGTyhAh4S
         2kgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789740433; x=1790345233;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=q198WRfVuFdwy23wGpDOJAEDHlwObTAenaQ9DfUue+I=;
        b=lsyZePReyVsiCWZO4iPqLW/o8O4mB3eFIuHJGJoV3f73LAskmoHm52H1Q8Ofiu//Ir
         yYn90soGEJEoFN571q6VvBSxVA0gtg9TfmNeTzRsZIxLXe96WN3JQoteG6wBjdSW/soG
         +nDomy4QmSfhluEs2r72h4idENpEgT/oV1x7OmTo32a2PX4yNVlOrDAEtdKrpLXE4jN8
         ZZKccOX2+nZp99jRSeoHcAAxdkVQhtZbaZExHcAt+ahz2jl6BBc627gZkwRrA/ZJRfJT
         b9rtV3ShhLHxX/hWi/rTK43nUQs/GZSOCJqYpSNH6W4uQem0QjhofDfut0XJfdLndTGo
         pr1g==
X-Forwarded-Encrypted: i=1; AKwUvBwtXQ1a+ANxwi8fwdRFyTzy4mDxWv38IvFdXi9m84Mb88TgnHwphIbp7e2nleSVic3PllG81osqpr6nqeY=@vger.kernel.org
X-Gm-Message-State: AFuF++mXIqGHHb8q2nD1Db8p0L1hfMxICEEzUr6jUHjDJzwaWF9O5Jh8
	l+D3QptZjsfwN18ixUJLyBUkO4DYPwyMdUl2mL9cGsTAXqFcfPlmwtIpr4bw5B3PBquBGdLv1Pm
	r8rVI41lZnA==
X-Received: from dybfx26.prod.google.com ([2002:a05:7300:c39a:b0:33c:2bb7:a004])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:2784:b0:39e:6a80:dda2
 with SMTP id 98e67ed59e1d1-39e6a810c3bmr76211a91.41.1789740432456; Fri, 18
 Sep 2026 07:07:12 -0700 (PDT)
Date: Fri, 18 Sep 2026 07:06:44 -0700
In-Reply-To: <20260918140659.2501976-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <cover.1789662556.git.irogers@google.com> <20260918140659.2501976-1-irogers@google.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Message-ID: <20260918140659.2501976-2-irogers@google.com>
Subject: [PATCH v3 01/16] perf trace: Include the headers declaring pid_t,
 strcmp and assert
From: Ian Rogers <irogers@google.com>
To: irogers@google.com, acme@kernel.org, namhyung@kernel.org
Cc: adrian.hunter@intel.com, james.clark@linaro.org, jolsa@kernel.org, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	mingo@redhat.com, peterz@infradead.org
Content-Type: text/plain; charset="UTF-8"

trace_augment.h uses pid_t in the augmented_syscalls__set_filter_pids()
prototype and in the !HAVE_BPF_SKEL stub. bpf_trace_augment.c calls
strcmp() in augmented_syscalls__find_by_title() and assert() in
augmented_syscalls__create_bpf_output(), but neither pulls in the header
that declares what it uses. Both happen to build today only because
something else in the include chain drags <sys/types.h>, <string.h> and
<assert.h> in first, which is not guaranteed and does not hold on libcs
such as musl that keep the POSIX namespaces strictly separated.

Include <sys/types.h>, <string.h> and <assert.h> explicitly.

Assisted-by: Antigravity:gemini-3.1-pro
Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/bpf_trace_augment.c | 2 ++
 tools/perf/util/trace_augment.h     | 1 +
 2 files changed, 3 insertions(+)

diff --git a/tools/perf/util/bpf_trace_augment.c b/tools/perf/util/bpf_trace_augment.c
index a9cf2a77ded1..ebb26225fb04 100644
--- a/tools/perf/util/bpf_trace_augment.c
+++ b/tools/perf/util/bpf_trace_augment.c
@@ -1,5 +1,7 @@
+#include <assert.h>
 #include <bpf/libbpf.h>
 #include <internal/xyarray.h>
+#include <string.h>
 
 #include "bpf_skel/augmented_raw_syscalls.skel.h"
 #include "debug.h"
diff --git a/tools/perf/util/trace_augment.h b/tools/perf/util/trace_augment.h
index 4f729bc67753..a1cd9a5e0213 100644
--- a/tools/perf/util/trace_augment.h
+++ b/tools/perf/util/trace_augment.h
@@ -2,6 +2,7 @@
 #define TRACE_AUGMENT_H
 
 #include <linux/compiler.h>
+#include <sys/types.h>
 
 struct bpf_program;
 struct evlist;
-- 
2.55.0.1082.g2b9226bbc0-goog

