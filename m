Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793749609;
	b=Y+IlgsStZTDPaWv5rB/lOk+QYnvGWK3HdI1AdBDa6FRJZijqJTTpbQMt/vyuAN4+J409
	 KjqpYf3QpPvY97HPJE9kb7rWmcuHSJzveGcFO8JEeaRD0aMin8+4sdFh1iJ9b7Ei725Mw
	 uMHKP+YqsL7OpmVAOamPaGdzBTmXhcSbnAqGTdSIpy5o2bevK5m1gufOOj7n1NSUeWg4Y
	 BmX2mr89LvZsXq5UJvwVB9JwsM8FuhHIbWc+6bNSjTLdfKXvgiZUHuYubhgKNBivDKgqf
	 776pdd285vpn/G9RJ708ihu8hKIZ/T+Ow9zzZtsWUblJEjjgR+IafJESXttTNUn+INw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793749609;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Received:Date:In-Reply-To:Mime-Version:
	 References:X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=7Md3VLEcxX9HNNraipqhO2t1Hdj+FVjTPLcFWjXY6nI=;
	b=N6W4wH1NMzOLFHHrxWp6ijyVJDT2ueGLS3YOXn6o/z8X15Dn1YPMMb/T/0kdJRhzL5fF
	 HzYXn1tpCqTV0ErquyGS8gAcPXq1/aI9W3c6HkRcr3rHxnkzzHJUNwkgrZDC0bj0MRgg2
	 SC+zqCHgN11P/0XiPV0EYLfrOIahtpdQh9J7VVHwrqNGcA2eV5U76z4DC2Q0uFrawBrN5
	 2vCSgC354dkGHe2xdvAVm7OsjXrPd8+FhKStFtBYVudcNxbJkU8NVV8q0PlbBdHv+WxJa
	 XeYLLatsLJMM/50p20/OWzuYpsOHM9r9JxzQ7hhtzOoyMBjdPInmao7tIFvTc+3sgxg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Tm1sOhwt;
	arc=none smtp.remote-ip=74.125.82.200
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FD24606A324
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 23:46:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1FD24606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Tm1sOhwt
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-35cbea41088so108752eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 15:46:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793749608; x=1794354408; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7Md3VLEcxX9HNNraipqhO2t1Hdj+FVjTPLcFWjXY6nI=;
        b=Tm1sOhwtIM1KdwtNd3ZTyA60Ov0SaukwVAg9go6Q+vaLyzQBylBeBrgXNGiTbM/bzl
         aV9JmQl3U95/4J85ZTB51xcfh2gwqbIAepJcGssMbqC8leELlkBoY8cwmcFZp3YUcLt4
         No5sDSOuPxdm+r1NQwGD8wLYS1cXRPYYsc05DGyr9io8Vg9xoYl+sjsOf+LQFVafImYy
         BqgvB4WWjl82Ga9OUL1H/wlL/5cyiHa2uUdKV0RjEkbSrq27GhZdTaavQIgn7bBnupwx
         cP+N1HRaTtUzPkScyHzoTZ7GXkHFz5vA81VHigj5d3UnlaYVQPSNVojEBnz93vdUNbUJ
         Xaxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793749608; x=1794354408;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7Md3VLEcxX9HNNraipqhO2t1Hdj+FVjTPLcFWjXY6nI=;
        b=z+GXav2raA0cxd/BzQ6WaCvIfM/AqrZWpNUQdx/NrOjMVeyLIVKFpfm8MmiBpRLIi4
         hT4cayPoP5txabxHbtDDXarZJ1zjfTglvPdWvGVYsicnHs6wigOJAX6bmNohT/Fm/aFf
         niRA1Z3ikgn4n6pg8Z3jz02wNGgcb1aPCeB1iLqaZScU8ynQOy0bmY0zfMDzKbEvcShm
         2BNw79nqTBkVMn8B90mKOhNFNff4a7Lu1Ua8Y22I0nHNk5M+mWR3YpUBSFTqkppbLPco
         X0HcIdaD9EE/Ndc4SySaOO4WNTGbDVT5j3JfDl+G4pDtsnZNlzwsST4sAalfHIqnhvGk
         RryA==
X-Gm-Message-State: APuU4Z+FxQTH2pI29oi3Qvp9ko3WM+y6F77uBG6WuyuWYK1noMqer/oX
	/MgYMSsUKmQaIppuRCnoe/GdKK+pGJVJUiiMWKnMPnJgKOcNtwuJK/+vI0sb4Jj8hHaQsYonJp0
	7Jx40kJX6Xg==
