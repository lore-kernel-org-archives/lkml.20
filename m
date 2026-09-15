Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79E6F41D131
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 10:31:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789468286; cv=none; b=TZ6es45v+P9uZwXjOA3x78lAizpY1ctcWawLaJy4/3Lf8+PWGeiJgD3Bg8+vIReGY9Y0xaOBGUutC8xvi8+PIJLJS+DdRu1d3qMSl22sqWtEoSH2SilMMVe7jD51vu726HWw7pGQurIralgFyCAEO3OOKSUstc4kn1ie91Qu4mI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789468286; c=relaxed/simple;
	bh=aaFgC+9c4woienxeGUxt0YF9gIshO6e7edOS2SBHRbo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=C0nsUe/F5biTzXwWqAAt0/Wrsejze/G9Jb2QZyzun2D74bk7vIftWodaM33FuF8vel66Ma7L0+6EyAsmdRStepJzFYI7jFY8Ox2sBEAAfN6i1RHJtyf1V8uO5/VWyhgY1vaeAzES4CEpEq3M9iHujeQvRYSCm4vXpmUVt1LjEIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=pF9Nr705; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="pF9Nr705"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 104ED1570;
	Tue, 15 Sep 2026 03:31:20 -0700 (PDT)
Received: from e134344.cambridge.arm.com (e134344.arm.com [10.2.212.8])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 560BB3F7B4;
	Tue, 15 Sep 2026 03:31:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789468283; bh=aaFgC+9c4woienxeGUxt0YF9gIshO6e7edOS2SBHRbo=;
	h=From:To:Cc:Subject:Date:From;
	b=pF9Nr705qRGy1MBgKUvoJOXmt3mc7jUDmMF5Hp3oVgv5HOKO8qvGlWs+It5iQnnMY
	 hSYVO/PEgMpLoO8ykQ61CC9At0//TX1FZGZWusyUlHpqqc1sTm3oBcPDr5ZKsjuCaw
	 q9BZWBdLT41PESercE1AFc0MIwsr0rgwZnv5vowU=
From: Ben Horgan <ben.horgan@arm.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	ben.horgan@arm.com
Cc: catalin.marinas@arm.com,
	will@kernel.org,
	james.morse@arm.com,
	reinette.chatre@intel.com,
	fenghuay@nvidia.com,
	Gavin Shan <gshan@redhat.com>,
	Yin Li <yin.li@oss.qualcomm.com>
Subject: [PATCH] MAINTAINERS: Use linux-arm-kernel list for the MPAM driver
Date: Tue, 15 Sep 2026 11:31:01 +0100
Message-ID: <20260915103101.1659477-1-ben.horgan@arm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As MPAM is an arm64 feature and patches mostly go via the arm64 maintainers
it may be reasonably expected that the MPAM driver uses the list-arm-kernel
list.

Make this official by adding the L: in MAINTAINERS.

Suggested-by: Gavin Shan <gshan@redhat.com>
Suggested-by: Yin Li <yin.li@oss.qualcomm.com>
Signed-off-by: Ben Horgan <ben.horgan@arm.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 6215fcb07770..2113a0051b52 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -18436,6 +18436,7 @@ M:	James Morse <james.morse@arm.com>
 M:	Ben Horgan <ben.horgan@arm.com>
 R:	Reinette Chatre <reinette.chatre@intel.com>
 R:	Fenghua Yu <fenghuay@nvidia.com>
+L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
 F:	drivers/resctrl/mpam_*
 F:	drivers/resctrl/test_mpam_*
-- 
2.43.0

