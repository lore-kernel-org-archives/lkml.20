Received: from out30-124.freemail.mail.aliyun.com (out30-124.freemail.mail.aliyun.com [115.124.30.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1C6E463B6D
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 14:59:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787842764; cv=none; b=P/7YLoUwatqRkPP5xoGPW0wWVHW2FQTIYXcBbhCtZvI7ISNkVCy73IwrmII8EYqS8juDuBnexIQrVoDeG7gb64+dFcJR/TiLhrTBlcjzoioDtgxKSGuzecKf+LO1+yqXqY+sN0U6R1VLZJ+taEpbvdex5Z1h2Uv1A0HY68C8Wq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787842764; c=relaxed/simple;
	bh=xgfEDAcFQZfflkhPZaQFNKJGmLzmgZLoM1utNenIWUQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hnp4nvnT+gc63EHiI/TghMAt3YffbIj8apqAeWBiFxkem8gST9jXTR9Mc0Mlf0RmEx7R1NPTVKICH5rmnGPwaTJloCnuDSRh70I18NzsH52Oia14ZYja3BQkatfFX5T+vkYEulPMkPMLmdewZYd7glYAru4UlcLbSt259/Eiln0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=VPUDM8FB; arc=none smtp.client-ip=115.124.30.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="VPUDM8FB"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1787842758; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=PEe8lBDAvp55jm51MXuA6ryelSJqCtviWntdm+uy75A=;
	b=VPUDM8FBEgmt74IH95RdlNb5Ayme4u+e5BbOseofAX6gZUSFjB65hfROY1SjmjgP99LfVEN++KTi0InWBHqK8lM+xQrmHThhaJsMyKrJPoXUgIiEfbJ6NyQgwLuF1zwPODEOQFk6Vv7ptPqbZPeZROv9O5nqwJNoG4rIGaTLr2w=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R611e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037033178;MF=xiangzao@linux.alibaba.com;NM=1;PH=DS;RN=12;SR=0;TI=SMTPD_---0X9jzaGm_1787842756;
Received: from banye.tbsite.net(mailfrom:xiangzao@linux.alibaba.com fp:SMTPD_---0X9jzaGm_1787842756 cluster:ay36)
          by smtp.aliyun-inc.com;
          Thu, 27 Aug 2026 22:59:17 +0800
From: Yuanhe Shu <xiangzao@linux.alibaba.com>
To: joro@8bytes.org,
	will@kernel.org,
	jgg@ziepe.ca
Cc: robin.murphy@arm.com,
	baolu.lu@linux.intel.com,
	kevin.tian@intel.com,
	smostafa@google.com,
	praan@google.com,
	skhawaja@google.com,
	iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Yuanhe Shu <xiangzao@linux.alibaba.com>
Subject: [PATCH 2/2] iommupt: Drop pagealloc references during domain deinit
Date: Thu, 27 Aug 2026 22:58:55 +0800
Message-ID: <20260827145855.1616223-3-xiangzao@linux.alibaba.com>
X-Mailer: git-send-email 2.43.7
In-Reply-To: <20260827145855.1616223-1-xiangzao@linux.alibaba.com>
References: <20260827145855.1616223-1-xiangzao@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since commit b948a8722848 ("iommu: Fix up map/unmap debugging for
iommupt domains") iommu_map() takes an IOMMU_DEBUG_PAGEALLOC reference
for every page it maps into a generic_pt domain, and those references
are only dropped by the IOVA based unmap path.  When a domain is freed
while mappings are still installed, pt_iommu_deinit() releases the page
table memory without dropping them, so every mapped page stays counted
as IOMMU-mapped after it returns to the buddy allocator and each later
allocation or free of it reports:

    WARNING: drivers/iommu/iommu-debug-pagealloc.c:91 at __iommu_debug_check_unmapped+0x4e/0x70, CPU#0: init/1
    iommu: Detected page leak!

Freeing a domain with mappings still installed is not driver misuse:
the deinit contract in include/linux/generic_pt/iommu.h only requires
the table to be removed from HW access and caches, with no requirement
to unmap first, and the kunit suite itself frees domains with live
mappings in pt_kunit_iommu_exit().

Set a debug_unmap flag in the deinit collect args and have
__collect_tables() drop the reference of every OA leaf it destroys,
symmetric to how iommu_map() created them.  Since the flag is only set
when the sanitizer is enabled, the !pt_can_have_table() fast path is
unaffected when it is off.  This uses the __iommu_debug_unmap_phys()
helper added by the previous patch, which any backport of this fix
needs as well.

Verified with the generic_pt kunit suite as an in-tree reproducer:
running the x86_64 format's test_pgsize_boundary() with
iommu.debug_pagealloc=1 on a machine with enough RAM for its
hard-coded OA 0x208b95d000 to be online memory, then allocating and
freeing most of memory, produces 64 page leak WARNINGs unpatched - one
for each of the 32 mapped pages on both its allocation and free - and
none with this patch.

Fixes: b948a8722848 ("iommu: Fix up map/unmap debugging for iommupt domains")
Signed-off-by: Yuanhe Shu <xiangzao@linux.alibaba.com>
---
 drivers/iommu/generic_pt/iommu_pt.h | 22 +++++++++++++++++++---
 1 file changed, 19 insertions(+), 3 deletions(-)

diff --git a/drivers/iommu/generic_pt/iommu_pt.h b/drivers/iommu/generic_pt/iommu_pt.h
index 07ec2b3ab986..f4b02894f1c4 100644
--- a/drivers/iommu/generic_pt/iommu_pt.h
+++ b/drivers/iommu/generic_pt/iommu_pt.h
@@ -14,6 +14,7 @@
 #include <linux/export.h>
 #include <linux/iommu.h>
 #include "../iommu-pages.h"
+#include "../iommu-priv.h"
 #include <linux/cleanup.h>
 #include <linux/dma-mapping.h>
 
@@ -379,6 +380,8 @@ struct pt_iommu_collect_args {
 	struct iommupt_pending_gather pending;
 	/* Fail if any OAs are within the range */
 	u8 check_mapped : 1;
+	/* Drop the IOMMU_DEBUG_PAGEALLOC references of any OAs in the range */
+	u8 debug_unmap : 1;
 };
 
 static int __collect_tables(struct pt_range *range, void *arg,
@@ -388,7 +391,8 @@ static int __collect_tables(struct pt_range *range, void *arg,
 	struct pt_iommu_collect_args *collect = arg;
 	int ret;
 
-	if (!collect->check_mapped && !pt_can_have_table(&pts))
+	if (!collect->check_mapped && !collect->debug_unmap &&
+	    !pt_can_have_table(&pts))
 		return 0;
 
 	for_each_pt_level_entry(&pts) {
@@ -400,8 +404,19 @@ static int __collect_tables(struct pt_range *range, void *arg,
 				return ret;
 			continue;
 		}
-		if (pts.type == PT_ENTRY_OA && collect->check_mapped)
-			return -EADDRINUSE;
+		if (pts.type == PT_ENTRY_OA) {
+			if (collect->check_mapped)
+				return -EADDRINUSE;
+			if (collect->debug_unmap) {
+				struct pt_iommu *iommu_table =
+					iommu_from_common(range->common);
+				size_t oasz = log2_to_int_t(size_t,
+						pt_entry_oa_lg2sz(&pts));
+
+				iommu_debug_unmap_phys(&iommu_table->domain,
+						       pt_entry_oa(&pts), oasz);
+			}
+		}
 	}
 	return 0;
 }
@@ -1162,6 +1177,7 @@ static void NS(deinit)(struct pt_iommu *iommu_table)
 	struct pt_common *common = common_from_iommu(iommu_table);
 	struct pt_range range = pt_all_range(common);
 	struct pt_iommu_collect_args collect = {
+		.debug_unmap = iommu_debug_pagealloc_enabled(),
 		.pending.free_list = IOMMU_PAGES_LIST_INIT(
 			collect.pending.free_list),
 	};
-- 
2.43.5

