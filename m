Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.10
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793837631;
	b=ziz1nHUb0WyMi4cjWNTD5kSutQegyIyuD76Hh5wn2lE2ieRNMRvkCBg5/YdodXg8X+8Q
	 yp526IFhrdeaimFtF45HSDMJN7CYPu4PGoPDCp2yV98a3W25nFippVWmmLs6VBAO+g3Dr
	 b0fQTaqp8SEB3ZT18jfuySuz+Y8pR2+oPemA+yp3bn5fKpMH0KXnp1qcH1IoRMLlTjn9C
	 QKN5UhKayoXhmNRMmdLHx5/o6NyBP+Yd7Nt2pALQHRC23a2Cmik0oqN0KDbcDAsqIbLve
	 onu4iS5rcyU0PAvrAsvV1jfman+8hhmp3dT+LfNy9X9qWWDqyarjWL/ndIOxWNKFeFw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793837631;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=/P+OVEgS8cIq0BfPfGNw5GN1+UK1/YtZUyv/8l0spXA=;
	b=fdxm3+/pfYN7qwmLuYfanZ/erGc8dPxu+iGpz08NxjouShBqOohVbeTXlbHljAVRqUv6
	 EJUNeP5H/ILIpUyX+unxgZhhdRUhOcXM5YcNSAgbSVgYvudCdZZl9bP0WweNcpQI9+T1q
	 FVmHZO3NyURjwGC7XOKyPHkQ1Zx+lq3n/pbV5K+lqF2PFVuePsfli1Oou3wOkiIBE7Go1
	 DJY00lAxYt9a1Ufj7KJuwP4heCxpyRKF0SI7pdUQruvBpVr3uAMDb9OKZw6aLgRfG802e
	 adRGlx8y+J8E10VPMlfuHy+ozKRtVZRbsJMcLcYxDMj5JMvaMMkaGSHlMtO089iWNaw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Aj8N+Pqw;
	arc=none smtp.remote-ip=192.198.163.10
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3A74606D804
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 00:13:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C3A74606D804
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Aj8N+Pqw
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793837630; x=1825373630;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=aT3jJzA1LxcmkZ65kj5Wtb0mZxh355rUCCtPOCZv4Ss=;
  b=Aj8N+Pqwo+La68a4dkuI9xdPu6s5Ch1pZKGAc1a6bbt/hTZaS7MwwcAb
   k/EvT97j0+MBoIi1YtYCiJCFhTxRuDgwIgPL/pVBDkVLbM4oBIIJSv4P/
   O7Qnu7xt9kOQVYF0QeCKxQMjtdZKOHV0e2nStS7xeErvUsXNsukVgdudR
   aHwm9m/wcS6mRnYv/avjbiujbmJAJ2vv+Bz9cuoVbqOLo9ZcgDyQ8v3e1
   qb9cq/8sZYjFGExo0KhOXWTxIi2U4m+fV1LUVfv6FX9FWB5RFEHGZ8imI
   QmFtBHco6mAoII3wBl8QOqird/uXZLoPJ0G9/a6QtHC7arTW+VcBSRBQS
   A==;
X-CSE-ConnectionGUID: yFEyZrygQ9q0NMfBQkShxg==
X-CSE-MsgGUID: R472Sd0QRC+7X/MtwXuSvw==
X-IronPort-AV: E=McAfee;i="6800,10657,11956"; a="2512766"
X-IronPort-AV: E=Sophos;i="6.27,196,1787036400"; 
   d="scan'208";a="2512766"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2026 16:13:48 -0800
X-CSE-ConnectionGUID: W2BwtBqMQ7Kb4aTUQNQDdA==
X-CSE-MsgGUID: a8ia5f2oT0OA5Gez8b/RuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,196,1787036400"; 
   d="scan'208";a="7168846"
Received: from rchatre-desk1.jf.intel.com ([10.165.154.99])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2026 16:13:48 -0800
From: Reinette Chatre <reinette.chatre@intel.com>
To: tony.luck@intel.com,
	ben.horgan@arm.com,
	james.morse@arm.com,
	Dave.Martin@arm.com,
	babu.moger@amd.com,
	bp@alien8.de,
	tglx@linutronix.de,
	dave.hansen@linux.intel.com
