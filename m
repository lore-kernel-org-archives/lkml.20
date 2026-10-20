Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.220
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792503798;
	b=0txxZwe9ryWGsl7QR02940yZULJgrcfHby9mXFDW/edi8RfpRrNh0G2d2f/LXtHAkhb/
	 WV+J+/h2xCFsrm81T7wSL2IGu9po6SGpti5naBbssSzpdzyKDdbFTEmhUW8ArGFRL+P1r
	 99sJtHN2xym08HCWyAQaxqLCMFGXv01K4vA7JasySGbXBIMSZjMpRN/d7S2BNfSYmtC2t
	 M4RLkyjUl+cvVjtfp0ft2HTv1UmsqmkRBDUj66oe++PG8+hFb5jaD2ZrsAqfYMSMcEVVX
	 4Uht6tGVXX8/5IYdB0EsulzrKAOAwMdkG+9UAUd5qVlKlND0otLITYwlGhHSQ+vcEHw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792503798;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:From:To:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=+1cSLT2IQzCwjiElEC5V+OgELV8OxOwtHNSA1hXwk7M=;
	b=HGOsSSSiRXj2zOZW0d+qbVloOFeyEWT1hMrj2G4LytkgBBDpMYOyFW0ZFG4Ov2WuuyX2
	 MCPrM5Iininraag4v+N1Y3Lc0dadipo1PyJg3kwUanRcz19IwqyhWRZ9pE1vIoY9RubAL
	 tOLABs9lgQ1t95/nxIU1QWeK1Pp966KRr44FVXlu2cOfJAnymnQ3/tEH4xF0Wez4wXmw8
	 t0rRMeaJat82WVp52eISxPQcQC7eoAsLWxwOSB5Del798mWN6MOTph3UeUsSnRl7FFlll
	 Zw3K3XfG4EHTp7kQpAafoO+F3H91tPGxMZYRSPAsf/c06lPfbon2v+Y3ZtyST7yKbSg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=xdtDlamY;
	arc=none smtp.remote-ip=113.46.200.220
Received: from canpmsgout05.his.huawei.com (canpmsgout05.his.huawei.com [113.46.200.220])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24435606A319
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 13:43:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 24435606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=xdtDlamY
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=+1cSLT2IQzCwjiElEC5V+OgELV8OxOwtHNSA1hXwk7M=;
	b=xdtDlamY5ECWYKWWj3POkIhIRqMQOxtN1WRFeehkanEBTPMnO6kMBy9bO9CboZCLVt2i/XJWj
	gpp+nFieVGj7FwI6JXWfN0JRnKXHuI4fnnGKO4folKivawuvb8ZwvZfXVxA6xFvDx66p0UA/fwP
	iEp6KyGPcZQRSLtsNgUniTQ=
Received: from mail.maildlp.com (unknown [172.19.163.104])
	by canpmsgout05.his.huawei.com (SkyGuard) with ESMTPS id 4j8DBm1cqrz12LFQ;
	Tue, 20 Oct 2026 21:43:12 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 86D4F4057F;
	Tue, 20 Oct 2026 21:43:11 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 20 Oct
 2026 21:43:10 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <tony.luck@intel.com>, <reinette.chatre@intel.com>, <Dave.Martin@arm.com>,
	<james.morse@arm.com>, <babu.moger@amd.com>, <tglx@kernel.org>,
	<mingo@redhat.com>, <bp@alien8.de>, <dave.hansen@linux.intel.com>,
	<hpa@zytor.com>, <ben.horgan@arm.com>, <fenghuay@nvidia.com>,
	<ruanjinjie@huawei.com>, <tan.shaopeng@fujitsu.com>, <zengheng4@huawei.com>,
	<jic23@kernel.org>, <gshan@redhat.com>, <catalin.marinas@arm.com>,
	<x86@kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v10 RESEND 02/15] fs/resctrl: Skip monitor context allocation when force-freeing RMIDs
Date: Tue, 20 Oct 2026 21:42:26 +0800
Message-ID: <20261020134239.3921377-3-ruanjinjie@huawei.com>
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

__check_limbo() allocates the architecture monitor context before the
scan loop, even when force_free is set. The force-free path never reads
occupancy and never uses the context.

If the allocation fails, the function returns early and leaves the limbo
list unflushed. Callers such as the unmount path then silently fail to
return the RMIDs to the free list, leaving stale CLOSIDs in limbo that
are re-interpreted with the CDP state of the next mount.

Only allocate and free the monitor context when occupancy will be read.

Fixes: fa7d949337cc ("x86/resctrl: Rename and move rdt files to a separate directory")
Cc: James Morse <james.morse@arm.com>
Cc: Reinette Chatre <reinette.chatre@intel.com>
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 fs/resctrl/monitor.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/fs/resctrl/monitor.c b/fs/resctrl/monitor.c
index da883adc3adc..ffa9c67c9f00 100644
--- a/fs/resctrl/monitor.c
+++ b/fs/resctrl/monitor.c
@@ -142,11 +142,13 @@ void __check_limbo(struct rdt_l3_mon_domain *d, bool force_free)
 	u64 val = 0;
 
 	arch_priv = mon_event_all[QOS_L3_OCCUP_EVENT_ID].arch_priv;
-	arch_mon_ctx = resctrl_arch_mon_ctx_alloc(r, QOS_L3_OCCUP_EVENT_ID);
-	if (IS_ERR(arch_mon_ctx)) {
-		pr_warn_ratelimited("Failed to allocate monitor context: %pe",
-				    arch_mon_ctx);
-		return;
+	if (!force_free) {
+		arch_mon_ctx = resctrl_arch_mon_ctx_alloc(r, QOS_L3_OCCUP_EVENT_ID);
+		if (IS_ERR(arch_mon_ctx)) {
+			pr_warn_ratelimited("Failed to allocate monitor context: %pe",
+					    arch_mon_ctx);
+			return;
+		}
 	}
 
 	/*
@@ -192,7 +194,8 @@ void __check_limbo(struct rdt_l3_mon_domain *d, bool force_free)
 		cur_idx = idx + 1;
 	}
 
-	resctrl_arch_mon_ctx_free(r, QOS_L3_OCCUP_EVENT_ID, arch_mon_ctx);
+	if (!force_free)
+		resctrl_arch_mon_ctx_free(r, QOS_L3_OCCUP_EVENT_ID, arch_mon_ctx);
 }
 
 bool has_busy_rmid(struct rdt_l3_mon_domain *d)
-- 
2.34.1

