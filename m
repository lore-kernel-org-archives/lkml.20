Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.225
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792723745;
	b=cL9QruvsC8RgCk8Uk0UswIfVHygkIOT9GAI8mqdoueZt0Vdr6VzLtGLF0iyHEu20BVwa
	 Y5cVMD3WCNUyXDYixttF/VDjRqU7GbQk0xCf7jXme+hRqxUkg6mUXbM5EXNvfSoY2Omdr
	 BT/EWz36gtQPLOE3f4MtffjljiBgYq6HrVK42q0toDTrFsy4OvlsIjdpTxZ/BZZnb3ZL4
	 38kCX5ScUV5rWIY+NyMwiupl/2BPeyqFlVfgFWQtLRxJAMWP20kLtzQytg/g3i16NJ2os
	 re8rJW/YRw0aF0vsFD92IWYMjjx/CM76ibj8qDO0ZaIcN1kbwwc8gwsTpMi7ZsyoMww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792723745;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:From:To:CC:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=0qFDQ3tEInvMhyk9XxwD/YTmxwpLWoDpx40G0AiO8Ng=;
	b=wPTGRUjRTciqSzcSN/0ZPdSOy0W7kuVhZQcP5+WNeGvO1Pp5SZNih2KbExfZcaa+sbws
	 zR1Onr9Ve7PGcZSUPhbWFB3NJeOsYGj6fPRkuIWYv/xp3nIeODd+AUsfSXakL/t3B+c75
	 hp1Xfwp/yZRNCXYgdv5mpoZcg11plT8WDHXREUnN/Z2lquJV2Qr3c6usUb1xHeZcggklw
	 /53pxN+C+SaNwwIFRAZw58b9Bg0hJSE656TIXGvMHjRl9tzs9YEF6hKaMZAAo/2q4QCsp
	 Nx4PKURoURWeKHetfGDWzsILYPGAEYeGRZNsEMWzMdRCWhoCsXquZLDRQ5LetyiqECA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=jMqZH4Vr;
	arc=none smtp.remote-ip=113.46.200.225
