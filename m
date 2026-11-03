Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793749568;
	b=ly/GSa3/MC9zRgbCRUz3wjD8eivitPS9tC7raOolGk3tiZWZ79qSHxIPC+NxfmYBqAk5
	 XUGIUh618i0NG5P/2uROdaFm9ERgKVgjrBg+Iur1jqWUC3ofeqpyaWMIA4EuOT2WWMXYv
	 czxPtfSR99DV8dlQ8U5LCzQqOeuwq/Qe1KwJxeQuJQVbYdlFHVETHfiogxknTsLND/cND
	 Js5wDoi9tfwI4K5WqwPXxcuW3yz9U716e6+I22W/oRQtkYAUg8TBA42+eeV1yqbWkA5mU
	 z64t6wItXuqR8pqnZ6bXqeXcd/M2q+Dk/7Zt6QNLH/3FbyzTRHrDilgs0OnLPG8Gcbw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793749568;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Received:Date:In-Reply-To:Mime-Version:
	 References:X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=++IqdBnwEZWfjM5g8hKPhyQsGbsgIIgWkA1RsyTYyoA=;
	b=SC9ASOyhh+Wrzx/W8Oveyg6nJ+NHvtE2kJzBpvdImiDVbEzTi56Nkye5VCmeCngpAPKO
	 FW2j2xkWYFSBmz77aU1PJtqUggsm0I82AmWTRCehYt8t+K/WOncT0t8iJ90GWZ7rkWWMS
	 7nqln0G3UoAv2YFjGQqFh3EZK8V+WqUiYHUsZP5w/V0kId6TkeKlcwLErbpi72Cy16YmU
	 YuwYNC2GHtM7TIIB9ZceWvttr0wbqy5s2IV5VmoM5M0bWZuBdp7+LYGlE3MS5nnu0KHyq
	 OkZ2rsb88FM6qrJI7Slc67CXvmBFtYAa5xbk57YPJS0dpU4MOVZFVK3+HqwPiRTLChw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=a4M5MLiZ;
	arc=none smtp.remote-ip=74.125.82.71
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF667606A331
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 23:46:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CF667606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=a4M5MLiZ
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1acbaf81bebso224778c88.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 15:46:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793749567; x=1794354367; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=++IqdBnwEZWfjM5g8hKPhyQsGbsgIIgWkA1RsyTYyoA=;
        b=a4M5MLiZd6TGxVv8+FDzqRqf633RQAJhbLaxAH0I6SST6yOd+mBrFH7m+KrHF4dn/d
         miJ7QZPckWV32sEut42Cs7eXl3xtdv5ICRNAJXgOhZADb8vqlk+g6ej9bZ8/GyCwyApu
         GTpv5SFNo04hVvajZpP8F3wPsTDyk+hBTbuuaD9wefJVUsJ0VkHOT87RAtlYCbJmBWmH
         vRVBS4SM5YhiM7OYsNyF+fCgfuGa28RcFVmzeqlncF1yddpsL0dSEXJjaC8NDSZRLXhN
         gFFJUHbka//3FJL+vqP0I+N02GY9TJ5peai+tdjhvemM5Je6+OT6ULfSCTccH10/db+F
         hnsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793749567; x=1794354367;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=++IqdBnwEZWfjM5g8hKPhyQsGbsgIIgWkA1RsyTYyoA=;
        b=eFwdgyht8aGryMupdP6gPCRxrYuLkQGzqH+wdDzJl8RGerxVjq3lX3b2nv5rBcdTbi
         wLt/wM7CzQ9hZDp+1nWO6yLwsDVuaRZDRNw7279HBKiWb6/Fzm+f9GqvdsoH7J7lNYm8
         wlcwW+DIYArvyG7ui5lKQGBjjGEzJZ/NA18FNpTMBP84GplT79l3+2R8EBzLl16BVKQS
         Qoth//+YglJ8vcG84Dr4j8snc+46PcIcieyn45Ax/d8V05hHHC99LV96qdBwSnhYl/dD
         vo5PvL8Q16J7lENvPeczbUajaJ89W5KFSblTdgknCaeY6U5Lt8zjBI57K0EBU8VOlG6K
         KIUw==
X-Gm-Message-State: APuU4Z+CKegOQ4QSczkaw4WpONvNeH3WWdXHTD9sCxX2MayGxBOxOquQ
	jVnu0YeRmHbSsLTzh7aND4iEIv/mBFsxgrNH5EzlrqjdEIYmYrVYi3etemyoR1zym04569WjMuZ
	5jmWhoE6K6Q==
X-Received: from dlbsv9.prod.google.com ([2002:a05:7022:3a09:b0:1ab:fb55:f657])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:701b:42c3:20b0:1b2:366a:e7d1
 with SMTP id a92af1059eb24-1b2366ae854mr8921344c88.32.1793749566526; Tue, 03
 Nov 2026 15:46:06 -0800 (PST)
Date: Tue,  3 Nov 2026 15:44:38 -0800
In-Reply-To: <20261103234502.1008382-1-irogers@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261103234502.1008382-1-irogers@google.com>
X-Mailer: git-send-email 2.56.0.385.gac671c819a-goog
Message-ID: <20261103234502.1008382-23-irogers@google.com>
Subject: [PATCH v1 22/41] perf script: Don't drop metric samples for CPUs
 missing from the evsel
From: Ian Rogers <irogers@google.com>
To: linux-perf-users@vger.kernel.org, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>
Cc: linux-kernel@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, James Clark <james.clark@linaro.org>, 
	Kan Liang <kan.liang@linux.intel.com>, Dapeng Mi <dapeng1.mi@linux.intel.com>, 
	Thomas Falcon <thomas.falcon@intel.com>, John Garry <john.garry@linux.dev>, 
	Will Deacon <will@kernel.org>, Leo Yan <leo.yan@arm.com>, 
	Athira Rajeev <atrajeev@linux.ibm.com>, Thomas Richter <tmricht@linux.ibm.com>, 
	Ravi Bangoria <ravi.bangoria@amd.com>, Sandipan Das <sandipan.das@amd.com>, 
	Ian Rogers <irogers@google.com>
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
index 199a5af81f37..afed2353ef80 100644
--- a/tools/perf/builtin-script.c
+++ b/tools/perf/builtin-script.c
@@ -2409,15 +2409,14 @@ static void perf_sample__fprint_metric(struct thread *thread,
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
2.56.0.385.gac671c819a-goog

