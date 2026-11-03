Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793749601;
	b=DfCluuZm4y5HMupZCQNWMY3JYuqEJwmd6P2os2HYQsmOEF+tYaxQWhsRQB7AHTJT5829
	 p6SzTf9epFuamR2B0m5+hV4aG75Tn3Ep/4QtWxU/9fbQHweRx4MMTSOUFvkMGu37qro8x
	 3GVd8FMADQkXozyRu0T0mccns3bHVnUnIaIE5A3AfMab/kKmTRqvKsGUnabG5KjBpyJzL
	 0PdyG1hA22GOM0pViSvDcTPW6a61v4R6FmI9/LIRoxEbwOlK7PP4GCR+FbPjhm979jzmG
	 ScetjjIbEMTR9XbYCxcWLq4xWw+rXpcMtYd2dUp9/eaz5n7fhT3elRV9jqTguQB8WJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793749601;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Received:Date:In-Reply-To:Mime-Version:
	 References:X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=yWjL8gvo2BKXTOeYv6TegheZoqc6mcY4E8xI/UXv1Lg=;
	b=nqd289aAPrirxgVLW8RlhluTpBBXyekDjmUgraCrP2L4flb51QtSgB93wN5eyngB84pL
	 ZvZuO9EwtObSAQaRAVnkiHK6YUoXbIZ6aKVV39F/saxXCwqbNhv1mXbHZRD09GROEMnOz
	 Fqv6EBboQpoIuc5/spOhMOqnr9Rdljk9BA55LYBqSmCLbPjMexaqRoCVuj/iPs3+byHCj
	 NpBbdLF+/XvHXi2Lt/dE2Cmydd2Lj/VwqrkWf2dkKI3NkaKaqCWn9gAOYCkYwrDo/LhLv
	 z57SuVBI+Rv/BaHpZ5f6khJT/ZhaPT0e1njTFELXwvYR9CvbhHZfQ1f/BLsFYaQQLZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=qLYa2Bmn;
	arc=none smtp.remote-ip=74.125.82.70
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 893586083639
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 23:46:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 893586083639
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=qLYa2Bmn
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-1b0d864826cso515727c88.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 15:46:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793749601; x=1794354401; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yWjL8gvo2BKXTOeYv6TegheZoqc6mcY4E8xI/UXv1Lg=;
        b=qLYa2BmnYgpe18Dzn1UAFB+XxyQtONrLq4R2+Hnt8DpLQBnXSSzc4eBV6dEmJbcWAF
         d3J5Qi248mIqkc6GYct8RJ3cAz73QkW4So6my0jbjdhfEBO71oDDOJ3gAWpliM570biS
         vyuLZZOW+jtXhy+4JbOFOBVmXFggs4/19TvK1qZejNr0V4RWMr0TH8cnpI9yAftTD5Ei
         rO8fZfz6pmA1UWu+bILgKPQ/bpLIJdvYhR3HhViJV1r00xiS7zTO74QgAlVNAG17jewQ
         bps4tA+d/y4s9eV1sDnedgVj11uNMhQZtyuzJQYIks5xIHp7EclQCVYy/w8CVFUdurU6
         mW9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793749601; x=1794354401;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yWjL8gvo2BKXTOeYv6TegheZoqc6mcY4E8xI/UXv1Lg=;
        b=YPv6BAGmY+2eTrfoEYBSkxAgc48fXAbZCb02d8fncKVcHrzm2MELTrhk5xN8FnDetE
         FWMZlJPc2TOz8et1d8SO6gNaZ9IknqkaLimBosZK87djco/TfZipRuj6e7lro1NEN3Gb
         ybNCDEGmjVREVp259JmIhoKUJswoLFqrS6Lf5iemSKl1Mhfs3KrOLlIa3P+rZdNRZEUj
         hsLG3SBlx7rSrs9CLwIysd+KA9gj382G2OpfG7dae/914bmq8M3gggUqnmDe3EyZYzhH
         oMo1x8A5v5hBCWmRwPRY33q5vWcvlDGsshPjE8/ZFZp4HURIuC4lgnUzD1PHUbm9cgWN
         c75w==
X-Gm-Message-State: APuU4Z+olWyfUHFTl6+9WGPJ+5kVrbEZD06IsjmfsgYT2FLIeJDQHwyv
	luDIk5czgergkdWRoXKUhWwZmU8xvkNrsTegkrbT4CPIZdZNrrv25UEW1Xn70OFW5p74npli03X
	FahQoZuA4Rw==
