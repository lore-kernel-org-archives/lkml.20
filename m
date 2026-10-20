Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.225
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792503802;
	b=b3l5A3NmQJIW9QiS1drvkSga/OY2Nlb4ZDCg1i022sLfowsOU8bzJc5KZbdmI20JJhMu
	 P5evhgY1a/MOCrwMeua6E7W7kvLCOoqR0Mni4uO0zurmCbiAQOlrW8lgSCa3ryvy7T3vU
	 1Mq/QzdPIXudEy30fN9UViNmwikt1ZnF0Dfc5AQmvIKPOuMUj1bafUxW7LJMSf3ndyVM1
	 alq5MXvHuqIGWcFhwKtnWFU7PF2bz6dHZ84nhrnPoUo+QCUiIe5wD+k0RBNkSvb+5wctg
	 zetkJnysaD8b3KOTdEdP1/9xiTVJibA7xRKjEgWmmUeVXVQahAmYCn8t4uCMlyYxUjA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792503802;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:From:To:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=kIGcrcfUN31lXOlYbfYAnq1dc8WBOrpSZqoMHZk1kEg=;
	b=FSIznLCl0eQGMe6AQ6GZ97qitRGay9k8mGW+p5KcC19P1PtAFMMkSKK8Dg+/o3BioZYE
	 BAQvCpEXZtgBt7WR86rgknpgeRsnHZwYBAZmLz2CMdXZHqwr3WBSjLbYG8HMSq5kofmwY
	 0noVLF2uvUnndQpXLKjon2w2eVIZKEEPBzl2ezg8Pm07yupXb5uOT6OHkyTk4OHC/TaWH
	 Jlo8g7zmKTVh8Wrv6QdpnVj57uIu60RdW9VyKQHsjmAbLGWIvhniuBbQEVKE3iS4sqPa1
	 ik9G1Iyue1KeHqf6yak4QEMb3ktyveNe4CWWj78wszAjwhRw1hjeCqyTGyUbxnGetyQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=hp5U3Uo4;
	arc=none smtp.remote-ip=113.46.200.225
