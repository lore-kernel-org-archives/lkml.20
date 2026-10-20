Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.226
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792503803;
	b=hEqImRRYlm0GTCN2Ixnn5wPfDEPS1OaF+jW6jrW561QmURESFdJx1VAq+71QJEYDEL9l
	 FdGfdph9DBcv91cWI2a0gjk3oSS8iQDcSUP8c8nrcnGJ5aNu0mYfJuTy8Gbmg0r5A0LJ+
	 cVIYHSMyO/6CNCoVXc5J/zY4G36Bn8vB20I3kiKAlmpO1gv28W2osiP0S85hnqWTZcf4s
	 WFBjlRZsavWatat12M4oKP6JHIk54smNFHAt3GLdA84uBHYU8V048O52Onmg9brqLI1Ef
	 LoM7GCKyBvXNO4UQfovD/9WJrjQC6HYMEp5pHn2IPJmR4YdaV2/PGRzFIyTIstXZVHw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792503803;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:From:To:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=VyTwDdk3DjElTadYVL7LUu3xdJ7Db+RXRtJ6bS3gWAo=;
	b=qUrpRAQ2dfG+XR4Sw6ufJ7iWoTsLqb97l7BhlGIeNZwVi/eTHySvACuwv/SG7qUU1n5V
	 aiYL3mD2zBpuIDtCLJwK/QUQEWre7IqIfSHPpwhcaQIXAxcu9baaMVcIczlC4YGI5RN2U
	 nDSLFyTm/kdXiAgPVvHNlvNhmcHkoFqkQdUr+sbjp99A/RrCdz3vJOfBmRKR8VG8bPbl3
	 AYuFhtiaxSodavKbH+M/w+65LrJ13uBsbSyNtD70rCs6pjGG+lppv41xpzUc7Hv6cq7h6
	 tDHmGWv6aHMXJgZuFmXAhtruDxwpge/K5GrOAnmqLmjVd6fPasC9IGgEnm0DBr1IIkA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=YGZAJJVe;
	arc=none smtp.remote-ip=113.46.200.226
Received: from canpmsgout11.his.huawei.com (canpmsgout11.his.huawei.com [113.46.200.226])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACCA260A2606
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 13:43:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ACCA260A2606
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=YGZAJJVe
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=VyTwDdk3DjElTadYVL7LUu3xdJ7Db+RXRtJ6bS3gWAo=;
	b=YGZAJJVeJ0/k463Fut+/qUcxhY8QcDHGmS8gI4Ls+LfVqXtArEj3jX0o0rzwAt5v3SxjdopOs
	iB+5GlamSX6SNjkFOjxIXA6v+Zeaszxt+zMSYGsdzuCQ3SaOEAuaba3Ru70Zn4d0KwrzEqYKSuu
	0SRZEFs71403AidTNyoTnwA=
Received: from mail.maildlp.com (unknown [172.19.163.127])
	by canpmsgout11.his.huawei.com (SkyGuard) with ESMTPS id 4j8DBk3cQyzKm4b;
	Tue, 20 Oct 2026 21:43:10 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id A5BB840572;
	Tue, 20 Oct 2026 21:43:14 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 20 Oct
 2026 21:43:13 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <tony.luck@intel.com>, <reinette.chatre@intel.com>, <Dave.Martin@arm.com>,
	<james.morse@arm.com>, <babu.moger@amd.com>, <tglx@kernel.org>,
	<mingo@redhat.com>, <bp@alien8.de>, <dave.hansen@linux.intel.com>,
	<hpa@zytor.com>, <ben.horgan@arm.com>, <fenghuay@nvidia.com>,
	<ruanjinjie@huawei.com>, <tan.shaopeng@fujitsu.com>, <zengheng4@huawei.com>,
	<jic23@kernel.org>, <gshan@redhat.com>, <catalin.marinas@arm.com>,
	<x86@kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v10 RESEND 07/15] fs/resctrl: Add resctrl_arch_rmid_idx_match() helper
Date: Tue, 20 Oct 2026 21:42:31 +0800
Message-ID: <20261020134239.3921377-8-ruanjinjie@huawei.com>
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

The current RMID allocator assumes that RMID and CLOSID are entirely
independent or follow a rigid 2D encoding. This prevents architectures
where an RMID is bound to a specific CLOSID from properly filtering
free RMIDs.

Introduce resctrl_arch_rmid_idx_match() to allow architectures to define
their own compatibility rules between a target CLOSID and an allocated
RMID's CLOSID.

No functional change.

