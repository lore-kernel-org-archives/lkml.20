Received: from out162-62-57-210.mail.qq.com (out162-62-57-210.mail.qq.com [162.62.57.210])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5F9281ACD
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 07:35:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.57.210
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792395318; cv=none; b=CbC0qIGoiWly5KCEzaU2uFIt3aILhw2nR2hfG2jyAaz1642voKZjwN3G73PhUYkujRyoF1jTyQl+KWr2xWSkAzipUw9X3Io6n6krPil23e82WQ9A5UuWbEQd5TEMM6TUq/xmDLMXn29vUqFrSR5R1izxxWEGqNUwW/KOGtiKlEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792395318; c=relaxed/simple;
	bh=k8rsWH4W3/P5HcqYgwuhXsOkpdJ+9VP1uRCu9sK4nCY=;
	h=Message-ID:From:To:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=KEW71fsqubHdb8vK9LdAcIde6iYUa8WquB9g4LOckAXn1IKkYRuXMR/yEuVucvqpskS/LLLwBFA0+6zfLdcz/XGvCv8bv8CPNhReg4c3iYLpSzGuWw/XzjGiGLuGqZLONgg1k8JZLtvWIMOQ80wIc2fK/1cU55LBQB+qhwwWuK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=BewAScwH; arc=none smtp.client-ip=162.62.57.210
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="BewAScwH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1792395312; bh=B8fIzKZkghHTULbx39k23hIuHXVWlW2FqJmQdLWFtDY=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=BewAScwHK3N7h2VvKcCrlA9vhJsg2P295FfNGzp9xsfaow5yVa3wfyLhTz6OPHXoj
	 FAudNRdCuBFOC+65MAlYVVEj1AFCmGv+fSm1/K0UE086vrXBMWqH0ysTozIUaZJbWY
	 t35hLSNI2438cizXQnV8M+pOfl/XsBkXAsAQYpXg=
Received: from r00799764-ThinkCentre-M920t-N000.. ([139.159.170.67])
	by newxmesmtplogicsvrsza73-0.qq.com (NewEsmtp) with SMTP
	id 8B707E35; Mon, 19 Oct 2026 15:34:55 +0800
X-QQ-mid: xmsmtpt1792395309tiw2a5zh3
Message-ID: <tencent_254A11CF181EC3AC54A4614F402172DC0A0A@qq.com>
X-QQ-XMAILINFO: NZLtKcOEcMY+biG2tUsCvBYqehrPA88BCY1ZmVWLJp26xA1B57PZD3ooA0hQSV
	 kGPldn/QeS2wg8WHzx2SmzHIxkPkhWsl8ukfy3Jph8OO6TW1a7tadU3n1l28ICI47yJHvxnCQMdd
	 wTWOH4GAkO7MJWqkX/rYwahpRlRzoBlBqLK2gg6ToQyddFYGQzsjqQznn9A0bJQxgvTcuqCA8vRR
	 AuB+WpjCnJeEKgeF30SXrVPeKC8+1UWak7KGBzuxeSnsJsws0D+eRO3V/PU3czD0Pzsh24QfN58T
	 Iga/H7g5GK3xaJ5TIxDo5r/5y2VvzPb7WNe/yXMwW0qiIQA7k4d8V7h5JT+pbdcmTLIi+nELZw8N
	 kPJcj9az2Uc8w/Q8QeTh1XznC3qlFqz7a16RxzFy+tyoeAtKT10wWBk/dZ3KkSNNvRmwLl1tJ6Ar
	 YFtFtsuWHZ71gUwY1c7Tv21bcOd/4Z5RqjvZ5qnbFWn343k1aVMP6LRW0ONjK5iIScwfniQI1AuG
	 0sF/7pI8SNtrxqCQYg7cOaoUNGo0gT3hwTZPxah0WTgrDOst4PA/dufYvPbJC4q0ZSP5i7gGYYrZ
	 0cSExwHFwoY03IPhVe3fFpuYDMyfJgDcdO0NeWlsaPdKi9DCUxwv5kKR2eOLTxhsTl/RrLqGkvr2
	 jmTL/9BLPeb+KDp7yix0VCbCn3qRA13HkNxvIBWYbhpWP65Q5+UTGupoze2ZiEtSfX5xVkQrNMCW
	 N35cBjOkPypwrx+w/rzABTvovp0LNRzuv5CcBWZB79hRhEXPEMSZRQyhXjS509S1LWsXLbypU29h
	 Z6osYE+RcEcmedajAKwecMlkI8jxIGv4f8BQ2oZcwnhfc4lNKl4Wr7LxuaNFRmjfLW1fdP5gMZ9Z
	 4M0qk5mIAOtuZfsKyc81NX/jS6ApTv+Gw3DLhRfnJFDY3bOj16MO2CRZq0V/sM7/4B2Nvn8ry/cN
	 DDRRQ14DwrP2/CRsJ/HztHiyzROu0dQp67mvhbMlbHszePwk1WKzHkZBZYCnhBEoBfmedZ5ugl8n
	 V/pG4Q9c/7Du+2ASynTvmryam+77TgwC1sZIDLIbmHPtzG7xgdUXixPdWwipJBBkkkO8EEBQBAnT
	 Q0qkugCNBz7YYzg33WFE5w1uWq8dXWEWPXwUtN
