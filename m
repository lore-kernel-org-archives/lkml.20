Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.218
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794833982;
	b=SRPYuUGhNYnAQzYGen/BmEkvOuXrMYV/KRzeKqwtbDk1dlK1XdHlD2rPAZEKlu6DujMM
	 6lOdCewUE9XQ+GMzn2LZL6GDK+gncDa5FZx0BAmYoRPHPDk4v/CI0wfZvyPoXVikd7Jl5
	 k7XtIrggcFutL8CMAda4QlveIWXnk3U5WQAiiz/z9J6trffrVRfovNLra2RZfuiBgoBvx
	 F+5r1xGLHl7NTeQFW0Bq8h1gF+ozjYlCDWO+ZkyQvIkKOXD/CX5pCJ9Uw2Fn3U0IbSb5K
	 o+P+0wHIsbrngbH25xvWohEchlAdBiiV82fI7rLxZc5ioyWxAYYS7sCFwmJHJQAD4tA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794833982;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:From:To:CC:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=U73B7vW4gd42Xrwue5GYV2+p19gjHwtmHarM2/dmJ1U=;
	b=PpyMntUQzZRU2/t1Q1lSMG3vXmKFWXx6WegAi8OD2MzawHIUWXNMhOmyZqE1uIq7ZaCT
	 pf3GEjYh4uIzCj5nI1OQGH21dg6kYlRDoYpXTH6D1lL2j9hTOlo5rDglBqhAnfo4Zm55W
	 tsYjZ8qo/RWGYqSSAcJU1xOUB4gZbMpGwdfiOYQIE5GNJUAaDPRKV9/Hq71Ke7LxUc7Ns
	 c0e+88LhNOyxMg2whyGl42YJfkCiEVYj2hiH0b+9T21HgrTetGQt6dtdHlq1jKw/72oUU
	 Is6KGA4mE7dItcmLyCgDslYPOjgHl3SSxCTIPkljHwXGbxgcL4SJK5Xaq7HEO6ywcng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b="pzQL/kf5";
	arc=none smtp.remote-ip=113.46.200.218
Received: from canpmsgout03.his.huawei.com (canpmsgout03.his.huawei.com [113.46.200.218])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F060606A333;
	Mon, 16 Nov 2026 12:59:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7F060606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=pzQL/kf5
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=U73B7vW4gd42Xrwue5GYV2+p19gjHwtmHarM2/dmJ1U=;
	b=pzQL/kf5IMkLt/wIiIrjLtDKFQorF2OU+q7VyxnRA5ugD1VumGJDahIYa7L4XBK/7ij2mSjO8
	XQ5yAfiyToo5CQlxe7bOiHtZghJHhU6G9Gm/T3PRnKFT2VHsLloTXOu9lPiGMf32fk2BT57S4wA
	V2zZ38xP8C0f9zNuW3rWXxI=
Received: from mail.maildlp.com (unknown [172.19.162.144])
	by canpmsgout03.his.huawei.com (SkyGuard) with ESMTPS id 4jSnx74NXgzpStt;
	Mon, 16 Nov 2026 20:58:51 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 3DD4440679;
	Mon, 16 Nov 2026 20:59:38 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 16 Nov
 2026 20:59:37 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <james.morse@arm.com>, <ben.horgan@arm.com>, <reinette.chatre@intel.com>,
	<fenghuay@nvidia.com>, <catalin.marinas@arm.com>, <will@kernel.org>,
	<mark.rutland@arm.com>, <corbet@lwn.net>, <skhan@linuxfoundation.org>,
	<rdunlap@infradead.org>, <tony.luck@intel.com>, <Dave.Martin@arm.com>,
	<babu.moger@amd.com>, <fustini@kernel.org>, <tglx@kernel.org>,
	<mingo@redhat.com>, <bp@alien8.de>, <dave.hansen@linux.intel.com>,
	<hpa@zytor.com>, <x86@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <ruanjinjie@huawei.com>
Subject: [RFC PATCH v3 11/19] resctrl: Keep the RMID limbo threshold per resource
Date: Mon, 16 Nov 2026 20:59:06 +0800
Message-ID: <20261116125914.498841-12-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261116125914.498841-1-ruanjinjie@huawei.com>
References: <20261116125914.498841-1-ruanjinjie@huawei.com>
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

Currently, the RMID reallocation threshold and its upper limit are
stored as system-wide globals. To support L2 cache occupancy monitoring
alongside L3, each cache resource needs its own threshold and limit
matching its capacity, and writing max_threshold_occupancy in one
resource's info directory must not affect the other.

Move both values into struct resctrl_mon in preparation for L2 support.
Update __check_limbo() and max_threshold_occupancy to use the values
from the owning resource, keeping existing L3 behavior on x86 and
setting them from the smallest cache of each resource in MPAM.

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 arch/x86/kernel/cpu/resctrl/monitor.c |  6 +++---
 drivers/resctrl/mpam_resctrl.c        | 17 +++++++++++++----
 fs/resctrl/monitor.c                  | 17 +++--------------
 fs/resctrl/rdtgroup.c                 | 11 +++++++----
 include/linux/resctrl.h               |  9 ++++++---
 5 files changed, 32 insertions(+), 28 deletions(-)

