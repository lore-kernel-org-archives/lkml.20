Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.225
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792503799;
	b=5Ut2/5QvvMRppkM7hDc68JXU0pOZpM9tcBzff2aMzSHzZAqui2X3WEqkQaCwJqzu2y2s
	 dVjFiLMMfJCeutDXuNDbnvY+z4ti1F60AdutNKK8oF3ayD5UfaZ0P741KsRt+6c9H1jQT
	 lSSOInq+vWc6hpU+F0KrFdE/tYs7rjlGQ6E0bXjam0VI3qZleEDq2odFTIBzAgctl41/Z
	 K3aWWNDIDZafMhr3uCYc8hTyc+15Kr7Z1ta6TnoTgdxDiyeHMgRPX+9xPR6Xp9vXA48Du
	 GboK/D27j564G5DIPswm1RIh2FUEevPyhnVpkIQ2ShoxztfjMaHam88BUWpTYBwR0vg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792503799;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:From:To:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=gh/ssZU1ZxA2lNKA+/oaCPlLUEBr+9t05sqZ/nZxsBw=;
	b=AsAqEcHLjBz83fCiqZCAz+W1xPNO2mFzqg6NUw1vKH2SNxK2mRNuiQPvEcQ6cWcPpiuz
	 e3FW3Npw7BE3XH43PWLSVQMYpQL73+Pi5Wh+BBGH6BfFZynfT0mPhqYwzRljNz5+I8ngf
	 28hmDD+nR6qX6SnuEwlxSSPxh+X1q/s+30mvE6cEEtWWnc69WVe9quntg293i7SuPO39q
	 2L4ZFfRt2Fh8XsyUEI5mx0e3y0bhywnejMsViSp8KrUnKY6+jTH1TEzMdMLsiLLZeUViE
	 ZU1oFFY6CUCkX4DTwX5t3CwmQGxxskxtBUQBnvIfeMPl4bARGnWkbdNFIZAOUTvmEEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=IkXwdVLG;
	arc=none smtp.remote-ip=113.46.200.225