Received: from canpmsgout10.his.huawei.com (canpmsgout10.his.huawei.com [113.46.200.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1C97606A321
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 13:43:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F1C97606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=hp5U3Uo4
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=kIGcrcfUN31lXOlYbfYAnq1dc8WBOrpSZqoMHZk1kEg=;
	b=hp5U3Uo4rNwo5Jux6K7JkXB5mpiP90/pFXI1EW2x7FWSXkUYtdrUm7RE1RcQHE0XuowVnYM68
	Ku4hrkY4uVXLC6bJxfXey006CrlQ2nyApAYpuOjfR0ga49zUNHVjtTPOKumdkJ06Fe2dboDKkir
	fGwSj5oVUk/plDv7ZNcFp40=
Received: from mail.maildlp.com (unknown [172.19.162.92])
	by canpmsgout10.his.huawei.com (SkyGuard) with ESMTPS id 4j8DBp2klpz1K98D;
	Tue, 20 Oct 2026 21:43:14 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id D56E04058A;
	Tue, 20 Oct 2026 21:43:17 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 20 Oct
 2026 21:43:17 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <tony.luck@intel.com>, <reinette.chatre@intel.com>, <Dave.Martin@arm.com>,
	<james.morse@arm.com>, <babu.moger@amd.com>, <tglx@kernel.org>,
	<mingo@redhat.com>, <bp@alien8.de>, <dave.hansen@linux.intel.com>,
	<hpa@zytor.com>, <ben.horgan@arm.com>, <fenghuay@nvidia.com>,
	<ruanjinjie@huawei.com>, <tan.shaopeng@fujitsu.com>, <zengheng4@huawei.com>,
	<jic23@kernel.org>, <gshan@redhat.com>, <catalin.marinas@arm.com>,
	<x86@kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v10 RESEND 12/15] arm_mpam: Map resctrl RMIDs onto the request PARTIDs
Date: Tue, 20 Oct 2026 21:42:36 +0800
Message-ID: <20261020134239.3921377-13-ruanjinjie@huawei.com>
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

From: Zeng Heng <zengheng4@huawei.com>

The current resctrl RMID allocation assumes a rigid 2D encoding, which
limits the total number of monitoring groups to the hardware CLOSID count.

To decouple control and monitoring, redefine resctrl_arch_rmid_idx_encode()
as a flat, global monitoring index. When extra request PARTIDs are active,
the task's hardware PARTID and PMG are derived directly from this global
RMID via modulo division. Otherwise, legacy 1:1 behavior is preserved.

CDP and PARTID narrowing can now coexist through a two-phase mapping:
when both features are active, extract reqPARTID from rmid first, then
apply CDP's even/odd split on that reqPARTID.

No functional change for now as resctrl_using_extra_partids
remains false.

Cc: James Morse <james.morse@arm.com>
Cc: Ben Horgan <ben.horgan@arm.com>
Cc: Reinette Chatre <reinette.chatre@intel.com>
Cc: Fenghua Yu <fenghuay@nvidia.com>
Suggested-by: James Morse <james.morse@arm.com>
Link: https://lore.kernel.org/all/2944b506-a462-42f8-95cf-404241fb27f0@arm.com/
Signed-off-by: Zeng Heng <zengheng4@huawei.com>
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 drivers/resctrl/mpam_resctrl.c | 76 ++++++++++++++++++++++++++++------
 1 file changed, 64 insertions(+), 12 deletions(-)

diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
index bfff965177fb..99b43ff2008f 100644
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
@@ -274,8 +277,28 @@ u32 resctrl_arch_system_num_rmid_idx(void)
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
 
@@ -287,8 +310,18 @@ bool resctrl_arch_rmid_idx_match(u32 closid, u32 rmid_closid)
 
 void resctrl_arch_rmid_idx_decode(u32 idx, u32 *closid, u32 *rmid)
 {
-	*closid = idx / (mpam_pmg_max + 1);
-	*rmid = idx % (mpam_pmg_max + 1);
+	if (resctrl_using_extra_partids) {
+		if (rmid)
+			*rmid = idx;
+		if (closid)
+			*closid = resctrl_partid_to_closid(resctrl_rmid_to_partid(idx));
+		return;
+	}
+
+	if (closid)
+		*closid = idx / (mpam_pmg_max + 1);
+	if (rmid)
+		*rmid = idx % (mpam_pmg_max + 1);
 }
 
 void resctrl_arch_sched_in(struct task_struct *tsk)
@@ -303,19 +336,35 @@ static void resctrl_closid_rmid_to_partid_pmg(u32 closid, u32 rmid,
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
+			pmg = resctrl_rmid_to_pmg(rmid);
+		} else {
+			partid = closid;
+			pmg = rmid;
+		}
+
+		*partid_d = *partid_i = partid;
+		*pmg_d = *pmg_i = pmg;
 	} else {
-		/*
-		 * When CDP is enabled, resctrl halves the closid range and we
-		 * use odd/even partid for one closid.
-		 */
-		*partid_d = resctrl_get_config_index(closid, CDP_DATA);
-		*partid_i = resctrl_get_config_index(closid, CDP_CODE);
-		*pmg_d = *pmg_i = rmid;
+		if (resctrl_using_extra_partids) {
+			u16 req_partid = resctrl_rmid_to_partid(rmid);
+			u8 pmg = resctrl_rmid_to_pmg(rmid);
+
+			*partid_d = resctrl_get_config_index(req_partid, CDP_DATA);
+			*partid_i = resctrl_get_config_index(req_partid, CDP_CODE);
+			*pmg_d = *pmg_i = pmg;
+		} else {
+			*partid_d = resctrl_get_config_index(closid, CDP_DATA);
+			*partid_i = resctrl_get_config_index(closid, CDP_CODE);
+			*pmg_d = *pmg_i = rmid;
+		}
 	}
 }
 
@@ -359,6 +408,9 @@ static bool resctrl_partid_in_closid(u16 partid, u32 closid)
 	if (cdp_enabled)
 		partid >>= 1;
 
+	if (resctrl_using_extra_partids)
+		partid = resctrl_partid_to_closid(partid);
+
 	return partid == closid;
 }
 
-- 
2.34.1

