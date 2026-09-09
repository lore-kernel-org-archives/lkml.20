Received: from lgeamrelo07.lge.com (lgeamrelo07.lge.com [156.147.51.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEC2457D221
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 16:30:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.147.51.103
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788971461; cv=none; b=Xr1sxGngq8sDMLmTyQW6UqXMduvXQTrVW1g+YDBhavE42jRRYGzkGzeaCP/elYPH8XGDphUWcIiiXSlVD2XepYMcg5FR2aE+3wBXQhFqFjS7cEOfKU7L0qb6j83H1kLv7/6K4Tc8CSkklLAhbIOGtnZF9rInLuaMqCtmnlDKjJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788971461; c=relaxed/simple;
	bh=NlFIY403TF6AJ41p0j3XuErakct9AdDUfqZs5k1ztR0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=kKR0oegG3YaBBd8AzS5zo+pmHu0/4qjl6SIwZDDVkrXdN6MixGfLoFnV5hKmh85tWCSoHcVAPvPOFS8QITD1pGpJJsh9wFWCWeWT4OTET7Nx9dfRmicW52rNCnkc4mNdZG9lsoPV0rOQwBdM168WY/Fs0rloXgb8nOwwyngKdh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lge.com; spf=pass smtp.mailfrom=lge.com; arc=none smtp.client-ip=156.147.51.103
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lge.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lge.com
Received: from unknown (HELO yjaykim-PowerEdge-T330.lge.net) (10.177.112.156)
	by 156.147.51.103 with ESMTP; 10 Sep 2026 01:15:55 +0900
X-Original-SENDERIP: 10.177.112.156
X-Original-MAILFROM: youngjun.park@lge.com
From: Youngjun Park <youngjun.park@lge.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Chris Li <chrisl@kernel.org>,
	Kairui Song <kasong@tencent.com>,
	Kemeng Shi <shikemeng@huaweicloud.com>,
	Nhat Pham <nphamcs@gmail.com>,
	Baoquan He <baoquan.he@linux.dev>,
	Barry Song <baohua@kernel.org>,
	Youngjun Park <youngjun.park@lge.com>,
	her0gyugyu@gmail.com,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/2] mm/swap: skip empty clusters in the swapoff scan
Date: Thu, 10 Sep 2026 01:15:50 +0900
Message-Id: <20260909161552.2335971-1-youngjun.park@lge.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

find_next_to_unuse() walks a swap device one offset at a time.  Slot
state now lives in a per cluster swap table, so patch 2 dismisses an
empty cluster with one counter read instead of SWAPFILE_CLUSTER table
reads.

Patch 1 is an unrelated one line comment fix noticed on the way.

A debug test confirmed the skip path runs, and swapoff completed
under load with no DEBUG_VM or lockdep splats.

Changes in v4:
- 2/2: put the measured swapoff times in the changelog (Andrew)
- 2/2: pick up Kairui's Acked-by and Baoquan's Reviewed-by
- Rebased on mm-new
- Link to v3: https://lore.kernel.org/r/20260806193228.458685-1-youngjun.park@lge.com

Changes in v3:
- 2/2: clamp the scan end with min_t() so it stops at si->max, rather
  than running into the masked tail of the last cluster, which drops the
  need to explain why walking that tail was safe (Barry)
- 2/2: compute ci_off only where it is used
- 1/2, 2/2: pick up Barry's Reviewed-by
- Rebased on mm-new
- Link to v2: https://lore.kernel.org/r/20260805141146.127776-1-youngjun.park@lge.com

Youngjun Park (2):
  mm/swap: fix stale comment on swap_info_struct::cluster_info
  mm/swap: scan by cluster in find_next_to_unuse()

 include/linux/swap.h |  2 +-
 mm/swapfile.c        | 43 ++++++++++++++++++++++++++++++-------------
 2 files changed, 31 insertions(+), 14 deletions(-)


base-commit: 0bffe67ab8a72b3725cc31c4b525709bd3a3e223
-- 
2.48.1

