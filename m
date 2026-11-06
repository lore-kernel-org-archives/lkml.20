Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.223
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793953185;
	b=327upb8N40K6AgYAhISSZJ4K9d+/GyULi0u/wkSPrXgTDydcpaRvlYNXDw1IrkL7Z6W7
	 KyFsPbqrC94ideW6lxAdVEKlaCUB/nnVnQOvC7otcQklHkMA5IBMtBO6yYoS47/VRNozq
	 MxwS3srFHD1bG/PmWY0RSRIpxdrFH+igXyQSRlP4QxHC2qE+tvGfJf2A56XL4go9eaFHQ
	 oNgzbnxIOI8DlkN4i4gCUxfsJA+rEAB4iPoftiabUH/xnKhn4j3YKDiu7Vct0wh43ABZO
	 TIQxlY0WoJBZ5cihZOBX0Zy2DALTDg+3gRHfrm6w8tjx9j26EmgE0DmPnYrjdIUPQ2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793953185;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:From:To:CC:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=7Mbged9ohUTFh2gXoTA/NXT9Yb48UsIJy14kPrg0dDQ=;
	b=hdXtkmjZRAdWyVHL1l6807NmqjKNPYw7F5nBjBaKvDo5+6z/m9aX2rRoSB3EtDCQAgnj
	 otYtA52N4Yx4i5RSQ1Vq+6pww9ONy0TAn5n3qs5BKI69Ur1rMBB1gPUlRGjRDKYvwEbMr
	 FtM4CP0PAiBArVgeEN4wlSqkp2bmUsibTFN2dsYyhk1Xd3Hjmu+oP7Ggr+M+zjF6m33nF
	 TRVg3TKsZ4plbVA/y/8gJTvvmEP40/ZfIUVymUqfA9vE5AJD7ph1VMhCX3JLGfE7yhAN5
	 HFyjAfGLV3HdMGzEVBWKFx2B3NIX0/TcFaKwj2FItn53cZJuUAWQG1RfcBBBkwBf2Xg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=GhqrO+LQ;
	arc=none smtp.remote-ip=113.46.200.223
Received: from canpmsgout08.his.huawei.com (canpmsgout08.his.huawei.com [113.46.200.223])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82AE7606A326
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 08:19:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 82AE7606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=GhqrO+LQ
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=7Mbged9ohUTFh2gXoTA/NXT9Yb48UsIJy14kPrg0dDQ=;
	b=GhqrO+LQDITq5vbIGhEXVd9Ohnmlosd9tUiulCU4qU2Do3FHNTQ7PPHM1KYQ92H/aJMM6B7Nc
	7XtUwK1O/8xCOhEe8ab3KXFkCYAAuzGl5KNYEEzTXE7egpJpGKyqYSo/pKI4j0B11vW8Xyu5ILl
	n2bE6R8mff0SxXZLweK3PzU=
Received: from mail.maildlp.com (unknown [172.19.163.127])
	by canpmsgout08.his.huawei.com (SkyGuard) with ESMTPS id 4jLXCM64kgzmV8X;
	Fri,  6 Nov 2026 16:19:27 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id C214B40561;
	Fri,  6 Nov 2026 16:19:39 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 6 Nov
 2026 16:19:39 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <james.morse@arm.com>, <ben.horgan@arm.com>, <reinette.chatre@intel.com>,
	<fenghuay@nvidia.com>, <gshan@redhat.com>, <jic23@kernel.org>,
	<zengheng4@huawei.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH v3] arm_mpam: resctrl: Limit num_rmids to the CLOSIDs in use
Date: Fri, 6 Nov 2026 16:19:23 +0800
Message-ID: <20261106081923.2333070-1-ruanjinjie@huawei.com>
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
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
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

