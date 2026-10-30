Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.227
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793352132;
	b=TgJqku1b9CymnOAoNhIkek+G/ZqnLzjloqnZDyOCL2LNBLrjKW9PIEhayeWn+nxxIvNH
	 2K8Gymwrg/KRwmfHKH/VAZDMNgHEN5s3nHaSjzhIoqqpbagrUEQ7LFhFx9yJM6qz2acsN
	 fjhYcDgq9p6nViFwfsps/oyW2rOCE+3l1fpbOLxxxoRsfgYNY6n2moVUuJW9M4E5X1N4A
	 kiOyBAmOaMmATtiQpId50k0oPNA02Q8tnsxOeQa2TD6k9w4rLTw631HMh/tX8sC996yLE
	 t0QsQe8x1CJ5gKJNjlsG5Rjcp38dD09fNzYCjEV898pQPFAtWDid7pc4ZnI/DapMPlQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793352132;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:From:To:CC:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=0aAjOvu5IQavX/jcXR1upGJcZcZ24FsINp7BkKctPVQ=;
	b=hC4DWRaiFKnHVO4gUgO0zZ3GnKxipa0ZvGRKpgXqUlx1YiYR2NwYw4vbuElTbMK02qoP
	 bGvKwPpLgDOuAGAzvmCSyCcHVyV0hXwJmJzAhTpZeqxTsZsDtEfqpyqKHsQyDnu176tmR
	 ANU7atlAQ453D1UETWF6eenOkHmZXLqw4su71102lI7JIuv6PLw2w14EX9ThRItBc22f9
	 FRzn0osJRUp/98IgHm6nJrRi3uY/9DX4MFzqBqmXxnPC2rILpaNV9JYoBU1xEZ+c3xm3/
	 sKQ/mLxmYsSPxbl3lNdZZe97TBXwVok6HriJqfC0WmKHKHCW77dF6/AEvNKKfcomvGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=cM+jzpoh;
	arc=none smtp.remote-ip=113.46.200.227
Received: from canpmsgout12.his.huawei.com (canpmsgout12.his.huawei.com [113.46.200.227])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83B72606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 09:22:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 83B72606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=cM+jzpoh
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=0aAjOvu5IQavX/jcXR1upGJcZcZ24FsINp7BkKctPVQ=;
	b=cM+jzpohBYQR23YioQ9t0L55i5vZ9APGz+NYO9twLf8Vf1evmLmlkwFJ+8VYvUx7bQHTZZnLh
	YKdphuncdBCSQI6MB1p9qvVxxImd+s7Y6zooisVg9SAn6x7eDHA5TdyZAWLRp31mBgUkEOpIRsQ
	411QSi4mpODX8UVaBQdhxro=
Received: from mail.maildlp.com (unknown [172.19.163.214])
	by canpmsgout12.his.huawei.com (SkyGuard) with ESMTPS id 4jGFws0pHjznTVV;
	Fri, 30 Oct 2026 17:22:05 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id C5B8B4056C;
	Fri, 30 Oct 2026 17:22:06 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 30 Oct
 2026 17:22:06 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <tony.luck@intel.com>, <reinette.chatre@intel.com>, <Dave.Martin@arm.com>,
	<james.morse@arm.com>, <babu.moger@amd.com>, <bp@alien8.de>,
	<tan.shaopeng@fujitsu.com>, <x86@kernel.org>, <linux-kernel@vger.kernel.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH] fs/resctrl: Do not allocate a monitor context when releasing limbo RMIDs
Date: Fri, 30 Oct 2026 17:21:42 +0800
Message-ID: <20261030092144.1233551-2-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261030092144.1233551-1-ruanjinjie@huawei.com>
References: <20261030092144.1233551-1-ruanjinjie@huawei.com>
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
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 kwepemk200008.china.huawei.com (7.202.194.74)

Busy RMIDs of a monitor domain are normally released by the limbo
handler once their cache occupancy drops below the threshold. When a
domain goes offline, its busy RMIDs are released without checking
occupancy, since the domain is going away and the RMIDs must not be
left behind.

