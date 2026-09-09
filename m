Received: from mail-yx1-f46.google.com (mail-yx1-f46.google.com [74.125.224.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECF7251E452
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 10:27:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788949671; cv=none; b=gmoLiy3JUY+7GHzhi9Kdl3vR1HvcrUQcLP1UGVdpeg7UMQq+RhVJwQbf35vIUHYn78n4PGYBlXGrN7xj5gxDJdGi74jcayTjfbbFZ/Etg7ZcY577LIjWo59adjaXeFzBwP4obsHPl2MW/F+80W7tSy7Erx2glXwtSAQ1IT3eJHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788949671; c=relaxed/simple;
	bh=apGggQcJp2WV1URiHg8Asmh4iwaxGu1pF3vH60oXvTw=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=WH9r0/C9BhXMpy8MCOEHEcVoiyYvombOfJsg+Z+LoqbboCzmjVd6qyQjfkYkWfTjle+qAGfB4ZjtftSAfn1m4FMYMqE3SFrZt0Zayx5vy3q9UgdQaM6IWYmL2RteFhKqqweOaGFDIGJOCf6tiEd48k9RF9OKKwCp6LztSe83DNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=GxGDP+Z6; arc=none smtp.client-ip=74.125.224.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="GxGDP+Z6"
Received: by mail-yx1-f46.google.com with SMTP id 956f58d0204a3-66fb2fa79f2so4081594d50.0
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 03:27:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788949667; x=1789554467; darn=vger.kernel.org;
        h=content-type:mime-version:references:message-id:in-reply-to:subject
         :cc:to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0mZ5Gk4/1Pu5bK3S+WjW2BlP4j/qxWTHvLM7mSgUCfk=;
        b=GxGDP+Z6oWxTSLrBtRAZa+DEityV8+saaWCj3GSm6C/hkO9ldhEfZILDAbNdoqixva
         J6c3/yfN3eNLcBhTKVSm/yaIjiQDK5sH06oFIzpl1p4Y0mVY7WnZZDXRbJAXU8kgmYk9
         A86jXkrLjNjN1LhmOCmobsBWYi/oJ+prJgffhPv4HaVxTmB2IMeTef1ZfZgriVtyAywV
         pA974nCln5Fv0zd59QRdRhjQ3+Jw7i2HwnCcUIMyKfKwLKG98Yg3z9RRTinyEpzcCW+X
         FOuutXxJfgEEA4ZsOziq+sniLVIoimIma1ZCtnS+HrK5T5Im3FwHtWt7fl7fmKA1Ai1e
         PISg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788949667; x=1789554467;
        h=content-type:mime-version:references:message-id:in-reply-to:subject
         :cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0mZ5Gk4/1Pu5bK3S+WjW2BlP4j/qxWTHvLM7mSgUCfk=;
        b=mLlyZGSg0QwZfrJeFLlPceElskqXQ0nei73K78pj8D3CRdlweWXZHUS3hFgvybkI71
         PHb3I91aJfBeqQbu1G0uCVHzCOoRxenvQ62DDJbIfInvEJsPLDJyfd+JmFKR/qmzdNwf
         6dNT+/pE/t8yO4UKv0GBlXuV9oNhgwyd2Y+mGq2cpTYG8UBYaBLRNyUF3o0dxfeMqdVB
         N5qo0ws7QCYxpRzIAr3ZigT5XdYnGjPH6GpeBjOGSsamjFggYAMgVk5Y6bhbrzihgFhX
         9BJB6hLVyX1M4Qtys/gX37zRNjXdnyG0X41jzalF3WVx3LSn2X/PxTbykmRd8RXVdVQY
         phRg==
X-Forwarded-Encrypted: i=1; AKwUvBz71jGl7/2eG/KfMUoldfOG6taE9c44J/z2kBKGx+tEtWxXca5S24VRqT4cSnAat03FcTo4Huq/NxzHGLc=@vger.kernel.org
X-Gm-Message-State: AFuF++mMcCOkVvOIa2b1Bi380wHJo9G482tg8lLDf6WNdur9re2A5qIK
	173NvWg4L5CyqXqNPJd73TCmqJAu6x3ia/I5DNpdw5L8n6NwGE1y6eyfqdbpfSxJUA==
X-Gm-Gg: AYBFou0EJa9JF7qkTFXuBSvGOq+P2E0Po0g706MP9wG0v3H+TYkLpaMVGa/O7FqhEvi
	+suJ08iVQi7TnHqHOGef5+A7baVb35Y0twRc00ewRpCCkE7MEmbdtvwf9AhZGXsnsI5e6IzMGIz
	129IKu4FSnd+oNULv/WwyTzhUtERZc7acXUagY1jBwXyslZeLfhFdkgCfC+e0ciVryVaiwON7lz
	l1lOHWmvQ19pUTHPfQhhexYiGK57Gi75z336KP4zzDCVxQIjvQltFcj4/ji9EgZZZaXjQ3CrOzT
	9ehXlvV/PPErGV4R5aKm+p1YAtDTZ2MvnicS5SdqP6ZDPN33t2CyifG/rJRl3JmpBjDnTZwm7w3
	HMmkEJPDn76J61WzVK7iNewIVewgarQAHIzoI7V4psXcQ7/uLFGZ4UMZRwNAmH2ANNGXjPakWr+
	pBFubDA8XlEX2ElKPJQ8ZCw6FfIc7kRnchdD/REFKDMTFX1fxSDeEj0U1tvdTQKhKTJbpxsDOOi
	RTdK8VSayhnbOP3a4BFb4ShZwN9nIFZK5LggOUs5xgbQfAa3ZaICmAg5tGCNYJI5IG39Q==
X-Received: by 2002:a05:690e:48b:b0:66f:c1bc:4097 with SMTP id 956f58d0204a3-66fc1bc4874mr7597179d50.90.1788949666224;
        Wed, 09 Sep 2026 03:27:46 -0700 (PDT)
Received: from darker.attlocal.net (172-10-233-147.lightspeed.sntcca.sbcglobal.net. [172.10.233.147])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-670febedc44sm2584559d50.11.2026.09.09.03.27.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 03:27:45 -0700 (PDT)
Date: Wed, 9 Sep 2026 03:27:41 -0700 (PDT)
From: Hugh Dickins <hughd@google.com>
To: Andrew Morton <akpm@linux-foundation.org>
cc: Ackerley Tng <ackerleytng@google.com>, 
    Alexander Viro <viro@zeniv.linux.org.uk>, Alexandre Ghiti <alex@ghiti.fr>, 
    Baolin Wang <baolin.wang@linux.alibaba.com>, 
    Barry Song <baohua@kernel.org>, Binbin Wu <binbin.wu@linux.intel.com>, 
    Christian Brauner <brauner@kernel.org>, Christoph Hellwig <hch@lst.de>, 
    Christoph Lameter <cl@gentwo.org>, 
    Claudio Imbrenda <imbrenda@linux.ibm.com>, 
    David Hildenbrand <david@kernel.org>, JP Kobryn <jp.kobryn@linux.dev>, 
    Jan Kara <jack@suse.cz>, Jens Axboe <axboe@kernel.dk>, 
    Johannes Weiner <hannes@cmpxchg.org>, Kairui Song <ryncsn@gmail.com>, 
    Kiryl Shutsemau <kas@kernel.org>, Lance Yang <lance.yang@linux.dev>, 
    Leonardo Bras <leobras.c@gmail.com>, Lorenzo Stoakes <ljs@kernel.org>, 
    Marcelo Tosatti <mtosatti@redhat.com>, 
    Matthew Wilcox <willy@infradead.org>, 
    Mel Gorman <mgorman@techsingularity.net>, 
    Miaohe Lin <linmiaohe@huawei.com>, Michal Hocko <mhocko@suse.com>, 
    Minchan Kim <minchan@kernel.org>, Muchun Song <muchun.song@linux.dev>, 
    Oscar Salvador <osalvador@suse.de>, Peter Zijlstra <peterz@infradead.org>, 
    Qi Zheng <qi.zheng@linux.dev>, Rik van Riel <riel@surriel.com>, 
    Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
    Shakeel Butt <shakeel.butt@linux.dev>, 
    Suren Baghdasaryan <surenb@google.com>, 
    Vlastimil Babka <vbabka@kernel.org>, 
    Yang Shi <yang@os.amperecomputing.com>, Yu Zhao <yuzhao@google.com>, 
    Zach O'Keefe <zokeefe@google.com>, Zi Yan <ziy@nvidia.com>, 
    linux-block@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
    linux-kernel@vger.kernel.org, linux-mm@kvack.org
Subject: [PATCH v2 22/26] fs/fbatch: drop_caches invalidate_bh_lrus() not
 lru_add_drain_all()
In-Reply-To: <e28f9a94-4339-f8ac-8301-6be3c9b5b7ce@google.com>
Message-ID: <75e9b5b0-6a70-06df-ba0e-4d7bf841c0cf@google.com>
References: <e28f9a94-4339-f8ac-8301-6be3c9b5b7ce@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

drop_caches has no good reason to lru_add_drain_all(), now that the
per-cpu fbatch references are gone; but it may have good reason to
do the invalidate_bh_lrus() part of it.

Signed-off-by: Hugh Dickins <hughd@google.com>
---
 fs/drop_caches.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/drop_caches.c b/fs/drop_caches.c
index 49f56a598ecb..054af78e6a2e 100644
--- a/fs/drop_caches.c
+++ b/fs/drop_caches.c
@@ -10,7 +10,7 @@
 #include <linux/writeback.h>
 #include <linux/sysctl.h>
 #include <linux/gfp.h>
-#include <linux/swap.h>
+#include <linux/buffer_head.h>
 #include "internal.h"
 
 /* A global variable is a bit ugly, but it keeps the code simple */
@@ -60,7 +60,7 @@ static int drop_caches_sysctl_handler(const struct ctl_table *table, int write,
 		static int stfu;
 
 		if (sysctl_drop_caches & 1) {
-			lru_add_drain_all();
+			invalidate_bh_lrus();
 			iterate_supers(drop_pagecache_sb, NULL);
 			count_vm_event(DROP_PAGECACHE);
 		}
-- 
2.51.0