X-Received: from dyvj9-n2.prod.google.com ([2002:a05:693c:87c9:20b0:36c:9a6e:5413])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:693c:4152:20b0:36a:1807:75a4
 with SMTP id 5a478bee46e88-36a423cacb4mr24864506eec.20.1793749607940; Tue, 03
 Nov 2026 15:46:47 -0800 (PST)
Date: Tue,  3 Nov 2026 15:44:54 -0800
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
Message-ID: <20261103234502.1008382-39-irogers@google.com>
Subject: [PATCH v1 38/41] perf pmu: Probe branch instruction skid
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

Extend perf_pmu__probe() with run_skid_branch_loop() and
probe_pmu_skid() to empirically measure branch instruction skid across
supported precise_ip levels (0..3) on core PMUs.

For each supported precise_ip level, open a branch sampling event on the
current thread, execute a NOP-runway loop ending in a backward
conditional branch on x86_64, arm64, and riscv, and compute the minimum,
maximum, average, and exact-IP (zero-skid) sample counts from the
recorded ring buffer samples.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/pmu.c | 259 ++++++++++++++++++++++++++++++++++++++++++
 tools/perf/util/pmu.h |  15 +++
 2 files changed, 274 insertions(+)

diff --git a/tools/perf/util/pmu.c b/tools/perf/util/pmu.c
index e26563342ad1..a5adbd34c5f2 100644
--- a/tools/perf/util/pmu.c
+++ b/tools/perf/util/pmu.c
@@ -3920,6 +3920,263 @@ static void probe_mmap_caps(struct perf_pmu *pmu,
 	}
 }
 