Cc: Reinette Chatre <reinette.chatre@intel.com>
Cc: Dave Martin <Dave.Martin@arm.com>
Cc: James Morse <james.morse@arm.com>
Cc: Babu Moger <babu.moger@amd.com>
Cc: Thomas Gleixner <tglx@kernel.org>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: Borislav Petkov <bp@alien8.de>
Cc: Dave Hansen <dave.hansen@linux.intel.com>
Cc: H. Peter Anvin <hpa@zytor.com>
Cc: Ben Horgan <ben.horgan@arm.com>
Cc: Fenghua Yu <fenghuay@nvidia.com>
Suggested-by: James Morse <james.morse@arm.com>
Signed-off-by: Zeng Heng <zengheng4@huawei.com>
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 arch/x86/include/asm/resctrl.h |  6 ++++++
 drivers/resctrl/mpam_resctrl.c |  6 ++++++
 fs/resctrl/monitor.c           | 13 +++----------
 include/linux/arm_mpam.h       |  1 +
 4 files changed, 16 insertions(+), 10 deletions(-)

diff --git a/arch/x86/include/asm/resctrl.h b/arch/x86/include/asm/resctrl.h
index 8f6edcdcfd87..7bb297a0ab6e 100644
--- a/arch/x86/include/asm/resctrl.h
+++ b/arch/x86/include/asm/resctrl.h
@@ -181,6 +181,12 @@ static inline u32 resctrl_arch_rmid_idx_encode(u32 ignored, u32 rmid)
 	return rmid;
 }
 
+/* x86 RMIDs are independent; any RMID can be used with any CLOSID. */
+static inline bool resctrl_arch_rmid_idx_match(u32 closid, u32 rmid_closid)
+{
+	return true;
+}
+
 /* x86 can always read an rmid, nothing needs allocating */
 struct rdt_resource;
 static inline void *resctrl_arch_mon_ctx_alloc(struct rdt_resource *r,
diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
index 23a8771ef148..ee15367e36eb 100644
--- a/drivers/resctrl/mpam_resctrl.c
+++ b/drivers/resctrl/mpam_resctrl.c
@@ -279,6 +279,12 @@ u32 resctrl_arch_rmid_idx_encode(u32 closid, u32 rmid)
 	return closid * (mpam_pmg_max + 1) + rmid;
 }
 
+/* Check if the RMID's associated closid matches the target CLOSID. */
+bool resctrl_arch_rmid_idx_match(u32 closid, u32 rmid_closid)
+{
+	return closid == rmid_closid;
+}
+
 void resctrl_arch_rmid_idx_decode(u32 idx, u32 *closid, u32 *rmid)
 {
 	*closid = idx / (mpam_pmg_max + 1);
diff --git a/fs/resctrl/monitor.c b/fs/resctrl/monitor.c
index ffa9c67c9f00..b5a3b70bb809 100644
--- a/fs/resctrl/monitor.c
+++ b/fs/resctrl/monitor.c
@@ -208,23 +208,16 @@ bool has_busy_rmid(struct rdt_l3_mon_domain *d)
 static struct rmid_entry *resctrl_find_free_rmid(u32 closid)
 {
 	struct rmid_entry *itr;
-	u32 itr_idx, cmp_idx;
 
 	if (list_empty(&rmid_free_lru))
 		return rmid_limbo_count ? ERR_PTR(-EBUSY) : ERR_PTR(-ENOSPC);
 
 	list_for_each_entry(itr, &rmid_free_lru, list) {
 		/*
-		 * Get the index of this free RMID, and the index it would need
-		 * to be if it were used with this CLOSID.
-		 * If the CLOSID is irrelevant on this architecture, the two
-		 * index values are always the same on every entry and thus the
-		 * very first entry will be returned.
+		 * Check if the free RMID matches the target CLOSID.
+		 * Architecture-specific rules apply.
 		 */
-		itr_idx = resctrl_arch_rmid_idx_encode(itr->closid, itr->rmid);
-		cmp_idx = resctrl_arch_rmid_idx_encode(closid, itr->rmid);
-
-		if (itr_idx == cmp_idx)
+		if (resctrl_arch_rmid_idx_match(closid, itr->closid))
 			return itr;
 	}
 
diff --git a/include/linux/arm_mpam.h b/include/linux/arm_mpam.h
index f92a36187a52..0bc8049a3733 100644
--- a/include/linux/arm_mpam.h
+++ b/include/linux/arm_mpam.h
@@ -60,6 +60,7 @@ void resctrl_arch_sched_in(struct task_struct *tsk);
 bool resctrl_arch_match_closid(struct task_struct *tsk, u32 closid);
 bool resctrl_arch_match_rmid(struct task_struct *tsk, u32 closid, u32 rmid);
 u32 resctrl_arch_rmid_idx_encode(u32 closid, u32 rmid);
+bool resctrl_arch_rmid_idx_match(u32 closid, u32 rmid_closid);
 void resctrl_arch_rmid_idx_decode(u32 idx, u32 *closid, u32 *rmid);
 u32 resctrl_arch_system_num_rmid_idx(void);
 
-- 
2.34.1

