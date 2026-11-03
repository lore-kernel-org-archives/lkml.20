Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.127.230.114
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793698655;
	b=k9xoRF3Rbiqc2bJdN8Q1fUltzUDbpXJYf8PJr+qzmH/29WBoUhmJ3s5QwRAjpzkJDvqZ
	 iywDfLZOrTqHZFPMr44KyaXtkyHWviH6ebdU6QZdiZmWksiRIVT0LoJoIkk+RwIYsDBBb
	 uDkevVSLkQg302OeCc91R0S8o6LPBnzI/mKkGoBsq9U43FeNqcMVQ5PwG/ut001lCcbbS
	 9D0B8P1p8RfPsgt3wI6TDxFVlsRerkgDQyoozsDlfnYmMMmJaIJtvB2qAlhgkW6P96xn6
	 T1HjMSHCZOm4VxI5AMIia1zRDrEpAJJ1FTN/mDA4A5E6LAWE7KDKX6K6ZvE8fHojomg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793698655;
	h=DMARC-Filter:DKIM-Signature:To:Content-Type:Cc:Subject:Mime-Version:
	 X-Mailer:Message-Id:X-Lms-Return-Path:From:Date:
	 Content-Transfer-Encoding:X-Original-From;
	bh=VpFa/p3WPsAPJNVImq25UDsp6730o2KqBmwn2DOgZiw=;
	b=DVY3j2NjKjcNaP8/KpOl4xt2Z0hYtn5fecY1Ejjt8w3+v9qHLX1cEHpAyLVaj/9RAO7N
	 dR9f+VrCCoJfg4ielw3b122NaJiXfjbihVEhn3YLZIAj7/gT1QMcLSKVqlHL0yP/0bhPw
	 HC0At8dojhm5TL7GI39Em2vF7S/k6WmOML+OEeFS4YEvI2c/OY5U9pnMVes7GCWHxHFo/
	 u49TYVF3M6432D43HJgvW6diOVFEVFVWAy3/ic6pHl8Txladdr2q0mv22dFERIFQFLgOr
	 ljqIPjp9FGitOLEB+wMgHXDI1YTZ2fo2b5nzYY9XWxhzt2YJWHBxm/frguyxc1FIBXQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=2212171451 header.b=VYOhPniH;
	arc=none smtp.remote-ip=209.127.230.114
Received: from va-1-114.ptr.blmpb.com (va-1-114.ptr.blmpb.com [209.127.230.114])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DF16606A329
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 09:37:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0DF16606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=2212171451 header.b=VYOhPniH
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1793698648; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=VpFa/p3WPsAPJNVImq25UDsp6730o2KqBmwn2DOgZiw=;
 b=VYOhPniH2BqwH0Ww+viK05MwFwxMn18QHW+UT96jszA7Z5AWSVxq9HsgAbLsOOz7PKxUGw
 p/z3Rs+5uXkWsm/qP9kHqYmUAnRoVZ0blvw1H5bruVOA5CkcYxtkBaN/fmoI7rUqn7Hysb
 ocOLUFfLVGXhuTt48aSLHxCRi5geAqGmGYRwxuzwvzGmEFKfmlPm4tKXOaEYtbDbC9y2Kf
 wdXwHrnNroh1BHoKPuP9x/eo/2Fs8CJzaKqO8aQh9N13oaxJtP0Yh0YKtdh2ORdFzMfpE5
 vl58jkLBU5l4t2han/1r5AnNDJ+cX42lfiivH60Uwu3TV6W4sd3moWPsh2WDBA==
To: <atish.patra@linux.dev>
Content-Type: text/plain; charset=UTF-8
Cc: <anup@brainfault.org>, <mark.rutland@arm.com>, <palmer@dabbelt.com>, 
	<linux-riscv@lists.infradead.org>, <linux-perf-users@vger.kernel.org>, 
	<linux-kernel@vger.kernel.org>, "Zhao Gongyi" <zhaogongyi@bytedance.com>
Subject: [PATCH] perf/riscv: Guard PMU counter indices and user access
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Message-Id: <20261103093709.81605-1-zhaogongyi@bytedance.com>
X-Lms-Return-Path: <lba+26ae9ab57+047c6c+vger.kernel.org+zhaogongyi@bytedance.com>
From: "Zhao Gongyi" <zhaogongyi@bytedance.com>
Date: Tue,  3 Nov 2026 17:37:09 +0800
Content-Transfer-Encoding: 7bit
X-Original-From: Zhao Gongyi <zhaogongyi@bytedance.com>