Received: from canpmsgout10.his.huawei.com (canpmsgout10.his.huawei.com [113.46.200.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E02360A2604
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 02:48:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4E02360A2604
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=jMqZH4Vr
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=0qFDQ3tEInvMhyk9XxwD/YTmxwpLWoDpx40G0AiO8Ng=;
	b=jMqZH4VrvXuf8Y2C3AaurWan9rxK+XmvSXeqcsars9DhyXj7cMfnWvtCKOLlVk+WHPQc+44zl
	arhpbkgf06NzW59gAy+4+KDn3Q0FL96+laxjG7BkMDIX/1a+phXooGm+VqfvunphtoZeKzrxRF+
	D9t5fA1rz2in3s6C02U+ihg=
Received: from mail.maildlp.com (unknown [172.19.163.200])
	by canpmsgout10.his.huawei.com (SkyGuard) with ESMTPS id 4j9nX76XRFz1K9Zk;
	Fri, 23 Oct 2026 10:48:39 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 037394055B;
	Fri, 23 Oct 2026 10:48:45 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 23 Oct
 2026 10:48:44 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <james.morse@arm.com>, <ben.horgan@arm.com>, <reinette.chatre@intel.com>,
	<fenghuay@nvidia.com>, <tony.luck@intel.com>, <Dave.Martin@arm.com>,
	<babu.moger@amd.com>, <x86@kernel.org>, <linux-kernel@vger.kernel.org>
CC: <ruanjinjie@huawei.com>
Subject: [RFC PATCH 05/10] fs/resctrl: Prepare for range-format pseudo resources
Date: Fri, 23 Oct 2026 10:48:07 +0800
Message-ID: <20261023024812.232820-6-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261023024812.232820-1-ruanjinjie@huawei.com>
References: <20261023024812.232820-1-ruanjinjie@huawei.com>
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
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 kwepemk200008.china.huawei.com (7.202.194.74)

arm_mpam exposes the MPAM priority, capacity and limit controls as
extra resources that reuse the schema machinery but have no resource
of their own: they share the base resource's class, domains and
components, and only the mpam_config field written differs.

Prepare the resctrl core for them:
- Add RDT_RESOURCE_L{2,3}_{MAX,MIN,PRI} and RDT_RESOURCE_MB_{MIN,PRI,
  HDL,OPT} slots after PERF_PKG. The entries are unconditional; an
  architecture only gets dead slots it never initialises.
- Dispatch rdtgroup_init_alloc(), rdtgroup_size_show() and
  rdtgroup_mode_test_exclusive() on schema_fmt instead of the MBA/SMBA
  rids, so every RESCTRL_SCHEMA_RANGE resource takes the percentage path.
- Skip the pseudo rids in fflags_from_resource() and
  rdtgroup_create_info_dir(): they are only reachable through schemata.
- resctrl_get_default_ctrl() returns the defaults for the pseudo rids.

No behaviour change until an architecture populates the slots.

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 fs/resctrl/rdtgroup.c   | 15 ++++++++++-----
 include/linux/resctrl.h | 33 +++++++++++++++++++++++++++++++--
 2 files changed, 41 insertions(+), 7 deletions(-)

diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
index 5dcbb0a964e8..bdc568bb13d6 100644
--- a/fs/resctrl/rdtgroup.c
+++ b/fs/resctrl/rdtgroup.c
@@ -1491,7 +1491,8 @@ static bool rdtgroup_mode_test_exclusive(struct rdtgroup *rdtgrp)
 
 	list_for_each_entry(s, &resctrl_schema_all, list) {
 		r = s->res;
-		if (r->rid == RDT_RESOURCE_MBA || r->rid == RDT_RESOURCE_SMBA)
+		/* Only the bitmap resources are caches with CBM semantics */
+		if (r->schema_fmt == RESCTRL_SCHEMA_RANGE)
 			continue;
 		has_cache = true;
 		list_for_each_entry_rcu(d, &r->ctrl_domains, hdr.list, lockdep_is_cpus_held()) {
@@ -1696,8 +1697,7 @@ static int rdtgroup_size_show(struct kernfs_open_file *of,
 					ctrl = resctrl_arch_get_config(r, d,
 								       closid,
 								       type);
-				if (r->rid == RDT_RESOURCE_MBA ||
-				    r->rid == RDT_RESOURCE_SMBA)
+				if (r->schema_fmt == RESCTRL_SCHEMA_RANGE)
 					size = ctrl;
 				else
 					size = rdtgroup_cbm_to_size(r, d, ctrl);
@@ -2497,6 +2497,9 @@ static unsigned long fflags_from_resource(struct rdt_resource *r)
 		return RFTYPE_RES_MB;
 	case RDT_RESOURCE_PERF_PKG:
 		return RFTYPE_RES_PERF_PKG;
+	default:
+		/* The pseudo resources have no info directory of their own */
+		break;
 	}
 
 	return WARN_ON_ONCE(1);
@@ -2522,6 +2525,9 @@ static int rdtgroup_create_info_dir(struct kernfs_node *parent_kn)
 	/* loop over enabled controls, these are all alloc_capable */
 	list_for_each_entry(s, &resctrl_schema_all, list) {
 		r = s->res;
+		/* The pseudo resources are only reachable through schemata */
+		if (r->rid >= RDT_RESOURCE_L3_MAX)
+			continue;
 		fflags = fflags_from_resource(r) | RFTYPE_CTRL_INFO;
 		ret = rdtgroup_mkdir_info_resdir(s, s->name, fflags);
 		if (ret)
@@ -3859,8 +3865,7 @@ static int rdtgroup_init_alloc(struct rdtgroup *rdtgrp)
 
 	list_for_each_entry(s, &resctrl_schema_all, list) {
 		r = s->res;
-		if (r->rid == RDT_RESOURCE_MBA ||
-		    r->rid == RDT_RESOURCE_SMBA) {
+		if (r->schema_fmt == RESCTRL_SCHEMA_RANGE) {
 			rdtgroup_init_mba(r, rdtgrp->closid);
 			if (is_mba_sc(r))
 				continue;
diff --git a/include/linux/resctrl.h b/include/linux/resctrl.h
index dd09c2ce9a0f..33af56f953c0 100644
--- a/include/linux/resctrl.h
+++ b/include/linux/resctrl.h
@@ -54,7 +54,23 @@ enum resctrl_res_level {
 	RDT_RESOURCE_MBA,
 	RDT_RESOURCE_SMBA,
 	RDT_RESOURCE_PERF_PKG,
-	RDT_RESOURCE_LAST = RDT_RESOURCE_PERF_PKG
+	/*
+	 * Pseudo resources re-using the class picked for the resource above
+	 * to expose the MPAM priority/capacity/limit controls. They have no
+	 * class of their own, share the base resource's domains, and never
+	 * appear in info/.
+	 */
+	RDT_RESOURCE_L3_MAX,
+	RDT_RESOURCE_L2_MAX,
+	RDT_RESOURCE_L3_MIN,
+	RDT_RESOURCE_L2_MIN,
+	RDT_RESOURCE_MB_MIN,
+	RDT_RESOURCE_L3_PRI,
+	RDT_RESOURCE_L2_PRI,
+	RDT_RESOURCE_MB_PRI,
+	RDT_RESOURCE_MB_HDL,
+	RDT_RESOURCE_MB_OPT,
+	RDT_RESOURCE_LAST = RDT_RESOURCE_MB_OPT
 };
 
 #define RDT_NUM_RESOURCES (RDT_RESOURCE_LAST + 1)
@@ -408,7 +424,20 @@ static inline u32 resctrl_get_default_ctrl(struct rdt_resource *r)
 	case RESCTRL_SCHEMA_BITMAP:
 		return BIT_MASK(r->cache.cbm_len) - 1;
 	case RESCTRL_SCHEMA_RANGE:
-		return r->membw.max_bw;
+		switch (r->rid) {
+		case RDT_RESOURCE_L3_MIN:
+		case RDT_RESOURCE_L2_MIN:
+		case RDT_RESOURCE_MB_MIN:
+		case RDT_RESOURCE_L3_PRI:
+		case RDT_RESOURCE_L2_PRI:
+			return 0;
+		case RDT_RESOURCE_MB_PRI:
+			return 3;
+		case RDT_RESOURCE_MB_HDL:
+			return 1;
+		default:
+			return r->membw.max_bw;
+		}
 	}
 
 	return WARN_ON_ONCE(1);
-- 
2.34.1

