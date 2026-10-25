Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792965894;
	b=l+9gnkrInqRJBXA1OtiMvzAWtvGod2HhMz5GjdU15YydnrRnQVjr0boty/Ep9/i6srEW
	 4YgoGXoFXOzGjq7jFGqr9FjAkbERrrZwh3KBRepGvRQhzetogkLEgDFY32BAzkkr1lctv
	 8NA7JZCZ0DgzwVIxD8B4xwOQLok/Ht4V3nfSyqj9UwRY8WRoK1DnJfEwKa5Z3axjWNEyJ
	 Rh7aOHPhFa2i+wad9X9NyGWBpGRcCdC/pHJyNN7tGV+OCOhsOUekzZj7Ve10hJ4zSLHVx
	 WhGUDkBgOLxBz8TKfAAkpZMweuB1UYN9coxuS+wbMBa5J6GBlHl05AXMi4cH8mMGCOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792965894;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:
	 Content-Type;
	bh=WqJecG14GS07cjQMqiYKTg40m/jsJ/DoHEnrZ2BoimU=;
	b=nKzoTjbPlJfJXAKZGstkznygyDfBHtMLxtrjzHmLlEBUn3Jrz5O89Z7I9kvstK8fSRdm
	 iSCxDONyX4RnmO4ZrRZrDdLk3lllYJ0+iGERjdFVzPnSstyBGky30XZeFaTGxSQhbNh+g
	 WHKOwXm+19hK58aU7KttmfhC10UeRk4LqjEJBrTujPPYJcFm7vlIfRjsgk/TbwlVD6/ic
	 956hKqV9aD+9unXrHPjycv5+6/7BwChrfbILYCveIcp0qtou5jRbDtYjRaupWxqO/buFR
	 Uk16hMc0h3S5nGoZRRheDVB6IqQzuS47E2xxwczY7oD0muC4uyKVS7VWWoYETk3naXw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=AtGADeB0;
	arc=none smtp.remote-ip=74.125.82.199
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BF80606A32A
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 22:04:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9BF80606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=AtGADeB0
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-359b81ad4e8so3596238eec.0
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 15:04:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792965893; x=1793570693; darn=vger.kernel.org;
        h=content-type:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WqJecG14GS07cjQMqiYKTg40m/jsJ/DoHEnrZ2BoimU=;
        b=AtGADeB08dC8Z0twUtwipae0nFTvl5qJrtGaxHO7MPr+8QgJz4FVSyHGXDeaFjzvS4
         q2KtXxobDXdlxIKrnqlPe0+Q8R7XZhe5bfjSbnV1hUHDk0wrX9d6QiIeASjxW+hg1a6b
         8M1wzoW84dpR6q5zeK5f81kZ2VasAUbaTGsc9XgOoZP7m8NmV8IawSfkGMGASR2tAO4h
         nXZwIxUPrtQV3NyGHZbdMPE41yOkVjJYxvoWekbpDVewGnOMM8FPQDdKiZ6XEYWpPa7C
         BgFOlxEWo6uRFsN5lm1pvhkt2gfaOfugnVxgijY824o5ZolnYGvhv8MzIv1tCa+5BM3F
         xmxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792965893; x=1793570693;
        h=content-type:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WqJecG14GS07cjQMqiYKTg40m/jsJ/DoHEnrZ2BoimU=;
        b=W9s7mmzn6/lB3zq8p8723p95F+TQpYMOuv3KresNwoO0iHkaVpCUEgLrJolWwZbs6/
         45DV49lt9Pdb9Ug4qH4RlWOgcsv81FeevBCkYsccvExWgIEt99WD5I/UJkQU5aKG49qn
         G6qF2mi3YL/2EqqKfZ6/GBaD+uH86iKRzfbfya0ukiBW4/LOwVxMlj5VuQ/DqP7tzBc7
         cMNa34sCUUG8w+nXXca2540jTFGQ2rpu9jD95a8kc1nUo3N/oDyrIRiSTiGawbdgpMOa
         7/ZZkmPcUhn/E2Vi2VX2MYMRs/O+qWXChSnzdlP+YKLrQjSIZX+oGPsrNDNALbggSjJf
         JI4Q==
X-Forwarded-Encrypted: i=1; AKwUvByYYE7C1grtjUzp7Wpq349g/CHiFF9Ml9rDAlOQG5b9BY1iDTC0fRHh/FkpB1M/6EMz+qY8Wn9OjwZshr0=@vger.kernel.org
X-Gm-Message-State: AFq9FYI7nDMLMqslC838/xkuU5jsckmkceBnVG04ESCH4zDZ8KE9H8b8
	4KmUJlJ8ZXFaS3MFbUdrIXu5cHEEsRnyxV4Tq2r1lDG8TOQGskr9oIoMbMSBGkZjmx7AudH/E2g
	7ZgcEAECr4Q==
X-Received: from dyba8.prod.google.com ([2002:a05:693c:63c8:b0:369:f2bd:5ab6])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7300:3f17:b0:369:d7b0:99f0
 with SMTP id 5a478bee46e88-369e84a1c0amr9295533eec.21.1792965892350; Sun, 25
 Oct 2026 15:04:52 -0700 (PDT)
Date: Sun, 25 Oct 2026 15:03:47 -0700
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
Message-ID: <20261025220349.1244499-5-irogers@google.com>
Subject: [PATCH v1 5/7] perf inject: Use perf_tool__init() for --vm-time-correlation
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	James Clark <james.clark@linaro.org>, Zhan Xusheng <zhanxusheng1024@gmail.com>, 
	Dapeng Mi <dapeng1.mi@linux.intel.com>, Aaron Tomlin <atomlin@atomlin.com>, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

When cmd_inject() was converted to use perf_tool__init() in commit
a37c0436f379 ("perf inject: Use perf_tool__init()"), the
--vm-time-correlation branch in __cmd_inject() still called
memset(&inject->tool, 0, sizeof(inject->tool)) to clear the default
repipe callbacks. Zeroing out the struct overwrites all default stub
handlers set by perf_tool__init() with NULL, causing a NULL function
pointer dereference if any other event type is encountered.

Use perf_tool__init(&inject->tool, /*ordered_events=*/true) instead of
memset() so that un-overridden callbacks retain their default stub
handlers.

Fixes: a37c0436f379 ("perf inject: Use perf_tool__init()")
Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/builtin-inject.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/tools/perf/builtin-inject.c b/tools/perf/builtin-inject.c
index ce7562fc788c..c30f5aaabf4c 100644
--- a/tools/perf/builtin-inject.c
+++ b/tools/perf/builtin-inject.c
@@ -2464,12 +2464,11 @@ static int __cmd_inject(struct perf_inject *inject)
 		}
 	} else if (inject->itrace_synth_opts.vm_time_correlation) {
 		session->itrace_synth_opts = &inject->itrace_synth_opts;
-		memset(&inject->tool, 0, sizeof(inject->tool));
+		perf_tool__init(&inject->tool, /*ordered_events=*/true);
 		inject->tool.id_index	    = perf_event__process_id_index;
 		inject->tool.auxtrace_info  = perf_event__process_auxtrace_info;
 		inject->tool.auxtrace	    = perf_event__process_auxtrace;
 		inject->tool.auxtrace_error = perf_event__process_auxtrace_error;
-		inject->tool.ordered_events = true;
 		inject->tool.ordering_requires_timestamps = true;
 	} else if (inject->itrace_synth_opts.set) {
 		session->itrace_synth_opts = &inject->itrace_synth_opts;
-- 
2.56.0.307.g5fe7bd680c-goog

