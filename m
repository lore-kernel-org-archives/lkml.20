Received: from mta1.migadu.com (out-48.mta1.migadu.com [95.215.58.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB3383C37A2
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 08:30:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788510642; cv=none; b=rRXnC1Jo9qMrmrvi4t7NhfJKE9yh9IC8Dsh7HY+5DFuC9FbX7dIVEtpEDWZQBn136x10tDUv96azyH4yjpweqvHv7ZN9iexiXeStWbYiwhxSHTTxenVA9FdoF2Gw2pcQICLkb8EhcY6K0VgidgUEHhPG9TMn8+TRXRcbi3LoBoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788510642; c=relaxed/simple;
	bh=JamvyTb3oE6oY9RFFl9Xgqmjsm7Tu8R7P/y1cNok9Qc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=HI0QQYyLIHVZWqaZQTOvx0hv8qS71piDqsjvcHyOmIOQXL8UEFmrGmGQkhrWtG030NU1K58cWn3rYNoSjvVpz7gDseNDEEyJVVi3WzvuYCZbCPUlWniB0NUfnWw6frYAL/ZGYE/+Sf1usdfA7umLVwqoWMTsb+HNQ8Q+HbABMaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=SsjtsYTS; arc=none smtp.client-ip=95.215.58.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="SsjtsYTS"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=JamvyTb3oE6oY9RFFl9Xgqmjsm7Tu8R7P/y1cNok9Qc=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788510638; v=1; x=1789115438;
 b=SsjtsYTSVR5JEdUoweSC86iS4Oj6ynzXNNii7sFtAurZ3kW+vyytR3HWqB2May7cjfE/lRMB
 V1JTKNLve9p2WDhbFwSq/4tIseLOXzO34DHBNAtjVbXT0VJXNS32auLyvF8XVqTXQkbFSO615h9
 iPynoU9GbI3y/03p4SPktRGU=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id eb80e7cdd3dd87ca;
	Fri, 04 Sep 2026 08:30:38 +0000
X-Mizu-Trace-ID: eb80e7cdd3dd87ca
X-Migadu-Flow: FLOW_OUT
From: Ye Liu <ye.liu@linux.dev>
To: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>
Cc: Ye Liu <liuye@kylinos.cn>,
	Xu Xin <xu.xin16@zte.com.cn>,
	Chengming Zhou <chengming.zhou@linux.dev>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/8] mm/ksm: convert process iterator to for_each_process_rcu
Date: Fri,  4 Sep 2026 16:29:55 +0800
Message-Id: <20260904083001.553587-4-ye.liu@linux.dev>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260904083001.553587-1-ye.liu@linux.dev>
References: <20260904083001.553587-1-ye.liu@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ye Liu <liuye@kylinos.cn>

Replace the manual rcu_read_lock()/rcu_read_unlock() pair combined
with for_each_process() loop in mm/ksm.c with for_each_process_rcu().

No functional change.

Signed-off-by: Ye Liu <liuye@kylinos.cn>
---
 mm/ksm.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/mm/ksm.c b/mm/ksm.c
index 49d48d1e0998..fa5e4c47fb1b 100644
--- a/mm/ksm.c
+++ b/mm/ksm.c
@@ -3280,8 +3280,7 @@ void collect_procs_ksm(const struct folio *folio, const struct page *page,
 		struct anon_vma *av = rmap_item->anon_vma;
 
 		anon_vma_lock_read(av);
-		rcu_read_lock();
-		for_each_process(tsk) {
+		for_each_process_rcu(tsk) {
 			struct anon_vma_chain *vmac;
 			const unsigned long addr = rmap_item->address & PAGE_MASK;
 			const unsigned long index = rmap_item->linear_page_index;
@@ -3298,7 +3297,6 @@ void collect_procs_ksm(const struct folio *folio, const struct page *page,
 				}
 			}
 		}
-		rcu_read_unlock();
 		anon_vma_unlock_read(av);
 	}
 }
-- 
2.25.1

