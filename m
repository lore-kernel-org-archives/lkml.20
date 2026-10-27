Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793120683;
	b=B35qp7osER8qS1gv05cXy1/MTH2xBKU5PAWrfinBjy3wPa82P2XHLF+J7gkTc1WkZ02D
	 WJj+4WNHIgKTF3l7TA7f6A5ECnEnnnljHiThEXuvygG6hjMTjzwUkcKt3QXJHv2zCsA7U
	 gLitxMqKNugXy943x8njSJU58BheechvhlgQRZwIZTy0u0JWnpaZ3oow6UYXRD+WPm3rC
	 EN9Py05t0pIc/T4GPQ+7nAVDFeiWjPb4j/JN+oys9YFK+leV7fo50CIOwxrHeBzazJBlY
	 Xxlsl3hfMZP5kjwYTU25uomBrbRQ19x2zLGDHtV9IFEANHSlNNNHMoW1J6u7sEV/d5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793120683;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:
	 Content-Type;
	bh=3KBQWnsf/QAcn311EnsJ8AzZkkASOn1et9YnIECaJBg=;
	b=JqK2KrWZXS70R9FiqCj+biiTJLhOCtp7Z4a7mxp7RR29C9kunaBdJyqzsBY4EHWktvRy
	 vWSqb+PNtFQd00F9gRrO7PDhKYtxa0X65dwF//5DaxJ5Y/guE3ScTWYAFrO2EFkzNYjCt
	 FDd8B/rWLgvARLpC3YrHvA9yNkO+rSiCkINuRJ9gEOpS03NXWUtfr5EfRsZZwOwJVCs47
	 YQjKsp9pJUViX6Ddt7GMn5Ow9gUyvdIlp2lBB9edh0n/MlGXBq/Cv0WV55rIogxjHtNRj
	 NOOnqU5YA5ZbqGMhHCmmoKP0Hp3YnzbIeBsI5G8EtAh5Wb+urfGEHG/MQzZgWUfYPnA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ehCOTbhj;
	arc=none smtp.remote-ip=74.125.82.199
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31E0E606A32F
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 17:04:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 31E0E606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ehCOTbhj
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-36637676140so82286eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 10:04:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793120682; x=1793725482; darn=vger.kernel.org;
        h=content-type:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3KBQWnsf/QAcn311EnsJ8AzZkkASOn1et9YnIECaJBg=;
        b=ehCOTbhj4Sw2tlJBNRACK95z73Z9vhbuPKVK4epcQswGGlGN4yVtsbUgVBvX0YlYbI
         dAnhi55x+4ATxqbzEKU+bzWOwMeNHizmZ4ay73l2Cns3JtCfKi7TXjqS2LlBbac8NHNl
         av2e4X3Z3647xyvEpXbGQrrfM0P1lW+w0QaMDXS9DhXm3A6gMbRCvppN+lbJJJWXQEp5
         zY8/ewc1JBJ8wKRLBjWn314RztAucc2foE4ZzV+2aq9oOZVTMG4G8Ejl9g9HCmrqhSj+
         oXI1ehwVl2kLWmQFYsjL1C7pyZUnAJebAz8J+gpM9AEmeN9WwEHrJetvkhJFC3CxXOov
         IeAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793120682; x=1793725482;
        h=content-type:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3KBQWnsf/QAcn311EnsJ8AzZkkASOn1et9YnIECaJBg=;
        b=jq5iTe8j1YVDtueenft2cxN8s29/VA4Shv8tjvONSlYVWgzTtMl9iA80PtzWo6+8pO
         4TPh4B8bSiEEFxr808+KQsXyjR/6oPhqf9viedvOXMmufyFKTG2HXdhphwQ0QPVerQWi
         fNVfSFwxRLS4NgYkSquBznBF5oYqBxyS47Gtzf/QwztLZem/byjkUgkGoXhPgPMi2N8N
         K0px4nfFOqhfWkWBqfvScTcCK7jLmoBWn58clfx+mrCtd3Ly7gMFJHAvsHWO8BV40qvF
         3cTyWxWGPIG2p2J0QuYBLx/+wNVyZHgjrfd7ekFCmqZLBmVlTjO9LHGjGx9Sp3HWbzmz
         d0ag==
