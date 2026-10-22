Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.219
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792658938;
	b=2vOZWB5nt+jWok/4V8Ud3CSOkwxxUO4cy+QRnrufk6LVWVn+V7OXT3DJW/S37BOTGkHH
	 25wwe47RAd02Gtev9GV5TvAta4EMorGX1mTHe0amfbxDFZIaji0IUf2ZPJH1khO8lK/j8
	 ohZOPm8bz8XgzZa60PJKxcysnLW4C4VmomXeTPhnUYTOEBHQaw3t5xEZcSqUxQSaLxHtt
	 wXuhS/MVNgdgzLyBPvb2Z3QyvOAQ1XRuEVNzr0cn5HrBQ1oV9RcIOqVVq4kVdzOR43DcK
	 0x+e2QEjXy/btDUPhaosptNe4HbcA8sL7k1doV7BdVBKAAVpPE886zSqupdgr5ApHiA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792658938;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:From:To:CC:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=1dYYtT/v0iiNI+ASt1KtR2FoOd/NoxccHRvq2jzcrrE=;
	b=EgpC0HmHPnBCxeuEFu6VKSGBvvPILcHfAtBDxl+pn4ef18PLgOB5l3mZiC5Fd14BTv8H
	 3F3K1I0C1LLPaJQyoaMnuqEJuD3bvzxbfFux31JfawXwKZTqCWz7RBJdc7BZcH+0uLQhZ
	 5FldE5vLy6Bx97aT7V2NQ9P/Dw0yrO/b25OPZdty/SRDixlftyeclju39178IeEdlLZsb
	 7jW/sw2FsJvFeowO6iP2BsNgtGtU6BzmSfu3+OHnNCLhZZL1NMPG+koNk2DkhpAhBzmBs
	 z/MSOK/fNSl+FElZZQWGN2YaypblhA2x8SBEawcQ22Obzv8frRn/qq2hACeAQFeQQBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b="JC1uN/SY";
	arc=none smtp.remote-ip=113.46.200.219
Received: from canpmsgout04.his.huawei.com (canpmsgout04.his.huawei.com [113.46.200.219])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B19C360A2601;
	Thu, 22 Oct 2026 08:48:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B19C360A2601
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=JC1uN/SY
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=1dYYtT/v0iiNI+ASt1KtR2FoOd/NoxccHRvq2jzcrrE=;
	b=JC1uN/SYZiCIjCYNjA7QnV/CMBx5qR178+5gdAL5KAgTdw2WwpxndjDJqBBU5I63io+6Z2YZK
	YrPRXJxY9gxFerE6XVu5NXw4H97ae8xXyxZfEcrikZuT6AYjJXPdCU1Bu0ibeAfzGYqCIRQK50N
	98Gk4Z82fDSCILzrbB7je40=
Received: from mail.maildlp.com (unknown [172.19.163.104])
	by canpmsgout04.his.huawei.com (SkyGuard) with ESMTPS id 4j9KZ517fNz1prm5;
	Thu, 22 Oct 2026 16:48:45 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id A71F64056E;
	Thu, 22 Oct 2026 16:48:49 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 22 Oct
 2026 16:48:48 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <catalin.marinas@arm.com>, <will@kernel.org>, <mark.rutland@arm.com>,
	<corbet@lwn.net>, <skhan@linuxfoundation.org>, <rdunlap@infradead.org>,
	<james.morse@arm.com>, <ben.horgan@arm.com>, <reinette.chatre@intel.com>,
	<fenghuay@nvidia.com>, <tony.luck@intel.com>, <Dave.Martin@arm.com>,
	<babu.moger@amd.com>, <x86@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
CC: <ruanjinjie@huawei.com>
Subject: [RFC PATCH 1/7] fs/resctrl: Generalize __l3_mon_event_count for non-L3 resources
Date: Thu, 22 Oct 2026 16:48:15 +0800
Message-ID: <20261022084821.4014873-2-ruanjinjie@huawei.com>
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

__l3_mon_event_count() reads a single monitor domain. The L3 resource
name hardcoded in its domain_header_is_valid() check is the only thing
tying it to the L3 - all other access is through rr->r. Drop the
hardcode in favour of rr->r->rid and rename it to
__mon_event_count_one_domain() so other resources can reuse it.

No functional change.

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 fs/resctrl/monitor.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/fs/resctrl/monitor.c b/fs/resctrl/monitor.c
index 73413cb128ea..f9f4d4486c1b 100644
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
2.43.0

