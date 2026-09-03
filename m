Received: from mta0.migadu.com (out-38.mta0.migadu.com [91.218.175.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D00E33936B
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 09:21:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.38
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788427315; cv=none; b=nu9tHzPQ2CUOZLz+vyglgSq1qOecHIP2xmRLrnoIi8kqmatqAx9eP8NE5GJRB+yj0TlY7IP6MfZR3v0eKw+mAMr/qk5ZoNqUhRim6ou+GCj8fVCx6lQCDvD8wiTYGlUzUhfSivpzAxVpIJZ3IUl3ovzkn4scfQRg40ocg7jT3u8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788427315; c=relaxed/simple;
	bh=NM7IygWzUo8F4bSYp/zmXdPd2UURJlijaDZmCMsb++U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QBFqhBNkRq9OGyRTdMueR8v5lyJI0ElL4PalVT5NiMJV5WVw4RoJrVwoypPle5m7LlhmSICdTQBSskgXrpn4p4hi8TMV6h55Gtg0/x7fryYoPT4D1v8u9KbF9NZBv62ZqnVep2eftsvRdRdf0po+Fgrz8B32HnE1/KIVvdxLV3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=sfbF8Dxx; arc=none smtp.client-ip=91.218.175.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="sfbF8Dxx"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=NM7IygWzUo8F4bSYp/zmXdPd2UURJlijaDZmCMsb++U=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788427312; v=1; x=1789032112;
 b=sfbF8DxxyZQEsudUSNGl6lzi1uIAdoa5WOEKQZsNN2C5J5fFbmNDFe/Y87CLE7B2zwutgx/a
 pd/2+INQzlw8uVZFL544aWK3R1HNHuSpVmC0EDqYKDbMinBjm914W2Q6MZC1IA5SloV1NXLzzHP
 OAMr0jGcBODqrE1VCpNk07qI=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 997dcd35b942ce68;
	Thu, 03 Sep 2026 09:21:41 +0000
X-Mizu-Trace-ID: 997dcd35b942ce68
X-Migadu-Flow: FLOW_OUT
From: Hongfu Li <hongfu.li@linux.dev>
To: akpm@linux-foundation.org,
	vbabka@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	brendan.jackman@linux.dev,
	hannes@cmpxchg.org,
	ziy@nvidia.com
Cc: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	hongfu.li@linux.dev,
	Hongfu Li <lihongfu@kylinos.cn>
Subject: [PATCH] mm/page_owner: preserve original free_pid/free_tgid during folio migration
Date: Thu,  3 Sep 2026 17:21:26 +0800
Message-ID: <20260903092126.24685-1-hongfu.li@linux.dev>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Hongfu Li <lihongfu@kylinos.cn>

__update_page_owner_free_handle() accepts pid and tgid, but ignores
them, always storing current->pid and current->tgid.

__folio_copy_owner() forwards the original free pid/tgid during folio
migration, yet these values were overwritten by the migrating task.

Store the passed-in pid/tgid so the migrated folio keeps the original
free attribution.

Signed-off-by: Hongfu Li <lihongfu@kylinos.cn>
---
 mm/page_owner.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/mm/page_owner.c b/mm/page_owner.c
index 3fc37d9b908e..cfc31c92d765 100644
--- a/mm/page_owner.c
+++ b/mm/page_owner.c
@@ -307,8 +307,8 @@ static inline void __update_page_owner_free_handle(struct page *page,
 			page_owner->free_handle = handle;
 		}
 		page_owner->free_ts_nsec = free_ts_nsec;
-		page_owner->free_pid = current->pid;
-		page_owner->free_tgid = current->tgid;
+		page_owner->free_pid = pid;
+		page_owner->free_tgid = tgid;
 	}
 	rcu_read_unlock();
 }
-- 
2.54.0