X-Received: from dlar7.prod.google.com ([2002:a05:701b:21c7:b0:195:8b4e:20b7])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:701b:424e:10b0:1a1:47b2:5512
 with SMTP id a92af1059eb24-1ac5b7dfd1cmr22927843c88.26.1793749600389; Tue, 03
 Nov 2026 15:46:40 -0800 (PST)
Date: Tue,  3 Nov 2026 15:44:51 -0800
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
Message-ID: <20261103234502.1008382-36-irogers@google.com>
Subject: [PATCH v1 35/41] perf pmu: Probe interrupt registers that require
 precise sampling
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

Some interrupt registers can only be sampled with precise sampling, for
example on x86 the XMM registers are captured in PEBS records and
x86_pmu_hw_config() rejects them in sample_regs_intr without precise_ip.
The interrupt register probe tried precise sampling as a fallback, or
for the legacy extended registers unconditionally, so the probed mask
didn't show which registers require it.

Add probe_regs_open() that opens without precise sampling first and
records when only the precise open succeeds, and record the interrupt
registers and SIMD register classes that require precise sampling in
intr_regs_precise_mask, intr_simd_precise_mask and
intr_pred_precise_mask.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/pmu.c | 117 +++++++++++++++++++++++++++---------------
 tools/perf/util/pmu.h |  16 ++++++
 2 files changed, 92 insertions(+), 41 deletions(-)

diff --git a/tools/perf/util/pmu.c b/tools/perf/util/pmu.c
index 9179231aa7d5..294c5f02d3b8 100644
--- a/tools/perf/util/pmu.c
+++ b/tools/perf/util/pmu.c
@@ -3386,18 +3386,50 @@ static void probe_sample_types(struct perf_pmu *pmu,
 	pmu->probed.can_weight = !!(pmu->probed.sample_types & PERF_SAMPLE_WEIGHT);
 }
 
