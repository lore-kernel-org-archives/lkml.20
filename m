Received: from mslow3.mail.gandi.net (mslow3.mail.gandi.net [217.70.178.249])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4A6936DA00
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 15:59:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.178.249
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791388786; cv=none; b=MmpsG8oL8vXCel7+dGdsoK9ptexY0Sw8dF/Acquz/1W7R4UBGGjktUSTu/ha4m9lK3GlaKkSJYpU4bxDXpIAEDx1gxy/syYrnGHjlICm8q4vZVaMM6jWYWZO2ngs+04nh2Kmo7m938KG876X2bHchZsdUPlG4sCUtlkJBjKSu2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791388786; c=relaxed/simple;
	bh=sBYV0MyBwqnggCo9VfrJLW1rVuXn8ykAdJE3xfG8pGI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OTwDJ2ObkJj3zOeGTNSgKErBHp+UzQ2oXYyWBA3oPDFhKhlVY3l/sA8RA3IXMTsKGZk3Jeu016PBotEuAb8+RUyvetTXnUIb6Km7Q23zYKn6nnvceFE1jip1tIAedT4Qp/f5tVnvyTIGyVz5u2oot9ky29Mwev7IiX+zovGNlaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr; spf=pass smtp.mailfrom=ghiti.fr; arc=none smtp.client-ip=217.70.178.249
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ghiti.fr
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::225])
	by mslow3.mail.gandi.net (Postfix) with ESMTP id 845CB5826F0
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 15:35:31 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 66A1E3ED21;
	Wed,  7 Oct 2026 15:35:13 +0000 (UTC)
From: Alexandre Ghiti <alex@ghiti.fr>
To: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Yosry Ahmed <yosry@kernel.org>,
	Nhat Pham <nphamcs@gmail.com>,
	Chengming Zhou <chengming.zhou@linux.dev>,
	Christoph Hellwig <hch@lst.de>,
	Chris Li <chrisl@kernel.org>,
	Kairui Song <kasong@tencent.com>
Subject: [PATCH 0/2] mm/zswap: batch the writeback IO
Date: Wed,  7 Oct 2026 17:34:42 +0200
Message-ID: <20261007153507.50715-1-alex@ghiti.fr>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: alex@ghiti.fr
X-GND-Cause: dmFkZTFIJ7nMxdQyOk2ongyJZFHaCsXczRmiXS2sZuP0SNTYc+PeIMd2hgsEcB/x1Ck2wNeZG1b4EYnKmfnFDTjp1WaMBVh48h2/qAxXDP+0wj8ky/7h5/JZB/rbv9e7eFW2pbOG34NQa0d8n8kkqPtCtE5kx1mvUQIkClxDvYTqfW+U4T6ueZneoEKpqnOhSkiEpD5iNSQzHVP7Vyn65ADAc3S8gVXhdLU55tCIcQ+ngA5Min64unHflQnDSheRBdVPDbGnkf7/A0BRTop9NX/jZR00PcVtLq/hS1XUwnZs9raRyS+jQxLXmQucxvAw5x9cJSe1blAq4ZkcecDnlc1om3MNgis8dViAIABKzZsTi4HmQqLLQSmMHzl8f3r+FMpKlWfRkCMXghj+eDbcoh1WHC7Q+WKzK3/KvylAFJAb9ZZ80EQekDixNx6FQWcUScyll3I0WQG5Ko+SUJcvyw9/WJag5wYE1VUPveoK66w/hSe6cCntwLaMceY4s1zig4Iau/YZROLEcLvWuB7FcCdVZ25W53s/RwWSpv8NTsJjM/5YvKl0CL4MAbBJpPe7GEC4R4iN71YTBFCiybNux827+pCvH5izXKMywyp9jSjOVNLC/nvGek+CHBG81gaVdSFcQ2rBq7pKtOKkAoPaXiXOCPhFf7jZVp395eBmiIaije2XWQ
X-GND-State: clean
X-GND-Score: -100

Since commit 8f29aa226f82 ("mm/swap: introduce struct swap_io_ctx"),
reclaim merges the swap writes of folios with consecutive slots into a
single bio, but zswap writeback still issues one IO per entry. Patch 1
makes each zswap LRU walk batch its writeback IO. Patch 2 plugs the
walk, so that the block layer can merge what the batch cannot.

Kernel build (defconfig, -j4) in a 600M memory.max cgroup with the zswap
shrinker enabled, swapping to an NVMe partition with iocost enabled,
next to a sibling fio random writer with 10 times its io.weight. Mean
+- stddev:

                                  before          after
  patch 1  build time (s)        2269 +- 50      2203 +- 62
           pages per request     1.08 +- 0.00    1.30 +- 0.02
  patch 2  build time (s)        2188 +- 45      2104 +- 75
           pages per request     1.30 +- 0.01    1.35 +- 0.02

Alexandre Ghiti (2):
  mm/zswap: batch the writeback IO of consecutive entries
  mm/zswap: plug the writeback IO of an LRU walk

 mm/zswap.c | 54 +++++++++++++++++++++++++++++++++++++++++++-----------
 1 file changed, 43 insertions(+), 11 deletions(-)


base-commit: 3fa97dbf7e37bff1e4dbe8bfd026c1b4a13e186e
-- 
2.53.0-Meta

