Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.216
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793277411;
	b=ngaWfZxSRGpPV84YnpYFz3qbNmtRhmQzp2ebN1kyYG6nSizbJHpUuXJUPLtVaElCeoEM
	 9e50S+P/MZw2fgp3g8M017Ot8cuJXDO0ZlVMkoZ7w2W+PcATt4uk2HJQmmWxvTwsKrfZd
	 hFMmUDBjFOo4RmA0C2fA/3IBAkHDxE499WXiIfk0zyKKxOgO+y1bRRfMirP5RiOiHcDEi
	 P6TosLrORSC8BFXATsVsJEd0Ox0pDdoAu277T/OAMteiGp5faKps7Qyck4XLrdW3EzxFP
	 OM0qCG9wHgCRw8f0elWMkLRQpLkHhIZk7zNt5YjzxDbVwePGZXl+kQLmoVPltZz+JNQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793277411;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:From:To:CC:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=iX/J80IPxttEGcgsZtNtc5Pybe2s9hAalnCzi4noQaA=;
	b=QaHm60zcxwcUVIth7UsmfLGQ6Ux2ZqPtklEN3h/u0lH+hFQW4Be8XE4S2S6T2N20tYci
	 sgIymJ8Quxyv0JfpyKBueLl2a/3RoACX4Voac6A2bEp4SSVquaF96zgptGFtDh3Cs37Kl
	 ad7yDO7yANUtFXejCaF3MFzfucEQ0zMgt2+0qODd3K8Z15qN25t/21a/pZfwG0/r+1Il1
	 ef3O4Dn1qaoU7YCRyyLWrfLCriKdeVLCkaQo6qVmTagq/Bs48FEtLwzotIajFLX/NDAER
	 loxLu+kAIwdN1byJC/o6S7OLAKgcB6yGerkM6gFvhC9TGufLVprg7yY8JrMSE/ErkTg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=fhkLwn8C;
	arc=none smtp.remote-ip=113.46.200.216
Received: from canpmsgout01.his.huawei.com (canpmsgout01.his.huawei.com [113.46.200.216])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AFB8606A32E;
	Thu, 29 Oct 2026 12:36:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1AFB8606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=fhkLwn8C
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=iX/J80IPxttEGcgsZtNtc5Pybe2s9hAalnCzi4noQaA=;
	b=fhkLwn8C5hfORpucbzLVUVTLqWRNLp89ITujl+EyKpIOjqT7E8a9m/1AZ8aTeGX2WnazlWnWi
	g3iYoWwh2JXV/jxQFShK+XBEBdv2cqXIDSLxmuADPX/lXB9Bos+XW28zg/oWFzqbm7zcugJ6VqG
	OMdkAi111W8EudfVScPrXjM=
Received: from mail.maildlp.com (unknown [172.19.163.0])
	by canpmsgout01.his.huawei.com (SkyGuard) with ESMTPS id 4jFkHl2qwWz1T4hD;
	Thu, 29 Oct 2026 20:36:35 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id A9DD940537;
	Thu, 29 Oct 2026 20:36:46 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 29 Oct
 2026 20:36:45 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <reinette.chatre@intel.com>, <james.morse@arm.com>, <ben.horgan@arm.com>,
	<fenghuay@nvidia.com>, <catalin.marinas@arm.com>, <will@kernel.org>,
	<mark.rutland@arm.com>, <corbet@lwn.net>, <skhan@linuxfoundation.org>,
	<rdunlap@infradead.org>, <tony.luck@intel.com>, <Dave.Martin@arm.com>,
	<babu.moger@amd.com>, <tglx@kernel.org>, <mingo@redhat.com>, <bp@alien8.de>,
	<dave.hansen@linux.intel.com>, <hpa@zytor.com>,
	<tan.shaopeng@jp.fujitsu.com>, <jic23@kernel.org>, <zengheng4@huawei.com>,
	<gshan@redhat.com>, <x86@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>
CC: <ruanjinjie@huawei.com>
Subject: [RFC PATCH v2 11/19] fs/resctrl: Add the L2 monitor events
Date: Thu, 29 Oct 2026 20:36:03 +0800
Message-ID: <20261029123611.1108424-12-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261029123611.1108424-1-ruanjinjie@huawei.com>
References: <20261029123611.1108424-1-ruanjinjie@huawei.com>
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

MPAM monitors belong to a cache, and firmware says which level that
cache is. Add the L2 entries to the event table: l2c_occupancy for
occupancy and mbm_core_bytes for bandwidth. They have their own names
because an L2 counts the traffic the cache sees, not memory bandwidth.

Read the L2 events through the same per-domain path as the L3. The L2
has no domains to sum, so a read without a domain fails. The events only
show up once an architecture enables them; x86 never does.

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 fs/resctrl/monitor.c    | 9 ++++++++-
 include/linux/resctrl.h | 2 +-
 2 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/fs/resctrl/monitor.c b/fs/resctrl/monitor.c
index 9b747b88fd6b..3544dd2a983a 100644
--- a/fs/resctrl/monitor.c
+++ b/fs/resctrl/monitor.c
@@ -537,12 +537,15 @@ static int __l3_mon_event_count_sum(struct rdtgroup *rdtgrp, struct rmid_read *r
 static int __mon_event_count(struct rdtgroup *rdtgrp, struct rmid_read *rr)
 {
 	switch (rr->r->rid) {
+	case RDT_RESOURCE_L2:
 	case RDT_RESOURCE_L3:
 		WARN_ON_ONCE(rr->evt->any_cpu);
 		if (rr->hdr)
 			return __mon_event_count_one_domain(rdtgrp, rr);
-		else
+		if (rr->r->rid == RDT_RESOURCE_L3)
 			return __l3_mon_event_count_sum(rdtgrp, rr);
+		rr->err = -EINVAL;
+		return -EINVAL;
 	case RDT_RESOURCE_PERF_PKG: {
 		u64 tval = 0;
 
@@ -1035,6 +1038,10 @@ struct mon_evt mon_event_all[RDT_NUM_RESOURCES][QOS_NUM_EVENTS] = {
 		MON_EVENT(QOS_MBM_TOTAL_EVENT_ID,	"mbm_total_bytes",	false),
 		MON_EVENT(QOS_MBM_LOCAL_EVENT_ID,	"mbm_local_bytes",	false),
 	},
+	[RDT_RESOURCE_L2] = {
+		MON_EVENT(QOS_OCCUP_EVENT_ID,		"l2c_occupancy",	false),
+		MON_EVENT(QOS_MBM_TOTAL_EVENT_ID,	"mbm_core_bytes",	false),
+	},
 	[RDT_RESOURCE_PERF_PKG] = {
 		MON_EVENT(PMT_EVENT_ENERGY,		"core_energy",	true),
 		MON_EVENT(PMT_EVENT_ACTIVITY,		"activity",	true),
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

