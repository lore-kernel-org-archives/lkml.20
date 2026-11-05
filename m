Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.217
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793882015;
	b=pNjWVsVzHqhXqGGDTf0R0qiGIXh2eaAJMeIrhDK9gOCLQlCSwejaRN8Xlz6cunhMX9lV
	 cU1WPMyhNHo0icBCGFMByEnxGCZvn8eRinmMeO9g4RJV1/VNmZTpRxBQYLD+Aci0sYwTj
	 y0lxvPfbYsWDC5u1PHazEKiFAP1e4Uixkg1LCLPJ+Ne6X7Q5lpUIRSXruGXHBXEeWXt9t
	 /yPjCovX6p42VfFGI2v1chmwYVt7SBsWm4Na1+kdFBPMuTBdpXwz1jay0ORDA7snphfCG
	 J3SQeSJCRbs7zokBaTJm4lyDzBEhpEU8lokywue4Quh70dHuBhll92gOKxM/P5tha4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793882015;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:From:To:CC:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=CZZk5peVELEiv1KLNro17/tyxEUJ1iTiONLFotbu+D4=;
	b=s9ikRf07tTPvT0fkwSciMyabmZujWygSr/7AWGP0fUD9miwgbqIxwFMYRyktCjModbwT
	 7ylnVp4kf/RrlenSCzLUcmFcOCGjeOXn5wQ1lhf/n9JXxpaybNzxggXJVPRS6FO92F0ib
	 DUt6mB3vmrKHCa1an9xgansWU6CqqTq3ziUY7bdN/jqnBCfHJVIFgo2WDZEj8RBbYmpVo
	 mFeElhx7dBjaFV0GpqDt7p/mA0lUXxFHr1q07zXXlRRkzSye/S2eWUVg/+fZGNjhMJ5bn
	 70gSWkZs5ZusuJwtEPzhXH7VALOuVYOGR3L4apkQ6LxVDAj9CGEXUxXX4h90hLEO4hQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=mB2QKLvz;
	arc=none smtp.remote-ip=113.46.200.217
