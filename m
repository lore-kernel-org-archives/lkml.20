Received: from out162-62-57-137.mail.qq.com (out162-62-57-137.mail.qq.com [162.62.57.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 723673FD121
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 07:35:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.57.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792395306; cv=none; b=foWohYRs8sBkeDqQ1mvtO+SK+2PtIvF1ygIYDzUNvLWvDjpr2V6EiDYbmG11k8+iebE8hdMHvI2KDXx89YLDCeWGdx/LN/hUKIt4GbaaKIkkZYCjxhREnRT0YgfD1+0ul47I80DPoQbIWRqQY3IPw3vw4xnadkLfyEwrsfoW6O0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792395306; c=relaxed/simple;
	bh=q5aZ0melIzE9mhL056GyRJu4C+QdS0Qdc3/5soWT1qs=;
	h=Message-ID:From:To:Subject:Date:MIME-Version; b=S2CuoxvSlTvq7Y0Q6o1gvbXGaUjrLt0NTvSTHlB/Aaz+mR6PRygxMcG2FfSv4Q/26mLi8kIqk5FThumTEwTnpa6Dsh/DLJnR71PWbK1nuHoxRxCeSwNxTaFHgfXee9KzIam7jN/hzsgdySnoYp+acyax5yU+J7NWtJ8+8/Nvz6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=nRj8ZZLY; arc=none smtp.client-ip=162.62.57.137
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="nRj8ZZLY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1792395299; bh=9UDHKbqYbpf8/BK90dATBVHlGJkmg6mQf2DHAZPULQc=;
	h=From:To:Subject:Date;
	b=nRj8ZZLYi6hXU+wUVOaUF74LkaKFEul1h8alyFNgLuw4LLjBdG6/z2+PtPhta1llc
	 a7LnGStcsCErAOXmosmC4FgKZVxGHeZbJ1/mKMjsLS0Fg7BRKfGcQZl474ZNXx9SvF
	 23x7oIwMqJwmGltHK+4eBUHSOInrb3fcH3uBDd78=
Received: from r00799764-ThinkCentre-M920t-N000.. ([139.159.170.67])
	by newxmesmtplogicsvrsza73-0.qq.com (NewEsmtp) with SMTP
	id 8B707E35; Mon, 19 Oct 2026 15:34:55 +0800
X-QQ-mid: xmsmtpt1792395295tmrrn530i
Message-ID: <tencent_28FE31D80A7A9AEEC43B22D0AD8894E30C06@qq.com>
X-QQ-XMAILINFO: NT7dO8ok7FP2A9UjVF1IoFq26oLI7iBEPZxddDtU9ECt/ouyytkT6h4Bxb60tB
	 LVquDw4XkzPAXnhdFHsz6kyTZO0VS9CQpSLmCRQjVrVCZeWvVugqufKhisGG9Ng3X3+gSuQ94Jdn
	 2p7FGozRloNE8N/6LqrafnZT06B+KZP2lx1dqy9Evg34gXkr2mkxpcRqhsVouChsvIzGKZ+Z/Ld5
	 uTowkTgtj5/Ie7p7Rm+Xqa6ZhXvMiuF6FNS1h4xpKovKKdY6b+glvFlf8D24iCCxTK56ic2+N3iO
	 G/V/2iDJw33X1VyxRqU1HDBMCoGO85khWXLgyykBILkt02G7mEzO2UDlrdq8m9MSmwBZKudOdKMM
	 IzVnwatnXmdVumeDOU/XB3QSBH5/vnqEMAV9GPsua2t5CmSIfhoAQAY3c7ycTwf2+6SHtQRPAOQ7
	 BOzBEmdZkBANK70GjuY5WH09WtLFmOuBE+5+jyTwHuMf4H3O3+BQ/0ntcOh0nJMaQpOLVvHuvjR8
	 hfctD/bUow5XrmHYxs3VAgEvLyXJnHc16eH0MZqsPOgO4p6hHoAdTvk6ZDzBADIf4QYu9tV7E8gF
	 sUKO61LP87uONpjpJ1GupC2YRaWUngKp+jMLfTQ+50sO/q+iwLQ/icaDseBRz4WNm059k/qsDAEY
	 WS4iIMzF1CUC4TTyNK3ehVfqOsVlV8kEGVN6C+h1rqOxwBbu+sLs7I0lIhJK9eeIpz0dZ+iZwWFI
	 +0Q50zjuDTG4wYsDen+U6rHb6kvayD1kb4AThgo7QxINZE5n83S/Rhhr9w7PWjHQJFmjzEt//hzo
	 YTjofsyVIYXtqO6MLoWIQE0LtfvWDwc/XCFYOciMpangKyHy2UHnxebJi5kqIsLS/keDJj/kWnBJ
	 RBR2foRe443m15CERHdFRPHfl/zsautnEYyduvgUMsApb7okB0aYissdrKHSV5wuLH/T/jPwV+li
	 nVz3UMWfMznQFoSQU8RrOmC90rbKfAYMzATYudG5xW3d0Sd1ta2lw37RDlZf6eZi7/Q64icyHTx3
	 Tv3X7TcJmfSYSGYHa1ylxY8+cbUS6VglV4NDw8aXJ2jutxyicTqrHeqS5XfGU=
X-QQ-XMRINFO: MPJ6Tf5t3I/ylTmHUqvI8+Wpn+Gzalws3A==
From: Jinjie Ruan <2118537295@qq.com>
To: babu.moger@amd.com,
	ben.horgan@arm.com,
	bp@alien8.de,
	catalin.marinas@arm.com,
	dave.hansen@linux.intel.com,
	Dave.Martin@arm.com,
	fenghuay@nvidia.com,
	gshan@redhat.com,
	hpa@zytor.com,
	james.morse@arm.com,
	jic23@kernel.org,
	mingo@redhat.com,
	reinette.chatre@intel.com,
	ruanjinjie@huawei.com,
	tan.shaopeng@fujitsu.com,
	tglx@kernel.org,
	tony.luck@intel.com,
	zengheng4@huawei.com,
	x86@kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v10 00/15] arm_mpam: Introduce Narrow-PARTID feature
Date: Mon, 19 Oct 2026 15:33:26 +0800
X-OQ-MSGID: <20261019073453.2142856-1-2118537295@qq.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jinjie Ruan <ruanjinjie@huawei.com>

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

Changes since v9
=================
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
2.43.0

