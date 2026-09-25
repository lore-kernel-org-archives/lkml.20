Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B2DF486410
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 09:35:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790328917; cv=none; b=mCsLh5auP3kCY+8sFzma22dpdNhCBPyV6iiEVEiDULd5XOSxq6XWq5buP5hf9wuWYafu/UvLFmo2LZAvT4/YjffYcvqzUd50cPRMih5NqhzphauwxVdN3Wq5/s3qJ0hHU9pXi0N92gSKu/8Iyr8Ul08eFIp487B/hnQdyLvDUJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790328917; c=relaxed/simple;
	bh=DDAoA13Z8+rHS9pPf8eE11524ZJOa7eHz1ryfQ2IOIc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=CuOSW31Ki0YkSyKRga7zUW1ubt5fltIvxMK6FDukbLE6Tx6dAewnTMzmUB8Q5lsDTtLQnSbGkfpBl1EyVRwv7Z9pkfiMbGhgf0ezgbRKSIeD1Tb2U8SZsBFesf30e46L46vRuYzYjDMWgVmm/+YvpvTowGa4FvhW1RbgDc7ogtw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YmWOf3lv; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YmWOf3lv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790328916; x=1821864916;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=DDAoA13Z8+rHS9pPf8eE11524ZJOa7eHz1ryfQ2IOIc=;
  b=YmWOf3lvSOWeKLNqDzsUVu80g0khTamVWfGJHpptMgc57SBwlZUu4zoe
   6n6lQmvrIVpwJOlkA3etGAyBvXKmhFaTeEFvvBY4BfZwurWL17Q9WsUE2
   v66vJ+YAu85eBu5I4qSXT1uVJXWuEG+QfmUG6VC7CcOFC2TXR49S6HLT4
   VcCyJGFuYbkSkzgjySvaYkWKCskOFNoNG27Qe+jS8v6+nZFsESGmAE70J
   ILDqWubU8MR6HMlsMRZzdy9hYOk8LoTKgZaEz8wHyI+SeMiNpj3eiIUzr
   7yEBVgqaE/NwjsmUsW+3SlLPRH4DwvDqDZugt9cmKRXk9kEwKHa3wXMo/
   A==;
X-CSE-ConnectionGUID: anUnaGp5RbqbdGmTv+hy3w==
X-CSE-MsgGUID: pFwAuO4GTYWzeGNLERIkGw==
X-IronPort-AV: E=McAfee;i="6800,10657,11915"; a="116640893"
X-IronPort-AV: E=Sophos;i="6.27,122,1787036400"; 
   d="scan'208";a="116640893"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2026 02:35:15 -0700
X-CSE-ConnectionGUID: o748zX7PTHK637eUrNQGBg==
X-CSE-MsgGUID: 0ijMl8OxRIai1FCC/5NBLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,122,1787036400"; 
   d="scan'208";a="272103426"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.0])
  by orviesa006.jf.intel.com with ESMTP; 25 Sep 2026 02:35:13 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: driver-core@lists.linux.dev,
	gregkh@linuxfoundation.org,
	rafael@kernel.org,
	dakr@kernel.org
Cc: linux-kernel@vger.kernel.org,
	dawid.osuchowski@linux.intel.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH] driver core: platform: Simplify platform_device_alloc()
Date: Fri, 25 Sep 2026 11:39:28 +0200
Message-Id: <20260925093928.3765486-1-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There is no need to double check the 'pa' object.

Reviewed-by: Dawid Osuchowski <dawid.osuchowski@linux.intel.com>
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 drivers/base/platform.c | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/drivers/base/platform.c b/drivers/base/platform.c
index b45d41b018ca..461ffcddad2c 100644
--- a/drivers/base/platform.c
+++ b/drivers/base/platform.c
@@ -620,16 +620,17 @@ struct platform_device *platform_device_alloc(const char *name, int id)
 	struct platform_object *pa;
 
 	pa = kzalloc(sizeof(*pa) + strlen(name) + 1, GFP_KERNEL);
-	if (pa) {
-		strcpy(pa->name, name);
-		pa->pdev.name = pa->name;
-		pa->pdev.id = id;
-		device_initialize(&pa->pdev.dev);
-		pa->pdev.dev.release = platform_device_release;
-		setup_pdev_dma_masks(&pa->pdev);
-	}
+	if (!pa)
+		return NULL;
 
-	return pa ? &pa->pdev : NULL;
+	strcpy(pa->name, name);
+	pa->pdev.name = pa->name;
+	pa->pdev.id = id;
+	device_initialize(&pa->pdev.dev);
+	pa->pdev.dev.release = platform_device_release;
+	setup_pdev_dma_masks(&pa->pdev);
+
+	return &pa->pdev;
 }
 EXPORT_SYMBOL_GPL(platform_device_alloc);
 
-- 
2.34.1

