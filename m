Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793749606;
	b=xziNXOVp0M37DOtqx8rdlm6Nn6R6awgm/uuRKLqTeZzub51fXOxNMpXMpZrdddPTkhy6
	 WLy+kkEZluvvbDL/HXNOIn7d0DnFozCLxJlD2XnX8tx3hrJbBYbZ1eP/f0ega34coy2i+
	 N71IZ7pwqGCXjNFVl3XINzqD5pUVmsa/jVWAwfJgDlE35l3arX8BNWKaPkYxW6DU8Sr28
	 KFD64kLPGwRukga3cwhw2Tna2biksEnNkS/2eTBgati9uC88A1bhUh8XOy6cYt451/PE8
	 TxfuJbOI6f/vQTSlCgzQKEbhYr5nYvs4fG+Vw8adT48VZpiqfjKLJjfx0F1+0JqlnLw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793749606;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Received:Date:In-Reply-To:Mime-Version:
	 References:X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=qb/eOMu+EQ/DagvX3AeGtHMes1TXz69L3xGke5W3ARc=;
	b=WPW9eOu6k6jeQV+wiq35sqaKqT6Yhm+0l6vJoNb3WhBsHW3Yr/VA2KeZKUvLwYzm92mV
	 0RaIZPZ+qFYcNI/fB4QaE/Gqcq9FJzYpwIHkD/0nqOuQ8iNJ9hQj0hsKw2AAge7GR7s1z
	 4zdBS4szN4QrKZCwE05n2F7aQRXsw918WaBotpC3/+ubA1frrPd14ZcaxgE/A7gfvCWEm
	 /sLN0GPqk7+GtVCUSeJ0RcFn0GtxM+Hf6yZda1YSjc08AVMWzBbkyUVx5x/PArYlvh8AD
	 wkAxouYdnSJe0snUVxOrjAfBFANxIooaalHE3xqfElLWjPopLlzL7bIH2e9NnKokc+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ndeFvMWL;
	arc=none smtp.remote-ip=74.125.82.197
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89704606EE96
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 23:46:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 89704606EE96
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ndeFvMWL
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-36998507c13so99298eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 15:46:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793749606; x=1794354406; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qb/eOMu+EQ/DagvX3AeGtHMes1TXz69L3xGke5W3ARc=;
        b=ndeFvMWLlHqqXT+jFSvnCzMIdV/tQuGFlJ6nmThByKGX1Do1lwctoJrK7TsBcTXHPj
         IY2faUFVpxcJc8ssrBLyFlrmz6tDrre6Lrm3qWzuUC/lRGori+8SCoiaB07j8wbQG3U5
         P1zxPFYjSytAN4JpcLsNn9w6Fs6VtLSvqHO37ObNos9r3elEe/4EYaOEeMWdH3pIJcw6
         BDTgeWj94FkveHSjM4u+x+9yYvSV9ViHhskXFxvbvuMXnbBXjwzPXw/GsZQ9oODT4bHf
         foSFg6dggtQ9RiGacl5kH/8nhbys3saWe81enat7Jsb+yc3UbZFHRlPfiE7B0jdzF4yC
         DfkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793749606; x=1794354406;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qb/eOMu+EQ/DagvX3AeGtHMes1TXz69L3xGke5W3ARc=;
        b=zp9qoj+GWW7jwgvfva/WBthQ/PLnnxhI1Ay0ZRa/sH5WAQcUdN+wZifTmq2P3OBXJx
         Xk/71gJPxsD6TqqSTEQtWCPkDZlji6n1Y4gKNnnNtemwV9nn0dXBN4JkK861r57vaRol
         CFZ+WIxO8AZDhPCSVnx4oNUXI2s0mqIPAx97RLzPlBAXvcy6t4CiGymLCidN62ym/4ET
         +TbkawpreEsZFXssUDZ4AGmCr+niGXgXZF8TwYqWLaT/WUjpFps4GfVv0Ae/K8NE3rM6
         N9SgzOWm22shN9Fb5Is1duuBh20VlUfc9iKoN5Zt7lgeYQvRsBw7pXzljMAkTCrOBOX9
         8uig==
X-Gm-Message-State: APuU4Z+OSqGnHHCzD6eO0XL1I1hJGFYFn0fDrexPjIycBd4JMUgmZEHP
	+BnqQBhY81OLLKR5/C31cYCWW6YKSs9Vjj6oSQ99P3D202qEKLC8DihERRv7PTNcay/lNBEhgqU
	3e8VLgKrJmw==
