Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.219
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792658941;
	b=A2olPPXvZhznR50EHPWQuoP2Rz1Megqt7jqIBC9jqO4FVxBRVdzQAzWVXzScwz6BVFii
	 7XkQ/MLmXBwqmAo0/UW1YLzaGnyrGqLX9ntGJf0stNIht/48s4F4ogeObVfK10ghXPrf6
	 4aXL4pBTDiGv2s3wDhMXg0srzsc0b+KNctrpadvQt2UcfR9Tfw0TMYNyAq+11GIv3XlpY
	 KgnGo0qjg3vGqBrL9fgC5qxj84OAAihTNNq2pY0IU2qIUDuV9j6QHT8QhvsnYxHl4pSd8
	 axk7IoIu4P1y+mxFqg1xl8zfKHItiCloG/fpnjEm+e1sOErVe5y86eWW/idV8sEwhIw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792658941;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:From:To:CC:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=2xhlA15/kW6lF5trHWVvtWzB0dpopSaBBhwpuou0/QA=;
	b=QW5uLHwHCo+qNTr6BkrOB90qflcE7atyNQvPkdaAYFZz3arTGHJgIZCdX1C0A9a3cgRY
	 rc6vyrwGbhTtk//DDePL5m5nwBIseTb4rwco83aQUa99nhaDv8rFIn1BAUmUqngvlVIXJ
	 H119fG4U5LIcdxU/R/pItSOqZFeNejvMe5zaNNyKUcjBQV9SM1nwoWsDfVc+bHnA5b0Pg
	 GWhNgJe5goeo31nx6HCosINlPO7u9FBpOMlVk8cAUzcta7xEsFB+wwGwNnEqxG7+4xPHw
	 ZzB4EF3n7vRZaYHDX5i8QSXuJr0YI5KZoaMz35HydavjOWNhHch/KdZLn4BrZtKcRFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=aeBybq9h;
	arc=none smtp.remote-ip=113.46.200.219
Received: from canpmsgout04.his.huawei.com (canpmsgout04.his.huawei.com [113.46.200.219])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA2BB60A2615;
	Thu, 22 Oct 2026 08:49:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BA2BB60A2615
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=aeBybq9h
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=2xhlA15/kW6lF5trHWVvtWzB0dpopSaBBhwpuou0/QA=;
	b=aeBybq9hVveqoDNm5akNMdv5GsnPBY0IiqzKR+WdCFzOaqzImjfh/vtbwtwboOA23uQ0UE9qV
	assD7oh9Y4Ij0GBmWouP8zfGuwnuLKA973+hxLCfcluBlxRIZ98EqQq+p+9o9OPd4VG8/Xr9Rrg
	PrbzAKjCAaZioqBq6bOr42o=
Received: from mail.maildlp.com (unknown [172.19.162.140])
	by canpmsgout04.his.huawei.com (SkyGuard) with ESMTPS id 4j9KZ815K4z1prjX;
	Thu, 22 Oct 2026 16:48:48 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id A4596203C1;
	Thu, 22 Oct 2026 16:48:52 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 22 Oct
 2026 16:48:51 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <catalin.marinas@arm.com>, <will@kernel.org>, <mark.rutland@arm.com>,
	<corbet@lwn.net>, <skhan@linuxfoundation.org>, <rdunlap@infradead.org>,
	<james.morse@arm.com>, <ben.horgan@arm.com>, <reinette.chatre@intel.com>,
	<fenghuay@nvidia.com>, <tony.luck@intel.com>, <Dave.Martin@arm.com>,
	<babu.moger@amd.com>, <x86@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
CC: <ruanjinjie@huawei.com>
Subject: [RFC PATCH 7/7] arm_mpam: resctrl: Add the L2 monitor read paths
Date: Thu, 22 Oct 2026 16:48:21 +0800
Message-ID: <20261022084821.4014873-8-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261022084821.4014873-1-ruanjinjie@huawei.com>
References: <20261022084821.4014873-1-ruanjinjie@huawei.com>
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
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
 kwepemk200008.china.huawei.com (7.202.194.74)

Wire the L2 events through the borrowed-monitor paths:
l2c_occupancy borrows a CSU monitor like the L3 occupancy event, while
mbm_core_bytes borrows a bandwidth monitor. The L2 bandwidth event is
outside resctrl's L3 MBM event range, so the assignable-counter
machinery never applies to it; with CDP, borrow one monitor per partid
so code and data both accumulate.

Accept both events in resctrl_arch_rmid_read() and skip them in the
assignable-counter paths.

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 drivers/resctrl/mpam_resctrl.c | 62 +++++++++++++++++++++++++++++++---
 1 file changed, 58 insertions(+), 4 deletions(-)

diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
index 293122c0d0d9..3aa7ea996511 100644
--- a/drivers/resctrl/mpam_resctrl.c
+++ b/drivers/resctrl/mpam_resctrl.c
@@ -412,6 +412,7 @@ static int resctrl_arch_mon_ctx_alloc_no_wait(enum resctrl_event_id evtid,
 
 	switch (evtid) {
 	case QOS_L3_OCCUP_EVENT_ID:
+	case QOS_L2_OCCUP_EVENT_ID:
 		/* With CDP, one monitor gets used for both code/data reads */
 		mon_ctx[MON_CTX_DATA] = mpam_alloc_csu_mon(mon->class);
 		mon_ctx[MON_CTX_CODE] = mon_ctx[MON_CTX_DATA];
@@ -422,6 +423,31 @@ static int resctrl_arch_mon_ctx_alloc_no_wait(enum resctrl_event_id evtid,
 		mon_ctx[MON_CTX_DATA] = USE_PRE_ALLOCATED;
 		mon_ctx[MON_CTX_CODE] = USE_PRE_ALLOCATED;
 		return USE_PRE_ALLOCATED;
+	case QOS_L2_MBM_CORE_EVENT_ID:
+		/*
+		 * The L2 event is not part of resctrl's L3 MBM event range,
+		 * so the assignable-counter machinery never applies: borrow a
+		 * bandwidth monitor for the duration of the read, like the
+		 * occupancy events do with CSU monitors. With CDP, borrow one
+		 * monitor per partid so code and data both accumulate.
+		 */
+		mon_ctx[MON_CTX_DATA] = mpam_alloc_mbwu_mon(mon->class);
+		if (mon_ctx[MON_CTX_DATA] < 0)
+			return mon_ctx[MON_CTX_DATA];
+
+		if (!cdp_enabled) {
+			mon_ctx[MON_CTX_CODE] = mon_ctx[MON_CTX_DATA];
+			return mon_ctx[MON_CTX_DATA];
+		}
+
+		mon_ctx[MON_CTX_CODE] = mpam_alloc_mbwu_mon(mon->class);
+		if (mon_ctx[MON_CTX_CODE] < 0) {
+			int err = mon_ctx[MON_CTX_CODE];
+
+			mpam_free_mbwu_mon(mon->class, mon_ctx[MON_CTX_DATA]);
+			return err;
+		}
+		return mon_ctx[MON_CTX_DATA];
 	default:
 		return -EOPNOTSUPP;
 	}
@@ -460,8 +486,24 @@ static void resctrl_arch_mon_ctx_free_no_wait(enum resctrl_event_id evtid,
 	if (!mon->class)
 		return;
 
-	if (evtid == QOS_L3_OCCUP_EVENT_ID)
+	switch (evtid) {
+	case QOS_L3_OCCUP_EVENT_ID:
+	case QOS_L2_OCCUP_EVENT_ID:
+		/* With CDP, one monitor is used for both code/data reads */
 		mpam_free_csu_mon(mon->class, mon_ctx[MON_CTX_DATA]);
+		break;
+	case QOS_L3_MBM_LOCAL_EVENT_ID:
+	case QOS_L3_MBM_TOTAL_EVENT_ID:
+		/* Served by the pre-assigned ABMC counters */
+		break;
+	case QOS_L2_MBM_CORE_EVENT_ID:
+		mpam_free_mbwu_mon(mon->class, mon_ctx[MON_CTX_DATA]);
+		if (mon_ctx[MON_CTX_CODE] != mon_ctx[MON_CTX_DATA])
+			mpam_free_mbwu_mon(mon->class, mon_ctx[MON_CTX_CODE]);
+		break;
+	default:
+		break;
+	}
 
 	wake_up(&resctrl_mon_ctx_waiters);
 }
@@ -557,10 +599,22 @@ int resctrl_arch_rmid_read(struct rdt_resource *r, struct rdt_domain_hdr *hdr,
 	l3_dom = container_of(hdr, struct mpam_resctrl_dom, resctrl_mon_dom.hdr);
 	mon_comp = l3_dom->mon_comp[eventid];
 
-	if (eventid != QOS_L3_OCCUP_EVENT_ID)
+	switch (eventid) {
+	case QOS_L3_OCCUP_EVENT_ID:
+	case QOS_L2_OCCUP_EVENT_ID:
+		mon_type = mpam_feat_msmon_csu;
+		break;
+	case QOS_L2_MBM_CORE_EVENT_ID:
+		/*
+		 * Served by a bandwidth monitor borrowed for the read via
+		 * resctrl_arch_mon_ctx_alloc(); the L3 MBWU events use the
+		 * ABMC resctrl_arch_cntr_read() path instead.
+		 */
+		mon_type = mpam_feat_msmon_mbwu;
+		break;
+	default:
 		return -EINVAL;
-
-	mon_type = mpam_feat_msmon_csu;
+	}
 
 	return read_mon_cdp_safe(mon, mon_comp, mon_type, arch_mon_ctx,
 				 closid, rmid, val);
-- 
2.43.0

