Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CAE14A093D
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 13:57:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789999041; cv=none; b=RbR1PfwiSXG9F9yZu2gKLTGjYF49eQIfYFqOrifJzDqBKbNlb4xzOZdX8z7+xkc2BgWar5PMRdgOdCieqKQXlYwcLk3lavJVMViJNHNOFrPKoKfyXFPNDpWJFlvMexBkqVSvEgMnjV1ZO5qhmrVT80aZUQU+izkM4+/WgK2uF+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789999041; c=relaxed/simple;
	bh=krGY+lo9qL7tk8aDr46NS4pANsT7BmFp4RwLCfQW1jg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aLta/9h3k2bqJybLft9fS4/e+c1fGF06kbnH9WnwfM84Iu/2UwK4MoSu1XeQDkarj9LWvF9K9ld9jM98Jq1lgpbLjMHynB7LoBQj0ala/7QWE1Qy/Q6TyTB29Gmb1TFQIyBld8iMyrEIDlUOa5QvU4r7obHugJNnjhBv3eo/3+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=gCTtn60x; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="gCTtn60x"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A70431CE0;
	Mon, 21 Sep 2026 06:57:14 -0700 (PDT)
Received: from e134344.cambridge.arm.com (e134344.arm.com [10.2.212.8])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 5441A3F528;
	Mon, 21 Sep 2026 06:57:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789999038; bh=krGY+lo9qL7tk8aDr46NS4pANsT7BmFp4RwLCfQW1jg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gCTtn60xiCLsopErCXForjNfd4nDz79a05hzXCj07vZDqPSXJvsPu8pagkRgR0qPS
	 MUuodSstzZJ+pJSR7CVQoGFzzQ08UY9eWuak8aqvBJoH6JW/HZEcEoa3XVB76LHgzv
	 +uzF2BBkogQaXcnYcWO5pBjYqabUFW6vy6Ber4G0=
From: Ben Horgan <ben.horgan@arm.com>
To: reinette.chatre@intel.com
Cc: Dave.Martin@arm.com,
	babu.moger@amd.com,
	ben.horgan@arm.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	fenghuay@nvidia.com,
	fustini@kernel.org,
	james.morse@arm.com,
	linux-kernel@vger.kernel.org,
	peternewman@google.com,
	tglx@linutronix.de,
	tony.luck@intel.com,
	x86@kernel.org,
	yu.c.chen@intel.com
Subject: [RFC PATCH 3/3] fs/resctrl: display size for scalar cache controls
Date: Mon, 21 Sep 2026 14:57:02 +0100
Message-ID: <20260921135702.2874931-4-ben.horgan@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260921135702.2874931-1-ben.horgan@arm.com>
References: <d258a32f-12d5-464d-abe9-4720fb3e44b3@intel.com>
 <20260921135702.2874931-1-ben.horgan@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

resctrl allows controls specifying a minimum or maximum cache allocation
but does not display their sizes in the 'size' file.

Calculate the size of any scalar cache controls and add them to the 'size' file.

Signed-off-by: Ben Horgan <ben.horgan@arm.com>
---
 fs/resctrl/internal.h    |  4 ++--
 fs/resctrl/pseudo_lock.c |  2 +-
 fs/resctrl/rdtgroup.c    | 41 +++++++++++++++++++++++++++-------------
 3 files changed, 31 insertions(+), 16 deletions(-)

diff --git a/fs/resctrl/internal.h b/fs/resctrl/internal.h
index 4bd09b1541c7..119f702a4f1f 100644
--- a/fs/resctrl/internal.h
+++ b/fs/resctrl/internal.h
@@ -362,8 +362,8 @@ bool rdtgroup_cbm_overlaps(struct rdt_resource_final *f, struct rdt_ctrl_domain
 			   unsigned long cbm, int closid, bool exclusive,
 			   struct resctrl_ctrl *ctrl);
 
-unsigned int rdtgroup_cbm_to_size(struct rdt_resource *r, struct resctrl_ctrl *ctrl,
-				  struct rdt_ctrl_domain *d, unsigned long cbm);
+unsigned int rdtgroup_cache_ctrl_to_size(struct rdt_resource *r, struct resctrl_ctrl *ctrl,
+					 struct rdt_ctrl_domain *d, unsigned long ctrl_val);
 
 enum rdtgrp_mode rdtgroup_mode_by_closid(int closid);
 
