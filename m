Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8BB9455633
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 14:56:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789657003; cv=none; b=IWnVXnpjWAKTsPcsKRaPsjodqSwPlLjsnEoP9YbspyDbfdQtC5xjM5tRiEAyhp9w68gMLawBb92L5uCOHstjZ5sNY4EWspnvbJB/U2pRXvoPq6TGvDmt3Zy3B6+qqCyIeDd1iS6wX0fqepnEIOu3HzdC2hQ/CpMp/iUx2Qefhcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789657003; c=relaxed/simple;
	bh=UlfYCYycte1SlkVFGS+bwo/YWoItPAwqibIilpenqSs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=J2xEWYk3CxM3GKa1AJQjEx4SIovJZrj0nfXVDyLSKmFCcAr2x8M6lJnYSLLkBCGLn+8gRAGzCoJmPAAWOdopfmwCFJLEXl3oFeyoc2/12PR2X2Zl46ruvLcnTDjjFD0pPun3QI5yTFU+l7/c8KtCygYRONBqaqzZ6EKkWMSgF+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=Yi1m0CYf; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="Yi1m0CYf"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 638A01476;
	Thu, 17 Sep 2026 07:56:23 -0700 (PDT)
Received: from e134344.cambridge.arm.com (unknown [10.2.212.8])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id ABD443F86F;
	Thu, 17 Sep 2026 07:56:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789656986; bh=UlfYCYycte1SlkVFGS+bwo/YWoItPAwqibIilpenqSs=;
	h=From:To:Cc:Subject:Date:From;
	b=Yi1m0CYfX33TJp4EM+7/ZfAxcHRmYpzuZFLIlzis7vm0jKuSKFzIBGH4l+GsxArob
	 kyQmHVFgcLnXWyIYCK9L1vtlLs9lFDx89IGDU7f3dl86ByxiTJ4Rr6WKowCPgK4Kqx
	 CiZFUpyWF6QgBSIGq1XoMtHOR+yf+pWSrNBHLrtw=
From: Ben Horgan <ben.horgan@arm.com>
To: ben.horgan@arm.com
Cc: james.morse@arm.com,
	reinette.chatre@intel.com,
	fenghuay@nvidia.com,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	dave.martin@arm.com,
	andre.przywara@arm.com
Subject: [PATCH v2 00/12] arm_mpam: minor fixes at v7.2
Date: Thu, 17 Sep 2026 15:56:05 +0100
Message-ID: <20260917145617.2202986-1-ben.horgan@arm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Despite the subject this is still relevant at v7.3.  This series
addresses a few minor issues in the driver.  Since v1 I've added an
extra patch at the end to fix a leak and reworked the mbwu save/restore
fixes to avoid races by dropping the mon_sel lock in the middle.

Changelogs in patches

Based on v7.3-rc2

Ben Horgan (12):
  arm_mpam: Move MPAMF_ECR write helpers to allow reuse
  arm_mpam: Restore the error interrupt enable from mpam_cpu_online()
  arm_mpam: Set mpam_feat_msmon_mbwu_31counter when there are bandwidth
    counters
  arm_mpam: Add missing mon_sel locking in MBWU save and restore
  arm_mpam: Ensure MBWU counters are reset on restore
  arm_mpam: Use __ris_msmon_read() for saving MBWU state
  arm_mpam: Initialize all of struct mon_read in
    mpam_restore_mbwu_state()
  arm_mpam: resctrl: Correct check that existing class is L3
  arm_mpam: resctrl: Make read_mon_cdp_safe() self consistent
  arm_mpam: Don't loop forever if there is the maximum possible amount
    of PARTIDs
  arm_mpam: Switch to kvzmalloc_objs() for allocation of component cfg
  arm_mpam: resctrl: Don't stop early when tearing down a class

 drivers/resctrl/mpam_devices.c | 161 ++++++++++++++++++++-------------
 drivers/resctrl/mpam_resctrl.c |  13 +--
 2 files changed, 103 insertions(+), 71 deletions(-)

-- 
2.43.0

