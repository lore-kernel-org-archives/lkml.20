Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C613E455603
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 07:14:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790147667; cv=none; b=ZbJAfScI7oxYzI5av56+vSsnAOyebVhV0DlilvogfObAkFh2+xRXL7aQFNBgpz7z+65wNaCulZzaHLuAsqDDsX/A8nN7EyPhHwwhVqFnEYo9RJXuLKiWow4I0UHuLID29hLzBfgd9WblaMaFWhzoz+oWRufrQEnUgk2u6bsAYbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790147667; c=relaxed/simple;
	bh=ZFu28bTIZtHoVVmRm8bIPfJIFnqmIuxAuxjddZbdwck=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=BGO9rjW9+VFEXUpjuLRaYMWvOaszQQlg8nhnoknYUUDL0Wa50C/qM6/B7kryTECkG2wJ3gJ9ZDEejLK3kyAp30wKYJJjSAYlzmYkhkv9Wx0N2B3daLETVX+HSusFD92UbAINhzLRusGcIn6JlxwaKp5Lhd4D4BfcwjVKVs9QhxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Cuq4fRJ+; arc=none smtp.client-ip=74.125.82.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Cuq4fRJ+"
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-14371f7ba1eso942390c88.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 00:14:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790147665; x=1790752465; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9AtiWY+mIovc0ii7uMQ428LIkWxsAI+yH5okNrkOa1c=;
        b=Cuq4fRJ+wrr22Se61VE0RWjHB17vY+CvOZU/LQEk24Djm9WfdhQXhyoxa/qCfP5V0X
         W6qsYxjnXd3qpF5uNSOM664Fe/ywTALqxbrSEc+dABwWYvaigCGxfdXcZl2gXBVKekGv
         1XlyZaS+XnYGcbvbcLI1l3n0XgLlrukwWLjUirBHUZHwdRyiOcd7Jb/wmoV++y6GNd7d
         NPtePQcwbt8DGmP20IcC9E4jemlGsydrzI1RbIPssmHNVVJn6mGDCgUpvV0CTN/jSs9T
         ly0LF7WLR17AQ1arVEP3BQQnsvNq88IMljrELaR2YE4pFnMZKIrdiot7K0yqnyU7az3v
         WrtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790147665; x=1790752465;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9AtiWY+mIovc0ii7uMQ428LIkWxsAI+yH5okNrkOa1c=;
        b=yucya5vB8VdA5+LF8xLL8apw9YGeJPZYRGoB+8CC8osS98bn+B190S2OytRztGyLhe
         9SYwil0TfcSeSbhjtmZbKncvGSdmTeBLDEctRTKlqmBD4ahvGQJhBX6XiWmktFPhKHkX
         Z2obqDY0HRSIsemYnWaxVEY+X5C8OIDaS81VhKTKWTZi7bt3NAK2L3i5Xtn+Q8WsbPQA
         mTMPRNq/OSClZdmHHmLP3CI8ZbxW+9eNkdoTyLRtfXnkHPePoWqil+Gh543bE+K+z9Jl
         5sZXCfDv/fXpJxFymDD3lDmZQm1aLgyO+ThH+y1YmZE8X0NckEdu92PvZsbm28xaYacM
         GnjQ==
X-Forwarded-Encrypted: i=1; AKwUvBzlIRlaB6H8kYlbcS+aXlVVM2E2k4CirECH8wYS/KXTNp86PhPcVAL07QLRqYDW0fDfoN+ATLOqI+8xDfg=@vger.kernel.org
X-Gm-Message-State: AFuF++l+FZe5slPa5wIfI+3mDwLuQGr0FqqhbakC8xzQERAZXOTPen2B
	srpJEqHCVYTtsjI3pL6pyhtnybayJJTYoYgmijVFl6yg9Eq5HdfLd4eARopKtQNJb2Til10FiaT
	V0cy/H19ddA==
X-Received: from dlae4.prod.google.com ([2002:a05:701b:2304:b0:144:db76:3e5f])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:6298:b0:144:f096:4dda
 with SMTP id a92af1059eb24-144f916f00cmr3314921c88.43.1790147664407; Wed, 23
 Sep 2026 00:14:24 -0700 (PDT)
Date: Wed, 23 Sep 2026 00:13:46 -0700
In-Reply-To: <cover.1790145937.git.irogers@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <cover.1790145937.git.irogers@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <5289bf094c7e9d37990d2d36fdf2deb025478c1f.1790145937.git.irogers@google.com>
Subject: [PATCH v5 06/23] perf trace: Start BPF summary before starting workload
From: Ian Rogers <irogers@google.com>
To: irogers@google.com, acme@kernel.org, howardchu95@gmail.com, 
	namhyung@kernel.org
Cc: adrian.hunter@intel.com, james.clark@linaro.org, jolsa@kernel.org, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	mingo@redhat.com, peterz@infradead.org
Content-Type: text/plain; charset="UTF-8"

When using --bpf-summary, trace_start_bpf_summary() sets
skel->bss->enabled = 1. In trace__run(), trace_start_bpf_summary() was
previously invoked after evlist__start_workload().

Because evlist__start_workload() immediately unblocks the child process
by writing to its go_pipe, short-lived workloads (such as `cat /dev/null`)
can execute and complete their initial system calls before
trace_start_bpf_summary() is reached by the parent process. Furthermore,
under high system load, the child process may finish before the BPF
summary tracking is enabled in the kernel at all, causing syscall
summary tests to fail. Additionally, if initial_delay was configured,
the workload was started before sleeping.

Move trace_start_bpf_summary() to be invoked before
evlist__start_workload(), matching evlist__enable(), and ensure it
respects target.initial_delay.

Assisted-by: Antigravity:gemini-3.1-pro
Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/builtin-trace.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/tools/perf/builtin-trace.c b/tools/perf/builtin-trace.c
index f67557e7a254..f90c6bb4d8b4 100644
--- a/tools/perf/builtin-trace.c
+++ b/tools/perf/builtin-trace.c
@@ -4844,17 +4844,19 @@ static int trace__run(struct trace *trace, int argc, const char **argv)
 	if (!target__none(&trace->opts.target) && !trace->opts.target.initial_delay)
 		evlist__enable(evlist);
 
+	if (trace->summary_bpf && !trace->opts.target.initial_delay)
+		trace_start_bpf_summary();
+
 	if (forks)
 		evlist__start_workload(evlist);
 
 	if (trace->opts.target.initial_delay) {
 		usleep(trace->opts.target.initial_delay * 1000);
 		evlist__enable(evlist);
+		if (trace->summary_bpf)
+			trace_start_bpf_summary();
 	}
 
-	if (trace->summary_bpf)
-		trace_start_bpf_summary();
-
 	trace->multiple_threads = perf_thread_map__pid(evlist__core(evlist)->threads, 0) == -1 ||
 		perf_thread_map__nr(evlist__core(evlist)->threads) > 1 ||
 		evlist__first(evlist)->core.attr.inherit;
-- 
2.56.0.rc1.315.gc6ed9934b7-goog

