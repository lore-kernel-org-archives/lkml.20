Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792965896;
	b=rF5nFnc5tzTj3tNJa66RbS/RcOTwt0Q7K32Ca1PQ6E4eDjaHseo+Py0o24D6UXV/Mqx0
	 Jo/RsAeAbe56ioMkFzIjXjReVoUw9Ry+lFS8b5kmU2i82l35saB8dJDHxPUda3nXil0j4
	 IquKdjY5e+H8IJ7FUEPis9qvP8t4v4DcAy3rc6kNdUyZoI6dvZ0IUZrXd+ZmaY6wMgQyl
	 0LNTTU1nHp3C9SpGTaXQScXH5n6ursa4ni40WZdbys/KaSlzu8fmyyfKFfke6kA0M3jEo
	 YtUN8h12xww93tzmSax3pYqQPxVDSUmCTM/rbY8gD+IBZVCXcxdwG0sBs0hPqWf33HQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792965896;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:
	 Content-Type;
	bh=OfqLq2Wyjby8tJh1B5C3yDh0EX/uJgrZHG+gv1L4SSI=;
	b=apuBbQhzOGNFSdPXvsINiqrgVhZt9olSnuLn5NiQBpeblSSjrGDSEEz8xhw1JDlp+tel
	 hvOQXVXnDfzTf49Fuy1OreHt7daDXMx/u+v4HZXD9hKHnQL28NbOGvCHkb17G8OjYKW/Y
	 6QHDlmVxzOh6hXY52L7Y81AVC8tX9ivPtOzU+YemUpSFOGVuv+1BxG6tadyjC/rvAdbmT
	 NEXebqfOZKXm0E2Z7BCtvZfTOcCMlCTrmOJy1Zg/1+YVmwJnmWS72iXIVtTu/EzvVJDlz
	 A0/06l3VM0UzYBaQWTJJe0pX3EqvhPFQcl/WkVVd7QPV3Uee50BEF5c+pVoGzS6oiaQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=RJgFPabG;
	arc=none smtp.remote-ip=74.125.82.199
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E76FD606A326
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 22:04:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E76FD606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=RJgFPabG
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-35cbea41088so3838761eec.1
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 15:04:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792965895; x=1793570695; darn=vger.kernel.org;
        h=content-type:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OfqLq2Wyjby8tJh1B5C3yDh0EX/uJgrZHG+gv1L4SSI=;
        b=RJgFPabGH1Z8HH02RP2SVN8f+xyQZsgoh148XWYjG1p4N6gpLZn1HyPXEedBYVMnV6
         zxEOW7tV6pUDJTPd1fdHaPek8z/PSqshfv76M7ff9EJdr1oxFaYyBQGRw2CYdwj1rfTb
         tX3oGW3N5hZ44a0oZbaUyrE+7xD2flgWCaufwYR8Gtgkk9X9rXUMA232H/VB9tp+1RjU
         Y42v4FR2C0F8WZFJ9FvIbERa9/wk9NC6m5vz0syv7lF64KMKZtSSRJn+FbWQ7jSq4YBo
         3Kn+C6hAG14LjQaORsrsgKnRXSOZZBDV2NuKR4L7L9cb8eFn/5etmvaFCjgd3nwo3ypx
         Rqog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792965895; x=1793570695;
        h=content-type:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OfqLq2Wyjby8tJh1B5C3yDh0EX/uJgrZHG+gv1L4SSI=;
        b=TtULBtBsrgKmbUbTFs9xzwhU0KKOut2gmWogtQBGoRW1CXV3mJy0eWhnsvEONIDzYE
         +U1MeJL1/exrUkMKW56F+aH9sO0jEjXaEplt7t3DX5VgDW13rQQ8HJqwqtz8UfAAG2VT
         Me6OFjKd+otyL56RIBMsTCna1HDbXtueJZopNUsw7+Aa9XiNkIzXbYqGMGEKzZgxLPK5
         fKfZTNn2cF2dOdHRQO12S52RFKXS9bhzbKrH8+1lkGQSe/sC9U3qk45+F9Z9qbASXVsv
         qR76NO8EeTBaA0OMn9JZ22EJfJhI4O75LxsMBAOynqXs9hgBV2UnQC8sNlAaclDeaXPZ
         P8PQ==
