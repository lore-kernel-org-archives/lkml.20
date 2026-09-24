Received: from mta1.migadu.com (out-22.mta1.migadu.com [95.215.58.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A10BE4B337D
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 19:11:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790277074; cv=none; b=jXVi8ahkOroSuMJzKNtnD0PwSYUKdHvb0qFqG/Rmfqd1bUV4STV23ARp7obZbKg7EHh30GIkoM/naXKOpHLOI+xhb+T8dZFDsFFkzvAwkx//iA3HCn6vPFGyW7bKHRjHHlqVwffC+kxfl9tCKRYx0Q0NkuwWlqqPaw0ow/KOwR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790277074; c=relaxed/simple;
	bh=aokq8/mgd5M7W02EfB3QkSeXjSOcvcPW/ytOsAssmRg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RbqRV/wYuxR5msfRpXFDvpSsL1NrVk6uoLAZhajemMetFg9vGMHOSLWuku8l6xU2VLzROPg5dGwus+B5Z4MbA1sKdeVvVqfPs099O6ufSr9Su1z6eUi20MKOBCvffVz5GRdLJZfAfnvQzll5ekRy1TybXeN7kzYO0h/xsRlGUnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=cv37usSj; arc=none smtp.client-ip=95.215.58.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="cv37usSj"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=aokq8/mgd5M7W02EfB3QkSeXjSOcvcPW/ytOsAssmRg=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790277070; v=1; x=1790881870;
 b=cv37usSjtQSsfCxoHjYH3pYe5JoWEB4Ku/EIhV7gbRNE2CpMd7YEITDzrLVD/gDnTJ05kwkn
 H/Rcgcz59N9opFoVJGm7XCJOxSzguO0q8bzDb/rS9GtU2rFKvgyMJLRS3Y+llnyPEJnPLXDh+Rq
 MyV8Fcrv9x32AsOvj/eKob1o=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta10.migadu.com with ESMTPS id 45bc5b5e94a1dbe1;
	Thu, 24 Sep 2026 19:11:10 +0000
X-Mizu-Trace-ID: 45bc5b5e94a1dbe1
X-Migadu-Flow: FLOW_OUT
From: Usama Arif <usama.arif@linux.dev>
To: Andrew Morton <akpm@linux-foundation.org>,
	axelrasmussen@google.com,
	baohua@kernel.org,
	baolin.wang@linux.alibaba.com,
	baoquan.he@linux.dev,
	david@kernel.org,
	kasong@tencent.com,
	liam@infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	ljs@kernel.org,
	mhocko@suse.com,
	qi.zheng@linux.dev,
	rppt@kernel.org,
	shakeel.butt@linux.dev,
	surenb@google.com,
	vbabka@kernel.org,
	weixugc@google.com,
	yuanchu@google.com,
	hannes@cmpxchg.org,
	kernel-team@meta.com
Cc: Usama Arif <usama.arif@linux.dev>
Subject: [PATCH] mm: remove the unused zone->unaccepted_cleanup
Date: Thu, 24 Sep 2026 12:11:03 -0700
Message-ID: <20260924191103.3475117-1-usama.arif@linux.dev>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit fefc07518227 ("mm/page_alloc: fix race condition in unaccepted
memory handling") removed the zones_with_unaccepted_pages static key and
the work that decremented it, but left the work_struct behind in struct
zone. Nothing uses it anymore, so let's remove it.

Signed-off-by: Usama Arif <usama.arif@linux.dev>
---
 include/linux/mmzone.h | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/include/linux/mmzone.h b/include/linux/mmzone.h
index 65e2e0249b04f..e9d3845d10554 100644
--- a/include/linux/mmzone.h
+++ b/include/linux/mmzone.h
@@ -1100,9 +1100,6 @@ struct zone {
 #ifdef CONFIG_UNACCEPTED_MEMORY
 	/* Pages to be accepted. All pages on the list are MAX_PAGE_ORDER */
 	struct list_head	unaccepted_pages;
-
-	/* To be called once the last page in the zone is accepted */
-	struct work_struct	unaccepted_cleanup;
 #endif
 
 	/* zone flags, see below */
-- 
2.53.0-Meta

