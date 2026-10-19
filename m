Received: from out162-62-57-210.mail.qq.com (out162-62-57-210.mail.qq.com [162.62.57.210])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC04C48FF6E
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 07:35:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.57.210
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792395323; cv=none; b=C99ahZmMdLANRAXNpjmBx7bymLrs9yaMMd8hFdYqrqVFykAw2Zm5XI4AAVhh792t7C+v0UbgabQN9SzENUEMpoKalyReWOaiVeoAf6SppB7SZZpXhecBXvWAuAvQ468l+1dJidcnX8XBb88+9D7Wu6gTF4xzvzevIMHz/dKd4cM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792395323; c=relaxed/simple;
	bh=AVjSN+no6wLWebuEZW1WqoHPn9SdSWxn+aWjA3tg3AE=;
	h=Message-ID:From:To:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=uXhnCw5d10pLnn3O96EOzZTVglYUPX2Zabz645J/FDoORxgmxYh9taIOntLtwcoqCbdMnGn+96zUlw/f8iLP3jhWaRHBXaI+LAacWJ3EtK80UKvyaLv7SSX3Dt29EJNtBedN2G/ommpqzOUxDgROhLF+HmG5S9Gb1qJZ+tlUmQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=jQiMVou6; arc=none smtp.client-ip=162.62.57.210
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="jQiMVou6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1792395310; bh=Ue++TDzw2qo5AXu78eUhZOpwEGgAAB6mxLfyRHQ5jlE=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=jQiMVou6PaV3nR3GPXgRDmQzC7QVpD95UewqeYVSoMo7RRkhtmC/kMt3kS9+RgraN
	 /LOs960PQPD2Pvh9Zyv0aaTfk7KAHkmp93S/oGkhMQgwtJ/o2yXDDNTT5v2ZKEnR7L
	 Sp8/WWt+uN7KW0Ab3TQbgoTVmTenNmqAaxMgvNuM=
Received: from r00799764-ThinkCentre-M920t-N000.. ([139.159.170.67])
	by newxmesmtplogicsvrsza73-0.qq.com (NewEsmtp) with SMTP
	id 8B707E35; Mon, 19 Oct 2026 15:34:55 +0800
X-QQ-mid: xmsmtpt1792395307t6sm986ry
Message-ID: <tencent_956D46E4D86F2531CD70820411E6B6506A05@qq.com>
X-QQ-XMAILINFO: Od8VqZhFMB3NvQrI8oKxM76xeG1VpCg3obRNPUnNcDffRb6c7Q1a8bEsLqoPZL
	 Z19QqfSnMdEMNdZY12FfspZHf+ZavHugmNalbnDdb+hnqblgaKBDasZEkzumFR6+CzPf0CbvsDcL
	 afCnJe3N98+Rhg+XFvPAI7OPB/85TG3vIcpVwUh4KNNY0mrT0VHgWD8kec2jj3A+dqcVqSbsb22L
	 BY4Okuy/T3wEzOeN1oYfnxytZdvKkM/3ojPCJlUgqIUaAxrV+V8b2GVvrBhLEzBESl2EHxux1wJi
	 AJcqa56gXpqP1+d/xE+C/cD7FgO9+XJr+dNEt0oG1DVYGJc/6B4Fdxit/76AaWCm9dpeASiZKShL
	 nM2Oru2raaquSuG9eziC9Q4nxgJSslOC0BqCkse8Yf64PG2UdzWoQNFO/TIA/AYRjK/kNg6fwmfd
	 +NuUfx/CSeLnxJwXjaIz3fVlfC9TWD2IaHi2V+AGWeE59JrD7KvRH94NqKsvBvikDOr0HGhsNeRB
	 H3qmuLRT36Bz785qidhMPRuytlH42GxS4uHTxdRm2Cm/aerYAL/Px2bCostJcQP465a5IhFObqCX
	 83x3SCB2qNCVCPcsedVzATi263khWCwncEFe+avbPkGRZaAnUBsptIeforaY/u3qRcKt4DmrCv4n
	 lTLghWPTjMu/dva5yC1xJvRPiRJ7xh9LSJCRneJne0RtHcTbCzMLmyRsWy3vSOnh7kCnj35p4o7P
	 t7ZH5/TwHW/KjRjCP3pipLZQ2celtW0NtcxEMtbYe4jQTd3k6IxeU+j8Qb8f5ol7JNbl16MW3th6
	 q8DMiYbmmYKDCTZtHMod3ipHTQvXAy9MBLmMAAf4dtYuD2O1n1PRjUQTCAgLGUcXVEPz19vb3d1E
	 baRtXdbo5SdHiqovCqlxRINfkbBmrq6pWucchJS8n8hVei/5b86p4Xbm4Q+xu914wL88wniE/gY6
	 j1Asu5HgYIppn23npdwKq7Gx1qt1WUarK9k6sdqIku0ZiRQDXVVA5bLfifMbh9WVhT+96gui+GNa
	 s+2qL+zoU1V1BoVfdEYoWQNCXldGNOiqK3JFEl0xlVlJ1QsiDoYyda76O69uGClaL9Rf8gkgYlBj
	 UgOwmn
X-QQ-XMRINFO: NyFYKkN4Ny6FuXrnB5Ye7Aabb3ujjtK+gg==
From: Jinjie Ruan <2118537295@qq.com>
To: babu.moger@amd.com,
	ben.horgan@arm.com,
	bp@alien8.de,
	catalin.marinas@arm.com,
	dave.hansen@linux.intel.com,
	Dave.Martin@arm.com,
	fenghuay@nvidia.com,
	gshan@redhat.com,
	hpa@zytor.com,
	james.morse@arm.com,
	jic23@kernel.org,
	mingo@redhat.com,
	reinette.chatre@intel.com,
	ruanjinjie@huawei.com,
	tan.shaopeng@fujitsu.com,
	tglx@kernel.org,
	tony.luck@intel.com,
	zengheng4@huawei.com,
	x86@kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v10 07/15] fs/resctrl: Add resctrl_arch_rmid_idx_match() helper
Date: Mon, 19 Oct 2026 15:33:33 +0800
X-OQ-MSGID: <20261019073453.2142856-8-2118537295@qq.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261019073453.2142856-1-2118537295@qq.com>
References: <20261019073453.2142856-1-2118537295@qq.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jinjie Ruan <ruanjinjie@huawei.com>

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
index 945be7465ad3..5107f4811cb2 100644
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
2.43.0