X-Received: from dyng38.prod.google.com ([2002:a05:7300:7f26:b0:369:1c3f:4baa])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7301:1701:b0:36c:d170:1b11
 with SMTP id 5a478bee46e88-36cd17f5e97mr220124eec.25.1793749605118; Tue, 03
 Nov 2026 15:46:45 -0800 (PST)
Date: Tue,  3 Nov 2026 15:44:53 -0800
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
Message-ID: <20261103234502.1008382-38-irogers@google.com>
Subject: [PATCH v1 37/41] perf pmu: Probe user-space mmap capabilities
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

Extend perf_pmu__probe() with probe_mmap_caps() to inspect the
perf_event_mmap_page of an opened event on the PMU.

Record whether user-space counter reading (rdpmc on x86, mrs on arm64
with format/rdpmc=1) is available in sysfs/sysctl and enabled in
cap_user_rdpmc, verify whether executing a self-read via
perf_mmap__read_self() produces non-zero advancing counts
(rdpmc_works), and record pmc_width and cap_user_time /
cap_user_time_zero / cap_user_time_short support.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/pmu.c | 103 ++++++++++++++++++++++++++++++++++++++++++
 tools/perf/util/pmu.h |  25 ++++++++++
 2 files changed, 128 insertions(+)

diff --git a/tools/perf/util/pmu.c b/tools/perf/util/pmu.c
index bc3c821153b6..e26563342ad1 100644
--- a/tools/perf/util/pmu.c
+++ b/tools/perf/util/pmu.c
@@ -3820,6 +3820,106 @@ static bool probe_format_pack(const struct perf_pmu *pmu, struct perf_event_attr
 	return true;
 }
 
+/*
+ * Probe user-space perf_event_mmap_page capabilities, including user-space
+ * counter reading (rdpmc/mrs/csrr), counter bit-width, and user time fields.
+ */
+static void probe_mmap_caps(struct perf_pmu *pmu,
+			    const struct perf_event_attr *base_attr,
+			    pid_t pid, int cpu, unsigned long flags)
+{
+	struct perf_event_attr attr = *base_attr;
+	struct perf_event_mmap_page *pc;
+	long page_sz = sysconf(_SC_PAGESIZE);
+	bool has_rdpmc_cap = false;
+	int events_fd;
+	int fd = -1;
+
+	pmu->probed.rdpmc_sysfs = -1;
+
+	if (page_sz <= 0)
+		page_sz = 4096;
+
+	events_fd = perf_pmu__event_source_devices_fd();
+	if (events_fd >= 0) {
+		int pmu_dirfd = openat(events_fd, pmu->name, O_DIRECTORY | O_RDONLY | O_CLOEXEC);
+
+		if (pmu_dirfd >= 0) {
+			if (faccessat(pmu_dirfd, "rdpmc", F_OK, 0) == 0) {
+				int rfd;
+
+				has_rdpmc_cap = true;
+				rfd = openat(pmu_dirfd, "rdpmc", O_RDONLY | O_CLOEXEC);
+				if (rfd >= 0) {
+					char rbuf[16];
+					ssize_t n = read(rfd, rbuf, sizeof(rbuf) - 1);
+
+					if (n > 0) {
+						rbuf[n] = '\0';
+						pmu->probed.rdpmc_sysfs = atoi(rbuf);
+					}
+					close(rfd);
+				}
+			}
+			close(pmu_dirfd);
+		}
+		close(events_fd);
+	}
+
+	attr.disabled = 0;
+
+	/*
+	 * On architectures such as arm64, user-space counter reading must be
+	 * explicitly requested via format/rdpmc (e.g. config1:1).
+	 */
+	if (perf_pmu__has_format(pmu, "rdpmc")) {
+		struct perf_event_attr r_attr = attr;
+		int uval;
+
+		has_rdpmc_cap = true;
+		if (pmu->probed.rdpmc_sysfs < 0 &&
+		    sysctl__read_int("kernel/perf_user_access", &uval) == 0)
+			pmu->probed.rdpmc_sysfs = uval;
+
+		if (probe_format_pack(pmu, &r_attr, "rdpmc", 1))
+			fd = sys_perf_event_open(&r_attr, 0, -1, -1, flags);
+	}
+
+	if (fd < 0 && !pmu->is_uncore)
+		fd = sys_perf_event_open(&attr, 0, -1, -1, flags);
+	if (fd < 0)
+		fd = sys_perf_event_open(&attr, pid, cpu, -1, flags);
+
+	if (fd >= 0) {
+		pc = mmap(NULL, page_sz, PROT_READ, MAP_SHARED, fd, 0);
+		if (pc != MAP_FAILED) {
+			if (has_rdpmc_cap || pc->cap_user_rdpmc) {
+				pmu->probed.rdpmc_available = true;
+				pmu->probed.pmc_width = pc->pmc_width;
+			}
+			if (pc->cap_user_rdpmc && pc->index != 0) {
+				struct perf_mmap map = { .base = pc };
+				struct perf_counts_values start = { .val = 0 };
+				struct perf_counts_values end = { .val = 0 };
+
+				pmu->probed.can_user_rdpmc = true;
+				if (perf_mmap__read_self(&map, &start) == 0) {
+					for (int spin = 0; spin < 10000; spin++)
+						barrier();
+					if (perf_mmap__read_self(&map, &end) == 0 &&
+					    end.val >= start.val && end.val > 0)
+						pmu->probed.rdpmc_works = true;
+				}
+			}
+			pmu->probed.can_user_time = !!pc->cap_user_time;
+			pmu->probed.can_user_time_zero = !!pc->cap_user_time_zero;
+			pmu->probed.can_user_time_short = !!pc->cap_user_time_short;
+			munmap(pc, page_sz);
+		}
+		close(fd);
+	}
+}
+
 static void __perf_pmu__probe(struct perf_pmu *pmu, int pmu_cpu)
 {
 	struct probe_candidates cands = { .nr = 0 };
@@ -4348,6 +4448,9 @@ static void __perf_pmu__probe(struct perf_pmu *pmu, int pmu_cpu)
 		}
 	}
 
