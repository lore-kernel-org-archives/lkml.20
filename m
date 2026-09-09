Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7BCB46AA9F
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 10:25:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788949514; cv=none; b=nOLoheRDwtwNcePNnEuSKBKqOp1LCvwPW9YHk/G92fzY5dB61nCcW/+jl9eBX5kBxc1mJRjUlF5FZ8zTRgYo8qM9tbdv1uPIJIJOkY1lFEbQASbWpxMJ2dh45c3bp/P6W5s0JYfxdgSP1Jipnlk1bFBQ5xNdYCyIUMjWyoVYbQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788949514; c=relaxed/simple;
	bh=PA7/Pbx5AEThbU1dExwqFT9w9coLuAoGrR7Ue2+wOTE=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=ZcC/ejYr9sRHE+bFeDPFdvLVxtvgrbSanzbiFlv2WUn5OHAfLvujXrOGzTNi1RFB4qCCWQKk/jIooarbhQ9PWAQyyOQXX+zYIX9uVvxAcGc0LNAjk/dosLssoG283qpnYoRDFZ6QF2ezn5uJtIRJR+C5qVJ6PaCf7lhGH71SwoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=sMACMHU8; arc=none smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="sMACMHU8"
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-836c8bde2dcso37594507b3.0
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 03:25:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788949511; x=1789554311; darn=vger.kernel.org;
        h=content-type:mime-version:references:message-id:in-reply-to:subject
         :cc:to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tbn1aAX73v4jfLOAScY/xk2YxlfOe4UtWahA1Ug2y2k=;
        b=sMACMHU8bUBRcevNAt4rnxkr3JHUKboqxgklcBwQXRmJ4F65NgGz0OoXJ1+1SqoDup
         va3cGoWVD+QdFyHTN315iCwqEyTQMhvn08fWj1aZIOD+a7tAE+SuBkm9Na1vq8daGX0n
         BpltVo6dID4JgABrOfcolkDET2tDT6Oppk0J/PH9RZxLPddxlD9ARY+GODw/i/WgSpI3
         Rz3EaF4SPDHXEYV+Az/iF6Y5gppFgVWwQdH0hHhwz+pvdE4SkCSu+uI1Gixk7kgdALkq
         FmnLa3oRYEIYZEjQgxK5nhvRIqcoLDn98EBrxj4Z7tuxJPalZYBNbcFJmP6SOU0kLkuz
         gh9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788949511; x=1789554311;
        h=content-type:mime-version:references:message-id:in-reply-to:subject
         :cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tbn1aAX73v4jfLOAScY/xk2YxlfOe4UtWahA1Ug2y2k=;
        b=monsV3BCrEgnF5bAHmCoWKnZA0h9evF5nk5jqhk0WUpQE6bS9RJQNFT+K+/xifYzou
         asmj2B7v5ipiZhubtGcWGSyfDLVzneD1MJ7YbyPn0zzPFZfKzohHeIfTB58WG4+4NgMN
         f4/a+49KZd3zON4ZlQeX0aDjU52a7nYxMxi1GhW4U1CcOxKNv2tK2QQ9p3i3OIta2ANk
         jNmqQmf+meTmTpWpELWNzz0qO8OmMHBI5myvIgEBXt4vBdH8e/irJIa++ioI1Ih9gNUz
         MOq5xl7bfMgyxpSNjsH+BMM89Xpyt8KeYfJjvFQFy62Zq6T+nG3fs9Nkn9mpMLoTDUM5
         t/pg==
X-Forwarded-Encrypted: i=1; AKwUvBxdRFnqKgLHvq2oySwV07CUSKmED94q1YDduie60PeP/Ahl771hAvt1f/krMbcfKet6rj9fWL9QW92Y6Jk=@vger.kernel.org
X-Gm-Message-State: AFuF++lpQYC/+hTuIQ0haZsFHo0vYKYjRueDSMFwxYNFEx8eza4uL1gL
	aJvJmwteMrmYVpKuECjU+n/Jk8cFyPHHQdCTCrFgeqRhhcdN9I4XH4l92vxPcTKbvA==
X-Gm-Gg: AYBFou1hVoJ9FgeZne885h0ibyvLCnhWHIdO3FQBfqzx2/1JPfgATsoZLZ2Oa5qWbuT
	o1J4uEztMHRVl3iTsPHLQ6ISFeRzcfHBckwahcj3LnDrRVjDGQBddXjxfCKdDCUSCni5hTtMa2z
	bovJoxMhbhDkZ3czrj8secFi41GqCo+lg7M1MB3WQSKLkHaLgiH16hDIaPQJGWbcnDgJ6yoaYLe
	F5ELYwwcDcwAaL/cpW4/tHPWWzRC3pruool3+AI4fKI6VhmALS/6b7sY3JR4O48Yu+2jUKwJqUz
	dFsjbaFoVzNKFTmWx+/At/FjQfjJmpKJGQHAbWqiX9dGk8eUTg+uZJGzLpSlweNKJcywCmUtMGh
	ioDU5wn4as2RyXPdVwPRd2MzLrNN7LAkAZO6flWVfeQvnWqJUYJdROzupV5LBieOlcmF/4U/Xpl
	AEo/Yy/2u5ODLbS+CcIRQrGA6gQkRtAhBnXlFkegTF9/CrFSMshuXcueByuNLX0CTlk0fdKBQEI
	+mlUI0qmJh/02FMlnrDxgLh7VPFF0EqGUXjk16auc4Z64Hj6nORwjigaOxRoN0+qBxTEw==
X-Received: by 2002:a05:690c:62c4:b0:870:96e4:6716 with SMTP id 00721157ae682-87127b36981mr130530337b3.28.1788949510969;
        Wed, 09 Sep 2026 03:25:10 -0700 (PDT)
Received: from darker.attlocal.net (172-10-233-147.lightspeed.sntcca.sbcglobal.net. [172.10.233.147])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-87149315162sm107287417b3.12.2026.09.09.03.25.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 03:25:09 -0700 (PDT)
Date: Wed, 9 Sep 2026 03:25:05 -0700 (PDT)
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
Subject: [PATCH v2 21/26] block/fbatch: no lru_add_drain_all() in
 invalidate_bdev()
In-Reply-To: <e28f9a94-4339-f8ac-8301-6be3c9b5b7ce@google.com>
Message-ID: <0debd9f6-0ff8-31b0-4830-3a81ba56754a@google.com>
References: <e28f9a94-4339-f8ac-8301-6be3c9b5b7ce@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

invalidate_bdev() has no good reason to lru_add_drain_all(), now that the
per-cpu fbatch references are gone; but keep doing invalidate_bh_lrus().

Signed-off-by: Hugh Dickins <hughd@google.com>
---
 block/bdev.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/block/bdev.c b/block/bdev.c
index cd8323083740..853545b29b7f 100644
--- a/block/bdev.c
+++ b/block/bdev.c
@@ -97,7 +97,6 @@ void invalidate_bdev(struct block_device *bdev)
 
 	if (mapping->nrpages) {
 		invalidate_bh_lrus();
-		lru_add_drain_all();	/* make sure all lru add caches are flushed */
 		invalidate_mapping_pages(mapping, 0, -1);
 	}
 }
-- 
2.51.0