A disabled event may be mmaped before hw.idx is assigned; a userpage
update with that invalid index can make pmu_sbi_csr_index() access
pmu_ctr_list[] out of bounds.

Validate indices before publishing or using a CSR, and reject
out-of-range SBI results before accessing counter state. Keep mmap
authorization independent of assignment for disabled events.

Fixes: cc4c07c89aad ("drivers: perf: Implement perf event mmap support in the SBI backend")
Signed-off-by: Zhao Gongyi <zhaogongyi@bytedance.com>
---
Testing on Linux 7.4-rc1 (6628e7d4c6b2) with RISC-V QEMU/KASAN:
Without the patch, syzkaller hit a slab-out-of-bounds in
pmu_sbi_csr_index() after 42,054 programs. With the patch, the same
workload ran for 300 seconds (62,069 programs) without that KASAN report.

 drivers/perf/riscv_pmu.c        | 29 ++++++++++-----
 drivers/perf/riscv_pmu_legacy.c |  7 ++--
 drivers/perf/riscv_pmu_sbi.c    | 62 +++++++++++++++++++++++++--------
 include/linux/perf/riscv_pmu.h  |  7 +++-
 4 files changed, 79 insertions(+), 26 deletions(-)

diff --git a/drivers/perf/riscv_pmu.c b/drivers/perf/riscv_pmu.c
index 8e3cd0f35336f..adb64b3277e42 100644
--- a/drivers/perf/riscv_pmu.c
+++ b/drivers/perf/riscv_pmu.c
@@ -18,13 +18,17 @@
 
 #include <asm/sbi.h>
 