diff --git a/arch/x86/kernel/cpu/resctrl/monitor.c b/arch/x86/kernel/cpu/resctrl/monitor.c
index e9c2b4ae9ed4..e69e2bbb8804 100644
--- a/arch/x86/kernel/cpu/resctrl/monitor.c
+++ b/arch/x86/kernel/cpu/resctrl/monitor.c
@@ -425,7 +425,7 @@ int __init rdt_get_l3_mon_config(struct rdt_resource *r)
 
 	snc_nodes_per_l3_cache = snc_get_config();
 
-	resctrl_rmid_realloc_limit = boot_cpu_data.x86_cache_size * 1024;
+	r->mon.rmid_realloc_limit = boot_cpu_data.x86_cache_size * 1024;
 	hw_res->mon_scale = boot_cpu_data.x86_cache_occ_scale / snc_nodes_per_l3_cache;
 	r->mon.num_rmid = (boot_cpu_data.x86_cache_max_rmid + 1) / snc_nodes_per_l3_cache;
 	hw_res->mbm_width = MBM_CNTR_WIDTH_BASE;
@@ -442,14 +442,14 @@ int __init rdt_get_l3_mon_config(struct rdt_resource *r)
 	 *
 	 * For a 35MB LLC and 56 RMIDs, this is ~1.8% of the LLC.
 	 */
-	threshold = resctrl_rmid_realloc_limit / r->mon.num_rmid;
+	threshold = r->mon.rmid_realloc_limit / r->mon.num_rmid;
 
 	/*
 	 * Because num_rmid may not be a power of two, round the value
 	 * to the nearest multiple of hw_res->mon_scale so it matches a
 	 * value the hardware will measure. mon_scale may not be a power of 2.
 	 */
