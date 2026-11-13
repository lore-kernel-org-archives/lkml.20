Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794599627;
	b=K9xO23Bv+vUNX7JwJRgU703UvZkbZr8DlngrqCtP5NXr3mi4jWvJf2KOZ/EMcs50e5JI
	 SnrAj8D/j1SOEB15ktDbNT+TmJHti224oNRzJ1gy3tXaZv4zmL1RWdDsSD2L8ljPfG4Uh
	 Wnx6gMUdiazQOYKONGJnE85NbxWDjSXQA4ERv3ObxrL4EqvmAscGJXV+z8FU3O4krJzaY
	 1ltsYP8iwiCYuwcxoj10DMd1YAI7t1oGJPPOZpmnYjnExoWtSj9g5h7C6RS1koBUyDKuF
	 XvdBVj8Zc5qdGJ2qsiSR84D6jGRqw10DbzYGZDVLNIt8I0haHnCD1C3ZS+j5nfKgIPA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794599627;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=yZK0I0eEPwGAQ1xcP6pQmWLybyZKGwMTjQ0dOlFSYB8=;
	b=AAGtZ9u8OPWy4KlPe3yGXdirDR8eE3C2aRKxB/o7UfxqvFInNSbDrJP9wA0A4ZTQE+fA
	 30l1xDj6qC1HexOloCbz7drzwXnHhHft3aD/tlBKD9ZywyvHHqBfTGRfX5hH5FmPKXw2H
	 HExauEW+oblqjwd9ilqCtm1xfwTs82q78zKO+cVO2AauZiImYSnUGSJAI/VRjfIUMF0h6
	 BwyvKPTS/oxzPddxjWcNH08fJafEIiWBtSJ9IZSSZ8e+/OViTKh4gigIIAeSAxVLKL+2F
	 AMRXbFqP51V66JmGnrT88oH4zQDOTmz83MMpBDcQl7jygJTP0xsLZpnvgDXRHcC1UUQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=UsSHsvl+;
	arc=none smtp.remote-ip=74.125.82.200
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93E22606A885
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 19:53:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 93E22606A885
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=UsSHsvl+
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-370230d93efso5988245eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 11:53:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794599626; x=1795204426; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yZK0I0eEPwGAQ1xcP6pQmWLybyZKGwMTjQ0dOlFSYB8=;
        b=UsSHsvl+ZVJm5zPQej8h/ho8NG5MhRxPnMkNYKGfPbdh2KmLyF8FVyBA8i8C6GPrz9
         y80xS4SC6yOm40O+JyPq1HbEMLaegZKgeGemHnyrqEqcFC5o/DSVWIUxWZ4EJERnANro
         wMmD4T7oZhmDnnqBtvblFRVdxtQiwnTp//1sSRJp44JXFKREOPEQx/UrMWh8h0gbEITo
         sj9kX3PMw2ZHIBadQ7KGoivlIEfuI/SchZhM2/UaWaEscSw5yByxpStkSdwIm2I1MpIx
         oHlWCnJTjEFFoZ6A83m1axb45VH8YcMX8eIFMJ0408P1FPH4eMpq2V6Ff7FOMZ8baIGl
         9e3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794599626; x=1795204426;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yZK0I0eEPwGAQ1xcP6pQmWLybyZKGwMTjQ0dOlFSYB8=;
        b=YcTjHqeJ77Sui/ZNeY537WbY+th/MIOS6pVewgHtZlVnPu+cTLJGuwIu2TqNOB+peU
         6L8Kdzg24Ldxlind3o/8PuHL1JEJ1LExzJ/qA2Uh4Tr97QahXypWh+tUgABH4fIDDPzF
         1CqqhJNosGYXZcWkNKtYGn+9ea1lg85ATEXexvJrHK2DYSaJ0T3/uAuf7AcJ3Rv/DTPn
         RBaRRd+W6bon2vAzpKOOGs5Q2RNgGbkWWWWl4TNX1PrgMGETW1gRuKTDZw+j+E2RuwsU
         IdW2LZf1FzNW466OJfQ7RY2ZDumGCXBK4GDlVgC0NBCcwhoQZUyfI6I98qVqxRCSfKbu
         MNsQ==