-static bool riscv_perf_user_access(struct perf_event *event)
+static bool riscv_perf_user_access(struct perf_event *event, int idx)
 {
+	struct riscv_pmu *rvpmu = to_riscv_pmu(event->pmu);
+
 	return ((event->attr.type == PERF_TYPE_HARDWARE) ||
 		(event->attr.type == PERF_TYPE_HW_CACHE) ||
 		(event->attr.type == PERF_TYPE_RAW)) &&
 		!!(event->hw.flags & PERF_EVENT_FLAG_USER_READ_CNT) &&
-		(event->hw.idx != -1);
+		riscv_pmu_ctr_idx_valid(idx) &&
+		rvpmu->csr_index &&
+		rvpmu->csr_index(event, idx) >= 0;
 }
 
 void arch_perf_update_userpage(struct perf_event *event,
@@ -32,12 +36,13 @@ void arch_perf_update_userpage(struct perf_event *event,
 {
 	struct clock_read_data *rd;
 	unsigned int seq;
+	int idx = READ_ONCE(event->hw.idx);
 	u64 ns;
 
 	userpg->cap_user_time = 0;
 	userpg->cap_user_time_zero = 0;
 	userpg->cap_user_time_short = 0;
-	userpg->cap_user_rdpmc = riscv_perf_user_access(event);
+	userpg->cap_user_rdpmc = riscv_perf_user_access(event, idx);
 
 	/*
 	 * The counters are 64-bit but the priv spec doesn't mandate all the
@@ -45,7 +50,7 @@ void arch_perf_update_userpage(struct perf_event *event,
 	 * the cpu vendor.
 	 */
 	if (userpg->cap_user_rdpmc)
-		userpg->pmc_width = to_riscv_pmu(event->pmu)->ctr_get_width(event->hw.idx) + 1;
+		userpg->pmc_width = to_riscv_pmu(event->pmu)->ctr_get_width(idx) + 1;
 
 	do {
 		rd = sched_clock_read_begin(&seq);
@@ -148,7 +153,7 @@ u64 riscv_pmu_ctr_get_width_mask(struct perf_event *event)
 	struct riscv_pmu *rvpmu = to_riscv_pmu(event->pmu);
 	struct hw_perf_event *hwc = &event->hw;
 
-	if (hwc->idx == -1)
+	if (!riscv_pmu_ctr_idx_valid(hwc->idx))
 		/* Handle init case where idx is not initialized yet */
 		cwidth = rvpmu->ctr_get_width(0);
 	else
@@ -264,6 +269,8 @@ static int riscv_pmu_add(struct perf_event *event, int flags)
 	idx = rvpmu->ctr_get_idx(event);
 	if (idx < 0)
 		return idx;
+	if (!riscv_pmu_ctr_idx_valid(idx))
+		return -ENOENT;
 
 	hwc->idx = idx;
 	cpuc->events[idx] = event;
@@ -353,12 +360,18 @@ static int riscv_pmu_event_init(struct perf_event *event)
 static int riscv_pmu_event_idx(struct perf_event *event)
 {
 	struct riscv_pmu *rvpmu = to_riscv_pmu(event->pmu);
+	int idx = READ_ONCE(event->hw.idx);
+	int csr_idx;
 
-	if (!(event->hw.flags & PERF_EVENT_FLAG_USER_READ_CNT))
+	if (!(event->hw.flags & PERF_EVENT_FLAG_USER_READ_CNT) ||
+	    !riscv_pmu_ctr_idx_valid(idx))
 		return 0;
 
-	if (rvpmu->csr_index)
-		return rvpmu->csr_index(event) + 1;
+	if (rvpmu->csr_index) {
+		csr_idx = rvpmu->csr_index(event, idx);
+		if (csr_idx >= 0)
+			return csr_idx + 1;
+	}
 
 	return 0;
 }
diff --git a/drivers/perf/riscv_pmu_legacy.c b/drivers/perf/riscv_pmu_legacy.c
index 1b8e4789cb3c1..7f778b1126d1e 100644
--- a/drivers/perf/riscv_pmu_legacy.c
+++ b/drivers/perf/riscv_pmu_legacy.c
@@ -76,9 +76,12 @@ static void pmu_legacy_ctr_start(struct perf_event *event, u64 ival)
 	local64_set(&hwc->prev_count, initial_val);
 }
 
-static uint8_t pmu_legacy_csr_index(struct perf_event *event)
+static int pmu_legacy_csr_index(struct perf_event *event, int idx)
 {
-	return event->hw.idx;
+	if (!riscv_pmu_ctr_idx_valid(idx))
+		return -ENOENT;
+
+	return idx;
 }
 
 static void pmu_legacy_event_mapped(struct perf_event *event, struct mm_struct *mm)
diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
index 21a2078eab98a..ac0d43746b799 100644
--- a/drivers/perf/riscv_pmu_sbi.c
+++ b/drivers/perf/riscv_pmu_sbi.c
@@ -434,6 +434,24 @@ static bool pmu_sbi_ctr_is_fw(int cidx)
 	return info->type == SBI_PMU_CTR_TYPE_FW;
 }
 
+static int pmu_sbi_ctr_hw_csr_index(int idx)
+{
+	union sbi_pmu_ctr_info *info;
+
+	if (!riscv_pmu_ctr_idx_valid(idx) || !test_bit(idx, cmask))
+		return -ENOENT;
+
+	info = &pmu_ctr_list[idx];
+	if (info->type != SBI_PMU_CTR_TYPE_HW)
+		return -ENOENT;
+
+	if (info->csr != CSR_CYCLE && info->csr != CSR_INSTRET &&
+	    (info->csr < CSR_HPMCOUNTER3 || info->csr > CSR_HPMCOUNTER31))
+		return -ENOENT;
+
+	return info->csr - CSR_CYCLE;
+}
+
 int riscv_pmu_get_event_info(u32 type, u64 config, u64 *econfig)
 {
 	int ret = -ENOENT;
@@ -530,9 +548,9 @@ int riscv_pmu_get_hpm_info(u32 *hw_ctr_width, u32 *num_hw_ctr)
 }
 EXPORT_SYMBOL_GPL(riscv_pmu_get_hpm_info);
 
-static uint8_t pmu_sbi_csr_index(struct perf_event *event)
+static int pmu_sbi_csr_index(struct perf_event *event, int idx)
 {
-	return pmu_ctr_list[event->hw.idx].csr - CSR_CYCLE;
+	return pmu_sbi_ctr_hw_csr_index(idx);
 }
 
 static unsigned long pmu_sbi_get_filter_flags(struct perf_event *event)
@@ -605,6 +623,9 @@ static int pmu_sbi_ctr_get_idx(struct perf_event *event)
 		return sbi_err_map_linux_errno(ret.error);
 	}
 
+	if (ret.value < 0 || ret.value >= RISCV_MAX_COUNTERS)
+		return -ENOENT;
+
 	idx = ret.value;
 	if (!test_bit(idx, rvpmu->cmask) || !pmu_ctr_list[idx].value)
 		return -ENOENT;
@@ -810,19 +831,25 @@ static u64 pmu_sbi_ctr_read(struct perf_event *event)
 static void pmu_sbi_set_scounteren(void *arg)
 {
 	struct perf_event *event = (struct perf_event *)arg;
+	int idx = READ_ONCE(event->hw.idx);
+	int csr_idx;
 
-	if (event->hw.idx != -1)
+	csr_idx = pmu_sbi_ctr_hw_csr_index(idx);
+	if (csr_idx >= 0)
 		csr_write(CSR_SCOUNTEREN,
-			  csr_read(CSR_SCOUNTEREN) | BIT(pmu_sbi_csr_index(event)));
+			  csr_read(CSR_SCOUNTEREN) | BIT(csr_idx));
 }
 
 static void pmu_sbi_reset_scounteren(void *arg)
 {
 	struct perf_event *event = (struct perf_event *)arg;
+	int idx = READ_ONCE(event->hw.idx);
+	int csr_idx;
 
-	if (event->hw.idx != -1)
+	csr_idx = pmu_sbi_ctr_hw_csr_index(idx);
+	if (csr_idx >= 0)
 		csr_write(CSR_SCOUNTEREN,
-			  csr_read(CSR_SCOUNTEREN) & ~BIT(pmu_sbi_csr_index(event)));
+			  csr_read(CSR_SCOUNTEREN) & ~BIT(csr_idx));
 }
 
 static void pmu_sbi_ctr_start(struct perf_event *event, u64 ival)