+/*
+ * Mark noinline so the compiler does not inline the multi-kilobyte .rept nop
+ * runway into callers; GCC estimates inline asm size by counting newlines in
+ * the template string and would otherwise emit short-range conditional
+ * branches (such as ARM64 tbz/tbnz with a +-32KB range) across the inlined
+ * block.
+ */
+static noinline bool run_skid_branch_loop(unsigned long iters,
+					  uintptr_t *out_s_ip,
+					  uintptr_t *out_b_ip,
+					  uintptr_t *out_e_ip,
+					  int *out_insn_sz, int *out_nop_cnt)
+{
+#if defined(__x86_64__)
+	uintptr_t s_ip, b_ip, e_ip;
+
+	asm volatile(
+		"lea 1f(%%rip), %[s_ip]\n\t"
+		"lea 2f(%%rip), %[b_ip]\n\t"
+		"lea 3f(%%rip), %[e_ip]\n\t"
+		".balign 64\n"
+		"1:\n\t"
+		".rept 8192\n\t"
+		"nop\n\t"
+		".endr\n\t"
+		"dec %[cnt]\n\t"
+		"2:\n\t"
+		"jnz 1b\n"
+		"3:\n\t"
+		: [cnt] "+r" (iters),
+		  [s_ip] "=&r" (s_ip),
+		  [b_ip] "=&r" (b_ip),
+		  [e_ip] "=&r" (e_ip)
+		:
+		: "cc", "memory"
+	);
+	*out_s_ip = s_ip;
+	*out_b_ip = b_ip;
+	*out_e_ip = e_ip;
+	*out_insn_sz = 1;
+	*out_nop_cnt = 8192;
+	return true;
+#elif defined(__aarch64__)
+	uintptr_t s_ip, b_ip, e_ip;
+
+	asm volatile(
+		"adr %[s_ip], 1f\n\t"
+		"adr %[b_ip], 2f\n\t"
+		"adr %[e_ip], 3f\n\t"
+		".balign 64\n"
+		"1:\n\t"
+		".rept 1024\n\t"
+		"nop\n\t"
+		".endr\n\t"
+		"subs %[cnt], %[cnt], #1\n\t"
+		"2:\n\t"
+		"b.ne 1b\n"
+		"3:\n\t"
+		: [cnt] "+r" (iters),
+		  [s_ip] "=&r" (s_ip),
+		  [b_ip] "=&r" (b_ip),
+		  [e_ip] "=&r" (e_ip)
+		:
+		: "cc", "memory"
+	);
+	*out_s_ip = s_ip;
+	*out_b_ip = b_ip;
+	*out_e_ip = e_ip;
+	*out_insn_sz = 4;
+	*out_nop_cnt = 1024;
+	return true;
+#elif defined(__riscv)
+	uintptr_t s_ip, b_ip, e_ip;
+
+	asm volatile(
+		".option push\n\t"
+		".option norvc\n\t"
+		"la %[s_ip], 1f\n\t"
+		"la %[b_ip], 2f\n\t"
+		"la %[e_ip], 3f\n\t"
+		".balign 64\n"
+		"1:\n\t"
+		".rept 512\n\t"
+		"nop\n\t"
+		".endr\n\t"
+		"addi %[cnt], %[cnt], -1\n\t"
+		"2:\n\t"
+		"bnez %[cnt], 1b\n"
+		"3:\n\t"
+		".option pop\n\t"
+		: [cnt] "+r" (iters),
+		  [s_ip] "=&r" (s_ip),
+		  [b_ip] "=&r" (b_ip),
+		  [e_ip] "=&r" (e_ip)
+		:
+		: "memory"
+	);
+	*out_s_ip = s_ip;
+	*out_b_ip = b_ip;
+	*out_e_ip = e_ip;
+	*out_insn_sz = 4;
+	*out_nop_cnt = 512;
+	return true;
+#else
+	(void)iters;
+	*out_s_ip = 0;
+	*out_b_ip = 0;
+	*out_e_ip = 0;
+	*out_insn_sz = 0;
+	*out_nop_cnt = 0;
+	return false;
+#endif
+}
+
+/*
+ * Measure branch instruction skid across supported precise_ip levels (0..3)
+ * by sampling a tight NOP-runway branch loop and inspecting sample IPs.
+ */
+static void probe_pmu_skid(struct perf_pmu *pmu,
+			   const struct perf_event_attr *base_attr,
+			   unsigned long flags)
+{
+	struct perf_event_attr br_attr;
+	char br_buf[256];
+	long page_sz = sysconf(_SC_PAGESIZE);
+	size_t data_sz, mmap_sz;
+
+	if (!pmu->is_core || !pmu->probed.can_sample)
+		return;
+
+	if (page_sz <= 0)
+		page_sz = 4096;
+	data_sz = 4 * (size_t)page_sz;
+	mmap_sz = (size_t)page_sz + data_sz;
+
+	memset(&br_attr, 0, sizeof(br_attr));
+	snprintf(br_buf, sizeof(br_buf), "%s/branches/", pmu->name);
+	if (!parse_candidate_attr(br_buf, &br_attr)) {
+		br_attr.type = PERF_TYPE_HARDWARE;
+		br_attr.size = base_attr->size;
+		br_attr.config = PERF_COUNT_HW_BRANCH_INSTRUCTIONS;
+		if (perf_pmus__host_supports_extended_type())
+			br_attr.config |= (__u64)pmu->type << PERF_PMU_TYPE_SHIFT;
+	}
+	br_attr.exclude_user = base_attr->exclude_user;
+	br_attr.exclude_kernel = 1;
+	br_attr.exclude_hv = 1;
+	br_attr.exclude_idle = base_attr->exclude_idle;
+	br_attr.exclude_host = base_attr->exclude_host;
+	br_attr.exclude_guest = base_attr->exclude_guest;
+
+	for (int lvl = 0; lvl <= 3; lvl++) {
+		struct perf_event_attr attr = br_attr;
+		struct perf_event_mmap_page *pc;
+		uintptr_t s_ip = 0, b_ip = 0, e_ip = 0;
+		int insn_sz = 0, nop_cnt = 0;
+		void *ring;
+		u8 *data;
+		u64 head, tail = 0;
+		int samples = 0, exact = 0;
+		int min_skid = 999999, max_skid = 0;
+		long sum_skid = 0;
+		int fd;
+
+		if (lvl > 0 && !(pmu->probed.precise_mask & (1u << lvl)))
+			continue;
+
+		attr.disabled = 1;
+		attr.sample_period = 251;
+		attr.sample_type = PERF_SAMPLE_IP;
+		attr.precise_ip = lvl;
+
+		fd = sys_perf_event_open(&attr, 0, -1, -1, flags);
+		if (fd < 0 && lvl > 0 && attr.exclude_kernel && attr.config2 == 0) {
+			attr.config2 = 1;
+			fd = sys_perf_event_open(&attr, 0, -1, -1, flags);
+		}
+		if (fd < 0)
+			continue;
+
+		ring = mmap(NULL, mmap_sz, PROT_READ | PROT_WRITE, MAP_SHARED, fd, 0);
+		if (ring == MAP_FAILED) {
+			close(fd);
+			continue;
+		}
+
+		ioctl(fd, PERF_EVENT_IOC_RESET, 0);
+		ioctl(fd, PERF_EVENT_IOC_ENABLE, 0);
+		if (!run_skid_branch_loop(8000, &s_ip, &b_ip, &e_ip,
+					  &insn_sz, &nop_cnt)) {
+			ioctl(fd, PERF_EVENT_IOC_DISABLE, 0);
+			munmap(ring, mmap_sz);
+			close(fd);
+			break;
+		}
+		ioctl(fd, PERF_EVENT_IOC_DISABLE, 0);
+
+		pc = ring;
+		head = READ_ONCE(pc->data_head);
+		/* Ensure data_head is read before reading ring buffer contents. */
+		rmb();
+		if (head > data_sz)
+			head = data_sz;
+		data = (u8 *)ring + page_sz;
+
+		while (tail + sizeof(struct perf_event_header) <= head) {
+			struct perf_event_header *hdr =
+				(struct perf_event_header *)(data + tail);
+
+			if (hdr->size == 0 || tail + hdr->size > head)
+				break;
+			if (hdr->type == PERF_RECORD_SAMPLE &&
+			    hdr->size >= sizeof(*hdr) + sizeof(u64)) {
+				u64 ip = *(u64 *)((u8 *)hdr + sizeof(*hdr));
+				uintptr_t uip = (uintptr_t)ip;
+
+				if (uip >= s_ip && uip <= e_ip && insn_sz > 0) {
+					int skid;
+
+					if (uip == b_ip) {
+						skid = 0;
+					} else if (uip >= s_ip && uip < b_ip) {
+						long off = (long)(uip - s_ip) / insn_sz;
+
+						skid = (off < nop_cnt) ?
+						       (int)(off + 1) : (nop_cnt + 1);
+					} else {
+						skid = 1;
+					}
+
+					samples++;
+					if (hdr->misc & PERF_RECORD_MISC_EXACT_IP)
+						exact++;
+					if (skid < min_skid)
+						min_skid = skid;
+					if (skid > max_skid)
+						max_skid = skid;
+					sum_skid += skid;
+				}
+			}
+			tail += hdr->size;
+		}
+
+		if (samples > 0) {
+			pmu->probed.skid[lvl].measured = true;
+			pmu->probed.skid[lvl].samples = samples;
+			pmu->probed.skid[lvl].exact_samples = exact;
+			pmu->probed.skid[lvl].min_skid = min_skid;
+			pmu->probed.skid[lvl].max_skid = max_skid;
+			pmu->probed.skid[lvl].avg_skid = (double)sum_skid / samples;
+		}
+
+		munmap(ring, mmap_sz);
+		close(fd);
+	}
+}
+
 static void __perf_pmu__probe(struct perf_pmu *pmu, int pmu_cpu)
 {
 	struct probe_candidates cands = { .nr = 0 };
@@ -4256,6 +4513,8 @@ static void __perf_pmu__probe(struct perf_pmu *pmu, int pmu_cpu)
 				}
 			}
 		}
