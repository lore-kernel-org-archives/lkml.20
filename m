Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794815110;
	b=D2RDBhJwnSqG9zeogtqgCLnerlQM4Vg2LIvDACjoRBe+rkUUYFlNFpSmRYC+7xxhAspL
	 xQdkJ/Y1XjZRLjq5DsczLJWuDqs9SScxK2jGhnumKPBijB/zD69vMYDuexCfa/TE9KtO8
	 AsWvneSYFO+QIJdJP+1NEUC4iNJObMEyXUN+gOCjFhAvX87solWXuvFoPKtV9OIvlMgcV
	 RP0WQ6nc8736CEO88I5XVmhqiF/jPktzDuKsxo1Vq27B28qXz8/xj3Iyn+ZE95yeEKGv5
	 1GFf+JjD6oMwZahQDV6oTv/di77BJUbMPm4nSAWLfzDfUUH/BX0Cs+ef0KgLvy5NAHw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794815110;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=VhmVWVRrk2339BmZFkj7hmAbe8j2FMXF93AwQ4jIvsU=;
	b=ShXy0KY08M5cHv6hrT1wps9lOuMPGfHA+YTGcvi5+rEMWEuPXaP317D6fLdtRRgYTxcX
	 oeZ1HPMhy/CLAgWalkaFUXw4YMRDtnLHORIEMGd84DDJ6ZL7/odMzoREA0OSSYnsE0i6z
	 Fxz+Pcdxpk9VuGqlC3Syhk1MBqrJIgR7hDL4DH97v3SeOcP8mu5vpg0pHvXeXh0NAuJVe
	 sry1XHjTE6HF9fkXjyD8Coc53qturhPqJrhC5HlKmcwtJFxm8ItIKhl3i+FUqDIsA3AY4
	 z1R/+KZJKkyrlrQTfnOBb+ivdxbaTpJzPcf9Tio4Me+WBi2zy2rtUpy5e9Ocxbm57ig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=TpYUQ9mr;
	arc=none smtp.remote-ip=74.125.82.70
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 559F8606A33B
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 07:45:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 559F8606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=TpYUQ9mr
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-1383723dfddso3162247c88.0
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 23:45:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794815109; x=1795419909; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VhmVWVRrk2339BmZFkj7hmAbe8j2FMXF93AwQ4jIvsU=;
        b=TpYUQ9mrYK18ylzU/qW2jN4cLwlmXwHRsuugDsgXNoihNQW29xUQbGlyihr+RIJcCl
         y3zxNpG5aUMRY7Ka1GuvmCBEKRa+4XHhA/W7GLr1wjZReFN74YtwIvdnXOi7KtSfOS/9
         /hJCbYzAw76Bg1SlS+pujjgp6ol/afwLkTf+aRpdDLNGaCEZOpKjq7TCTSwHJa/sYTRo
         QnzfaA8zcc/b+jqbIT0m7XYrDmnLI1jHBrbOAEEKzkxgUtnd/MBb67ZsAiU+zS/Tp15u
         0S12vuK6VfirFt88KjTh1NZMQeI/tltZorhOg+0vvqbeEHfnij6Yci6OfJFYgMbChHhY
         evFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794815109; x=1795419909;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VhmVWVRrk2339BmZFkj7hmAbe8j2FMXF93AwQ4jIvsU=;
        b=yRndwR1Ov/x0z/wc6rn5lht0M75axNfTz3CDI0BnDGnLDOGspL4UvSJVwUvoTUHOkV
         5k0k1q+50cgvcr9z/45h3DJALzL2O7wGka1DQEzViHHBcjfco1+N7VUoMGn4W4LGtptj
         Q14axa63FCX83bUwOzPMvHigsNBZ0QOZQaHAiwd6Bh9ZTno426/iJcWRq0OoIxiWj1+8
         oGhZD7ILDNBHl0zAqWJxAhmMJ8e9+7jbtIAvxjqrebCcsuhO0fXGd8NL8N+YVm3FcsJ8
         Kh9hPKnNZQVA0/ABvEDBp/ze3WgGZh6+NABVeM67LVXd53UGDVGJEUqP9PmLkBRqk5XI
         uMnA==
