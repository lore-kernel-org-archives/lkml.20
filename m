Received: from canpmsgout11.his.huawei.com (canpmsgout11.his.huawei.com [113.46.200.226])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1457469821
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 08:24:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.226
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791793495; cv=none; b=CvMZHWNuJYXNy0n8ZalwOVMWVY0cf+UqbL/KOMBb0t/btBYSdQ/c24IaBmqP5s9Ex3c7LFi4lk4c/lcLR7vO32dHvvU4m7yJP+NKWAljFFQzWLSzhm2f3cDKDoJhEK3dK/Vjug5faddYVP25+03V+4DeUfLEiHU0widvGimydkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791793495; c=relaxed/simple;
	bh=A/IiT39SXwrWWnw/qoqVPCM1vOG+XGuQ8wUaRKoj7uk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=em7J57JwsQ+U4t7VusOjYGEmgO4mx9gIM7eqY8nQGuSty79FiLbwbD3DU08gZ3PAmS34kZ5j81sptI5nkm/TmnKBCP6n+G+ZYcFtSkk8Y9c0KSETFeijFP+0aWm8nVfi84awQqZXxrXSt7y8/Ft6FYQyM9+0noR4Ee11LFTedf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=MbzbHvb9; arc=none smtp.client-ip=113.46.200.226
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="MbzbHvb9"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=Vm159Fr15eKJFdLHrCI3qZOsx+8QFUgTAo9DQzy1GAY=;
	b=MbzbHvb98kaQfPoKTQsIXCHb/Ui6GxhJIKvtdMuM4ZqNbDaqbFVGMQIxgIFY70CHjellxKZEV
	VkhcnKW3hG+hGObSaF730TV2yWIkA9GqnJXLpgm/pTeEO5GqO1NKF6vON6W5h2uZrD+V2I74ytp
	yvyWFXJZOleAcbD+W9OWifY=
Received: from mail.maildlp.com (unknown [172.19.163.163])
	by canpmsgout11.his.huawei.com (SkyGuard) with ESMTPS id 4j39Dc66g5zKmVp;
	Mon, 12 Oct 2026 16:12:16 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 4D9424057A;
	Mon, 12 Oct 2026 16:24:37 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 12 Oct
 2026 16:24:36 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <tony.luck@intel.com>, <reinette.chatre@intel.com>, <Dave.Martin@arm.com>,
	<james.morse@arm.com>, <babu.moger@amd.com>, <tglx@kernel.org>,
	<mingo@redhat.com>, <bp@alien8.de>, <dave.hansen@linux.intel.com>,
	<hpa@zytor.com>, <ben.horgan@arm.com>, <fenghuay@nvidia.com>,
	<x86@kernel.org>, <linux-kernel@vger.kernel.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH v9 2/9] fs/resctrl: Add resctrl_arch_rmid_idx_match() helper
Date: Mon, 12 Oct 2026 16:23:30 +0800
Message-ID: <20261012082337.822258-3-ruanjinjie@huawei.com>
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

The current RMID allocator assumes that RMID and CLOSID are entirely
independent or follow a rigid 2D encoding. This prevents architectures
where an RMID is bound to a specific CLOSID from properly filtering
free RMIDs.

Introduce resctrl_arch_rmid_idx_match() to allow architectures to define
their own compatibility rules between a target CLOSID and an allocated
RMID's CLOSID.

No functional change.

Cc: Reinette Chatre <reinette.chatre@intel.com>
Cc: Dave Martin <Dave.Martin@arm.com>
Cc: James Morse <james.morse@arm.com>
Cc: Babu Moger <babu.moger@amd.com>
Cc: Thomas Gleixner <tglx@kernel.org>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: Borislav Petkov <bp@alien8.de>
Cc: Dave Hansen <dave.hansen@linux.intel.com>
Cc: "H. Peter Anvin" <hpa@zytor.com>
Cc: Ben Horgan <ben.horgan@arm.com>
Cc: Fenghua Yu <fenghuay@nvidia.com>
Suggested-by: James Morse <james.morse@arm.com>
Signed-off-by: Zeng Heng <zengheng4@huawei.com>
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 arch/x86/include/asm/resctrl.h |  6 ++++++
 drivers/resctrl/mpam_resctrl.c |  6 ++++++
 fs/resctrl/monitor.c           | 13 +++----------
 include/linux/arm_mpam.h       |  1 +
 4 files changed, 16 insertions(+), 10 deletions(-)