X-QQ-XMRINFO: Nq+8W0+stu50tPAe92KXseR0ZZmBTk3gLg==
From: Jinjie Ruan <2118537295@qq.com>
To: babu.moger@amd.com,
	ben.horgan@arm.com,
	bp@alien8.de,
	catalin.marinas@arm.com,
	dave.hansen@linux.intel.com,
	Dave.Martin@arm.com,
	fenghuay@nvidia.com,
	gshan@redhat.com,
	hpa@zytor.com,
	james.morse@arm.com,
	jic23@kernel.org,
	mingo@redhat.com,
	reinette.chatre@intel.com,
	ruanjinjie@huawei.com,
	tan.shaopeng@fujitsu.com,
	tglx@kernel.org,
	tony.luck@intel.com,
	zengheng4@huawei.com,
	x86@kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v10 08/15] arm_mpam: resctrl: Add resctrl_closid_rmid_to_partid_pmg() helper
Date: Mon, 19 Oct 2026 15:33:34 +0800
X-OQ-MSGID: <20261019073453.2142856-9-2118537295@qq.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261019073453.2142856-1-2118537295@qq.com>
References: <20261019073453.2142856-1-2118537295@qq.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jinjie Ruan <ruanjinjie@huawei.com>

The translation from resctrl (CLOSID, RMID) to MPAM (PARTID, PMG)
is currently open-coded across multiple paths (CPU default settings,
task setters, matching logic, and monitor readers). This duplicates
the special-case logic for CDP handling in multiple places.

Consolidate this translation into a single helper. This not only
eliminates duplication but also provides a unified checkpoint to support
non-linear partitioning mappings (such as PARTID narrowing) in subsequent
patches.

No functional change.

Cc: James Morse <james.morse@arm.com>
Cc: Ben Horgan <ben.horgan@arm.com>
Cc: Reinette Chatre <reinette.chatre@intel.com>
Cc: Fenghua Yu <fenghuay@nvidia.com>
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 drivers/resctrl/mpam_resctrl.c | 64 ++++++++++++++++++++--------------
 1 file changed, 38 insertions(+), 26 deletions(-)

diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
index 5107f4811cb2..cf5db752aa35 100644
--- a/drivers/resctrl/mpam_resctrl.c
+++ b/drivers/resctrl/mpam_resctrl.c
@@ -298,25 +298,37 @@ void resctrl_arch_sched_in(struct task_struct *tsk)
 	mpam_thread_switch(tsk);
 }
 
-void resctrl_arch_set_cpu_default_closid_rmid(int cpu, u32 closid, u32 rmid)
+static void resctrl_closid_rmid_to_partid_pmg(u32 closid, u32 rmid,
+					      u32 *partid_d, u32 *partid_i,
+					      u8 *pmg_d, u8 *pmg_i)
 {
 	WARN_ON_ONCE(closid > U16_MAX);
 	WARN_ON_ONCE(rmid > U8_MAX);
 
 	if (!cdp_enabled) {
-		mpam_set_cpu_defaults(cpu, closid, closid, rmid, rmid);
+		*partid_d = *partid_i = closid;
+		*pmg_d = *pmg_i = rmid;
 	} else {
 		/*
 		 * When CDP is enabled, resctrl halves the closid range and we
 		 * use odd/even partid for one closid.
 		 */
-		u32 partid_d = resctrl_get_config_index(closid, CDP_DATA);
-		u32 partid_i = resctrl_get_config_index(closid, CDP_CODE);
-
-		mpam_set_cpu_defaults(cpu, partid_d, partid_i, rmid, rmid);
+		*partid_d = resctrl_get_config_index(closid, CDP_DATA);
+		*partid_i = resctrl_get_config_index(closid, CDP_CODE);
+		*pmg_d = *pmg_i = rmid;
 	}
 }
 
