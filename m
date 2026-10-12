Received: from canpmsgout01.his.huawei.com (canpmsgout01.his.huawei.com [113.46.200.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57B8170836;
	Mon, 12 Oct 2026 13:11:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791810722; cv=none; b=PbyWiwHIlAAD2V1APosdybQhZPsYUNS9ahWMqQL1KsnjPQ93L7zt6IXBjNajf7xv1W4m62IeXNPYkTLq+XGb1JVoXgt2rEuoLPsNR0nLiUXKEYFKtZzqYohKfmQz2rPkktRD2X/zums9Hrnbeshcaqw2MPOYHr+DUCd2u5+0/lY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791810722; c=relaxed/simple;
	bh=c/xXiW4rkUshyIZ9NzThz1vZTvpgFlQJnE4im1Q0R9E=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IUfUVxgdlwpncuph5DDA/nYt4T6PSxV61z2H+W7mvlLkhWypeCrG/QiBB5/l0ZJVCcxR5LC34F6leV8amqQ7AsWZ6HGFHrVqHdKaU4uV4WXgbmz7nnLCz1+sUxNpWDMKOGNN/vo63scIFkUCseWZhZFVmL+PJnmVeA4WqI8ETBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=PGMTmrU2; arc=none smtp.client-ip=113.46.200.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="PGMTmrU2"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=VZ1LtUGpgOizsf5Tv+JatEdU7Nq4ml8vCEKrrRKA0is=;
	b=PGMTmrU2cVwuZwbSXxGGTzlkUIFX4eT0x7btbiHFeEvqkv8ItKfdmMH+QWwIjxU/niL5HWG8d
	M1rEG4Q7VE/KIbmwUU7n7Nk86KW049FgPvvrAq0eB+/CTvUf/Q3zhH8du6n5ewj5w5c1J+ka1rY
	R8afS5d8Oly/sdJfshs98J8=
Received: from mail.maildlp.com (unknown [172.19.162.140])
	by canpmsgout01.his.huawei.com (SkyGuard) with ESMTPS id 4j3Hc31nqWz1T4Fq;
	Mon, 12 Oct 2026 20:59:31 +0800 (CST)
Received: from kwepemf100015.china.huawei.com (unknown [7.202.181.14])
	by mail.maildlp.com (Postfix) with ESMTPS id 0507220333;
	Mon, 12 Oct 2026 21:11:50 +0800 (CST)
Received: from dggphicprd10024.huawei.com (10.243.6.112) by
 kwepemf100015.china.huawei.com (7.202.181.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 12 Oct 2026 21:11:49 +0800
From: Abbott Liu <liuwenliang@huawei.com>
To: <tony.luck@intel.com>, <bp@alien8.de>, <guohanjun@huawei.com>,
	<rafael.j.wysocki@intel.com>, <jic23@kernel.org>,
	<mchehab+huawei@kernel.org>, <ardb@kernel.org>,
	<danielf@os.amperecomputing.com>, <luoshengwei@huawei.com>,
	<jason@os.amperecomputing.com>, <linux-edac@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <liuwenliang@huawei.com>
CC: <yangzhuohao1@huawei.com>, <douzhaolei@huawei.com>,
	<zouyipeng@huawei.com>, <wangbing6@huawei.com>, <nixiaoming@huawei.com>
Subject: [PATCH v6 1/2] RAS: Fix inverted context info bounds check in ARM processor errors
Date: Mon, 12 Oct 2026 21:11:39 +0800
Message-ID: <20261012131140.1526599-2-liuwenliang@huawei.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261012131140.1526599-1-liuwenliang@huawei.com>
References: <20261012131140.1526599-1-liuwenliang@huawei.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 kwepemf100015.china.huawei.com (7.202.181.14)

Commit 87880af2d24e ("APEI/GHES: ARM processor Error: don't go past
allocated memory") added bounds checks for malformed ARM processor
error records but contained a bug:

  In log_arm_hw_error(), the ctx_info bounds check is inverted. The
  condition "sz + (long)ctx_info - (long)err >= err->section_length"
  adds ctx_info->size when the context header is already past the end
  of the section instead of when it is within bounds. So change the
  comparison to <=.

The ctx_info->size overflow (a size over 0x7fffffff making the
signed sz negative) is deliberately left unaddressed: a size
overflow implies a corrupted firmware record, and then
section_length may be corrupted as well. For example, a real
section length of 1024 could be reported as 16000, and the context
walk can go out of bounds even without any size overflow. Guarding
ctx_info->size alone therefore does not add meaningful protection.

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
