Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793749588;
	b=RLzkkZU2jnEho2j5ZhselE1maxjMhv27JckzRrmY8Xau20ffyOlvg1/Sv0fhhFpacBmH
	 Eis7r2p3JIK4LJgrh93cKQyJHuIHbF3uTLPGrdW/OGlHC3YEBxElMfbtzlr/ivQRGfHU/
	 h98D6dxj/sXiP1TzCiPhCcTL9jcsO/RV+kLIZgjejQLk7DpG1G+GzqDWi8zRx+BU6PRtN
	 nNl8OI2rgaPj9h6bS3CAUO+7CQyoXBxzV2nrUQbb8ovLTHotMEJG0RNtQKbtSqULEGI5Q
	 PdGdwHX9BH+kYhWhwywHZ8XK3ue/gQ/Y/jp2maVWmBPkEeKEr1+uTe4wCblzaMkQVFw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793749588;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Received:Date:In-Reply-To:Mime-Version:
	 References:X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=NSMj0EQk2XJVbJIpKiSnx7gbNLhkEblXTTXusablWHw=;
	b=BmamHOToOgWDWUvte7/mG2xSWUo4Lli9eqWOU5wUV5LBPFpTSwsLcXPCLZ+VFusaSwZx
	 5AuoKqgL5zuHZd27TkpOdg1RY6ZaDCea4NTRqH1RgDL4wCyxnOyDkATXQj/B5YElS+BDu
	 FRoVnlplFrUx+vfY1KhIqIuBWSejMHmTsAA5k7B9mZyz/qLIk7jwM1lxeCEfZTbwc1ZyA
	 pHyiCVifQPGnunsklC9g+Jzqby9tFs03oLR4qzwsTuAEqxQxfQ2bv8Kh/6d19GyW17IS7
	 PJRJqpczNZs12S1SCcHv/wzIkz3A99yoakwBJXCEbDkhxgmlySuDK0nPuH9Ip5V+tmA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=V6rBWxbj;
	arc=none smtp.remote-ip=209.85.214.197
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 640F8606D816
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 23:46:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 640F8606D816
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=V6rBWxbj
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2e601800e58so1164605ad.2
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 15:46:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793749588; x=1794354388; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NSMj0EQk2XJVbJIpKiSnx7gbNLhkEblXTTXusablWHw=;
        b=V6rBWxbjhJ4TNG7EBjluXAVa4nxYxSWrDFJnL1WR3iAAIaRo0HADQ8jpG1NDImW3rY
         TvHGByYY0aipzmdhRP56lOfK60QZLm5jB87j4KmcpoVTEGG2JVBQrZ12p4QoTsND1BWt
         hTdgB6fEI2qNna/fo/dKIfjVLyAo9WijCTm/ioiKKkmmiCPxrDvqzTcE4j6EVTA2D1UF
         lmdgtRw72iodBm1FcMDbhu5/qfqDracD4haGeUCpMwu+0oXBfUJlUkUhiOtp7TFEZeTG
         YDlOevWrFY2iSjboO2Jr5YrPENYulrPx6pMg/PGyPYhc3fZzdLaZBO+KwgPZRL2ftKJl
         ALlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793749588; x=1794354388;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NSMj0EQk2XJVbJIpKiSnx7gbNLhkEblXTTXusablWHw=;
        b=SYNY+3Yf1diDYjzumP0gbj/jqNi/MS90eYyt35N8ZDKczYOHtVhQ9lly0uBq6SRjav
         4MQjco32j/gJfWpWDkgFqE/3Q8FDMU+R9I9JiUU7y05jwxPFmOSUfe79nX1TO6pRUFCg
         e1NxvUEVYKVw21NXcm8f+nqhOCShUZ3Ydmisj+Nw9KhfynZanFOGC5MoG+I3epjjkOWj
         FANzWdoe6leOSwzwGdDIbgJEoRdP7HOIy4NYkpuRMlyG0O4zRaf4MZ1reLqzsZUTazm2
         i39qDuCTpCY7Xnw47I0z0+gqdChvOrkgrBDPcvuZbIYLdrsHGq1D8c2SB8Av2pRN8IIR
         soqg==
X-Gm-Message-State: APuU4Z8uC60EPo52wHw/kQbjE8TEXFxttUHRej0CyMrlkWh2kwq4j38W
	TiPZ4mFLnH/BzfSRWDlbQbN3FD/yyK8doJJymlV7b315lHZghPsP25jXq7wnwbDsruXkkRTHo4k
	t+y/H76gloA==
