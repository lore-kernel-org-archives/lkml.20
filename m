Received: from canpmsgout07.his.huawei.com (canpmsgout07.his.huawei.com [113.46.200.222])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF0CA457E7F
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 08:24:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.222
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791793490; cv=none; b=bD6USQRr9qYixH+Xhm/cqWpJxtBqm5lcHFd5m+mRr7WsdfLuB28endPRHHJbUvRNaCbUubE9X8BAYB+JLy58WlNY/QhVU36Rg71YGDY+HqiOo2p93TeKTLA8xkvMZgWmxvzPHwMWFI9uLww/DPKg+lfC+kKwoUj7JLoasXW28Uk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791793490; c=relaxed/simple;
	bh=s4htdynoZ1UMDZAZFZW72nnASWDMowqj/MxRfQ8u1AU=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Fopv9hOl7VzRmXN9Juba7MfdKdXwjI+7Nb3pUb3rFmxngh4sJzlLYnBqlIhCYC3SPHeQV3dDvH49VIUX0bk3SRpPKbwRQqr3en2sxrcToGUQfFbLdX2Lror1B1VvH8v/4zzKO/LJeiAqCxHcaCY97RZzFuTFjfUzC/kHYmVUepo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=zKjlP5U+; arc=none smtp.client-ip=113.46.200.222
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="zKjlP5U+"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=hwFBgOVqwDioWkcOXc4/+fUA/sRmkJcltB8qOe/0/zc=;
	b=zKjlP5U+wErJKv9nsY6jdmEcIyc9DevUvChmNsxGEVWJ5DwXwcw9RE6bsYceIdJU3FW5Tw/4b
	fcTpEeE4w3BxPyrXWZ0s0sivGHkFyB1Fsm+1WqUAxg0NQDF1GoDAJcYgVCDyjSQNnk2tgFDeP1L
	W2xv4k3V2UllvRtGwTb2ym4=
Received: from mail.maildlp.com (unknown [172.19.162.92])
	by canpmsgout07.his.huawei.com (SkyGuard) with ESMTPS id 4j39Dg1QZWzLlTC;
	Mon, 12 Oct 2026 16:12:19 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 4D1EC4058C;
	Mon, 12 Oct 2026 16:24:36 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 12 Oct
 2026 16:24:35 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <tony.luck@intel.com>, <reinette.chatre@intel.com>, <Dave.Martin@arm.com>,
	<james.morse@arm.com>, <babu.moger@amd.com>, <tglx@kernel.org>,
	<mingo@redhat.com>, <bp@alien8.de>, <dave.hansen@linux.intel.com>,
	<hpa@zytor.com>, <ben.horgan@arm.com>, <fenghuay@nvidia.com>,
	<x86@kernel.org>, <linux-kernel@vger.kernel.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH v9 0/9] arm_mpam: Introduce Narrow-PARTID feature
Date: Mon, 12 Oct 2026 16:23:28 +0800
Message-ID: <20261012082337.822258-1-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
 kwepemk200008.china.huawei.com (7.202.194.74)

Background
==========

In ARM MPAM, a monitoring group is defined by a (PARTID, PMG) pair.
However, many production platforms implement only a single PMG bit,
limiting the total number of monitoring groups long before the request
PARTID space is exhausted.

Hardware Mechanism
===================

Platforms with "PARTID narrowing" mitigate this by mapping multiple
request PARTIDs onto a single internal PARTID. The internal PARTID
dictates the control group configuration, while each individual request
PARTID functions as an independent monitoring group. This decouples
control and monitoring allocation, allowing more monitoring groups
than the PMG constraint normally permits.

Software Strategy
==================

Using request PARTIDs beyond the internal range is only safe when no MPAM
class loses a non-aliasing control. While aliasing controls (e.g., cache
portion bitmaps) can be safely replicated across request PARTIDs,
non-aliasing controls (e.g., cache capacity) are additive and cannot.

To ensure safety, this series implements a completely static grouping
policy evaluated once before resctrl_init(). If any class contains
non-aliasing controls without narrowing capabilities, the expansion
is bypassed. This infrastructure remains completely transparent
to user-space.

Patch Architecture
====================

- Patches 1-4: Bugfix and preparatory rework.

- Patch 5: Track both internal and request PARTID limits per class.

- Patches 6-7: Implement driver-side modulo interleaving for request
  PARTIDs and flat global RMID indexing.

- Patches 8-9: Identify non-aliasing controls, and enable the narrowing
  expansion by lifting driver-side partid_max clamping and freeing
  the extra request PARTIDs for resctrl.

Changes since v8
- Replaced dynamic allocation with pure static grouping as requested by James.
- Removed the 'mpam.intpartid_max' boot parameter; expansion is now automatic.
- Extended safety verification to all classes, preserving
  forward-compatibility for unknown classes that might gain resctrl
  schemas later.
- Decoupled the driver infrastructure patch from the resctrl glue patch.
- Introduced resctrl_arch_rmid_idx_match() to clean up the RMID allocator.
- Link to v8: https://lore.kernel.org/all/20260413085405.1166412-1-zengheng4@huawei.com/

Previous Versions
=================

    v7: https://lore.kernel.org/all/20260317132141.1272506-1-zengheng4@huawei.com/
    v6: https://lore.kernel.org/all/20250222112448.2438586-1-zengheng4@huawei.com/
    v5: https://lore.kernel.org/all/20250217031852.2014939-1-zengheng4@huawei.com/
RFC-v4: https://lore.kernel.org/all/20250104101224.873926-1-zengheng4@huawei.com/
RFC-v3: https://lore.kernel.org/all/20241207092136.2488426-1-zengheng4@huawei.com/
RFC-v2: https://lore.kernel.org/all/20241119135104.595630-1-zengheng4@huawei.com/
RFC-v1: https://lore.kernel.org/all/20241114135037.918470-1-zengheng4@huawei.com/

Jinjie Ruan (6):
  fs/resctrl: Add resctrl_arch_rmid_idx_match() helper
  arm_mpam: resctrl: Add resctrl_closid_rmid_to_partid_pmg() helper
  arm_mpam: Add a helper to check a PARTID is in a CLOSID
  arm_mpam: Track the PARTID and internal PARTID limits per class
  arm_mpam: Identify the non-aliasing controls
  arm_mpam: Use the request PARTIDs beyond the internal range

Zeng Heng (3):
  fs/resctrl: Unmount resctrl with the CDP state it was mounted with
  arm_mpam: Divide the PARTIDs between the control groups
  arm_mpam: Map resctrl RMIDs onto the request PARTIDs

 arch/x86/include/asm/resctrl.h  |   6 +
 drivers/resctrl/mpam_devices.c  | 105 +++++++++++++---
 drivers/resctrl/mpam_internal.h |  24 ++++
 drivers/resctrl/mpam_resctrl.c  | 213 +++++++++++++++++++++++++++-----
 fs/resctrl/monitor.c            |  13 +-
 fs/resctrl/rdtgroup.c           |  38 +++++-
 include/linux/arm_mpam.h        |   1 +
 7 files changed, 341 insertions(+), 59 deletions(-)

-- 
2.34.1

