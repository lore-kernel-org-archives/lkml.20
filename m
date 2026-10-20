Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.219
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792503799;
	b=nwqfk4E+Ouh2yZFFXGXB26CkevTG47GIopTyBVKOclcS3T/Aoxk9mCclRdYfQc+1zZxO
	 ss6vn/jx03UEhc2hi9cczYFSgQULMK7c+HmjZj+7/7/z0qe7VCn8kn+Bg+mG++p5s9aqh
	 GaN58Krb8T/xsWkuutE6wZJMykYwatpr5ne0Nq0mE6xSKqlra2PocFG3HQ+E3ZE/FMvla
	 vB7prptbGXtR5FNgz1Q1LbWqlBPDOLZCtw9S0jDI0Ak8cVn14Vm5sjbkZ1haZYACS4Tr0
	 dGJ5jY/ocKR5LwNQshl4Wza1b0fbyOxYYh7OII2hLDxnhZPQU7yggHsDLYaZWY+QjxA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792503799;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:From:To:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=odyqyzVMbrzTKYRZ9jw+lMszzq9Ci+4Dgl40G2QKZ4g=;
	b=w84foT9oc8CaZ41VJd3OlyoMpZvt3s75H7YdE84frskMf6UOwqt1p7dSU5Gha6KFu9c6
	 HmIi6EV8n+xg0NjGwkpxt94X/RXyoUtRnZGrh3jRCQ03cenYruuRvBuLc+IgU4GQ6yOl8
	 W/RiAgNsoWLbr4mGMj7/vXLoEGbNHzRjBQH0WFvgVkZ3AwK22xCW4eve+Eh4+jkMPlW2n
	 nmJ4kSQHUISBrcaL/Yy8hEooXU9iEt9jYOo2PnEWSxRSMNWiYioVjLsdw16umFctgQQVe
	 jw8KPrjToVyrcK8Ke+xY3LuDjl9c52qobSFmIVQeSa2MJ8bgk/muunDNLC5OkmGlSPg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=sV3Uo3Ko;
	arc=none smtp.remote-ip=113.46.200.219
Received: from canpmsgout04.his.huawei.com (canpmsgout04.his.huawei.com [113.46.200.219])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DB1F606A320
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 13:43:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3DB1F606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=sV3Uo3Ko
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=odyqyzVMbrzTKYRZ9jw+lMszzq9Ci+4Dgl40G2QKZ4g=;
	b=sV3Uo3Ko9ZQttkghzBtbsAEf2/Wh7G+zDqY2BnZ7vLilyF7lmmEisIUq9I/2iRDplOxHkxCds
	HhEyj2Qza9eu1fKmByKARRH8GBmgO0Ygt7zJSWdQAQttGkc59ReQbyIB/gpOI1q2qtGDPW5jDma
	pnWB8v9diq5zEU8VRlIKfOQ=
Received: from mail.maildlp.com (unknown [172.19.163.104])
	by canpmsgout04.his.huawei.com (SkyGuard) with ESMTPS id 4j8DBl6lnrz1prKf;
	Tue, 20 Oct 2026 21:43:11 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 5F8284057F;
	Tue, 20 Oct 2026 21:43:15 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 20 Oct
 2026 21:43:14 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <tony.luck@intel.com>, <reinette.chatre@intel.com>, <Dave.Martin@arm.com>,
	<james.morse@arm.com>, <babu.moger@amd.com>, <tglx@kernel.org>,
	<mingo@redhat.com>, <bp@alien8.de>, <dave.hansen@linux.intel.com>,
	<hpa@zytor.com>, <ben.horgan@arm.com>, <fenghuay@nvidia.com>,
	<ruanjinjie@huawei.com>, <tan.shaopeng@fujitsu.com>, <zengheng4@huawei.com>,
	<jic23@kernel.org>, <gshan@redhat.com>, <catalin.marinas@arm.com>,
	<x86@kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v10 RESEND 08/15] arm_mpam: resctrl: Add resctrl_closid_rmid_to_partid_pmg() helper
Date: Tue, 20 Oct 2026 21:42:32 +0800
Message-ID: <20261020134239.3921377-9-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261020134239.3921377-1-ruanjinjie@huawei.com>
References: <20261020134239.3921377-1-ruanjinjie@huawei.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
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
index ee15367e36eb..9bb1f1569601 100644
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
2.34.1