X-Forwarded-Encrypted: i=1; AKwUvBzqegVt4r+bcm9Kar3eOqgreVQCcpIa1rbAyqB8JCu3HZBen6VMOjUHHszt/aRrpXdec8AQv3zYv5F1x2Y=@vger.kernel.org
X-Gm-Message-State: AFq9FYLALsFUbpiGMfNVlFnwgB0ulIMti7Hg679RgGnSMo3OWKO3MqcN
	9g5iWboSLq8WDRdc+gw2q6vsV1jAD7dnG0ODPqj07EzH7/C8sOUGHoFKvEywXJnvfWW6BoUBEF4
	le+TySsvE0w==
X-Received: from dydxu14-n2.prod.google.com ([2002:a05:693c:894e:20b0:351:16da:ebbc])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7301:1403:b0:34d:755b:d60b
 with SMTP id 5a478bee46e88-369e8501bafmr7589789eec.34.1792965894554; Sun, 25
 Oct 2026 15:04:54 -0700 (PDT)
Date: Sun, 25 Oct 2026 15:03:48 -0700
In-Reply-To: <20261025220349.1244499-1-irogers@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261025220349.1244499-1-irogers@google.com>
X-Mailer: git-send-email 2.56.0.307.g5fe7bd680c-goog
Message-ID: <20261025220349.1244499-6-irogers@google.com>
Subject: [PATCH v1 6/7] perf inject: Set ordering_requires_timestamps before
 creating session
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	James Clark <james.clark@linaro.org>, Zhan Xusheng <zhanxusheng1024@gmail.com>, 
	Dapeng Mi <dapeng1.mi@linux.intel.com>, Aaron Tomlin <atomlin@atomlin.com>, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

In cmd_inject(), inject.tool.ordering_requires_timestamps was initialized
after delegating tools (such as aslr_tool__new()) and __perf_session__new()
had already been called, leaving delegate tools with the uninitialized
value. Set ordering_requires_timestamps on inject.tool before creating
delegate tools and the session.

Fixes: febea9ec382f ("perf inject/aslr: Add ASLR tool infrastructure and MMAP tracking")
Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/builtin-inject.c | 49 ++++++++++++++++++++-----------------
 1 file changed, 26 insertions(+), 23 deletions(-)