Cc: x86@kernel.org,
	hpa@zytor.com,
	fustini@kernel.org,
	fenghuay@nvidia.com,
	peternewman@google.com,
	yu.c.chen@intel.com,
	linux-kernel@vger.kernel.org,
	patches@lists.linux.dev,
	reinette.chatre@intel.com
Subject: [PATCH v3 3/5] x86,fs/resctrl: Move MSR_IA32_L{2,3}_QOS_CFG scope property to x86 resource
Date: Wed,  4 Nov 2026 16:13:31 -0800
Message-ID: <5ea880efa78017b4ea64c47cec94f1f28d6c70a0.1793834224.git.reinette.chatre@intel.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <cover.1793834224.git.reinette.chatre@intel.com>
References: <cover.1793834224.git.reinette.chatre@intel.com>
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

MSR_IA32_L{2,3}_QOS_CFG enable code and data prioritization on x86. On
Intel the registers have the scope of the associated cache while on AMD
they have CPU scope. The scope is recorded as a property of the cache
resource's control, of which each cache resource currently supports only
one.

The scope of MSR_IA32_L{2,3}_QOS_CFG is only relevant to x86. Even so, the
property is found among the resctrl filesystem's cache properties while only
x86 code sets and reads it. Keeping the property with the cache control
properties would also duplicate it across all controls of a resource when
resources support multiple controls.

Make the scope of MSR_IA32_L{2,3}_QOS_CFG a property of the x86 hardware
resource and name it for the registers it describes now that it no longer
needs to be generic.

Signed-off-by: Reinette Chatre <reinette.chatre@intel.com>
Reviewed-by: Chen Yu <yu.c.chen@intel.com>
Reviewed-by: Tony Luck <tony.luck@intel.com>
---
Changes since RFC v1:
- Remove stray ";" in kernel-doc comment.

Changes since RFC v2:
- Rewrite changelog, shorten subject.
- Rework comment instead of copy&paste the original.
- Rename property to be more specific now that it does not need to aim
  for generic resctrl filesystem support.

Changes since v1:
- Update kernel-doc to make clear property is only relevant to cache
  resources.
- Rewrite changelog.

Changes since v2:
- Add Chenyu and Tony's Reviewed-by tags.
---
 arch/x86/kernel/cpu/resctrl/core.c     | 7 ++++---
 arch/x86/kernel/cpu/resctrl/internal.h | 4 ++++
 arch/x86/kernel/cpu/resctrl/rdtgroup.c | 4 +++-
 include/linux/resctrl.h                | 3 ---
 4 files changed, 11 insertions(+), 7 deletions(-)

diff --git a/arch/x86/kernel/cpu/resctrl/core.c b/arch/x86/kernel/cpu/resctrl/core.c
index f96f7cf255d0..e647c3aa065a 100644
--- a/arch/x86/kernel/cpu/resctrl/core.c
+++ b/arch/x86/kernel/cpu/resctrl/core.c
@@ -444,6 +444,7 @@ static int get_domain_id_from_scope(int cpu, enum resctrl_scope scope)
 
 static void domain_add_cpu_ctrl(int cpu, struct rdt_resource *r)
 {
+	struct rdt_hw_resource *hw_res = resctrl_to_arch_res(r);
 	int id = get_domain_id_from_scope(cpu, r->ctrl_scope);
 	struct rdt_hw_ctrl_domain *hw_dom;
 	struct list_head *add_pos = NULL;
@@ -466,7 +467,7 @@ static void domain_add_cpu_ctrl(int cpu, struct rdt_resource *r)
 		d = container_of(hdr, struct rdt_ctrl_domain, hdr);
 
 		cpumask_set_cpu(cpu, &d->hdr.cpu_mask);
-		if (r->cache.arch_has_per_cpu_cfg)
+		if (hw_res->qos_cfg_has_cpu_scope)
 			rdt_domain_reconfigure_cdp(r);
 		return;
 	}
