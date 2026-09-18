Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD99C52B1FD
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 21:19:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789766396; cv=none; b=A0QK4sBpdk26ui1BGwRSFmGXlFekXiw5T6jJJ5l6f+SqtpuDrSUV7GWR6bpZd/dpw2DJcfL789wgbVxp3D9xxklzhFanEuogKW3532XQvRWVGSQOJ3UGO3OlOW+wHU/MF/ofUTSsEmN3jq2fpS5f2iqf82aTGLXHo1Nsz2eAPsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789766396; c=relaxed/simple;
	bh=9No6g42lrB6QKcCBOOEFSgMqI1po/ZrRv9DIdc2oFZ8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=T9aGJZ49iRd/srgIguis7EUoQSnAA4CLwssnnXmeKIenO1zDXRIH0K3LL8kUBYavCGh9Hp+DBsRrTWJErFft47GF1HKEbr676fFut/yN9ViCp773KgMLgMmnndbtE4EEkPd0CkiNXsxNOuA44uDh4f6ithFzBQhzU0ST9VLb0uA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=hZ2T/RJh; arc=none smtp.client-ip=209.85.214.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="hZ2T/RJh"
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2dc92350888so19087365ad.3
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 14:19:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789766394; x=1790371194; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dWUdAqwnRNViqY1JbSim/N3szd89pQRjSVQzSYadKOc=;
        b=hZ2T/RJhWLGJxCF7SzGOO3lOD7TNIrABQojCxYpGfRTbcwqxsYGQ75UrHEiPp/3GEE
         34UmapBC1DzxyKaSZyTunB7cCsNEmINJUqiliCKA/Du1f+v/5lnLvBg3uIK+i0B5DkgO
         00U3rrbk8jRWHyuPErzY6GICH+WARln6/e/Itq1O8U7SlrvX+fkJrpwSa/3Maq1BiPLG
         q033YPi4LPPw9uEDCM/vuoldPihpAn1INAUHKGi5GPmNhKql2KNAJUoh2CiYWIIL5QsW
         nFSHHyEDjAPBWpdZRQrfXJN7JxtZw4kwvXiiG5VEXue41F+2iI76cUCHwgDEUS4w2M74
         tWnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789766394; x=1790371194;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dWUdAqwnRNViqY1JbSim/N3szd89pQRjSVQzSYadKOc=;
        b=UslcTNBmvvX+fcgXwXcoKAW22BTCosu5YBhZnu3t0TPbZFFYIMNuVwaqA1Bg7j3Uu5
         BTK+zoTDc42iJuBdqxVggPifXq1+T6rZ/sennTWOvkodeIWIo/uVk2D/C9ViHqz6j2UP
         qxcETktauwYgp0u0CgO7gHHOKbmeQsLHWy9468LMqTyj7B00wq8WdO69l1jGsaBwgdsE
         sKuYDeb+h2UnVE9hEqP+yAKNzV8agnzOJFPb+As4b0Dfl1XOdhDI7MliM8s3dZeouPiK
         csJEh1qcQX1JOLsIa7SkG5xVkXuAgE5RsRQxm7g68kx9/27Q+gmcaz57zAGBpClBi+ef
         VOVg==
X-Forwarded-Encrypted: i=1; AKwUvBy46x0UX/22nFgRrYC+aG4Hd/rRbO+dcM3odUCu7yygsv1vHqEBUIfVANJQHdV4fPHt8o3ByHtHVQIJhiA=@vger.kernel.org
X-Gm-Message-State: AFuF++l1hZV+/xdLM3kd7xAo1rTus3AUjH9CNL1JrzawRONkklQ1wo2B
	1BagQFACFZlbUfnxSkNcC5PRM7zjMPI8jv1LsQb96O6/1e6tKzIythkZaBb0j5DGR40JVlwXa6H
	IXX7W6IHh0A==
X-Received: from dyu6.prod.google.com ([2002:a05:693c:8106:b0:32b:7182:c3b7])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:2f0f:b0:2dd:88b4:6920
 with SMTP id d9443c01a7336-2ddb1b9818dmr77699965ad.22.1789766394028; Fri, 18
 Sep 2026 14:19:54 -0700 (PDT)
Date: Fri, 18 Sep 2026 14:19:18 -0700
In-Reply-To: <20260918211932.2966061-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260918140659.2501976-1-irogers@google.com> <20260918211932.2966061-1-irogers@google.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Message-ID: <20260918211932.2966061-5-irogers@google.com>
Subject: [PATCH v4 04/18] perf trace: Start BPF summary before starting workload
From: Ian Rogers <irogers@google.com>
To: irogers@google.com, acme@kernel.org, namhyung@kernel.org, 
	Howard Chu <howardchu95@gmail.com>
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
2.55.0.1082.g2b9226bbc0-goog

