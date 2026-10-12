Received: from canpmsgout08.his.huawei.com (canpmsgout08.his.huawei.com [113.46.200.223])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 384EB4582E8
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 08:24:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.223
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791793491; cv=none; b=Kuw7/3pVc6zqABggJ37+FILcTdLQVm+SQVX15Q+UHt0Xm/kkThNZSdFxUeyXMFE5h2v6YMml/UjUDrET5vzFojOj3iNforLcVab2F2ApfzeSr6Zx9HNGiCVKgNZL9c4vfzgYzo3F6+zYn/GXV7n/H0xYknhdUPZro/euG9ogtMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791793491; c=relaxed/simple;
	bh=hOsZlnyjoe84UVCW4dVyP2AVjWPo41rAX3Snzhzlx5Q=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=d6y/C+E5kHoPvFnx/H7Yk390zF+J4csuuzTek6nACGQeescHjHiJeV7IGYwyRg9rSvRr+T1AkOgH6HnBbhhYtDovREOo3GaLDN4rW8JTAl0cddN+Y37Jm0qhvAQYvs90nClQW8oKGUGA/DHlbQ5qojPx7GmnftbcoPL3PgXB6go=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=47S7L16H; arc=none smtp.client-ip=113.46.200.223
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="47S7L16H"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=seBOciTHAX+XSFIELMIk3jq/NIuEKRW90rIA3dfUtaw=;
	b=47S7L16HnhdkXCDj63rRVtLWyAHSMwvhZ1C1ljf7cYCYeNVu47yvKcrld3LO1081AHK4e9SGh
	tpgARgzU5KZNNbXFe4395CaTCSJp84z0JEvQ5Gc7L/THxfOzfC97SVxe8MbXps8pEZvpkykMN6U
	zGPriAgITEL6CGLlTuwOOdc=
Received: from mail.maildlp.com (unknown [172.19.163.127])
	by canpmsgout08.his.huawei.com (SkyGuard) with ESMTPS id 4j39Dj3jfvzmV8H;
	Mon, 12 Oct 2026 16:12:21 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id C4F5440561;
	Mon, 12 Oct 2026 16:24:37 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 12 Oct
 2026 16:24:37 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <tony.luck@intel.com>, <reinette.chatre@intel.com>, <Dave.Martin@arm.com>,
	<james.morse@arm.com>, <babu.moger@amd.com>, <tglx@kernel.org>,
	<mingo@redhat.com>, <bp@alien8.de>, <dave.hansen@linux.intel.com>,
	<hpa@zytor.com>, <ben.horgan@arm.com>, <fenghuay@nvidia.com>,
	<x86@kernel.org>, <linux-kernel@vger.kernel.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH v9 3/9] arm_mpam: resctrl: Add resctrl_closid_rmid_to_partid_pmg() helper
Date: Mon, 12 Oct 2026 16:23:31 +0800
Message-ID: <20261012082337.822258-4-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261012082337.822258-1-ruanjinjie@huawei.com>
References: <20261012082337.822258-1-ruanjinjie@huawei.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
 kwepemk200008.china.huawei.com (7.202.194.74)

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
index 385c745787f2..dbafa2a7586d 100644
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
@@ -454,16 +463,19 @@ static int __read_mon(struct mpam_resctrl_mon *mon, struct mpam_component *mon_c
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
@@ -478,8 +490,8 @@ static int __read_mon(struct mpam_resctrl_mon *mon, struct mpam_component *mon_c
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
2.34.1

