Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 835A059E337
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 14:56:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789657037; cv=none; b=b2hmyhh4MnPKERVulR5gY+Ypz2Gr4QkfEDqyj3mzZ6ipqndoBz3+jpMw0YB8i0FKBMTYiIi5Xo0gUIrnTez8v+jTx2ZnBvFW+5r7KH0GUrmsBIBrVGrDH3mhYmrQ+XRw4HwZ+oqfA+wNPqFfECqGUJD/zT606TInFqTCmaalZDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789657037; c=relaxed/simple;
	bh=KXTRQ8B7NuAawelRtl9Xn3/aug9ykZjYKPq/c2H+xsk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ml+t9sWhBiyEMoZY4k5lmSWey3wUSQy9huAM4PVn7uZY779aJunvNtBfYo8GlXJ1spaQ0sjvfsZ6ZDBjL9yH7Crvk7ikVvkKRTMudzDy7yBTFQNacFF4Q4h6vaNnLZ8DbOQnBcD3gCZrvl6svMQZnvjQbu94eYeEfZssmiFGbmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=oPUjhHv+; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="oPUjhHv+"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0C1AF204C;
	Thu, 17 Sep 2026 07:56:44 -0700 (PDT)
Received: from e134344.cambridge.arm.com (unknown [10.2.212.8])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 3498B3F86F;
	Thu, 17 Sep 2026 07:56:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789657007; bh=KXTRQ8B7NuAawelRtl9Xn3/aug9ykZjYKPq/c2H+xsk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=oPUjhHv+ZnTx+s/GIzhBl8HFTp7A2OJXfiOf8PRsemafBk3jxN/BJL3O5/VRupQzP
	 sM/0n+Iw7M81TLFQq7DnHmf4vQ7J2uDd7mc/MqOYIPAYWKFI+tB8lMcS/qI93gce/S
	 DxZLgXcvdN0blyQDKgW5MX+YIBItWPP0KufNMBEc=
From: Ben Horgan <ben.horgan@arm.com>
To: ben.horgan@arm.com
Cc: james.morse@arm.com,
	reinette.chatre@intel.com,
	fenghuay@nvidia.com,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	dave.martin@arm.com,
	andre.przywara@arm.com,
	Sashiko <sashiko-bot@kernel.org>
Subject: [PATCH v2 12/12] arm_mpam: resctrl: Don't stop early when tearing down a class
Date: Thu, 17 Sep 2026 15:56:17 +0100
Message-ID: <20260917145617.2202986-13-ben.horgan@arm.com>
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

An MPAM class can back more than one control and more than one
monitor. mpam_resctrl_teardown_class() iterates through all the controls
but stops if it finds a match which means classes backing more than one
class aren't torn down. The same for monitors, in which case the mbwu
counters will be leaked.

Stop terminating the loops early.

As we are already changing mpam_resctrl_teardown_class() remove the
misleading comment. It doesn't call resctrl_exit() and isn't required to do
so as the only caller does it first.

Fixes: fb481ec08699 ("arm_mpam: resctrl: Call resctrl_init() on platforms that can support resctrl")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Signed-off-by: Ben Horgan <ben.horgan@arm.com>
---
Changes since v1:

New patch
---
 drivers/resctrl/mpam_resctrl.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
index 321741a702fe..9cec5843e8fa 100644
--- a/drivers/resctrl/mpam_resctrl.c
+++ b/drivers/resctrl/mpam_resctrl.c
@@ -1943,10 +1943,6 @@ static void mpam_resctrl_teardown_mon(struct mpam_resctrl_mon *mon, struct mpam_
 	mon->mbwu_idx_to_mon = NULL;
 }
 
-/*
- * The driver is detaching an MSC from this class, if resctrl was using it,
- * pull on resctrl_exit().
- */
 void mpam_resctrl_teardown_class(struct mpam_class *class)
 {
 	struct mpam_resctrl_res *res;
@@ -1957,17 +1953,14 @@ void mpam_resctrl_teardown_class(struct mpam_class *class)
 	might_sleep();
 
 	for_each_mpam_resctrl_control(res, rid) {
-		if (res->class == class) {
+		if (res->class == class)
 			res->class = NULL;
-			break;
-		}
 	}
 	for_each_mpam_resctrl_mon(mon, eventid) {
 		if (mon->class == class) {
 			mon->class = NULL;
 
 			mpam_resctrl_teardown_mon(mon, class);
-			break;
 		}
 	}
 }
-- 
2.43.0

