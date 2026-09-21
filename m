Received: from canpmsgout03.his.huawei.com (canpmsgout03.his.huawei.com [113.46.200.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2417044A725;
	Mon, 21 Sep 2026 08:04:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789977857; cv=none; b=ir3lYcsyxy3vRNUiEO4p44RVY10tNrOLVNLsWYurH2ck76WcwAUkv5yqB8UPMjOvPzb4lYtphwXs5QXtWWsy9QKpWAYdxnldmumiTXz3LJjVtIM5iw+sbBwunUBBXGJt/enahsjS8Ek42pESQpf33tsx1jV1QaRlECn4RCQqsBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789977857; c=relaxed/simple;
	bh=2+MPneEC8c6gMfIIvCxJ05wEMHIdcFqJRHelEWlO9qE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YDDSHm4mhPmaz6EJd8e/EZVvRpW4UnVeU/szgN8zv53z4eLvEiAU2Vq7wewgJJb2U0tM+rghz+/ubCtnpI3pWAI0BnIHuA4hkNkASlTtWtLC74Ga9VgKgUrNyi96ooW/BJueO1f8RvUS/r5Mtk6hSwoE7EUSFlo0HZfSCALeatk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=FrFzVX6H; arc=none smtp.client-ip=113.46.200.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="FrFzVX6H"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=xv+EVXdkYcjZnUBkDlxkGt1+yajUwqqEUYIuSmBmRUg=;
	b=FrFzVX6HxZQlXWZzst69uTPQ4CoYdrR4RdJqw3WxYNMxdju+kUq/iQ8tu23hvkTqOPFlzRGA2
	0aAnLPM4O4adq4z2MeqRbrdIRSA6g7LCISauc6e09xU4O1FgqmRNO3VTZdajFfofRESq6Khzwe/
	eGYZgE/3MOMuRH2BwlizVec=
Received: from mail.maildlp.com (unknown [172.19.162.144])
	by canpmsgout03.his.huawei.com (SkyGuard) with ESMTPS id 4hpFnD3SDXzpSvD;
	Mon, 21 Sep 2026 15:52:16 +0800 (CST)
Received: from kwepemf100015.china.huawei.com (unknown [7.202.181.14])
	by mail.maildlp.com (Postfix) with ESMTPS id BFDBA40538;
	Mon, 21 Sep 2026 16:04:10 +0800 (CST)
Received: from dggphicprd10024.huawei.com (10.243.6.112) by
 kwepemf100015.china.huawei.com (7.202.181.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 21 Sep 2026 16:04:09 +0800
From: Abbott Liu <liuwenliang@huawei.com>
To: <guohanjun@huawei.com>, <tony.luck@intel.com>, <bp@alien8.de>,
	<ardb@kernel.org>, <mchehab+huawei@kernel.org>, <rafael.j.wysocki@intel.com>,
	<jic23@kernel.org>, <jason@os.amperecomputing.com>,
	<danielf@os.amperecomputing.com>, <luoshengwei@huawei.com>,
	<linux-edac@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<liuwenliang@huawei.com>
CC: <yangzhuohao1@huawei.com>, <douzhaolei@huawei.com>,
	<zouyipeng@huawei.com>, <wangbing6@huawei.com>, <nixiaoming@huawei.com>
Subject: [PATCH v5 1/3] RAS: Fix inverted context info bounds check in ARM processor errors
Date: Mon, 21 Sep 2026 16:03:35 +0800
Message-ID: <20260921080337.3000957-2-liuwenliang@huawei.com>
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

Commit 87880af2d24e ("APEI/GHES: ARM processor Error: don't go past
allocated memory") added bounds checks for malformed ARM processor
error records but contained a bug:

  In log_arm_hw_error(), the ctx_info bounds check is inverted. The
  condition "sz + (long)ctx_info - (long)err >= err->section_length"
  adds ctx_info->size when the context header is already past the end
  of the section instead of when it is within bounds. So change the
  comparison to <=.

Fixes: 87880af2d24e ("APEI/GHES: ARM processor Error: don't go past allocated memory")
Signed-off-by: Abbott Liu <liuwenliang@huawei.com>
Reviewed-by: Hanjun Guo <guohanjun@huawei.com>
---
 drivers/ras/ras.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/ras/ras.c b/drivers/ras/ras.c
index 03df3db62334..2540538a16a8 100644
--- a/drivers/ras/ras.c
+++ b/drivers/ras/ras.c
@@ -74,7 +74,7 @@ void log_arm_hw_error(struct cper_sec_proc_arm *err, const u8 sev)
 	for (n = 0; n < err->context_info_num; n++) {
 		sz = sizeof(struct cper_arm_ctx_info);
 
-		if (sz + (long)ctx_info - (long)err >= err->section_length)
+		if (sz + (long)ctx_info - (long)err <= err->section_length)
 			sz += ctx_info->size;
 
 		ctx_info = (struct cper_arm_ctx_info *)((long)ctx_info + sz);
-- 
2.43.0

