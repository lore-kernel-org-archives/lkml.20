Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.217
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793277405;
	b=QKtB2ZwMeHA1+03uMMplKcRkNAps1pyIkSPDEiR2r2E7x2FqlsCCyXEVHYUW0w1kCSl8
	 aLBxB7dpTI/yoRyt1F4Pp6XLy6gDIm9wxJrGqEbKhWJXk7BguyofeYWfJA/ajNIaFiXYz
	 wC1GqVHBJe9x3YwFRmH/Z3k3kiCYkSrQUxGWC2ak2oTSMXFpCiSsR1xziMXK+38sG2n5J
	 Mue6+a/UtbZoJ44vxP/brKx/WzM6dpAFZs389h/LQIuvE4BJxF8XD+uJ+v9xqoCd1gQno
	 WLTPqkzSK7KG9XVuSbK/0AImtu0ZnEMvmO8ajOWcNZjPsbRzeN2l0NSIqOkwoKBh4Ng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793277405;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:From:To:CC:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=1YHDYgewgH3kkBgcEGQfKgu9faPwc9O89sxeeR+9zmY=;
	b=5ckjrzuaD8od+GuyqBJ4PMk0uj3o0M7MSAYyuiZbAIGKuXVFVfJIWcZlbsihv7Jo9m0d
	 oo/INJOCp4OA5iAD3ueEvtfRYBDu6oAoWDO7/zrSifhr6tsPw+4QrLMYwFjteph1ypHnx
	 IXiCNMwo/GhPyJFolK5yab4+LBnUqe4J5KpTghbnXyBn4ahmL13m33RaGovqZJwYWnBvh
	 adPWyxkhO3/0qo+nj2ip58rvm9ZnRpLPqLwE+QKgrv4guNDX6PBfMqiBuGAX5QiP62qZA
	 paj1brp4bywF5R9bV0D69hBdkoLBA9IxE2m2nphfpAn+b0IeB/fymVL2eznbog/voMw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=ydyiVaMJ;
	arc=none smtp.remote-ip=113.46.200.217
Received: from canpmsgout02.his.huawei.com (canpmsgout02.his.huawei.com [113.46.200.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F886606A327;
	Thu, 29 Oct 2026 12:36:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1F886606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=ydyiVaMJ
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=1YHDYgewgH3kkBgcEGQfKgu9faPwc9O89sxeeR+9zmY=;
	b=ydyiVaMJYOA+z7UqhHohtB+XbzYOUQilFJB0lX0WLZJmPWOl6AB/WPJStYvn7F2QHCCO9cwIq
	w0CKbwypH/iBwLa8HteVSrS3hCVj6KN8MRUo2TZvOXth1oc9fc2+iz6pZfh6PGJRpbeKhk7RJTj
	dffJkxfQl38xka821t5i9SI=
Received: from mail.maildlp.com (unknown [172.19.162.144])
	by canpmsgout02.his.huawei.com (SkyGuard) with ESMTPS id 4jFkHW51fgzcb1J;
	Thu, 29 Oct 2026 20:36:23 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 9D52940538;
	Thu, 29 Oct 2026 20:36:39 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 29 Oct
 2026 20:36:38 +0800
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
Subject: [RFC PATCH v2 02/19] fs/resctrl: Generalize __l3_mon_event_count for non-L3 resources
Date: Thu, 29 Oct 2026 20:35:54 +0800
Message-ID: <20261029123611.1108424-3-ruanjinjie@huawei.com>
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
index 04e4ea612b7c..9dc076f82fa4 100644
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

