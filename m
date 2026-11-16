Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794815123;
	b=cVQ2flaJmkKsMEjd5XByLbYkNdrKD+v78HABUPZOQO0IdfertzDHlN0UtNfFWmLPLbuX
	 hHYamGTL9VeAGGmxYmalS/r2oel8VNlOO1zgYlmillfkL9ZJdMz5hcttYNPD7kbY5OopJ
	 EruhS5on0ZR8vn7YzqKEvSFo/dW0/YzqXawN5cZgOStg6U3g4sQ0Zk03iWhOj7u59Uxv6
	 E2u3lJf7yNSu0v5swa3L0D6A6LCsgVl+d3600W5it8w1S8cxS+t1nPfQluff6F61HZOly
	 j9aCBSpgsbzvY4VlUaN+3MKbVGGJ+/0Z2X2B96A1wxZFr6WidN3guro7+aEjKmGc9Nw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794815123;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=aRfvNh6QD28HUWSe7IyYWWl2xa0mUXFP5NmeCi5RQT0=;
	b=yv5ZE5ufvqmr0vysLsU/qhpEaoOLDZVXC9U20hnuTMwVmPxTdw4G7pg1aWXTJf8iz1mn
	 wpkR3Nfl1VBCsbv7tNW6v0HwtKhKBRCAvZ4zNcRieugR4BsvcE4u1R8eVsRd0agltNKf0
	 iGELiP8xQ9JYO2FytrWTbgaKS9CLoZcD4Gr8ECDXv0C7HjhhqrmIpLh6a8+ptZLpwy4Y4
	 3Jy38eAkenM0R0PyVxFf+zeTbunnMRjdmsDMhGq+KQLshsGi8mo4xs2clkoljRnylCogL
	 LP9ItsRALQFkq1L8+QOUHWpnmvA8tpaeXFsK/dewNBeu59JDQjPvtHuHd9vXMk+t1GQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=cNM+iT6J;
	arc=none smtp.remote-ip=74.125.82.200
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 885DA606A895
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 07:45:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 885DA606A895
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=cNM+iT6J
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-36f26e6abe9so3844721eec.0
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 23:45:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794815122; x=1795419922; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aRfvNh6QD28HUWSe7IyYWWl2xa0mUXFP5NmeCi5RQT0=;
        b=cNM+iT6JbTBSKJgUOV4y2nfVvqfIakYNiNGFP0z5awc4TP4I6f8wCUqw8RmuFcnvbz
         89SIh1c5ucI/oG4V7xg0D4HnwxsIUMWU8EJuopXhE+jyGjQuPGsW7X9agoKl6mgPoGJF
         hcz0Ahtev/j1CuDmTljU/ZbPfGVRmTEYSVvJxyinDpKZpaXF0EyuUjcDKdZNvRLEr1Z9
         uDBzyWnrNrAiJVmPxpdv/Yt/qvSYa7e4cSO/6uf5xpukehBKxRKOs/EF9sqG75TLIiR0
         Wd5d8N+gX2L5hP5zaOiBUBWd2qgns90gjonMniZoKr39fFfyPEfcGL2kOURI/5DB8dka
         oKBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794815122; x=1795419922;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aRfvNh6QD28HUWSe7IyYWWl2xa0mUXFP5NmeCi5RQT0=;
        b=WGrOc4/r/GdY1moNaqkMylWW5ywzM/orBKjCCynGM/SV+93rfL8DEoeLN9jdnZhjbF
         YEMUYpw29EGoUS0kBb0GPB2Hd+IbVVlKrzgHhVi4yDzOuOmHKe3pkwaFXOiLtsK86LYR
         VnfgKrjKBvUdc59M43sCcGezYGRPH97lOv1zUX2ws2LNhAXGbTMO0k+2rpSHHNh8oVhx
         w4WH8g0MYDjM50YpgRSai9P/eV/FjNouZMnt2GJVQQAafCiQ31O+BJ4lQer1geXX6d1Q
         MYtTdQgtkIjAi3mMyBUa6JzvLHruBKul79Mw7AGA6p7869sdrfbzHHKW8DkUmRGxfavu
         XJVg==