+	/* 5b. User-space mmap capabilities (rdpmc, user_time, pmc_width) */
+	probe_mmap_caps(pmu, &base_attr, pid, cpu, flags);
+
 	/* 5c. Auto-counter reload (acr_mask / ratio-to-prev) */
 	if (pmu->probed.can_sample && perf_pmu__has_format(pmu, "acr_mask")) {
 		struct perf_event_attr l_attr = base_attr;
diff --git a/tools/perf/util/pmu.h b/tools/perf/util/pmu.h
index ee56570cac00..bb21e910da90 100644
--- a/tools/perf/util/pmu.h
+++ b/tools/perf/util/pmu.h
@@ -266,6 +266,24 @@ struct perf_pmu {
 		bool can_aux_resume;
 		/** @probed.can_aux_sample: Supports AUX area snapshot sampling. */
 		bool can_aux_sample;
+		/**
+		 * @probed.rdpmc_available: PMU supports user-space counter
+		 * reading (rdpmc/mrs/csrr).
+		 */
+		bool rdpmc_available;
+		/**
+		 * @probed.can_user_rdpmc: User-space counter reading enabled
+		 * (cap_user_rdpmc & index).
+		 */
+		bool can_user_rdpmc;
+		/** @probed.rdpmc_works: User-space counter read instruction executed and worked. */
+		bool rdpmc_works;
+		/** @probed.can_user_time: Supports user-space time conversion (cap_user_time). */
+		bool can_user_time;
+		/** @probed.can_user_time_zero: Supports cap_user_time_zero in mmap page. */
+		bool can_user_time_zero;
+		/** @probed.can_user_time_short: Supports cap_user_time_short in mmap page. */
+		bool can_user_time_short;
 		/** @probed.exclude_user: Supports perf_event_attr::exclude_user. */
 		bool exclude_user;
 		/** @probed.exclude_kernel: Supports perf_event_attr::exclude_kernel. */
@@ -304,8 +322,15 @@ struct perf_pmu {
 		int user_regs_abi;
 		/** @probed.intr_regs_abi: ABI flags for intr_regs_mask. */
 		int intr_regs_abi;
+		/**
+		 * @probed.rdpmc_sysfs: Value from sysfs rdpmc or perf_user_access
+		 * (-1 if unknown).
+		 */
+		int rdpmc_sysfs;
 		/** @probed.mem_events_mask: Bitmask of memory event types verified by probing. */
 		unsigned int mem_events_mask;
+		/** @probed.pmc_width: Bit-width of hardware counter for user-space rdpmc. */
+		u16 pmc_width;
 		/**
 		 * @probed.sample_types: Bitmask of supported
 		 * enum perf_event_sample_format flags.
-- 
2.56.0.385.gac671c819a-goog

