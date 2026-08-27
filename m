Received: from mta0.migadu.com (out-20.mta0.migadu.com [91.218.175.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84AEF483BFF
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 16:40:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787848827; cv=none; b=c4AP6K0WpRo2tZ421a+ynYH9cvOfqxBY1TNhI0iakZkp1dGSGg/gTK2g7fOicCQVwmskGauC9vJDuvDU/7kZbk4AcQWUYZGUTjcSjSxqYrHtThk+VHbcsZJtCsor4QlBNyK6zkalguhn5cT5iJLchQvArI0BHKbBKd1GwxWD/B8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787848827; c=relaxed/simple;
	bh=dAqjXOjzhNh5omqUcK6UrCGKxTg0RuYnBXOWEvx4Koo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VM9bIbZBCW3ZfRqHliCYbU+4qOkmh+hZ65lAdeylhjZvy03tUYKEtxaKBCQ5NBM4iIZDwbTwGOQec7vXPcsJ+YrW4lA/Xn/vf3kxTguBtXeAKSRcUNtZ5LEaXfCfMjj1LayiPpvXoequU+x09pnmYd4SyX70Adu4bW4pxYGnwZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=D9cO/cc8; arc=none smtp.client-ip=91.218.175.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="D9cO/cc8"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=dAqjXOjzhNh5omqUcK6UrCGKxTg0RuYnBXOWEvx4Koo=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1787848823; v=1; x=1788453623;
 b=D9cO/cc87GrfKayfIvVFmC2FqaVsGcfdXAqDVy6omfcP/t83mSvqKmN1pmDR7Obbg3xKSqBi
 w1/CemCAyXZPjPw/yCkPNTt7QxbRUPKYQK3RDd0IdaIWWbA/8g4jF0C35UkmWFqhq81Pm5OX96b
 Gjdy2m/HI5aHL5H4UDBDkwV0=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id b5233e2837e3b3f5;
	Thu, 27 Aug 2026 16:40:09 +0000
X-Mizu-Trace-ID: b5233e2837e3b3f5
X-Migadu-Flow: FLOW_OUT
From: Zenghui Yu <zenghui.yu@linux.dev>
To: damon@lists.linux.dev,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Cc: sj@kernel.org,
	akpm@linux-foundation.org,
	"Zenghui Yu (Huawei)" <zenghui.yu@linux.dev>
Subject: [PATCH] mm/damon/core: remove declaration of kdamond_fn()
Date: Fri, 28 Aug 2026 00:39:53 +0800
Message-ID: <20260827163953.83520-1-zenghui.yu@linux.dev>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Zenghui Yu (Huawei)" <zenghui.yu@linux.dev>

It was added by commit 2224d8485492 ("mm: introduce Data Access MONitor
(DAMON)") but is actually not needed.  Remove it.

Signed-off-by: Zenghui Yu (Huawei) <zenghui.yu@linux.dev>
---
 mm/damon/core.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/mm/damon/core.c b/mm/damon/core.c
index 37d661e2bbc1..183080556404 100644
--- a/mm/damon/core.c
+++ b/mm/damon/core.c
@@ -1922,8 +1922,6 @@ static unsigned long damon_apply_min_nr_regions(struct damon_ctx *ctx)
 	return max_region_sz;
 }
 
-static int kdamond_fn(void *data);
-
 /*
  * __damon_start() - Starts monitoring with given context.
  * @ctx:	monitoring context
-- 
2.53.0

