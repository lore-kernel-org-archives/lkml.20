Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 716D93546E9
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 03:39:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790566769; cv=none; b=IlO6L3kdGKnUc1+ov6E+wUPS5Ks1roa1PEC9IJsSsQrIn2qNFVYCo770a4a/tyR9tV0zUDSe/nSzIubNjnEk1duvumDDwx5AC08J+FA7SeUHX0S3cDk9//8hlNvKAC88O3mKzI/ZbyaCTBFt6HWEjutJWFARUiTi2o1sQO4BOas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790566769; c=relaxed/simple;
	bh=RB4JJzRllkWjqZy9fXCi29s/pxpLcwx/ySDi/mBNaz0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cLwMTjOqkABHE+GURvpok6nYiId50MGTzDL20IENoaiERV9c5qtZIwBjUcAhKjfpDvsVIePsv8n35w/F+A8q/svpQgoldu6PiT8R7kDbli+DKE99SGRtatNkmIZe3q+B6/Kk8q0h+e/61tn8WJMJEkiJ2O11KXjBs+CQeswvlIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HXIoIwin; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HXIoIwin"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790566768; x=1822102768;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=RB4JJzRllkWjqZy9fXCi29s/pxpLcwx/ySDi/mBNaz0=;
  b=HXIoIwinYdnZz+c796r1SSj11YsiErKaW7yoLyxYBwy6SzO14Or7qKLb
   aJzj15Yx/cHclEdO90fke0LYheQQmUJrPcE77E3FKOW8BvYmWSWnFjAg7
   4m31G/eEgNlHdijqmXYDp5EmiVsKdYKlwWg1QnB84nI1JfksFAAaYdOXr
   DqSms3PzWQTK3k7wQt3abJF6cG8C9s7NGn0M2ryimpQbLVXzxNPOmwouQ
   si2cpbgtBhXvEBjCR5pBywAOhuKqZerJT97t8BRqp5uB5PBfZn7i+5+XG
   q5GtYXf1MVJeDAPVOghYhFi9pm+9kykAzRrhsAmXjgP1cBdL/9Adba764
   A==;
X-CSE-ConnectionGUID: xw62oYbUSgWpRdMdeLJcyw==
X-CSE-MsgGUID: 85StlzKQQiqmuv+eGSa/Rw==
X-IronPort-AV: E=McAfee;i="6800,10657,11918"; a="101917220"
X-IronPort-AV: E=Sophos;i="6.27,127,1787036400"; 
   d="scan'208";a="101917220"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2026 20:39:27 -0700
X-CSE-ConnectionGUID: QQxYfvW9RWW9IB4qb5S03Q==
X-CSE-MsgGUID: 3CK5fP+8RAOJONflRQlJsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,127,1787036400"; 
   d="scan'208";a="283004107"
Received: from allen-box.sh.intel.com ([10.239.48.101])
  by fmviesa005.fm.intel.com with ESMTP; 27 Sep 2026 20:39:25 -0700
From: Lu Baolu <baolu.lu@linux.intel.com>
To: Joerg Roedel <joro@8bytes.org>
Cc: Guanghui Feng <guanghuifeng@linux.alibaba.com>,
	Zhenzhong Duan <zhenzhong.duan@intel.com>,
	iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 7/9] iommu/vt-d: Fix iopf refcount leak in nested attach
Date: Mon, 28 Sep 2026 11:27:20 +0800
Message-ID: <20260928032722.2868623-8-baolu.lu@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260928032722.2868623-1-baolu.lu@linux.intel.com>
References: <20260928032722.2868623-1-baolu.lu@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

intel_nested_attach_dev() takes an iopf reference for the new domain but
does not drop the possible reference from the old domain. This leaks
info->iopf_refcount, can keep the device permanently on the iopf queue,
and later triggers WARN_ON(info->iopf_refcount) when PRI is disabled.

Fix this by dropping the possible reference from the old domain after
the nested translation setup completes.

Fixes: 17fce9d2336d9 ("iommu/vt-d: Put iopf enablement in domain attach path")
Signed-off-by: Lu Baolu <baolu.lu@linux.intel.com>
Reviewed-by: Kevin Tian <kevin.tian@intel.com>
---
 drivers/iommu/intel/nested.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/iommu/intel/nested.c b/drivers/iommu/intel/nested.c
index 2b979bec56ce..f84fc8b41fde 100644
--- a/drivers/iommu/intel/nested.c
+++ b/drivers/iommu/intel/nested.c
@@ -59,6 +59,8 @@ static int intel_nested_attach_dev(struct iommu_domain *domain,
 	if (ret)
 		goto disable_iopf;
 
+	iopf_for_domain_remove(old, dev);
+
 	info->domain = dmar_domain;
 	info->domain_attached = true;
 	spin_lock_irqsave(&dmar_domain->lock, flags);
-- 
2.43.0

