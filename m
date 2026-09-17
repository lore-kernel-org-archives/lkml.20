Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AACB0535FC6
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 16:39:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789663164; cv=none; b=M1OwsNTOlSRdLjZ0m7k++DtPBOCx6jOgGYGnhMa4RWanCG2lzfHGE2E+9wVFB4LZTsrNnn5FUO/49ynMBv+wJXMJuJ/sRwDbGLnr/4rvaeQFGBhfssBfJnLuiTAoT/4Xsu/qJqYzzm3/h99ogqj/RUQrmFTLetPJNZTp+VSECOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789663164; c=relaxed/simple;
	bh=xYFb7KrlnFBtiQCizxjL5ae9GoQJbsdU7CQpwojZPz0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=uuReqbK2Dfs9XyDrc++4Fowv/HVweRMkrIXIIJBReqjefjjS0buKv+6/ro0tqIwyNFthDhBvyxRtoFsu98wDjQaA1s9MShNqK7oZ3r0P2y+sbRwxryE9C7LouOPBaz2mj75gukzpBXy78McRqr4GjaRfYLiLyDchnE1rUuiW0p8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=edScdP4R; arc=none smtp.client-ip=209.85.215.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="edScdP4R"
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cc4c1fc9ceaso891872a12.3
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 09:39:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789663162; x=1790267962; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uUd9WjVfjgowKTAkXb9MOe+SxJo72UohOo/hwZzelmo=;
        b=edScdP4RGYgggkN7gGlxO9jY16X+Pv3AvPRVNyrGJCgaVr4ttROng/sbGw4sfueph3
         PQrU7COCOzxRDH7rNBbJLvmbStbw80+qPt+SUSiOzSJOxVchmCSYRNVBBGkeWZFboEaC
         WOtcthDcStrEVdcNYlj9J3O9L5i4xd4UxSqE68uDomLyenwfflQ8GphjCiM2Ekg+3f7M
         Q114ik2w1AXVFoQduFtoTwzT4+rwFdne3nKu6LUiINo7PJNAwMdgPaBxzO2OKCtpQhep
         cOx3UsJxpplH3r1mhAH2yWXrvkwDgHAlDdfxGUDEy9YymEx5DtreB4FmC5jlp79fVPL2
         9iLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789663162; x=1790267962;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uUd9WjVfjgowKTAkXb9MOe+SxJo72UohOo/hwZzelmo=;
        b=s5TFqcICDnxhTrzm3CYXVVwZuZEn4bzCqyOQ1UHYaOyWrzwS9EUU0cHbVPBfxcxdal
         N/WHeG2W86/0T7sKUwM2IbdcRD2C4/FB82AC5TgkhrYT5WiDOPszsiWuEZBcPAHtLE8D
         Grya1p9RRqZKGKzk3Qyh3U77dcTkMHFFN+mFGlFcOBbTHweVAKVYL2EdCcdu8lkbQH3x
         5uFBW76s6WP7TpvDqAlqVygoz9j0RhrCcbBzgX1n1iO0sjweMXVGw36LggVYMrDnYn74
         FrzfP2D8vPCdVnhLbW4cVfwUJAZ2in5YT5hyP+/2uZhNqF5SVV9owLJ6rYE7VF1bhuFO
         3TzA==
X-Forwarded-Encrypted: i=1; AKwUvBx7NRCBc38KkxNI1HzCt+EdrH/e8dBIxL7lhEhb3ia9Kz1F1H6mdetOwpESKfqdHvnyHvbW1w1AE817cuE=@vger.kernel.org
X-Gm-Message-State: AFuF++lCH25Me3q0hVPfAei4ycqSllEgnh1AhQDX7pnLLnOj9teb9z+u
	kvAatS6rXHqjIWMRH0qsceAi4ZIbDdJg6NnvgVNcBWMxKXNnbtxppdpr4KdMHxPKjhayENgepTB
	94OVfaEHmTA==
X-Received: from dloo7-n1.prod.google.com ([2002:a05:7023:a47:10b0:143:7976:20e7])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6300:6698:b0:3d3:adbf:7779
 with SMTP id adf61e73a8af0-3dd5f716752mr18481261637.21.1789663161768; Thu, 17
 Sep 2026 09:39:21 -0700 (PDT)
Date: Thu, 17 Sep 2026 09:38:49 -0700
In-Reply-To: <cover.1789662556.git.irogers@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <cover.1789662556.git.irogers@google.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Message-ID: <73ad72faa38e0287b3ead119e28ac15e0caac34c.1789662556.git.irogers@google.com>
Subject: [PATCH v2 01/14] perf trace: Include the headers declaring pid_t and strcmp
From: Ian Rogers <irogers@google.com>
To: irogers@google.com, acme@kernel.org, namhyung@kernel.org
Cc: adrian.hunter@intel.com, james.clark@linaro.org, jolsa@kernel.org, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	mingo@redhat.com, peterz@infradead.org
Content-Type: text/plain; charset="UTF-8"

trace_augment.h uses pid_t in the augmented_syscalls__set_filter_pids()
prototype and in the !HAVE_BPF_SKEL stub, and bpf_trace_augment.c calls
strcmp() in augmented_syscalls__find_by_title(), but neither pulls in
the header that declares what it uses. Both happen to build today only
because something else in the include chain drags <sys/types.h> and
<string.h> in first, which is not guaranteed and does not hold on libcs
such as musl that keep the POSIX namespaces strictly separated.

Include <sys/types.h> and <string.h> explicitly.

Assisted-by: Antigravity:gemini-3.1-pro
Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/bpf_trace_augment.c | 1 +
 tools/perf/util/trace_augment.h     | 1 +
 2 files changed, 2 insertions(+)

diff --git a/tools/perf/util/bpf_trace_augment.c b/tools/perf/util/bpf_trace_augment.c
index a9cf2a77ded1..645819d79b6d 100644
--- a/tools/perf/util/bpf_trace_augment.c
+++ b/tools/perf/util/bpf_trace_augment.c
@@ -1,5 +1,6 @@
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

