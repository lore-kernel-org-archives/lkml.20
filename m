Received: from mta0.migadu.com (out-133.mta0.migadu.com [91.218.175.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BD6A224AFA
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 00:33:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790987583; cv=none; b=dq1Fudf5MN2ysnyndT79/zaxHL6ppW/G5tQXMjMFoUYNWofTzDX3B2JZrmLs3Kl6GkhxEs3wlKSDnKLr9zeEsvBi1aXrcPeJBsu2IPcf+oqAZe9P4pa2rOOKn3dOVyDecpA5DX9aCGaQaB5Mbfz1jPdDvpIjwTg/tmBLULrq8QE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790987583; c=relaxed/simple;
	bh=5p0AfPZcAlee+os5Wf7yE2yb3mrR8CoDGuHU4LNbBvo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-type; b=BR49GtZUm4uqE/dvswGbf2lnk7OLyN0eG78hMsWFtFeDdxOYei5KlbTUcOl9z56sPFPc62z9SsAp+mq/Y19QDG2wFrEA8aXGOkVbxIC3Jo4XybmTe2gJc66sW/K6/xLrhev7d58Z9G2AfazBn3hWhrjTwwI+7hl6qzT7TrbKBtA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=linux.dev; arc=none smtp.client-ip=91.218.175.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Envelope-To: linux-kernel@vger.kernel.org
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta12.migadu.com with ESMTPS id fa0fdb0429ec55ec;
	Sat, 03 Oct 2026 00:32:59 +0000
X-Mizu-Trace-ID: fa0fdb0429ec55ec
X-Migadu-Flow: FLOW_OUT
From: Baoquan He <hebaoquan@kylinos.cn>
To: linux-mm@kvack.org
Cc: akpm@linux-foundation.org,
	chrisl@kernel.org,
	kasong@tencent.com,
	hannes@cmpxchg.org,
	nphamcs@gmail.com,
	baohua@kernel.org,
	youngjun.park@lge.com,
	yosry@kernel.org,
	shikemeng@huaweicloud.com,
	chengming.zhou@linux.dev,
	baoquan.he@linux.dev,
	david@kernel.org,
	linux-kernel@vger.kernel.org,
	kunwu.chan@gmail.com,
	klarasmodin@gmail.com,
	Baoquan He <hebaoquan@kylinos.cn>
Subject: [PATCH v4 10/14] mm, swap: require zswap for xswap devices
Date: Sat,  3 Oct 2026 08:31:32 +0800
Message-ID: <20261003003136.750633-11-hebaoquan@kylinos.cn>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261003003136.750633-1-hebaoquan@kylinos.cn>
References: <20261003003136.750633-1-hebaoquan@kylinos.cn>
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
Acked-by: Chris Li <chrisl@kernel.org>
---
 mm/swapfile.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/mm/swapfile.c b/mm/swapfile.c
index 0c8b716ec5ba..8c8e99ea403e 100644
--- a/mm/swapfile.c
+++ b/mm/swapfile.c
@@ -4504,6 +4504,10 @@ static int xswap_create(int prio)
 	    (prio < 0 || prio > SWAP_FLAG_PRIO_MASK))
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