On the monitor domain offline path, __check_limbo() allocates
the monitor context that an occupancy check needs before it scans
the busy RMIDs, but without using it, and returns early when that
allocation fails. Then the caller destroys the domain's monitoring state,
including the bitmap that records which RMIDs are busy, so nothing can
clear those bits afterwards and the busy counts never reach zero. Those
RMIDs never return to the free list and, where the RMID depends on
the CLOSID, the dirty count of their CLOSID never decreases. The allocation
can also wait for a monitor to become free, which stalls the CPU offline
path on a context that is not going to be used.

Only MPAM systems are affected. An architecture that can always read an
RMID allocates nothing for the monitor context, so the allocation can
neither fail nor wait there.

So move the release of busy RMIDs into a separate function that does
not take a monitor context and leave the occupancy check to
__check_limbo().

This is not a revert of the fixed commit. It preserves the original fix's
intent of not reading a counter in the offline path.

Fixes: fc16126cc11d ("x86,fs/resctrl: Prevent out-of-bounds access while offlining CPU when SNC enabled")
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: James Morse <james.morse@arm.com>
Cc: Reinette Chatre <reinette.chatre@intel.com>
Cc: <stable@vger.kernel.org>
---
 fs/resctrl/internal.h |  2 +-
 fs/resctrl/monitor.c  | 72 ++++++++++++++++++++++++++++---------------
 fs/resctrl/rdtgroup.c |  2 +-
 3 files changed, 49 insertions(+), 27 deletions(-)

diff --git a/fs/resctrl/internal.h b/fs/resctrl/internal.h
index e62a277dee85..1c85e06f09bf 100644
--- a/fs/resctrl/internal.h
+++ b/fs/resctrl/internal.h
@@ -405,7 +405,7 @@ void cqm_handle_limbo(struct work_struct *work);
 
 bool has_busy_rmid(struct rdt_l3_mon_domain *d);
 
-void __check_limbo(struct rdt_l3_mon_domain *d, bool force_free);
+void release_limbo_rmids(struct rdt_l3_mon_domain *d);
 
 void resctrl_file_fflags_init(const char *config, unsigned long fflags);
 
diff --git a/fs/resctrl/monitor.c b/fs/resctrl/monitor.c
index 88674e28b2f8..3c9f65888004 100644
--- a/fs/resctrl/monitor.c
+++ b/fs/resctrl/monitor.c
@@ -124,18 +124,42 @@ static void limbo_release_entry(struct rmid_entry *entry)
 		closid_num_dirty_rmid[entry->closid]--;
 }
 
+/*
+ * Release the RMIDs that are marked as busy for this domain without
+ * checking their LLC occupancy. Cache lines may still be tagged with
+ * these RMIDs and will be accounted to the next user of each RMID.
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
+static void __check_limbo(struct rdt_l3_mon_domain *d)
 {
 	struct rdt_resource *r = resctrl_arch_get_resource(RDT_RESOURCE_L3);
 	u32 idx_limit = resctrl_arch_system_num_rmid_idx();
 	struct rmid_entry *entry;
-	bool rmid_dirty = true;
+	bool rmid_dirty;
 	u32 idx, cur_idx = 1;
 	void *arch_mon_ctx;
 	void *arch_priv;
@@ -161,30 +185,28 @@ void __check_limbo(struct rdt_l3_mon_domain *d, bool force_free)
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
@@ -843,7 +865,7 @@ void cqm_handle_limbo(struct work_struct *work)
 	if (cpumask_empty(&d->hdr.cpu_mask))
 		goto out_unlock;
 
-	__check_limbo(d, false);
+	__check_limbo(d);
 
 	if (has_busy_rmid(d)) {
 		d->cqm_work_cpu = cpumask_any_housekeeping(&d->hdr.cpu_mask,
diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
index 5dcbb0a964e8..20c800e678d5 100644
--- a/fs/resctrl/rdtgroup.c
+++ b/fs/resctrl/rdtgroup.c
@@ -4592,7 +4592,7 @@ void resctrl_offline_mon_domain(struct rdt_resource *r, struct rdt_domain_hdr *h
 		 * the RMID as busy creates RMID leaks if the
 		 * package never comes back.
 		 */
-		__check_limbo(d, true);
+		release_limbo_rmids(d);
 	}
 
 	domain_destroy_l3_mon_state(d);
-- 
2.34.1