+void resctrl_arch_set_cpu_default_closid_rmid(int cpu, u32 closid, u32 rmid)
+{
+	u32 partid_d, partid_i;
+	u8 pmg_d, pmg_i;
+
+	resctrl_closid_rmid_to_partid_pmg(closid, rmid, &partid_d, &partid_i,
+					  &pmg_d, &pmg_i);
+	mpam_set_cpu_defaults(cpu, partid_d, partid_i, pmg_d, pmg_i);
+}
+
 void resctrl_arch_sync_cpu_closid_rmid(void *info)
 {
 	struct resctrl_cpu_defaults *r = info;
@@ -333,17 +345,12 @@ void resctrl_arch_sync_cpu_closid_rmid(void *info)
 
 void resctrl_arch_set_closid_rmid(struct task_struct *tsk, u32 closid, u32 rmid)
 {
-	WARN_ON_ONCE(closid > U16_MAX);
-	WARN_ON_ONCE(rmid > U8_MAX);
+	u32 partid_d, partid_i;
+	u8 pmg_d, pmg_i;
 
-	if (!cdp_enabled) {
-		mpam_set_task_partid_pmg(tsk, closid, closid, rmid, rmid);
-	} else {
-		u32 partid_d = resctrl_get_config_index(closid, CDP_DATA);
-		u32 partid_i = resctrl_get_config_index(closid, CDP_CODE);
-
-		mpam_set_task_partid_pmg(tsk, partid_d, partid_i, rmid, rmid);
-	}
+	resctrl_closid_rmid_to_partid_pmg(closid, rmid, &partid_d, &partid_i,
+					  &pmg_d, &pmg_i);
+	mpam_set_task_partid_pmg(tsk, partid_d, partid_i, pmg_d, pmg_i);
 }
 
 bool resctrl_arch_match_closid(struct task_struct *tsk, u32 closid)
@@ -361,13 +368,15 @@ bool resctrl_arch_match_closid(struct task_struct *tsk, u32 closid)
 bool resctrl_arch_match_rmid(struct task_struct *tsk, u32 closid, u32 rmid)
 {
 	u64 regval = mpam_get_regval(tsk);
-	u32 tsk_closid = FIELD_GET(MPAM0_EL1_PARTID_D, regval);
-	u32 tsk_rmid = FIELD_GET(MPAM0_EL1_PMG_D, regval);
+	u32 tsk_partid = FIELD_GET(MPAM0_EL1_PARTID_D, regval);
+	u32 tsk_pmg = FIELD_GET(MPAM0_EL1_PMG_D, regval);
+	u32 partid_d, partid_i;
+	u8 pmg_d, pmg_i;
 
-	if (cdp_enabled)
-		tsk_closid >>= 1;
+	resctrl_closid_rmid_to_partid_pmg(closid, rmid, &partid_d, &partid_i,
+					  &pmg_d, &pmg_i);
 
-	return (tsk_closid == closid) && (tsk_rmid == rmid);
+	return (tsk_partid == partid_d) && (tsk_pmg == pmg_d);
 }
 
 struct rdt_resource *resctrl_arch_get_resource(enum resctrl_res_level l)
@@ -461,16 +470,19 @@ static int __read_mon(struct mpam_resctrl_mon *mon, struct mpam_component *mon_c
 		      int mon_idx,
 		      enum resctrl_conf_type cdp_type, u32 closid, u32 rmid, u64 *val)
 {
+	u32 partid, partid_d, partid_i;
 	struct mon_cfg cfg;
+	u8 pmg_d, pmg_i;
 
 	if (!mpam_is_enabled())
 		return -EINVAL;
 
-	/* Shift closid to account for CDP */
-	closid = resctrl_get_config_index(closid, cdp_type);
+	resctrl_closid_rmid_to_partid_pmg(closid, rmid, &partid_d, &partid_i,
+					  &pmg_d, &pmg_i);
+	partid = (cdp_type == CDP_CODE) ? partid_i : partid_d;
 
 	if (mon_idx == USE_PRE_ALLOCATED) {
-		int mbwu_idx = resctrl_arch_rmid_idx_encode(closid, rmid);
+		int mbwu_idx = resctrl_arch_rmid_idx_encode(partid, rmid);
 
 		mon_idx = mon->mbwu_idx_to_mon[mbwu_idx];
 		if (mon_idx == -1)
@@ -485,8 +497,8 @@ static int __read_mon(struct mpam_resctrl_mon *mon, struct mpam_component *mon_c
 	cfg = (struct mon_cfg) {
 		.mon = mon_idx,
 		.match_pmg = true,
-		.partid = closid,
-		.pmg = rmid,
+		.partid = partid,
+		.pmg = pmg_d,
 	};
 
 	return mpam_msmon_read(mon_comp, &cfg, mon_type, val);
-- 
2.43.0