X-Forwarded-Encrypted: i=1; AL+hErGjjKGijzkSIP0PLD4tbTbtVYci534zrwcJCz1/D6XgTKffCk4m5q8yMzYzIgyKqjzHEvt2FQ+7AZeRln0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8MXV6p5zeg2EPFQpcBk/NG9qEq8SEHp0PlpNRUmaQrjSNKQdm5
	3VKphBRFfGICin0fcac3HD2YtBhNTTFNZtYUcSe+ByzGUh7rPmkA4fqe6TGqBG8y+iYvTMXmEgv
	p7zmfNu5/ng==
X-Received: from dycnm5.prod.google.com ([2002:a05:7300:d185:b0:35a:c4b6:314b])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7301:8617:b0:370:cc56:b61a
 with SMTP id 5a478bee46e88-37967dd6065mr9478567eec.39.1794815121228; Sun, 15
 Nov 2026 23:45:21 -0800 (PST)
Date: Sun, 15 Nov 2026 23:44:02 -0800
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
Message-ID: <20261116074414.3174737-8-irogers@google.com>
Subject: [PATCH v3 07/19] perf inject: Set ordered_events and
 ordering_requires_timestamps for --aslr
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

Commit 0ce6cf53db5b ("perf inject: Set ordering_requires_timestamps
before creating session") initialized ordered_events and
ordering_requires_timestamps on inject.tool before creating delegate
tools and the session, but omitted inject.aslr. Also set
ordering_requires_timestamps on aslr->tool.tool alongside ordered_events
in aslr_tool__init() so --aslr orders MMAP and sample events by
timestamp consistently.

Fixes: febea9ec382f ("perf inject/aslr: Add ASLR tool infrastructure and MMAP tracking")
Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/builtin-inject.c | 4 ++--
 tools/perf/util/aslr.c      | 1 +
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/tools/perf/builtin-inject.c b/tools/perf/builtin-inject.c
index 3f3108fd3981..b887a4398f96 100644
--- a/tools/perf/builtin-inject.c
+++ b/tools/perf/builtin-inject.c
@@ -2810,7 +2810,7 @@ int cmd_inject(int argc, const char **argv)
 
 	data.path = inject.input_name;
 
-	ordered_events = inject.jit_mode || inject.sched_stat ||
+	ordered_events = inject.jit_mode || inject.sched_stat || inject.aslr ||
 		inject.itrace_synth_opts.vm_time_correlation ||
 		inject.itrace_synth_opts.set ||
 		inject.guest_session.perf_data_file ||
@@ -2861,7 +2861,7 @@ int cmd_inject(int argc, const char **argv)
 	inject.tool.schedstat_domain	= perf_event__repipe_op2_synth;
 	inject.tool.dont_split_sample_group = true;
 	inject.tool.merge_deferred_callchains = false;
-	if (inject.jit_mode ||
+	if (inject.jit_mode || inject.aslr ||
 	    inject.itrace_synth_opts.vm_time_correlation ||
 	    inject.itrace_synth_opts.set ||
 	    inject.guest_session.perf_data_file ||
diff --git a/tools/perf/util/aslr.c b/tools/perf/util/aslr.c
index e365f807b021..dee077cca5fe 100644
--- a/tools/perf/util/aslr.c
+++ b/tools/perf/util/aslr.c
@@ -1273,6 +1273,7 @@ static int aslr_tool__init(struct aslr_tool *aslr, struct perf_tool *delegate)
 {
 	delegate_tool__init(&aslr->tool, delegate);
 	aslr->tool.tool.ordered_events = true;
+	aslr->tool.tool.ordering_requires_timestamps = true;
 
 	if (machines__init(&aslr->machines, /*session=*/NULL))
 		return -ENOMEM;
-- 
2.56.1.703.gf848ed807c-goog

