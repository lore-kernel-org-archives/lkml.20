Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.222
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794384816;
	b=08cpbeZ7DdozWjF1NqRYvG36gnFi4hwguP0DjtA4E1E1S121+rEhSUgrwV7+zthksXyN
	 N+CuXOO99B50Z+J5G2H/Jp4r7QzAmoSeMid2m5Pollja4MG92TtNjlM/unGT4CuLIiLA9
	 uAfpw90fTppgZI538/562DAN17RzdmP30MeGJC9tzOFLpcNkmp5qBxCXqtK6Jr8O4TF1Z
	 T1/U45Aud8/myuTeJY346T68pvuejexoJEdZv5DelsA7sZsDBxyrWZq3E4GYG0V55J7VE
	 wpdC2rYgE+vguHGFnlL+TkStC0VuUX0xOZY7EgerjsTXoWrk4abbLVWfMihPRGanfXg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794384816;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:From:To:CC:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=v86dxVgUxzIUK/FnZ5rEtwglLpcRFF0Ojqo0iOwkpRI=;
	b=bdfaGh5N51HiUmnxJQzvOt+V+FVeyvrwjjM/rdFpgJW+GljWFMehjMYMkcZCo1N0dbRf
	 ZXP/zvrHTssSITb3tpSPtOeJN6F3ri1UkeDzMtYaK+6mNqXRAiga2lUR3XLptRWJno8sV
	 7EX8lGoCjORn/JNkuvkv/dxgHCEGaa4oK0leIa4berFsBI1YRpBRbV2FMv9GhHYMs4PSy
	 omU7cysAfcPc07v3/y6FJStPnynXUb8LS20FQh/Cw+pjkc2HwtrIqkAVYKZNobc1F6yDn
	 kl4TRy5r2sBMGUciAbLx645CZbDDt8AvHF8CJjQ2wdJfGfb82p1WSt9lIdJKEeo0Nyw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=O6HJbKrE;
	arc=none smtp.remote-ip=113.46.200.222
Received: from canpmsgout07.his.huawei.com (canpmsgout07.his.huawei.com [113.46.200.222])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 647F160A262D
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 08:13:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 647F160A262D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=O6HJbKrE
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=v86dxVgUxzIUK/FnZ5rEtwglLpcRFF0Ojqo0iOwkpRI=;
	b=O6HJbKrEJy7OFGqIBJV31ZUvs0Oy+ibOS7DroBLYWRbX83QYYLlSvytWDV4e9/df5T/v3p36T
	lWbnUbWBRRLBe41vNmKAGZ4aawNQqUBYqX7EOJ9TSkfXrKbaMfaNf9XxH+wUeP+dowk5CxpqfQN
	l1NML1l/BuWv5HH6NKQUPME=
Received: from mail.maildlp.com (unknown [172.19.163.200])
	by canpmsgout07.his.huawei.com (SkyGuard) with ESMTPS id 4jPbqw37GbzLlVY;
	Wed, 11 Nov 2026 16:13:16 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 998764055B;
	Wed, 11 Nov 2026 16:13:31 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 11 Nov
 2026 16:13:30 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <james.morse@arm.com>, <ben.horgan@arm.com>, <reinette.chatre@intel.com>,
	<fenghuay@nvidia.com>, <zengheng4@huawei.com>, <gshan@redhat.com>,
	<tan.shaopeng@jp.fujitsu.com>, <jic23@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH v4 3/3] arm_mpam: resctrl: Limit num_rmids to the CLOSIDs in use
Date: Wed, 11 Nov 2026 16:13:16 +0800
Message-ID: <20261111081316.3828283-4-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261111081316.3828283-1-ruanjinjie@huawei.com>
References: <20261111081316.3828283-1-ruanjinjie@huawei.com>
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
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
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

Count the CLOSIDs resctrl uses instead: every resource has
mpam_partid_max + 1 CLOSIDs, halved and rounded down while CDP is
enabled, and a system with no resource that can allocate uses only the
default CLOSID. Report (pmg_max + 1) RMIDs for each of those CLOSIDs.
Count at monitor initialisation and from resctrl_arch_set_cdp_enabled(),
which resctrl calls whenever a mount or unmount enables or disables
CDP.

