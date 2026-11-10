Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794284359;
	b=4GB3WlDfuUYGYyH1D/c78KgZb0i4I5EUlvsmgv4aOLY68FsIv3ZtOa68cschV//Hysjj
	 Ger1BsbiNPGM/+DbPvQe9yoQvi1ykGzlXycHq18zex1iU5zKc4NVyAbj6VQbtgsNOfJd+
	 SuEFiagcq6HUYEWh/vMrpES0QglM5sVehhnfaLDRZ6JTNa0Ieo0Y+/h7Q2bHNXAlVNRu2
	 Od2VrgfuOVPD8BAAirGDl/C2bbMEZTiBSSGiefqp+0cWN8f4rCkqExgo1tvohmYXJdGi6
	 dWkParLTij+KIsaZVad0zr/R8KQVaLZ/+ONXd/vq0gQgjZUucSI/QqW4I4QwcsrhbPw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794284359;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=D6I+9mOh63hZoFlVcPImYCerGlblTsLsV4DNO+WiNiQ=;
	b=5GbXcVtaO69L8wmUffZA+kBE1Jmj8OYn7jJONVc5z7xeyhjYKr+yBtNSMgnWw1vr2yX+
	 fmqy+3BfvBeZQGGDMKvrLBHzXSZ/MnqjPLHitMtlH0gVG5rD1EO0saW3nobTfiQ2QYxgq
	 Zind38+LwkmZORWLu5hhI9QbY7EUXP8mCbNkJ1KuJQkwS7QZRWFJ5TSuDjZWNY0Y2dLDx
	 3IcwW95NFb2LiSmNBgLRJa5gysWLQIMdQYZkg+mCd8MzVMhHyGSXNaNp4AtF+9oS/F4nt
	 OA4T4Tz755HjZ7HRvcC/I/4zEhFQ8AyCdbq/1l8PurBDmBG4eqT+QQ4oeLMX6xCPBpA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=bxEOLT6z;
	arc=none smtp.remote-ip=192.198.163.9
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF66F606A321
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 04:19:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AF66F606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=bxEOLT6z
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794284356; x=1825820356;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=M1DlmdfP/qnqzTDgZw6h2TGWtbHGaNHnFQKtmH0THtY=;
  b=bxEOLT6zdBGGyLuXYgByQly6SSbQ4nGHpoP+3CTfb65vz47YKlicZJoQ
   yUeWqYSMokzJEZZUEO/24GpuwSoCDy1dSn2iJudQqptSZCfJwPhuauUdo
   qDe2Mugf/LWWIOBlVM83niJSN75xPh7oOzSBHKL+of+M67q9vRdH7/yzO
   w7XBgdpsLzx+tgJkSQbAym9ExV2Zpr5UhW/+icYfIwZXzwgUSPrPWUj+v
   SZTEg38X2Aq0bPFrVc45XjIDvqabuz8IdF/cXUAG03zVq7MU1u4tM0yWV
   0f3Y19ggNlsgjIDRXG9cjytyPerJu4bN656rX7sA+v/WG58sIPjkPzu8M
   Q==;
X-CSE-ConnectionGUID: szyAPMLUR1y0AufP3rpqdg==
X-CSE-MsgGUID: TpWWrttKQ9eUh7XrcLPMdw==
X-IronPort-AV: E=McAfee;i="6800,10657,11961"; a="2901278"
X-IronPort-AV: E=Sophos;i="6.27,205,1787036400"; 
   d="scan'208";a="2901278"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2026 20:19:14 -0800
X-CSE-ConnectionGUID: 203t+MEKTmimaDAVzZuetw==
X-CSE-MsgGUID: 6Q/XI7PzR9mFU4x8bWf6KA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,205,1787036400"; 
   d="scan'208";a="7856905"
Received: from rchatre-desk1.jf.intel.com ([10.165.154.99])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2026 20:19:14 -0800
From: Reinette Chatre <reinette.chatre@intel.com>
To: ben.horgan@arm.com,
	james.morse@arm.com,
	Dave.Martin@arm.com,
	fenghuay@nvidia.com,
	ruanjinjie@huawei.com
Cc: tony.luck@intel.com,
	yu.c.chen@intel.com,
	babu.moger@amd.com,
	fustini@kernel.org,
	tan.shaopeng@fujitsu.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	patches@lists.linux.dev,
	reinette.chatre@intel.com
