Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.218
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792723734;
	b=tvP0ku62EodYNz7dirJMbTcwhCG4wMztZOobmzZ1GGHf4LO056zbmTrpx16sC66E2rtB
	 vH0CeyEQ4TkLt4ckSBJqVZfAf0G1zR3IjIOUHe3/GCMFjefrJDEmD4U1CYvWdunsn6Zvu
	 k1ij45aISuau9pg5lWAEav3x1tKDq2wDM448+ltMYKOGfqph+Q8RaiykICDBAmeb/fb8y
	 /mydxyFEYSFxKHdHUQ58fXQ3gruOG6jPWPQAYifmGSCP1rAP98zGZ98cVI7l6vwqAOWs5
	 6gNFbqDkM5ePeSgmSsRJTa7AKBDHAmfif6xEhcMNtLa46PIelFCn/a1hQXGPBoEYd0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792723734;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:From:To:CC:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=vYZ6Ms1J2SpaJyFAwkTS5eKz0Hel7a67y/l+bWA0MRU=;
	b=VmronTl6OJcBmZeOKMkFVqCV87MCKAgzWK+Uby1HzEuj1dXnDRk/z368LvqU5APN6g4U
	 aVAnIwr+DT3Mpiyy1+JLLzFRAl8kzuj4t4bYQ4VTyx5hUnLm5EN3bLgzDem2txCxW5e/K
	 narv5HBznOMCw8qlHU4NVAsUqZJhhpryFnnTD4wdssrYOg+JB4cBbApe1uSAZvOhxXrZq
	 48OqCcrzqN9TplbFCB04BCQih/hZCkMCQYjU9ZWazUdX6JTBjfSipwsrZFikW02JftIu8
	 3NlqOw8heGN4jzkmYUlZc59oMqQyTfV36G6RKnenc7gXpOKeTB/PfPMzmwdQlAxsAgA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=BqlTOUdg;
	arc=none smtp.remote-ip=113.46.200.218
Received: from canpmsgout03.his.huawei.com (canpmsgout03.his.huawei.com [113.46.200.218])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9381B60A260B
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 02:48:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9381B60A260B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=BqlTOUdg
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=vYZ6Ms1J2SpaJyFAwkTS5eKz0Hel7a67y/l+bWA0MRU=;
	b=BqlTOUdgmvyLaPUZ9mhz2x4IVeRz3dtBLAXcTd4AjGG5U5TaMbwwdcTYPwjYrMAuMTHnzGuyG
	Gy0RE6HlRIBtRNYTwzzEDmu/MC/pQ+dKz8OCQbKFe5sxFreHhVE/X6xjWCc6EcxAV59juvN88Sf
	1Fcr2cmajx9oDUj2RpQV930=
Received: from mail.maildlp.com (unknown [172.19.163.104])
	by canpmsgout03.his.huawei.com (SkyGuard) with ESMTPS id 4j9nXB52QmzpTJV;
	Fri, 23 Oct 2026 10:48:42 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id DBDBE4056E;
	Fri, 23 Oct 2026 10:48:45 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 23 Oct
 2026 10:48:45 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <james.morse@arm.com>, <ben.horgan@arm.com>, <reinette.chatre@intel.com>,
	<fenghuay@nvidia.com>, <tony.luck@intel.com>, <Dave.Martin@arm.com>,
	<babu.moger@amd.com>, <x86@kernel.org>, <linux-kernel@vger.kernel.org>
CC: <ruanjinjie@huawei.com>
Subject: [RFC PATCH 07/10] arm_mpam: Generalize the fixed-point conversion helpers
Date: Fri, 23 Oct 2026 10:48:09 +0800
Message-ID: <20261023024812.232820-8-ruanjinjie@huawei.com>
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

mbw_max_to_percent() and percent_to_mbw_max() open-code the width in
cprops->bwa_wd. Split the conversion into a helper that takes the width
and keep the mbw wrappers, so the CMAX/CMIN controls, which use the
same fixed-point format but are cmax_wd bits wide, can reuse it.

No functional change.

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 drivers/resctrl/mpam_resctrl.c | 22 ++++++++++++++++------
 1 file changed, 16 insertions(+), 6 deletions(-)

diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
index 9d223057953a..dcdbf0404f07 100644
--- a/drivers/resctrl/mpam_resctrl.c
+++ b/drivers/resctrl/mpam_resctrl.c
@@ -739,18 +739,23 @@ static u32 get_mba_granularity(struct mpam_props *cprops)
  *
  * Find the nearest percentage value to the upper bound of the selected band:
  */
-static u32 mbw_max_to_percent(u16 mbw_max, struct mpam_props *cprops)
+static u32 __mbw_max_to_percent(u16 mbw_max, u8 wd)
 {
 	u32 val = mbw_max;
 
-	val >>= 16 - cprops->bwa_wd;
+	val >>= 16 - wd;
 	val += 1;
 	val *= MAX_MBA_BW;
-	val = DIV_ROUND_CLOSEST(val, 1 << cprops->bwa_wd);
+	val = DIV_ROUND_CLOSEST(val, 1 << wd);
 
 	return val;
 }
 
+static u32 mbw_max_to_percent(u16 mbw_max, struct mpam_props *cprops)
+{
+	return __mbw_max_to_percent(mbw_max, cprops->bwa_wd);
+}
+
 /*
  * Find the band whose upper bound is closest to the specified percentage.
  *
@@ -761,18 +766,23 @@ static u32 mbw_max_to_percent(u16 mbw_max, struct mpam_props *cprops)
  * percentages) and over-commit (where the total of the converted
  * allocations is greater than expected).
  */
-static u16 percent_to_mbw_max(u8 pc, struct mpam_props *cprops)
+static u16 __percent_to_mbw_max(u8 pc, u8 wd)
 {
 	u32 val = pc;
 
-	val <<= cprops->bwa_wd;
+	val <<= wd;
 	val = DIV_ROUND_CLOSEST(val, MAX_MBA_BW);
 	val = max(val, 1) - 1;
-	val <<= 16 - cprops->bwa_wd;
+	val <<= 16 - wd;
 
 	return val;
 }
 
+static u16 percent_to_mbw_max(u8 pc, struct mpam_props *cprops)
+{
+	return __percent_to_mbw_max(pc, cprops->bwa_wd);
+}
+
 static u32 get_mba_min(struct mpam_props *cprops)
 {
 	if (!mba_class_use_mbw_max(cprops)) {
-- 
2.34.1

