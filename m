Received: from canpmsgout07.his.huawei.com (canpmsgout07.his.huawei.com [113.46.200.222])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3516D53D0DE;
	Wed,  9 Sep 2026 11:28:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.222
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788953338; cv=none; b=jfiU0cd3NOtgc+xrPU35PBCU6YvBiFfpen5DGyj0J3xXVG+WNpJfnpVZ2bppCcgz7OLIJq0cOzmWWWA39DQ+jIFDxpT6zoyf7d0yc1vEM/VXq36zCUyNHebMMgPP3A8J2jVIU4VqW/UmRcpm22AN60nUGnhyxmxhdeT0IVBy3d4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788953338; c=relaxed/simple;
	bh=BpQIGUUS9Q2MZxF+Ij/RSMWvaL88RNqmR6AyzVlftvc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FhUmsWMcSm8LfVvT1M9Cg3hJz8npieejd0G2b3NgUDjH4wBmCgl0emlifgIcQjiAJbu0dr0H7RlhxwZ+gG3eX8iZJ+87cHJX+RRWf1PUyp55R38uCteM8OGx/PWat+/ztKuc9dtItKoCDKdIfcSr86LM2HWTPCQTugYrFUa12z4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=zhiUsmRC; arc=none smtp.client-ip=113.46.200.222
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="zhiUsmRC"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=8BfcLFJ8lq/NfCoBy8hEaePQL1LvldhZQMPiZxqeFMI=;
	b=zhiUsmRCm+bKfQXLQuuzodR4Vp/mfG5XLNLw4O2bx57QztbpHjqsIc7sZKU9TrELEar8VKSSq
	Z/shpttIVq9INF4gKOQQlfhXI0ChVkt9lWh/OlQxb1ycp3nIBMUTz4usy7ZGXbHvZaNFYj7VHoV
	E9RR8bnG03Va0UU+V1SHR4Y=
Received: from mail.maildlp.com (unknown [172.19.162.92])
	by canpmsgout07.his.huawei.com (SkyGuard) with ESMTPS id 4hfyw611bmzLlX8;
	Wed,  9 Sep 2026 19:17:58 +0800 (CST)
Received: from kwepemf100015.china.huawei.com (unknown [7.202.181.14])
	by mail.maildlp.com (Postfix) with ESMTPS id 8058040586;
	Wed,  9 Sep 2026 19:28:52 +0800 (CST)
Received: from dggphicprd10024.huawei.com (10.243.6.112) by
 kwepemf100015.china.huawei.com (7.202.181.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 9 Sep 2026 19:28:51 +0800
From: Abbott Liu <liuwenliang@huawei.com>
To: <tony.luck@intel.com>, <bp@alien8.de>, <ardb@kernel.org>,
	<mchehab+huawei@kernel.org>, <rafael.j.wysocki@intel.com>,
	<guohanjun@huawei.com>, <jic23@kernel.org>, <jason@os.amperecomputing.com>,
	<danielf@os.amperecomputing.com>, <luoshengwei@huawei.com>,
	<linux-edac@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <yangzhuohao1@huawei.com>, <douzhaolei@huawei.com>,
	<zouyipeng@huawei.com>, <wangbing6@huawei.com>, <nixiaoming@huawei.com>,
	<liuwenliang@huawei.com>
Subject: [PATCH v4 2/3] RAS: Fix out-of-bounds read when tracing arm_event
Date: Wed, 9 Sep 2026 19:28:31 +0800
Message-ID: <20260909112832.805314-3-liuwenliang@huawei.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260909112832.805314-1-liuwenliang@huawei.com>
References: <20260909112832.805314-1-liuwenliang@huawei.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 kwepemf100015.china.huawei.com (7.202.181.14)

The vsei_len < 0 error path did not verify the pei_len and ctx_len.
When vsei_len is negative, section_length is too small to hold the
full record, yet pei_len and ctx_len were derived from
err_info_num/context_info_num and may describe regions beyond the
(long)err .. err + section_length buffer. To prevent trace_arm_event
from reading past the allocated record, sanitize the parameters:
recalculate ctx_len and pei_len based on section_length, limit them,
and set the corresponding pointers to NULL and lengths to 0 when
there is no remaining space.

pei_len and ctx_len become s32 so that the recalculated lengths can
be checked for negative values.

Fixes: 05954511b73e ("RAS: Report all ARM processor CPER information to userspace")
Signed-off-by: Abbott Liu <liuwenliang@huawei.com>
---
 drivers/ras/ras.c | 22 ++++++++++++++++++----
 1 file changed, 18 insertions(+), 4 deletions(-)

diff --git a/drivers/ras/ras.c b/drivers/ras/ras.c
index 2540538a16a8..085fe2d980e5 100644
--- a/drivers/ras/ras.c
+++ b/drivers/ras/ras.c
@@ -58,10 +58,10 @@ void log_arm_hw_error(struct cper_sec_proc_arm *err, const u8 sev)
 	struct cper_arm_err_info *err_info;
 	struct cper_arm_ctx_info *ctx_info;
 	u8 *ven_err_data;
-	u32 ctx_len = 0;
+	s32 ctx_len = 0;
 	int n, sz, cpu;
 	s32 vsei_len;
-	u32 pei_len;
+	s32 pei_len;
 	u8 *pei_err, *ctx_err;
 
 	pei_len = sizeof(struct cper_arm_err_info) * err->err_info_num;
@@ -87,14 +87,28 @@ void log_arm_hw_error(struct cper_sec_proc_arm *err, const u8 sev)
 		pr_warn(FW_BUG "section length is too small\n");
 		pr_warn(FW_BUG "firmware-generated error record is incorrect\n");
 		vsei_len = 0;
+		ven_err_data = NULL;
+
+		ctx_len = err->section_length - (sizeof(struct cper_sec_proc_arm) + pei_len);
+		if (ctx_len < 0) {
+			ctx_len = 0;
+			ctx_err = NULL;
+
+			pei_len = err->section_length - sizeof(struct cper_sec_proc_arm);
+			if (pei_len < 0) {
+				pei_len = 0;
+				pei_err = NULL;
+			}
+		}
+	} else {
+		ven_err_data = (u8 *)ctx_info;
 	}
-	ven_err_data = (u8 *)ctx_info;
 
 	cpu = GET_LOGICAL_INDEX(err->mpidr);
 	if (cpu < 0)
 		cpu = -1;
 
-	trace_arm_event(err, pei_err, pei_len, ctx_err, ctx_len,
+	trace_arm_event(err, pei_err, (u32)pei_len, ctx_err, (u32)ctx_len,
 			ven_err_data, (u32)vsei_len, sev, cpu);
 }
 
-- 
2.43.0

