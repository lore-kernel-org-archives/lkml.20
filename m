Received: from mta0.migadu.com (out-82.mta0.migadu.com [91.218.175.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27CFF4E80B5
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 10:21:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.82
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789554074; cv=none; b=E+zrSR8d0DdqIBqezlEDi5x1NuMJXJkG4vcJnWBt8ARBe7hNdpI1sq1zNSI9adfry2MnJY7c8n3nkHkSwEm5Xkq0afChYLwSBmAq2l4tgDos03LeRGm36bkRTA7u0Uni60bXK3JcugCjGv4IV6UmVRaM9jEbpE1oCizFGz6bluQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789554074; c=relaxed/simple;
	bh=Xxx7vgXehjWHffmM8VWQkI+0anpDGAKRQArL5+lVJp8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-type; b=s8hkQSyNKGmSriBalKOWmEiWWrdC7uKlT7rUi5R7OVzbGRkP5pV4YRr5X6HnjA7wt7VVmFgyuwJ3WG+IRM18ehm5ToiR2frEBOHKkDGn4T/54P6zm3vGDSnWHtJGCXqe6IGwlW61kGCZYg39JsC3V+/Vw5RkhAuw4SyQyMtRXBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=linux.dev; arc=none smtp.client-ip=91.218.175.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Envelope-To: linux-kernel@vger.kernel.org
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta12.migadu.com with ESMTPS id 0d5d1a8d72c58130;
	Wed, 16 Sep 2026 10:21:08 +0000
X-Mizu-Trace-ID: 0d5d1a8d72c58130
X-Migadu-Flow: FLOW_OUT
From: Baoquan He <hebaoquan@kylinos.cn>
To: linux-mm@kvack.org
Cc: akpm@linux-foundation.org,
	chrisl@kernel.org,
	kasong@tencent.com,
	nphamcs@gmail.com,
	baohua@kernel.org,
	youngjun.park@lge.com,
	hannes@cmpxchg.org,
	yosry@kernel.org,
	shikemeng@huaweicloud.com,
	chengming.zhou@linux.dev,
	baoquan.he@linux.dev,
	david@kernel.org,
	linux-kernel@vger.kernel.org,
	kunwu.chan@gmail.com,
	Baoquan He <hebaoquan@kylinos.cn>
Subject: [PATCH v3 11/14] mm, swap: require zswap for xswap devices
Date: Wed, 16 Sep 2026 18:19:18 +0800
Message-ID: <20260916101929.149106-12-hebaoquan@kylinos.cn>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260916101929.149106-1-hebaoquan@kylinos.cn>
References: <20260916101929.149106-1-hebaoquan@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit

xswap pages live only in zswap. Without zswap, swapout cannot free the page,
but still takes a swap entry. So the device consumes swap entries without
freeing memory. Fail to create a device when zswap is unavailable.

Signed-off-by: Baoquan He <hebaoquan@kylinos.cn>
---
 mm/swapfile.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/mm/swapfile.c b/mm/swapfile.c
index cdcbcbaa6d87..cac084bc72d6 100644
--- a/mm/swapfile.c
+++ b/mm/swapfile.c
@@ -4439,6 +4439,10 @@ static int xswap_create(int prio)
 	if (prio != DEF_SWAP_PRIO && (prio < 0 || prio > SWAP_FLAG_PRIO_MASK))
 		return -EINVAL;
 
+	/* xswap has no backing store, it relies on zswap. */
+	if (!zswap_is_enabled())
+		return -EOPNOTSUPP;
+
 	si = alloc_swap_info();
 	if (IS_ERR(si))
 		return PTR_ERR(si);
-- 
2.54.0

