Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.225
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793261775;
	b=OnPCNdB2MFPrG3piZLHNDfppY8+wE+xe8dqtPoNMyorMy0EJZRjYJsyJzHKC5KUI8xdQ
	 BYs2xXiUlTGMeaKOdyQBkSVPZlEyv5MfeADh+rect4H4+HaOZ55zg7aC4lpEMnpfuYe5Z
	 0mVeor1sos4T1SN3QhhYsXza9Xc0qJ5QMjok6dz6AuB45WRf5gdXOmPe8s8HF04DDc6ww
	 wSWY3SQebJmLivGwrPhZ46Hi4d6eOX1qVMRTCtBB66xrKOOivuM9PlqaodXGw2dJb00sj
	 q8hlf09/xwoCVwQiwF2xSV2uOUnw6MAbt3TOU+3dO6zj5KF3H0YpkKWTZPO5JHuwp8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793261775;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:From:To:CC:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=3IJlSFMAL28bLbrAC/1XPQnKe0aCkPKQe8eJf3Dynro=;
	b=lpSSk0Z0qjCbsuQ9NJUaNkv3dZL7IahefU8fepvUUn9Jp4WTLWLOygAyTAuSsYAhPAuP
	 urWo/D3vIBwq4O0eq8cZ4qG0vHsm61XpJNd5LGKokWDxKBscf3YHmQ8hQhoWVaT/4eHTh
	 Qox6F0jGEjWgtZ5QEPpf2gqUplFxlj7Qx5YbVRhvnrDX3lu7rt0H3Xag3KYFcg5f3Vpms
	 BttgAcqClKbY3UAZ6gHLxvdN9+6HKVEf9r9EC31w2AEq++VC4wzT2m19g9+OfIg6suWoN
	 LhPszUqvLGveLqs0raX7glRkdK6vFAbvcISPxMR5X/D6CRxMz0OZCeLbo+p91OnkDfg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=kCOR7Mxf;
	arc=none smtp.remote-ip=113.46.200.225
Received: from canpmsgout10.his.huawei.com (canpmsgout10.his.huawei.com [113.46.200.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ED8C606A327
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 08:16:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7ED8C606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=kCOR7Mxf
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=3IJlSFMAL28bLbrAC/1XPQnKe0aCkPKQe8eJf3Dynro=;
	b=kCOR7Mxf5RcpV13UXHQZDswEV5jWpmE4eNAlmI2XfwtwwWhLVxeYLVjaWtQrd/b0SvlGWijoG
	xfEUJ4ShNkPZfDjvNbf6Ddxx77eRg0PY++XK+uaRCSHT5dIi31iVStCTb7iR9NQMlPVYyXSyhWi
	/qtIv46T1SIoM/x7vNTTuQE=
Received: from mail.maildlp.com (unknown [172.19.163.163])
	by canpmsgout10.his.huawei.com (SkyGuard) with ESMTPS id 4jFcVz4Jj6z1K9Bf;
	Thu, 29 Oct 2026 16:15:55 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 910F24048B;
	Thu, 29 Oct 2026 16:16:04 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 29 Oct
 2026 16:16:03 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <tony.luck@intel.com>, <reinette.chatre@intel.com>, <Dave.Martin@arm.com>,
	<james.morse@arm.com>, <babu.moger@amd.com>, <bp@alien8.de>,
	<tan.shaopeng@fujitsu.com>, <x86@kernel.org>, <linux-kernel@vger.kernel.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH 2/2] fs/resctrl: Skip monitor context allocation when force-freeing RMIDs
Date: Thu, 29 Oct 2026 16:15:13 +0800
Message-ID: <20261029081513.924019-3-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261029081513.924019-1-ruanjinjie@huawei.com>
References: <20261029081513.924019-1-ruanjinjie@huawei.com>
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
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 kwepemk200008.china.huawei.com (7.202.194.74)

__check_limbo() allocates the architecture monitor context before the
scan loop, even when the domain is going offline and the RMIDs will
be freed without reading their occupancy. So if the allocation fails,
the offline path returns early and leaves the busy RMIDs in limbo
which will be leaked instead of being released.

Split out release_limbo_rmids() for the offline path, which doesn't need
the monitor context.

Cc: James Morse <james.morse@arm.com>
Cc: Reinette Chatre <reinette.chatre@intel.com>
Fixes: fc16126cc11d ("x86,fs/resctrl: Prevent out-of-bounds access while offlining CPU when SNC enabled")
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 fs/resctrl/internal.h |  3 +-
 fs/resctrl/monitor.c  | 69 ++++++++++++++++++++++++++++---------------
 fs/resctrl/rdtgroup.c |  2 +-
 3 files changed, 48 insertions(+), 26 deletions(-)

diff --git a/fs/resctrl/internal.h b/fs/resctrl/internal.h
index e62a277dee85..a1837679b27a 100644
--- a/fs/resctrl/internal.h
+++ b/fs/resctrl/internal.h
@@ -405,7 +405,8 @@ void cqm_handle_limbo(struct work_struct *work);
 
 bool has_busy_rmid(struct rdt_l3_mon_domain *d);
 
-void __check_limbo(struct rdt_l3_mon_domain *d, bool force_free);
+void __check_limbo(struct rdt_l3_mon_domain *d);
+void release_limbo_rmids(struct rdt_l3_mon_domain *d);
 
 void resctrl_file_fflags_init(const char *config, unsigned long fflags);
 
diff --git a/fs/resctrl/monitor.c b/fs/resctrl/monitor.c
index b8f4e1ff4083..020140b794a7 100644
--- a/fs/resctrl/monitor.c
+++ b/fs/resctrl/monitor.c
@@ -124,13 +124,36 @@ static void limbo_release_entry(struct rmid_entry *entry)
 		closid_num_dirty_rmid[entry->closid]--;
 }
 
