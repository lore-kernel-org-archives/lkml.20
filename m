Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792965885;
	b=F+nmbf7uYRTVjOQU+0AHrYeO1ouRnTxfFDv7fkUhCCbFn1x4uvygRK9AVWU9asufTnBD
	 WbhPKy1qS6FkLpq2rbp9VXYlVjlYR2Sd1IppNAbVN6dpTVCAbLfX9tFbXp2V+SMG+RPj7
	 R4wc6YCG5xOGc1otK+6WoXwimd+x7pmFahA9oSVZ1SeB3XdVPXARS80ZD2L1mHnzWDun1
	 txNE5NhNv30Xo3z2av2vdWHTNxtDjxTbkUfMEvq8owSqN+Y886GRXi9DXduyIxhw6zeIu
	 8n5nFp7pNkQktXnlbHpT+cUWlWzufUbLXRZMkTOUN3XSofo4SmwRg+t/d0O3ySGhFig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792965885;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Content-Type;
	bh=hKZUnu5wtT1E98Kxc/nSegz23tYHL1tF4broOYTq818=;
	b=ZZBr4o371xiphGWlamicjaZNq+7WT/6nVGFlA1/VaP4ubeh05XyfsVCoNPu7bM6RUf9d
	 s5AOZStXBHPtlKpz4xq4XFZ8/mr4JVbPt3dP+WAJr7mgTbaxfdBN9ZuueW9r0vp3EyWvB
	 NCrPhmOAPVyzKKwgE3bWbN3AbyAeXNTGdCAEYL7NwOuKBunSeUg+jYmMQ+VEDBULBbOYP
	 fi/9TT7JVxSH5aj7++ndMeZbIprJK6eJZy8Pi6EDdT3+XjnTEQ6n1N7nQHHBNouEBjY4K
	 7K1TgA6p8hz+uRzqOxZpoWB/dllWqtYSNUSKHPlWedPBsmnd3Pgx0LIWsfdCdbjTgdw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=buY9zqVX;
	arc=none smtp.remote-ip=74.125.82.71
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D56E606A31B
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 22:04:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4D56E606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=buY9zqVX
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-151ba226e1bso4560950c88.0
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 15:04:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792965884; x=1793570684; darn=vger.kernel.org;
        h=content-type:to:from:subject:message-id:mime-version:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=hKZUnu5wtT1E98Kxc/nSegz23tYHL1tF4broOYTq818=;
        b=buY9zqVXRM1q5QK50WwSLnEuEGKHr+cUp9LzKFuM2XrfTdydh5hdQKXSrSegg8vLRU
         SUg9ZGfgdxP/wjPm53P+/YXTgIr4v5KNwCNI2uwgLS9xn5oq6rHmdbeco/w4S5/t1uCX
         xVzjwj3MgsRXZuDW8+kvfnnqPNQ6vamWSZmBSel62cub8uvsBchuAZNN7HB6pD2McI57
         fQKrO28jYA7PNRGAyNybmPODNgOGrJMJIYFttcCg+4AYnQwNiRYRa+E7AAZU9n14NEOa
         pu3oPDHdAObPTFauIleaVOr1oFR57Wl/Pw5l8P0O5dv5DsOWtU8tA6QvT8vAUVB4S1jV
         YVPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792965884; x=1793570684;
        h=content-type:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hKZUnu5wtT1E98Kxc/nSegz23tYHL1tF4broOYTq818=;
        b=thuC4aTXRI4AarnObvNZLZ4FQ2M4TCOr0g715+Gqy27tgrJRybozWQsN/tbR1mmB0L
         B7IvHVkkTMAhe0Kb3gh7FNYpUoAXgL12FXkBZBstmtPE+5wEGuXHiL1bxXN+eHgjeYcm
         L4eJ6YHvRgko75DKV2g2inuQOz7pj3p18jXDndnCQPjx4452SSJaWC0MhXleQUDFMFyL
         P/2veZ12ElQAJaRrAW5awKJoEXXrMgBEq/sxF5n7v5X+2CKvf72G2wI52H37+VW70+Ks
         NwsTtIwye8h6MzWO8/MDOGeyjHBpboQ/6DIDUPs7gZB7WJeYKcV1MeJlmnOUznPajRRT
         a0sw==
X-Forwarded-Encrypted: i=1; AKwUvBw/BIguiR+DF/QT7GwHt8pPErnmAsiezKJ0MDGho9LgmfQh7ynwmV8tQ27RKqW0Na2Oa6KIF9jHRnniViM=@vger.kernel.org
X-Gm-Message-State: AFq9FYIfnu0YI7mfckCj00ZBbXuwlMcCrRrMU79GyYTCFHmKdTlDgutM
	v4CbB5YWh6KGzikSMUYACOMWk3kjt2JsOCRpuOaG3etYAdwTh/BS+J2sb1zRpDKjeFZaHlMtVSc
	UtOQ7vfiueA==
X-Received: from dlbsj2-n1.prod.google.com ([2002:a05:7022:f902:10b0:158:5d29:90be])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:3c04:b0:151:2e62:fe6e
 with SMTP id a92af1059eb24-199363a337fmr5791484c88.19.1792965884027; Sun, 25
 Oct 2026 15:04:44 -0700 (PDT)
Date: Sun, 25 Oct 2026 15:03:43 -0700
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.307.g5fe7bd680c-goog
Message-ID: <20261025220349.1244499-1-irogers@google.com>
Subject: [PATCH v1 1/7] perf session: Fix minimum event size for PERF_RECORD_CALLCHAIN_DEFERRED
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	James Clark <james.clark@linaro.org>, Zhan Xusheng <zhanxusheng1024@gmail.com>, 
	Dapeng Mi <dapeng1.mi@linux.intel.com>, Aaron Tomlin <atomlin@atomlin.com>, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

struct perf_record_callchain_deferred contains header, cookie, and nr
(24 bytes), but perf_event__min_size[PERF_RECORD_CALLCHAIN_DEFERRED]
only checked for header + one u64 (16 bytes). Use
sizeof(struct perf_record_callchain_deferred).

Fixes: c69993ecdd4d ("perf: Support deferred user unwind")
Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/session.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/perf/util/session.c b/tools/perf/util/session.c
index 56a5e57ec512..d9d06337933f 100644
--- a/tools/perf/util/session.c
+++ b/tools/perf/util/session.c
@@ -2773,7 +2773,7 @@ static const u32 perf_event__min_size[PERF_RECORD_HEADER_MAX] = {
 	[PERF_RECORD_HEADER_FEATURE]	  = sizeof(struct perf_record_header_feature),
 	[PERF_RECORD_COMPRESSED2]	  = sizeof(struct perf_record_compressed2),
 	[PERF_RECORD_BPF_METADATA]	  = sizeof(struct perf_record_bpf_metadata),
-	[PERF_RECORD_CALLCHAIN_DEFERRED]  = sizeof(struct perf_event_header) + sizeof(__u64),
+	[PERF_RECORD_CALLCHAIN_DEFERRED]  = sizeof(struct perf_record_callchain_deferred),
 	/*
 	 * SCHEDSTAT events have a version-dependent union after the
 	 * fixed header fields; the minimum is the base (pre-union)
-- 
2.56.0.307.g5fe7bd680c-goog

