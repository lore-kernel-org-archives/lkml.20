Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.226
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794833986;
	b=KcAmLXaZTYG4v3JAH3ADUpeUMZ66enpP7kU3Ne3tn2ExKu3E1uzW/pgGtrGlrm62ZUtH
	 wszHvDbDyjDm02fgImC0TNK/YRNN4d6cu7aieTk0ohW26vfWgNZ/abu6Eh51jmfk6baXQ
	 RpDrwOaXZDVtZry1mYBKYs1uU4pMDIpT0TPMKaNhTbyrMULzjgpEZOPEe/tP3sw8xN24o
	 qc1jNgXZtpBiuu5CGrDAW9yU2mRa7lkeaSm7H6VotYw2yozBvT6F01uRIOenF/ehFyKms
	 LodpcgzOyngbzxcvdFlsDKkxQ2OnldJdLivF/gImKJpt/atpepRDE/hjrbwH6/IOMDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794833986;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:From:To:CC:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=Qh6+tq7VKRL2AuRXW3kgTvgbscY36NYiR74jvD03GU0=;
	b=E4nWpHQHryoYIxUF+x8cLbdU+z4RFmLtjH18s6heFRhVoZ/Bho/2+0ZbKa2Eo1D9YM+H
	 t+p99D/3HLEu/LZeafs52+Odgv8PHtNkEI99y1u+eZ0Aqn6KKTCWA3zCrYIhN8rIze4Bo
	 DwLAtFXPlC4Fcdv0jp5Snkpolpo6o79ob48OOwWf7uQsDgrZ/+TSgV3/idrHvjIr1tPNf
	 naLfQcMGsugyz0HOsmLxHwkPeDHRyC7COJyf5brYoMX8IJAKUz99qgQ1ctS2YDXJ9ABkm
	 rPUZHhmj5jZrQpGOWV/XfmVEdlc1ggS53TZE3bU0jMmsTSvZGMIxhzBqbEscQMvE6mQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=xfOgVRHQ;
	arc=none smtp.remote-ip=113.46.200.226
Received: from canpmsgout11.his.huawei.com (canpmsgout11.his.huawei.com [113.46.200.226])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C371A60A262D;
	Mon, 16 Nov 2026 12:59:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C371A60A262D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=xfOgVRHQ
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=Qh6+tq7VKRL2AuRXW3kgTvgbscY36NYiR74jvD03GU0=;
	b=xfOgVRHQ0E3UgC3fQn6cXxO3CLr2Fq8QDhBnXmGyrQ4X7zQuhu57WJc6bjESLBaj/F2Eq7u9c
	RXIwUV2mrXTz2miOuEvh9QBOjE8RbPhYgxha/uPijpxmqHAbwmeBPX1z7xUP4nX47mTiCHOvm1b
	XVVE0PiTN/SujajV4UuGePY=
Received: from mail.maildlp.com (unknown [172.19.163.200])
	by canpmsgout11.his.huawei.com (SkyGuard) with ESMTPS id 4jSnxl365JzKm5R;
	Mon, 16 Nov 2026 20:59:23 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id A168C40563;
	Mon, 16 Nov 2026 20:59:36 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 16 Nov
 2026 20:59:35 +0800
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
Subject: [RFC PATCH v3 08/19] fs/resctrl: Generalize __l3_mon_event_count for non-L3 resources
Date: Mon, 16 Nov 2026 20:59:03 +0800
Message-ID: <20261116125914.498841-9-ruanjinjie@huawei.com>
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

__l3_mon_event_count() reads a single monitor domain. Its only L3-specific
part is the resource id in the domain_header_is_valid() check; the rest
goes through rr->r and the monitor domain, which every monitor resource
uses. Check rr->r->rid instead and rename the helper to
__mon_event_count_one_domain().

No functional change.

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 fs/resctrl/monitor.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/fs/resctrl/monitor.c b/fs/resctrl/monitor.c
index ae6c5ecc1019..7c392bd57eff 100644
--- a/fs/resctrl/monitor.c
+++ b/fs/resctrl/monitor.c
@@ -422,7 +422,7 @@ static void mbm_cntr_free(struct rdt_l3_mon_domain *d, int cntr_id)
 	memset(&d->cntr_cfg[cntr_id], 0, sizeof(*d->cntr_cfg));
 }
 
-static int __l3_mon_event_count(struct rdtgroup *rdtgrp, struct rmid_read *rr)
+static int __mon_event_count_one_domain(struct rdtgroup *rdtgrp, struct rmid_read *rr)
 {
 	int cpu = smp_processor_id();
 	u32 closid = rdtgrp->closid;
@@ -432,7 +432,7 @@ static int __l3_mon_event_count(struct rdtgroup *rdtgrp, struct rmid_read *rr)
 	struct mbm_state *m;
 	u64 tval = 0;
 
-	if (!domain_header_is_valid(rr->hdr, RESCTRL_MON_DOMAIN, RDT_RESOURCE_L3)) {
+	if (!domain_header_is_valid(rr->hdr, RESCTRL_MON_DOMAIN, rr->r->rid)) {
 		rr->err = -EIO;
 		return -EINVAL;
 	}
@@ -540,7 +540,7 @@ static int __mon_event_count(struct rdtgroup *rdtgrp, struct rmid_read *rr)
 	case RDT_RESOURCE_L3:
 		WARN_ON_ONCE(rr->evt->any_cpu);
 		if (rr->hdr)
-			return __l3_mon_event_count(rdtgrp, rr);
+			return __mon_event_count_one_domain(rdtgrp, rr);
 		else
 			return __l3_mon_event_count_sum(rdtgrp, rr);
 	case RDT_RESOURCE_PERF_PKG: {
-- 
2.34.1

