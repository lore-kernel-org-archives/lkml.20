Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794599800;
	b=j5LzF/m8qWykX62MCrsLaeC1rLQ+3xICpZ0OhJRGcZteJlmZMmzpJJa+YTSbHhom0++N
	 yCsPooIfm3tzu4K452LKq00ukZ+ZbbJumxJ/xek5sPxD2xF/G6uCcmSXDDkIA3sRv9wwQ
	 Ci/gQzfY1U/5ZaQtS+PX6L5m+uKrY5py0LVoO5+u71UcI+YS1q5fC++raDgRuRBqQEt6r
	 e5B7SzNrtKgVJiChPnI6lNz0E39lFmBmwD+6HaIJwCUE98bDj1PhbWZYBByX5h0U1bMQh
	 BG+eUn4Rh/bTDJSylmIxe3zrkaWtkDZCKfTzqpmOgUCzjYdzLdPWbLnG6LXNALopFuA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794599800;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=UcL/o0gLFgKjfaSHFlON0JxVCm55Q7Iu8bvskJ2RQYk=;
	b=nbPgTBXCFTmIFmO9KawMpQa49RtNgjj43FIYQGoly7Kw8yO1Iqlf/0z3CLcd3R75VD+b
	 F3UQ9JeDNBPQ7ICVwnedRDVouWY23DQqDa7CEKePiEBk41lswQ4SrEmjm0PUmU7bjIhr2
	 ExC2UTSpv0KfY2zb/GBLhFIjlbxhOWm2WMq+BwFhNxYeOwkErWeb5HMVW5Uq7S33ih5pI
	 +iJqGHGO9mKc8cqkIl8AEL8G+9I0+EZdy7rg/bItGdnz8i0ZXPEJjEdfjQob5AYvrlFG1
	 jXu/GAihjG+sT6xJ6/iCBP1FQrkvRFMz4NRBe+wHyGBo9GWogquWqUCK+QOcNl88cOg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ip73ItuR;
	arc=none smtp.remote-ip=74.125.82.69
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AB8A6070446
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 19:56:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1AB8A6070446
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ip73ItuR
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1b3b5b49cabso1248790c88.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 11:56:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794599798; x=1795204598; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UcL/o0gLFgKjfaSHFlON0JxVCm55Q7Iu8bvskJ2RQYk=;
        b=ip73ItuR+8IfG1VSJrOSHyVzLscXHaXoUSaOEscnertGWVuUu223ukTO5lF1iJ5b2i
         hGCE0QB8Sqg8MZa+IfgXasbsjRPVeeeSPJ2hRjHE+jcdtUA1CzwWjJvcUQJcKn8XUkSR
         Myix3ByN9pt6fjme6FnyySrEekZBFDXKFxR8p1r8dAwDiQoUMjeqTAEXTuVcFsm6QMFK
         mIArxl/vqnjd1OYT+Ux2WxqCdkI3Z7MAiVqxl1b6a03iH7wbaB8ImTBUxolDl556N5IS
         KfzGTi7tKRfjunkohcMybL3wUGcjbKmvspDGnivZC80mQw52uL4JJbtXQZgLv3yijNko
         mfGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794599798; x=1795204598;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UcL/o0gLFgKjfaSHFlON0JxVCm55Q7Iu8bvskJ2RQYk=;
        b=rrXGAFyAEk8Od7pd33fdhR8/KQ8Fxvyht0Z0YWeYIVXQQkxka6OAWQn8Px2WRqfHNz
         LlEboh0fp8GL0v2ucDJyif/6nWD98Uys3sYvxKhp98GJHNUbXs58kPXQYoEzdYMg6tiC
         sD8flmXzi2pS9tm1wAb/dRrVhTHWslMyv10TghWD2MGMPqJP/az288wPK1kdIq4qOSf2
         jKsPMauJ7uAg/rrhBTwAdlQ14tnyKv+VhFLkJI42/5QxJqg1NAqAi8ceN2YzzU92f474
         re//PdNvykbITlZpXE9RZNapvLVeSE/VbgJ4IywqojgKn1YRKl76DE1HYel6lNhibjXd
         cHtQ==
X-Forwarded-Encrypted: i=1; AL+hErGS6oI/RFXczClZkN1GgeSM/v740Ph6DbKrnsWC8UieBDiYt8GImo0V5o6MFX6uKCyIIlhfTYQIOisWkJc=@vger.kernel.org
X-Gm-Message-State: APuU4Z8cDv9YH92Cvxp7xkYm3xJ0goPYhyEN24v7Dj1EKGRRol5JRsMm
	L/dlv9AnZNj78wkwAWAIAPko3n0Om2EDl0ms8PLkqXKB80TfCzYJPO7Z4upbdCa/IOrZsqZP+2a
	v9m/rJqmf2g==
X-Received: from dybud10.prod.google.com ([2002:a05:7300:f60a:b0:36c:9b55:8436])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:3a8b:b0:182:94d7:f76a
 with SMTP id a92af1059eb24-1b5031562c3mr3505799c88.43.1794599797828; Fri, 13
 Nov 2026 11:56:37 -0800 (PST)
Date: Fri, 13 Nov 2026 11:55:58 -0800
In-Reply-To: <20261113195601.2872738-1-irogers@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261113195601.2872738-1-irogers@google.com>
X-Mailer: git-send-email 2.56.1.703.gf848ed807c-goog
Message-ID: <20261113195601.2872738-14-irogers@google.com>
Subject: [PATCH v2 13/16] perf pmu: Probe branch instruction skid
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	James Clark <james.clark@linaro.org>
Cc: linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
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
index 04bd5b1bc33f..8157ada08502 100644
--- a/tools/perf/util/pmu.c
+++ b/tools/perf/util/pmu.c
@@ -3934,6 +3934,263 @@ static void probe_mmap_caps(struct perf_pmu *pmu,
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
@@ -4291,6 +4548,8 @@ static void __perf_pmu__probe(struct perf_pmu *pmu, int pmu_cpu)
 				pmu->probed.max_precise = 0;
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
2.56.1.703.gf848ed807c-goog