Fixes: 264c285999fc ("arm_mpam: resctrl: Add monitor initialisation and domain boilerplate")
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: <stable@vger.kernel.org> # 7.1+
Cc: James Morse <james.morse@arm.com>
Cc: Ben Horgan <ben.horgan@arm.com>
Cc: Reinette Chatre <reinette.chatre@intel.com>
Cc: Fenghua Yu <fenghuay@nvidia.com>
---
v4:
- Simplify the fix with mpam_partid_max, cdp_enabled
  and resctrl_arch_alloc_capable() as Ben suggested.
v3:
- Drop resctrl_arch_set_mon_rmid_count() and count the CLOSIDs in the
  MPAM driver instead, as Ben suggested.
- v2: https://lore.kernel.org/all/20261105123304.2281987-1-ruanjinjie@huawei.com/
v2:
- Also fix num_rmids on monitor-only systems, as Ben suggested.
- Retitle from "arm_mpam: Round the CDP RMID count down to whole CLOSIDs".
- v1: https://lore.kernel.org/all/20261104101622.563280-1-ruanjinjie@huawei.com/
---
 drivers/resctrl/mpam_resctrl.c | 30 +++++++++++++++++-------------
 1 file changed, 17 insertions(+), 13 deletions(-)

diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
index afa3c084c475..fcd41ddffc74 100644
--- a/drivers/resctrl/mpam_resctrl.c
+++ b/drivers/resctrl/mpam_resctrl.c
@@ -200,6 +200,21 @@ static void mpam_resctrl_monitor_sync_abmc_vals(struct rdt_resource *l3)
 	 */
 }
 
+/* The RMID count follows the CLOSIDs resctrl uses. */
+static void mpam_resctrl_set_num_rmid(void)
+{
+	struct rdt_resource *l3 = &mpam_resctrl_controls[RDT_RESOURCE_L3].resctrl_res;
+	u32 num_closid = 1;
+
+	if (resctrl_arch_alloc_capable()) {
+		num_closid = mpam_partid_max + 1;
+		if (cdp_enabled)
+			num_closid /= 2;
+	}
+
+	l3->mon.num_rmid = (mpam_pmg_max + 1) * num_closid;
+}
+
 int resctrl_arch_set_cdp_enabled(enum resctrl_res_level rid, bool enable)
 {
 	u32 partid_i = RESCTRL_RESERVED_CLOSID, partid_d = RESCTRL_RESERVED_CLOSID;
@@ -233,10 +248,7 @@ int resctrl_arch_set_cdp_enabled(enum resctrl_res_level rid, bool enable)
 	cdp_enabled = enable;
 	mpam_resctrl_controls[rid].cdp_enabled = enable;
 
-	if (enable)
-		l3->mon.num_rmid = resctrl_arch_system_num_rmid_idx() / 2;
-	else
-		l3->mon.num_rmid = resctrl_arch_system_num_rmid_idx();
+	mpam_resctrl_set_num_rmid();
 
 	/* The mbw_max feature can't hide cdp as it's a per-partid maximum. */
 	if (cdp_enabled && !mpam_resctrl_controls[RDT_RESOURCE_MBA].cdp_enabled)
@@ -1357,15 +1369,7 @@ static int mpam_resctrl_monitor_init(struct mpam_resctrl_mon *mon,
 	l3->name = "L3";
 	l3->mon_scope = RESCTRL_L3_CACHE;
 
-	/*
-	 * num-rmid is the upper bound for the number of monitoring groups that
-	 * can exist simultaneously, including the default monitoring group for
-	 * each control group. Hence, advertise the whole rmid_idx space even
-	 * though each control group has its own pmg/rmid space. Unfortunately,
-	 * this does mean userspace needs to know the architecture to correctly
-	 * interpret this value.
-	 */
-	l3->mon.num_rmid = resctrl_arch_system_num_rmid_idx();
+	mpam_resctrl_set_num_rmid();
 
 	if (type == QOS_L3_MBM_TOTAL_EVENT_ID) {
 		int err;
-- 
2.34.1