diff --git a/arch/x86/include/asm/resctrl.h b/arch/x86/include/asm/resctrl.h
index 8f6edcdcfd87..7bb297a0ab6e 100644
--- a/arch/x86/include/asm/resctrl.h
+++ b/arch/x86/include/asm/resctrl.h
@@ -181,6 +181,12 @@ static inline u32 resctrl_arch_rmid_idx_encode(u32 ignored, u32 rmid)
 	return rmid;
 }
 
+/* x86 RMIDs are independent; any RMID can be used with any CLOSID. */
+static inline bool resctrl_arch_rmid_idx_match(u32 closid, u32 rmid_closid)
+{
+	return true;
+}
+
 /* x86 can always read an rmid, nothing needs allocating */
 struct rdt_resource;
 static inline void *resctrl_arch_mon_ctx_alloc(struct rdt_resource *r,
diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
index 9d223057953a..385c745787f2 100644
--- a/drivers/resctrl/mpam_resctrl.c
+++ b/drivers/resctrl/mpam_resctrl.c
@@ -279,6 +279,12 @@ u32 resctrl_arch_rmid_idx_encode(u32 closid, u32 rmid)
 	return closid * (mpam_pmg_max + 1) + rmid;
 }
 
+/* Check if the RMID's associated closid matches the target CLOSID. */
+bool resctrl_arch_rmid_idx_match(u32 closid, u32 rmid_closid)
+{
+	return closid == rmid_closid;
+}
+
 void resctrl_arch_rmid_idx_decode(u32 idx, u32 *closid, u32 *rmid)
 {
 	*closid = idx / (mpam_pmg_max + 1);
diff --git a/fs/resctrl/monitor.c b/fs/resctrl/monitor.c
index 73413cb128ea..39908f67dea4 100644
--- a/fs/resctrl/monitor.c
+++ b/fs/resctrl/monitor.c
@@ -205,23 +205,16 @@ bool has_busy_rmid(struct rdt_l3_mon_domain *d)
 static struct rmid_entry *resctrl_find_free_rmid(u32 closid)
 {
 	struct rmid_entry *itr;
-	u32 itr_idx, cmp_idx;
 
 	if (list_empty(&rmid_free_lru))
 		return rmid_limbo_count ? ERR_PTR(-EBUSY) : ERR_PTR(-ENOSPC);
 
 	list_for_each_entry(itr, &rmid_free_lru, list) {
 		/*
-		 * Get the index of this free RMID, and the index it would need
-		 * to be if it were used with this CLOSID.
-		 * If the CLOSID is irrelevant on this architecture, the two
-		 * index values are always the same on every entry and thus the
-		 * very first entry will be returned.
+		 * Check if the free RMID matches the target CLOSID.
+		 * Architecture-specific rules apply.
 		 */
-		itr_idx = resctrl_arch_rmid_idx_encode(itr->closid, itr->rmid);
-		cmp_idx = resctrl_arch_rmid_idx_encode(closid, itr->rmid);
-
-		if (itr_idx == cmp_idx)
+		if (resctrl_arch_rmid_idx_match(closid, itr->closid))
 			return itr;
 	}
 
diff --git a/include/linux/arm_mpam.h b/include/linux/arm_mpam.h
index f92a36187a52..0bc8049a3733 100644
--- a/include/linux/arm_mpam.h
+++ b/include/linux/arm_mpam.h
@@ -60,6 +60,7 @@ void resctrl_arch_sched_in(struct task_struct *tsk);
 bool resctrl_arch_match_closid(struct task_struct *tsk, u32 closid);
 bool resctrl_arch_match_rmid(struct task_struct *tsk, u32 closid, u32 rmid);
 u32 resctrl_arch_rmid_idx_encode(u32 closid, u32 rmid);
+bool resctrl_arch_rmid_idx_match(u32 closid, u32 rmid_closid);
 void resctrl_arch_rmid_idx_decode(u32 idx, u32 *closid, u32 *rmid);
 u32 resctrl_arch_system_num_rmid_idx(void);
 
-- 
2.34.1

