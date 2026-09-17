Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B499A5A5131
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 14:56:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789657030; cv=none; b=trQklb1K52A6VUcaMeNzlVt5+MN5caU7NniaTwTQfWJtNtQp9QwcHiDfbp8cIDyK15pq/9Woq+BqqNzN/rwQ+F2Ele2lnA8LoNjBrYZ6o61E8do5V+htyDlLeVDXcD6VxfrvFZ3M1ngyinqxAywEF6+EFcE7upofDjWy5/zu8TY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789657030; c=relaxed/simple;
	bh=97Sj1papgKbZfZ9Y/oUn8Fq54WwKNnH1rTCLTp8yrc0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FTxloLPWKJkgSeFrqkA1P2xcCzNZOulJmkHent/saq503ZyzW3eI+nx9SXDLe2rILsW7lbXgLNMejMkX7R44fvuIRKccTVsmfgMihNa++t4oHV4KJ63Ej4fZ1NpWx47GRWkWSHTdRmRa1iN76II1UM5eSpvYDq5bIwFR/ucH0TA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=kowBOuii; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="kowBOuii"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4E3C0202C;
	Thu, 17 Sep 2026 07:56:42 -0700 (PDT)
Received: from e134344.cambridge.arm.com (unknown [10.2.212.8])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 6F22A3F86F;
	Thu, 17 Sep 2026 07:56:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789657005; bh=97Sj1papgKbZfZ9Y/oUn8Fq54WwKNnH1rTCLTp8yrc0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kowBOuiirP6gixi9Ls22o4QmnlevEKFEIlEOss2zXha4QR1mVBq/rWQhWSoFZGK2i
	 liqug7r55sox1O/nzcwTJfSnPs1QN/RzxqiDRI9MDcSIHIVYLJTalFQPjpnIuKRRGy
	 vSFk+P9tC76m8i2p97OB5SR+G/GVNqTTktsx8eOg=
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
Subject: [PATCH v2 11/12] arm_mpam: Switch to kvzmalloc_objs() for allocation of component cfg
Date: Thu, 17 Sep 2026 15:56:16 +0100
Message-ID: <20260917145617.2202986-12-ben.horgan@arm.com>
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

Each component cfg is sized by the size of a per-PARTID multiplied by the
number of PARTIDs. On a platform sized to push the limits of the
specification, the allocation using kzalloc_objs() will consistently
fail. Change to use kvzmalloc_objs() so that large allocations fall back to
vmalloc() based allocations.

Fixes: 09b89d2a72f3 ("arm_mpam: Allow configuration to be applied and restored during cpu online")
Signed-off-by: Ben Horgan <ben.horgan@arm.com>
Tested-by: Gavin Shan <gshan@redhat.com>
---
 drivers/resctrl/mpam_devices.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
index 10fc5168699b..d74292f8cdfd 100644
--- a/drivers/resctrl/mpam_devices.c
+++ b/drivers/resctrl/mpam_devices.c
@@ -157,7 +157,7 @@ static void mpam_free_garbage(void)
 		if (iter->pdev)
 			devm_kfree(&iter->pdev->dev, iter->to_free);
 		else
-			kfree(iter->to_free);
+			kvfree(iter->to_free);
 	}
 }
 
@@ -2692,7 +2692,7 @@ static int __allocate_component_cfg(struct mpam_component *comp)
 	if (comp->cfg)
 		return 0;
 
-	comp->cfg = kzalloc_objs(*comp->cfg, mpam_partid_max + 1);
+	comp->cfg = kvzalloc_objs(*comp->cfg, mpam_partid_max + 1);
 	if (!comp->cfg)
 		return -ENOMEM;
 
-- 
2.43.0