+/*
+ * Open @attr, if that fails and @try_precise then retry with precise sampling,
+ * setting @needs_precise when only the precise open succeeds. Returns whether
+ * either open succeeded.
+ */
+static bool probe_regs_open(struct perf_event_attr *attr, pid_t pid, int cpu,
+			    unsigned long flags, bool try_precise, bool *needs_precise)
+{
+	u8 precise_ip = attr->precise_ip;
+	int fd = sys_perf_event_open(attr, pid, cpu, -1, flags);
+
+	*needs_precise = false;
+	if (fd < 0 && try_precise && !precise_ip) {
+		attr->precise_ip = 1;
+		fd = sys_perf_event_open(attr, pid, cpu, -1, flags);
+		attr->precise_ip = precise_ip;
+		*needs_precise = fd >= 0;
+	}
+	if (fd < 0)
+		return false;
+	close(fd);
+	return true;
+}
+
 /*
  * Probe supported general-purpose, extended GPR, and SIMD vector/predicate
  * register sampling masks for either PERF_SAMPLE_REGS_USER (!@intr) or
- * PERF_SAMPLE_REGS_INTR (@intr).
+ * PERF_SAMPLE_REGS_INTR (@intr). For interrupt registers, the registers and
+ * register classes that can only be sampled with precise sampling are
+ * recorded in @out_precise_mask, @out_simd_precise_mask and
+ * @out_pred_precise_mask, which may be NULL for user registers.
  */
 static void probe_pmu_regs_one(const struct perf_pmu *pmu,
 			       const struct perf_event_attr *base_attr,
 			       pid_t pid, int cpu, unsigned long flags,
 			       int max_precise, bool intr,
 			       u64 *out_mask, int *out_abi,
-			       u64 *out_simd_mask, u64 *out_pred_mask)
+			       u64 *out_simd_mask, u64 *out_pred_mask,
+			       u64 *out_precise_mask, u64 *out_simd_precise_mask,
+			       u64 *out_pred_precise_mask)
 {
+	bool try_precise = intr && max_precise > 0;
+	u64 precise_mask = 0, simd_precise_mask = 0, pred_precise_mask = 0;
+	bool needs_precise;
 	int dummy_abi = -1;
 	u64 gpr_mask = intr ? perf_intr_reg_mask(EM_HOST, &dummy_abi) :
 			      perf_user_reg_mask(EM_HOST, &dummy_abi);
@@ -3470,14 +3502,11 @@ static void probe_pmu_regs_one(const struct perf_pmu *pmu,
 			else
 				e_attr.sample_regs_user = ext_gpr_mask;
 
-			fd = sys_perf_event_open(&e_attr, pid, cpu, -1, flags);
-			if (fd < 0 && intr && max_precise > 0) {
-				e_attr.precise_ip = 1;
-				fd = sys_perf_event_open(&e_attr, pid, cpu, -1, flags);
-			}
-			if (fd >= 0) {
-				close(fd);
+			if (probe_regs_open(&e_attr, pid, cpu, flags, try_precise,
+					    &needs_precise)) {
 				mask |= ext_gpr_mask;
+				if (needs_precise)
+					precise_mask |= ext_gpr_mask;
 				abi |= PERF_SAMPLE_REGS_ABI_SIMD;
 				ext_batch_ok = true;
 			}
@@ -3486,22 +3515,16 @@ static void probe_pmu_regs_one(const struct perf_pmu *pmu,
 				for (int b = 0; b < 64; b++) {
 					if (!(ext_gpr_mask & BIT_ULL(b)))
 						continue;
-					e_attr.precise_ip = base_attr->precise_ip;
 					if (intr)
 						e_attr.sample_regs_intr = BIT_ULL(b);
 					else
 						e_attr.sample_regs_user = BIT_ULL(b);
-					fd = sys_perf_event_open(&e_attr, pid, cpu, -1, flags);
-					if (fd < 0 && intr && max_precise > 0) {
-						e_attr.precise_ip = 1;
-						fd = sys_perf_event_open(&e_attr, pid, cpu, -1,
-									 flags);
-					}
-					if (fd >= 0) {
-						close(fd);
-						mask |= BIT_ULL(b);
-						abi |= PERF_SAMPLE_REGS_ABI_SIMD;
-					}
+					if (!probe_regs_open(&e_attr, pid, cpu, flags,
+							     try_precise, &needs_precise))
+						continue;
+					mask |= BIT_ULL(b);
+					precise_mask |= needs_precise ? BIT_ULL(b) : 0;
+					abi |= PERF_SAMPLE_REGS_ABI_SIMD;
 				}
 			}
 		}
@@ -3512,7 +3535,7 @@ static void probe_pmu_regs_one(const struct perf_pmu *pmu,
 		u64 class_mask = intr ?
 			perf_intr_simd_reg_class_mask(EM_HOST, pred) :
 			perf_user_simd_reg_class_mask(EM_HOST, pred);
-		u64 supported_classes = 0;
+		u64 supported_classes = 0, precise_classes = 0;
 
 		for (int reg_c = 0; reg_c < 64; reg_c++) {
 			struct perf_event_attr s_attr = *base_attr;
@@ -3548,22 +3571,22 @@ static void probe_pmu_regs_one(const struct perf_pmu *pmu,
 					s_attr.sample_simd_vec_reg_user = bitmap;
 			}
 
-			fd = sys_perf_event_open(&s_attr, pid, cpu, -1, flags);
-			if (fd < 0 && intr && max_precise > 0) {
-				s_attr.precise_ip = 1;
-				fd = sys_perf_event_open(&s_attr, pid, cpu, -1, flags);
-			}
-			if (fd >= 0) {
-				close(fd);
+			if (probe_regs_open(&s_attr, pid, cpu, flags, try_precise,
+					    &needs_precise)) {
 				supported_classes |= BIT_ULL(reg_c);
+				if (needs_precise)
+					precise_classes |= BIT_ULL(reg_c);
 				abi |= PERF_SAMPLE_REGS_ABI_SIMD;
 			}
 		}
 
-		if (pred)
+		if (pred) {
 			*out_pred_mask = supported_classes;
-		else
+			pred_precise_mask = precise_classes;
+		} else {
 			*out_simd_mask = supported_classes;
+			simd_precise_mask = precise_classes;
+		}
 	}
 
 	if (!(abi & PERF_SAMPLE_REGS_ABI_SIMD)) {
@@ -3574,8 +3597,6 @@ static void probe_pmu_regs_one(const struct perf_pmu *pmu,
 		x_attr.disabled = 1;
 		x_attr.sample_period = base_attr->sample_period ?: 10000;
 		x_attr.sample_type = sample_type;
-		if (intr && max_precise > 0)
-			x_attr.precise_ip = 1;
 
 		if (ext_mask) {
 			if (intr)
@@ -3583,10 +3604,11 @@ static void probe_pmu_regs_one(const struct perf_pmu *pmu,
 			else
 				x_attr.sample_regs_user = ext_mask;
 
-			fd = sys_perf_event_open(&x_attr, pid, cpu, -1, flags);
-			if (fd >= 0) {
-				close(fd);
+			if (probe_regs_open(&x_attr, pid, cpu, flags, try_precise,
+					    &needs_precise)) {
 				mask |= ext_mask;
+				if (needs_precise)
+					precise_mask |= ext_mask;
 				batch_ok = true;
 			}
 		}
@@ -3604,10 +3626,11 @@ static void probe_pmu_regs_one(const struct perf_pmu *pmu,
 					x_attr.sample_regs_intr = BIT_ULL(b);
 				else
 					x_attr.sample_regs_user = BIT_ULL(b);
-				fd = sys_perf_event_open(&x_attr, pid, cpu, -1, flags);
-				if (fd >= 0) {
-					close(fd);
+				if (probe_regs_open(&x_attr, pid, cpu, flags, try_precise,
+						    &needs_precise)) {
 					mask |= BIT_ULL(b);
+					if (needs_precise)
+						precise_mask |= BIT_ULL(b);
 				}
 			}
 		}
@@ -3615,6 +3638,12 @@ static void probe_pmu_regs_one(const struct perf_pmu *pmu,
 
 	*out_mask = mask;
 	*out_abi = abi;
+	if (out_precise_mask)
+		*out_precise_mask = precise_mask;
+	if (out_simd_precise_mask)
+		*out_simd_precise_mask = simd_precise_mask;
+	if (out_pred_precise_mask)
+		*out_pred_precise_mask = pred_precise_mask;
 }
 
 /*
@@ -4000,7 +4029,10 @@ static void __perf_pmu__probe(struct perf_pmu *pmu, int pmu_cpu)
 				   &pmu->probed.user_regs_mask,
 				   &pmu->probed.user_regs_abi,
 				   &pmu->probed.user_simd_mask,
-				   &pmu->probed.user_pred_mask);
+				   &pmu->probed.user_pred_mask,
+				   /*out_precise_mask=*/NULL,
+				   /*out_simd_precise_mask=*/NULL,
+				   /*out_pred_precise_mask=*/NULL);
 	}
 	if (pmu->probed.sample_types & PERF_SAMPLE_REGS_INTR) {
 		probe_pmu_regs_one(pmu, &base_attr, pid, cpu, flags,
@@ -4008,7 +4040,10 @@ static void __perf_pmu__probe(struct perf_pmu *pmu, int pmu_cpu)
 				   &pmu->probed.intr_regs_mask,
 				   &pmu->probed.intr_regs_abi,
 				   &pmu->probed.intr_simd_mask,
-				   &pmu->probed.intr_pred_mask);
+				   &pmu->probed.intr_pred_mask,
+				   &pmu->probed.intr_regs_precise_mask,
+				   &pmu->probed.intr_simd_precise_mask,
+				   &pmu->probed.intr_pred_precise_mask);
 	}
 
 	/* 4. Privilege / exclusion modifiers */
diff --git a/tools/perf/util/pmu.h b/tools/perf/util/pmu.h
index 66ee3841872a..21c4b1a4b608 100644
--- a/tools/perf/util/pmu.h
+++ b/tools/perf/util/pmu.h
@@ -333,6 +333,22 @@ struct perf_pmu {
 		 * register classes.
 		 */
 		u64 intr_pred_mask;
+		/**
+		 * @probed.intr_regs_precise_mask: Subset of intr_regs_mask that
+		 * can only be sampled with precise sampling, such as x86 XMM
+		 * registers that are captured by PEBS.
+		 */
+		u64 intr_regs_precise_mask;
+		/**
+		 * @probed.intr_simd_precise_mask: Subset of intr_simd_mask that
+		 * can only be sampled with precise sampling.
+		 */
+		u64 intr_simd_precise_mask;
+		/**
+		 * @probed.intr_pred_precise_mask: Subset of intr_pred_mask that
+		 * can only be sampled with precise sampling.
+		 */
+		u64 intr_pred_precise_mask;
 	} probed;
 };
 
-- 
2.56.0.385.gac671c819a-goog