+
+		probe_pmu_skid(pmu, &base_attr, flags);
 	}
 
 	/* 3b. User and interrupt register sampling masks */
diff --git a/tools/perf/util/pmu.h b/tools/perf/util/pmu.h
index bb21e910da90..4bdb8daf7a5a 100644
--- a/tools/perf/util/pmu.h
+++ b/tools/perf/util/pmu.h
@@ -381,6 +381,21 @@ struct perf_pmu {
 		 * can only be sampled with precise sampling.
 		 */
 		u64 intr_pred_precise_mask;
+		/** @probed.skid: Measured branch instruction skid at precise_ip levels (0..3). */
+		struct {
+			/** @probed.skid.measured: Was skid measured at this precise_ip level? */
+			bool measured;
+			/** @probed.skid.samples: Number of branch samples collected. */
+			int samples;
+			/** @probed.skid.exact_samples: Samples with zero skid from target IP. */
+			int exact_samples;
+			/** @probed.skid.min_skid: Minimum instruction skid observed. */
+			int min_skid;
+			/** @probed.skid.max_skid: Maximum instruction skid observed. */
+			int max_skid;
+			/** @probed.skid.avg_skid: Average instruction skid across samples. */
+			double avg_skid;
+		} skid[4];
 	} probed;
 };
 
-- 
2.56.0.385.gac671c819a-goog