Received: from canpmsgout02.his.huawei.com (canpmsgout02.his.huawei.com [113.46.200.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73F90606A32C
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 12:33:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 73F90606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=mB2QKLvz
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=CZZk5peVELEiv1KLNro17/tyxEUJ1iTiONLFotbu+D4=;
	b=mB2QKLvzScDjGR87tR5UoUyH/4dnyp47Acq2S6e0+k1DRbO4mCHX7P1ZuSQ8gTA6OzIsxjN8I
	EvhK4pATX47f7ysAI8kJnS0yBtLWOXrqb4NyBrqvT+Aw68NIQxE/2FNd74s0kGNwOKSeenSWrmk
	aQwL/SLieLdTn+MVZDWJ3bQ=
Received: from mail.maildlp.com (unknown [172.19.162.223])
	by canpmsgout02.his.huawei.com (SkyGuard) with ESMTPS id 4jL1tJ3q8QzcZy5;
	Thu,  5 Nov 2026 20:32:56 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 5754840575;
	Thu,  5 Nov 2026 20:33:25 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 5 Nov
 2026 20:33:24 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <tony.luck@intel.com>, <reinette.chatre@intel.com>, <Dave.Martin@arm.com>,
	<james.morse@arm.com>, <babu.moger@amd.com>, <tglx@kernel.org>,
	<mingo@redhat.com>, <bp@alien8.de>, <dave.hansen@linux.intel.com>,
	<hpa@zytor.com>, <ben.horgan@arm.com>, <fenghuay@nvidia.com>,
	<jic23@kernel.org>, <zengheng4@huawei.com>, <gshan@redhat.com>,
	<x86@kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH v2] arm_mpam: resctrl: Limit num_rmids to the CLOSIDs in use
Date: Thu, 5 Nov 2026 20:33:04 +0800
Message-ID: <20261105123304.2281987-1-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
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
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 kwepemk200008.china.huawei.com (7.202.194.74)

On MPAM an RMID is a PMG within a PARTID, so resctrl can only allocate
the PMGs of the CLOSIDs it uses. info/L3_MON/num_rmids is instead set
to the whole PARTID and PMG space when the monitors are initialised,
and halved when CDP is enabled. It reports more RMIDs than resctrl can
allocate in two cases:

- With CDP each CLOSID takes two PARTIDs, and resctrl halves the
  CLOSID count rounding down, while MPAM halves the whole RMID space.
  With 5 PARTIDs and 2 PMGs resctrl has 2 CLOSIDs and 4 RMIDs, but
  num_rmids reads 5. The count is too high whenever the number of
  PARTIDs is odd and there is more than one PMG.

- On a monitor-only system there are no control groups and resctrl
  only uses the default CLOSID, but num_rmids still covers every
  PARTID. With 5 PARTIDs and 2 PMGs it reads 10 while only 2 RMIDs
  can be allocated.

RMID allocation is limited to the CLOSIDs in use, so only the value
reported to userspace is too high. Creating as many monitor groups as
num_rmids allows fails with -ENOSPC before that number is reached.

Let resctrl tell the architecture how many CLOSIDs it uses on every
mount. Add resctrl_arch_set_mon_rmid_count(), called after closid_init()
and before the info files are created, and have MPAM report
(pmg_max + 1) RMIDs for each CLOSID. The CLOSID count already accounts
for CDP, as schemata_list_add() halves it when CDP is enabled, so drop
the halving in resctrl_arch_set_cdp_enabled(). A monitor-only system
passes 1 for the default CLOSID. On x86 the RMIDs do not depend on the
CLOSIDs and the hook does nothing.

Fixes: 264c285999fc ("arm_mpam: resctrl: Add monitor initialisation and domain boilerplate")
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: <stable@vger.kernel.org> # 7.1.x
Cc: James Morse <james.morse@arm.com>
Cc: Ben Horgan <ben.horgan@arm.com>
Cc: Reinette Chatre <reinette.chatre@intel.com>
Cc: Fenghua Yu <fenghuay@nvidia.com>
---
v2:
- Use the "arm_mpam: resctrl:" prefix.
- Also fix num_rmids on monitor-only systems, as Ben suggested: add
  resctrl_arch_set_mon_rmid_count() so resctrl reports the number of
  CLOSIDs it uses, and remove the CDP-only rounding.
- Retitle from "arm_mpam: Round the CDP RMID count down to whole CLOSIDs".
- v1: https://lore.kernel.org/all/20261104101622.563280-1-ruanjinjie@huawei.com/
---
 arch/x86/include/asm/resctrl.h |  3 +++
 drivers/resctrl/mpam_resctrl.c | 18 ++++++++++++------
 fs/resctrl/rdtgroup.c          |  2 ++
 include/linux/resctrl.h        |  1 +
 4 files changed, 18 insertions(+), 6 deletions(-)

diff --git a/arch/x86/include/asm/resctrl.h b/arch/x86/include/asm/resctrl.h
index 8f6edcdcfd87..50165027b92d 100644
--- a/arch/x86/include/asm/resctrl.h
+++ b/arch/x86/include/asm/resctrl.h
@@ -164,6 +164,9 @@ static inline bool resctrl_arch_match_rmid(struct task_struct *tsk, u32 ignored,
 	return READ_ONCE(tsk->rmid) == rmid;
 }
 
+/* RMIDs are independent of CLOSIDs on x86. */
+static inline void resctrl_arch_set_mon_rmid_count(u32 num_closid) { }
+
 static inline void resctrl_arch_sched_in(struct task_struct *tsk)
 {
 	if (static_branch_likely(&rdt_enable_key))
diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
index 5468367776e2..cca9568bab70 100644
--- a/drivers/resctrl/mpam_resctrl.c
+++ b/drivers/resctrl/mpam_resctrl.c
@@ -217,11 +217,6 @@ int resctrl_arch_set_cdp_enabled(enum resctrl_res_level rid, bool enable)
 	cdp_enabled = enable;
 	mpam_resctrl_controls[rid].cdp_enabled = enable;
 
-	if (enable)
-		l3->mon.num_rmid = resctrl_arch_system_num_rmid_idx() / 2;
-	else
-		l3->mon.num_rmid = resctrl_arch_system_num_rmid_idx();
-
 	/* The mbw_max feature can't hide cdp as it's a per-partid maximum. */
 	if (cdp_enabled && !mpam_resctrl_controls[RDT_RESOURCE_MBA].cdp_enabled)
 		mpam_resctrl_controls[RDT_RESOURCE_MBA].resctrl_res.alloc_capable = false;
@@ -279,6 +274,16 @@ u32 resctrl_arch_system_num_rmid_idx(void)
 	return (mpam_pmg_max + 1) * (mpam_partid_max + 1);
 }
 
+void resctrl_arch_set_mon_rmid_count(u32 num_closid)
+{
+	struct rdt_resource *l3 = &mpam_resctrl_controls[RDT_RESOURCE_L3].resctrl_res;
+
+	if (!l3->mon_capable)
+		return;
+
+	l3->mon.num_rmid = (mpam_pmg_max + 1) * num_closid;
+}
+
 u32 resctrl_arch_rmid_idx_encode(u32 closid, u32 rmid)
 {
 	return closid * (mpam_pmg_max + 1) + rmid;
@@ -1350,7 +1355,8 @@ static int mpam_resctrl_monitor_init(struct mpam_resctrl_mon *mon,
 	 * each control group. Hence, advertise the whole rmid_idx space even
 	 * though each control group has its own pmg/rmid space. Unfortunately,
 	 * this does mean userspace needs to know the architecture to correctly
-	 * interpret this value.
+	 * interpret this value. resctrl_arch_set_mon_rmid_count() replaces it
+	 * with the RMIDs of the CLOSIDs in use when resctrl is mounted.
 	 */
 	l3->mon.num_rmid = resctrl_arch_system_num_rmid_idx();
 
diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
index 106e78fb1f1d..2335dd7054ca 100644
--- a/fs/resctrl/rdtgroup.c
+++ b/fs/resctrl/rdtgroup.c
@@ -3214,6 +3214,8 @@ static int rdt_get_tree(struct fs_context *fc)
 	if (ret)
 		goto out_schemata_free;
 
+	resctrl_arch_set_mon_rmid_count(closids_supported() ?: 1);
+
 	if (resctrl_arch_mon_capable())
 		flags |= RFTYPE_MON;
 
diff --git a/include/linux/resctrl.h b/include/linux/resctrl.h
index 10dfdca7f4bf..4a78f2e60bdf 100644
--- a/include/linux/resctrl.h
+++ b/include/linux/resctrl.h
@@ -417,6 +417,7 @@ static inline u32 resctrl_get_default_ctrl(struct rdt_resource *r)
 /* The number of closid supported by this resource regardless of CDP */
 u32 resctrl_arch_get_num_closid(struct rdt_resource *r);
 u32 resctrl_arch_system_num_rmid_idx(void);
+void resctrl_arch_set_mon_rmid_count(u32 num_closid);
 int resctrl_arch_update_domains(struct rdt_resource *r, u32 closid);
 
 bool resctrl_enable_mon_event(enum resctrl_event_id eventid, bool any_cpu,
-- 
2.34.1

