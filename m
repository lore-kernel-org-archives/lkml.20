Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E89A955820A
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 14:56:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789657016; cv=none; b=Fm2nuAx65U+pPfmaqziE6L/R7XjBFI/cL0kXo4LOeji6iFU1JvV5xJdmKzcYrP0/DBbVtenEuU4HFRJnqRTjQpOK4CIwFvZAtY3G2ZBg0I+nU7xA4h6oCxOfFjWmTDhfx8uJLAhRSTu8lBy0iDkPEhKB2HDUdcSk8ZDWznXUqSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789657016; c=relaxed/simple;
	bh=u2/TSWpxe41vfNNykjOzkfh2PggVplqWQaKV/Iwvjkg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZF+0kNG4/gZUWvuaMJgVlhFbqo6KnWtKw22ApW4MNk5okMKxei36UFIeyKEfNesF7y5jxJnxgim6UDgesK3sHdlCPFeDBmy0ga2ep3IgM7Hb7qSNaW0/IMEfLYBIfVzsdU2fnA5SPWy0nRQyEJXFTADk272sGNK0mFFOMaIvn7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=pJZTWcC3; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="pJZTWcC3"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 19E082008;
	Thu, 17 Sep 2026 07:56:37 -0700 (PDT)
Received: from e134344.cambridge.arm.com (unknown [10.2.212.8])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 3B9EB3F86F;
	Thu, 17 Sep 2026 07:56:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789657000; bh=u2/TSWpxe41vfNNykjOzkfh2PggVplqWQaKV/Iwvjkg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pJZTWcC3qLI4PbTSiaE1hVkqZ127fjuB9Cu9o6gfui5tmS5VuOINoyXH8rJzPlgvS
	 uya6HPBlvw76OVRkz445MJ4pj4PMRhoNSo7ewbx6gpTm0h5hQ+wYJ7pWaxA4d0pGI/
	 SccKbZ4S3fCJjL/ZZseRXMArTNVdFRETmhNXlNg8=
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
Subject: [PATCH v2 08/12] arm_mpam: resctrl: Correct check that existing class is L3
Date: Thu, 17 Sep 2026 15:56:13 +0100
Message-ID: <20260917145617.2202986-9-ben.horgan@arm.com>
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

The class used to back mbm_total_bytes can be either at the L3 or the
memory. If a platform had candidate classes at both the memory and the L3
then, as the check for whether the existing class is L3 or not in
counter_update_class() is broken, the class that will be chosen depends on
which order the classes are considered and so the probe order.

Fix the check.

Fixes: 1458c4f05335 ("arm_mpam: resctrl: Add support for csu counters")
Tested-by: Gavin Shan <gshan@redhat.com>
Signed-off-by: Ben Horgan <ben.horgan@arm.com>
---
 drivers/resctrl/mpam_resctrl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
index 9d223057953a..b825bd90d4bd 100644
--- a/drivers/resctrl/mpam_resctrl.c
+++ b/drivers/resctrl/mpam_resctrl.c
@@ -1076,7 +1076,7 @@ static void counter_update_class(enum resctrl_event_id evt_id,
 	struct mpam_class *existing_class = mpam_resctrl_counters[evt_id].class;
 
 	if (existing_class) {
-		if (class->level == 3) {
+		if (existing_class->level == 3) {
 			pr_debug("Existing class is L3 - L3 wins\n");
 			return;
 		}
-- 
2.43.0