+/*
+ * Release the busy RMIDs of a domain that is going offline. Their occupancy
+ * can't be read any more, so they are freed without being checked.
+ */
+void release_limbo_rmids(struct rdt_l3_mon_domain *d)
+{
+	u32 idx_limit = resctrl_arch_system_num_rmid_idx();
+	struct rmid_entry *entry;
+	u32 idx, cur_idx = 1;
+
+	for (;;) {
+		idx = find_next_bit(d->rmid_busy_llc, idx_limit, cur_idx);
+		if (idx >= idx_limit)
+			break;
+
+		entry = __rmid_entry(idx);
+		clear_bit(idx, d->rmid_busy_llc);
+		if (!--entry->busy)
+			limbo_release_entry(entry);
+		cur_idx = idx + 1;
+	}
+}
+
 /*
  * Check the RMIDs that are marked as busy for this domain. If the
  * reported LLC occupancy is below the threshold clear the busy bit and
  * decrement the count. If the busy count gets to zero on an RMID, we
  * free the RMID
  */
-void __check_limbo(struct rdt_l3_mon_domain *d, bool force_free)
+void __check_limbo(struct rdt_l3_mon_domain *d)
 {
 	struct rdt_resource *r = resctrl_arch_get_resource(RDT_RESOURCE_L3);
 	u32 idx_limit = resctrl_arch_system_num_rmid_idx();
@@ -161,30 +184,28 @@ void __check_limbo(struct rdt_l3_mon_domain *d, bool force_free)
 			break;
 
 		entry = __rmid_entry(idx);
-		if (!force_free) {
-			if (resctrl_arch_rmid_read(r, &d->hdr, entry->closid,
-						   entry->rmid, QOS_L3_OCCUP_EVENT_ID,
-						   arch_priv, &val, arch_mon_ctx)) {
-				rmid_dirty = true;
-			} else {
-				rmid_dirty = (val >= resctrl_rmid_realloc_threshold);
-
-				/*
-				 * x86's CLOSID and RMID are independent numbers,
-				 * so the entry's CLOSID is an empty CLOSID
-				 * (X86_RESCTRL_EMPTY_CLOSID). On Arm the RMID
-				 * (PMG) extends the CLOSID (PARTID) space with
-				 * bits that aren't used to select the configuration.
-				 * It is thus necessary to track both CLOSID and
-				 * RMID because there may be dependencies between
-				 * them on some architectures.
-				 */
-				trace_mon_llc_occupancy_limbo(entry->closid, entry->rmid,
-							      d->hdr.id, val);
-			}
+		if (resctrl_arch_rmid_read(r, &d->hdr, entry->closid,
+					   entry->rmid, QOS_L3_OCCUP_EVENT_ID,
+					   arch_priv, &val, arch_mon_ctx)) {
+			rmid_dirty = true;
+		} else {
+			rmid_dirty = (val >= resctrl_rmid_realloc_threshold);
+
+			/*
+			 * x86's CLOSID and RMID are independent numbers,
+			 * so the entry's CLOSID is an empty CLOSID
+			 * (X86_RESCTRL_EMPTY_CLOSID). On Arm the RMID
+			 * (PMG) extends the CLOSID (PARTID) space with
+			 * bits that aren't used to select the configuration.
+			 * It is thus necessary to track both CLOSID and
+			 * RMID because there may be dependencies between
+			 * them on some architectures.
+			 */
+			trace_mon_llc_occupancy_limbo(entry->closid, entry->rmid,
+						      d->hdr.id, val);
 		}
 
-		if (force_free || !rmid_dirty) {
+		if (!rmid_dirty) {
 			clear_bit(idx, d->rmid_busy_llc);
 			if (!--entry->busy)
 				limbo_release_entry(entry);
@@ -843,7 +864,7 @@ void cqm_handle_limbo(struct work_struct *work)
 	if (cpumask_empty(&d->hdr.cpu_mask))
 		goto out_unlock;
 
-	__check_limbo(d, false);
+	__check_limbo(d);
 
 	if (has_busy_rmid(d)) {
 		d->cqm_work_cpu = cpumask_any_housekeeping(&d->hdr.cpu_mask,
diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
index 57ab090072c2..5d0351453c2f 100644
--- a/fs/resctrl/rdtgroup.c
+++ b/fs/resctrl/rdtgroup.c
@@ -4590,7 +4590,7 @@ void resctrl_offline_mon_domain(struct rdt_resource *r, struct rdt_domain_hdr *h
 		 * the RMID as busy creates RMID leaks if the
 		 * package never comes back.
 		 */
-		__check_limbo(d, true);
+		release_limbo_rmids(d);
 	}
 
 	domain_destroy_l3_mon_state(d);
-- 
2.34.1