diff --git a/fs/resctrl/pseudo_lock.c b/fs/resctrl/pseudo_lock.c
index 17b99a075eaf..36881491d074 100644
--- a/fs/resctrl/pseudo_lock.c
+++ b/fs/resctrl/pseudo_lock.c
@@ -255,7 +255,7 @@ static int pseudo_lock_region_init(struct pseudo_lock_region *plr)
 	ci = get_cpu_cacheinfo_level(plr->cpu, scope);
 	if (ci) {
 		plr->line_size = ci->coherency_line_size;
-		plr->size = rdtgroup_cbm_to_size(plr->f->res, ctrl, plr->d, plr->cbm);
+		plr->size = rdtgroup_cache_ctrl_to_size(plr->f->res, ctrl, plr->d, plr->cbm);
 		return 0;
 	}
 
diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
index deb47edb2e87..ab0d8d0454f6 100644
--- a/fs/resctrl/rdtgroup.c
+++ b/fs/resctrl/rdtgroup.c
@@ -1751,20 +1751,27 @@ static ssize_t rdtgroup_mode_write(struct kernfs_open_file *of,
  *
  * Return: Size (in bytes) of cache portion represented by CBM, 0 on failure.
  */
-unsigned int rdtgroup_cbm_to_size(struct rdt_resource *r, struct resctrl_ctrl *ctrl,
-				  struct rdt_ctrl_domain *d, unsigned long cbm)
+unsigned int rdtgroup_cache_ctrl_to_size(struct rdt_resource *r, struct resctrl_ctrl *ctrl,
+					 struct rdt_ctrl_domain *d, unsigned long ctrl_val)
 {
 	unsigned int size = 0;
 	struct cacheinfo *ci;
-	int num_b;
 
 	if (WARN_ON_ONCE(r->ctrl_scope != RESCTRL_L2_CACHE && r->ctrl_scope != RESCTRL_L3_CACHE))
 		return size;
 
-	num_b = bitmap_weight(&cbm, ctrl->bitmap.cbm_len);
 	ci = get_cpu_cacheinfo_level(cpumask_any(&d->hdr.cpu_mask), r->ctrl_scope);
-	if (ci)
+	if (!ci)
+		return size;
+
+	if (ctrl->type == RESCTRL_CTRL_BITMAP) {
+		int num_b;
+
+		num_b = bitmap_weight(&ctrl_val, ctrl->bitmap.cbm_len);
 		size = ci->size / ctrl->bitmap.cbm_len * num_b;
+	} else {
+		size = ci->size / ctrl->scalar.resolution * ctrl->scalar.scale * ctrl_val;
+	}
 
 	return size;
 }
@@ -1834,10 +1841,10 @@ static int rdtgroup_size_show(struct kernfs_open_file *of,
 			}
 			seq_printf(s, "%*s:", max_name_width,
 				   rdtgrp->plr->f->name);
-			size = rdtgroup_cbm_to_size(rdtgrp->plr->f->res,
-						    ctrl,
-						    rdtgrp->plr->d,
-						    rdtgrp->plr->cbm);
+			size = rdtgroup_cache_ctrl_to_size(rdtgrp->plr->f->res,
+							   ctrl,
+							   rdtgrp->plr->d,
+							   rdtgrp->plr->cbm);
 			seq_printf(s, "%d=%u\n", rdtgrp->plr->d->hdr.id, size);
 		}
 		goto out;
@@ -1863,11 +1870,19 @@ static int rdtgroup_size_show(struct kernfs_open_file *of,
 						ctrl_val = resctrl_arch_get_config(r, ctrl, d,
 										   closid,
 										   type);
-					if (r->rid == RDT_RESOURCE_MBA ||
-					    r->rid == RDT_RESOURCE_SMBA)
+					switch (r->rid) {
+					case RDT_RESOURCE_L3:
+					case RDT_RESOURCE_L2:
+						size = rdtgroup_cache_ctrl_to_size(r, ctrl, d,
+										   ctrl_val);
+						break;
+					case RDT_RESOURCE_MBA:
+					case RDT_RESOURCE_SMBA:
 						size = ctrl_val;
-					else
-						size = rdtgroup_cbm_to_size(r, ctrl, d, ctrl_val);
+						break;
+					case RDT_RESOURCE_PERF_PKG:
+						size = 0;
+					}
 				}
 				seq_printf(s, "%d=%u", d->hdr.id, size);
 				sep = true;
-- 
2.43.0

