Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.226
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794833987;
	b=V2YjxAd41s+RdW38hMPvSd5/dTuN16Kint6pcMsN66eLK1syJg7QWOapi+R0/Arx2heF
	 hfaVRTP1eaYKCOteM/8fJ4HrfdwooaHjVblHaaA4XkZow6iCL9RG6nsj0HqXNDf04FvLW
	 3VcF0EATMXY8N3GFwI9YaXYwktyt3fN9Sgtqi5mOoHuWg5XsWPdkJC9lyAFhhQ22kKzKN
	 /uq1Mn7ivsmT8/MHa49NlLCBTW5+Nc5edlyXq0MXrdAW3aSiFMjr5+ulpF9hXKlDB2H5j
	 ad+bX4W+2prDx3ekNf/H4GY1n8u1gbgj9wHbv1Em7eprZzxMZsJQ3S6sEUovt9nAxlQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794833987;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:From:To:CC:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=F5/09tsAiLJiH3yE/JR0I601g/y4qQXPTHzsm0/14NA=;
	b=dDTqDKYCpjmYZczmts2u2IoSzWc18QCyEY7hcp5jfaPfL2/22pSEWX49/O3hZgy7QIt5
	 +Zv6JhUERPrrfgmyoAIwmrS3r3b15w8Zc3wWWrY2eJJrjvvYByXHjQmuZ7stGPKwdG4r2
	 NwsQdxj92ukXA/ZBhyb0Beefz6ID2RQ/utxXDGTB4b8WouVA35neuRiChKAdXDTpSnUWg
	 u0CqnhKqGQJDyLZw+m6OD1Dl/Cpa9rwKQ8zEysgoYdkMqjV92ByKeiy2OeuSy3t2BESUg
	 kntVlh+ejQB+PGmovU/z15DFp2LAkxh+MMj3eJUlDh6LYDglzVcl/Y1shyK59g6PsIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=4oYOhIR5;
	arc=none smtp.remote-ip=113.46.200.226
Received: from canpmsgout11.his.huawei.com (canpmsgout11.his.huawei.com [113.46.200.226])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 872F560A2631;
	Mon, 16 Nov 2026 12:59:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 872F560A2631
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=4oYOhIR5
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=F5/09tsAiLJiH3yE/JR0I601g/y4qQXPTHzsm0/14NA=;
	b=4oYOhIR58XT0S8w/lRb1j1PxYmyMrJDo7rECYdhHu9aCBDHuIzwqFKSqa/zmTmEaT6OllAOLz
	KVAQ4xqgB/kVPA7yX6PUq/PSHjlr913TQXkwmv7hUUHMqDijkCoBHf/RIW42CkYmU85madgu1dt
	8rrtbQ2g5/mnaBXNiZo2k7Q=
Received: from mail.maildlp.com (unknown [172.19.163.200])
	by canpmsgout11.his.huawei.com (SkyGuard) with ESMTPS id 4jSnxl741NzKm5R;
	Mon, 16 Nov 2026 20:59:23 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 3161840563;
	Mon, 16 Nov 2026 20:59:37 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 16 Nov
 2026 20:59:36 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <james.morse@arm.com>, <ben.horgan@arm.com>, <reinette.chatre@intel.com>,
	<fenghuay@nvidia.com>, <catalin.marinas@arm.com>, <will@kernel.org>,
	<mark.rutland@arm.com>, <corbet@lwn.net>, <skhan@linuxfoundation.org>,
	<rdunlap@infradead.org>, <tony.luck@intel.com>, <Dave.Martin@arm.com>,
	<babu.moger@amd.com>, <fustini@kernel.org>, <tglx@kernel.org>,
	<mingo@redhat.com>, <bp@alien8.de>, <dave.hansen@linux.intel.com>,
	<hpa@zytor.com>, <x86@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <ruanjinjie@huawei.com>
Subject: [RFC PATCH v3 09/19] fs/resctrl: Add the L2 monitor events
Date: Mon, 16 Nov 2026 20:59:04 +0800
Message-ID: <20261116125914.498841-10-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261116125914.498841-1-ruanjinjie@huawei.com>
References: <20261116125914.498841-1-ruanjinjie@huawei.com>
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

MPAM monitors belong to a cache, and firmware says which level that
cache is. Add the L2 entries to the event table: l2c_occupancy for
occupancy and mbm_core_bytes for bandwidth. They have their own names
because an L2 counts the traffic the cache sees, not memory bandwidth.

Read the L2 events through the same per-domain path as the L3. The L2
has no domains to sum, so a read without a domain fails. The events only
show up once an architecture enables them; x86 never does.

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 fs/resctrl/monitor.c    | 12 +++++++++++-
 include/linux/resctrl.h |  2 +-
 2 files changed, 12 insertions(+), 2 deletions(-)

diff --git a/fs/resctrl/monitor.c b/fs/resctrl/monitor.c
index 7c392bd57eff..d72d53ba25c7 100644
--- a/fs/resctrl/monitor.c
+++ b/fs/resctrl/monitor.c
@@ -537,12 +537,18 @@ static int __l3_mon_event_count_sum(struct rdtgroup *rdtgrp, struct rmid_read *r
 static int __mon_event_count(struct rdtgroup *rdtgrp, struct rmid_read *rr)
 {
 	switch (rr->r->rid) {
+	case RDT_RESOURCE_L2:
 	case RDT_RESOURCE_L3:
 		WARN_ON_ONCE(rr->evt->any_cpu);
 		if (rr->hdr)
 			return __mon_event_count_one_domain(rdtgrp, rr);
-		else
+
+		/* Only the L3 has SNC domains to sum. */
+		if (rr->r->rid == RDT_RESOURCE_L3)
 			return __l3_mon_event_count_sum(rdtgrp, rr);
+
+		rr->err = -EINVAL;
+		return -EINVAL;
 	case RDT_RESOURCE_PERF_PKG: {
 		u64 tval = 0;
 
@@ -1030,6 +1036,10 @@ void free_rmid_lru_list(void)
  * when the entry has a name.
  */
 struct mon_evt mon_event_all[RESCTRL_MON_SCOPE_NUM][QOS_NUM_EVENTS] = {
+	[RESCTRL_MON_SCOPE_L2] = {
+		MON_EVENT(QOS_OCCUP_EVENT_ID,			"l2c_occupancy",	false),
+		MON_EVENT(QOS_MBM_TOTAL_EVENT_ID,		"mbm_core_bytes",	false),
+	},
 	[RESCTRL_MON_SCOPE_L3] = {
 		MON_EVENT(QOS_OCCUP_EVENT_ID,			"llc_occupancy",	false),
 		MON_EVENT(QOS_MBM_TOTAL_EVENT_ID,		"mbm_total_bytes",	false),
diff --git a/include/linux/resctrl.h b/include/linux/resctrl.h
index 0a60372299c5..95ffff4c7925 100644
--- a/include/linux/resctrl.h
+++ b/include/linux/resctrl.h
@@ -180,7 +180,7 @@ struct mbm_cntr_cfg {
 };
 
 /**
- * struct rdt_l3_mon_domain - group of CPUs sharing RDT_RESOURCE_L3 monitoring
+ * struct rdt_l3_mon_domain - group of CPUs sharing L2 or L3 cache monitoring
  * @hdr:		common header for different domain types
  * @ci_id:		cache info id for this domain
  * @rmid_busy_llc:	bitmap of which limbo RMIDs are above threshold
-- 
2.34.1