X-Forwarded-Encrypted: i=1; AKwUvBw32Svcfd9r6mtbqk/bYxTDcxcL4CPbEe0tzcAA8NLkgqKgVTqFaL/90cgVzioGW0hIc05ui3yfXFbhbgw=@vger.kernel.org
X-Gm-Message-State: AFq9FYJHcJ70JV8SShGfCECGp4BaqzPXxVLvpMcZOAHDATVGgZSouuV0
	lyMpzhcY5xFwzV07NOAqkyxdaoSNjY2lx0KgPT09xyuY0Q7INtU5soPnjGVc7A08c+GavaX9RDB
	y6TWUGr4CcQ==
X-Received: from dybnl11.prod.google.com ([2002:a05:7300:cf8b:b0:369:e1b:2d71])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7300:ce05:b0:369:fe81:a575
 with SMTP id 5a478bee46e88-36a201638d4mr94794eec.35.1793120681790; Tue, 27
 Oct 2026 10:04:41 -0700 (PDT)
Date: Tue, 27 Oct 2026 10:04:14 -0700
In-Reply-To: <20261027170415.2815859-1-irogers@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261027170415.2815859-1-irogers@google.com>
X-Mailer: git-send-email 2.56.0.313.g2479322e68-goog
Message-ID: <20261027170415.2815859-3-irogers@google.com>
Subject: [PATCH v1 3/4] perf off-cpu: Fix cgroup_filter map sizing
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	James Clark <james.clark@linaro.org>, Ankur Arora <ankur.a.arora@oracle.com>, 
	Howard Chu <howardchu95@gmail.com>, Thomas Falcon <thomas.falcon@intel.com>, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

off_cpu_prepare() assumed that if evlist__first(evlist)->cgrp is set,
the number of cgroups is evlist__nr_entries(evlist) - 1 (excluding the
dummy bpf-output event). This can under-size cgroup_filter when
non-cgroup events precede cgroup events or when no dummy bpf-output
event is added.

Count the number of evsels in evlist that have a cgroup set and use that
count to size and populate cgroup_filter.

Fixes: 685439a7a037 ("perf record: Add cgroup support for off-cpu profiling")
Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/bpf_off_cpu.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/tools/perf/util/bpf_off_cpu.c b/tools/perf/util/bpf_off_cpu.c
index 16948761cc45..71933a71c8d1 100644
--- a/tools/perf/util/bpf_off_cpu.c
+++ b/tools/perf/util/bpf_off_cpu.c
@@ -151,9 +151,10 @@ int off_cpu_prepare(struct evlist *evlist, struct target *target,
 		    struct record_opts *opts)
 {
 	int err, fd, i;
-	int ncpus = 1, ntasks = 1, ncgrps = 1;
+	int ncpus = 1, ntasks = 1, ncgrps = 0;
 	struct strlist *pid_slist = NULL;
 	struct str_node *pos;
+	struct evsel *evsel;
 
 	if (off_cpu_config(evlist) < 0) {
 		pr_err("Failed to config off-cpu BPF event\n");
@@ -208,8 +209,12 @@ int off_cpu_prepare(struct evlist *evlist, struct target *target,
 		skel->rodata->uses_tgid = 1;
 	}
 
-	if (evlist__first(evlist)->cgrp) {
-		ncgrps = evlist__nr_entries(evlist) - 1; /* excluding a dummy */
+	evlist__for_each_entry(evlist, evsel) {
+		if (evsel->cgrp)
+			ncgrps++;
+	}
+
+	if (ncgrps > 0) {
 		bpf_map__set_max_entries(skel->maps.cgroup_filter, ncgrps);
 
 		if (!cgroup_is_v2("perf_event"))
@@ -274,8 +279,7 @@ int off_cpu_prepare(struct evlist *evlist, struct target *target,
 		}
 	}
 
-	if (evlist__first(evlist)->cgrp) {
-		struct evsel *evsel;
+	if (ncgrps > 0) {
 		u8 val = 1;
 
 		fd = bpf_map__fd(skel->maps.cgroup_filter);
-- 
2.56.0.313.g2479322e68-goog

