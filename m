Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14E63472081
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 08:54:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789462444; cv=none; b=YA3VZqwxBjJ928RQtdFFL0pZUm7Vjh1i55D7RTZlUUx8dgTeJXLHQrLXEu4OYa6eHkMtpy8LiNWpPiaKdq86jQsdX+ffg5U/tUBv5j/Vzlu34ASeRPD6SKqHrg0jy63D4gej64hLL0CwbVKHKJIquseZiWPw5BBzSV+l6VvHo6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789462444; c=relaxed/simple;
	bh=6ppER/FhGKQUjaGLUGS0FeykX6mRmwY4BKQi6oxX1fM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kxBax6cVoKSlY+NfNzfOveT1I593eohDoxmvjIyQowdOzT4iX2KVt0NE2ljDAUXW36h+AovIO4m5y+sDBubkWM7pZU69GCLbErhYC9m3btVVftb49yyWR6QBHHCbluCLORxhAvym+c1zMt3p40suffxymC6iKP/Kd+OLucwjR6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UEgQ0Rxa; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UEgQ0Rxa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789462442; x=1820998442;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=6ppER/FhGKQUjaGLUGS0FeykX6mRmwY4BKQi6oxX1fM=;
  b=UEgQ0Rxa9TI+Qpn+8XcrnpC8u9LapXpaSE53yMaZ1AvtFq6zgNKWtoqW
   sONkbMGgEMnTKV3A/JHqGW7vEaRDeAXF7E50taX9XghZL7TnEnvYr8a2h
   lxfAi8BC8ZhJPpuqw4oHIcgPrrxTuQWpqKsqsFLbw+5BBmkuOxSYkH09l
   Hvwe7xp4tsdjNyrG2nLTlLWWOFPun6Jd2aQlcbinIP08QUyc/33waaiaP
   FBUFoR1ulBAS1pMuLWFvJzh6C1tzcfX1MvY9VGX7yieTaW9DNzr4Qc6mc
   uH/uX4dpnpQT6PJJjIsinTbVi3HdWib+zFKs2nVvbFhQPozqeLin4Ydwc
   Q==;
X-CSE-ConnectionGUID: +upfX5YMQJK7OiKjkOhLFw==
X-CSE-MsgGUID: tiRDJdnDRJ+Jsr0rHJr3Jw==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="101168407"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="101168407"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2026 01:54:01 -0700
X-CSE-ConnectionGUID: itIHxcxMSFCqRs8jb4FMmQ==
X-CSE-MsgGUID: tZ8uQBBUR6OBo+uNqVyLtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="1290762"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa013.fm.intel.com with ESMTP; 15 Sep 2026 01:54:01 -0700
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 78C9199; Tue, 15 Sep 2026 10:53:59 +0200 (CEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: linux-kernel@vger.kernel.org
Cc: Andy Shevchenko <andy@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 1/1] resource: Replace open coded resource_overlaps()
Date: Tue, 15 Sep 2026 10:53:53 +0200
Message-ID: <20260915085353.3518153-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In iomem_map_sanity_check() a piece of code resembles the content of
the resource_overlaps(). Replace open coded piece with the call to
the existing helper.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 kernel/resource.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/kernel/resource.c b/kernel/resource.c
index 54d7199695fb..cfc1a00e86aa 100644
--- a/kernel/resource.c
+++ b/kernel/resource.c
@@ -1833,7 +1833,7 @@ __setup("reserve=", reserve_setup);
  */
 int iomem_map_sanity_check(resource_size_t addr, unsigned long size)
 {
-	resource_size_t end = addr + size - 1;
+	struct resource mem = DEFINE_RES_MEM(addr, size);
 	struct resource *p;
 	int err = 0;
 
@@ -1843,12 +1843,10 @@ int iomem_map_sanity_check(resource_size_t addr, unsigned long size)
 		 * We can probably skip the resources without
 		 * IORESOURCE_IO attribute?
 		 */
-		if (p->start > end)
+		if (!resource_overlaps(p, &mem))
 			continue;
-		if (p->end < addr)
-			continue;
-		if (PFN_DOWN(p->start) <= PFN_DOWN(addr) &&
-		    PFN_DOWN(p->end) >= PFN_DOWN(end))
+		if (PFN_DOWN(p->start) <= PFN_DOWN(mem.start) &&
+		    PFN_DOWN(p->end) >= PFN_DOWN(mem.end))
 			continue;
 		/*
 		 * if a resource is "BUSY", it's not a hardware resource
@@ -1859,8 +1857,8 @@ int iomem_map_sanity_check(resource_size_t addr, unsigned long size)
 		if (p->flags & IORESOURCE_BUSY)
 			continue;
 
-		pr_debug("resource sanity check: requesting [mem %pa-%pa], which spans more than %s %pR\n",
-			&addr, &end, p->name, p);
+		pr_debug("resource sanity check: requesting %pR, which spans more than %s %pR\n",
+			 &mem, p->name, p);
 		err = -1;
 		break;
 	}
-- 
2.50.1

