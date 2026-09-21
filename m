Received: from canpmsgout08.his.huawei.com (canpmsgout08.his.huawei.com [113.46.200.223])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7A8E40587A;
	Mon, 21 Sep 2026 08:04:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.223
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789977858; cv=none; b=D8H0dauFp/k51T9/l88gpqWqSEFaayHSykM21HIa2r0CM3hjyC9oNH11PqQP0YmeAPFyxN7GQD67r3N3KSuefkzQuNyGKfLVsS8KEKktZmpDCqi9QgmCfRBzyVhHfgB07ESO2U8bXExtXE1a1UxFKaVE+eYm2bn42BgUyncZIKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789977858; c=relaxed/simple;
	bh=yBsoL+NufVEKS7kp8UCj4iZdfdLKNlK5/iZ3qWshcyI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YkQJ3uoglKMp/QiawdjudM2wCd/mZ/3UBOHbsBUdkPJD74R7cPaESu2DSatnp5jPR8StXnRzluclhcPhJUQpgmo6M3qJoyMciU4RJNFKUMJ9PO3k8vHn9tVAflCa+gbdJm/cZN3OP6Gl4ehlDJKnC6KSZrJmVgufhf2cpcE98Wg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=PxjvXVIi; arc=none smtp.client-ip=113.46.200.223
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="PxjvXVIi"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=lX+q7Z79ZnFjPOSg3+i5vv9MV7dIo359XL+Dp/vbBpY=;
	b=PxjvXVIisk4iuXLf89WVQpvkaPBxhqLybFBzO4A6JQr0g1mojTDB06y0+V3wR8wldDDy6XEjG
	j9cDxnbOtzazzjngkvkHycamyzfcfaMk0BidrdazLI7dZB1St+/gBy2S7H1C3RGH3Q9YswvmigS
	znynPNevOCDMRSBz6RSxxDo=
Received: from mail.maildlp.com (unknown [172.19.163.163])
	by canpmsgout08.his.huawei.com (SkyGuard) with ESMTPS id 4hpFpG1JllzmV8f;
	Mon, 21 Sep 2026 15:53:10 +0800 (CST)
Received: from kwepemf100015.china.huawei.com (unknown [7.202.181.14])
	by mail.maildlp.com (Postfix) with ESMTPS id 15D3F4048B;
	Mon, 21 Sep 2026 16:04:12 +0800 (CST)
Received: from dggphicprd10024.huawei.com (10.243.6.112) by
 kwepemf100015.china.huawei.com (7.202.181.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 21 Sep 2026 16:04:11 +0800
From: Abbott Liu <liuwenliang@huawei.com>
To: <guohanjun@huawei.com>, <tony.luck@intel.com>, <bp@alien8.de>,
	<ardb@kernel.org>, <mchehab+huawei@kernel.org>, <rafael.j.wysocki@intel.com>,
	<jic23@kernel.org>, <jason@os.amperecomputing.com>,
	<danielf@os.amperecomputing.com>, <luoshengwei@huawei.com>,
	<linux-edac@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<liuwenliang@huawei.com>
CC: <yangzhuohao1@huawei.com>, <douzhaolei@huawei.com>,
	<zouyipeng@huawei.com>, <wangbing6@huawei.com>, <nixiaoming@huawei.com>
Subject: [PATCH v5 3/3] RAS: Fix integer overflow in ARM processor error context walk
Date: Mon, 21 Sep 2026 16:03:37 +0800
Message-ID: <20260921080337.3000957-4-liuwenliang@huawei.com>
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

sz is an int while ctx_info->size is a u32, so a size greater than
0x7fffffff makes sz negative and moves ctx_info below the error
record. The header check of the next iteration then passes, because
the offset of ctx_info relative to err is negative, and ctx_info->size
is read from a wild pointer. A negative sz also deflates ctx_len,
which can keep vsei_len non-negative, so the truncated record path is
not taken and the out-of-section ctx_info is traced as vendor error
data.

Check each context entry with 64-bit arithmetic: both the header and
the context data must fit within err + section_length. Stop the walk
at the first entry that does not fit, flag the record as overflowed
and take the truncated record path, which sanitizes the values
passed to trace_arm_event(), instead of detecting the overflow after
the walk only from a negative vsei_len.

Fixes: 87880af2d24e ("APEI/GHES: ARM processor Error: don't go past allocated memory")
Fixes: 05954511b73e ("RAS: Report all ARM processor CPER information to userspace")
Reported-by: Hanjun Guo <guohanjun@huawei.com>
Link: https://lore.kernel.org/all/20260825134323.4181892-1-liuwenliang@huawei.com/
Signed-off-by: Abbott Liu <liuwenliang@huawei.com>
---
 drivers/ras/ras.c | 20 ++++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/drivers/ras/ras.c b/drivers/ras/ras.c
index 085fe2d980e5..4de5c0f41524 100644
--- a/drivers/ras/ras.c
+++ b/drivers/ras/ras.c
@@ -59,6 +59,7 @@ void log_arm_hw_error(struct cper_sec_proc_arm *err, const u8 sev)
 	struct cper_arm_ctx_info *ctx_info;
 	u8 *ven_err_data;
 	s32 ctx_len = 0;
+	bool overflow = false;
 	int n, sz, cpu;
 	s32 vsei_len;
 	s32 pei_len;
@@ -74,15 +75,30 @@ void log_arm_hw_error(struct cper_sec_proc_arm *err, const u8 sev)
 	for (n = 0; n < err->context_info_num; n++) {
 		sz = sizeof(struct cper_arm_ctx_info);
 
-		if (sz + (long)ctx_info - (long)err <= err->section_length)
+		if ((sz + (long)ctx_info - (long)err <= err->section_length) &&
+		    ((u64)sz + ctx_info->size + ((long)ctx_info - (long)err) <=
+		    err->section_length)) {
 			sz += ctx_info->size;
+		} else {
+			overflow = true;
+			break;
+		}
 
 		ctx_info = (struct cper_arm_ctx_info *)((long)ctx_info + sz);
 		ctx_len += sz;
 	}
 
 	vsei_len = err->section_length - (sizeof(struct cper_sec_proc_arm) + pei_len + ctx_len);
-	if (vsei_len < 0) {
+	/*
+	 * There are two cases:
+	 *
+	 * 1. When err->context_info_num <= 0, overflow is always false. In this case,
+	 *    we use vsei_len to check whether section_length is too small.
+	 *
+	 * 2. When err->context_info_num > 0, overflow has already been set to true by
+	 *    the preceding for loop if section_length is too small.
+	 */
+	if (overflow || vsei_len < 0) {
 		pr_warn(FW_BUG "section length: %d\n", err->section_length);
 		pr_warn(FW_BUG "section length is too small\n");
 		pr_warn(FW_BUG "firmware-generated error record is incorrect\n");
-- 
2.43.0

