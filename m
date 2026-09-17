Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8380B55931E
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 14:56:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789657031; cv=none; b=C5sV4yRxy4uCXFskMQUpaMnE8qcNsmiidMag4O3MJw3TKZlk3DCVeVtzM84ULX/WyvyFb9wTajmj/zyi2g3qGEmdwt95bwrRbWqOquyr1rNZfe/JMZhvfQVudYI+drkFy+WGpa2Zc/p8OfOeK7WPb22uyif7uVSWxvP4M0ix2YE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789657031; c=relaxed/simple;
	bh=2W4vg8a0BH3+OFw+MBFW0cOa1L2xE5ZnqmXZrMtVPsM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cK9jfvjw+LWpuBgkeuyOK9PpxHQJg9lTaXhKszdSPOJMxiaIIn+6KkDPqiQeekXzYhRmXgjwyI+FOevdhA3icuuY7+Ivhz5MTO7mowj9hIIroVE/aekM7czKjLB+zK0uijSYquF51ERrMsQxNvNP8PmXlUaqNZyFKmgANUXAuzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=K/ADxr8L; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="K/ADxr8L"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CC574201B;
	Thu, 17 Sep 2026 07:56:38 -0700 (PDT)
Received: from e134344.cambridge.arm.com (unknown [10.2.212.8])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 01DEF3F86F;
	Thu, 17 Sep 2026 07:56:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789657002; bh=2W4vg8a0BH3+OFw+MBFW0cOa1L2xE5ZnqmXZrMtVPsM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=K/ADxr8LGT+NRfiYYQX71AUBp4ZCgJLxTOTedZnU/VYIV+CIdfFT+WhA5g/dNvuk4
	 9RMwKqogC2BGIKZWorYLLZyp76aB/b5FVWKrZT0BkFE8tZJQ+olUswpMXKNMcuM/L+
	 x517IB1+QrY84D3rFVuhCoYZjQuRA1LOq8q7Igcs=
From: Ben Horgan <ben.horgan@arm.com>
To: ben.horgan@arm.com
Cc: james.morse@arm.com,
	reinette.chatre@intel.com,
	fenghuay@nvidia.com,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	dave.martin@arm.com,
	andre.przywara@arm.com,
	Gavin Shan <gshan@redhat.com>
Subject: [PATCH v2 09/12] arm_mpam: resctrl: Make read_mon_cdp_safe() self consistent
Date: Thu, 17 Sep 2026 15:56:14 +0100
Message-ID: <20260917145617.2202986-10-ben.horgan@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260917145617.2202986-1-ben.horgan@arm.com>
References: <20260917145617.2202986-1-ben.horgan@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When read_mon_cdp_safe() is called with cdp_enabled equal to false then the
reading returned in val is the sum of the monitor values for the given
component. However, when cdp_enabled equal to true it is again the sum of
the monitor values but with the initial value of val also added. Both
resctrl_arch_cntr_read() and resctrl_arch_rmid_read() call
read_mon_cdp_safe() and are documented to return the val directly without
consideration of the older value.

 The val is always zeroed before read_mon_cdp_safe() is called except in
 __check_limbo() and __l3_mon_event_count_sum() but the latter is not
 relevant on MPAM systems.  The extra accumulation in __check_limbo() means
 when there are multiple RMIDs in limbo some of them may be marked dirty
 when they are already clean.

Change the cdp_enabled equals true case to match the false case and the
documentation of the resctrl arch hooks.

Fixes: fb56b29932ca ("arm_mpam: resctrl: Add resctrl_arch_rmid_read()")
Signed-off-by: Ben Horgan <ben.horgan@arm.com>
Tested-by: Gavin Shan <gshan@redhat.com>
---
Add fixes tag as actually fixes an issue (Sashiko)
Update commit message
---
 drivers/resctrl/mpam_resctrl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
index b825bd90d4bd..321741a702fe 100644
--- a/drivers/resctrl/mpam_resctrl.c
+++ b/drivers/resctrl/mpam_resctrl.c
@@ -497,7 +497,7 @@ static int read_mon_cdp_safe(struct mpam_resctrl_mon *mon, struct mpam_component
 		if (err)
 			return err;
 
-		*val += code_val + data_val;
+		*val = code_val + data_val;
 		return 0;
 	}
 
-- 
2.43.0