diff --git a/tools/perf/builtin-inject.c b/tools/perf/builtin-inject.c
index c30f5aaabf4c..3f3108fd3981 100644
--- a/tools/perf/builtin-inject.c
+++ b/tools/perf/builtin-inject.c
@@ -2463,13 +2463,18 @@ static int __cmd_inject(struct perf_inject *inject)
 #endif
 		}
 	} else if (inject->itrace_synth_opts.vm_time_correlation) {
+		bool ordered_events = inject->tool.ordered_events;
+		bool ordering_requires_timestamps =
+			inject->tool.ordering_requires_timestamps;
+
 		session->itrace_synth_opts = &inject->itrace_synth_opts;
-		perf_tool__init(&inject->tool, /*ordered_events=*/true);
+		perf_tool__init(&inject->tool, ordered_events);
 		inject->tool.id_index	    = perf_event__process_id_index;
 		inject->tool.auxtrace_info  = perf_event__process_auxtrace_info;
 		inject->tool.auxtrace	    = perf_event__process_auxtrace;
 		inject->tool.auxtrace_error = perf_event__process_auxtrace_error;
-		inject->tool.ordering_requires_timestamps = true;
+		inject->tool.ordering_requires_timestamps =
+			ordering_requires_timestamps;
 	} else if (inject->itrace_synth_opts.set) {
 		session->itrace_synth_opts = &inject->itrace_synth_opts;
 		inject->itrace_synth_opts.inject = true;
@@ -2482,8 +2487,6 @@ static int __cmd_inject(struct perf_inject *inject)
 		inject->tool.aux	    = perf_event__drop_aux;
 		inject->tool.itrace_start   = perf_event__drop_aux;
 		inject->tool.aux_output_hw_id = perf_event__drop_aux;
-		inject->tool.ordered_events = true;
-		inject->tool.ordering_requires_timestamps = true;
 		/* Allow space in the header for new attributes */
 		output_data_offset = roundup(8192 + session->header.data_offset, 4096);
 		if (inject->strip)
@@ -2514,12 +2517,6 @@ static int __cmd_inject(struct perf_inject *inject)
 		inject->tool.finished_round	= host__finished_round;
 		/* Keep track of which CPU a VCPU is runnng on */
 		inject->tool.context_switch	= host__context_switch;
-		/*
-		 * Must order events to be able to obey finished round
-		 * ordering.
-		 */
-		inject->tool.ordered_events	= true;
-		inject->tool.ordering_requires_timestamps = true;
 		/* Set up a separate session to process guest perf.data file */
 		ret = guest_session__start(gs, name, session->data->force);
 		if (ret) {
@@ -2536,8 +2533,6 @@ static int __cmd_inject(struct perf_inject *inject)
 		inject->tool.exit	= perf_event__repipe_exit;
 		inject->tool.mmap	= perf_event__repipe_mmap;
 		inject->tool.mmap2	= perf_event__repipe_mmap2;
-		inject->tool.ordered_events = true;
-		inject->tool.ordering_requires_timestamps = true;
 	}
 
 	if (!inject->itrace_synth_opts.set)
@@ -2816,6 +2811,10 @@ int cmd_inject(int argc, const char **argv)
 	data.path = inject.input_name;
 
 	ordered_events = inject.jit_mode || inject.sched_stat ||
+		inject.itrace_synth_opts.vm_time_correlation ||
+		inject.itrace_synth_opts.set ||
+		inject.guest_session.perf_data_file ||
+		inject.convert_callchain ||
 		inject.build_id_style == BID_RWS__INJECT_HEADER_LAZY ||
 		inject.build_id_style == BID_RWS__MMAP2_BUILDID_LAZY;
 	perf_tool__init(&inject.tool, ordered_events);
@@ -2862,6 +2861,21 @@ int cmd_inject(int argc, const char **argv)
 	inject.tool.schedstat_domain	= perf_event__repipe_op2_synth;
 	inject.tool.dont_split_sample_group = true;
 	inject.tool.merge_deferred_callchains = false;
+	if (inject.jit_mode ||
+	    inject.itrace_synth_opts.vm_time_correlation ||
+	    inject.itrace_synth_opts.set ||
+	    inject.guest_session.perf_data_file ||
+	    inject.convert_callchain ||
+	    inject.build_id_style == BID_RWS__INJECT_HEADER_LAZY ||
+	    inject.build_id_style == BID_RWS__MMAP2_BUILDID_LAZY) {
+		/*
+		 * to make sure the mmap records are ordered correctly
+		 * and so that the correct especially due to jitted code
+		 * mmaps. We cannot generate the buildid hit list and
+		 * inject the jit mmaps at the same time for now.
+		 */
+		inject.tool.ordering_requires_timestamps = true;
+	}
 	if (inject.aslr) {
 		tool = aslr_tool__new(&inject.tool);
 		if (!tool) {
@@ -2932,16 +2946,6 @@ int cmd_inject(int argc, const char **argv)
 		}
 	}
 
-	if (inject.build_id_style == BID_RWS__INJECT_HEADER_LAZY ||
-	    inject.build_id_style == BID_RWS__MMAP2_BUILDID_LAZY) {
-		/*
-		 * to make sure the mmap records are ordered correctly
-		 * and so that the correct especially due to jitted code
-		 * mmaps. We cannot generate the buildid hit list and
-		 * inject the jit mmaps at the same time for now.
-		 */
-		inject.tool.ordering_requires_timestamps = true;
-	}
 	if (inject.build_id_style != BID_RWS__NONE && known_build_ids != NULL) {
 		inject.known_build_ids =
 			perf_inject__parse_known_build_ids(known_build_ids);
@@ -2978,7 +2982,6 @@ int cmd_inject(int argc, const char **argv)
 	if (inject.jit_mode) {
 		inject.tool.mmap2	   = perf_event__repipe_mmap2;
 		inject.tool.mmap	   = perf_event__repipe_mmap;
-		inject.tool.ordering_requires_timestamps = true;
 		/*
 		 * JIT MMAP injection injects all MMAP events in one go, so it
 		 * does not obey finished_round semantics.
-- 
2.56.0.307.g5fe7bd680c-goog

