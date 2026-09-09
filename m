Received: from canpmsgout09.his.huawei.com (canpmsgout09.his.huawei.com [113.46.200.224])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA153538D76;
	Wed,  9 Sep 2026 11:28:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.224
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788953338; cv=none; b=Iu8IsAHnAPDMovX2RxiuDTjW8DVZxlxZSDt7MqYIFBT/k7r2fQnFV2TJcC5fYfttkS3J0lhh/Ts7W2OTyN78M9Ki9w6eGHu4z5tHoxy9EBboiHebRWZrBVn0elzZ1drSDmqVSk2urgoueskcZ0ZiorIhc4CrKuelJu6rQLQhwTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788953338; c=relaxed/simple;
	bh=z7rx8ko1Hjnl3eyotsb+7SjBItkzdkQghXn+hraHrPU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PG08QhvHI6r63tZHAqOjABRGZ1CbLBRDrY89cxWrvwXN94dt7VmVaRTFF5n4q35/sJgV99800xPBVvGv8Rwi9JIxxKWzvKmtWX6vrabE2QbC7nsbeIsUUfV/3TfxASLjobY7MQbRnrEuROyn/QbGJxHSPMQ4XUlGyubHvzFgHQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=XmWSwMOi; arc=none smtp.client-ip=113.46.200.224
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="XmWSwMOi"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=e+lX/tryefGyf3o/T2qlYaAE2kLFzNu3tYBSnkPNQYQ=;
	b=XmWSwMOiwZnk+xqLuA8Y0r6GMinDcoFeCBlsohRhwg1eCWraQ+TVTx9eorBjIgXT8KYvavdP8
	fNDlesP7DTxhTtOy9aCNv3Cu7v+/vHkQqMrFFNZpbhxrx31t6b9cJ9SvSM3ot8Zu3MvrdDOCjbL
	9NdRoFZ/Du/k46jy2f5iv/A=
Received: from mail.maildlp.com (unknown [172.19.163.200])
	by canpmsgout09.his.huawei.com (SkyGuard) with ESMTPS id 4hfyw61YLWz1cyQh;
	Wed,  9 Sep 2026 19:17:58 +0800 (CST)
Received: from kwepemf100015.china.huawei.com (unknown [7.202.181.14])
	by mail.maildlp.com (Postfix) with ESMTPS id EBC114055B;
	Wed,  9 Sep 2026 19:28:51 +0800 (CST)
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
Subject: [PATCH v4 1/3] RAS: Fix inverted context info bounds check in ARM processor errors
Date: Wed, 9 Sep 2026 19:28:30 +0800
Message-ID: <20260909112832.805314-2-liuwenliang@huawei.com>
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

