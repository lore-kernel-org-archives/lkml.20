Received: from canpmsgout12.his.huawei.com (canpmsgout12.his.huawei.com [113.46.200.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB91345041A;
	Mon, 21 Sep 2026 08:04:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.227
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789977863; cv=none; b=u8J9ccXtsaLQ3H1XQZdLiAdTQrlqhsCY5SrJ0grxB7F8fSDnw6NOeQrPB9LzzAVRMvfvz3MKS//NlZ6OgBTi3UOBbIU7Id8mf90YlTfWV5CpEQMy60QW/ysArc2XCycFmfBaaDdavcXIM/jsL4jQk8X2VLhBnqePeg4+kK3CzPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789977863; c=relaxed/simple;
	bh=ctxsi4K3jhdYPETBNpeycBJxIsBVH+gMJj5n6DNzq30=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lKyy++IqWoIedg5qmQ/l8gKOl3mGmr+45iGwGN7VcvHGERYlalkd1LUeK0PzacR0U0vbFtq0PP0bw4/OmadhKRMd+ZxshUES/MYySytVz11hI8+h3eI0Owv/UYwz+MinMFqTzw8wSpSRLewLx9UrNEa6unnL60hFJdmD795t1wc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=50Sb9D39; arc=none smtp.client-ip=113.46.200.227
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="50Sb9D39"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=AGMOgDnjn0bT3s1dxuqcJ7m7Fndb2GHS1+lbjuUfUu8=;
	b=50Sb9D39MVQZ/zEj7KM69SrN+kfRa4aUEDFIpVktde/8+MZjb7XFGElApjvnlP0neF51CYLad
	Gdu/E1NwO4Q9MZHzw2BkO6pt8WYNVKAwMb0TJOZs0B1WsWkZZEth/oCy6c0ngPnYIQBrOIPNyD4
	llPwlBcN5U3I10xE5/A5pAM=
Received: from mail.maildlp.com (unknown [172.19.163.200])
	by canpmsgout12.his.huawei.com (SkyGuard) with ESMTPS id 4hpFpF1LswznTZf;
	Mon, 21 Sep 2026 15:53:09 +0800 (CST)
Received: from kwepemf100015.china.huawei.com (unknown [7.202.181.14])
	by mail.maildlp.com (Postfix) with ESMTPS id 6B56540563;
	Mon, 21 Sep 2026 16:04:11 +0800 (CST)
Received: from dggphicprd10024.huawei.com (10.243.6.112) by
 kwepemf100015.china.huawei.com (7.202.181.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 21 Sep 2026 16:04:10 +0800
From: Abbott Liu <liuwenliang@huawei.com>
To: <guohanjun@huawei.com>, <tony.luck@intel.com>, <bp@alien8.de>,
	<ardb@kernel.org>, <mchehab+huawei@kernel.org>, <rafael.j.wysocki@intel.com>,
	<jic23@kernel.org>, <jason@os.amperecomputing.com>,
	<danielf@os.amperecomputing.com>, <luoshengwei@huawei.com>,
	<linux-edac@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<liuwenliang@huawei.com>
CC: <yangzhuohao1@huawei.com>, <douzhaolei@huawei.com>,
	<zouyipeng@huawei.com>, <wangbing6@huawei.com>, <nixiaoming@huawei.com>
Subject: [PATCH v5 2/3] RAS: Fix out-of-bounds read when tracing arm_event
Date: Mon, 21 Sep 2026 16:03:36 +0800
Message-ID: <20260921080337.3000957-3-liuwenliang@huawei.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260921080337.3000957-1-liuwenliang@huawei.com>
References: <20260921080337.3000957-1-liuwenliang@huawei.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
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
Reviewed-by: Hanjun Guo <guohanjun@huawei.com>
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