X-Forwarded-Encrypted: i=1; AL+hErGm09JRdUO92GFv/xw44w2JrDKDeEIbVcDP2OffEe4haBLVR0GE3mmYzm6tp2/w5KSQ9uX8FzteXEYDQZ4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+CwJHsdC+Zh+TmSSGItwVMnyRwIaQAAY4TKB6takHl35ENGPDp
	WDYZqLb9fgJpBjtriQkG/KzYfZtgl5P9ozkWuIeBTPfGJkHg0lD2TsLKHM9qbTBWmDnC+BC9jvp
	lbkZ8Y7axIg==
X-Received: from dlgx28-n1.prod.google.com ([2002:a05:701a:ccdc:10b0:1b5:345d:ed30])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7023:d0c:b0:1a2:fa1d:1de5
 with SMTP id a92af1059eb24-1b5030f284cmr11497837c88.20.1794815108990; Sun, 15
 Nov 2026 23:45:08 -0800 (PST)
Date: Sun, 15 Nov 2026 23:43:56 -0800
In-Reply-To: <20261116074414.3174737-1-irogers@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261116074414.3174737-1-irogers@google.com>
X-Mailer: git-send-email 2.56.1.703.gf848ed807c-goog
Message-ID: <20261116074414.3174737-2-irogers@google.com>
Subject: [PATCH v3 01/19] perf/core: Protect per-CPU callchain buffer across bpf_overflow_handler()
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	James Clark <james.clark@linaro.org>
Cc: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Ihor Solodrai <ihor.solodrai@linux.dev>, 
	Leo Yan <leo.yan@linux.dev>, Dmitry Vyukov <dvyukov@google.com>, 
	"Steinar H . Gunderson" <sesse@google.com>, Stephen Brennan <stephen.s.brennan@oracle.com>, 
	Thomas Falcon <thomas.falcon@intel.com>, linux-perf-users@vger.kernel.org, 
	bpf@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

In bpf_overflow_handler(), perf_prepare_sample() runs before bpf_prog_run()
and saves data->callchain pointing into the current CPU's callchain buffer
for the active interrupt_context_level(), after get_perf_callchain() has
already released its callchain_recursion slot.

If the attached BPF_PROG_TYPE_PERF_EVENT program invokes a helper at the
same interrupt_context_level() that calls get_callchain_entry() (such as
bpf_perf_event_output() on a PERF_COUNT_SW_BPF_OUTPUT event configured with
PERF_SAMPLE_CALLCHAIN and a larger stack, or bpf_get_task_stack()), it
re-acquires the same per-CPU callchain buffer and overwrites
data->callchain->nr in place. When bpf_prog_run() returns non-zero and
__perf_event_output() emits the outer event's sample, perf_output_begin()
reserves only the smaller dyn_size computed earlier while
perf_output_sample() copies the overwritten larger data->callchain->nr
entries, overflowing the ring-buffer reservation.

Hold the callchain recursion slot via get_callchain_entry() across
bpf_prog_run() when PERF_SAMPLE_CALLCHAIN has been prepared so nested
callers at the same context level cannot overwrite the active per-CPU
callchain buffer.

Fixes: 0eed28220598 ("perf/core: Call perf_prepare_sample() before running BPF")
Signed-off-by: Ian Rogers <irogers@google.com>
---
 kernel/events/core.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/kernel/events/core.c b/kernel/events/core.c
index 614f9f0e6500..fd9f654de269 100644
--- a/kernel/events/core.c
+++ b/kernel/events/core.c
@@ -10818,8 +10818,15 @@ static int bpf_overflow_handler(struct perf_event *event,
 	rcu_read_lock();
 	prog = READ_ONCE(event->prog);
 	if (prog) {
+		struct perf_callchain_entry *callchain = NULL;
+		int callchain_rctx;
+
 		perf_prepare_sample(data, event, regs);
+		if (data->sample_flags & PERF_SAMPLE_CALLCHAIN)
+			callchain = get_callchain_entry(&callchain_rctx);
 		ret = bpf_prog_run(prog, &ctx);
+		if (callchain)
+			put_callchain_entry(callchain_rctx);
 	}
 	rcu_read_unlock();
 out:
-- 
2.56.1.703.gf848ed807c-goog

