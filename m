Received: from mta0.migadu.com (out-128.mta0.migadu.com [91.218.175.128])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35E6E224234
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 06:30:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.128
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789281048; cv=none; b=XguYsnoJEAxTJfYVDMZOc9UNZ/hJW9CXug55CyCmG8bdEL3KfhkDp1wVPFBHS806VJ6X2YPI1t+mye4ueAjEcHmmtiWnZLP16bjI7sMf5QdEwdGH8yd8fxV6c9sAQcxQDOthDSZJViGWC6Lvozq4ZkQ/LvifyLz2mbyErfw/uRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789281048; c=relaxed/simple;
	bh=tkviB1Xr6gKX+N5mfDR9+eGqEl6HlQxt3rEWaXHjgNM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-type; b=kLQdqX7g5IrnU5uPiesjZ4dpFvgzIJqRNa4TBYbe0WGl9sbe7ArqEkmYusaTogaNqjJ2MzLqbZ45nTDNp31aWcTyIiQmpZ91SEtvFSeIlxE6TaVS1rB9AEqA/7oBzTL8lYdWkQQ16XD/hUws6BIUz+rWDY6DeVzhS/A49FvGcRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=linux.dev; arc=none smtp.client-ip=91.218.175.128
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Envelope-To: linux-kernel@vger.kernel.org
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta10.migadu.com with ESMTPS id 6431ec6c0f68c77b;
	Sun, 13 Sep 2026 06:30:42 +0000
X-Mizu-Trace-ID: 6431ec6c0f68c77b
X-Migadu-Flow: FLOW_OUT
From: Baoquan He <hebaoquan@kylinos.cn>
To: akpm@linux-foundation.org
Cc: hannes@cmpxchg.org,
	yosry@kernel.org,
	nphamcs@gmail.com,
	chengming.zhou@linux.dev,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	kasong@tencent.com,
	chrisl@kernel.org,
	Baoquan He <hebaoquan@kylinos.cn>
Subject: [PATCH] mm: zswap: return -ENOENT when the swap device is gone
Date: Sun, 13 Sep 2026 14:30:31 +0800
Message-ID: <20260913063031.1689420-1-hebaoquan@kylinos.cn>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit

zswap_writeback_entry() returns -EEXIST when get_swap_device() finds no
device.  -EEXIST is the shrinker's "page already in swap cache" signal,
which makes zswap_shrinker_scan() stop shrinking entirely.  A NULL
get_swap_device() instead means the device is being swapped off, so the
entry is simply stale.

Return -ENOENT so the shrinker skips the stale entry and keeps scanning.
Independent of xswap; affects all swap devices.

Signed-off-by: Baoquan He <hebaoquan@kylinos.cn>
Acked-by: Nhat Pham <nphamcs@gmail.com>
---
Note:
This is taken from xswap patchset. Nhat suggested this is a fix, should
be sent out independently.

 mm/zswap.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/zswap.c b/mm/zswap.c
index 37f34e406c8e..b9948d4657d2 100644
--- a/mm/zswap.c
+++ b/mm/zswap.c
@@ -998,7 +998,7 @@ static int zswap_writeback_entry(struct zswap_entry *entry,
 	/* try to allocate swap cache folio */
 	si = get_swap_device(swpentry);
 	if (!si)
-		return -EEXIST;
+		return -ENOENT;
 
 	mpol = get_task_policy(current);
 	folio = swap_cache_alloc_folio(swpentry, GFP_KERNEL, BIT(0), NULL, mpol,
-- 
2.54.0