Subject: [PATCH v3 0/8] arm_mpam: resctrl: Separate MPAM domains
Date: Mon,  9 Nov 2026 20:19:00 -0800
Message-ID: <cover.1794283825.git.reinette.chatre@intel.com>
X-Mailer: git-send-email 2.56.0
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

Thank you very much to Ben, Jinjie, and Shaopeng for reviewing and testing RFC v2.

Changes since RFC v2:
  - RFC v2: https://lore.kernel.org/lkml/cover.1792443633.git.reinette.chatre@intel.com/
  - Patch 1 is new. It adds find_mbwu_mon_comp() to replace the duplicate
    code found in resctrl_arch_cntr_read() and resctrl_arch_reset_cntr(),
    as suggested by Jinjie.
  - WARN when domain allocation fails. (Ben)
  - Squash three patches into the patches they build on. (Ben)
  - Move "Require a component for each monitoring event" ahead of the
    structure split so the check it adds precedes its first user.
  - Fix the mpam_resctrl_get_mon_domain_from_cpu() function comment that
    still referred to the control component.
  - Add tags from Jinjie and Ben.
  - Please see the individual patches for their detailed changelogs.

Changes since RFC v1:
  - RFC v1: https://lore.kernel.org/lkml/85ca29e89eacf12cfa7071249419e7cadb8f0691.1788220029.git.reinette.chatre@intel.com/
  - Give each type of domain its own structure instead of duplicating the
    shared one, set up each domain independently instead of undoing one
    domain when setting up the other fails, add additional verification
    checks.

The MPAM driver represents a resctrl domain with a single structure,
struct mpam_resctrl_dom, that holds both a control domain and a
monitoring domain. On a system that supports both allocation and
monitoring, one instance is created for each domain and its two
domains are added to the resource's control and monitoring domain
lists.

Holding both domains in one structure requires control and monitoring
to be done at the same scope, and ties each control domain to a
monitoring domain. This does not fit the proposed support for multiple
controls per resource [1]. There, each control of a resource, for
example a "min" and a "max" memory bandwidth control, has its own list
of control domains while the resource keeps a single list of
monitoring domains. With one structure for both, every control domain
would come with a monitoring domain of its own, which does not reflect
the resource.

This series gives control and monitoring domains their own structures,
set up and torn down independently as CPUs come online and go offline,
in preparation for supporting multiple controls per resource. Along
the way it stops failing CPU online when a domain cannot be set up,
and adds checks when setting up a monitoring domain.

  1     Share the lookup of the component counting an event
  2-3   Preparatory cleanups of domain allocation
  4     Do not fail CPU online when domain setup fails
  5-6   Preparation for separate domain structures
  7-8   Separate the control and monitoring domain structures

Transitioning this submission from RFC to PATCH after gaining more
confidence in the changes thanks to Jinjie and Ben's reviews and testing.

The series was rebased onto v7.4-rc2 since the for-next/mpam branch
of the arm64 tree does not exist at this time.

[1] https://lore.kernel.org/lkml/d258a32f-12d5-464d-abe9-4720fb3e44b3@intel.com/

Reinette Chatre (8):
  arm_mpam: resctrl: Add a helper to find the component counting an
    event
  arm_mpam: resctrl: Use find_component() when allocating a domain
  arm_mpam: resctrl: Rename ctrl_comp in mpam_resctrl_alloc_domain()
  arm_mpam: resctrl: Do not fail CPU online when domain setup fails
  arm_mpam: resctrl: Split control and monitoring domain setup into
    helpers
  arm_mpam: resctrl: Require a component for each monitoring event
  arm_mpam: resctrl: Give the monitoring domain its own structure
  arm_mpam: resctrl: Rename struct mpam_resctrl_dom to
    mpam_resctrl_ctrl_dom

 drivers/resctrl/mpam_devices.c  |   2 +-
 drivers/resctrl/mpam_internal.h |  11 +-
 drivers/resctrl/mpam_resctrl.c  | 384 ++++++++++++++++++--------------
 3 files changed, 220 insertions(+), 177 deletions(-)


base-commit: 7475ea8b58616b33c04afb976cf0fbaad9dd63fb
-- 
2.56.0

