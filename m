Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0474F485949
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 16:06:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789142782; cv=none; b=DrCGUiJk6mOJ3Kje/AqQEAI7l23zRpJAcBe7WR/vm2/7HwO3mTW9az1g7Yd2bMZ8LHfio4y4Dyu+jyVgXxAvq6XEH9EAjwlaTECiH6eEe7K+xEtSEGe8ylavgugK+ThgG8isLXUwz5kxKcvS7L6XfTXGCmcyJGlfzIVkb80rz9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789142782; c=relaxed/simple;
	bh=Hu4Jwo6y6RyJS/RkEDcFfPOQNAAIHAmz55w8vjnwnog=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RLQ/elTQ90llVwiSnDbylXK0pTGp8Nvv6hGGuitMFPYdYtWZqyNehUVCS06edujtA0W1T0bhC5igVtM7+Oknc8NtNQikkn5/BJ36TBQg5lOVyODfXCrbUvzi1OuoS9X+APQsAqbG+X7opoSTR4+6e3xgFoaJ2nyDsfQ8fr9EqNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=ZK1jn3on; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="ZK1jn3on"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9713D16F2;
	Fri, 11 Sep 2026 09:06:16 -0700 (PDT)
Received: from e134344.cambridge.arm.com (e134344.arm.com [10.2.212.8])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id C648E3F7B4;
	Fri, 11 Sep 2026 09:06:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789142780; bh=Hu4Jwo6y6RyJS/RkEDcFfPOQNAAIHAmz55w8vjnwnog=;
	h=From:To:Cc:Subject:Date:From;
	b=ZK1jn3onzBOrVFk94N9YkepQsZYzBBb9DwVxcoS7spnuNAnj7VjaaNijqGJzk3qdV
	 icTOcZoIkXBYhgPOgl3I47vzjOJWdxonyjv1stzIlQcRke5mpSrP9vg50UK3IWzuiI
	 00in/KmLz2YNbEu6jaOdaC1EbF5dk0a8Jm25OY6s=
From: Ben Horgan <ben.horgan@arm.com>
To: ben.horgan@arm.com
Cc: tony.luck@intel.com,
	reinette.chatre@intel.com,
	x86@kernel.org,
	Dave.Martin@arm.com,
	james.morse@arm.com,
	babu.moger@amd.com,
	fenghuay@nvidia.com,
	bp@alien8.de,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] fs/resctrl: Allocate rmid_ptrs[] using kvzalloc_objs()
Date: Fri, 11 Sep 2026 17:06:08 +0100
Message-ID: <20260911160608.1091121-1-ben.horgan@arm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On an MPAM system the number of entries in rmid_ptrs[] is the number of PARTIDs
multiplied by the number of PMGs. The maximum possible number of PARTIDs is
0x10000 and the maximum number of PMGs is 0x100. On a system pushing the limits
of the MPAM specification this can be large enough to consistently fail the
kzalloc_objs() allocation and hence fail to mount the resctrl filesystem.

Switch to allocating rmid_ptrs[] using kvzalloc_objs() so that large allocations
fall back to vmalloc().

Fixes: 264c285999fc ("arm_mpam: resctrl: Add monitor initialisation and domain boilerplate")
Signed-off-by: Ben Horgan <ben.horgan@arm.com>
Reviewed-by: Tony Luck <tony.luck@intel.com>
---
I found this by testing the extremes of a software model and don't expect this
to effect real systems.
---
 fs/resctrl/monitor.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/resctrl/monitor.c b/fs/resctrl/monitor.c
index 73413cb128ea..2d7df60973d1 100644
--- a/fs/resctrl/monitor.c
+++ b/fs/resctrl/monitor.c
@@ -979,7 +979,7 @@ int setup_rmid_lru_list(void)
 		return 0;
 
 	idx_limit = resctrl_arch_system_num_rmid_idx();
-	rmid_ptrs = kzalloc_objs(struct rmid_entry, idx_limit);
+	rmid_ptrs = kvzalloc_objs(struct rmid_entry, idx_limit);
 	if (!rmid_ptrs)
 		return -ENOMEM;
 
@@ -1010,7 +1010,7 @@ void free_rmid_lru_list(void)
 		return;
 
 	mutex_lock(&rdtgroup_mutex);
-	kfree(rmid_ptrs);
+	kvfree(rmid_ptrs);
 	rmid_ptrs = NULL;
 	mutex_unlock(&rdtgroup_mutex);
 }
-- 
2.43.0