X-Forwarded-Encrypted: i=1; AL+hErEMl8lqFjQN2zrrutvLevMJZJYGj59DumSoTQk+tL10RVQiCGV1ZEL7nZhhYauFlIi9R6TpDCmJgxtzFbo=@vger.kernel.org
X-Gm-Message-State: APuU4Z9MLFRzKyJTvtP3j+mETRJWeTtRfKlaaey5vdmrHWLY1ctuNGnb
	6E0uxKyHYWeegZxTB6fgdxsKeDl7YvSm3/C1/Rrja54zRhCzqfq46UStzMIGMaRpPGnwSSX8plC
	HFgNhRWMDNA==
X-Received: from dyjt26.prod.google.com ([2002:a05:7300:7b1a:b0:351:16da:ebbc])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7300:f401:b0:36a:1489:fdf6
 with SMTP id 5a478bee46e88-37966387750mr3171685eec.11.1794599625370; Fri, 13
 Nov 2026 11:53:45 -0800 (PST)
Date: Fri, 13 Nov 2026 11:53:08 -0800
In-Reply-To: <20261113195335.2865725-1-irogers@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261113195335.2865725-1-irogers@google.com>
X-Mailer: git-send-email 2.56.1.703.gf848ed807c-goog
Message-ID: <20261113195335.2865725-4-irogers@google.com>
Subject: [PATCH v2 03/30] perf script: Don't drop metric samples for CPUs
 missing from the evsel
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	James Clark <james.clark@linaro.org>
Cc: linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

perf script -F metric looks up the index of the sample's CPU in the
evsel's CPU map and, when it isn't present, prints "Missing CPU map
entry for CPU <n>" and ignores the sample. When the perf.data file
doesn't record the CPUs of an event, as is the case for perf record,
__perf_evlist__propagate_maps() sets the evsel's CPUs to the host's
online CPUs. If a CPU is offline when perf script is run, or the
perf.data file was recorded on a machine with more CPUs, then every
sample on such a CPU is dropped from the metrics with a message, for
example thousands of:

  Missing CPU map entry for CPU 1

perf script currently only supports global aggregation of the counts
used for metrics, the counts of all CPUs are summed. So place the counts
of a sample whose CPU isn't in the evsel's CPU map in the first CPU of
the map, as was already done for samples without a CPU. This doesn't
change the metric values computed for samples of the CPUs in the map,
the summed counts just include the previously dropped samples, and so
isn't a regression. Aggregating per CPU, and using the CPUs of the
perf.data file's environment rather than the host's, would be future
improvements.

Fixes: 3622990efaab ("perf script: Change metric format to use json metrics")
Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/builtin-script.c | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/tools/perf/builtin-script.c b/tools/perf/builtin-script.c
index c5a9651a197c..97bad639753f 100644
--- a/tools/perf/builtin-script.c
+++ b/tools/perf/builtin-script.c
@@ -2557,15 +2557,14 @@ static void perf_sample__fprint_metric(struct thread *thread,
 	/* Update the evsel's count using the sample's data. */
 	cpu_map_idx = perf_cpu_map__idx(evsel->core.cpus, (struct perf_cpu){sample->cpu});
 	if (cpu_map_idx < 0) {
-		/* Missing CPU, check for any CPU. */
-		if (perf_cpu_map__cpu(evsel->core.cpus, /*idx=*/0).cpu == -1 ||
-		    sample->cpu == (u32)-1) {
-			/* Place the counts in the which ever CPU is first in the map. */
-			cpu_map_idx = 0;
-		} else {
-			pr_info("Missing CPU map entry for CPU %d\n", sample->cpu);
-			return;
-		}
+		/*
+		 * The evsel's CPUs may not contain the sample's CPU, for
+		 * example the sample may have no CPU or, when the perf.data
+		 * file doesn't record the evsel's CPUs, the evsel's CPUs are
+		 * the host's online CPUs. As only global aggregation is
+		 * supported, place the counts in the first CPU of the map.
+		 */
+		cpu_map_idx = 0;
 	}
 	thread_map_idx = perf_thread_map__idx(evsel->core.threads, sample->tid);
 	if (thread_map_idx < 0) {
-- 
2.56.1.703.gf848ed807c-goog

