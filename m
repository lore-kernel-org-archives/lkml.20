Received: from canpmsgout03.his.huawei.com (canpmsgout03.his.huawei.com [113.46.200.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1298B449EB7
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 08:24:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791793485; cv=none; b=K5NQlO5ajJ72EEe8QhpNAfr1nBqY0+RgvfJ2FMlbB0NdW+OCh2fum/klbDAEDUwgMnMKvZvLcGp5FEYXuJql7KXp6lqEY37RU/ufvMAZRqBOhejurlEo/sbIKb0aT91RMA6BeRNJcOAVGHCl0rKBcCYMue2FNDIS50BS62ZiMkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791793485; c=relaxed/simple;
	bh=iZ8783frMI5PUxgaUKFp2CCX6iKcjGxWwopJGfIgNJc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DIvQqsnoA4ZZAYJP80fgkChqqoQshvzmDsKmlwBbCDAAh0nnKSNQHpBaaGIXhbuTQ9hCykuXfTcxm46Scto0ySR8xbyAMvgIc2iGr35trSvOtATAWMAcxXdm48sAWQkp1BLba2bNK6/nk9bOqN1NatQQTCWHh9qFgM8Cw/u4iMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=1fEIljki; arc=none smtp.client-ip=113.46.200.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="1fEIljki"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=cC32Nj9yfLlN32NsBg00/kj2Eyx9B7C73oJRi65iuEg=;
	b=1fEIljki2P8uX1MEq3JForl2Y+dNFtNHNFmKGbh9va2fxiTyg2TG1U8fqV8wFemkEtlw3YNzt
	K25mh+RBkEbP5g4NTGKHp5voalc4ZtULOseggm75GwKTZQ9w6NQ1dSuZGxCTm36khYbLa7w7P8h
	0UDS02zx+p3YwJykCMkM8mY=
Received: from mail.maildlp.com (unknown [172.19.162.144])
	by canpmsgout03.his.huawei.com (SkyGuard) with ESMTPS id 4j39DQ4TdhzpStW;
	Mon, 12 Oct 2026 16:12:06 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 3DA6040538;
	Mon, 12 Oct 2026 16:24:38 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 12 Oct
 2026 16:24:37 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <tony.luck@intel.com>, <reinette.chatre@intel.com>, <Dave.Martin@arm.com>,
	<james.morse@arm.com>, <babu.moger@amd.com>, <tglx@kernel.org>,
	<mingo@redhat.com>, <bp@alien8.de>, <dave.hansen@linux.intel.com>,
	<hpa@zytor.com>, <ben.horgan@arm.com>, <fenghuay@nvidia.com>,
	<x86@kernel.org>, <linux-kernel@vger.kernel.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH v9 4/9] arm_mpam: Add a helper to check a PARTID is in a CLOSID
Date: Mon, 12 Oct 2026 16:23:32 +0800
Message-ID: <20261012082337.822258-5-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261012082337.822258-1-ruanjinjie@huawei.com>
References: <20261012082337.822258-1-ruanjinjie@huawei.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
 kwepemk200008.china.huawei.com (7.202.194.74)

match_closid() open codes the CDP special case that turns the task
PARTID into the CLOSID it belongs to. Move it into
resctrl_partid_in_closid(), so the question "does this PARTID belong to
this control group" is answered in one place.

No functional change.

Cc: James Morse <james.morse@arm.com>
Cc: Ben Horgan <ben.horgan@arm.com>
Cc: Reinette Chatre <reinette.chatre@intel.com>
Cc: Fenghua Yu <fenghuay@nvidia.com>
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 drivers/resctrl/mpam_resctrl.c | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
index dbafa2a7586d..0edededdf7a5 100644
--- a/drivers/resctrl/mpam_resctrl.c
+++ b/drivers/resctrl/mpam_resctrl.c
@@ -353,15 +353,21 @@ void resctrl_arch_set_closid_rmid(struct task_struct *tsk, u32 closid, u32 rmid)
 	mpam_set_task_partid_pmg(tsk, partid_d, partid_i, pmg_d, pmg_i);
 }
 
+/* Does the request PARTID belong to this control group? */
+static bool resctrl_partid_in_closid(u16 partid, u32 closid)
+{
+	if (cdp_enabled)
+		partid >>= 1;
+
+	return partid == closid;
+}
+
 bool resctrl_arch_match_closid(struct task_struct *tsk, u32 closid)
 {
 	u64 regval = mpam_get_regval(tsk);
-	u32 tsk_closid = FIELD_GET(MPAM0_EL1_PARTID_D, regval);
-
-	if (cdp_enabled)
-		tsk_closid >>= 1;
+	u32 tsk_partid = FIELD_GET(MPAM0_EL1_PARTID_D, regval);
 
-	return tsk_closid == closid;
+	return resctrl_partid_in_closid(tsk_partid, closid);
 }
 
 /* The task's pmg is not unique, the partid must be considered too */
-- 
2.34.1

