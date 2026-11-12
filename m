Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.225
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794489205;
	b=eTBqwSJUkOKyzcFGQNYzKUIKlrdMulgL06hBYP+LilH81Ev+O2JRSBKHPSBu14/esAsd
	 7KlSP+2m1KexZnH8unC5M/fmwumCrdCLgnyhuDVOMvNV/BftCDc37I0+a/lvmRAnETxex
	 Oo0XWypGbunI0z3HiKIIPzef84UwuQopQnfP4eanwYh8Sa7oM6ZY2uig5n7Coi0Mx+Bqx
	 7hF3ygLMuQYfTxUj2zrYS7OaCMgre6DMaifiiua9JIbC4hsfZDccam69qhHnthwvX8w6C
	 YDZqCpK6+XOwQv6wDsSVPIblzr2LwxBjuqCm7AYVLbyGTDZrd5/nms5T3Ku3+wc9PyA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794489205;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:From:To:CC:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=gLB3AodSpU0dXlPx9c6iIhtx2r+VDjwaKhOy+CroF8w=;
	b=bfJ9HQXJaZhDcWV/92wLyEmIZFpoy+stbGRbc3Ukpbo1beg/yGo99sZH9JqhfyOPLinm
	 DDm4h9PUXEPzvpoil29Xjv90mcyqqiVUMovcXeMU7dmRsUzzgVpuxgWNuJV2Nb7aKnJ1Q
	 9WByphZrMnLdz3oHj9Ex+NoQebLVkmTpAAD1TXBadr891s+e2MvIGLHJfYL9sDZp16yjG
	 fTT7LOLhuEHivICXRX4uWZ5MNByM7FQXRJ0n0vJZqZ+59pNa/kLvjjS3i1s8nJTvjLSLZ
	 f4H14hykGukyYqM0CWRgtE/hnU8gdcYvgf0wnNGwvSBOv5Gw8bH5DUma27ypi7W1XgA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=drx2TZUT;
	arc=none smtp.remote-ip=113.46.200.225
