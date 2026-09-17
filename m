Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0423759D63B
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 14:56:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789657010; cv=none; b=lQx9BloCXvE86Mq+kxvLv5GwdL7zTH4ryWwr4QkNkdskzmTgnCKe3cMBrC6cN05iw5uczkf5IKeIvXMZuBiyXY8lYVZQWYySS7wSXVYAPZROJvbUs31QZxxgfsX6zyA2A0dLPNzFY8INivWNmhmxFjKBwOxGEzD06gl8j224oOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789657010; c=relaxed/simple;
	bh=BOF7ChOk2hTz/uF1IrvSVSlzJ1TxdzunfQ+vnFOetvw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cJpaUCv0JS7ZOKv0dX4qVFVhWGPV3CBR2avMchOXEcx3gtaAQ94wOj7bY3YUcQWeUtmRQLEME8tkHn3YaaPzCDciWu2fIznLUb75zLRCBf1MyjPnb7p0kFpV2SI/NY+RPLUIzIsdbXNXzwSHbw7s9bNTMUKdpF4AeTLfduCG/FQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=nPxbo8ah; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="nPxbo8ah"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6EE551F37;
	Thu, 17 Sep 2026 07:56:28 -0700 (PDT)
Received: from e134344.cambridge.arm.com (unknown [10.2.212.8])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id B77843F86F;
	Thu, 17 Sep 2026 07:56:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789656992; bh=BOF7ChOk2hTz/uF1IrvSVSlzJ1TxdzunfQ+vnFOetvw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nPxbo8ahRo+UuzWnMO0orlrjGfjMXwWcLZ3pTnpejWNdcNf5M1Jz0ghziKLAqnU8t
	 V7/Zu0sOQMHVZsKz82FGKQc31O1kwmn8kCTTvvbUj7pCLSYYrB9FXonBiqJ30kUSKd
	 PZ0TVROBoNlrQbfNKC+UVTm3UE7tC/YhyjktynEs=
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
Subject: [PATCH v2 03/12] arm_mpam: Set mpam_feat_msmon_mbwu_31counter when there are bandwidth counters
Date: Thu, 17 Sep 2026 15:56:08 +0100
Message-ID: <20260917145617.2202986-4-ben.horgan@arm.com>
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

When MPAMF_MSMON_IDR.MSMON_MBWU is 1, MSMON_MBWU is present and has a VALUE
field of 31 bits. If additionally, MPAMF_MBWUMON_IDR.HAS_LONG is 1, then
MSMON_MBWU_L is also present and has a VALUE field of 44 or 63 bits as
indicated by MPAMF_MBWUMON_IDR.LWD. Hence, if there are memory bandwidth
counters then there are always 31 bit counters irrespective of whether
there also long counters.

Set the 31 bit bandwidth counter feature bit whenever there are bandwidth
counters.

Fixes: fdc29a141d63 ("arm_mpam: Probe for long/lwd mbwu counters")
Signed-off-by: Ben Horgan <ben.horgan@arm.com>
Tested-by: Gavin Shan <gshan@redhat.com>
---
 drivers/resctrl/mpam_devices.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
index 32bde94dfbc3..e349db525882 100644
--- a/drivers/resctrl/mpam_devices.c
+++ b/drivers/resctrl/mpam_devices.c
@@ -930,9 +930,9 @@ static void mpam_ris_hw_probe(struct mpam_msc_ris *ris)
 						mpam_set_feature(mpam_feat_msmon_mbwu_63counter, props);
 					else
 						mpam_set_feature(mpam_feat_msmon_mbwu_44counter, props);
-				} else {
-					mpam_set_feature(mpam_feat_msmon_mbwu_31counter, props);
 				}
+
+				mpam_set_feature(mpam_feat_msmon_mbwu_31counter, props);
 			}
 		}
 	}
-- 
2.43.0

