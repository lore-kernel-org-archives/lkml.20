Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=114.247.232.78
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793556034;
	b=xETEYO48hYI0TASXe3yLqJGgHrUsJLpHsoGPeHFuVXNd5JtHLHdmSO9ihdvLkBGWJQUY
	 TPR7g73VTamUA9R3fQgDjDPHhU6+dUfWPcAuAyHGPbkJV3Px4nX0iIWyr+QyG+gWNcn75
	 65NML/a/zcHvwNykG169LrGCuLYHZQIUA3+uZp3ANyzLoWbgQDBuV5ayQWyBEfgM0uB5D
	 CI++mDdh/ObraAFpz23cqfraa8sCjJvsSGLVFySpo2Au793CY9dm8OYB9rI5WzO0T6FMN
	 NYmOwiFH0fdPA5zU4BLPhMIXFivdAWjR84bK4TxUsaENb1+irvsIZYSilonsRPFRSMg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793556034;
	h=DMARC-Filter:Received:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=sQF5AaRAqJJwPNtFv8d82MWcPLAgvRqmvTygJZxjDWE=;
	b=qP/O1fOCaiH936OtRxP15DV8k0UFfiwOezDiuvnwqADK+XiTvd0e5fYmgH5pw6WNPwO5
	 aTOXllBJaFFdPzs3skR14IFufYMmBFaddv/11bFQ0PTi/S8HhtpemO/LrbNL/6iuJF7wE
	 MBCwkPvCH5K9ckkB/5GXJ6lhZdlm+BNQQJYpXRZJuPSlBDk9A1h/2JimYsOQmxVIzvMM1
	 dPEbPtvIvxKIuKUegrqj//2K3pcLlbDcLJU7q99aLPCqLQawbe5BJCzIW4FliJW2p42CB
	 DALYzzYa24gv4sSaazmZ4bSnyc+cfuQqX/wmhtSclLpjNHfNpePD/vqaV3cGt4Bx8zQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linx-info.com;
	spf=pass smtp.mailfrom=linx-info.com;
	arc=none smtp.remote-ip=114.247.232.78
Received: from mail.linx-info.com (mail.linx-info.com [114.247.232.78])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D7B7606A326
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 18:00:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8D7B7606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linx-info.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linx-info.com
Received: from localhost (localhost [127.0.0.1])
	by mail.linx-info.com (Postfix) with ESMTP id E2697321215;
	Mon,  2 Nov 2026 02:00:24 +0800 (CST)
Received: from mail.linx-info.com ([127.0.0.1])
	by localhost (mail.linx-info.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id n6jflpuqa_Xy; Mon,  2 Nov 2026 02:00:24 +0800 (CST)
Received: from DiGouShu (unknown [172.31.255.20])
	by mail.linx-info.com (Postfix) with ESMTPSA id 8498432116A;
	Mon,  2 Nov 2026 02:00:24 +0800 (CST)
From: Wang Guangke <gkwang@linx-info.com>
To: sj@kernel.org,
	akpm@linux-foundation.org
Cc: damon@lists.linux.dev,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Wang Guangke <gkwang@linx-info.com>
Subject: [PATCH] mm/damon/stat: avoid overflow in estimated_memory_bandwidth calculation
Date: Mon,  2 Nov 2026 02:00:01 +0800
Message-ID: <20261101180001.167198-1-gkwang@linx-info.com>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The calculation of estimated_memory_bandwidth computes
access_bytes * USEC_PER_MSEC * MSEC_PER_SEC / aggr_interval directly.
On 32-bit systems, the intermediate product
access_bytes * USEC_PER_MSEC * MSEC_PER_SEC may overflow before the
division is performed.

Fix it by splitting the division into quotient and remainder,
multiplying each part separately.

Fixes: fabdd1e911da ("mm/damon/stat: calculate and expose estimated
memory bandwidth")

Signed-off-by: Wang Guangke <gkwang@linx-info.com>
---
 mm/damon/stat.c | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/mm/damon/stat.c b/mm/damon/stat.c
index b05b68f73e10..7cfa3a8d6801 100644
--- a/mm/damon/stat.c
+++ b/mm/damon/stat.c
@@ -32,8 +32,8 @@ static bool enabled __read_mostly = IS_ENABLED(
 module_param_cb(enabled, &enabled_param_ops, NULL, 0600);
 MODULE_PARM_DESC(enabled, "Enable of disable DAMON_STAT");
 
-static unsigned long estimated_memory_bandwidth __read_mostly;
-module_param(estimated_memory_bandwidth, ulong, 0400);
+static u64 estimated_memory_bandwidth __read_mostly;
+module_param(estimated_memory_bandwidth, ullong, 0400);
 MODULE_PARM_DESC(estimated_memory_bandwidth,
 		"Estimated memory bandwidth usage in bytes per second");
 
@@ -55,15 +55,20 @@ static void damon_stat_set_estimated_memory_bandwidth(struct damon_ctx *c)
 {
 	struct damon_target *t;
 	struct damon_region *r;
-	unsigned long access_bytes = 0;
+	u64 access_bytes = 0;
+	u64 remainder, bytes_per_interval;
 
 	damon_for_each_target(t, c) {
 		damon_for_each_region(r, t)
-			access_bytes += (r->ar.end - r->ar.start) *
+			access_bytes += (u64)(r->ar.end - r->ar.start) *
 				r->nr_accesses;
 	}
-	estimated_memory_bandwidth = access_bytes * USEC_PER_MSEC *
-		MSEC_PER_SEC / c->attrs.aggr_interval;
+	bytes_per_interval = div64_u64_rem(access_bytes,
+			c->attrs.aggr_interval, &remainder);
+	estimated_memory_bandwidth =
+		bytes_per_interval * USEC_PER_MSEC * MSEC_PER_SEC +
+		div64_u64(remainder * USEC_PER_MSEC * MSEC_PER_SEC,
+				c->attrs.aggr_interval);
 }
 
 static int damon_stat_idletime(const struct damon_region *r)
-- 
2.47.3