Received: from canpmsgout10.his.huawei.com (canpmsgout10.his.huawei.com [113.46.200.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F2CC60A2621;
	Thu, 12 Nov 2026 13:13:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9F2CC60A2621
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=drx2TZUT
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=gLB3AodSpU0dXlPx9c6iIhtx2r+VDjwaKhOy+CroF8w=;
	b=drx2TZUTgNbcBaDLGsueCnUS35TVKSSTWlGTziffZkaUXXQT8lZZWX7cztDxUuvqImxA7q/ob
	+orojus/iyK4befL40vJSnXiMDxqOlxeb9erS0VQcsWn77zFnRdCl5IZhYocgR5ZpG86zVOXgS8
	8kkQRYzKOBxZZEgTdKXdVfs=
Received: from mail.maildlp.com (unknown [172.19.163.200])
	by canpmsgout10.his.huawei.com (SkyGuard) with ESMTPS id 4jQLRQ6GBpz1K9BQ;
	Thu, 12 Nov 2026 21:13:06 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id D96F64055B;
	Thu, 12 Nov 2026 21:13:16 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 12 Nov
 2026 21:13:16 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <tony.luck@intel.com>, <reinette.chatre@intel.com>, <Dave.Martin@arm.com>,
	<james.morse@arm.com>, <babu.moger@amd.com>, <corbet@lwn.net>,
	<skhan@linuxfoundation.org>, <rdunlap@infradead.org>, <tglx@kernel.org>,
	<mingo@redhat.com>, <bp@alien8.de>, <dave.hansen@linux.intel.com>,
	<hpa@zytor.com>, <ben.horgan@arm.com>, <fenghuay@nvidia.com>,
	<tan.shaopeng@fujitsu.com>, <quic_jiles@quicinc.com>, <x86@kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>
CC: <ruanjinjie@huawei.com>
Subject: [RFC PATCH v2 8/9] x86,fs/resctrl: Let the architecture cap the RMIDs for the software controller
Date: Thu, 12 Nov 2026 21:12:53 +0800
Message-ID: <20261112131255.4043381-9-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261112131255.4043381-1-ruanjinjie@huawei.com>
References: <20261112131255.4043381-1-ruanjinjie@huawei.com>
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
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 kwepemk200008.china.huawei.com (7.202.194.74)

The MBA software controller measures every monitor group. When the
architecture assigns each group a counter from a shared pool as the
group is created, the number of groups must not exceed the number of
counters while the controller is in use. resctrl has no way to learn
this from the architecture.

The rmid_idx space cannot change for this: rmid_ptrs[] is set up on
the first mount, and RMIDs in limbo outlive an unmount.

Add two hooks instead.
- resctrl_arch_set_mba_sc(). Called when the controller is enabled
  or disabled, so the architecture can update what it reports
- resctrl_arch_rmid_valid(). Skips the RMIDs that arch refuses.

The hook runs before the number of CLOSIDs is read again, so the reset
of the bandwidth targets covers the CLOSIDs the controller may use.
The reset is skipped when the controller is disabled: the targets are
not read while it is off, and a domain that came online while it was
enabled may have allocated mbps_val for the capped, smaller number of
CLOSIDs.

Both hooks are no-ops on x86 and, for now, on MPAM.

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 arch/x86/include/asm/resctrl.h |  6 ++++++
 fs/resctrl/monitor.c           |  6 ++++--
 fs/resctrl/rdtgroup.c          | 25 ++++++++++++++++++++-----
 include/linux/arm_mpam.h       |  8 ++++++++
 4 files changed, 38 insertions(+), 7 deletions(-)

diff --git a/arch/x86/include/asm/resctrl.h b/arch/x86/include/asm/resctrl.h
index 8f6edcdcfd87..ac51b63f6dde 100644
--- a/arch/x86/include/asm/resctrl.h
+++ b/arch/x86/include/asm/resctrl.h
@@ -181,6 +181,12 @@ static inline u32 resctrl_arch_rmid_idx_encode(u32 ignored, u32 rmid)
 	return rmid;
 }
 
+static inline void resctrl_arch_set_mba_sc(bool enable) { }
+static inline bool resctrl_arch_rmid_valid(u32 closid, u32 rmid)
+{
+	return true;
+}
+
 /* x86 can always read an rmid, nothing needs allocating */
 struct rdt_resource;
 static inline void *resctrl_arch_mon_ctx_alloc(struct rdt_resource *r,
diff --git a/fs/resctrl/monitor.c b/fs/resctrl/monitor.c
index 5a67c8089615..bcd809083f18 100644
--- a/fs/resctrl/monitor.c
+++ b/fs/resctrl/monitor.c
@@ -216,12 +216,14 @@ static struct rmid_entry *resctrl_find_free_rmid(u32 closid)
 		 * to be if it were used with this CLOSID.
 		 * If the CLOSID is irrelevant on this architecture, the two
 		 * index values are always the same on every entry and thus the
-		 * very first entry will be returned.
+		 * very first entry will be returned. Skip the RMIDs the
+		 * architecture does not allow.
 		 */
 		itr_idx = resctrl_arch_rmid_idx_encode(itr->closid, itr->rmid);
 		cmp_idx = resctrl_arch_rmid_idx_encode(closid, itr->rmid);
 
-		if (itr_idx == cmp_idx)
+		if (itr_idx == cmp_idx &&
+		    resctrl_arch_rmid_valid(closid, itr->rmid))
 			return itr;
 	}
 
diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
index 9f10b6ceff8a..e186ae322f08 100644
--- a/fs/resctrl/rdtgroup.c
+++ b/fs/resctrl/rdtgroup.c
@@ -2640,16 +2640,20 @@ static int set_mba_sc(bool mba_sc)
 {
 	struct rdt_resource *r = resctrl_arch_get_resource(RDT_RESOURCE_MBA);
 	struct rdt_resource *rmbm = resctrl_arch_get_resource(RDT_RESOURCE_L3);
-	u32 num_closid = resctrl_arch_get_num_closid(r);
 	struct rdt_ctrl_domain *d;
 	unsigned long fflags;
-	int i;
 
 	if (!supports_mba_mbps() || mba_sc == is_mba_sc(r))
 		return -EINVAL;
 
 	r->membw.mba_sc = mba_sc;
 
+	/*
+	 * The architecture may cap the groups to what the controller can
+	 * measure. Do it before the number of CLOSIDs is used below.
+	 */
+	resctrl_arch_set_mba_sc(mba_sc);
+
 	/*
 	 * The controller needs its event counted in every monitoring group:
 	 * force automatic assignment on, and restore the user's setting when
@@ -2666,9 +2670,20 @@ static int set_mba_sc(bool mba_sc)
 
 	rdtgroup_default.mba_mbps_event = mba_mbps_default_event;
 
-	list_for_each_entry_rcu(d, &r->ctrl_domains, hdr.list, lockdep_is_cpus_held()) {
-		for (i = 0; i < num_closid; i++)
-			d->mbps_val[i] = MBA_MAX_MBPS;
+	/*
+	 * Reset the targets of the CLOSIDs the controller uses. Skip this
+	 * when disabling: nothing reads the targets while the controller is
+	 * off, and a domain that came online while it was enabled may have
+	 * allocated mbps_val for the capped, smaller number of CLOSIDs.
+	 */
+	if (mba_sc) {
+		u32 num_closid = resctrl_arch_get_num_closid(r);
+		int i;
+
+		list_for_each_entry_rcu(d, &r->ctrl_domains, hdr.list, lockdep_is_cpus_held()) {
+			for (i = 0; i < num_closid; i++)
+				d->mbps_val[i] = MBA_MAX_MBPS;
+		}
 	}
 
 	fflags = mba_sc ? RFTYPE_CTRL_BASE | RFTYPE_MON_BASE : 0;
diff --git a/include/linux/arm_mpam.h b/include/linux/arm_mpam.h
index 002f56e15362..73a6277f688c 100644
--- a/include/linux/arm_mpam.h
+++ b/include/linux/arm_mpam.h
@@ -63,6 +63,14 @@ u32 resctrl_arch_rmid_idx_encode(u32 closid, u32 rmid);
 void resctrl_arch_rmid_idx_decode(u32 idx, u32 *closid, u32 *rmid);
 u32 resctrl_arch_system_num_rmid_idx(void);
 
+/* MPAM does not limit the RMIDs for the MBA software controller yet. */
+static inline void resctrl_arch_set_mba_sc(bool enable) { }
+
+static inline bool resctrl_arch_rmid_valid(u32 closid, u32 rmid)
+{
+	return true;
+}
+
 struct rdt_resource;
 void *resctrl_arch_mon_ctx_alloc(struct rdt_resource *r, enum resctrl_event_id evtid);
 void resctrl_arch_mon_ctx_free(struct rdt_resource *r, enum resctrl_event_id evtid, void *ctx);
-- 
2.34.1

