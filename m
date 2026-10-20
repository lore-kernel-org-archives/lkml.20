Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.222
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792503808;
	b=l3qndU+ppmrK8wZ320InHhBizwNwwXS2zi/ZTJTPXfGOB0Ra7Bkk5LWt2tn5BL6rPP2J
	 Mtiz1Q511r+46jcHRjZ9VjXEMj440YdxTD3lp4U4ClT/4bgJ8Mt+kh+WEBmnfTDTwIhuO
	 N3La0j3YyXfiBIepkRZXOav+ePz9Pcu1TNVhkm8Z5B/EJ0cykpFh3BgpHYYVuJD5Zcile
	 DA4Vsa0IhZH39NFa9FvRIlIWrATg4bmEUUc1lkzJBipOAi7g5twFNSfizdutqteOEjY10
	 9Zfus5LHrrsJWbX432sVU4j8l1h8JfHDv8KC3uv+etBrOBzCvsrtFj8yPvczdU4FybA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792503808;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:From:To:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=UIKzuJWOWysnx1HROHVzgipix+/niqtNFjs9DsltZTo=;
	b=D2wji1L0Jl6R2px2bLUMwsEPXJYxmzzHqjy4N7WhYbMeIFLEdkPD21v1YWzZcR9v7Mb7
	 QuzyQWzDA31rU9avLCt62Vph4d5DL8IUmf36XooJYzvazrQU2p49tHt5Bs61r2bR9tH9k
	 mVzLo0c7YqyPCfhEu0As+Zb3TWD+MB6FV7Wp1dWuvvijKFobVpZKdDNA63ZNRHbZzRo6e
	 VxuVTCv/ni1zQjg57kso2rsws/gN1jyzNTDP+aAyCSjxWoNMnWQXLRvDp1S+D5GO/TGQL
	 kCr4vwiJ+wQRnJASZVxk6oAz4kir0h6B//fwB6fTsvzNLX3xadKtGep8M4hhrMoXlDg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=j804kpkg;
	arc=none smtp.remote-ip=113.46.200.222
Received: from canpmsgout07.his.huawei.com (canpmsgout07.his.huawei.com [113.46.200.222])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8087460A4AF8
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 13:43:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8087460A4AF8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=j804kpkg
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=UIKzuJWOWysnx1HROHVzgipix+/niqtNFjs9DsltZTo=;
	b=j804kpkgj16SKQPq47a/AtU66A0y90hSnSSSzHJfW5oCct0VFS/4JryDLhGE4NMkIvzKJdLTh
	BaxyrSGTodDCZ/pHcySubdXHL4ow/zfEXLtOiXbWZIWkQGwoYwuV6INCJKqPMRC+I4+RmNHAanb
	1ScSEPXyHYm01ExOeDBWMXA=
Received: from mail.maildlp.com (unknown [172.19.163.214])
	by canpmsgout07.his.huawei.com (SkyGuard) with ESMTPS id 4j8DBl4HmgzLlYF;
	Tue, 20 Oct 2026 21:43:11 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id E8A274056C;
	Tue, 20 Oct 2026 21:43:15 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 20 Oct
 2026 21:43:15 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <tony.luck@intel.com>, <reinette.chatre@intel.com>, <Dave.Martin@arm.com>,
	<james.morse@arm.com>, <babu.moger@amd.com>, <tglx@kernel.org>,
	<mingo@redhat.com>, <bp@alien8.de>, <dave.hansen@linux.intel.com>,
	<hpa@zytor.com>, <ben.horgan@arm.com>, <fenghuay@nvidia.com>,
	<ruanjinjie@huawei.com>, <tan.shaopeng@fujitsu.com>, <zengheng4@huawei.com>,
	<jic23@kernel.org>, <gshan@redhat.com>, <catalin.marinas@arm.com>,
	<x86@kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v10 RESEND 09/15] arm_mpam: Add a helper to check a PARTID is in a CLOSID
Date: Tue, 20 Oct 2026 21:42:33 +0800
Message-ID: <20261020134239.3921377-10-ruanjinjie@huawei.com>
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
index 9bb1f1569601..bfff965177fb 100644
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