-	resctrl_rmid_realloc_threshold = resctrl_arch_round_mon_val(threshold);
+	r->mon.rmid_realloc_threshold = resctrl_arch_round_mon_val(threshold);
 
 	if (rdt_cpu_has(X86_FEATURE_BMEC) || rdt_cpu_has(X86_FEATURE_ABMC)) {
 		/* Detect list of bandwidth sources that can be tracked */
diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
index 961210af3159..d40c8eb7b300 100644
--- a/drivers/resctrl/mpam_resctrl.c
+++ b/drivers/resctrl/mpam_resctrl.c
@@ -634,8 +634,17 @@ void resctrl_arch_reset_cntr(struct rdt_resource *r, struct rdt_l3_mon_domain *d
  * The rmid realloc threshold should be for the smallest cache exposed to
  * resctrl.
  */
+
+/* A cache class backs the resctrl resource of its level, L2 or L3. */
+static enum resctrl_res_level mpam_class_rid(struct mpam_class *class)
+{
+	return class->level == 2 ? RDT_RESOURCE_L2 : RDT_RESOURCE_L3;
+}
+
 static int update_rmid_limits(struct mpam_class *class)
 {
+	enum resctrl_res_level rid = mpam_class_rid(class);
+	struct rdt_resource *r = resctrl_arch_get_resource(rid);
 	u32 num_unique_pmg = resctrl_arch_system_num_rmid_idx();
 	struct mpam_props *cprops = &class->props;
 	struct cacheinfo *ci;
@@ -657,10 +666,10 @@ static int update_rmid_limits(struct mpam_class *class)
 		return -EINVAL;
 	}
 
-	if (!resctrl_rmid_realloc_limit ||
-	    ci->size < resctrl_rmid_realloc_limit) {
-		resctrl_rmid_realloc_limit = ci->size;
-		resctrl_rmid_realloc_threshold = ci->size / num_unique_pmg;
+	if (!r->mon.rmid_realloc_limit ||
+	    ci->size < r->mon.rmid_realloc_limit) {
+		r->mon.rmid_realloc_limit = ci->size;
+		r->mon.rmid_realloc_threshold = ci->size / num_unique_pmg;
 	}
 
 	return 0;
diff --git a/fs/resctrl/monitor.c b/fs/resctrl/monitor.c
index 5924cc7d64f8..4132258760fa 100644
--- a/fs/resctrl/monitor.c
+++ b/fs/resctrl/monitor.c
@@ -65,8 +65,8 @@ static u32 *closid_num_dirty_rmid;
  * @rmid_limbo_count - count of currently unused but (potentially)
  *     dirty RMIDs.
  *     This counts RMIDs that no one is currently using but that
- *     may have a occupancy value > resctrl_rmid_realloc_threshold. User can
- *     change the threshold occupancy value.
+ *     may have a occupancy value above the resource's reallocation
+ *     threshold. User can change the threshold occupancy value.
  */
 static unsigned int rmid_limbo_count;
 
@@ -75,17 +75,6 @@ static unsigned int rmid_limbo_count;
  */
 static struct rmid_entry	*rmid_ptrs;
 
-/*
- * This is the threshold cache occupancy in bytes at which we will consider an
- * RMID available for re-allocation.
- */
-unsigned int resctrl_rmid_realloc_threshold;
-
-/*
- * This is the maximum value for the reallocation threshold, in bytes.
- */
-unsigned int resctrl_rmid_realloc_limit;
-
 /*
  * x86 and arm64 differ in their handling of monitoring.
  * x86's RMID are independent numbers, there is only one source of traffic
@@ -167,7 +156,7 @@ void __check_limbo(struct rdt_l3_mon_domain *d, bool force_free)
 						   arch_priv, &val, arch_mon_ctx)) {
 				rmid_dirty = true;
 			} else {
-				rmid_dirty = (val >= resctrl_rmid_realloc_threshold);
+				rmid_dirty = (val >= r->mon.rmid_realloc_threshold);
 
 				/*
 				 * x86's CLOSID and RMID are independent numbers,
diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
index afd6ffa9e324..328e78324f54 100644
--- a/fs/resctrl/rdtgroup.c
+++ b/fs/resctrl/rdtgroup.c
@@ -1255,9 +1255,11 @@ static int rdt_delay_linear_show(struct kernfs_open_file *of,
 static int max_threshold_occ_show(struct kernfs_open_file *of,
 				  struct seq_file *seq, void *v)
 {
+	struct rdt_resource *r = rdt_kn_parent_priv(of->kn);
+
 	if (!info_kn_lock(of->kn))
 		return -ENOENT;
-	seq_printf(seq, "%u\n", resctrl_rmid_realloc_threshold);
+	seq_printf(seq, "%u\n", r->mon.rmid_realloc_threshold);
 	info_kn_unlock(of->kn);
 
 	return 0;
@@ -1295,6 +1297,7 @@ static int rdt_thread_throttle_mode_show(struct kernfs_open_file *of,
 static ssize_t max_threshold_occ_write(struct kernfs_open_file *of,
 				       char *buf, size_t nbytes, loff_t off)
 {
+	struct rdt_resource *r = rdt_kn_parent_priv(of->kn);
 	unsigned int bytes;
 	int ret;
 
@@ -1309,14 +1312,14 @@ static ssize_t max_threshold_occ_write(struct kernfs_open_file *of,
 		goto out_unlock;
 	}
 
-	if (bytes > resctrl_rmid_realloc_limit) {
+	if (bytes > r->mon.rmid_realloc_limit) {
 		rdt_last_cmd_printf("max_threshold_occupancy: Exceeds limit (before adjustment) of %u bytes\n",
-				    resctrl_rmid_realloc_limit);
+				    r->mon.rmid_realloc_limit);
 		ret = -EINVAL;
 		goto out_unlock;
 	}
 
-	resctrl_rmid_realloc_threshold = resctrl_arch_round_mon_val(bytes);
+	r->mon.rmid_realloc_threshold = resctrl_arch_round_mon_val(bytes);
 
 out_unlock:
 	info_kn_unlock(of->kn);
diff --git a/include/linux/resctrl.h b/include/linux/resctrl.h
index 95ffff4c7925..6562c1698474 100644
--- a/include/linux/resctrl.h
+++ b/include/linux/resctrl.h
@@ -288,6 +288,10 @@ enum resctrl_schema_fmt {
 /**
  * struct resctrl_mon - Monitoring related data of a resctrl resource.
  * @num_rmid:			Number of RMIDs available.
+ * @rmid_realloc_limit:		Largest value for the reallocation threshold,
+ *				in bytes.
+ * @rmid_realloc_threshold:	Cache occupancy in bytes at which an RMID is
+ *				considered available for re-allocation.
  * @mbm_cfg_mask:		Memory transactions that can be tracked when
  *				bandwidth monitoring events can be configured.
  * @num_mbm_cntrs:		Number of assignable counters.
@@ -299,6 +303,8 @@ enum resctrl_schema_fmt {
  */
 struct resctrl_mon {
 	u32			num_rmid;
+	unsigned int		rmid_realloc_limit;
+	unsigned int		rmid_realloc_threshold;
 	unsigned int		mbm_cfg_mask;
 	int			num_mbm_cntrs;
 	bool			mbm_cntr_assignable;
@@ -726,9 +732,6 @@ int resctrl_arch_io_alloc_enable(struct rdt_resource *r, bool enable);
  */
 bool resctrl_arch_get_io_alloc_enabled(struct rdt_resource *r);
 
-extern unsigned int resctrl_rmid_realloc_threshold;
-extern unsigned int resctrl_rmid_realloc_limit;
-
 int resctrl_init(void);
 void resctrl_exit(void);
 
-- 
2.34.1

