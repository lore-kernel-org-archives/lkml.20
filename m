Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794599797;
	b=HC9poNkHa/nLLFx6kwTVRd4yeLR/1FO0veWZO+riWMnltZNIzP4H/AG13AUb21Dz12FK
	 H803EkcOXky6k9qbxQc0nKiX4Tuv8J/aEhKE0REbLfL9BGEHUzY1aEA7WpabUFOIVg0mV
	 TTBuuLMyz+cDaWS3mOM9qRV1BZbk0aYVf2IKmB362DQxEEjqIlb3Q2c+oZCz215SDmaHv
	 3OIjx8d8cmf/p0+S8dW6+0GLCbVcRN95IYb1AqEZ86/NWV0bNHObMEbnh816Wfc5jg0ox
	 irjARF22Mi1b9L4/rGG6N5fpEDKR7VC8M1nIcK9CPbyPuMzFnVyLTMp+LqMxFRJSSpw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794599797;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=G0un34rxHDczJbdGjsrQUrNHKcv3KvYBqQP6/AKAM5g=;
	b=TnU9jCJUtianF4TsiVy/klYIPn30+WBXaDA+SM+47Wo1ebG4os+p3sHkGPGbzm0v6DP1
	 RkcA9cp3nc0RBVW29PQbr9SwbxbGLLMZ3RAnkuRyPNd4NF1IvHFen/BTKDzm5fLXz4CBf
	 QKMj8l01Ct1EeMTXfC7DhYfw0TSRL1eIQhFSrOX49GdgcNMoG0wSjYeHknVFCMUhXfdz8
	 bI5TJwSjWRPA3pwwWmUtGeYP51fyYrasDIh8G/Y+pQVBn7DC4e/box6RFWbVyBMryaq5P
	 g4I/mmiUgYprOoQrlfqvfGCTQOeM3/nGqF0vCBBQMb0R3H2I2tWa8H5ikpIjaG+/7hQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=UGpb91xk;
	arc=none smtp.remote-ip=74.125.82.198
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C890E60A262B
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 19:56:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C890E60A262B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=UGpb91xk
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-3724667bc16so816589eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 11:56:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794599796; x=1795204596; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G0un34rxHDczJbdGjsrQUrNHKcv3KvYBqQP6/AKAM5g=;
        b=UGpb91xkJQws/3ozNKgQarDXtXd8bM0ekhLPN2e2EsNE+xQQrl3AZIr4VOp62xt8nd
         R0EV0VxyuIlJPPccESPmP+7KuD6hyb3XYv27ieHGcoBLU4AnSZArVihcK59tVpZ8jjAx
         zII5chfOejLaSXn9CWhSgR0kUzFFHfV4SXldt3EMVCdfA31HXRV5KmUZEhNgHjZzPg/z
         jbWjHjMZwovenkh2I2N3QsnLMGURuV8pI3iXfm33rlg1jam6CGjscGuBbYzetz4VvZsy
         I/lVbRpP8FQ1l38YP+8ddjiuRodLiQ1p2zbytK85EJop66VuXr0tzWD7KaqxpGkdfrId
         Ehfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794599796; x=1795204596;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G0un34rxHDczJbdGjsrQUrNHKcv3KvYBqQP6/AKAM5g=;
        b=1HePO3rxUZp3c2yhhTuQQBawQB73cyujk2kRr4QeIomLw7+Xgi4x0lbdxD5S+I3Pq/
         is253zC0GejZ4fH/PdK2TrX4t5YMPvuUh1ba8QvG2rVNz8Z22V4lhWuINzz15jABtSYI
         KIXHfOS/a0ATo8+7APNFOBDtZ1gwVY7JKBLOxA3ZEVlcu0rJ4ghWEhpAAChnsdJ0v9G7
         idEMjqGIys5KoAxCBnnTN6fexK6EAnTWrEBi7uOvfwWZ/BAPkf/C01oiyYHMVSmjhI7k
         djurQXzZzZdgNXPoYHkgbg5joRrnHxhBQB7DeBd3pU6uAoYZEhvG+55ErHAVmfuzIuhB
         /y9w==
X-Forwarded-Encrypted: i=1; AL+hErFqas+enUM0lLWTgKtGy8bGmx/z6e585LBjOOoRTdYuojgwdyDUXglfEijS2T4CYhEZ5yvLtCr75uWSQBA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/uvphzqZVwNofsgaSY+D1/g0pmojTbMxHlCfkdUuuHBEmi2UZ4
	o6TEyrZO0hFTWoSgaadyvOqMbVY22wNSeuIthoM1ZnPVG/9V8QBoo4tNicDI3CbT7redrFH06OZ
	7VHQn2LyDEw==
X-Received: from dylq9.prod.google.com ([2002:a05:7300:5989:b0:36c:a092:ca28])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7300:c38f:b0:36a:79cd:12df
 with SMTP id 5a478bee46e88-3796676ad9cmr2913374eec.9.1794599795372; Fri, 13
 Nov 2026 11:56:35 -0800 (PST)
Date: Fri, 13 Nov 2026 11:55:57 -0800
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
Message-ID: <20261113195601.2872738-13-irogers@google.com>
Subject: [PATCH v2 12/16] perf pmu: Probe user-space mmap capabilities
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	James Clark <james.clark@linaro.org>
Cc: linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
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
 tools/perf/util/pmu.c | 111 ++++++++++++++++++++++++++++++++++++++++++
 tools/perf/util/pmu.h |  25 ++++++++++
 2 files changed, 136 insertions(+)

diff --git a/tools/perf/util/pmu.c b/tools/perf/util/pmu.c
index 45c557c85c5e..04bd5b1bc33f 100644
--- a/tools/perf/util/pmu.c
+++ b/tools/perf/util/pmu.c
@@ -3826,6 +3826,114 @@ static bool probe_format_pack(const struct perf_pmu *pmu, struct perf_event_attr
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
+	 * Architectures such as arm64 and RISC-V control user-space counter
+	 * reading for core PMUs with a sysctl rather than a sysfs rdpmc file.
+	 */
+	if (pmu->is_core && pmu->probed.rdpmc_sysfs < 0) {
+		int uval;
+
+		if (sysctl__read_int("kernel/perf_user_access", &uval) == 0) {
+			has_rdpmc_cap = true;
+			pmu->probed.rdpmc_sysfs = uval;
+		}
+	}
+
+	/*
+	 * On architectures such as arm64, user-space counter reading must be
+	 * explicitly requested via format/rdpmc (e.g. config1:1).
+	 */
+	if (perf_pmu__has_format(pmu, "rdpmc")) {
+		struct perf_event_attr r_attr = attr;
+
+		has_rdpmc_cap = true;
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
+					    end.val > start.val)
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
@@ -4380,6 +4488,9 @@ static void __perf_pmu__probe(struct perf_pmu *pmu, int pmu_cpu)
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
2.56.1.703.gf848ed807c-goog