@@ -1001,7 +1002,7 @@ static __init void rdt_init_res_defs_intel(void)
 
 		if (r->rid == RDT_RESOURCE_L3 ||
 		    r->rid == RDT_RESOURCE_L2) {
-			r->cache.arch_has_per_cpu_cfg = false;
+			hw_res->qos_cfg_has_cpu_scope = false;
 			r->cache.min_cbm_bits = 1;
 		} else if (r->rid == RDT_RESOURCE_MBA) {
 			hw_res->msr_base = MSR_IA32_MBA_THRTL_BASE;
@@ -1020,8 +1021,8 @@ static __init void rdt_init_res_defs_amd(void)
 
 		if (r->rid == RDT_RESOURCE_L3 ||
 		    r->rid == RDT_RESOURCE_L2) {
+			hw_res->qos_cfg_has_cpu_scope = true;
 			r->cache.arch_has_sparse_bitmasks = true;
-			r->cache.arch_has_per_cpu_cfg = true;
 			r->cache.min_cbm_bits = 0;
 		} else if (r->rid == RDT_RESOURCE_MBA) {
 			hw_res->msr_base = MSR_IA32_MBA_BW_BASE;
diff --git a/arch/x86/kernel/cpu/resctrl/internal.h b/arch/x86/kernel/cpu/resctrl/internal.h
index e3cfa0c10e92..670ce9272b51 100644
--- a/arch/x86/kernel/cpu/resctrl/internal.h
+++ b/arch/x86/kernel/cpu/resctrl/internal.h
@@ -125,6 +125,9 @@ struct msr_param {
  * @mon_scale:		cqm counter * mon_scale = occupancy in bytes
  * @mbm_width:		Monitor width, to detect and correct for overflow.
  * @cdp_enabled:	CDP state of this resource
+ * @qos_cfg_has_cpu_scope:	Only for the L2 and L3 resources: true if
+ *				MSR_IA32_L{2,3}_QOS_CFG has CPU scope, false if
+ *				the scope matches the associated cache.
  * @mbm_cntr_assign_enabled:	ABMC feature is enabled
  * @sdciae_enabled:	SDCIAE feature (backing "io_alloc") is enabled.
  *
@@ -140,6 +143,7 @@ struct rdt_hw_resource {
 	unsigned int		mon_scale;
 	unsigned int		mbm_width;
 	bool			cdp_enabled;
+	bool			qos_cfg_has_cpu_scope;
 	bool			mbm_cntr_assign_enabled;
 	bool			sdciae_enabled;
 };
diff --git a/arch/x86/kernel/cpu/resctrl/rdtgroup.c b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
index 5ffa39fa86fa..6e4eeccd4891 100644
--- a/arch/x86/kernel/cpu/resctrl/rdtgroup.c
+++ b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
@@ -131,6 +131,7 @@ static void l2_qos_cfg_update(void *arg)
 
 static int set_cache_qos_cfg(int level, bool enable)
 {
+	struct rdt_hw_resource *hw_res;
 	void (*update)(void *arg);
 	struct rdt_ctrl_domain *d;
 	struct rdt_resource *r_l;
@@ -151,8 +152,9 @@ static int set_cache_qos_cfg(int level, bool enable)
 		return -ENOMEM;
 
 	r_l = &rdt_resources_all[level].r_resctrl;
+	hw_res = resctrl_to_arch_res(r_l);
 	list_for_each_entry_rcu(d, &r_l->ctrl_domains, hdr.list, lockdep_is_cpus_held()) {
-		if (r_l->cache.arch_has_per_cpu_cfg)
+		if (hw_res->qos_cfg_has_cpu_scope)
 			/* Pick all the CPUs in the domain instance */
 			for_each_cpu(cpu, &d->hdr.cpu_mask)
 				cpumask_set_cpu(cpu, cpu_mask);
diff --git a/include/linux/resctrl.h b/include/linux/resctrl.h
index 66dc9813c888..b6b4519a5190 100644
--- a/include/linux/resctrl.h
+++ b/include/linux/resctrl.h
@@ -215,8 +215,6 @@ struct rdt_l3_mon_domain {
  * @shareable_bits:	Bitmask of shareable resource with other
  *			executing entities
  * @arch_has_sparse_bitmasks:	True if a bitmask like f00f is valid.
- * @arch_has_per_cpu_cfg:	True if QOS_CFG register for this cache
- *				level has CPU scope.
  * @io_alloc_capable:	True if portion of the cache can be configured
  *			for I/O traffic.
  */
@@ -225,7 +223,6 @@ struct resctrl_cache {
 	unsigned int	min_cbm_bits;
 	unsigned int	shareable_bits;
 	bool		arch_has_sparse_bitmasks;
-	bool		arch_has_per_cpu_cfg;
 	bool		io_alloc_capable;
 };
 
-- 
2.56.0