Work out the number of CLOSIDs with the rules resctrl applies when it
is mounted: schemata_list_add() halves a resource's CLOSID count
while CDP is enabled on it, rounding down, closid_init() takes the
smallest across the resources, and a monitor-only system has only the
default CLOSID. Report (pmg_max + 1) RMIDs for each of those CLOSIDs,
counting at monitor initialisation and from
resctrl_arch_set_cdp_enabled(), which resctrl calls whenever a mount
or unmount enables or disables CDP.

Fixes: 264c285999fc ("arm_mpam: resctrl: Add monitor initialisation and domain boilerplate")
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: <stable@vger.kernel.org> # 7.1.x
Cc: James Morse <james.morse@arm.com>
Cc: Ben Horgan <ben.horgan@arm.com>
Cc: Reinette Chatre <reinette.chatre@intel.com>
Cc: Fenghua Yu <fenghuay@nvidia.com>
---
v3:
- Drop resctrl_arch_set_mon_rmid_count() and count the CLOSIDs in the
  MPAM driver instead, as Ben suggested.
- v2: https://lore.kernel.org/all/20261105123304.2281987-1-ruanjinjie@huawei.com/
v2:
- Also fix num_rmids on monitor-only systems, as Ben suggested.
- Retitle from "arm_mpam: Round the CDP RMID count down to whole CLOSIDs".
- v1: https://lore.kernel.org/all/20261104101622.563280-1-ruanjinjie@huawei.com/
---
 drivers/resctrl/mpam_resctrl.c | 45 +++++++++++++++++++++++-----------
 1 file changed, 31 insertions(+), 14 deletions(-)

diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
index 5468367776e2..6859849f299b 100644
--- a/drivers/resctrl/mpam_resctrl.c
+++ b/drivers/resctrl/mpam_resctrl.c
@@ -191,6 +191,34 @@ static void mpam_resctrl_monitor_sync_abmc_vals(struct rdt_resource *l3)
 	 */
 }
 
+/* The RMID count follows the CLOSIDs resctrl uses. */
+static void mpam_resctrl_set_num_rmid(void)
+{
+	struct mpam_resctrl_res *res = &mpam_resctrl_controls[RDT_RESOURCE_L3];
+	struct rdt_resource *l3 = &res->resctrl_res;
+	enum resctrl_res_level rid;
+	u32 num_closid = UINT_MAX;
+
+	for_each_mpam_resctrl_control(res, rid) {
+		u32 res_num_closid;
+
+		if (!res->resctrl_res.alloc_capable)
+			continue;
+
+		res_num_closid = mpam_partid_max + 1;
+		if (res->cdp_enabled)
+			res_num_closid /= 2;
+
+		num_closid = min(num_closid, res_num_closid);
+	}
+
+	/* Monitor-only systems have only the default CLOSID. */
+	if (num_closid == UINT_MAX)
+		num_closid = 1;
+
+	l3->mon.num_rmid = (mpam_pmg_max + 1) * num_closid;
+}
+
 int resctrl_arch_set_cdp_enabled(enum resctrl_res_level rid, bool enable)
 {
 	u32 partid_i = RESCTRL_RESERVED_CLOSID, partid_d = RESCTRL_RESERVED_CLOSID;
@@ -217,11 +245,6 @@ int resctrl_arch_set_cdp_enabled(enum resctrl_res_level rid, bool enable)
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
@@ -238,6 +261,8 @@ int resctrl_arch_set_cdp_enabled(enum resctrl_res_level rid, bool enable)
 	if (!cdp_enabled && mpam_resctrl_controls[RDT_RESOURCE_MBA].class)
 		mpam_resctrl_controls[RDT_RESOURCE_MBA].resctrl_res.alloc_capable = true;
 
+	mpam_resctrl_set_num_rmid();
+
 	if (enable) {
 		if (mpam_partid_max < 1)
 			return -EINVAL;
@@ -1344,15 +1369,7 @@ static int mpam_resctrl_monitor_init(struct mpam_resctrl_mon *mon,
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