X-Received: from plic13.prod.google.com ([2002:a17:903:370d:b0:2eb:153c:2391])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:d54a:b0:2df:90d4:1193
 with SMTP id d9443c01a7336-2eb364fa721mr143696105ad.45.1793749587332; Tue, 03
 Nov 2026 15:46:27 -0800 (PST)
Date: Tue,  3 Nov 2026 15:44:46 -0800
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
Message-ID: <20261103234502.1008382-31-irogers@google.com>
Subject: [PATCH v1 30/41] perf pmu: Probe precise_ip levels
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

Extend perf_pmu__probe() to probe supported precise_ip levels (1..3) and
populate probed.precise_mask and probed.max_precise.

Some PMUs that do not implement hardware precise sampling (such as
software, breakpoint, or AUX trace PMUs) silently ignore attr.precise_ip
even on non-sampling events (sample_period == 0), whereas PMUs that
genuinely validate precise_ip either reject precise_ip > 0 on counting
events or are sampling-only PMUs. Check for this before probing levels
1..3 so non-precise PMUs are not misreported as supporting precise_ip,
while still detecting higher precision levels when core events are
forwarded to hardware sampling units (such as AMD IBS).

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/pmu.c | 50 +++++++++++++++++++++++++++++++++++++++++++
 tools/perf/util/pmu.h |  4 ++++
 2 files changed, 54 insertions(+)

diff --git a/tools/perf/util/pmu.c b/tools/perf/util/pmu.c
index 164ed926184e..1c55265be246 100644
--- a/tools/perf/util/pmu.c
+++ b/tools/perf/util/pmu.c
@@ -3453,6 +3453,56 @@ static void __perf_pmu__probe(struct perf_pmu *pmu, int pmu_cpu)
 	if (pmu->probed.can_sample)
 		probe_sample_types(pmu, &base_attr, pid, cpu, flags);
 
+	/*
+	 * 3. Precise sampling support (:p, :pp, :ppp).
+	 * PMUs that do not validate attr.precise_ip (such as software,
+	 * breakpoint, or intel_pt) silently accept precise_ip > 0 even when
+	 * sample_period == 0. A PMU that genuinely implements precise_ip
+	 * either rejects precise_ip > 0 on non-sampling events or is a
+	 * sampling-only PMU (such as AMD ibs_op).
+	 * Note: On AMD, core events like cycles:P are forwarded to IBS and
+	 * support higher precision than advertised in sysfs caps/max_precise.
+	 */
+	if (pmu->probed.can_sample && !pmu->auxtrace) {
+		bool ignores_precise_ip = false;
+
+		if (pmu->probed.can_count) {
+			struct perf_event_attr c_attr = base_attr;
+			int fd;
+
+			c_attr.sample_period = 0;
+			c_attr.freq = 0;
+			c_attr.sample_type = 0;
+			c_attr.precise_ip = 1;
+			fd = sys_perf_event_open(&c_attr, pid, cpu, -1, flags);
+			if (fd >= 0) {
+				close(fd);
+				ignores_precise_ip = true;
+			}
+		}
+
+		if (!ignores_precise_ip) {
+			for (int level = 1; level <= 3; level++) {
+				struct perf_event_attr p_attr = base_attr;
+				int fd;
+
+				p_attr.sample_period = 10000;
+				p_attr.sample_type = PERF_SAMPLE_IP;
+				p_attr.precise_ip = level;
+				fd = sys_perf_event_open(&p_attr, pid, cpu, -1, flags);
+				if (fd < 0 && p_attr.exclude_kernel && p_attr.config2 == 0) {
+					p_attr.config2 = 1;
+					fd = sys_perf_event_open(&p_attr, pid, cpu, -1, flags);
+				}
+				if (fd >= 0) {
+					close(fd);
+					pmu->probed.precise_mask |= (1u << level);
+					pmu->probed.max_precise = level;
+				}
+			}
+		}
+	}
+
 	if (keepalive_fd >= 0)
 		close(keepalive_fd);
 	pmu->probed.checked = true;
diff --git a/tools/perf/util/pmu.h b/tools/perf/util/pmu.h
index 658485faa05d..fea65e314547 100644
--- a/tools/perf/util/pmu.h
+++ b/tools/perf/util/pmu.h
@@ -238,6 +238,10 @@ struct perf_pmu {
 		char *probe_event;
 		/** @probed.open_err: errno if open_supported is false. */
 		int open_err;
+		/** @probed.max_precise: Maximum precise_ip level (0..3) supported. */
+		int max_precise;
+		/** @probed.precise_mask: Bitmask of supported precise_ip levels (1..3). */
+		unsigned int precise_mask;
 		/**
 		 * @probed.sample_types: Bitmask of supported
 		 * enum perf_event_sample_format flags.
-- 
2.56.0.385.gac671c819a-goog

