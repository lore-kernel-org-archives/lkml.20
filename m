Received: from canpmsgout12.his.huawei.com (canpmsgout12.his.huawei.com [113.46.200.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56611455634
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 08:24:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.227
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791793490; cv=none; b=ZtYEn8o78cSIAqXmVzfgv+pYyuoWMsyBgddZcLgK+YoPoRUKq1g2lRgC1VIbzSZZ0i7k/lnml28+cGXj2ohbNZHHf2i4e2kAqbi8CQGSgQ617gK2Mo76mbCRgc56IaPSQTNa2IKvnyoc7Ip/3DJbGeE4T8A5mNk29gEjSgWqSII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791793490; c=relaxed/simple;
	bh=0IoRX5vvVGmGy+kbG5SfT87cMVJWg4IUfqHYlOSP36w=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rGPQ7GnhuJ3+Y9q+7YHHhcOH0WTkP2ZnVPKl4y2Ryqiz/2t9Oam6Wy2NEHEMj3+WNgTvbOVH9bK0LOWz/mMobcpu1TSm4uLhaGVuGMOUabcsdlyP7IPd6hhTlfaR9SULJdUhInEfnluit9j2T5we9gtAqZVOvF3Pa1Wn6x/cpdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=ayvxiOcD; arc=none smtp.client-ip=113.46.200.227
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="ayvxiOcD"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=iPg8Ne23HxyBDKOiMU1ZzUu5FrgNpxluafEz4gAAG5w=;
	b=ayvxiOcDofGqveBDb9YnrJu56GuLHT67vjPSkVhiZbyDY+ajOa7QDmxbwTRn+B2W3GKZTQlhX
	D0FHP5ANTawA9jhHnoXZLQQaIY9WsUfisdU9UDg8swvUi7yFPLUe+9ETxOcFlJpvtAUSfcPnJzO
	3Kp3A5UabdyBpbTDKYA6Q7g=
Received: from mail.maildlp.com (unknown [172.19.163.214])
	by canpmsgout12.his.huawei.com (SkyGuard) with ESMTPS id 4j39FB2qpjznTc3;
	Mon, 12 Oct 2026 16:12:46 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id CE58E4056C;
	Mon, 12 Oct 2026 16:24:39 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 12 Oct
 2026 16:24:39 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <tony.luck@intel.com>, <reinette.chatre@intel.com>, <Dave.Martin@arm.com>,
	<james.morse@arm.com>, <babu.moger@amd.com>, <tglx@kernel.org>,
	<mingo@redhat.com>, <bp@alien8.de>, <dave.hansen@linux.intel.com>,
	<hpa@zytor.com>, <ben.horgan@arm.com>, <fenghuay@nvidia.com>,
	<x86@kernel.org>, <linux-kernel@vger.kernel.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH v9 7/9] arm_mpam: Map resctrl RMIDs onto the request PARTIDs
Date: Mon, 12 Oct 2026 16:23:35 +0800
Message-ID: <20261012082337.822258-8-ruanjinjie@huawei.com>
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

From: Zeng Heng <zengheng4@huawei.com>

The current resctrl RMID allocation assumes a rigid 2D encoding, which
limits the total number of monitoring groups to the hardware CLOSID count.

To decouple control and monitoring, redefine resctrl_arch_rmid_idx_encode()
as a flat, global monitoring index. When extra request PARTIDs are active,
the task's hardware PARTID and PMG are derived directly from this global
RMID via modulo division. Otherwise, legacy 1:1 behavior is preserved.

CDP halves the CLOSID range and uses two PARTIDs per control group,
which conflicts with the grouping, so it is refused while the extra
PARTIDs are in use.

No functional change for now as resctrl_using_extra_partids
remains false.

Cc: James Morse <james.morse@arm.com>
Cc: Ben Horgan <ben.horgan@arm.com>
Cc: Reinette Chatre <reinette.chatre@intel.com>
Cc: Fenghua Yu <fenghuay@nvidia.com>
Suggested-by: James Morse <james.morse@arm.com>
Signed-off-by: Zeng Heng <zengheng4@huawei.com>
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 drivers/resctrl/mpam_resctrl.c | 63 +++++++++++++++++++++++++++++++---
 1 file changed, 59 insertions(+), 4 deletions(-)

diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
index 0edededdf7a5..8479fdd7f713 100644
--- a/drivers/resctrl/mpam_resctrl.c
+++ b/drivers/resctrl/mpam_resctrl.c
@@ -62,6 +62,9 @@ static DEFINE_MUTEX(domain_list_lock);
  */
 static bool cdp_enabled;
 
+/* If resctrl is leveraging extra request PARTIDs for monitoring. */
+static bool resctrl_using_extra_partids;
+
 /*
  * We use cacheinfo to discover the size of the caches and their id. cacheinfo
  * populates this from a device_initcall(). mpam_resctrl_setup() must wait.
@@ -205,6 +208,16 @@ int resctrl_arch_set_cdp_enabled(enum resctrl_res_level rid, bool enable)
 	if (enable)
 		pr_warn("CDP is an expert feature and may cause MPAM to malfunction.\n");
 
+	/*
+	 * CDP halves the CLOSID range and uses two PARTIDs per control group.
+	 * That conflicts with the PARTID grouping used to provide the extra
+	 * monitoring groups.
+	 */
+	if (enable && resctrl_using_extra_partids) {
+		pr_warn("CDP is not supported with PARTID narrowing\n");
+		return -EOPNOTSUPP;
+	}
+
 	/*
 	 * resctrl_arch_set_cdp_enabled() is only called with enable set to
 	 * false on error and unmount.
@@ -274,8 +287,28 @@ u32 resctrl_arch_system_num_rmid_idx(void)
 	return (mpam_pmg_max + 1) * (mpam_partid_max + 1);
 }
 
+/* The request PARTID and PMG a resctrl RMID maps onto. */
+static u16 resctrl_rmid_to_partid(u32 rmid)
+{
+	return rmid / (mpam_pmg_max + 1);
+}
+
+static u8 resctrl_rmid_to_pmg(u32 rmid)
+{
+	return rmid % (mpam_pmg_max + 1);
+}
+
+/* The control group that owns a request PARTID. */
+static u16 resctrl_partid_to_closid(u16 partid)
+{
+	return mpam_partid_to_intpartid(partid);
+}
+
 u32 resctrl_arch_rmid_idx_encode(u32 closid, u32 rmid)
 {
+	if (resctrl_using_extra_partids)
+		return rmid;
+
 	return closid * (mpam_pmg_max + 1) + rmid;
 }
 
@@ -287,6 +320,14 @@ bool resctrl_arch_rmid_idx_match(u32 closid, u32 rmid_closid)
 
 void resctrl_arch_rmid_idx_decode(u32 idx, u32 *closid, u32 *rmid)
 {
+	if (resctrl_using_extra_partids) {
+		if (rmid)
+			*rmid = idx;
+		if (closid)
+			*closid = resctrl_partid_to_closid(resctrl_rmid_to_partid(idx));
+		return;
+	}
+
 	*closid = idx / (mpam_pmg_max + 1);
 	*rmid = idx % (mpam_pmg_max + 1);
 }
@@ -303,11 +344,23 @@ static void resctrl_closid_rmid_to_partid_pmg(u32 closid, u32 rmid,
 					      u8 *pmg_d, u8 *pmg_i)
 {
 	WARN_ON_ONCE(closid > U16_MAX);
-	WARN_ON_ONCE(rmid > U8_MAX);
+	WARN_ON_ONCE(!resctrl_using_extra_partids && rmid > U8_MAX);
 
 	if (!cdp_enabled) {
-		*partid_d = *partid_i = closid;
-		*pmg_d = *pmg_i = rmid;
+		u16 partid;
+		u8 pmg;
+
+		if (resctrl_using_extra_partids) {
+			partid = resctrl_rmid_to_partid(rmid);
+			WARN_ON_ONCE(partid > U16_MAX);
+			pmg = resctrl_rmid_to_pmg(rmid);
+		} else {
+			partid = closid;
+			pmg = rmid;
+		}
+
+		*partid_d = *partid_i = partid;
+		*pmg_d = *pmg_i = pmg;
 	} else {
 		/*
 		 * When CDP is enabled, resctrl halves the closid range and we
@@ -356,7 +409,9 @@ void resctrl_arch_set_closid_rmid(struct task_struct *tsk, u32 closid, u32 rmid)
 /* Does the request PARTID belong to this control group? */
 static bool resctrl_partid_in_closid(u16 partid, u32 closid)
 {
-	if (cdp_enabled)
+	if (resctrl_using_extra_partids)
+		partid = resctrl_partid_to_closid(partid);
+	else if (cdp_enabled)
 		partid >>= 1;
 
 	return partid == closid;
-- 
2.34.1