Received: from canpmsgout10.his.huawei.com (canpmsgout10.his.huawei.com [113.46.200.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B318606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 13:43:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8B318606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=IkXwdVLG
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=gh/ssZU1ZxA2lNKA+/oaCPlLUEBr+9t05sqZ/nZxsBw=;
	b=IkXwdVLG0sDBKrmS8NYxmOsyDtFxxe0YEyPflIxED2fwd1O/VJjVUT96yAVrV7ysZYab1CQwj
	HOqeECoyWddbCkrFb3hAp+mgz5gl3ubf/Jj/aW+2gK3c3LLLElb4+CKS6gmm6X9iUJRWn7LbTlN
	s1LU9k+NEE8W4Uk/pxZ2Eyw=
Received: from mail.maildlp.com (unknown [172.19.163.15])
	by canpmsgout10.his.huawei.com (SkyGuard) with ESMTPS id 4j8DBf5Bnzz1K98D;
	Tue, 20 Oct 2026 21:43:06 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 3573C40586;
	Tue, 20 Oct 2026 21:43:10 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 20 Oct
 2026 21:43:09 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <tony.luck@intel.com>, <reinette.chatre@intel.com>, <Dave.Martin@arm.com>,
	<james.morse@arm.com>, <babu.moger@amd.com>, <tglx@kernel.org>,
	<mingo@redhat.com>, <bp@alien8.de>, <dave.hansen@linux.intel.com>,
	<hpa@zytor.com>, <ben.horgan@arm.com>, <fenghuay@nvidia.com>,
	<ruanjinjie@huawei.com>, <tan.shaopeng@fujitsu.com>, <zengheng4@huawei.com>,
	<jic23@kernel.org>, <gshan@redhat.com>, <catalin.marinas@arm.com>,
	<x86@kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v10 RESEND 00/15] arm_mpam: Introduce Narrow-PARTID feature
Date: Tue, 20 Oct 2026 21:42:24 +0800
Message-ID: <20261020134239.3921377-1-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
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
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
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

- Patches 1-6: bugfixes found by sashiko or while testing this series
- Patches 7-9: Preparatory helpers, no functional change
- Patch 10: Track internal and request PARTID limits per class
- Patches 11-12: Driver-side modulo interleaving + flat global RMID
- Patches 13-14: Identify non-aliasing controls; enable the narrowing
- Patch 15: KUnit tests for the narrow-PARTID helpers

Testing
========

Verified on both QEMU and real Hisi hardware:

- Narrowing expands monitoring groups from 4 to 256:

      [ 62.602939] mpam:mpam_resctrl_configure_partids: PARTIDs: monitor=256 closid=32 extra=1
      [ 63.788467] MPAM enabled with 256 PARTIDs and 4 PMGs

- KUnit: narrow-PARTID helper tests pass.

QEMU branch: https://github.com/ruanjinjie-eng/qemu/tree/mpam
Test cases: https://github.com/ruanjinjie-eng/mpam_testcase

v10 -> v10 RESNED:
- Resend because of SMTP rate limiting.

Changes since v9
- Compatibility with Narrow PARTID and CDP mode
- Fix several sashiko reported issues:
  - Return -EBUSY when a CLOSID's RMIDs are only in limbo
  - Skip the monitor-context allocation on the force-free limbo path
  - Return an correct error pointer from resctrl_arch_mon_ctx_alloc() 
    on failure.
  - Widen the PARTID reset loop counter to u32 to fix the 65536 wrap.
- Fix MPAM enable issue when a MSC fails to probe (e.g. nr_cpus= clipping
  the possible CPUs).
- Add KUnit tests for the narrow-PARTID helpers.
- Link to v9: https://lore.kernel.org/all/20261012082337.822258-1-ruanjinjie@huawei.com/

Link: https://sashiko.dev/#/patchset/20261012082337.822258-1-ruanjinjie%40huawei.com

Previous Versions
=================

    v9: https://lore.kernel.org/all/20261012082337.822258-1-ruanjinjie@huawei.com/
    v8: https://lore.kernel.org/all/20260413085405.1166412-1-zengheng4@huawei.com/
    v7: https://lore.kernel.org/all/20260317132141.1272506-1-zengheng4@huawei.com/
    v6: https://lore.kernel.org/all/20250222112448.2438586-1-zengheng4@huawei.com/
    v5: https://lore.kernel.org/all/20250217031852.2014939-1-zengheng4@huawei.com/
RFC-v4: https://lore.kernel.org/all/20250104101224.873926-1-zengheng4@huawei.com/
RFC-v3: https://lore.kernel.org/all/20241207092136.2488426-1-zengheng4@huawei.com/
RFC-v2: https://lore.kernel.org/all/20241119135104.595630-1-zengheng4@huawei.com/
RFC-v1: https://lore.kernel.org/all/20241114135037.918470-1-zengheng4@huawei.com/

Jinjie Ruan (13):
  fs/resctrl: Return -EBUSY when per-CLOSID RMIDs are in limbo
  fs/resctrl: Skip monitor context allocation when force-freeing RMIDs
  arm_mpam: Fix error return in resctrl_arch_mon_ctx_alloc()
  arm_mpam: Fix infinite PARTID reset loop when 65536 PARTIDs are
    supported
  arm_mpam: Don't stall MPAM enable when an MSC fails to probe
  fs/resctrl: Add resctrl_arch_rmid_idx_match() helper
  arm_mpam: resctrl: Add resctrl_closid_rmid_to_partid_pmg() helper
  arm_mpam: Add a helper to check a PARTID is in a CLOSID
  arm_mpam: Track the PARTID and internal PARTID limits per class
  arm_mpam: Divide the PARTIDs between the control groups
  arm_mpam: Identify the non-aliasing controls
  arm_mpam: Use the request PARTIDs beyond the internal range
  arm_mpam: resctrl: Add kunit tests for narrow PARTID helpers

Zeng Heng (2):
  fs/resctrl: Unmount resctrl with the CDP state it was mounted with
  arm_mpam: Map resctrl RMIDs onto the request PARTIDs

 arch/x86/include/asm/resctrl.h      |   6 +
 drivers/resctrl/.kunitconfig        |   4 +
 drivers/resctrl/mpam_devices.c      | 160 ++++++++--
 drivers/resctrl/mpam_internal.h     |  25 ++
 drivers/resctrl/mpam_resctrl.c      | 227 +++++++++++---
 drivers/resctrl/test_mpam_resctrl.c | 466 ++++++++++++++++++++++++++++
 fs/resctrl/monitor.c                |  36 ++-
 fs/resctrl/rdtgroup.c               |  46 ++-
 include/linux/arm_mpam.h            |   1 +
 9 files changed, 889 insertions(+), 82 deletions(-)
 create mode 100644 drivers/resctrl/.kunitconfig

-- 
2.34.1