@@ -890,10 +917,18 @@ static int pmu_sbi_find_num_ctrs(void)
 	struct sbiret ret;
 
 	ret = sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_NUM_COUNTERS);
-	if (!ret.error)
-		return ret.value;
-	else
+	if (ret.error)
 		return sbi_err_map_linux_errno(ret.error);
+
+	if (ret.value < 0)
+		return -EINVAL;
+	if (ret.value > RISCV_MAX_COUNTERS) {
+		pr_info("SBI returned too many counters, limiting to %d\n",
+			RISCV_MAX_COUNTERS);
+		return RISCV_MAX_COUNTERS;
+	}
+
+	return ret.value;
 }
 
 static int pmu_sbi_get_ctrinfo(int nctr, unsigned long *mask)
@@ -902,6 +937,9 @@ static int pmu_sbi_get_ctrinfo(int nctr, unsigned long *mask)
 	int i, num_hw_ctr = 0, num_fw_ctr = 0;
 	union sbi_pmu_ctr_info cinfo;
 
+	if (nctr < 0 || nctr > RISCV_MAX_COUNTERS)
+		return -EINVAL;
+
 	pmu_ctr_list = kzalloc_objs(*pmu_ctr_list, nctr);
 	if (!pmu_ctr_list)
 		return -ENOMEM;
@@ -1485,12 +1523,6 @@ static int pmu_sbi_device_probe(struct platform_device *pdev)
 		goto out_free;
 	}
 
-	/* It is possible to get from SBI more than max number of counters */
-	if (num_counters > RISCV_MAX_COUNTERS) {
-		num_counters = RISCV_MAX_COUNTERS;
-		pr_info("SBI returned more than maximum number of counters. Limiting the number of counters to %d\n", num_counters);
-	}
-
 	/* cache all the information about counters now */
 	if (pmu_sbi_get_ctrinfo(num_counters, cmask))
 		goto out_free;
diff --git a/include/linux/perf/riscv_pmu.h b/include/linux/perf/riscv_pmu.h
index ecaa40370830a..219e3a85950d7 100644
--- a/include/linux/perf/riscv_pmu.h
+++ b/include/linux/perf/riscv_pmu.h
@@ -28,6 +28,11 @@
 
 #define RISCV_PMU_CONFIG1_GUEST_EVENTS 0x1
 
+static inline bool riscv_pmu_ctr_idx_valid(int idx)
+{
+	return idx >= 0 && idx < RISCV_MAX_COUNTERS;
+}
+
 struct cpu_hw_events {
 	/* currently enabled events */
 	int			n_events;
@@ -66,7 +71,7 @@ struct riscv_pmu {
 	void		(*event_init)(struct perf_event *event);
 	void		(*event_mapped)(struct perf_event *event, struct mm_struct *mm);
 	void		(*event_unmapped)(struct perf_event *event, struct mm_struct *mm);
-	uint8_t		(*csr_index)(struct perf_event *event);
+	int		(*csr_index)(struct perf_event *event, int idx);
 
 	struct cpu_hw_events	__percpu *hw_events;
 	struct hlist_node	node;

base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.39.5 (Apple Git-154)
